Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6616084B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 01:34:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s311YgK8022079
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 18:34:42 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 31 Mar 2014 18:34:42 -0700
Message-ID: <533A17B0.5080108@windriver.com>
Date: Tue, 1 Apr 2014 09:34:40 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <cover.1395816581.git.liezhi.yang@windriver.com>
	<7bb935ada71d07f3496a2ff8d2d73fe003e09a4f.1395816581.git.liezhi.yang@windriver.com>
	<CANyK_8dNLRkz68AzGTQhOCx_rX=rzJhAjiRfKbyzHjkA28=UQA@mail.gmail.com>
In-Reply-To: <CANyK_8dNLRkz68AzGTQhOCx_rX=rzJhAjiRfKbyzHjkA28=UQA@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux-native: fix qsort_r for CentOS 5.10
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
X-List-Received-Date: Tue, 01 Apr 2014 01:34:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/01/2014 05:22 AM, Paul Barker wrote:
> On 26 March 2014 07:01, Robert Yang <liezhi.yang@windriver.com> wrote:
>> The qsort_r() was added to glibc in version 2.8, so there is no qsort_r() on
>> the host like CentOS 5.x, use qsort() to fix it since they are nearly
>> identical.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../util-linux/util-linux-native-qsort.patch       |   34 ++++++++++++++++++++
>>   meta/recipes-core/util-linux/util-linux_2.24.1.bb  |    4 ++-
>>   2 files changed, 37 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch b/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
>> new file mode 100644
>> index 0000000..1707683
>> --- /dev/null
>> +++ b/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
>> @@ -0,0 +1,34 @@
>> +From f220d809be1baa654503bf6ff52f3630b0d7015c Mon Sep 17 00:00:00 2001
>> +From: Robert Yang <liezhi.yang@windriver.com>
>> +Date: Wed, 26 Mar 2014 01:30:29 +0000
>> +Subject: [PATCH] sun.c: use qsort() to instead of qsort_r()
>> +
>> +qsort_r() was added to glibc in version 2.8, so there is no qsort_r() on
>> +the host like CentOS 5.x.
>> +
>> +Upstream-Status: Inappropriate [Other]
>> +
>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> +---
>> + libfdisk/src/sun.c | 5 ++---
>> + 1 file changed, 2 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/libfdisk/src/sun.c b/libfdisk/src/sun.c
>> +index e73c701..f7899ec 100644
>> +--- a/libfdisk/src/sun.c
>> ++++ b/libfdisk/src/sun.c
>> +@@ -427,9 +427,8 @@ static int sun_verify_disklabel(struct fdisk_context *cxt)
>> +         else
>> +             array[i] = -1;
>> +     }
>> +-    qsort_r(array,ARRAY_SIZE(array),sizeof(array[0]),
>> +-        (int (*)(const void *,const void *,void *)) verify_sun_cmp,
>> +-        verify_sun_starts);
>> ++    qsort(array,ARRAY_SIZE(array),sizeof(array[0]),
>> ++        (int (*)(const void *,const void *)) verify_sun_cmp);
>
> I've just been looking at this for building util-linux on top of musl
> (as musl-libc doesn't implement qsort_r)
> and my solution was to import a qsort_r implementation from ccl
> (https://ccl.googlecode.com/svn/trunk/qsort_r.c).
>

Maybe we can do it in YP 1.7.

> Are you sure this solution works? verify_sun_cmp takes 3 parameters
> not 2 and it uses the 3rd parameter (data). From reading this I'd
> imagine a segfault is likely to occur in verify_sun_cmp if qsort is
> used instead of qsort_r.
>

I think it works well since there is a similar patch before we upgrade
the util-linux-native, I will verify later.

// Robert


>> +
>> +     if (array[0] == -1) {
>> +       fdisk_info(cxt, _("No partitions defined."));
>> +--
>> +1.8.2.1
>> +
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.24.1.bb b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
>> index aa98b65..ab80ab6 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.24.1.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
>> @@ -4,7 +4,9 @@ require util-linux.inc
>>   # To support older hosts, we need to patch and/or revert
>>   # some upstream changes.  Only do this for native packages.
>>   OLDHOST = ""
>> -OLDHOST_class-native = "file://util-linux-native.patch"
>> +OLDHOST_class-native = "file://util-linux-native.patch \
>> +                        file://util-linux-native-qsort.patch \
>> +                       "
>>
>>   SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
>>               file://util-linux-ng-2.16-mount_lock_path.patch \
>> --
>> 1.7.10.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> Thanks,
>

