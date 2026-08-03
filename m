Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3340FC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:16:48 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38623.1785744997593454307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XVPpFpDN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47362928f65so3000706f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 01:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785744996; x=1786349796; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wWRUkllSRciZD3EFArLlz5I+Su+69HB0sHKmJKnEJ8A=;
        b=XVPpFpDN853iVSrsb6SLpSe1ABEQd3EZywSKbcLQPetejKOXWgRF+eR3CwXyapFKOa
         4FTO7kHk+KgavfGauAeu9ALXO0h3cpHyq0DLeyYbg3E3Abk1xarHtXx4NZtiereCOTF8
         5RXRLs4bHVe9z+PpM/0n8Zq+vjMZNy5Kia8Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785744996; x=1786349796;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWRUkllSRciZD3EFArLlz5I+Su+69HB0sHKmJKnEJ8A=;
        b=TN2HYhPw9wxQaz82pyh1AVKS3O+CKFIcEDAjjcA3nTkQsSfreGijK82tqiSaNOOfGM
         2lmWDFrX8ETm0Ez1Ntm1BrpygQITNdq/DWdTt0MFObcFIQPuxR184pyY8utpi/BZOAzg
         e2plCsgrEGk30+TMz8rp0gY3jBnXSXIbIf4z8PLnLygLLzAgEs8PVN6Jy/bBrfeCqUl5
         o5RDmBCaSNUqRdIzyczHToDNEkqBCLk4r2qclWB1NVEJAdIvgBrFe5F9zixwOm3nJFda
         FKOKfUtlIBy6o1iLGNBd3wgICnpLjT0iRJ7UUy9UTOIJBWFbX0mhVSjhohshLhn9N4Jp
         j2PA==
X-Forwarded-Encrypted: i=1; AHgh+RoX0CL0/dyHlgyNVWgxll804QqQPUx5Sb/j0WeCDi7boep/UageD35HZfttjd1usXduqc5RmZJ8nkB3E5rU6BF5mw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVbmN7ul+45ZCi/VI97/rZ73SmuajioiLE5rIvOJtTu/0FKCWE
	6shrD4J1TlPwOkZUEs/d+R/E8msZppXAICRnxVql2jKDYylZwqb3Xxz0VX0A9iM57UI=
X-Gm-Gg: AR+sD12AX3ajjt8aSc9RaMJCo+yyjLRx+nhhnF3uz1E4AyevP8OOlR082BzskXg5v20
	vlJ962l+4PrVD0E34mpD+Fy8e77I1jcQ80cBezhAh6zyDh/cURLaSgU7G/+mT+zUAM+qtxA21JA
	L6Xuen5Ar0JX9bTWlou0u5gJAVaDraqSWIXwgT9iaGjvtRik5k/RWbQrJHB2DNqtC3LeU57Y955
	wKA7ECEFNfOs/NF+tgY9G76LSMIP0LMUbN3Vzr2Z5Hf1VLp0T2ZKvWbvvzR/zD7WcXwYvYIo7RW
	08ZRr/T7KsvriL2SZ4zjFi38mtr2xeGw+w3XhnaRBna+fi1e8fWeOviUTZPV7ZaUwEmsm01PmV1
	Q3nE69TQZFfxgC7h8A3JbPbomFb7p4xfKZHBVWm1/rHXl80lnChYFMLuwmU2BFF27IOcAcvW1nJ
	wGDtKRH2Kvfm7SmSlf7GORU8xvBfLhMOj3WzluSSMkjz/VsI65BGoCFaZ0aLSD9lAQtft+RUI6O
	uIEM34nrV37BW6kxS671eu+WpLftXmqK6DRDz9+t5MWDJUBxVwqeA==
X-Received: by 2002:a05:600c:a016:b0:495:573e:1c54 with SMTP id 5b1f17b1804b1-4980c6523bamr230182915e9.9.1785744995603;
        Mon, 03 Aug 2026 01:16:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6b5c:9c24:b513:8797? ([2001:8b0:aba:5f3c:6b5c:9c24:b513:8797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30640484f8f.7.2026.08.03.01.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 01:16:34 -0700 (PDT)
Message-ID: <747261207c0e10504171b5d5b35f44e60c765557.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/6] spirv-llvm-translator: upgrade 22.1.2 ->
 22.1.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 03 Aug 2026 09:16:34 +0100
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
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242616

Hi Mathieu,

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
> > ---
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

It has been in my master-next builds and I've not seen that failure... :/

Cheers,

Richard


