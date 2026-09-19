Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3D9C982CC
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 21:49:42 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20081.1789854572860366442
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 14:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OA5Bl2p+;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so25292765e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 14:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789854571; x=1790459371; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4YbJFMulYDfR/nWF0Tzpr7LddFocYWUyz6YEV+yP2lc=;
        b=OA5Bl2p+Aqo4D9iPYujYrsExwCG2jpkymXN2GpSYZ6fY2yN/A2fMZS040E48mHM8fd
         SGD7ViqP2ojtyRLi5DT8O6xXi5Es+n7O4/kkpqQNiRyfDS/9ZxMYL/8xjyBgRvHKhxjV
         QEhWyqFxjf9o2kKnH+TKEynguPDePCz0HsYJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789854571; x=1790459371;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YbJFMulYDfR/nWF0Tzpr7LddFocYWUyz6YEV+yP2lc=;
        b=yBPjgcJHQ4JqZU+HtlTuUbhjFV8/Cxgv9t65NJIw6gcidM3Wv0Abhds/ISjU7MuZ88
         i85xoO4fj0Ty6Rp9hLrRMoyQJc+OgGPs4n5C2uL5ImzST4vxl4P1NajjCX3aowsUhPUG
         hNQl4tnJ7KFVpDsmo9Cs08wfH5LBtflCalyJdLOTxirqpfkuCmVvWRk3rwAuU3QfnGSJ
         WG49IMqrlsIfUlJRjxd6J93Fu5QpEFcCSmHastpojovM1DUa9Dgg5uvoO/T5FGA5HuXH
         GjYFFPFhEDAAfd54JBeH8JPFQtbGOQGoo41aLuRhNNKBNK9oGt3U++4cXjBiFNRlsBF5
         YLhg==
X-Forwarded-Encrypted: i=1; AKwUvBzz2DftpAr4EPVWFwpnOBURGTMRKUn6n2MPFzq+XT2Tud4I1jE/uhr2OzCj9eQXolqSKZwplXN30YkRffF5Okxyvg==@lists.openembedded.org
X-Gm-Message-State: AFuF++nk/Du3IYu4Skcd4a5UgYpouY9bAwxHAMJY/XI6tjoseOBCrtJb
	G1EL5dKxYe5iW+yUT37ggCYyJieCPACzYmf/tBmwAmtC8e3ucmT4QP+D9X2VWGYNMag=
X-Gm-Gg: AYBFou0e3ZIWRG+G2/cMLPE1R46hJr0BPGpNuFGpe62VZ2VVSVRK05TviAyWxQphqjs
	eRlv2Udof4549aJoBAvLqEHpZ5quqDbRhceIqRQwp6VvZ6/Jt8I+D7BK0ngUKM/HKRe8p0psMra
	C+KwWBmKp6UGU3bfs2l0yivK7BKd6dUa8cuM5Pib+T9CKeIa75MzD5BDFrMnxp2kLo0BelDDKTi
	MtmD86cbrViAgoP4b/Wms4gQDSqRU9mkUgYQI2exj+Ah0Hu7S00DcNqGkK1SyCNqJLEagyvUR5a
	PxMnJs810rlEOk6Ru45FNvm/yVQEwYXa00fnB5vP80szg1cQ7I+jqa+AE+/n6bThjUupb3Om6By
	g86eA+DIDk6PZ2QLmh+l+epnxsrmREZVMyByWF7b3wRm/9rhSR8X+p5FOA9cObpmN5dlQHZ1lgX
	/3BAeRawV6VFNH4LIfZCK2MX0Y2UgHv6YwORlyIRcEaZp2tSSkHD1SjP+BuJ5Lv0POrdAkEvJgl
	92Hg3KbPZ/kgD/XWfauE+VBEKCnR3i+YpsOyz4AgrS55T2sQRZVqZLRURziLQ0=
X-Received: by 2002:a05:600c:8b81:b0:49d:15f8:2bdb with SMTP id 5b1f17b1804b1-49fc568125bmr80170245e9.7.1789854571001;
        Sat, 19 Sep 2026 14:49:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cf1d:93ec:a8bb:f81d? ([2001:8b0:aba:5f3c:cf1d:93ec:a8bb:f81d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0ece6esm145607435e9.2.2026.09.19.14.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:49:30 -0700 (PDT)
Message-ID: <3dbfaacd3f9ee5656a5005daba1fa57b01419a12.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemtap: Upgrade 5.5 -> 5.6
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Sat, 19 Sep 2026 22:49:27 +0100
In-Reply-To: <20260919140957.80166-1-jaipaul.cheernam@est.tech>
References: <20260919140957.80166-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 21:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246246

On Sat, 2026-09-19 at 16:09 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> NEWS: https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dblob;f=3DNEWS;hb=
=3Drelease-5.6
>=20
> - Clean up python2 support in recipe and clean up obsoloute patch
> =C2=A0 More details [1], [2]
>=20
> - Added pip/wheel native to the python3-probes PACKAGECONFIG =E2=80=94 th=
e new build uses pip/wheel
>=20
> - Added two patches to keep do_package_qa passing. The generated
> =C2=A0 tapset/python3.stpm recorded the recipe-sysroot path of libpython,
> =C2=A0 since it comes from sysconfig's LIBDIR and python3targetconfig poi=
nts
> =C2=A0 that at ${STAGING_LIBDIR}; @cast module names are resolved verbati=
m
> =C2=A0 with no --sysroot translation, so that path also made python3 prob=
es
> =C2=A0 unresolvable on the target. The pip-installed HelperSDT module shi=
pped
> =C2=A0 __pycache__/*.pyc naming ${D} and a dist-info/direct_url.json nami=
ng
> =C2=A0 the wheel in ${B}, both artifacts of "pip install --root".
> =C2=A0 Reported upstream as PR34652 [3], patches posted to the systemtap
> =C2=A0 list [4].
>=20
> [1] https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcommit;h=3D3c9c8a81=
63e0a9c77bf9a3a7f87ceaf2d3de98b5
> [2] https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcommit;h=3D55a01686=
13e765f6be5257b0c4fb97678292716f
> [3] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34652
> [4] https://inbox.sourceware.org/systemtap/20260919135744.78642-1-jaipaul=
.cheernam@est.tech/
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

I think there may be a reproducibilty issue in there:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/5022

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260919-l3njlk0p/=
packages/diff-html/

Cheers,

Richard

