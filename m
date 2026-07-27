Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2973FC53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 09:31:36 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27588.1785144690452829663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 02:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=31zggvnW;
 spf=pass (domain: smile.fr, ip: 209.85.218.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso368006366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785144689; x=1785749489; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c71O/t9acLrWVilEQJGV+s8FOMYGgZVXkox3KcYqM0A=;
        b=31zggvnWkMhWo2nh8EaUSL5bPtzlYvvQb17JmbzpzUhP4K/0qFQ1PAxTbh+qnpmY1y
         PhPJfBAMRxR6Iy/5XXtu0BIQBB7EDtxE0xiZJEYUuVDrvCMD+EiVoWNBb33vRm4sceHM
         COKfxLbq54iu5Z1BX1B4Op7sdhVwZThbQQmRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144689; x=1785749489;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c71O/t9acLrWVilEQJGV+s8FOMYGgZVXkox3KcYqM0A=;
        b=ATT9nQZIWZpsq3bfus11LYWc3CAfrtUEHxjH4eCacWVcfW4nkRazleJn+frN4vYAKN
         VgeL3nokSFnXiIGuf+g/scPuf0g2sX6BbKup3umnJr6DgUCMVI+G6pyxf9r2GrV+6A/d
         6xVcXHkVA10tX0mDNNSwI9fgdzQKoD7Yispxb6djUl2PfdK1CVznkIHAmqmn1QHtQFn7
         IMCWzLqp8NcsUNJhdBmP56MU4wTYDICP4od8noELRY2lMq+y58s7YGFQbTo63rv9kyx1
         XiPFs5OAw42oK9C74qfNSKsh9ldbV6AbvTYSuu+Q6sJYiRqsa2UnzJs3/LYvcfbKoPWR
         emXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqi02JZ+ExRXO32yk7d8M1859Ge05mcipHhjArUo5OIo6diVonrMhJvUj0kSMReCNZy8b25PFVqrqB0MRVjb0xUyw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6wNOnJ1Y/ASTlkFCB+mvV7x3PmdrCr0lkatPUaX/W4WrzQbXf
	LNd2L3xhm2m61alr1Drn0ljKtr3oDTuA3tLOTKN82IqUdYBgiUV0Ff1hyAOK5dM12BU=
X-Gm-Gg: AR+sD13H5Sq1Ekg4qK8SFA9WR4icvvCEVFVLm2o74GrZ6bDTFS6IyeONdIVtRn6sfXy
	CmQusIxrK5hX5i7BOW38++41QrL+wWAUMdNJRNqvrd13GebDRQal/SpLDKuINV7J89r5OIweL2X
	k5TE2/+Zfjtd45HVuAypDn2udYvpJyH2ZraC1TPb5Yjcw+31V3i9uLT8HcbAEvKO8jHlgWRM5bh
	lbIOHpK77bgloNlAe1pBmpymqt3XVTa6QFz0vy2/zrW3b3Ztt6Tc57u72HzZZ/iId+7Sw80qc6F
	VVQ01WlafOOEVdYJn05HsjKQSqW8jm2RV2oceShy3Z4acpCaBmPo+Lr1YIwXrk12PkWJag9Jmwc
	rsTpkmc4gZcGa2klDv2uERyin5+UpePa6z6uzBou5TSDtPZqRLxpii0D8RpGsC60G6Snb2lVGWe
	hC9cA1k2X0HtIXYolmp54AhuZfApVL2Rx9+J8V8Q684VnfIrgNqTPYBqkvFq2p7Ctxi3tzylp6
X-Received: by 2002:a17:907:3f91:b0:c1c:3b06:ed19 with SMTP id a640c23a62f3a-c1f1f02642fmr343329066b.31.1785144688574;
        Mon, 27 Jul 2026 02:31:28 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af244asm603720166b.27.2026.07.27.02.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 02:31:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 11:31:27 +0200
Message-Id: <DK98Z84R3656.NSM63Z6182LJ@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/2] patch: Fix CVE-2026-56289
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260723084914.2718150-1-hthakar@cisco.com>
In-Reply-To: <20260723084914.2718150-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 09:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242074

On Thu Jul 23, 2026 at 10:49 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix referenced by NVD in [2], using
> the commit shown in [1].
>
> [1] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=3Dfaba04e=
f4f2b410257f76c1b9dc85e350929c4b9
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-56289
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  meta/recipes-devtools/patch/patch.inc         |  4 ++-
>  .../patch/patch/CVE-2026-56289.patch          | 36 +++++++++++++++++++
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56289.patc=
h

As fas as I can tell, this patch is also needed on master.
I can't merge here until this is fixed on master.  Can you send a patch
to fix this on these branches and then, ping back here?

Thanks!
--=20
Yoann Congal
Smile ECS


