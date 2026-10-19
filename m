Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D053CCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:22:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33169.1792412556106654915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rFra4kM7;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso22001085e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 05:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792412554; x=1793017354; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0STZ59m88aj1L2uAiDMSH9jwkxapK9T48xgte1Y6P/E=;
        b=rFra4kM74w+aSPKc//yzL6e2lKmrTiM7lAWL/Pl3ArdjehQI143ePa8SYndmtcWymg
         aMVQp/Hwxv22B/PBZaDGUS+uV6LNOTROSK91/vHowBib0NNO67KpxrFFCUn08+pq6HYe
         SZNnlAjxFPktC9pa7TGqDVuw5tUePayJqOyjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412554; x=1793017354;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0STZ59m88aj1L2uAiDMSH9jwkxapK9T48xgte1Y6P/E=;
        b=yu1FiniFjbNX7VvkFSEfqRimbWbzXtYBO3GqlPHXOe207kQF0AB7KpX2D7LxZ3aVRI
         WNyJ354H/sM9KgAoaD0sMWNYkNeXBgNxtsyTHDZcPT+l14+A7En/LVILOdkDaPioOJOH
         VLexvdVpO5KUUVETO3+S1WLkc91QK/QG2USbI6l+tDQYcsHJWOXDLghExDoLcudZSqtP
         XhwXiz4pPgSj6SBtpTChhPB51Du+lpVnn2wWQwZvYxzpepVpbHY8p7fRP9sbGGDq8f9D
         aPk5nznEb2/OFMY3XyrR6VGndOkS/Wz7SrIK0jmlwcQeoke+x2ZXhqSf9UaHZ7AFPaaf
         8DhA==
X-Gm-Message-State: AFq9FYJyaiiHA4sa+9KqSntOVqvgPpZ7UKD/m93mD293e0Lqpeig6WYm
	CQ7eOyIJwPbY+XkqZjgxF04gUNO0fL4QtXhf2z7eTlcuHWx7TdsT8Vu/7X7fChHXzHQX9jvL7j9
	VaiclDaM=
X-Gm-Gg: AYBFou0WvP8wm42DgdttPVhpMmEqru6yhkkOc0o5/k4RijjJOF3uaxpYJsYrHe5pmff
	Hm1Dyjr0yILgaIhPHPG5xqbOnB67S2COA1HnqiHk8GU2gYqqSCCqltTxzrlbmIPSNPDiAmqVQO/
	Z/Jikxj+GKTduVI+DK/6thtyrYhIvRWaq7Bh1G8EtzCzgmT6JC6sedtEAGWYnwtrUBwCCjET5ke
	lh0v45voNEXPKgVhgA1c7sCOx+DWDnEpNurKRGXj4hB5nJHq+Bqwv/n+XgFe6ZOG22H58Mjy/Xe
	b9TVuhYOShxoGT2BMQSSi0kRbmzpII3s9WKuK949ZBaQ1L2AKADXb7a44Li3hvSGVQfqQluREV5
	HvSG3aQ1iY/G1tbMoM3jgJMTlyRCP4K3DVZmm89wA18y/LcAMxmPlU7k2LrM2RuoXn7WQX6qg1V
	QNgKT0njVoizAg1gloWz1L8U+2DKuY7cF4P3Le1ztxsqfLBFxFFOdsakpdXfDuCxxfMFeokmYA7
	jnfSh4jXgukGBKxIYLwttBumeleT0+uL3d+AQg28hbs53IpiihkNfJckW0OiQ==
X-Received: by 2002:a05:600c:820e:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a1d761637amr144862885e9.28.1792412554139;
        Mon, 19 Oct 2026 05:22:34 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm22500976f8f.30.2026.10.19.05.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:22:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 14:22:33 +0200
