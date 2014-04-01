Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB5F6B7D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 11:41:39 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id ld13so9561741vcb.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=/X2YOo2uibHzgDBZXQrcbVB1LOIrlfQBCDU0MBwAtxc=;
	b=KW0EPA49Lq6qDmp2qx6gn7AjEWwiyUm/I+xIvzsdB/MgwsMCWYeF6iwQBPEtaOcW23
	q5Pod9a7CVBLXGC2HTfQG6NXL+FakAwWapADo365KeFZg9rM1CFEM07W3g3av96MLLnp
	nr0LPoO24ghvam2nMRZpjUirGS4LWo93FJr2wWknwpYAJ89T6z1QlVdfhUtaxNypWUbt
	yoZAbK0ad9MAbD9Ea5/k4WdHdOc8tW0Kd4SIwlmZHs+Uf2jSW9qLvchzat8gdjuFDm2g
	0iLpltC2YG0/t6o54mP4Ccffaz+1HNjO93xN3FmMIqH+hnJZqGEKqeS5R10jdEB7bbzh
	BEBA==
X-Received: by 10.221.4.66 with SMTP id ob2mr885522vcb.28.1396352500158; Tue,
	01 Apr 2014 04:41:40 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Tue, 1 Apr 2014 04:41:00 -0700 (PDT)
In-Reply-To: <533A17B0.5080108@windriver.com>
References: <cover.1395816581.git.liezhi.yang@windriver.com>
	<7bb935ada71d07f3496a2ff8d2d73fe003e09a4f.1395816581.git.liezhi.yang@windriver.com>
	<CANyK_8dNLRkz68AzGTQhOCx_rX=rzJhAjiRfKbyzHjkA28=UQA@mail.gmail.com>
	<533A17B0.5080108@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 1 Apr 2014 12:41:00 +0100
X-Google-Sender-Auth: TI5YYL_MShClmXy1WJkSl1CN8Vk
Message-ID: <CANyK_8cr88xbYcQTjf4hppA+nh-+3LNkwpPm7ynF+USLKo64ng@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
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
X-List-Received-Date: Tue, 01 Apr 2014 11:41:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 1 April 2014 02:34, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 04/01/2014 05:22 AM, Paul Barker wrote:
>>
>> On 26 March 2014 07:01, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>
>>> The qsort_r() was added to glibc in version 2.8, so there is no qsort_r()
>>> on
>>> the host like CentOS 5.x, use qsort() to fix it since they are nearly
>>> identical.
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   .../util-linux/util-linux-native-qsort.patch       |   34
>>> ++++++++++++++++++++
>>>   meta/recipes-core/util-linux/util-linux_2.24.1.bb  |    4 ++-
>>>   2 files changed, 37 insertions(+), 1 deletion(-)
>>>   create mode 100644
>>> meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
>>>
>>> diff --git
>>> a/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
>>> b/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
>>> new file mode 100644
>>> index 0000000..1707683
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
>>> @@ -0,0 +1,34 @@
>>> +From f220d809be1baa654503bf6ff52f3630b0d7015c Mon Sep 17 00:00:00 2001
>>> +From: Robert Yang <liezhi.yang@windriver.com>
>>> +Date: Wed, 26 Mar 2014 01:30:29 +0000
>>> +Subject: [PATCH] sun.c: use qsort() to instead of qsort_r()
>>> +
>>> +qsort_r() was added to glibc in version 2.8, so there is no qsort_r() on
>>> +the host like CentOS 5.x.
>>> +
>>> +Upstream-Status: Inappropriate [Other]
>>> +
>>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> +---
>>> + libfdisk/src/sun.c | 5 ++---
>>> + 1 file changed, 2 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/libfdisk/src/sun.c b/libfdisk/src/sun.c
>>> +index e73c701..f7899ec 100644
>>> +--- a/libfdisk/src/sun.c
>>> ++++ b/libfdisk/src/sun.c
>>> +@@ -427,9 +427,8 @@ static int sun_verify_disklabel(struct fdisk_context
>>> *cxt)
>>> +         else
>>> +             array[i] = -1;
>>> +     }
>>> +-    qsort_r(array,ARRAY_SIZE(array),sizeof(array[0]),
>>> +-        (int (*)(const void *,const void *,void *)) verify_sun_cmp,
>>> +-        verify_sun_starts);
>>> ++    qsort(array,ARRAY_SIZE(array),sizeof(array[0]),
>>> ++        (int (*)(const void *,const void *)) verify_sun_cmp);
>>
>>
>> I've just been looking at this for building util-linux on top of musl
>> (as musl-libc doesn't implement qsort_r)
>> and my solution was to import a qsort_r implementation from ccl
>> (https://ccl.googlecode.com/svn/trunk/qsort_r.c).
>>
>
> Maybe we can do it in YP 1.7.
>
>
>> Are you sure this solution works? verify_sun_cmp takes 3 parameters
>> not 2 and it uses the 3rd parameter (data). From reading this I'd
>> imagine a segfault is likely to occur in verify_sun_cmp if qsort is
>> used instead of qsort_r.
>>
>
> I think it works well since there is a similar patch before we upgrade
> the util-linux-native, I will verify later.
>

The more I look at it the more I don't like this patch. It's probably
a very rarely used code path but it could blow up if it's called. C
provides no guarantees that calling a 3-argument function with only 2
arguments will work. Depending on calling convention it could easily
result in stack corruption on some platforms.

I'd suggest we try reverting the relevant bits of the upstream change
from qsort to
qsort_r: http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=c69bbca9c1f6645097bd20fe3a21f5a99a2a0698

I think it should just be the first 3 patch hunks in that commit.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

