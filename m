Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B194A65E94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 02:57:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9V2vaGA000490
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Oct 2014 19:57:36 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 30 Oct 2014 19:57:36 -0700
Message-ID: <5452FB02.4040206@windriver.com>
Date: Fri, 31 Oct 2014 10:59:14 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1414659743.git.Qi.Chen@windriver.com>
	<33a3b945ec946aa6f0fba68afe7242c3cf8c0fc9.1414659743.git.Qi.Chen@windriver.com>
	<6DFFE445-39DB-47D1-97F2-04CA26866DEC@dominion.thruhere.net>
In-Reply-To: <6DFFE445-39DB-47D1-97F2-04CA26866DEC@dominion.thruhere.net>
X-Originating-IP: [128.224.162.187]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libpam: add system-auth in case of systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Oct 2014 02:57:41 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/2014 09:27 PM, Koen Kooi wrote:
>> Op 30 okt. 2014, om 10:08 heeft Chen Qi <Qi.Chen@windriver.com> het volgende geschreven:
>>
>> systemd needs this file to be there because one of its configuration file
>> in pam.d, systemd-user, requires it. Otherwise, we would have errors like
>> below.
>>
>>     systemd: PAM _pam_load_conf_file: unable to open /etc/pam.d/system-auth
> Isn't it the same as 'common-auth'? ISTR this is due to debian vs fedora naming of PAM stuff. I think it would make more sense to check what systemd actually wants and then see if a symlink to common-auth or patching systemd to use common-auth is the right answer instead of blindly adding system-auth.
>
> regards,
>
> Koen
>

Hi Koen,

An alternative is to patch systemd's source code to change the 
systemd-user configuration file.

In fact, I have seen patches in OE whose purpose is merely changing 
'system-auth' to 'common-auth' in the pam configuration files of the 
packages.

So we have two options here:
1. Provide system-auth
2. Patch packages that make use of system-auth and maintain those patches.

I think solution 1 is more reasonable but if you and other people in 
community think that solution 2 can bring us more benefits, I can send 
out a patch using solution 2.

Best Regards,
Chen Qi

>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>> meta/recipes-extended/pam/libpam/pam.d/system-auth | 12 ++++++++++++
>> meta/recipes-extended/pam/libpam_1.1.6.bb          |  1 +
>> 2 files changed, 13 insertions(+)
>> create mode 100644 meta/recipes-extended/pam/libpam/pam.d/system-auth
>>
>> diff --git a/meta/recipes-extended/pam/libpam/pam.d/system-auth b/meta/recipes-extended/pam/libpam/pam.d/system-auth
>> new file mode 100644
>> index 0000000..ffb08ab
>> --- /dev/null
>> +++ b/meta/recipes-extended/pam/libpam/pam.d/system-auth
>> @@ -0,0 +1,12 @@
>> +# This file comes from systemd.
>> +
>> +auth     sufficient pam_unix.so nullok try_first_pass
>> +
>> +account  required   pam_nologin.so
>> +account  sufficient pam_unix.so
>> +
>> +password sufficient pam_unix.so nullok sha512 shadow try_first_pass try_authtok
>> +
>> +-session optional   pam_loginuid.so
>> +-session optional   pam_systemd.so
>> +session  sufficient pam_unix.so
>> diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
>> index a84e51e..0910b6f 100644
>> --- a/meta/recipes-extended/pam/libpam_1.1.6.bb
>> +++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
>> @@ -17,6 +17,7 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
>>             file://pam.d/common-session \
>>             file://pam.d/common-session-noninteractive \
>>             file://pam.d/other \
>> +           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://pam.d/system-auth', '', d)} \
>>             file://libpam-xtests.patch \
>>             file://destdirfix.patch \
>>             file://fixsepbuild.patch \
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>