Message-Id: <DM8T7ZKV7U1M.1U1MVCGG316S3@smile.fr>
To: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
Subject: Re: [OE-core] [wrynose][PATCH] minicom: fix baud rate setting with
 glibc 2.42 and newer
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261017111813.53186-1-ayoub.zaki@embetrix.com>
 <DM8M06OIXDWR.1KFR0FLAQLZC2@smile.fr>
 <2cc2f09f-9f7b-4014-bb02-1d1eff6d9647@embetrix.com>
 <CAMSfU+6JRV-m2c8zNRCD48N_-TUm7uQsk87XFrC++Ue1e_HFaA@mail.gmail.com>
 <2054b497-3add-46b9-8dcc-051fae96262c@embetrix.com>
In-Reply-To: <2054b497-3add-46b9-8dcc-051fae96262c@embetrix.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 12:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248160

On Mon Oct 19, 2026 at 2:09 PM CEST, Ayoub Zaki wrote:
> Hi Yoann,
> On 10/19/26 10:16, Yoann Congal wrote:
>> Le=C2=A0lun. 19 oct. 2026 =C3=A0=C2=A010:04, Ayoub Zaki <ayoub.zaki@embe=
trix.com=20
>> <mailto:ayoub.zaki@embetrix.com>> a =C3=A9crit=C2=A0:
>>=20
>>     Hi Yoann,
>>     On 10/19/26 08:43, Yoann Congal wrote:
>>      > On Sat Oct 17, 2026 at 1:18 PM CEST, Ayoub Zaki via
>>     lists.openembedded.org <http://lists.openembedded.org> wrote:
>>      >> Backport the upstream baud rate fix to minicom 2.10 in wrynose.
>>      >>
>>      >> glibc 2.42 added support for arbitrary termios baud rates on
>>     Linux and
>>      >> changed the Bxxx speed constants from bitmasks to integer baud
>>     rates.
>>      >> The macros combine these values directly with c_cflag, resulting=
 in
>>      >> incorrect baud rates and garbled UART output. Use the libc funct=
ions
>>      >> instead.
>>      >>
>>      >> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com
>>     <mailto:ayoub.zaki@embetrix.com>>
>>      >> ---
>>      >>=C2=A0 =C2=A0...ove-cfset-i-o-speed-macros-for-glibc.patch | 41 +=
++++++++++
>>     ++++++++
>>      >>=C2=A0 =C2=A0meta/recipes-extended/minicom/minicom_2.10.bb <http:=
//
>>     minicom_2.10.bb> |=C2=A0 4 +-
>>      >>=C2=A0 =C2=A02 files changed, 44 insertions(+), 1 deletion(-)
>>      >>=C2=A0 =C2=A0create mode 100644 meta/recipes-extended/minicom/fil=
es/0001-
>>     src-sysdep.h-remove-cfset-i-o-speed-macros-for-glibc.patch
>>      >
>>      > Hello,
>>      >
>>      > I think this patch is breaking tests:
>>      > [...]
>>      >
>>      >
>>      > Can you look into this please?
>>=20
>>     Thanks for reporting this:
>>     The patch exposes a hardcoded minicom/ directory assumption in the
>>     devtool selftests:
>>     https://github.com/openembedded/openembedded-core/blob/master/meta/l=
ib/
>>     oeqa/selftest/cases/devtool.py#L1360 <https://github.com/
>>     openembedded/openembedded-core/blob/master/meta/lib/oeqa/selftest/
>>     cases/devtool.py#L1360>.
>>=20
>>     devtool puts generated patches in the existing files/ directory but =
the
>>     tests stage and clean up minicom/ causing both failures.
>>=20
>>     Could we fix those selftest assumptions separately?
>>=20
>>=20
>> Yes, the test must be updated to match the modified recipe. Can you send=
=20
>> a v2 as a series, with the test fix included?
>>=20
>
> The same directory assumptions affect several other devtool selftests.=20
> I=E2=80=99ll send separate fixes for master and wrynose to address this m=
ore=20
> generally.
>
> Once the selftest fix is applied to wrynose, the original minicom patch=
=20
> can be applied unchanged.

Sounds good!
Please ping this patch when all that happened.

Thanks!
--=20
Yoann Congal
Smile ECS


