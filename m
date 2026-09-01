Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1C4C624C6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 09:10:58 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3477.1788253857714578736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 02:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cS8ptDow;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso4431955e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788253856; x=1788858656; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOqvGSEI5wRxs3a4Je+nBdPPprfyyA4hWxadiau9als=;
        b=cS8ptDowo35N1XIolQtKLEgbgZ++GIgfhOfjYbqmGpGQvKxWKtpf6GRxqQQ4xLllQO
         aK07qWbUPrW7UQjtbuTvYC9Gm6AAiMvgdLYDrAbHFR3TFgkCN9jB7Z/oSwpxxLugSla/
         oCmYYk5oVeNwPqXntcdorABS1WELIKP8NGK20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253856; x=1788858656;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOqvGSEI5wRxs3a4Je+nBdPPprfyyA4hWxadiau9als=;
        b=ckQkJmFhg3/RJu02hERgkFtS7otddHHiqsSwkc40IKcVrQUeYGMpAb51GqMuYQINB+
         tySKYCx6QGCu1UN0VG/KHE0km9xxMY1xlpxj58GB6iFTGQwrsTdfIq4SsSEwNYsQ6TAl
         hXCvhZYTwKonNW6yJ+SIvKYSQLkmeKXxbjmkjPTrGWNhLR+KG3o4dS9Uz5Vj2P/ZImZI
         KMRnt/bKatsbELOj/IHCK5PNvNmhv9CyYRIzSx9hY8IOeDE6p+AYCTxgfNP791Q0iBnD
         /TfsLsHdP1sQZpVcm1S0j3UBPOIV7P0b67A4Mi7ym1vvZVr6nqEZIOaD7iWzpsER0Y77
         Garg==
X-Forwarded-Encrypted: i=1; AHgh+RoQDtRornD6QDeFFbxa+Yv3RSY2xFJ5HQ/bOXjoE2ZFCcXPROf6ltTV0HNa/v/V6GaOZrG9p+gvG4AROqnTTKXt8w==@lists.openembedded.org
X-Gm-Message-State: AFuF++nRwZZ9Jp1i7V+/3Cqw0cXwy7rkWIVbdmHLzLVGVa9VfuuUDwSw
	SST4IUl3AC82Q0J2XHseNW7UB08I5EYL5AT2bK6Gm1eP8P0y2GHB9OqnUoXyUKps1n4=
X-Gm-Gg: AR+sD13YdUEc91FvRgaWGI0YUbU62xlbQ7eDw/+l7pPRZ2NQOVcMmy8U4aDC2HKm6WC
	dy/PxSfm9xG/f32azqkuQon5m/kEk7UHEdmxWP/O/19kerq/YCG6eCxwZyznm5vHIWZMwfsB98s
	Mt7kDW925Ni3kNdynduoFRqeclUL0V2IDd3sG8D+8I4zdlnpdZ1OrNIQbyGp3Uzir60PjoVq3B8
	cKkY3vJb8eyFzXINBqlJnHCteJiB0UoshRBMTbDXnRPVsbLCSpnOH/t6IqAM3PpQIL+/+2bD9SC
	osH89R50Eb1pPaiDWEvWHrzG1A6TTnN21OEeGXpbaCmBc2mRko94Bv7BiJtRFjAz6ZajIjrDXcD
	Tf79fJk6UlM5JAvBINxI6cOdyx5XAvGRReFRULCY1fcJQLHqLK0k0LXj+Jp0GovoUHcGHoVofjJ
	n3b3+pU4+wYqXOK3/Yid44rFSwYaQjcD6aA1sAVcNYy3QTGk+O6NkXS0qAyo0vY9hSDGbmx/wnB
	gReQFj9hYuF41gRJVNsTsFBeFVYNyssRL6OMX9Nn+5SJ/pN
X-Received: by 2002:a05:600c:354b:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49b91c4fb4amr478002995e9.10.1788253855578;
        Tue, 01 Sep 2026 02:10:55 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccd1e19desm313257625e9.1.2026.09.01.02.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:10:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 11:10:54 +0200
Message-Id: <DL3V33TEPWDN.ZM1L9P29KZF9@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] python3-py: ignore CVE-2022-42969
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260826053217.729875-1-dkelaiya@cisco.com>
In-Reply-To: <20260826053217.729875-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 09:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244812

On Wed Aug 26, 2026 at 7:32 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Analysis:
> - NVD marks CVE-2022-42969 as disputed because multiple parties could
>   not reproduce it and argue that it is not a valid vulnerability [1].
> - GitHub withdrew the advisory because the available evidence does not
>   show a valid, reproducible vulnerability [2].
> - Wrynose and master use the same python3-py version and carry the same
>   disputed CVE status, so that disposition applies to Scarthgap [3].
> - Hence ignoring the CVE for now.
>
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2022-42969
> [2] https://github.com/advisories/GHSA-w596-4wvx-j9j6
> [3] https://git.openembedded.org/meta-openembedded/commit/?id=3D91f6b85b3=
6316d5940ee194b1d195caf3ac040b1
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 ++
>  1 file changed, 2 insertions(+)

Hello,

This CVE is already not in our metrics. Because OE-Core/scarthgap lacks
these commits from meta-openembedded:
* 1fac509459 (python3-py: set CVE_PRODUCT, 2025-12-31)
* 26fa8b053b (python3-py: correct CVE_PRODUCT mapping, 2026-08-21)

Can you send a v2 series with these backports added?

Thanks!
--=20
Yoann Congal
Smile ECS


