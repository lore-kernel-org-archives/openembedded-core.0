Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C5CC4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:23 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79.1784303176550605756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 08:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OqOC09L9;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so3275327f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784303175; x=1784907975; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p1LpBuiB7siQMmhwfYGVXBuM6Jwr81lT/vJNO6SFYKw=;
        b=OqOC09L9mK+chMXtMior/D+IVL9HwytuZpTbuDC5wMswHglg6XK0uHaSdmOdJuPxRp
         AyFwrGsKcNb6d1O+H6Wd5Gi5vLORXzCRcvtNshaxRMgz53LDLpj7hi+h2a7Qf3F/n0KJ
         Ov2b27b75GBB+IAJSk/lg33+xqYG+nQJDv5q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303175; x=1784907975;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p1LpBuiB7siQMmhwfYGVXBuM6Jwr81lT/vJNO6SFYKw=;
        b=CvVZhPF0j8xJfjVmU2MI7FvRs5bfnS67NwpEJpL/qwWEX9j6wudfjHtG/e2bGwSHfl
         6cusRw/DrQpWEpq48er4RtQ8ZqmAPpga9WL1UQavN5VBzxEN21tiZC0C5l4tW5tH5NtE
         p7UhSUyuc8jfIDlAc7h3/zIp79Dz0brPG8sEB4USOibLTaM7S1RhkuXSeHtp7nK2dhMy
         iM2zwlMOU8drwbyLgBVckkWto51RFdP9nDPJxtIfLWCSvHgkbZOcL1RwPQbm4rgvz3AH
         gsr8cHzMr5KX3+SlQiCLmPkyf6d8Dj6ebjJJDR6QAJKA1rM5Gx3ybVZYi1DSacnwVOK9
         q3YA==
X-Forwarded-Encrypted: i=1; AHgh+Rojxj++ZN6TagzOfbzkVWTzLJhc2MPMCUX+zOLwR2HBoxcKAbEHnlnA2umscVkSwfaRzBmCaWHThvGNvfGOulekRA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywg5KKMpfnxt0TFxDdMS+77kNyYlGBF754wQAf0AYMKGk0CxEYI
	KWJJL4Poxd5/Rsf+vVW41I6eskjCaoBhGDaMiZu2PuYADKyJSU576GU3/A+5B3h5MAc=
X-Gm-Gg: AfdE7cn5vnCkv6pbS/nOWU4IDrA1ZNTwzvdUFtfNz9mkoVNlSypRXHp3N6DFRGT5iIr
	Dyby218IDbrbvWJ0BH4osssbYzJHUst8FlN1YdGEwhaOovxhBk8cGRQNa+1juBzxT5ONk/FfEgs
	q3nqmgAc098/TG+0xy7uOz64OKNRQ7mloG02ESBf3LtQbCIYIEfhj4FMg0/7ElIGSP3+ppIprR4
	sf1Hc85wO4+lpvE3Blfmw+agER19m9Dv/JfyO2IrBkoqX8YRNf7GeBnKKC/Fh1cXx9V9l9rKnsN
	m+OBfJbdaQuqnWok5ASy5yzYhLVtAMvm7RDTpar6mqKHHULhEX+HgeX7mdJ9cCfYybHOraDk3uI
	E06T+cXzvngtE0YbokH/O1qlAcGnNQwGAH620Lw8Kv2ThfscfXM76WQSByQwCCrVnOEInQX5S2a
	XzxZZCBAnZEuN3lVQ+4oNIwaGKWqzhFyhA7+jhgDzSXfzA2tXlUPk4iEAqcBSfWyxukVM=
X-Received: by 2002:a05:6000:718:b0:47f:4889:7562 with SMTP id ffacd0b85a97d-47f6231c8e5mr4953892f8f.36.1784303174717;
        Fri, 17 Jul 2026 08:46:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa0093f4151e9fe9f4b8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:93f4:151e:9fe9:f4b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm2088095f8f.21.2026.07.17.08.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 08:46:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 17:46:14 +0200
Message-Id: <DK0YOQ6AB7SY.CQYLAG61QCB@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 1/6] glib-2.0: Fix CVE-2026-58010
X-Mailer: aerc 0.20.0
References: <20260715172142.1146263-1-deeratho@cisco.com>
In-Reply-To: <20260715172142.1146263-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 15:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241207

On Wed Jul 15, 2026 at 7:21 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream 2.88.1 backport for
> CVE-2026-58010. The upstream fix commit is referenced in [1],
> and the public CVE advisory is referenced in [2].
>
> [1] https://gitlab.gnome.org/GNOME/glib/-/commit/be85f9429bb66412a9775440=
a88cb115803ba897
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58010
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>

Hello Deepak and Adarsh,

You both sent backport patches for this CVE.

This CVE (and I bet others of this series) can be fixed by upgrading
along the 2.88.x branch of glib. There are precedent for glib upgrade on
stable branches.

Can you look into the glib changelog and see if there are changes
incompatible with our policy?

If upgrading is compatible, please tell me and I will cherry pick the
upgrades from master:
glib-2.0: Upgrade 2.88.0 -> 2.88.1
https://git.openembedded.org/openembedded-core/commit/?id=3De2063c252d1ab31=
88e74e9eced91bc17463d6551
glib-2.0: upgrade 2.88.1 -> 2.88.2
https://git.openembedded.org/openembedded-core/commit/?id=3Dc22a7bd7ecb463d=
a212c25a5aa81a19992e17e1c

If not, ping me as well, I will then resume reviewing this series.

Regards,
--=20
Yoann Congal
Smile ECS


