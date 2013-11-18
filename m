Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 20CF16D8C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:31:48 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id c14so5044537vea.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 07:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=LIGogcMydr2b5vYcEgO1nk3eOaywH78nxRne8UncXVA=;
	b=isn5G76zZMoVkdZGACIh7GIfnYhHCY/Q9f3w9+vlnTZr677KFNxr0FLEdeG6fccuPY
	DwwdJ1qY79Duo1YsKA31IQ/CfsfXdwNLwqhWo2yHVhsyWFDawWjz14wzp47i7NBSoKUl
	CTMgxExjSVSavi6hRGfyZR1Q5kRLNkJaXttPNuBuotnb4RBIfz2kOTH9kL0eZxacRcKa
	BOHY7fQaqU0W7c6csTkCxNMLKNZn/Q/ryA7g2G/uk3jEodD3ylpEBROVmiXnDsv6KP/x
	CP56+bKmFtTMWkc/RcTrGprbAK+eKnWTwr5B1OB96HsVbPcDb1YgyfwItsclZBE1QkEG
	pCIw==
X-Received: by 10.52.111.161 with SMTP id ij1mr1081459vdb.33.1384788709188;
	Mon, 18 Nov 2013 07:31:49 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.49.71 with HTTP; Mon, 18 Nov 2013 07:31:09 -0800 (PST)
In-Reply-To: <1384775852.6460.214.camel@ted>
References: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
	<52898177.5000303@windriver.com> <20131118114000.GB3727@jama>
	<1384775852.6460.214.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 18 Nov 2013 15:31:09 +0000
X-Google-Sender-Auth: 1VOo9MRQC88rKyBYsVdPcs2g3lA
Message-ID: <CANyK_8eR05HauKBOd3AoTMjibYBgZEhBSv5pN5Yt_+s2CavsNA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg dependencies and update-alternatives
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
X-List-Received-Date: Mon, 18 Nov 2013 15:31:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 November 2013 11:57, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-11-18 at 12:40 +0100, Martin Jansa wrote:
>>
>> FWIW: current u-a implementation provided by opkg is in OE-classic and
>> was in older poky/oe-core provided also in standalone recipe
>> update-alternatives-cworth
>>
>> http://git.openembedded.org/openembedded/tree/recipes/update-alternatives/update-alternatives-cworth_0.99.154.bb
>>
>> commit 44b538eedab7c255051fa3375f9f2439cd2db3dd
>> Author: Marcin Juszkiewicz <hrw@openedhand.com>
>> Date:   Wed Mar 19 15:36:01 2008 +0000
>>
>>     update-alternatives-cworth: dropped as they are now generated with opkg recipe
>
> Turning this back into a standalone recipe might be worthwhile and seems
> like the best way to address the problems.
>
> Paul: Have you any opinion of moving update-alternatives to its own
> repository separate from opkg? or just check it into OE-Core as its just
> a single script? Its not as if it really needs much from opkg at this
> point?

I'd be quite happy to break it out into a separate repo. I think
that's better than direct inclusion into oe-core so that it remains
easily usable by non-oe systems.

>
> I'm also wondering how it compares to the dpkg version (which is C
> iirc). Should we switch to that? Does it give better performance?
>

The dpkg version does have more features but the dpkg recipe in
oe-core says that it can't provide
"virtual/update-alternative-native". I think the reason there is that
it doesn't support installing to an offline target filesystem. I don't
know how the performance compares but I don't think it's critical as
it isn't a program that will be running very often on a target. The
opkg version is probably more lightweight as it is a short shell
script vs the 2,700 lines of C which make up the dpkg version.

There is also an "alternatives" program in chkconfig which is listed
as a possible provider of "virtual/update-alternatives" but again,
trying to use in causes a dependency loop. I haven't given this
version more than a quick glance though.

Personally I'd say the dpkg version looks the best as it allows a user
or script to query or change which alternative is selected whereas the
opkg version only allows alternatives to be installed or removed. It
would just need someone with the time to look into how it can be made
to install links to a target filesystem rather than to the host
filesystem. Unfortunately that isn't me at the moment.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

