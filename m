Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 03B6C71A31
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 10:54:11 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c17so21678099wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 02:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/MR4veSdvAnK+U7BdNoXVrMsJK4LyLojBqtbe4amJdA=;
	b=WsO+ih8fUqdGZ3itJyO09lhHs+irfPxyMUglaFz/bRiJNP81CSspoEXtuWCCEpzmsD
	kJZJWK5ViLX6S219OZP0NmZQxA+R3BW9G1bdrhdNGvIJiW+fjfsdWtaJ7iuXBq9cX/tR
	3hDBuHzIDMxfjFb/cBr6LkFK+hsORP98JolXPGHoOgjK/LagxutCCGoGkJMArm15PKBE
	VBBJROmiRPlZkgsxpaqZsLRisVgrolQzkp5lyaJxQpLIyLdpT24sJCfCYcNxmSLCbO/D
	9671D8kkHx7Lk2HjsCv0L4y/BZrmKCJ1wFMa2ZhobihaRURk1U/5ktDsP9+rvLc2WsLn
	VZdw==
X-Gm-Message-State: ABUngveHfMM636Bxzun7maSIbMYrZAA53ntHmdAiU37bBY0m57ua/DlWYXFHGBn7LHFhlQ==
X-Received: by 10.28.6.137 with SMTP id 131mr13662566wmg.49.1478602452167;
	Tue, 08 Nov 2016 02:54:12 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	vf8sm36338320wjc.27.2016.11.08.02.54.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 Nov 2016 02:54:11 -0800 (PST)
Message-ID: <1478602450.8895.9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2016 10:54:10 +0000
In-Reply-To: <CAJ86T=UAjjvEOoxJjWX16x-iDNqb-EAHqgCEBZ9_SyW00W7mEg@mail.gmail.com>
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
	<20161107150135.40266-2-Zubair.Kakakhel@imgtec.com>
	<dfeea628-1c1b-1e1e-b015-aa4cd5b9b42c@gmail.com>
	<CAJ86T=UAjjvEOoxJjWX16x-iDNqb-EAHqgCEBZ9_SyW00W7mEg@mail.gmail.com>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: [Patch 01/13] arch-mips: Add MACHINEOVERRIDES variables to reduce duplication
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
X-List-Received-Date: Tue, 08 Nov 2016 10:54:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-11-07 at 18:32 -0800, Andre McCurdy wrote:
> On Mon, Nov 7, 2016 at 9:30 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > 
> > On 11/7/16 7:01 AM, Zubair Lutfullah Kakakhel wrote:
> > > In some cases, each MIPS variant in a recipe requires a duplicate
> > > line. Even if the passed flag is the same.
> > > 
> > > Add global MACHINEOVERRIDES variables for the following
> > >  * mipsarch           : All MIPS
> > >  * mipsarchr6         : All MIPS R6
> > >  * mipsarcho32{el}    : All MIPS o32
> > >  * mipsarchn32{el}    : All MIPS n32
> > >  * mipsarchn64{el}    : All MIPS n64
> > > 
> > > This is intended to reduce duplications in recipes
> > > 
> > > [YOCTO #10404]
> > > 
> > > Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> > > ---
> > >  meta/conf/machine/include/mips/arch-mips.inc | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/meta/conf/machine/include/mips/arch-mips.inc
> > > b/meta/conf/machine/include/mips/arch-mips.inc
> > > index 6069ca1..5b42841 100644
> > > --- a/meta/conf/machine/include/mips/arch-mips.inc
> > > +++ b/meta/conf/machine/include/mips/arch-mips.inc
> > > @@ -50,6 +50,13 @@ MIPSPKGSFX_32R6 = "${@bb.utils.contains('TUNE_FEATU
> > > RES', 'mipsisa32r6', 'isa32',
> > >  TUNE_ARCH =
> > > "mips${MIPSPKGSFX_32R6}${MIPSPKGSFX_64R6}${MIPSPKGSFX_BYTE}${MIPSPKGSF
> > > X_R6}${MIPSPKGSFX_ENDIAN}"
> > >  TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-
> > > ${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
> > > 
> > > +# Various Global Machine Overrides
> > > +MACHINEOVERRIDES =. "mipsarch:"
> > > +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'r6',
> > > 'mipsarchr6:', '' ,d)}"
> > > +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32',
> > > 'mipsarchn32${MIPSPKGSFX_ENDIAN}:', '' ,d)}"
> > > +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32',
> > > 'mipsarcho32${MIPSPKGSFX_ENDIAN}:', '' ,d)}"
> > > +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64',
> > > 'mipsarch64${MIPSPKGSFX_ENDIAN}:', '' ,d)}"
> > 
> > how about mips16 ?
> 
> We explicitly removed _thumb as an over-ride for ARM, so adding the
> equivalent for MIPS would be odd, unless you see a clear need for it?

There is a need as not all code compiles in MIPS16e mode... The override is
already there in OE - modelled after the original (now gone) thumb override.

http://git.openembedded.org/openembedded-core/tree/meta/conf/machine/include/mips/feature-mips-mips16e.inc

Cheers,
Andre'


