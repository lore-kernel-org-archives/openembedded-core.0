Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D97FC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:37:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19400.1784900256588691797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 06:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kMJT1n8T;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954aff6088so3916315e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 06:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784900255; x=1785505055; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVuF3AE/ZOjyU0Cd+k8m2aZow0CCyPr+2DcSM5H8m6U=;
        b=kMJT1n8TMjEbtq4QGZvIOZT2Rv/562k0O5Amx1QjgbXhTO1BpU0yqcV2Z6sEDeNaeQ
         aK3uyKiZP2Xn6M9MccZvsSEHTzZ92y8vmAoRi6uIzAk+2gCBYsRDymb3g4Td2OuLcn38
         aIVnDTySn3FGTZwFbjDuwkCgCbSleghGB68wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784900255; x=1785505055;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVuF3AE/ZOjyU0Cd+k8m2aZow0CCyPr+2DcSM5H8m6U=;
        b=EKHxebyvDpkcWDtfdd8LPpc2Vu44yGfTWyTmTfC2xTtZSfRB4V6ljdFjGh4tjRMg9a
         ydiowSVqHr5dg7VDzFMYgn6hCjE4FZ6BvW+zHthnDH6JyKdvR9cyoPkDDBjX0bSseSt7
         i7pT5unPIgpE9WQlDNFhra7QvBRKUAiucBZXkBubHIRDQPJU0wHK/4bGtDVNMemt8RdQ
         tnJm/wgiyymxOZVuunFyFbRSCoYgIWMf68JT4sUderjyVeZM7h2zGo0BjGM7s77Wt1Dt
         a8hOjU9nkWtIa/cuRaXhrLMRMrpBKsdwpte+UgC66KAtDH/c/ZZLd/iqd+w/rBM4jFvJ
         1u0w==
X-Forwarded-Encrypted: i=1; AHgh+RrjpcwqS3HHbNK23pasgaHwKoiD1LqbSGmYH+k4wTXj7ZWqLVnfHoIu2T2Ks/Onfawct2Zj9eDJRsn6wLWk6gehpA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyPpmdtKej4bsSpljev1DpiAFtv2tQIA0VCU1QYYPGel0lhVMyU
	LESVvFwcNiZSNGF9WThcomizyE0Yau5kfQLGC/xYS74gyHZqA66xz5KPI9FFXQb0paRa4o0r1am
	PwbYJKnQ=
X-Gm-Gg: AR+sD12oBG6wQ6DwwQGuBsdfAa5pTyKBN5LWgsmxoEt/YP8/Xjpel9sfH5QI0zG3ya4
	QA54Dc9+MHsQs6qd1f1hCMKdvj1/kWTVN6zw1r07pjPHCrxc5UCjXIR03xXjcMTfWrPHc6YETBx
	8yu/CgwAPP6is8mBiKCv7env5wG2F9wjp4ENXsYXTV37TDTSynhShFApcuiVopU1liKcdaS3eOD
	RN61AOiselAu5gkQdnbLiSZllb85ravcvW3+U+hFW0QCj/SR1kzDxD6uTx2nwjbPCE7LlLR9tHa
	AMrdVmsJKOCQZIai6gs3arijta1yTPg5GNZCtyrLF73nT8jehLxMKjJDdEy00RZPYyIT/14hHqc
	PDT+7JEFZmbVYtTNzCCh/2/WtV+MPpiRly7LIR02un9z/PAssRVgCtFT+BFFsGNazFd0h+sNjlr
	Av/VUxlychlwnDJ3Y8aFlL0lWi/DK/9XTTHOcHopvpOU/zwu6CJO4pabbo1yUejBaKBQ==
X-Received: by 2002:a05:600c:3111:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-49573c996e7mr85602185e9.14.1784900254836;
        Fri, 24 Jul 2026 06:37:34 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957afb4e48sm75012895e9.13.2026.07.24.06.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:37:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 15:37:33 +0200
Message-Id: <DK6UC0KOO8FL.L4BAC2TBH0Z6@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH 1/2] perl: fix CVE-2026-13221
X-Mailer: aerc 0.20.0
References: <20260721134543.16442-1-jaipaul.cheernam@est.tech>
 <20260721134543.16442-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20260721134543.16442-2-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241935

On Tue Jul 21, 2026 at 3:45 PM CEST, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> This patch applies the upstream fix as referenced in [1], using the
> commit shown in [2].
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-13221
> [2] https://github.com/Perl/perl5/commit/03f74bbbd3a68350d926ee93d56ee480=
8c28c4c7
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  .../perl/files/CVE-2026-13221.patch           | 75 +++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.42.0.bb     |  1 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch

Hello,

For my own tracking, this series needs "perl: upgrade 5.42.2 -> 5.44.0"
on master.

Regards,
--=20
Yoann Congal
Smile ECS


