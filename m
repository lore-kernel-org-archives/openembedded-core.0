Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6F14173D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 07:24:04 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so138841892pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 00:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ytkT9JLi76dWPbGJJppQ0WIIBrve/DBNDh2TC6bnWPo=;
	b=NJaH+PlHPPmel8qL/oDM8U4IR4uIooVEOFC5eMnlaN9WMIaxpKVT3or6ZEBA9/xx3F
	TQ4YVDyfCZPK1HchNuHwd1Eb1LHaOUGKde9ifIdu8Fe8hZlS0zb5UmrPXPAy4vl1hjbl
	s7PSLV5R8sPi0+KfkjDo6+oyacpRc9j0DCvJDY9+wuRshkgPaMgrBZWDstCdrNA9Nuse
	ogcpcAU/EJimR09rGsEd/VvB/BJwmxxUEjEP76Pg9AdHwd9aRQgWOvlcA9YuUMDo7Nnj
	YQzdiH05Jtzt4G8S/fVvoszGf+WvsP7STljFAPI0UMMgWsmANgDFRI2pUL+VqbnnGcxM
	LsdQ==
X-Received: by 10.66.218.135 with SMTP id pg7mr31737024pac.141.1442215445069; 
	Mon, 14 Sep 2015 00:24:05 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:2d2a:c874:d212:2f46?
	([2601:646:8601:4580:2d2a:c874:d212:2f46])
	by smtp.gmail.com with ESMTPSA id
	oq7sm11585825pbb.86.2015.09.14.00.24.04
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Sep 2015 00:24:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441983077.31676.17.camel@pbcl.net>
Date: Mon, 14 Sep 2015 00:24:03 -0700
Message-Id: <E1DF44AB-9219-4848-9031-60846FC2BF7B@gmail.com>
References: <1441975783-21782-1-git-send-email-clopez@igalia.com>
	<1441983077.31676.17.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3094)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] matchbox-keyboard: Fix build failure with ld-is-gold
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
X-List-Received-Date: Mon, 14 Sep 2015 07:24:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Sep 11, 2015, at 7:51 AM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Fri, 2015-09-11 at 14:49 +0200, Carlos Alberto Lopez Perez wrote:
>>  * When ld-is-gold is enabled in DISTRO_FEATURES, matchbox-keyboard
>>    will fail to build with this error:
>>=20
>>    ld: error: matchbox-keyboard-image.o: requires unsupported dynamic
>>               reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
>=20
> This is only an issue for ARM (and only for Thumb2 at that).  I don't
> think it's necessarily appropriate to force -fPIC on all targets.
>=20
> Also, before adding this sort of hack it would be worth verifying
> whether this is in fact a toolchain bug and, if it is, fixing it =
there.
>=20

This may not be a toolchain bug if there is a MOVW_ABS relocation being =
emitted
into an object that is eventually linked into shared library. Using =
-fPIC seems to be right fix
I know bfd linker silently ignored these relocations and generated bad =
.so files but that was fixed
several years ago. So I think what needs to be looked at is why does =
same .o links ok with bfd linker
is it some linker trampoline code thats in question here which may be =
different between gold and ld

Carlos

Can you check the linker cmdline of failing link step and see if its =
generating a shared object there ?
if thats the case and I assume gcc is generating this relocation into =
both=

