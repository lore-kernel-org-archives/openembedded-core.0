Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F41EC65EB1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 01:43:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s451hqcm027271
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 May 2014 18:43:53 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Sun, 4 May 2014 18:43:52 -0700
Message-ID: <5366ECD4.4090302@windriver.com>
Date: Mon, 5 May 2014 09:43:48 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1399195833-4364-1-git-send-email-ming.liu@windriver.com>
	<CAMKF1spF46XQKgQOkQ3TG7H-x=Zh+f9Kqo8jugy0L96T6qL8vQ@mail.gmail.com>
In-Reply-To: <CAMKF1spF46XQKgQOkQ3TG7H-x=Zh+f9Kqo8jugy0L96T6qL8vQ@mail.gmail.com>
X-Originating-IP: [128.224.163.186]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ldconfig-native: default to both lib and lib64 directories
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
X-List-Received-Date: Mon, 05 May 2014 01:44:04 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2014 09:00 AM, Khem Raj wrote:
> On Sun, May 4, 2014 at 2:30 AM, Ming Liu <ming.liu@windriver.com> wrote:
>> make ldconfig default to both /lib+/usr/lib and /lib64+/usr/lib64
>> on bi-ABI architectures.
> There is also lib32 and usr/lib32 version when you have mips. So this
> is half solution if you want to solve mutlilib
Thanks for the reminder, you are correct, it's not complete, I will send 
a V2.

//Ming Liu
>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   .../ldconfig-default-to-both-lib-and-lib64.patch   | 32 ++++++++++++++++++++++
>>   meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |  4 ++-
>>   2 files changed, 35 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-both-lib-and-lib64.patch
>>
>> diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-both-lib-and-lib64.patch b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-both-lib-and-lib64.patch
>> new file mode 100644
>> index 0000000..230502e
>> --- /dev/null
>> +++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-both-lib-and-lib64.patch
>> @@ -0,0 +1,32 @@
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +make ldconfig default to both /lib+/usr/lib and /lib64+/usr/lib64
>> +on bi-ABI architectures.
>> +
>> +---
>> + ldconfig.c |    5 +++++
>> + 1 file changed, 5 insertions(+)
>> +
>> +diff -urpN a/ldconfig.c b/ldconfig.c
>> +--- a/ldconfig.c
>> ++++ b/ldconfig.c
>> +@@ -52,7 +52,9 @@
>> +
>> + #define SYSCONFDIR "/etc"
>> + #define LIBDIR "/usr/lib"
>> ++#define LIBDIR64 "/usr/lib64"
>> + #define SLIBDIR "/lib"
>> ++#define SLIBDIR64 "/lib64"
>> + # define N_(msgid)  msgid
>> + #define _(msg) msg
>> +
>> +@@ -1373,6 +1375,9 @@ main (int argc, char **argv)
>> +       add_system_dir (SLIBDIR);
>> +       if (strcmp (SLIBDIR, LIBDIR))
>> +       add_system_dir (LIBDIR);
>> ++      add_system_dir (SLIBDIR64);
>> ++      if (strcmp (SLIBDIR64, LIBDIR64))
>> ++      add_system_dir (LIBDIR64);
>> +     }
>> +
>> +   const char *aux_cache_file = _PATH_LDCONFIG_AUX_CACHE;
>> diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
>> index d7bc444..69748a4 100644
>> --- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
>> +++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
>> @@ -10,7 +10,9 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
>>              file://32and64bit.patch \
>>              file://endian-ness_handling.patch \
>>              file://flag_fix.patch \
>> -           file://endianess-header.patch"
>> +           file://endianess-header.patch \
>> +           file://ldconfig-default-to-both-lib-and-lib64.patch \
>> +"
>>
>>   PR = "r2"
>>
>> --
>> 1.8.4.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


