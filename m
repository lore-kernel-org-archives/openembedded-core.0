Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160D9D743E4
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 21:47:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.426.1732139223238529635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 13:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SAWPGpVz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-382376fcc4fso92869f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732139221; x=1732744021; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3hUJz8MlOv0nMyttydFRH9hwrcP7CSYks+fWapg8XRA=;
        b=SAWPGpVzg81oMOjLyrfO10/aHodtq3DCvZ48xzCUS+lxRev+O4rQkaIw+H57ABPEGn
         DanvFkv1L08qg2o6oXO2UV8cxdJMUxJMCOKcCz2jt6QE113aWCHKFY/TH3ALDo81+Vvl
         oLbI9yS6S91CTNyo62CN5oLYMxyZj9mPO003E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732139221; x=1732744021;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3hUJz8MlOv0nMyttydFRH9hwrcP7CSYks+fWapg8XRA=;
        b=srgtuIPXNr5UFbqzSp6OuZt0ZehJjtSnebDm6Q+NdT9a2wQ1tiH460yCcEB5g21aLg
         lr4aKBxCU+/CrOO5+H2U93X4N3/5eCPErAqYxs9rTKZtlNDpsaSghGBMi4lw7/Ry3+ig
         sKC5Ux7RPu1r8sDifAV2q4Q3gtAvma8D0VUq24QSDvMDJ4igBx7+jPoyYTK1g7cejU4C
         v42XER78Q7hsa+ZyixXjG/XXLUNSnmO673gkTNNORc+vXnSPTR7XNNNdv7Z4fh4mUUOZ
         nSXVdwjeW2QIUBZ00uvoeI7rVZ2jKl8lJrB7W6xx7r95mLaPUflhwYWH5RCPPQExQRGv
         daKg==
X-Forwarded-Encrypted: i=1; AJvYcCVT9kMk6KCenRws1EX3Yl55vUeTNKxz9LWWDdh/TP+1uo0u1DCQMsEILKA/BUMGsWM/sF8Rbz2vKYuKuhCVfaj3OA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxswIaZid4p3/fJpqh2Y+H13SWF9MchVPSvEVy2bAjkGj7dP8LK
	yIo09Am+FscGPdWS2XginILBSWfMgG9agNMSPqpUJeu9vtc/yxBieJT6CUxa0ug=
X-Gm-Gg: ASbGncsxl0ExybBM8e7Wc3xrvhLdQCw4bl6wfjj9KyWEoWsp0Qxh29TR4uRj+i9cqft
	pQzkT2zynLQIe0P1OrVsf5nAqhypqtuB0nfO8C48jLe1U6y9DPcTR5GSeUax6vur/u+WbB5kGWP
	DPNZg9Zqmo3p5vtDE58c42f6WxlCDiO2sdHV52o6waOzJ5JAYXnKWc5hanwtyr99vuEAZrb3Ooe
	eRBjOrC0kNl0MnHLzFwdPXlT5LGTz9ZjtvTBVSW8LQFc1SBxucH4eZy5F+sEhU8A8SEzNh36itx
	ISO6d4KwYR6B78k47XsxkM89dWtZSCTMlV7FXpc=
X-Google-Smtp-Source: AGHT+IFCHqUyGymfomh9DaJC/z7WTlhG4+AlCzSSMwanEpj0LXMiLYfzBhJooZ3RR4oQRHDGeQ8M4Q==
X-Received: by 2002:a05:6000:1548:b0:382:496e:8784 with SMTP id ffacd0b85a97d-38254afa036mr3444662f8f.26.1732139221419;
        Wed, 20 Nov 2024 13:47:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5abf:50dd:d6fd:8415? ([2001:8b0:aba:5f3c:5abf:50dd:d6fd:8415])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825490bee8sm3125677f8f.23.2024.11.20.13.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 13:47:00 -0800 (PST)
Message-ID: <8b516efc6aed0588661baf5aeadd7e3fb11d620e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust-target-config: fix cargo build with
 toolchain clang for riscv64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: randy.macleod@windriver.com, Harish.Sadineni@windriver.com
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, "Dora, Sunil
 Kumar" <SunilKumar.Dora@windriver.com>,
 openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2024 21:46:58 +0000
In-Reply-To: <bc3793e0-4939-46e6-9268-b565ecb68e81@windriver.com>
References: <20241120101429.209176-1-Harish.Sadineni@windriver.com>
	 <bc3793e0-4939-46e6-9268-b565ecb68e81@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 21:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207486

On Wed, 2024-11-20 at 16:38 -0500, Randy MacLeod via lists.openembedded.org=
 wrote:
> =E2=9D=AF rg TARGET_C_INT_WIDTH meta/classes-recipe/rust-target-
> config.bbclass
> =C2=A0136:TARGET_C_INT_WIDTH[arm-eabi] =3D "32"
> =C2=A0144:TARGET_C_INT_WIDTH[armv7-eabi] =3D "32"
> =C2=A0152:TARGET_C_INT_WIDTH[aarch64] =3D "32"
> =C2=A0159:TARGET_C_INT_WIDTH[x86_64] =3D "32"
> =C2=A0166:TARGET_C_INT_WIDTH[x86_64-x32] =3D "32"
> =C2=A0173:TARGET_C_INT_WIDTH[i686] =3D "32"
> =C2=A0180:TARGET_C_INT_WIDTH[i586] =3D "32"
> =C2=A0187:TARGET_C_INT_WIDTH[mips] =3D "32"
> =C2=A0194:TARGET_C_INT_WIDTH[mipsel] =3D "32"
> =C2=A0201:TARGET_C_INT_WIDTH[mips64] =3D "64"
> =C2=A0208:TARGET_C_INT_WIDTH[mips64-n32] =3D "32"
> =C2=A0215:TARGET_C_INT_WIDTH[mips64el] =3D "64"
> =C2=A0222:TARGET_C_INT_WIDTH[powerpc] =3D "32"
> =C2=A0229:TARGET_C_INT_WIDTH[powerpc64] =3D "64"
> =C2=A0236:TARGET_C_INT_WIDTH[powerpc64le] =3D "64"
> =C2=A0243:TARGET_C_INT_WIDTH[riscv32gc] =3D "32"
> =C2=A0250:TARGET_C_INT_WIDTH[riscv64gc] =3D "64"
> =C2=A0257:TARGET_C_INT_WIDTH[loongarch64] =3D "32"
> =C2=A0

I was curious what our site files say:

meta/site$ grep sizeof_int -R
powerpc-darwin:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
nios2-linux:ac_cv_sizeof_char_p=3D${ac_cv_sizeof_int_p=3D4}
nios2-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
nios2-linux:ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
armeb-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
mipsel-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
sparc-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
sh-common:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
microblaze-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
mipsisa32r6-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
mips-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
arm-linux:ac_cv_sizeof_char_p=3D${ac_cv_sizeof_int_p=3D4}
arm-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
arm-linux:ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
mips64el-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
powerpc32-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
powerpc32-linux:ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
powerpc32-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D'4'}
powerpc32-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
mipsisa64r6-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
ix86-common:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
ix86-common:ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
mipsisa64r6el-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
x86_64-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
mips64-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
mipsisa32r6el-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
powerpc64-linux:ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}

so it may be more than just riscv64 that is wrong there. mips and ppc
look incorrect too.

Cheers,

Richard


