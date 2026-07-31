Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405D0C55173
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 21:23:39 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1736.1785533016471014805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 14:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EmHmelxm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15b1da6b82so163259566b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 14:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785533015; x=1786137815; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZvLVWBdF7vt5rGrVWys5SoRAXCM24GiBKOAYpJOP1ds=;
        b=EmHmelxmv2gzNkgb2huPVafmDA+7FQcRQ9AXags+jelbL+W3NKhhUYgcKFzdt85xPD
         jquwAzNH/o8sa7nvNqSaQrN0ciP6UNpVnyH+bt2Soq+neuPjdvlTFYTJ92jzNGGqca/A
         GDuelESZpZyFi+6RYHDG/lr1oljdEKUulpXaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785533015; x=1786137815;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvLVWBdF7vt5rGrVWys5SoRAXCM24GiBKOAYpJOP1ds=;
        b=hIj6VYZmzxtLLcwCQMUfQei8qnl9hOr4Gcui5i8quzCbTS+ArLg80307KPtzemhrEp
         7i7socxNV6t2RDyFcDlj3aKZgkJuMeL5cAT4bslQ4S3J0gBA2zwTjakD/jkriGlfTlwT
         unPPeEloPaUY1Oi/sWKVjUukccU55XGndTQGuHBf6lsUwU2ckQ2IPcxgVmDi42Wr9pmJ
         JHSY2VAgNH2WJ2MIHcI9K2/mE44UxVyI/csfvIPs+Kb0+aGU5MG+FSXtF0t8NOzwlCpP
         vbJEqnUjopLaqAQ7EEOKbOCs2MxN/aPXdG+c+xGbHCAmE5aN0Jb7BlefAdnQ9jlhwPnW
         ecrw==
X-Forwarded-Encrypted: i=1; AHgh+RqVDwYC6Df/l7lWPQH5Tqd/+xT9dFQpEtxPI/PHu3zd4ARKtFukjHYwTs4V9dMCLELM9GF3cD2lgd5Jf3o42OvC9Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRLj/CdB9+ELTpE3Mwt/L8sg/0OFrWJSEPaXjoXlyk1mlvRjfp
	IHTxSVql7M32B9b9c4hyE//7u5hY/3BAocq4bi9zLBjKHcBoEmWH+TIij9O5YF5RQf4=
X-Gm-Gg: AR+sD11x7K1ZqwzpMl9Ro3XMEWnDod0B/tAzYBhrIWVVPDfGhqoIta9d5Oqdybpcuoo
	lh5boG86R3bNZGP8wISinwgQRmDaTJO0TeJVOZPczhwd3kchTrm/R77h85asSBdeHG5cy+c1Z+j
	1rsE1RlymW0U/LYT6A5QuUIXf+bNMIrBJLKd4zpaxwl5iv7ayAkOaqzRuztStHtXqJ/Nd8ZEmQH
	tKAuE3IGIQ7G7PwEqW63fK4cCppm7ANlWLC7HHz9ZQAkGxcYcfZ2WtPKOSfSbwDLSFztiDs6iuH
	Kwm2mjhJuvEqudwZzu3QK0w5r7Q3ag6OdhcCRoxTz5oSYiEqhKg5u+PZL8AWQcTpIg859ncVcL/
	N6AUB+PRHT6xJg6e95ui7rPcWziqiG2qELh333KBLGG81LREX6W7CcASc0UYiGU6nHCOgGA3GYs
	vN/ba9YCf6bhh4hiSvValXaCdG2dNYN3ZnEHptrf/WVuYcM69WRWRY8GUKx4rTzmXX1v/WbjGUT
	yFvPvizkGvNGntgVLvwPILvnvyFyhKmygHpot5BYHslDdhL9og=
X-Received: by 2002:a17:906:cf91:b0:c19:4676:3ab2 with SMTP id a640c23a62f3a-c1fe80d407bmr59227466b.26.1785533014587;
        Fri, 31 Jul 2026 14:23:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1961:80da:242:a654? ([2001:8b0:aba:5f3c:1961:80da:242:a654])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4537755sm261539866b.54.2026.07.31.14.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 14:23:33 -0700 (PDT)
Message-ID: <c1bcb1b1329f65e9a2598fbf561583fbef10046f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 2/6] wic: add a shared helper tool list
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2026 22:23:32 +0100
In-Reply-To: <20260731152810.2641327-3-twoerner@gmail.com>
References: <20260731152810.2641327-1-twoerner@gmail.com>
	 <20260731152810.2641327-3-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 21:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242455

On Fri, 2026-07-31 at 11:28 -0400, Trevor Woerner via lists.openembedded.or=
g wrote:
> The tools wic shells out to are listed in both wic-tools and
> image_types_wic.bbclass, and the copies have drifted. Add
> conf/wic-helper-tools.inc as the single source of truth.
>=20
> Only wic-tools staged tar-native and util-linux-native before; images
> now get them too.
>=20
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v5:
> - new in v5
> ---
> =C2=A0meta/classes-recipe/image_types_wic.bbclass |=C2=A0 5 +++--
> =C2=A0meta/conf/wic-helper-tools.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 ++++++++++++++++
> =C2=A0meta/recipes-core/meta/wic-tools.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++----
> =C2=A03 files changed, 22 insertions(+), 6 deletions(-)
> =C2=A0create mode 100644 meta/conf/wic-helper-tools.inc
>=20
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-r=
ecipe/image_types_wic.bbclass
> index ea8c1c94ca2f..3f25b7912b26 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -112,14 +112,15 @@ do_image_wic[cleandirs] =3D "${WORKDIR}/build-wic"
> =C2=A0USING_WIC =3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + '=
 '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
> =C2=A0WKS_FILE_CHECKSUM =3D "${@wks_checksums(d.getVar('WKS_FILES').split=
(), d.getVar('WKS_SEARCH_PATH')) if '${USING_WIC}' else ''}"
> =C2=A0do_image_wic[file-checksums] +=3D "${WKS_FILE_CHECKSUM}"
> -do_image_wic[depends] +=3D "${@' '.join('%s-native:do_populate_sysroot' =
% r for r in ('wic', 'parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
> +
> +require conf/wic-helper-tools.inc
> +do_image_wic[depends] +=3D "${@' '.join('%s:do_populate_sysroot' % r for=
 r in ('wic-native ' + d.getVar('WIC_HELPER_TOOLS_DEPENDS')).split())}"

If wic has the right RDEPENDS, doesn't this just simplify to:

do_image_wic[depends] +=3D "wic-native:do_populate_sysroot"

?

Cheers,

Richard

