Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web08.1407.1615230692819500935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 11:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 128JBS0p010268
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 8 Mar 2021 13:11:29 -0600
Subject: Re: [OE-core] [PATCH 1/1] extrausers: Add ability to force password change on first login
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210308180836.144245-1-mark.hatle@kernel.crashing.org>
 <20210308180836.144245-2-mark.hatle@kernel.crashing.org>
 <5e4a3970-879f-5b8b-77d4-bd8b4ec7ed73@gmail.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <f299f5a0-9b27-dbf5-999a-fcb8c0040494@kernel.crashing.org>
Date: Mon, 8 Mar 2021 13:11:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5e4a3970-879f-5b8b-77d4-bd8b4ec7ed73@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/8/21 12:50 PM, Khem Raj wrote:
> 
> 
> On 3/8/21 10:08 AM, Mark Hatle wrote:
>> From: Mark Hatle <mark.hatle@xilinx.com>
>>
>> As documented in shadow(5), the third parameter is the last login time.  A
>> special value of '0' is defined which causes the password system to force
>> a password change on next login.
>>
>> Adding the variable "EXTRA_FORCE_PASSWORD_CHANGE", a space separated list of
>> user names, we can use this to adjust the shadow file's third value for the
>> listed users.
>>
>> Note: This does have the same dependencies as other usages of extrausers,
>> specifically base-passwd and shadow.
>>
> 
> I think it should check for r/w rootfs feature perhaps. unrelated to 

Is there a standard way to check for a r/w roots?  If there is, easy to add.

> this change but it seems it adds a dep on shadow disregarding DISTRO 
> policies where user might have chosen a different login managager, it 
> should perhaps warn about it.

The dep on shadow is the same as any extrauser call.  The dependency sets the
minimum login manager, but any login manager that supports proper shadow
password handling will work.  If it doesn't support shadow password handling
then nothing breaks -- it just won't do anything.  (Really nothing here that can
be enforced in this code block.)

util-linux login + pam for instance used to work.  (I've not tested it though in
a few years.)

--Mark

>> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>>   meta/classes/extrausers.bbclass | 29 +++++++++++++++++++++++++++--
>>   meta/conf/documentation.conf    |  1 +
>>   2 files changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
>> index 90811bfe2a..e9d9358bef 100644
>> --- a/meta/classes/extrausers.bbclass
>> +++ b/meta/classes/extrausers.bbclass
>> @@ -14,10 +14,10 @@
>>   
>>   inherit useradd_base
>>   
>> -PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
>> +PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS')) or bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}"
>>   
>>   # Image level user / group settings
>> -ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
>> +ROOTFS_POSTPROCESS_COMMAND_append = "${@['', ' set_user_group;'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
>>   
>>   # Image level user / group settings
>>   set_user_group () {
>> @@ -66,6 +66,31 @@ set_user_group () {
>>   	done
>>   }
>>   
>> +# Image level force a specific user/users to reset their password on first login
>> +# Note: this requires shadow passwords and login programs that respect the shadow
>> +# expiration field.
>> +ROOTFS_POSTPROCESS_COMMAND_append = "${@['', ' force_password_change;'][bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}"
>> +
>> +# Works by setting 'date of last password change' to 0, which has a special
>> +# meaning of 'user should change her password the next time she will log in the
>> +# system' See: shadow (5)
>> +force_password_change () {
>> +	if [ ! -e ${IMAGE_ROOTFS}/etc/shadow ]; then
>> +		bberror "/etc/shadow does not exist in the image, unable to set password change on login."
>> +		return
>> +	fi
>> +	passwd_change_users="${EXTRA_FORCE_PASSWORD_CHANGE}"
>> +	export PSEUDO="${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo"
>> +	for name in $passwd_change_users; do
>> +		if ! grep -q '^'$name':' ${IMAGE_ROOTFS}/etc/shadow ; then
>> +			bberror "Unable to find user $name in /etc/shadow, unable to set password change on login."
>> +		fi
>> +		bbnote "Set user $name to need a password change on first login."
>> +		cmd="sed -i ${IMAGE_ROOTFS}/etc/shadow -e 's,^'$name':\\([^:]*\\):[^:]*:,'$name':\\1:0:,'"
>> +		eval flock -x ${IMAGE_ROOTFS}${sysconfdir} -c \"$PSEUDO $cmd\" || true
>> +	done
>> +}
>> +
>>   USERADDEXTENSION ?= ""
>>   
>>   inherit ${USERADDEXTENSION}
>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>> index c5a38b0764..d1c5b8b1a3 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -169,6 +169,7 @@ EXTRA_OESCONS[doc] = "When a recipe inherits the scons class, this variable spec
>>   EXTRA_QMAKEVARS_POST[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be after the .pro file list on the command line."
>>   EXTRA_QMAKEVARS_PRE[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be before the .pro file list on the command line."
>>   EXTRA_USERS_PARAMS[doc] = "When a recipe inherits the extrausers class, this variable provides image level user and group operations."
>> +EXTRA_FORCE_PASSWORD_CHANGE[doc] = "When a recipe inherits the extrausers class, this variable causes the specified users to require a password change on first login."
>>   
>>   #F
>>   
>>
>>
>>
>>
>>
>>
>>
>> 
>>
