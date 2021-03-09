Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.14056.1615315566456903174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 10:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 129Ik209027275
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 9 Mar 2021 12:46:04 -0600
Subject: Re: [OE-core] [PATCH 1/1] extrausers: Add ability to force password change on first login
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <20210308180836.144245-1-mark.hatle@kernel.crashing.org>
 <20210308180836.144245-2-mark.hatle@kernel.crashing.org>
 <7e9765f3-7786-fcb3-ef59-9315817213ec@windriver.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>
Message-ID: <6e0a5eaf-457f-027b-5908-01102d8ad807@kernel.crashing.org>
Date: Tue, 9 Mar 2021 12:46:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7e9765f3-7786-fcb3-ef59-9315817213ec@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/8/21 8:02 PM, Chen Qi wrote:
> Hi Mark,
> 
> Is it something similar to 'passwd-expire' in this extrausers.bbclass?

I wasn't aware of that evening existing.  Yes it looks like it does the same thing.

I can withdraw my change then, but we may want to considering adding something
to the documentation about security practices.  For accounts that are created by
the build system, it's best practices to either not make them able to be logged
in with (login locked out '-P *' on the adduser) or force the password to be
reset on next login (using passwd-expire).

--Mark

> Best Regards,
> Chen Qi
> 
> On 03/09/2021 02:08 AM, Mark Hatle wrote:
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
>> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>>  meta/classes/extrausers.bbclass | 29 +++++++++++++++++++++++++++--
>>  meta/conf/documentation.conf    |  1 +
>>  2 files changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
>> index 90811bfe2a..e9d9358bef 100644
>> --- a/meta/classes/extrausers.bbclass
>> +++ b/meta/classes/extrausers.bbclass
>> @@ -14,10 +14,10 @@
>>  
>>  inherit useradd_base
>>  
>> -PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
>> +PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS')) or bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}"
>>  
>>  # Image level user / group settings
>> -ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
>> +ROOTFS_POSTPROCESS_COMMAND_append = "${@['', ' set_user_group;'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
>>  
>>  # Image level user / group settings
>>  set_user_group () {
>> @@ -66,6 +66,31 @@ set_user_group () {
>>  	done
>>  }
>>  
>> +# Image level force a specific user/users to reset their password on first login
>> +# Note: this requires shadow passwords and login programs that respect the shadow
>> +# expiration field.
>> +ROOTFS_POSTPROCESS_COMMAND_append = "${@['', '
>> force_password_change;'][bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}"
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
>>  USERADDEXTENSION ?= ""
>>  
>>  inherit ${USERADDEXTENSION}
>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>> index c5a38b0764..d1c5b8b1a3 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -169,6 +169,7 @@ EXTRA_OESCONS[doc] = "When a recipe inherits the scons class, this variable spec
>>  EXTRA_QMAKEVARS_POST[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be after the .pro file list on the command line."
>>  EXTRA_QMAKEVARS_PRE[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be before the .pro file list on the command line."
>>  EXTRA_USERS_PARAMS[doc] = "When a recipe inherits the extrausers class, this variable provides image level user and group operations."
>> +EXTRA_FORCE_PASSWORD_CHANGE[doc] = "When a recipe inherits the extrausers class, this variable causes the specified users to require a password change on first login."
>>  
>>  #F
>>  
>>
>>
> 
> 
> 
> 
> 
