Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0975DC83F27
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:16:03 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.4007.1753233353946763219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mIXBy1uM;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso5058827276.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 18:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753233353; x=1753838153; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/E4JEgS9xu+kJNc0XCN6pefl63ASUff2qRsB66rJdVY=;
        b=mIXBy1uMOJfVcK5UAP1ZcVDDSPNo0khONc8EDfEyQaN7KOO5TI1csjVOlFCTldCW+I
         TpHeJVW8cLFkkcWEsM3kCH3BlXi2azOa5OpCw883Q50l6ifGRKc7G1OQKISvN+0sCnk9
         xLziXTihrpD2bW8h0GBlXbLjY6i0vfrNbn7lICtQwLApF9GEe5dRPP59NxWXUl7XU9Mw
         afAfJ46eZVryGBTrjHJ8MjfDOHNoVtdiT2AEHNWknf9GYHHGS56lb6sGLV+/BI3r6Z57
         /MfLj4bOEPrmwKVdUlcMBM0aeCSucq3TD7cJDPm9xkPyW98+sQpojqFcVfoobecLd92K
         UmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753233353; x=1753838153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/E4JEgS9xu+kJNc0XCN6pefl63ASUff2qRsB66rJdVY=;
        b=WGaL2yTO2T5YJ2YPGsmJxeJA2zGSgbrtXXZFLjM2Iyal3fIysHyLgaEUZZYd8DRA0O
         ftiiCdJRzzNujBF6tllPQ4Min21nI01nd8Qc03xLZp2DlRz+ZszcdAGGfaGZ7wIOp96q
         Im7cGTmUBizM88+xYPo4/GIjdoqztWTzOagj1IcOaqzabG6GtjLIhBCINANv8UmU8WuY
         6h5cl+kaaG+epQOa1AuPtxWUy+3sZb7JAbQ7AuFs4hnSrXkzBBiDrNcyv0viiRj4ROqw
         i6YfgSb938ZB2YMtwe+2pRVJ19Zu8ngR0w0smA7lpO+s717i0TKLeirRQiYMjxmI5f4s
         wxyg==
X-Gm-Message-State: AOJu0YwLIBpC/nhQpbk8z3r0I8zs/ifd96RV+588y9rWL3trcVTXzwqH
	S8VXmn3TkQo7iwRzqP7iejfmA1VdASyewwiRDWNaM3lTVvqClVLBLocvI1mL2m8B0aCNr8r0Fip
	42BStQ4QJUtxurhUEp3r9iyptBG6+4hBq6EGC
X-Gm-Gg: ASbGncuUq1JYVKMDVsYpkw415Cz78/Ngqhew1yaWXc90MfxagaRZqBY3CM4u+I+Oz5t
	iNefs9cLtm90x7qlLW72rY9LNz/9PLfROZew3RtYUhPocF2EXy/pWD/E1gXyRqno6nnGpHEhbNl
	iqiWWRJd41ZwimHm8h7+sWuvEdWrxJl1OHHfEK4vVEzbvS6wu0BijNrwYcGdWMJqGlE0plLZvhF
	NXmttQ=
X-Google-Smtp-Source: AGHT+IGALyb/6Luw+gswLAYuN/MPCrT7Kg76gQXywlzKlslSTMD8UQaiq2laiGhO1DWTH2znwKO6TUZ0L83kiNdnnZs=
X-Received: by 2002:a05:690c:4808:b0:719:4d3a:ffdc with SMTP id
 00721157ae682-719b416801bmr17498177b3.14.1753233352902; Tue, 22 Jul 2025
 18:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250722125041.3301907-1-ross.burton@arm.com> <20250722125041.3301907-2-ross.burton@arm.com>
In-Reply-To: <20250722125041.3301907-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Jul 2025 18:15:26 -0700
X-Gm-Features: Ac12FXyqtvF25-qDibzPIFJECgaaR0qEBVKbfqK6xfMBc8nlWia99HE0nVvKFVQ
Message-ID: <CAMKF1sr=_=UfrvPBKyEnHV2kTx0mnQ9jeQSL0NwZ_O1V7OuccA@mail.gmail.com>
Subject: Re: [PATCH 2/2] classes/toolchain/clang: depend on lld-native if
 ld-is-lld is set
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220772

On Tue, Jul 22, 2025 at 5:50=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> As lld is no longer part of the clang recipe, also depend on lld-native
> if ld-is-lld has been set.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/toolchain/clang.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchai=
n/clang.bbclass
> index 7c6ed57fb31..76419e510b4 100644
> --- a/meta/classes/toolchain/clang.bbclass
> +++ b/meta/classes/toolchain/clang.bbclass
> @@ -27,7 +27,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cro=
ss-canadian =3D "clang-cros
>  PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian =3D =
"clang-crosssdk-${SDK_SYS}"
>
>
> -BASE_DEFAULT_DEPS:append:class-target =3D " compiler-rt libcxx"
> +BASE_DEFAULT_DEPS:append:class-target =3D " compiler-rt libcxx ${@bb.uti=
ls.contains('DISTRO_FEATURES', 'ld-is-lld', ' lld-native', '', d)}"

This would be needed for all clang variants, since -fuse-ld=3Dlld should
work for native and nativesdk as well.

>
>  TUNE_CCARGS +=3D "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " =
--dyld-prefix=3D/usr", "", d)}"
>
> --
> 2.43.0
>

