Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8776F71D31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:49:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBM2ncgI005337
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 21 Dec 2016 18:49:38 -0800
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 21 Dec 2016 18:49:37 -0800
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1482300982.git.liezhi.yang@windriver.com>
	<6efb8d002491cd1e736b9126e09a5a63b4acd4d1.1482300982.git.liezhi.yang@windriver.com>
	<CAJ86T=X_cPiiTWb_mdrcWre=XmAkB=kk7QE0kJ-SKu9Z1B1Fxw@mail.gmail.com>
	<67916363-806f-7f9e-e9e8-941bb2614cfb@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <6ed769b3-f938-1ce1-7f26-c51cb47a5d40@windriver.com>
Date: Thu, 22 Dec 2016 10:49:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <67916363-806f-7f9e-e9e8-941bb2614cfb@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] hdparm: 9.48 -> 9.50
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
X-List-Received-Date: Thu, 22 Dec 2016 02:49:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/22/2016 10:47 AM, Robert Yang wrote:
>
>
> On 12/21/2016 09:27 PM, Andre McCurdy wrote:
>> On Tue, Dec 20, 2016 at 10:17 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> Add 0001-Makefile-use-weak-assignment-for-LDFALGS.patch to fix issues like:
>>> ERROR: hdparm-9.50-r0 do_package: QA Issue: File '/sbin/hdparm.hdparm' from
>>> hdparm was already stripped, this will prevent future debugging!
>>> [already-stripped]
>>> ERROR: hdparm-9.50-r0 do_package: Fatal QA errors found, failing task.
>>
>> Passing LDFLAGS on the make command line might be a cleaner solution
>> than patching the Makefile.

To be clear, passing LDFLAGS on the make command line doesn't work.

// Robert

>
> We can't do that since there is a "-e MAKEFLAGS=" in EXTRA_OEMAKE, and its
> Makefile is:
>
> all:
>     make -j2 hdparm
>
> hdparm: hdparm.h sgio.h $(OBJS)
>     $(CC) $(LDFLAGS) -o hdparm $(OBJS)
>     $(STRIP) hdparm
>
> The "make -j2 hdparm" doesn't pass any env vars to sub make since MAKEFLAGS=,
> so that need use weak assignment "?=" here.
>
> // Robert
>
>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>  ...-Makefile-use-weak-assignment-for-LDFALGS.patch | 30 ++++++++++++++++++++++
>>>  .../hdparm/{hdparm_9.48.bb => hdparm_9.50.bb}      |  8 +++---
>>>  2 files changed, 35 insertions(+), 3 deletions(-)
>>>  create mode 100644
>>> meta/recipes-extended/hdparm/hdparm/0001-Makefile-use-weak-assignment-for-LDFALGS.patch
>>>
>>>  rename meta/recipes-extended/hdparm/{hdparm_9.48.bb => hdparm_9.50.bb} (80%)
>>>
>>> diff --git
>>> a/meta/recipes-extended/hdparm/hdparm/0001-Makefile-use-weak-assignment-for-LDFALGS.patch
>>> b/meta/recipes-extended/hdparm/hdparm/0001-Makefile-use-weak-assignment-for-LDFALGS.patch
>>>
>>> new file mode 100644
>>> index 00000000000..f74da5f18c9
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-extended/hdparm/hdparm/0001-Makefile-use-weak-assignment-for-LDFALGS.patch
>>>
>>> @@ -0,0 +1,30 @@
>>> +From 9532fbaade3b08cef936723a6a5adf191881edbf Mon Sep 17 00:00:00 2001
>>> +From: Robert Yang <liezhi.yang@windriver.com>
>>> +Date: Mon, 19 Dec 2016 22:36:16 -0800
>>> +Subject: [PATCH] Makefile: use weak assignment for LDFALGS
>>> +
>>> +So that it can use LDFLAGS from env vars.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> +---
>>> + Makefile | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/Makefile b/Makefile
>>> +index 05a1f78..60b67d9 100644
>>> +--- a/Makefile
>>> ++++ b/Makefile
>>> +@@ -15,7 +15,7 @@ STRIP ?= strip
>>> +
>>> + CFLAGS := -O2 -W -Wall -Wbad-function-cast -Wcast-align -Wpointer-arith
>>> -Wcast-qual -Wshadow -Wstrict-prototypes -Wmissing-prototypes
>>> -Wmissing-declarations -fkeep-inline-functions -Wwrite-strings
>>> -Waggregate-return -Wnested-externs -Wtrigraphs $(CFLAGS)
>>> +
>>> +-LDFLAGS = -s
>>> ++LDFLAGS ?= -s
>>> + #LDFLAGS = -s -static
>>> + INSTALL = install
>>> + INSTALL_DATA = $(INSTALL) -m 644
>>> +--
>>> +2.10.2
>>> +
>>

