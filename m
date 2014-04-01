Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id CBA4C60C22
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 12:35:31 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id ij19so9856518vcb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=kPzQSgiMw9wl6qb++PDU5zWaxRlpybQUdCvqFHjfcsM=;
	b=OO4CWGAQySPsbdCgILQo08m3KznBy23xW4OIkEpRA6QCf7DpbnGMsaj1fvHA4KuFhZ
	Kr7cmRDO+7PMyxmTwH7zUJNGzuH0/fQMWwcRCXP1vsl2TS8WmqjnZKDD9aml4ujnFKZW
	V29YiKMYKVgmZaUjzHBVfpubazy6+SK3DbIeK3xHoEvHYvkXdtfs5G1jy9XKAf7z5pyv
	ORE8nxZfMamS9/4tcVi/WHiJ28/Br11yAmaApVtvSbwLaXQ1QYUkvAQbJGUYbInaDYxl
	1lQFFZGjPBfqL7bEp7VFQlseMasigLZ7sdzBrgjV2abuu2XicESBmiwBW3kN6ku8Ce+9
	OVfA==
X-Received: by 10.220.249.6 with SMTP id mi6mr726982vcb.33.1396355731911; Tue,
	01 Apr 2014 05:35:31 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Tue, 1 Apr 2014 05:34:51 -0700 (PDT)
In-Reply-To: <1396355498.5879.31.camel@phil-desktop.brightsign>
References: <cover.1395816581.git.liezhi.yang@windriver.com>
	<7bb935ada71d07f3496a2ff8d2d73fe003e09a4f.1395816581.git.liezhi.yang@windriver.com>
	<CANyK_8dNLRkz68AzGTQhOCx_rX=rzJhAjiRfKbyzHjkA28=UQA@mail.gmail.com>
	<533A17B0.5080108@windriver.com>
	<CANyK_8cr88xbYcQTjf4hppA+nh-+3LNkwpPm7ynF+USLKo64ng@mail.gmail.com>
	<1396355498.5879.31.camel@phil-desktop.brightsign>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 1 Apr 2014 13:34:51 +0100
X-Google-Sender-Auth: 1m1F6OGj3dn5AD5NnhgbhdsGwCk
Message-ID: <CANyK_8dUrG9BQMCSwhB3v5dzF9PWmOWndyrsrMs+-zkiWo2sug@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
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
X-List-Received-Date: Tue, 01 Apr 2014 12:35:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 1 April 2014 13:31, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2014-04-01 at 12:41 +0100, Paul Barker wrote:
>> The more I look at it the more I don't like this patch. It's probably
>> a very rarely used code path but it could blow up if it's called. C
>> provides no guarantees that calling a 3-argument function with only 2
>> arguments will work. Depending on calling convention it could easily
>> result in stack corruption on some platforms.
>>
>> I'd suggest we try reverting the relevant bits of the upstream change
>> from qsort to
>> qsort_r: http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=c69bbca9c1f6645097bd20fe3a21f5a99a2a0698
>>
>> I think it should just be the first 3 patch hunks in that commit.
>
> It seems vanishingly unlikely that anybody is seriously going to try to
> use fdisk from util-linux-native to manipulate Sun partition tables and,
> that being the case, it's presumably going to be quite hard to test any
> such change.  Maybe we should just turn off support for these fringe
> partition table types altogether.
>

That may be a much, much easier fix.

I've reported this to the upstream mailing list anyway as there really
should be an autoconf check for qsort_r.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

