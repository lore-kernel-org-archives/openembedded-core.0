Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228F6C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 20:13:13 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25692.1785874383572098626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 13:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xq7RyLFV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so2351655e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785874382; x=1786479182; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y8fFpjXBx2GduK8fjGYjm6KRC2m1yVBU9TStXL6PXCQ=;
        b=Xq7RyLFVrAOlcVHJdbwedHPhYBrJ8l8guoJg3H7nR0GBkFQbuUmBYmt/DgsY/Q0Bly
         CytTQeMp6y5LdmdGV6d5qrRuQN33m85gfAhBIS1pwn9s8Pnf9yjXcsn/MrH8gACS/fu0
         2zxHZaiXGmlVB/wiC6oifUjTYunriMRTVgySk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785874382; x=1786479182;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8fFpjXBx2GduK8fjGYjm6KRC2m1yVBU9TStXL6PXCQ=;
        b=mmaRuYuZkU3SrY7w3XKTQ2kBLDCkPLVaSUaXsgH7MkxGtKVAVNQ5BwL2ynB0Q4LGr7
         FRMkD7VptXqbokusn7ClO6vaF3CZP88Rvb0x/VSmOPX5oDghbmd604MOPdq5qQa0y8NY
         Zk60mcggp+lmGGckFs+CxqVO4o90bRQS/zveJZdSsCvfc/ebclNGNeFt/2H0XYcDvu/g
         uWAwHMshxUYpZbuB3gRNEFRxUQXbnY2C7iWObm1bIHvOoNP83IgPyUTr19NMCpf9jzKs
         Ik5aHEnKn3QTtEE5/emFpdGWftfO9gguETJTPywmQAAOg4LactvUY3HnSm16YFDewVoK
         csig==
X-Gm-Message-State: AOJu0YzZwUMJN6ttpqJbHFyj7bhF2qnf97y8RdeiPcU+Vo2YxfycjqOn
	MLqnVY+6/LMBp5VowBwfHjmGaGUOGkPPkPtb3KGfquhKEkfxhlIUxbRxjV7MgmpANJOG4jxidAH
	5G5WFvUc=
X-Gm-Gg: AR+sD10cZd2rcCT61ESYGElOJlrh7JmwaW8mS18ppioAxd9VuDE1j3lLTRZMDiFy8d5
	uxj6W1NOVvtFap4pZ3uisIGEJDYx+NdROMvnY5i8/vYt0mVvdBHg0CTKecxnZc2iDu4ZlElypq/
	ZMo1IDNKsE+fsyuyfrKJjbgx8xOV/wDSTXbUKFXNKKhi/M+BRpZ5PXoBAsgPOm3xYIrOh5B/P4X
	KVMLTbtmNzaDTqL1sYlYhJd71s7YXE5Ah1f2JK0G3ldnSWTy7R/n4yhG4SwYkaUMdS8EHtRZtQ8
	4fHqhZjPaqapab5XLR3x1nBuzsPO4wyhrlUL0zLh53r94Ki/TmK7qcRMzd29oAHz9fA7Yy661QQ
	w9QJwpAIuqifWTxTl+JNQhml9JvAle21qgnwZrydQcrzRda2Rc7p6Fil5Xe9+neeIEODphCoO3f
	fgMRUGurFCT+du6V0A4Rco4G4rRFm9F7mKKda/F8O5gTIPC+mCpTNU3rEshiSu6pNiQgC1fUHR4
	ndNBn7bQMO8hhV3lPKJlPaLFtKxZUn5V2UkKz/4YMP5xAUZh1ShunuLcSckVQeF
