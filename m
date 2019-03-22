Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 427886C111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:49:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2M3nMmg018637
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Mar 2019 20:49:23 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 21 Mar 2019 20:49:22 -0700
To: Khem Raj <raj.khem@gmail.com>, Adrian Bunk <bunk@stusta.de>
References: <1552383718-62708-1-git-send-email-changqing.li@windriver.com>
	<20190315104552.GB14180@localhost>
	<CAMKF1spft7gbJ983GtbyVtjXO5hECMuTqg6TM1bV2ozu0Np_CQ@mail.gmail.com>
	<20190320052115.GA25499@localhost>
	<CAMKF1soQbssBdHEgmdGmeNFPWWQH+FdRbdzBuPDo_TOdnY0oRA@mail.gmail.com>
	<20190320150021.GB31018@localhost>
	<CAMKF1sqFpCwy6vYqBdEuMi2dxUU32_DD3XbGt4t-VXoU6x_qYA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <a91f9fde-b569-f96a-bee9-2aff7cc708f5@windriver.com>
Date: Fri, 22 Mar 2019 11:49:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqFpCwy6vYqBdEuMi2dxUU32_DD3XbGt4t-VXoU6x_qYA@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mdadm: fix gcc8 maybe-uninitialized/format-overflow warning
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
X-List-Received-Date: Fri, 22 Mar 2019 03:49:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 3/21/19 1:06 AM, Khem Raj wrote:
> On Wed, Mar 20, 2019 at 11:00 AM Adrian Bunk <bunk@stusta.de> wrote:
>> On Wed, Mar 20, 2019 at 08:59:39AM -0400, Khem Raj wrote:
>>> On Wed, Mar 20, 2019 at 1:21 AM Adrian Bunk <bunk@stusta.de> wrote:
>>>> On Tue, Mar 19, 2019 at 11:51:47PM -0400, Khem Raj wrote:
>>>>> On Fri, Mar 15, 2019 at 6:45 AM Adrian Bunk <bunk@stusta.de> wrote:
>>>>>> On Tue, Mar 12, 2019 at 05:41:58PM +0800, changqing.li@windriver.com wrote:
>>>>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>>>>
>>>>>>> while compiled with -Werror=maybe-uninitialized/-Werror=format-overflow=,
>>>>>>> it failed
>>>>>>>
>>>>>>> [snip]
>>>>>>> | Incremental.c: In function 'Incremental_container':
>>>>>>> | Incremental.c:1593:3: error: 'mdfd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>> | close(mdfd);
>>>>>>> | ^~~~~~~~~~~
>>>>>>>
>>>>>>> [snip]
>>>>>>> super-intel.c: In function 'apply_takeover_update':
>>>>>>> | super-intel.c:9615:15: error: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Werror=format-overflow=]
>>>>>>> | " MISSING_%d", du->index);
>>>>>>> | ^~
>>>>>>> ...
>>>>>> I am seeing these warnings only with -Og, are you also seeing them with
>>>>>> -Og (DEBUG_OPTIMIZATION) only?
yes.
>>>>>>
>>>>>> If this is true, I would consider
>>>>>> https://sources.debian.org/src/mdadm/4.1-2/debian/patches/debian-no-Werror.diff/
>>>>>> a better workaround.
>>>>>>
>>>>> This seems a broader brush, I really dont like to relegate Werror if
>>>>> we dont have to, because it will force us
>>>>> to fix the code.
>>>> How are we getting such fixes properly reviewed?
>>>>
>>>> What actually happens is that the easiest change that silences a warning
>>>> gets applied.
>>>>
>>>> And for such bogus -Og only warnings there was no problem in the code,
>>> so then probably a better fix is to add -Wno-error to DEBUG_FLAGS
>>> which will limit it to -Og case, and revert the original fix.

Both DEBUG_OPTIMIZATION and FULL_OPTIMIZATION appended DEBUG_FLAGS.

in order limit it to -Og case,  I will add  -Wno-error to 
DEBUG_OPTIMIZATION, and send a v2.


[snip]

FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"

DEBUG_OPTIMIZATION = "-Og ${DEBUG_FLAGS} -pipe"

SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 
'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"




>> For mdadm this might work, for puzzles it would not.
>>
>> Order matters, and upstream can insert your flags before or after
>> the -Werror. So unfortunately this would not cover all recipes.
>>
> suggestion was not global, but just for this recipe. I still would
> suggest that we disable it only where needed
>
>> cu
>> Adrian
>>
>> --
>>
>>         "Is there not promise of rain?" Ling Tan asked suddenly out
>>          of the darkness. There had been need of rain for many days.
>>         "Only a promise," Lao Er said.
>>                                         Pearl S. Buck - Dragon Seed
>>
-- 
BRs

Sandy(Li Changqing)


