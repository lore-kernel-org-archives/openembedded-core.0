Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C8FCD98C7
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 10:44:54 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126829.1781520289772373957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 03:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VQ7QFzPj;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51778077b28so35893011cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 03:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781520289; cv=none;
        d=google.com; s=arc-20240605;
        b=j5CjiCT6ps8qgDiftbprRGv55T3IPnbqPAN9G8fZYagn75kVOPGbA9JZOFlZiVI6rr
         Pb5UEv9/uZNdd6rb4mxqIErNoh3Nt1QX0+wU3itGiu7ewlNoDla2U8lVx7NBENfA4TeG
         N7WijjkuGc+RcqmAHraF/RvpIcUraAPyN3PY4fkcXeIeWTZZrw58QWlOyzWY3+OPvAx7
         3KSeBzs6E5PmoCpaDwXlmCfBvwoHdzFOmMDyynKAk/WcLx0gIG2EvvQ3BFEv7HG6g2fN
         G3+uzGlLQwtFD0DS43Z+Tt9AJGpf0x85WlpN6SzwjIxfSTBInAtf0+jIodFPYRSm2dku
         5DMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1fcTeCuwO9tMzBp/rMcNx4riyjl5IfFGuz12vUCpf20=;
        fh=hFLUH0inB3fRLPMGVC9cwm2wvNrBX8CYP6AYojkoyeE=;
        b=K7qL1c11Vs7dBAZu/OujONbE+y28QnYrq5J1jO6Z9bWOzo2h3l+YX96b5RmkadSunR
         6J0huRTpPXNKLoxX35k8qXkR4xSdD5GlVsfYbUgM64Gz+bHoh77zYIgzxj7OqdKR98vn
         DO+ahUEF0UwVxDNPLUcs6fpXH7XZ7643oUqI/h3IUi6wTkHfRRoSMEOIhlStMZaE5KEy
         auY8vxLLtUUyMu0WgHzD6tYK8UWTFWisJs9apzXD0id005Emb+dzoiIli+ltQ8zk3qaE
         hxCQ9qdfV6ygkj86MwWNfnxe3qKsYcGHomBehV81ZBKc4ym31JNZjZinOA8HnDin+F+L
         ng/Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520289; x=1782125089; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fcTeCuwO9tMzBp/rMcNx4riyjl5IfFGuz12vUCpf20=;
        b=VQ7QFzPjKPzLRPxgE8JG2uy9NHhuHBDv2hBhMurmTyFRKceS23khunxQ3B89AUEW8i
         i/Ba3+Kr0d5Y5fQcRuA4VJn02fC9TdaENfUxLA7eGTTCA2gha/JVLBx5OsQW7/tcmMxB
         lqa5AAzx5wGNyb0Xet/6Ib/roNwXZHM0St8RMvZjloREwAhnRw1BwBO7ymLLtf9/1pog
         hK4PndhZjn7zgEMz0TwiLdVGPf/h74P1OI5V86T12muALGHakKM1v6KJ+N544nhsM+y3
         J8eOJ7/Ix/VZ7AnKQe8vTvPzyigtvErXeO8QaxSGOBbierB7+pnfS5qAU0Dc9JD15dvV
         MGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520289; x=1782125089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1fcTeCuwO9tMzBp/rMcNx4riyjl5IfFGuz12vUCpf20=;
        b=P8sbA3EmATbLaAM+wEwasfTUYUqKWxLw97fNpOw+JjaZ8h+0kpsbRejaAqM8xPaR8d
         syfZam6VeHR/8f4LUbk2vOsA6Or5GHwtWL8eoKHvGa8OZP5jn/w1s5LdiIJiQNP79jpc
         35ZwVyD6rIPL0c8MZocYRgbNMzNwrZeQnDd6+GCf2AieqQqR+sOoTrXtzL9VyRKhPc3t
         YKwR2MzqvSfqeZKOE+eXLt94WVWgtOtwArdkevrrSVdTN1oJ1vqHP/wp9JdY/vQeYZur
         NV5Gk9x7OCsTUshqLlLij+BIswfqAMUhoX8a6cm/zDab4HjEBpUgNm26Ir5uExQFYk+U
         UMgw==
X-Forwarded-Encrypted: i=1; AFNElJ/oN+qIDA3jA00efbYnWflvdKijhTD2KtcB3j9CQpZzq8Td+1c95/DaiwTboxaqiJDI+wQgjwhjQ1wZyP5R4fLqvQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwtC7YeX+CPGVEQsTZS6lxAbpxTdeVVEh4Obw15AMVijpVqSway
	t5osq5VSz6noAcGg/ccrkgeHFfZXTQmnhqeRvpNLRAfNIkpmiHP8MeWx3g0cjwtanhKhwjI9qM1
	qeLq8+WVn3wxDw2guuJiSeJs/2yFljDI=
