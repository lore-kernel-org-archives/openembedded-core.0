Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 50AF76E4CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 13:21:27 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id le5so9219357vcb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 05:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=39KhPnkhTU7I8uOGvR+MirTup2oF6mv4dwzoWDEKZ98=;
	b=TuN3cWM/hDXKH9vzzd6aXobjCjUhCQsiS8vJ6m3bPtftzfap0w4aUbWJAMdF8ozOVZ
	bjgmCu2giH0yb9QIMe0U1T7i9nZo5jLlFT2/hyUUIOyD5Jv8olRHKwosGqw7lt5NdR9+
	dA3Jo7ryBNjihxEm/rku1fj0Zkm7OzWws2b1oPax7eqbsnArjcPa8gYA193EeMFcHi4c
	3F7X+QUmNchJP4+UUWU0PGAdDNbLhOnYWr4kvEVXpeT5kDwnYXksZwIu+RH83mD6MNmG
	2Qq3W/p3McHxD5OLeEERBTBxktUsan/ycYNMa+oasgwAt8/reFZiGV4CSD72HofTP3Ib
	fXPQ==
X-Received: by 10.221.29.137 with SMTP id ry9mr5476372vcb.6.1392384088306;
	Fri, 14 Feb 2014 05:21:28 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Fri, 14 Feb 2014 05:20:48 -0800 (PST)
In-Reply-To: <CANyK_8cP8yn2f5ayjtWt_=sfckdRDqWjtdTdjMhWQOGJ4Fs+WA@mail.gmail.com>
References: <cover.1392215552.git.laurentiu.palcu@intel.com>
	<f1d4b1de74f2c69b444ed50977263245440ed071.1392215552.git.laurentiu.palcu@intel.com>
	<1392216272.14769.270.camel@phil-desktop.brightsign>
	<20140212145552.GF10078@lpalcu-linux>
	<1392217651.14769.271.camel@phil-desktop.brightsign>
	<20140212154001.GG10078@lpalcu-linux>
	<1392291528.14081.12.camel@ted>
	<CANyK_8cP8yn2f5ayjtWt_=sfckdRDqWjtdTdjMhWQOGJ4Fs+WA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 14 Feb 2014 13:20:48 +0000
X-Google-Sender-Auth: Wqj2Pr6lEspp61-4KB98PMic3Rw
Message-ID: <CANyK_8f48OYkGu2RFsECJnoLvxSWqLS9-gy+XnVX7hA27yatyQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] (image|rootfs_ipk).bbclass, rootfs.py: ipk multilib fixes
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
X-List-Received-Date: Fri, 14 Feb 2014 13:21:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 14 February 2014 13:15, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 13 February 2014 11:38, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2014-02-12 at 17:40 +0200, Laurentiu Palcu wrote:
>>> On Wed, Feb 12, 2014 at 03:07:31PM +0000, Phil Blundell wrote:
>>> > On Wed, 2014-02-12 at 16:55 +0200, Laurentiu Palcu wrote:
>>> > > * /usr/lib/opkg is where the alternatives go;
>>> >
>>> > Isn't that a bug?
>>> I'm far from being an expert in opkg or update-alternatives, but,
>>> looking in /usr/bin/update-alternatives I can see:
>>>
>>> # admin dir
>>> ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives"
>>>
>>> Isn't that expected since the u-a provider is opkg-utils recipe?
>>
>> Its certainly desirable to have one set of alternatives files on a
>> multilib system, not two. The variables/paths could probably do with
>> being better however I've prefer not to trigger autobuilder failures on
>> this until that gets resolved so I did take this.
>>
>> Cheers,
>>
>> Richard
>>
>
> I should add some flexibility here. The problem is opkg-utils doesn't
> know what value OPKGLIBDIR has in the opkg recipe. It also isn't
> processed by a configure script to replace variables as it was in the
> opkg recipe.
>

Actually, OPKGLIBDIR is set in two places:

meta/classes/package_ipk.bbclass:
    OPKGLIBDIR = "${localstatedir}/lib"

meta/recipes-devtools/opkg/opkg.inc:
    target_localstatedir := "${localstatedir}"
    OPKGLIBDIR = "${target_localstatedir}/lib"

Should this be cleaned up so it's just set once globally and then we
can substitute that variable into the update-alternatives script
again?

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

