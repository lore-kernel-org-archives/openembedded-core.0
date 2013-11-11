Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF1561957
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 11:28:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rABBSolx024113
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Nov 2013 03:28:50 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 11 Nov 2013 03:28:50 -0800
Message-ID: <5280BF75.2020609@windriver.com>
Date: Mon, 11 Nov 2013 19:28:53 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
	<5bcdd19de289a55e7cc28a1d0d4f09ea6ec4be41.1383974819.git.Qi.Chen@windriver.com>
	<1384037660.3798.42.camel@x121e.pbcl.net>
	<52803E72.9010505@windriver.com>
	<1384167211.16718.109.camel@phil-desktop.brightsign>
In-Reply-To: <1384167211.16718.109.camel@phil-desktop.brightsign>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] udev: fix dependency and location of udevadm
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
X-List-Received-Date: Mon, 11 Nov 2013 11:28:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2013 06:53 PM, Phil Blundell wrote:
> On Mon, 2013-11-11 at 10:18 +0800, ChenQi wrote:
>> On 11/10/2013 06:54 AM, Phil Blundell wrote:
>>> On Sat, 2013-11-09 at 13:28 +0800, Qi.Chen@windriver.com wrote:
>>>> +	install -d ${D}${base_bindir}
>>>> +	mv ${D}${bindir}/udevadm ${D}${base_bindir}/udevadm
>>>> +	rmdir ${D}${bindir}
>>> This will fail if ${bindir} and ${base_bindir} are the same.
>>>
>>> p.
>>>
>>>
>>>
>>>
>> In udev recipe, they are not defined as the same one.
> Those variables are part of the distro configuration.  Individual
> recipes don't, in general, set them.
>
>> And moving something from bindir to base_bindir doesn't seem uncommon in
>> OE, you can grep the project using the following command.
>>
>> grep -Ri 'mv.*bindir.*base_bindir' meta/*
> A better command to use would be:
>
> grep -C 4 -Ri 'mv.*bindir.*base_bindir' meta/*

Thanks for pointing it out :)

Currently I'm not sure whether we support configuring ${bindir} to equal 
to ${base_bindir}, but maybe we will support this such configuration in 
the future.
So I'll send out V2 of this patch.

Thanks,
Chen Qi

> which reveals that most of these "mv" commands are enclosed in a
> conditional that checks whether the two directories are indeed different
> before trying to move them.
>
> It's true that a few of the things in recipes-extended do appear to be
> broken.  cpio, for example, was broken by
> 6dee3050a4a0c4f3cc9fec23a0bc02155d680863; gzip was broken by
> e0626a0270fb0f4ff128e761c13d44162723434c; mktemp was broken by
> 4807d938023ce06f2924c8a0503c32d083be23b5.  All of these three patches
> seem to be well-intentioned attempts to improve the handling of
> update-alternatives and I guess those recipes are obscure enough that
> nobody has noticed before now that there is anything wrong with them.
>
> p.
>
>
>
>


