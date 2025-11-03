Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26707CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 17:54:45 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4040.1762192478372925658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 09:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OMGuHGZx;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63d0692136bso5126311d50.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 09:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762192477; x=1762797277; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byzFCabq9z1BSH0VUkDbrtHPHVIy5u04Co+6OHrL+x0=;
        b=OMGuHGZxzPGNUhtZ6P9YM40YaXeHgaviwGBDtt6T1oDen+ULDgjgmmJ4vuqevzhStc
         RWYy6fbEMK7fIAolGtRLjZ9LtCnGnv4/JDV4MU7CmOcoU8BN1AW61qk2VdlVZoJmox46
         +eRxi1BHC2EpH7NwDdgtHCZlFap4qgz26wyNbCVctn5YA0tkW+5Kj2jpvCmcKiaBqkLK
         zBHnvk/349fqRCTmLHqh+7gLFQFJWVgHuw8xLFVzfOt5sktyEsh9AJHKqiEfjuUKGHpq
         mPDeVIZCxHRo5J9rhB6WiQX/lSQFcEGRO+Ok/TntqCCYBnEC9ZXy+KUvDL1ca6d2eK+i
         ObEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762192477; x=1762797277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byzFCabq9z1BSH0VUkDbrtHPHVIy5u04Co+6OHrL+x0=;
        b=PdmYHS7B0Ew2N5vxFnntjA9TpTdglX+jEwvhXfbuUhYVV9roM8WdPVNFAzMs3lFHsK
         1wJxSOAQnPv1hk5pyKd93/a/+EN55NLrrvzpvI+p7C15M5A+O77z/6YZpQ609y/Ilk1g
         T+qC4tPN8RgTUo7khUmVCdz350iDaNqN5Uj1Mkf/8RbOv2LdHuMeqk9VOlV2l55MqQDt
         3IxWJkhbZH4CuQ6NfcF21r4M3k9s3DPFSJtUF0g0rLOICFO6RfwrQK3smCTgQmpwxQ1R
         5i/eRROcRm2ZmmHW1MTk56tR/hGwjCbsHK01hR6gTSIgDgR1PiF4k6jrdOZQ5X57DtS/
         g7/w==
X-Forwarded-Encrypted: i=1; AJvYcCXlBbX1/PBg+5PJkYDEKeHxBSPOU5HJZTiP4eTg3WjteyADTQDfJR9mf4+md0RIx6cZF4xy13gzhF7evkMYSCMCSA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyXgl8fvwSusbMYgFoPrS6o7wPLhzIWqCWk7wOtglDyaJl54oeq
	SyOFu87mk5UK+la9hUM899ULwXjqgv+b3dnih6qCvVIhdoEPZbrzTi/DDs8Fdl/HLscVTNWp1hw
	gbemIpUu2c3+P4MSCi5uPny1adK1eWp7ZriFM
X-Gm-Gg: ASbGncs/IEVRptfM8gijz6v35eBdlZSNUwtTJq00pjMWUqdBdlKl2lvwC2+EYdRMg9r
	I8dCgJkqpLaPPDLZL26Yq4WVXyVhWdu6AY1eXV9PnoILuCp4OzeqI8KgLaSzaRhmMPth37dzxWY
	lsqRxCVMq1KJD+b34Oas7Rij4P0CXN68ONb5wiH+49hau318Ks5yVRVVe9gVtThUvZAHe9sWa4k
	p+eNxy0QHyTzBDO3HuMIEM35ACPmtfE9O21xXMZnhn+pKGQ+qJGonmuNs4Mk+FZYSXUO1CtztMH
	Zxc1bDuSU0RhLDKrb0bp5RrchOMssvBosQqn5aXAQDyczr3EehblS0RWQKPrMMUGfNN78r2bm2c
	7FVftS9FheQwi
X-Google-Smtp-Source: AGHT+IG/7RXtwqhTy1MBBvl6DH2mvc1yKTbkzsyRxTH1947MSi9DYcqupv2Lw2tpXOUTeVwWqR83RyfPV4E7Biyk+po=
X-Received: by 2002:a05:690e:d8c:b0:63f:9b81:bef1 with SMTP id
 956f58d0204a3-63f9b81c09amr8889626d50.48.1762192477459; Mon, 03 Nov 2025
 09:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20251103082911.1792759-1-peter.tatrai.ext@siemens.com>
 <20251103082911.1792759-2-peter.tatrai.ext@siemens.com> <CANNYZj802C5ABk_1tCkgwpO7a2ECC08dKzFaCK9WoR4qBNWmoQ@mail.gmail.com>
In-Reply-To: <CANNYZj802C5ABk_1tCkgwpO7a2ECC08dKzFaCK9WoR4qBNWmoQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Nov 2025 09:54:11 -0800
X-Gm-Features: AWmQ_bk3FMMwacYFQzL-FgL5fj_K28Mad0GLBC8iu1ZS-AYkBG1FpC5h6EYqfd8
Message-ID: <CAMKF1srxqa-j8RyvU7PpWO9RrrdcRbEtaxo4QJ1r9mTnFGfUVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] oeqa/selftest/rust: pass zlib/zstd link
 args to test build
To: alex.kanavin@gmail.com
Cc: peter.tatrai.ext@siemens.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225686

On Mon, Nov 3, 2025 at 3:22=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Mon, 3 Nov 2025 at 09:29, Tatrai, Peter via lists.openembedded.org
> <peter.tatrai.ext=3Dsiemens.com@lists.openembedded.org> wrote:
> > This fixes PowerPC (qemuppc) test failures with undefined references:
> >   undefined reference to 'compress2'
> >   undefined reference to 'uncompress'
> >   undefined reference to 'ZSTD_decompress'
> >   undefined reference to 'ZSTD_isError'
> >   undefined reference to 'ZSTD_compress2'
> >   undefined reference to 'crc32'
> > -            cmd =3D cmd + " export RUSTFLAGS=3D'-C strip=3Ddebuginfo';=
"
> > +            cmd =3D cmd + " export RUSTFLAGS=3D'-C strip=3Ddebuginfo -=
Clink-arg=3D-lz -Clink-arg=3D-lzstd';"
>
> But this still does not explain why the issue is specific to powerpc.
> Can you get to the bottom of it?

We have compressed debug info enabled in gcc llvm and binutils so it
needed libctf.so and libbfd.so to deal with these symbols and rust's
linker wrapper calls the system linker
so there is a transitive dependency on zlib and libzstd, for x86_64, I
see them in DT_NEEDED section so transitive dependency is met. Since
we use --as-needed by default
I am guessing on ppc the linker somehow ignores these libs and does
not add them to DT_NEEDED segments and autoloading does not happen.
Please look into these directions

>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225647): https://lists.openembedded.org/g/openembedde=
d-core/message/225647
> Mute This Topic: https://lists.openembedded.org/mt/116094536/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

