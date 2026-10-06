Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EF5CA5FFF
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 18:42:30 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2340.1791312143099039085
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 11:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ey9swPhh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so8596505e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 11:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791312141; x=1791916941; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1CWChcvtxKYetD90oUZJJ58UqBRqR6lCY+5k6sXOIKs=;
        b=Ey9swPhhopOPlhhnBAri9MjddhoVrh/9N7ST7Q4S+tHJCk4vyrGyrf2OUq10xoUWgR
         RtRMkBSNWEAETMux5y4aQ1gmgo9Shpwon0zHulvd0P74DjZD4FkoP8yjBi7Ng36bW2vj
         THYuRmea0ny3aF7QNZkXl52Vip2I9WTrfQ8cA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791312141; x=1791916941;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CWChcvtxKYetD90oUZJJ58UqBRqR6lCY+5k6sXOIKs=;
        b=QePa1UooEkMNFc8YHDRYHjRGKs32leoImCoN4rMng90deqrcEUlL7p+ceiy0xLmuun
         RfrJuFxZ2vDtLDe19139A5vrVePGiCfzkZ9VShxNnEq2s0O+o6fb/OBNXe8ADbW+NBct
         hjTxzChZaXcTBE/Cl/aytC6T0usfk/IpbqTOG79lITxY90MoZ6lGViUd0nmPGigMtcXD
         K7Xv9kDtl2zS16kvUMGix0z4sefyGWdPhxHG8Zd5qLIyb54wNqSBQRCFWX4zq9I1E+Bq
         4cDfLvXm2UkvtgJYpIJZmNWBvTsBLIPPGNKRIcJCA2l1Fqykh5x14HvYueL9lbUKYtr+
         wUsA==
X-Gm-Message-State: AFuF++nErrmecjBJYycfqEb1My0pqrKERSQB6CQ8iN2wFXIs4l48xrNT
	9kMdARb6NnvnRR/2E6aJk9UhoUZgogfOj3wksdBmhcEnljYadZenkKRGo1igwrROz3Q=
X-Gm-Gg: AYBFou2igaiKfZZBjGzY1XAqidvMkalytFt8tdUgEcx7a4huwM+JqtqVJnASpklPSUa
	+V3d/owCUCHR7brR2DGdeBjfBg4Db4vpeSb3brJArRcBDcvDspDeNEKQDvHfZWE8YAwzs/MKJ0M
	rRxNSS43OBPecW8WKksuD7x1aw/ULUU/Q52nUr3KbVKAxoBIggKJ9FWEdv+T1PMhSW8y860bXkk
	y1RXLjA8jU8D1Bi5k0g8RbGLJkFhUnYSbiSIkOiB74RdUVerdNye9babXVgSjFB8NIlIMZIhzlY
	fiXoS78Q5mvhxHHPRJuf0Tpc4qu+bi/Gxz6KEN1jlDoP+kGQ/w5TABhC0ViHUWsfmcKgxSwODlh
	zN+BATt/PAvqV3xG7zVEg4gChro0IDsksQKO1Jhly/LJjKZ71puAevbWGuc0a6PY2pdObfuI+OS
	Y9LBdv46jcXIgv3z3odFHTjUSaHzZl9XlFZCyLDfQfz2v60B7r0plTIR5wv0P3fK0wTIOY0pphg
	GVpTmYxAcbw0DxoRhCh1aynZO+4hSQ6bqNpC1oItEBPPMMus/7MstSXmvahlB4=
X-Received: by 2002:a05:600d:864b:10b0:4a1:7703:e549 with SMTP id 5b1f17b1804b1-4a17b54e693mr28539195e9.26.1791312141303;
        Tue, 06 Oct 2026 11:42:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c33:a6fd:944f:6e89? ([2001:8b0:aba:5f3c:7c33:a6fd:944f:6e89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f795f29sm3680605e9.11.2026.10.06.11.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:42:20 -0700 (PDT)
Message-ID: <a6a35af2707fad8c9efa1dabf4c737f2d7bb8589.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] tclibc-baremetal.inc: fix gcc-cross
 EXTRA_OECONF
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, joerg.vehlow@emlix.com, Ryan Eatmon
	 <reatmon@ti.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 06 Oct 2026 19:42:19 +0100
In-Reply-To: <20261006180342.GM4190@denix.org>
References: <20260929072452.2187140-1-joerg.vehlow@emlix.com>
	 <20261006180342.GM4190@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 18:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247317

On Tue, 2026-10-06 at 14:03 -0400, Denys Dmytriyenko wrote:
> On Tue, Sep 29, 2026 at 09:24:52AM +0200, Joerg Vehlow via
> lists.openembedded.org wrote:
> > Using EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append created a new
> > override
> > for EXTRA_OECONF, which led to almost all EXTRA_OECONF switches to
> > be ignored.
> > Furthermore, setting --without-headers here is not required,
> > because it is set in gcc-cross.inc.
>=20
> I fully realize this change has good intentions, but it actually
> breaks=20
> baremetal. We've been trying to debug this for the past couple of
> days.
>=20
> While we run our baremetal in a multiconfig, you don't need that to
> reproduce=20
> the breakage only with OE-Core by adding these 2 lines to local.conf:
>=20
> TCLIBC =3D "baremetal"
> MACHINE =3D "qemuarm"

Sorry, please send a revert. I'd checked it looked like it did the
right thing but it clearly doesn't. I suspect some "interesting"
operator interaction :/

We may also want to consider better baremetal testing on the AB. I'm
open to help with configs there...

Cheers,

Richard

