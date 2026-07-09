Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41058C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 21:05:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1242.1783631146616363921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 14:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hTeIE3Fg;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4759b4f0897so205825f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783631145; x=1784235945; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pPDHo3TOftOiQqu+KqJ508SGLUaTIGl1VbuJgdoW+YI=;
        b=hTeIE3FgvcTMIB44lA8jIpKLL2/RZKTreWAkpGnvSaLlmQHEiy12195b0Eazq+ECqz
         dr8SlMWD1CWVo5z+00uxt3N6hnbgjiZFLEMTVxvN6GavRP6jQjWZYdP5m8+F68OkeyBy
         uTVPhEfd7VDlSBYbV+yrFuetfZrjicz5LicAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783631145; x=1784235945;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPDHo3TOftOiQqu+KqJ508SGLUaTIGl1VbuJgdoW+YI=;
        b=WKstlndeYyZOaZb+b+IwB020qtJN0rfC5FvW4v3wzs8IrNskwuWT2BZmuws1tsEDWv
         S50wiWAHv0Vi86fqANqRJyRSIIX8f3tCPPR8i2NQYl1tBMhBb84k29jO3Yas0TNY83en
         jdZfDqXcMcORg4CfY4gF3EFcEDw1wPUkjorE8sWrf7Jw1FTeY+1rPAh4ENZoDx5X5CWB
         ruItUUsMz6xYIwDIfDgEksaYp3L5TJSVaiX52R2FuutW5p6abTx0w6BV3sKtFzFk/VFy
         3hpmmpXpxr7voSAHXyXfValdLet8jB58jx+TXK8ykI9mJ/I2f6erFvrLXdCpnESYVUmz
         a7Iw==
X-Forwarded-Encrypted: i=1; AHgh+RqZpanQo+aS26HiqLp7GrMbNb5O69h301QZ9QxcmWCgeTE4fJvYabCDFcHrn8S3x9bVBVj38t+bNze07wMmGF35yw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkG3+9QmgzJR/7QFyZQM+fcpX07Ip5in71EuxkK1hghC0v+Ery
	U3bOjC+JHPVysriLvcLppL/0gy45Er/i5ApREZlHgG8i2bgvD+aeyx0/Jy2sbemtGd0=
X-Gm-Gg: AfdE7cmck0GseRkAowk64VhuFOluE6nrVIPECZq3wYPYesK4/R73af7YdFmGGwEz8hd
	lAgbtTH9UkDvJ/97tyXwmteS+uRmqqeA8BlYZnHLxztLH6k/p0Ih01ZHREGB74YcBGtj4+P4hYL
	bUXG8GX1ZnaQecvSKR38acHLI/bdAwyRW4GlrXs+L24F/L0sW7uZEEkyH1EtfRUgoqScLxy6crC
	YZaCPONc/ljhjwiIUqh5zIEflgUkkQmoedy/yKyuqlJyRoHkUR6yRt0LVXMXEDd87+r2+RXOzsS
	xd3cBePR6uhPaqfo1JwpbhsDDJAhAcOnpkFMA72ebOB0XVLfAMImgSDOCmv1juE6oce7iH/415F
	XwcQkOx43Ep5s2jiHMeEzPeWYzFMbAyay5ZEnLBiyTQj6MiVUzr0Sml4zCS9cju834JS3c2eWxT
	0M+jzZ6BGQ6gKcEOBwqvYag41gMlPW34pa/EgC9CORE1pWj5mNkzt/gfWE+LDIBNGXT0agW86as
	Pyh
X-Received: by 2002:a05:6000:200c:b0:474:6a5b:860b with SMTP id ffacd0b85a97d-47df07f0039mr8919826f8f.37.1783631144786;
        Thu, 09 Jul 2026 14:05:44 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960816sm52339672f8f.29.2026.07.09.14.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 14:05:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 23:05:44 +0200
Message-Id: <DJUCGZSG6Q42.3GE2OCSOP0W3T@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 3/3] python3: fix CVE-2026-11972
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <pascal.eberhard@se.com>, <wahid.essid@se.com>
To: <benjamin.robin@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260706-fix-cves-python-wrynose-v1-0-b53e09c2b62a@bootlin.com>
 <20260706-fix-cves-python-wrynose-v1-3-b53e09c2b62a@bootlin.com>
In-Reply-To: <20260706-fix-cves-python-wrynose-v1-3-b53e09c2b62a@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 21:05:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240593

On Mon Jul 6, 2026 at 1:00 PM CEST, Benjamin Robin via lists.openembedded.o=
rg wrote:
> When using the "tarfile" module with a file opened in "streaming mode"
> (mode=3D"r|") the tarfile module did not properly handle EOF, making arch=
ive
> parsing take exponentially longer.
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
>  .../python/python3/CVE-2026-11972.patch            | 59 ++++++++++++++++=
++++++
>  meta/recipes-devtools/python/python3_3.14.6.bb     |  1 +
>  2 files changed, 60 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch b/=
meta/recipes-devtools/python/python3/CVE-2026-11972.patch
> new file mode 100644
> index 000000000000..7dc9c6697112
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
> @@ -0,0 +1,59 @@
> +From 2d256d4bfd654bdcaf2d96733799be73b8ff8f69 Mon Sep 17 00:00:00 2001
> +From: Petr Viktorin <encukou@gmail.com>
> +Date: Tue, 23 Jun 2026 15:13:30 +0200
> +Subject: [PATCH 2/2] gh-151981: Make tarfile._Stream.seek break at EOF
> + (GH-151982)
> +
> +CVE: CVE-2026-11972
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/f50b=
f13566189c8d0ce5a814f33eff3d89951896]

Hello,

Upstream patch had a "Co-authored-by: Stan Ulbrych <stan@python.org>"
that I readded on my branch. Can you send a patch to master to re-add it th=
ere
too?

Thanks!
--=20
Yoann Congal
Smile ECS


