Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0475CD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 17:01:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12682.1780678911892377146
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 10:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PFqGfN3T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490af320e2aso25214585e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 10:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780678910; x=1781283710; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgaZzKVzZ+aTpZPv87aAoH2Z7i/rYZ625MvVnhWhZoo=;
        b=PFqGfN3Tvw9Va8qH5VzeZZW/amn2BD69xjP0rSkRgKjPKUVG5WavpSUZK/n2oRnJaL
         0J1gJjZWJIntdITeplx9Y7NTiQ+WG+MVloCqeYCQGlonNNLpoSGd/J3TXNjSRbqlnIXY
         uxN/4pL+BQByDG/BZ8A1DvFjmtQQuyRe+74mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780678910; x=1781283710;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IgaZzKVzZ+aTpZPv87aAoH2Z7i/rYZ625MvVnhWhZoo=;
        b=JXaXF1LVMsmwNhWHQkxbPuThrbmSxZfU5hp+eccvtUspQ5rqkbrPMQSyn4L3FpFotl
         DhwKfhgQA1mNa70w/yWNo0p7vDhkoFCgm2CKkBNNp2nyG/V0QffBsa1Zb9hPbmmStNMe
         qSrG6jHym0YTMTehHVFlD8Lv8DEVQGs9qd4cCbzVzb2zExFY5BnSnTmnO1SQn4wK281o
         GWzEgayfXYAwhM2y8yFoZVbA0a/d7E3e8v0otsubY4RsEE6nvvAskOLJqX9w2XZXWWwf
         d/DkJbeE7OkQV/ZXqQOZv0HK22+2gzlgoZbpyL7Xg2qNbXVzOP4vhxxu0hqQESvJExka
         cChg==
X-Forwarded-Encrypted: i=1; AFNElJ/I1dzLVs/RydKGYN1tMjuVroyFldmRoeVqrpsvrY2VfhdVzc65ti49OO8H/QaoCpNw7B8Jz8r+qsc+gwM0Tt9HIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHmL09N739CI4cN8UR+x/JypvLNUrEKobEix1klAKkAU9WYB45
	sGYK8cYpuzvlhXC4zZwFeRwpVvdkzxFfWCBH++Lq02Ro+nUSKs5UjNgtDd4+l7pIbrg=
X-Gm-Gg: Acq92OGOVof8qygio8CqPrCydhd0VeFdfld0Toj3C4ZDJ3oeog+++wt2h8BpF7OBeUi
	0bEP5KAXemI10VcN3Z6uWEq22n3ltx3MVjSTiQ96WUSs7TWL9yhrKxHGmGO0xedN1aFoSQN0nuR
	9UpOBzz8alyHwBECNn4uswKNgdp35IZMSok9i42tMf0UcWMtyYU5/Xdqsxg/KYQ9WmH7LLZwb29
	C2BfKElXvvYbLF6uMfZlK+VlClYWwcZ5GN9LglUg2fpWPGuvV3FyeEQfp53rfB9RxTXkKzFETf3
	hhwY2idsswbN7D3y81dp10q1vQ6f0DchEx1KiAspyfOPskfaxYamUJU1mPciVIKe2Qe3j6xcjRK
	7k50nNE0do50o0YpQGZ2NWyULSma2ZCG08u7wa/p3uSaW+ABzRSsPdAlgafZY67GXGConojRYd0
	jNwGDKcf6CZfYLJ4DXLUlbd/QRMcxP7aXvByq6ULJ86142J825O3s8DwNk9JDs+MV0A+ej/O6Tz
	b//GWUMdiJ8BhBeVnflqBK+qyU=
X-Received: by 2002:a05:600c:4fce:b0:490:5cd8:d21c with SMTP id 5b1f17b1804b1-490c25b3556mr81025305e9.14.1780678910117;
        Fri, 05 Jun 2026 10:01:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:176b:6db2:d527:85f4? ([2001:8b0:aba:5f3c:176b:6db2:d527:85f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc4082c3sm160957125e9.13.2026.06.05.10.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 10:01:49 -0700 (PDT)
Message-ID: <31be192fad3a35a7ef53344d7a2186f446e38ef8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] python3: remove obsolete skips of some
 ctypes tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Fri, 05 Jun 2026 18:01:48 +0100
In-Reply-To: <20260605151511.3522627-3-ross.burton@arm.com>
References: <20260605151511.3522627-1-ross.burton@arm.com>
	 <20260605151511.3522627-3-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 17:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238179

On Fri, 2026-06-05 at 16:15 +0100, Ross Burton via lists.openembedded.org w=
rote:
> These two tests were skipped in 2021[1] as at the time they required
> dependencies that were primarily provided by packagegroup-core-buildessen=
tial.
>=20
> I'm not sure what this dependency was, but the tests pass with just the
> core-image-ptest-python3 image:
>=20
> =C2=A0 test_find_library_with_gcc (FindLibraryLinux.test_find_library_wit=
h_gcc) ... ok
> =C2=A0 test_find_library_with_ld (FindLibraryLinux.test_find_library_with=
_ld) ... ok
>=20
> [1] oe-core c6567235cba ("python3: skip tests requiring tools-sdk")
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/recipes-devtools/python/python3_3.14.5.bb | 6 ------
> =C2=A01 file changed, 6 deletions(-)

Doesn't your previous patch remove the gcc dependency?

Cheers,

Richard

