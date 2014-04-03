Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE2DD6F4C4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 02:31:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s332VJ1f027655
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Apr 2014 19:31:20 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Apr 2014 19:31:19 -0700
Message-ID: <533CC7F5.3040702@windriver.com>
Date: Thu, 3 Apr 2014 10:31:17 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <cover.1395816581.git.liezhi.yang@windriver.com>
	<7bb935ada71d07f3496a2ff8d2d73fe003e09a4f.1395816581.git.liezhi.yang@windriver.com>
	<CANyK_8dNLRkz68AzGTQhOCx_rX=rzJhAjiRfKbyzHjkA28=UQA@mail.gmail.com>
	<533A17B0.5080108@windriver.com>
	<CANyK_8cr88xbYcQTjf4hppA+nh-+3LNkwpPm7ynF+USLKo64ng@mail.gmail.com>
	<1396355498.5879.31.camel@phil-desktop.brightsign>
	<CANyK_8dUrG9BQMCSwhB3v5dzF9PWmOWndyrsrMs+-zkiWo2sug@mail.gmail.com>
	<533AC392.1000604@windriver.com>
	<CANyK_8cJVwOJZR5Gox6HNr5tV-=kmhWBQkPFOcz-bsHpGHBR4w@mail.gmail.com>
In-Reply-To: <CANyK_8cJVwOJZR5Gox6HNr5tV-=kmhWBQkPFOcz-bsHpGHBR4w@mail.gmail.com>
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
X-List-Received-Date: Thu, 03 Apr 2014 02:31:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/03/2014 01:31 AM, Paul Barker wrote:
> On 1 April 2014 14:48, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>>
>> On 04/01/2014 08:34 PM, Paul Barker wrote:
>>>
>>> On 1 April 2014 13:31, Phil Blundell <pb@pbcl.net> wrote:
>>>>
>>>> On Tue, 2014-04-01 at 12:41 +0100, Paul Barker wrote:
>>>>>
>>>>> The more I look at it the more I don't like this patch. It's probably
>>>>> a very rarely used code path but it could blow up if it's called. C
>>>>> provides no guarantees that calling a 3-argument function with only 2
>>>>> arguments will work. Depending on calling convention it could easily
>>>>> result in stack corruption on some platforms.
>>>>>
>>>>> I'd suggest we try reverting the relevant bits of the upstream change
>>>>> from qsort to
>>>>> qsort_r:
>>>>> http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=c69bbca9c1f6645097bd20fe3a21f5a99a2a0698
>>>>>
>>>>> I think it should just be the first 3 patch hunks in that commit.
>>>>
>>>>
>>>> It seems vanishingly unlikely that anybody is seriously going to try to
>>>> use fdisk from util-linux-native to manipulate Sun partition tables and,
>>>> that being the case, it's presumably going to be quite hard to test any
>>>> such change.  Maybe we should just turn off support for these fringe
>>>> partition table types altogether.
>>>>
>>>
>>> That may be a much, much easier fix.
>>
>>
>> Thank you very much, I will send a patch later:-)
>>
>
> Sorry to confuse the matter further but it seems Khem has also made a
> fix for this which removes qsort_r in a more reliable way, along with
> removing a few other non-posix compliant bits:
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/musl&id=0e0d93d8d5fdcdc9cbcd9da2be1d0193a06d3188
>

Yes, it works, thanks.

// Robert


> I'm happy with that fix, could you let me know if it works for you Robert?
>

