Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17ECBE88D63
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 21:13:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5149.1775250783700395386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 14:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V0HZjKBd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso1421424f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 14:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775250782; x=1775855582; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eY8EHcf0C4m+nkJKSVu73Dm13jiC4BVKRIQXGeehshM=;
        b=V0HZjKBdvz0i5/dQWYX1k+EqggTrVF0vjiBX/2MjLy+tDaetJXEU6UzhGpA0Kv3OAk
         m/p3FIafb2nJM38/sGfoUjSD+xyh02P0MUOeHxJfC/vqDHCehkHuGQYEbfEDwJfAu0iz
         ghwSsTFyZrzEq6Xi8KDhdT8zmi9fAeRNrgQg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775250782; x=1775855582;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eY8EHcf0C4m+nkJKSVu73Dm13jiC4BVKRIQXGeehshM=;
        b=U/RSAKOMMjcGEhy5wmzl+lV2BwxL4x4N5sukwHiltw2THSgbeFM/oEik47RBJOphXh
         F5ya5Gsctd4bkKcRNPHzyHMeg7Q+Pi6E+cqWmag2VoyrERFob8jnVh1rnrYxLo8egrv0
         eIZW2h67ElAtqEu23O4g+9NaGh+X7FhKeT8S5g3snaqguRZjWzM80CGDsK5ix5c3MnQ/
         jckpsp7zSPsoqUPf9ngQbZTm3l+F30JzUU7gD3zM2ChUR0J38hi7EXjGMavrE3yygEy8
         XbzUd52C+Gu2mfjxMuoTCjnXhvGQzFuhJhzp9NpWot9agvRaaqxYFmUqaTz8kOMaYt5j
         X50Q==
X-Forwarded-Encrypted: i=1; AJvYcCVm9kfSskhMpvKcwtgmZ/3Ho+9C4mIFXtJv5wglq3RLu5emASuFCqmyk6Hl8cAg++vB0rMegjkmzdvzv6IJHDOdNg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw9IIy+QMILKvbmE61+zajV84c6sEsOrDQ3PO8Q/xPwmtevkjHm
	IN81PiFkXFVgZcasrS4fRHUduzpFbl0b34hJpawBDucUNDimJAajjiMuyCTbkS7FXdo=
X-Gm-Gg: AeBDieui46ZFySTM92/CJrn3WXpBLMDbr+6/zCiM21DwcIjtuddU9SML8nUO1JvRZnn
	nz6UfkoE4YBopcE9hqmDjeZ6pbGCVcj56r5Tn1kFHVHAtBIZeh0zuIm0pWDiGDFqHpocxyokgEa
	/ljFeNnbvYX0dxH69pyYLQbk2hJ7dT7jJOo1xD4qoFI/IUDVyWKKs5LgWiw+mEOPvCu3l5+xdDl
	y2dG082zWpVn1FtstGw/ukAKAyp68ufYajuSqFaJD9P2nDtH9YlK12o+JukFo9tvBM0YYt25BUO
	z+sr2YsM3v1za3yZawpoRrgV/VCZu0jFG9ltI4Plo7ZLUaT5BqZZJEkILRyP3bskHolUdHGQpqi
	9SQSJ0UyL9OA2wdASSjCUHOLbbf3ZL8GDuFryKU+MdP0r/GUM5xqCqcIKFOlPykKe+t8KZlVujL
	wVpwpTBw8VDz475QmOuu4MiA22ojI84H+QGgqDKNMSF0QjnrMc9YE51ay0znjMF0Bid98qbkZLx
	1GNYG5P+Mq/fFim
X-Received: by 2002:a5d:64c3:0:b0:43c:f336:7ab5 with SMTP id ffacd0b85a97d-43d292cca1amr6500447f8f.22.1775250781976;
        Fri, 03 Apr 2026 14:13:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3136:96a7:2030:b47a? ([2001:8b0:aba:5f3c:3136:96a7:2030:b47a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f52easm20277514f8f.36.2026.04.03.14.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:13:01 -0700 (PDT)
Message-ID: <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Mark Hatle
	 <mark.hatle@kernel.crashing.org>
Date: Fri, 03 Apr 2026 22:13:00 +0100
In-Reply-To: <20260403183541.2631883-5-twoerner@gmail.com>
References: <20260403183541.2631883-1-twoerner@gmail.com>
	 <20260403183541.2631883-5-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 21:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234599

On Fri, 2026-04-03 at 14:35 -0400, Trevor Woerner via lists.openembedded.or=
g wrote:
> When "wic create ..." is invoked with a bare *wks name (i.e. without the
> `.wks` extension), wic calls engine.py:find_canned_images() to find the
> fully qualified *wks file. This function searches every directory formed =
by:
> =C2=A0=C2=A0=C2=A0 - permutating all BBLAYERS with `/wic`
> =C2=A0=C2=A0=C2=A0 - permutating all BBLAYERS with `/scripts/lib/wic/cann=
ed-wks`
> =C2=A0=C2=A0=C2=A0 - checking `<scripts_path>/lib/wic/canned-wks`
> Where `<scripts_path>` is the directory containing the wic program.

It doesn't. I just looked at the code and it uses BBPATH. That can be
similar to BBLAYERS but it is different and the commit messages really
should refer to BBPATH.

> When wic is part of oe-core, the last search path succeeds in finding
> the canned *wks files in `<topdir>/scripts/lib/wic/canned-wks` (since
> the wic program is found in oe-core's `<topdir>/scripts` directory, and
> `<topdir>/scripts` is not a BBLAYER).
>=20
> However, once wic is removed from oe-core, this algorithm will not find
> these bare *wks files in any of the above-mentioned search paths since
> the oe-core layer will no longer be the home of the wic program, and the
> canned *wks files are not located in any directory relative to BBLAYERS.

I'm a bit confused by this reasoning. Are you saying that wic will no
longer search BBPATH (or WKS_SEARCH_PATH)?

> Since these *wks files are specific to oe-core's meta layer, they should
> stay with this layer. Therefore move the *wks files so they exist in one
> of the locations searched relative to oe-core/meta's BBLAYERS.

I don't understand why these need to move given WKS_SEARCH_PATH remains
unchanged, unless wic is going to ignore WKS_SEARCH_PATH going forward?

Cheers,

Richard