X-Gm-Gg: Acq92OFmcg8+dVme6s00g0dExdEsqe9qBCCfs0wIR523DLvZnvK4kfd0G37JCERDjMm
	el6J92rYFHsYTnij1pIxkTn2Fx0rvtjvpkokgxxD3loAI1LKgcLP5XkK6G50kTjoc+FoXfL6ufw
	z7xEMqteLUjOOLbtouuuphrcdQUnLaSJJbnLjGNdJr5iO837gBCmdkyXSMIKozUi3xV5d17xBu8
	/3SOwwstUBBH8mDWcnEftYpgAC6OXPf6pwqVfZu6bo5lsFY+58+splMGg1f7b6XwL4RJCDR1Txk
	s1RNOefcka+/4x/a1gyc7IcDrnPTZRKcY0S9SiXFA1MJuZSuB2cz
X-Received: by 2002:a05:622a:8d12:b0:50e:60d7:b272 with SMTP id
 d75a77b69052e-517fe52f2damr185939561cf.41.1781520288627; Mon, 15 Jun 2026
 03:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260610094932.2264-1-wangmy@fujitsu.com> <20260610094932.2264-15-wangmy@fujitsu.com>
 <DJ5YPKB59JWN.379MO32ZI2BQH@bootlin.com> <OSCPR01MB13427F610C3A42F7ADB33ED9CDC182@OSCPR01MB13427.jpnprd01.prod.outlook.com>
 <CANNYZj-FbxWBK=F_hMeD3oJc7WF_4KOKjB8Jz7s_=JX_8ADEZg@mail.gmail.com> <TYYPR01MB13419567B9C3B4ECE846491C4DCE62@TYYPR01MB13419.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB13419567B9C3B4ECE846491C4DCE62@TYYPR01MB13419.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jun 2026 12:44:37 +0200
X-Gm-Features: AVVi8Cetq2UrHAD9M_9wnSVgYHuITyjpvWfhX3ufWEeRp4pzOIc3PdaWs04DdPI
Message-ID: <CANNYZj8n13hzdw_jLYFrPCGVQHMHraJ8n7WE5EumGNnd2+cw9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/16] mesa: upgrade 26.0.6 -> 26.1.2,26.0.6 -> 26.1.2
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 10:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238830

On Mon, 15 Jun 2026 at 04:04, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com> wr=
ote:
>
> Thank you for the suggestion. I tried patching out the : uint8_t part fro=
m enum jay_predication as you suggested, but that alone is not enough. Afte=
r removing it, the build immediately fails with a static assertion:
>
> static_assert(sizeof(jay_inst) =3D=3D 32 + (sizeof(uintptr_t) * 2), "pack=
ed");
> because the struct layout depends on the enum's underlying type.

You also need to adjust the type of the struct member, so that the
struct itself enforces the type:

@@ -634,7 +634,7 @@ typedef struct jay_inst {
    bool decrement_dep:1;
    unsigned padding  :12;

-   enum jay_predication predication;
+   uint8_t predication;
    enum jay_conditional_mod conditional_mod;

    jay_def cond_flag; /**< conditional flag */

Or just take the full patch from here :)
https://git.openembedded.org/openembedded-core-contrib/plain/meta/recipes-g=
raphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-e=
n.patch?h=3Dakanavin/package-version-updates

I just confirmed that with the patch gcc-11 builds mesa-native successfully=
.

> Beyond that, there are additional errors in other files that appear one a=
fter another when compiled with GCC 11:
>
> src/imagination/pco/pco_nir_pvfio.c: function lower_pfo returns false but=
 should return nir_def *, causing error: incompatible types when returning =
type '_Bool' but 'nir_def *' was expected

This (imagination) is not enabled by default in poky or oe-core, and
does not appear in my build logs for mesa-native. You should check and
adjust your configuration, or perform test builds using exact
unmodified poky or oe-core.

> src/intel/compiler/jay/jay_from_nir.c: missing return in a non-void funct=
ion, leading to error: control reaches end of non-void function

This is the same error as the typed enum issue above.

> I also tried passing -Dc_std=3Dgnu2x and -Dwerror=3Dfalse to Meson, but t=
hey were not enough to get past all the failures, and the build never compl=
eted successfully. It's therefore unclear how many more such issues might s=
till be hidden =E2=80=93 we simply weren't able to reach a clean build with=
 GCC 11.

I just succeeded in that :) so hope you can take the patch and make it work=
.

Alex

