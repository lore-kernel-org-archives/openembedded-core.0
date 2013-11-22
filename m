Return-Path: <Qiang.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B8C2D6CEEA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 03:27:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAM3RA6B006321
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 19:27:10 -0800 (PST)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 21 Nov 2013 19:27:10 -0800
Message-ID: <528ECF0F.3030604@windriver.com>
Date: Fri, 22 Nov 2013 11:27:11 +0800
From: Qiang Chen <qiang.chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1385025291-14853-1-git-send-email-qiang.chen@windriver.com>
	<528E55C1.6030904@linux.intel.com>
In-Reply-To: <528E55C1.6030904@linux.intel.com>
X-Originating-IP: [128.224.162.198]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: remove reference to locale env files from su
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
X-List-Received-Date: Fri, 22 Nov 2013 03:27:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2013 02:49 AM, Saul Wold wrote:

> On 11/21/2013 01:14 AM, qiang.chen@windriver.com wrote:
>> From: Qiang Chen <qiang.chen@windriver.com>
>> The /etc/default/locale missing message appears when running su <user>
>> root@qemu0:/var/log# su root
>> root@qemu0:/var/log# tail auth.log
>> Oct  8 07:47:54 qemu0 login[983]: pam_unix(login:session): session opened for user root by LOGIN(uid=0)
>> Oct  8 07:47:55 qemu0 login[995]: ROOT LOGIN  on '/dev/console'
>> Oct  8 07:48:21 qemu0 su[999]: Successful su for root by root
>> Oct  8 07:48:21 qemu0 su[999]: + /dev/console root:root
>> Oct  8 07:48:21 qemu0 su[999]: pam_env(su:session): Unable to open env file: /etc/default/locale: No such file or directory
>> Oct  8 07:48:21 qemu0 su[999]: pam_unix(su:session): session opened for user root by root(uid=0)
>> This commit remove reference from pam.d/su to /etc/default/locale
>> env file to avoid the error messages.
>> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
>> ---
>>    meta/recipes-extended/shadow/files/pam.d/su |    3 ---
>>    meta/recipes-extended/shadow/shadow.inc     |    2 +-
>>    2 files changed, 1 insertion(+), 4 deletions(-)
>> diff --git a/meta/recipes-extended/shadow/files/pam.d/su b/meta/recipes-extended/shadow/files/pam.d/su
>> index 8e35137..8d590a3 100644
>> --- a/meta/recipes-extended/shadow/files/pam.d/su
>> +++ b/meta/recipes-extended/shadow/files/pam.d/su
>> @@ -34,9 +34,6 @@ auth       sufficient pam_rootok.so
>>    #
>>    # parsing /etc/environment needs "readenv=1"
>>    session       required   pam_env.so readenv=1
>> -# locale variables are also kept into /etc/default/locale in etch
>> -# reading this file *in addition to /etc/environment* does not hurt
>> -session       required   pam_env.so readenv=1 envfile=/etc/default/locale
> Should we be providing an empty locale file instead, what happens if
> someone wants to use the locale mechanism?

Hi Sau,

Thanks for your comments !

I didn't see much sense providing an empty/faked locale file there, as we
didn't provide a update-locale command tool either.

Meanwhile, RHEL, fedora didn't require an env file to /etc/default/locale
too. If someone really cares the env for locale related, they just need
specify their envfile instead our faked env file.
  

>>    # Defines the MAIL environment variable
>>    # However, userdel also needs MAIL_DIR and MAIL_FILE variables
>> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
>> index 5ab978a..572c3bc 100644
>> --- a/meta/recipes-extended/shadow/shadow.inc
>> +++ b/meta/recipes-extended/shadow/shadow.inc
>> @@ -44,7 +44,7 @@ SRC_URI_append_class-nativesdk = " \
>>    SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
>>    SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
>> -PR = "r13"
>> +PR = "r14"
> No more PR bumps please.

OK. I will send V2 patch dropping PR bumps and remove login reference to
/etc/default/locale too.


Thanks !
Qiang

> Sau!
>>    # Additional Policy files for PAM
>>    PAM_SRC_URI = "file://pam.d/chfn \
>

