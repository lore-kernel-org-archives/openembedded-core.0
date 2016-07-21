Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id F28946067D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 10:16:49 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id f93so5102867lfi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 03:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A2Xd+vMm7SnzRRxkspr8CqmWVZKQadYx2ZtN/PWb4ww=;
	b=L7YiiAZoy0N5vucQp+rOU11z02lWib5ps+Py1rXOuCYmw2mGcdRWv5WOGpI18TrccD
	oBQMwg28lMRNbl8bMzcRIklOFeWIA/67xnKCfUKI3rdnsOGaZtLxm7f6vx5CaRvPEv5i
	iSBumti1+dnKe2SKKNQNYT8CtMGWea58/DYTlRr2NfKjC84d6KNLEgoJExBpB/gKnKY8
	QKlXiO8DOFgtU74ebOwNu5B+LSAu/f+xKEnEE32AkuFJ9X9iUokESXr0QVEdXVlMNRD5
	va3Hl4Yi0E9PP6h0y8bypfuAuoq/Yh3xTLBy8Lp8mZLP82MnXXo5e6Gd4ny8G7AbrZIL
	XSkw==
X-Gm-Message-State: ALyK8tI6yxheymHobfDxdbpvzHqDBZOEgSzoVGpNKt9FWHL6NiVZ1yNXR1Xih/w3KV/HNQ==
X-Received: by 10.25.16.212 with SMTP id 81mr21714316lfq.174.1469096209202;
	Thu, 21 Jul 2016 03:16:49 -0700 (PDT)
Received: from localhost ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id f4sm1497377lji.41.2016.07.21.03.16.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Jul 2016 03:16:48 -0700 (PDT)
Message-ID: <1469096205.6229.18.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2016 11:16:45 +0100
In-Reply-To: <76D6B136-02D8-404A-8AB1-3F236ABAB58D@gmail.com>
References: <1469071188-26218-1-git-send-email-git@andred.net>
	<76D6B136-02D8-404A-8AB1-3F236ABAB58D@gmail.com>
X-Mailer: Evolution 3.20.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] musl: don't compile in mips16e mode
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
X-List-Received-Date: Thu, 21 Jul 2016 10:16:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mi, 2016-07-20 at 20:22 -0700, Khem Raj wrote:
> > 
> > On Jul 20, 2016, at 8:19 PM, git@andred.net wrote:
> > 
> > From: André Draszik <adraszik@tycoint.com>
> > 
> > musl contains hand-written assembly which is not compatible with
> > the MIPS16e mode.
> > 
> > Signed-off-by: André Draszik <adraszik@tycoint.com>
> > ---
> > meta/recipes-core/musl/musl.inc | 3 +++
> > 1 file changed, 3 insertions(+)
> > 
> > diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-
> > core/musl/musl.inc
> > index 5e6cd01..276b00f 100644
> > --- a/meta/recipes-core/musl/musl.inc
> > +++ b/meta/recipes-core/musl/musl.inc
> > @@ -24,3 +24,6 @@ FILES_SOLIBSDEV = ""
> > FILES_${PN} += "${libdir}/lib*${SOLIBSDEV}"
> > INSANE_SKIP_${PN} = "dev-so"
> > 
> > +# Doesn't compile in MIPS16e mode due to use of hand-written
> > +# assembly
> > +MIPS_INSTRUCTION_SET = “mips"
> 
> Looks ok. However, does it make sense to have it compiled with mips ISA
> for a mips16e
> part ?

MIPS16e is just an optional extension (ASE) on some mips32 and mips64 parts.
There can not be mips16e only parts.

> will it work in all cases or only certain SOCs

MIPS_INSTRUCTION_SET in OE is implemented similar to ARM_INSTRUCTION_SET. If
set to 'mips' (as above), it will simply revert to the standard instruction
set for the part we're building for, mips32/mips64/etc.

Given mips16e is an optional ASE, this currently is hooked into 24k family
type cores in OE, only.

So yes, this should not break anything.

BTW, Qemu supports mips16e (if the right target is selected).


Cheers,
Andre'


