Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C30C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:53:18 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39075.1785747197447614388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aVJTd4to;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f6609c657so1562175f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785747196; x=1786351996; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IICoD3MlDF/cls6Qk7SVRp2nE0/2QIEIf9+Rr21VF1Q=;
        b=aVJTd4to1RF3IQedgh/7BmVchxRA0HVSxThzo4hKyxy+x2bbk5AQu2pgwaRTroRvh2
         bv1wmEVglpQN6nM9t0tB9/ajR0lfguHdXmixqSeJV1C82d4SkZxHkhRwKh525v9cSuTb
         EzAnKV2Ulwjy+QUXLoheoYOavk9sjlUQzQNzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747196; x=1786351996;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IICoD3MlDF/cls6Qk7SVRp2nE0/2QIEIf9+Rr21VF1Q=;
        b=eMbVZOfNrD699JTfzuqe/Qc8wWCaL8EhpSpY9WoHt3AKCg7z51pb/74uA+ZPPi5beG
         cAYM5TJOSM+zZQ93ihocJrlhx14QEGLvv/RZgOhsB5AnZ9NRV2K0cBXezpkI2FiHc2d0
         EWds0tplZGQF024QF4jsnRrgBmKjwFOxQerN/lb0Pc90qD1EdMzWOm8/sFi9RuFCmzB0
         odC8RTN+VgrQB3oyzmRqyHk0ERBnQaG5RG54Eu01sd+v/k3RIUahr9+Qu/p6iljbogj4
         XbauD6cgWCqY0Cj3uAPui3mksFxvfPQ2ULh50gwtYTa4ldOM8VEcV/oPEpwQtqiy7jBT
         4Icw==
X-Forwarded-Encrypted: i=1; AHgh+RohTBNLHnGYlnI7hle3Lb6AdReN7r6o1TGRO83HsucFZr8kIzPzE4UXv6I3lA/wciGAvekrTk3F6WcqLF09BnU8tw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYFxBBiSW9L8y3NOLKBiQHfqML5Of/PoGcvL02NbiWsCmCeJSg
	2DZjriXBG5KTnuwYR+8W13CxE1lPv/Z2rOn4GwX/PT8gTUyS4Pv84gzwVgfG/Srtqxc=
X-Gm-Gg: AR+sD13wiCfC6gzhOWboWp0p5wqfy0LpYaPbi/ls8BKHXuH0vqPUiafAuH0qs5T5iCN
	TpefBYnqbcAt7/CGg+Ue2/YIMcoZLfhYDpnYovf++hY0xbBI1VZpDjno3ui8qaWef6+q+BjO69h
	xrSMTg/+akEuWtf8/kgQsg/v4EvQMMha8+gdoLHa+iKIzftEP7wyB0P0SPI5LC/JdSKBBsZwcjH
	fHjExVEJLLjdCUlABnXUIPMcqah47Gk4utvFcOOCww8eC0qPNlfIDuVt5hTnwguusOjeX0u2Vi0
	/xRtVlWP4DVYTfpO6E+jAovH2ewFZl8xwGwcso3ZajCiMKO69m3Sf/+Nm/KxdDsM1t0MgEBhCXm
	eBlUNLfMsvT61cqcfJUtjDq0hH4lBfSmcMydXnxridOlfeBgBW+SB0IvzG+ZvTrucHaBS+ewH+z
	Mr1LfpOLZjw86Q2Jzeqn/7petU6yhlc3ndWc2jmlQyhQZuzU2ts0P29qz4ipmb68nLfwJMhFOc/
	i5izOZDrzchNyrUbQLYCjyOb8B7A6HZUHiptk+ci9qSW5rNiSStBg==
