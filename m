Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 978C16E4CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 13:15:40 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id cz12so9931736veb.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 05:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=VWxBiXdSbReOnUA13EGcERdOjncj10vCWSBeJKauwtg=;
	b=EQNwXn+tT9ZmgfDPjCyoi73Va74Fk0mO6ozdQamzP1Msp8SvIwuRfBD5Tlzhl4Scjr
	Cx6jiAD+uglOdqPMdXFR3CfFbNRP2wF/IKkjqckk2xg3yeZSUNQbC7JZ3M4Px8GlFMP8
	r+wtQ7K+KpIrHAxOlOA4s5PFxMKzEG0X9ITsmZsNISaGi6gtHjEYBqj7+8gVqdRbymHb
	TAevjhM7A9zuSpOZKSoz8hqVYdRms/Y06zY7CsAMzUmDN+RPrraGfg0sSUXp2hJ7GR5y
	D6NICKrWuFkEPEy3jygMrpmaaLOUwHpJYUNbUn3G99NLP7oUU+2N8lVgagCRMJ5MFNRz
	Eikw==
X-Received: by 10.52.248.138 with SMTP id ym10mr4580706vdc.18.1392383740806;
	Fri, 14 Feb 2014 05:15:40 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Fri, 14 Feb 2014 05:15:00 -0800 (PST)
In-Reply-To: <1392291528.14081.12.camel@ted>
References: <cover.1392215552.git.laurentiu.palcu@intel.com>
	<f1d4b1de74f2c69b444ed50977263245440ed071.1392215552.git.laurentiu.palcu@intel.com>
	<1392216272.14769.270.camel@phil-desktop.brightsign>
	<20140212145552.GF10078@lpalcu-linux>
	<1392217651.14769.271.camel@phil-desktop.brightsign>
	<20140212154001.GG10078@lpalcu-linux>
	<1392291528.14081.12.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 14 Feb 2014 13:15:00 +0000
X-Google-Sender-Auth: _MIopYtF5x68L5Ef1KEQd4qMbAo
Message-ID: <CANyK_8cP8yn2f5ayjtWt_=sfckdRDqWjtdTdjMhWQOGJ4Fs+WA@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Feb 2014 13:15:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 13 February 2014 11:38, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2014-02-12 at 17:40 +0200, Laurentiu Palcu wrote:
>> On Wed, Feb 12, 2014 at 03:07:31PM +0000, Phil Blundell wrote:
>> > On Wed, 2014-02-12 at 16:55 +0200, Laurentiu Palcu wrote:
>> > > * /usr/lib/opkg is where the alternatives go;
>> >
>> > Isn't that a bug?
>> I'm far from being an expert in opkg or update-alternatives, but,
>> looking in /usr/bin/update-alternatives I can see:
>>
>> # admin dir
>> ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives"
>>
>> Isn't that expected since the u-a provider is opkg-utils recipe?
>
> Its certainly desirable to have one set of alternatives files on a
> multilib system, not two. The variables/paths could probably do with
> being better however I've prefer not to trigger autobuilder failures on
> this until that gets resolved so I did take this.
>
> Cheers,
>
> Richard
>

I should add some flexibility here. The problem is opkg-utils doesn't
know what value OPKGLIBDIR has in the opkg recipe. It also isn't
processed by a configure script to replace variables as it was in the
opkg recipe.

I'll have a think about a cleaner upgrade path for opkg and
opkg-utils. I'd like to  have a postinstall script compare the old and
new OPKGLIBDIR paths and move data if needed. That would let me move
everything from /usr/lib to /var/lib.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