X-Received: by 2002:a05:600c:620e:b0:495:6274:56c2 with SMTP id 5b1f17b1804b1-4994e70a6f5mr13469615e9.2.1785874381600;
        Tue, 04 Aug 2026 13:13:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cf1f:6744:c6dd:c3ab? ([2001:8b0:aba:5f3c:cf1f:6744:c6dd:c3ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994dfcc84dsm27380515e9.2.2026.08.04.13.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:13:00 -0700 (PDT)
Message-ID: <19f7ec53e3ecdf3dece894a2049acd408ac6ef9b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/9] libtool: 2.5.4 -> 2.6.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Tue, 04 Aug 2026 21:12:59 +0100
In-Reply-To: <18C8A8C4FB56E625.3417489@lists.openembedded.org>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
		 <18C899AE0F118A3D.1990914@lists.openembedded.org>
	 <18C8A8C4FB56E625.3417489@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 20:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242802

On Tue, 2026-08-04 at 18:00 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2026-08-04 at 13:23 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > Drop one patch applied upstream, refresh another.
> > Switch to xz compressed source tarball.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0.../{libtool-2.5.4.inc =3D> libtool-2.6.2.inc}=C2=A0 |=C2=A0 5 +-=
-
> > =C2=A0...-cross_2.5.4.bb =3D> libtool-cross_2.6.2.bb} |=C2=A0 0
> > =C2=A0...ative_2.5.4.bb =3D> libtool-native_2.6.2.bb} |=C2=A0 0
> > =C2=A0...3-libtool-remove-help2man-dependency.patch | 17 ++++----
> > =C2=A0...r-static-libs-for-internal-compiler-.patch | 39 --------------=
-
> > ----
> > =C2=A0.../{libtool_2.5.4.bb =3D> libtool_2.6.2.bb}=C2=A0=C2=A0=C2=A0 |=
=C2=A0 0
> > =C2=A0...ol_2.5.4.bb =3D> nativesdk-libtool_2.6.2.bb} |=C2=A0 0
> > =C2=A07 files changed, 10 insertions(+), 51 deletions(-)
> > =C2=A0rename meta/recipes-devtools/libtool/{libtool-2.5.4.inc =3D>
> > libtool-2.6.2.inc} (85%)
> > =C2=A0rename meta/recipes-devtools/libtool/{libtool-cross_2.5.4.bb =3D>
> > libtool-cross_2.6.2.bb} (100%)
> > =C2=A0rename meta/recipes-devtools/libtool/{libtool-native_2.5.4.bb =3D=
>
> > libtool-native_2.6.2.bb} (100%)
> > =C2=A0delete mode 100644 meta/recipes-devtools/libtool/libtool/0005-
> > libtool-Check-for-static-libs-for-internal-compiler-.patch
> > =C2=A0rename meta/recipes-devtools/libtool/{libtool_2.5.4.bb =3D>
> > libtool_2.6.2.bb} (100%)
> > =C2=A0rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.5.4.bb
> > =3D> nativesdk-libtool_2.6.2.bb} (100%)
>=20
> This breaks libunwind on qemuriscv64:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2034

There are two possible fixes I found, we can either
s/WCClinker/XCClinker/ on configure.ac or disable cxx exceptions (which
would match aarch64/x86):

diff --git a/meta/recipes-support/libunwind/libunwind_1.8.3.bb b/meta/recip=
es-support/libunwind/libunwind_1.8.3.bb
index bc1a108e42..1a3a816d78 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.3.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
@@ -27,6 +27,8 @@ PACKAGECONFIG[zlib] =3D "--enable-zlibdebuginfo,--disable=
-zlibdebuginfo,zlib"
 PACKAGECONFIG[latexdocs] =3D "--enable-documentation, --disable-documentat=
ion, latex2man-native"
=20
 EXTRA_OECONF =3D "--enable-static --disable-tests"
+EXTRA_OECONF:append:riscv64 =3D " --disable-cxx-exceptions"
+
=20
 # http://errors.yoctoproject.org/Errors/Details/20487/
 ARM_INSTRUCTION_SET:armv4 =3D "arm"

not sure which is "right"...

Cheers,

Richard

