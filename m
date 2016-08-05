Return-Path: <andrew@bradfordembedded.com>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 2A40076651
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 13:00:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 82653205FB;
	Fri,  5 Aug 2016 09:00:20 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute2.internal (MEProxy); Fri, 05 Aug 2016 09:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	bradfordembedded.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=1qSYHw2U5Xpzx7ZKnzjRzc1/3Dg=; b=YxffDL
	ZBG3WGh2VvcBxGbI/QCcfeKCiLUYCHA/L6fwhNg0M/ITlyHOwSulghZBVPlDd4rU
	/IIxdeiflfN4dnlMaZj11+2JrlROmS6kF2zGAVFddZJSdQ8PtqudnsaHMJLbdJAY
	ldHrW4XwqpmtT2bw3dZM28tzw6ex/wQNWmKDk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=1qSYHw2U5Xpzx7ZKnzjRzc1/3Dg=; b=uaFmm
	KPtbeR2RiC1I4H593KniOTDtShKZ+Icr/83qsk1JSHv/JN9PClHHwuXaon5nnLH/
	yQ0+P9sbBLC4YTr7CLbD/8jmxL2PSO6uIq4mh6GnFuTrZD0+gOupK6+41z9ydQ8M
	gVvDPPloOxYmojOLvH40ytdXIxl9ujTzwgLMvY=
X-Sasl-enc: EpjX4GnUppdbguDMLyyY9rqFOHXlx2q4qDpBR0UdAPb/ 1470402020
Received: from kaim-eeyore.kodakalaris.net (clr-vpn01.kodakalaris.com
	[198.140.222.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2690DF296F;
	Fri,  5 Aug 2016 09:00:20 -0400 (EDT)
Date: Fri, 5 Aug 2016 09:00:18 -0400
From: Andrew Bradford <andrew@bradfordembedded.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20160805130018.GD29547@kaim-eeyore.kodakalaris.net>
References: <alpine.LFD.2.20.1608050617280.13505@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1608050617280.13505@localhost.localdomain>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "parted" vs "sfdisk"
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
X-List-Received-Date: Fri, 05 Aug 2016 13:00:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Robert,

On 08/05 06:19, Robert P. J. Day wrote:
> 
>   your personal opinions, if you would -- i'm working on some scripts
> to do automated installs on a target board, currently based on
> parted, but parted seems a bit dense at times, and awkward, and i'm
> thinking of switching to sfdisk.
> 
>   for people who have done this sort of thing, do you have any strong
> opinions either way of parted versus sfdisk? i realize that's not much
> to go on, just curious about personal preferences, and why.

sfdisk has changed both its input format and command-line options in
recent versions of util-linux.  If you're scripting sfdisk, you need to
be aware of this as some of the people who use your scripts will have
varying versions of util-linux.  For example, in my experience,
util-linux 2.28 in Debian Stretch and util-linux 2.25.2 in Debian Jessie
cannot have their sfdisk executables scripted in the same way and then
produce the same set of partitions when setting up an SD card for an
embedded system.

The change in input format and command-line options happened around
util-linux 2.26-2.27 but I haven't dug into it too much to find out
exactly when.

The newer input format for sfdisk is quite nice, imho, and easy to read.
You can do something like this now:

{
echo "label: dos"
echo "start=1MiB size=32MiB type=0x0C bootable"
echo "start=33MiB"
} | sfdisk ${DEVICE}

While the older sfdisk input format would look something like:

{
echo 1,32,0x0C,*
echo 33,,,-
} | sfdisk ${DEVICE}

Thanks,
Andrew