X-Received: by 2002:a05:6000:1868:b0:47f:d072:87d7 with SMTP id ffacd0b85a97d-47fd9b54c72mr21888627f8f.9.1785747195567;
        Mon, 03 Aug 2026 01:53:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6b5c:9c24:b513:8797? ([2001:8b0:aba:5f3c:6b5c:9c24:b513:8797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm29775338f8f.5.2026.08.03.01.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 01:53:14 -0700 (PDT)
Message-ID: <f1771e0793833da55b3ac9193a86cc94e974ddea.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/6] spirv-llvm-translator: upgrade 22.1.2 ->
 22.1.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 03 Aug 2026 09:53:14 +0100
In-Reply-To: <DKF5EMI6PAQP.1BKV118DSTRZF@bootlin.com>
References: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
	 <20260801121454.2770123-5-richard.purdie@linuxfoundation.org>
	 <DKF5EMI6PAQP.1BKV118DSTRZF@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242637

On Mon, 2026-08-03 at 09:59 +0200, Mathieu Dubois-Briand wrote:
> On Sat Aug 1, 2026 at 2:14 PM CEST, Richard Purdie via lists.openembedded=
.org wrote:
> > 27afcfe3 [Backport to 22] Read old SPV_INTEL_float4 type for Stochastic=
Round*ToE2M1INTEL (#3926)
> > 699789f4 [Backport to 22] Fix OpGroupNonUniformRotateKHR mangling (#386=
3) (#3905)
> > f167fe94 [Backport to 22] Add missing coverage for SPV_EXT_long_vector =
(#3889)
> > f172a708 [Backport to 22] Add 2 opcodes back from old SPV_INTEL_fp_conv=
ersions spec (#3880)
> > 08310a8e [Backport to 22] Represent FP4 E2M1 with SPV_EXT_ocp_microscal=
ing_types (#3867)
> > 64fa6b0a [Backport to 22] Keep VectorAnyINTEL for VectorCompute modules=
 with SPV_EXT_long_vector (#3829)
> > 36e45764 [Backport to 22] Use SPV_EXT_long_vector extension for non-sta=
ndard vector size (#3777)
> > e123849a [Backport to 22] Implement SPV_INTEL_subgroup_scaled_matrix_mu=
ltiply_accumulate (#3831)
> > c88a2e4a [Backport to 22] Support SPV_INTEL_rounded_div_sqrt extension =
(#3770)
> > 6c3fc37e [Backport to 22] Preventing generating FPRoundingMode for arit=
hmetic constrained intrinsics (#3771)
> > 9c688012 [Backport to 22] Update SPV_INTEL_fp_conversions to the latest=
 spec revision (#3782)
> > 521e409d [Backport to 22] Support `SaturatedToLargestFloat8NormalConver=
sionEXT` decoration (#3767)
> > 1d5546f5 [Backport to 22] [SPIRV->LLVM] Fix missing spir_func CC on bui=
ltin FP4/i4 conversion calls (#3746)
> > e10ca9b4 [LLVM 22] Add workaround to translate casts from target ext ty=
pes to int (Originally: #3476) (#3684)
> > beefc64b [Backport to llvm_release_220] Remove internal values for SPV_=
INTEL_predicated_io (#3723)
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Is it building on your side? On my branch I have some errors:
>=20
> ERROR: spirv-llvm-translator-native-22.1.5-r0 do_compile: Execution of '/=
srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/=
spirv-llvm-translator-native/22.1.5/temp/run.do_compile.2412725' failed wit=
h exit code 1
> ...
> > /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-l=
inux/spirv-llvm-translator-native/22.1.5/sources/spirv-llvm-translator-22.1=
.5/lib/SPIRV/libSPIRV/SPIRVOpCode.h:52:31: error: =E2=80=98OpPredicatedLoad=
INTEL=E2=80=99 was not declared in this scope
> > =C2=A0=C2=A0 52 | #define _SPIRV_OP(x, ...) add(Op##x, #x);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4301

I think you might have been a little behind on master and missing:

https://git.openembedded.org/openembedded-core/commit/?id=3D9b69f96598066d1=
dd8b6e8fd7884027133c9f8e7

and the preceding spriv updates? I think this one depends on those.

Cheers,

Richard


