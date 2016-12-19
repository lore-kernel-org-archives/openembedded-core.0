Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 799087316D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 10:40:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u144so17791756wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 02:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qEDA2dIUqrF4ozShAKN2aGbGEuzeMggZ1IV8ydt940g=;
	b=gCM7sVG9tX9F0E7GXY8510q5RjLrmQRNM3kF2+WlbaVZjVbPOaaU52R1wAHDsmvPkM
	D40H4EtNMCGEAjAMda7wJccL6NHEV8I/LjuUTzE+4x0/4fV3zmsLmOKvX8CN0KaHViXS
	v0Ku9dd9qxI4in/Exo3ciFo4qgCxFSX5Ifvg3ivi8NZagsmhAyo54qfHyyAjO0xsT1Jp
	Xarj+TNYPNoc2ttFeKYAn85ZwL62UiiaLq3T7YttECjif7ZGF/o2VXwVWCcKsADpD3bI
	75ofsNdRIxszYBvVcMl0jJE105xtVy5tHbvZ0DBg5EK+g/zV1uiUDfRG+ZB8MawprvcO
	FoyA==
X-Gm-Message-State: AIkVDXJWi2HymUWB2eSk6LS8lQJ0IjVNDEv4fHoDYOK5M1v0Kaw6R+ZgwMuphgWn8M+BiA==
X-Received: by 10.28.154.86 with SMTP id c83mr12511371wme.23.1482144049799;
	Mon, 19 Dec 2016 02:40:49 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 81sm16593776wmw.7.2016.12.19.02.40.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Dec 2016 02:40:48 -0800 (PST)
Message-ID: <1482144048.27847.19.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 10:40:48 +0000
In-Reply-To: <1482143598.27847.17.camel@andred.net>
References: <20161219063957.18716-1-raj.khem@gmail.com>
	<20161219063957.18716-7-raj.khem@gmail.com>
	<1482143598.27847.17.camel@andred.net>
X-Mailer: Evolution 3.22.2-1 
Mime-Version: 1.0
Subject: Re: [V2 07/10] x264: Fix build on mips architectures
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
X-List-Received-Date: Mon, 19 Dec 2016 10:40:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-12-19 at 10:33 +0000, André Draszik wrote:
> On Sun, 2016-12-18 at 22:39 -0800, Khem Raj wrote:
> > Disable asm to fix
> > 
> > > You specified a pre-MSA CPU in your CFLAGS.
> > > If you really want to run on such a CPU, configure with --disable-asm.
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-multimedia/x264/x264_git.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-
> > multimedia/x264/x264_git.bb
> > index e790681ad3..240a19661f 100644
> > --- a/meta/recipes-multimedia/x264/x264_git.bb
> > +++ b/meta/recipes-multimedia/x264/x264_git.bb
> > @@ -23,6 +23,8 @@ inherit lib_package pkgconfig perlnative
> >  X264_DISABLE_ASM = ""
> >  X264_DISABLE_ASM_armv4 = "--disable-asm"
> >  X264_DISABLE_ASM_armv5 = "--disable-asm"
> > +X264_DISABLE_ASM_mips = "--disable-asm"
> > +X264_DISABLE_ASM_mipsel = "--disable-asm"
> 
> I think you can use _mipsarch these days, which covers all MIPS. Equally,
> mips32r5 and later have MSA, so I think the override should be:
> 
> X264_DISABLE_ASM_mipsarch = "--disable-asm"
> X264_DISABLE_ASM_mipsarchr6 = ""
> 
> or just
> 
> X264_DISABLE_ASM_mipsarch = "${@bb.utils.contains("AVAILTUNES", "mips32r6", "", "--disable-asm", d)}"

or

X264_DISABLE_ASM_mipsarch = "${@bb.utils.contains("TUNE_FEATURES", "r6", "", "--disable-asm", d)}"


> not sure, and completely untested.

A.


