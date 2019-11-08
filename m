Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 73FE47FC9C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 20:24:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 478sFQ0Qdfz6L;
	Fri,  8 Nov 2019 21:24:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573244683;
	bh=hsJsndk+gEeRe0E+7W+LwXZL9KJbhX+548/9BGKPfHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwKGxNgwZNDEIRNHf9+wibmGn4JYsV41j1n2Yj8vQIqhYSJDCBb6q6xqUXObdZar0
	fnEZrwxwUCapbVr3ndrDwbxEXPacMox7aAE8U0bM8gvE7mvYurMuC/NcZS4D3VCmqT
	X3uhLlXeMVkyWxYvy2Km2HYHLA4vb6hCxCBkyIgVq9Tm6EmchVW/rgHkw2ggzKmA0N
	WojD9wd3CaE0NDAFKCz4+XHbjWrraBehO2v6bLrsc/rVlfR1hLen1IGJV5/XZxTN5k
	6wsmrP2XdFXyhKy6mGlu5STD48SJ4ihy279p91Ox5FahTvVKsvG0s1ZwNbETmaVo4R
	BWc3E92JGCuj3Lpd3SG0nqkFynyblODQcw5oE8IoZSGXv+vtRSVtEMr3wyRHhcQmaT
	7L/SwXVPaCPR5s9DTa1pKtvjDXA/YQISHPl6JrTWhCEcBdWDOfe6LpbJ8mpJFl4p5a
	qh20N9YgBIl5KvjdmlM1P0Yx+EAPdGxTocdDZUq6V6agA1/7w3l2m6mvP9+B2H/cyX
	CUWYu+2+r0uBTTu+2hLGAB2muelC56Mqoqrai9SAYMqkDvXXrNx0ymYFY67/+Jc8w2
	FLHg27ChtYFCjPp0D4pTlK/4zpYGVAsyF/YfgrCRjf/cZ6o5IleoWm6/idActjGl3Z
	DPCOfg+KOgk2JNxpimSj69RA=
Date: Fri, 8 Nov 2019 22:24:38 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20191108202438.GA21138@localhost>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
	<CA+aJhH3s7NhB-4YspmXrvrcG4py1=i2fJXg=seWPkJzosqVFGQ@mail.gmail.com>
	<CAKmqyKNVrqT9hHQxp38=72bBkz405P=6UJFPODxr5OLt_GSqDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNVrqT9hHQxp38=72bBkz405P=6UJFPODxr5OLt_GSqDA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Fri, 08 Nov 2019 20:24:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 07, 2019 at 04:39:22PM -0800, Alistair Francis wrote:
> On Wed, Nov 6, 2019 at 11:33 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
> >
> > On Thu, 7 Nov 2019 at 09:34, Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Wed, Nov 06, 2019 at 10:18:18AM -0800, Alistair Francis wrote:
> > > >...
> > > > +TUNE_CCARGS_riscv64 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv64-f', ' -mabi=lp64d', ' -mabi=lp64', d)}"
> > > > +TUNE_CCARGS_riscv32 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv32-f', ' -mabi=ilp32f', ' -mabi=ilp32', d)}"
> > > >...
> > >
> > > That looks wrong, what would you put in TUNE_FEATURES
> > > for -mabi=lp64f when -mabi=lp64d is called riscv64-f?
> > >
> > > Also note that this is only the floating point calling convention,
> > > whether the compiler emits floating point instructions is defined
> > > by -march.
> > >
> > > It would be good if this would start with a plan how to handle
> > > all possible combination of RISC-V ISA extensions, ideally better
> > > than the arm mess.
> >
> > I am keen to see this as well, since I am currently directly
> > hardcoding -march/-mabi in the machine conf.
> >
> > It would be nice to see the ISA tunes available in oe-core, even if
> > that is just the tune features and not predefined tunes (e.g. like
> > microblaze).
> 
> I think this idea as well. Some generic way of generating tunes from
> ISA stings would be great!
> 
> Does anyone have any ideas on the best way to do this?

Especially when looking at the arm64 situation I am wondering whether 
the best option might be to throw away the tunes mess and let the user 
write the compiler options directly.

If OE needs information about a specific feature, it would be easier to 
ask the compiler[1] than duplicating all the target knowledge.

> Alistair

cu
Adrian

[1] $CC -dM -E - < /dev/null

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


