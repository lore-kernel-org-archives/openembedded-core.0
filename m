Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D09E9D401
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:19:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22819.1770218346925985915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 07:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FRdSl65F;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so77566005e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 07:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770218345; x=1770823145; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNnEyQODi56gNQ/D30KLyUKY7/eQYMJs78BASLOML+M=;
        b=FRdSl65Fgq/Pw3cjUSnPnE8aLNTb/C00BhzBBcxffNPsQh/0erlX31rIQ6ZdVvNqnw
         THJx/bqHn9O32bycD8tnATZkq34SDz7C+uh9WTSbOUvHHMjBkzD/2uNfysaPrzAeOZ8S
         CcUdW/dDaArplBdT6+O+mdCDTLh+PbVL0q2YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770218345; x=1770823145;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNnEyQODi56gNQ/D30KLyUKY7/eQYMJs78BASLOML+M=;
        b=HBvtlAJ0QdeU43R5rFZ0jM6M4S3bVimxPyGh1nsg8/+9K0B4ILRbGO0UyGcxGC8Myb
         JUHFPT8A/W+1u563KBXdoUZFSuuKip5auRmjHjZQRTeMcoB6OTevQocdF7+FFoZ/T3ap
         OkZ2JSHpXWZG1x08w0XlCVcmzbw2qSpvXQxbXaQR6X/4rnlX4gwYCeg7BX0PFRyZnazf
         g9G1LJFNXbEFMR1Tp+n6uW7tIcC2kjKeil7Di+FvNtT4A8BxvyhBQz/gfLZD/qhPjXi1
         pr/UdxKFUllYbU2Bp4BRDbOaSCpwn1QqAkGO+ybzDZGIYXy1ghW8VQaNt05AKj9L1mf/
         9tkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzhSEflX2roqbTGO7tNLA4n9TzrD2XsZDUhfahCYPBmGKCa9QYRTdMhFffXnI4licne1i21Ux7BerZ5FoKpAjlJw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzzkLPc7Oh8T9XbfLv4ZFxi4zy5a62iQ1GHssHbDVuWFnoNnJjZ
	IcqEYYZ4dipkxZ92kjBMVS+7X1PSppoD/9QZukzJjR2bcpHK9/hHTjqZoKbgG6hmrmM=
X-Gm-Gg: AZuq6aIN5nT/F2qNzHJKTagwstB4uRCoJo/7O0spgqmtHSnTbAEV9rAC+9VLmXK4Wlg
	dv4XLy7r1vipQ2PxRYw/LWXXYevS6KybUz+hP71P+2TeCUyVy1yNiSqn6k9z0z6xK62FHfaeX+d
	X+9Fob1xVr25GSLy9XDLYMguZUofSM70M+cXGWnsAodeGXHMo42cGugVGeQtUUo6iN0DkhuydC4
	f6lMEHQ/T3bQUaAOIH9ETQsGiV4gxUQ0cb/53m+hycJwZWwvBUc2OtZC3V4sH3V+vA87Q/QUuKS
	x0uDyLgMZF3HKmTsZlK2HQUxNSizu2Fk2L5zgWf7Xy20jBj5zq3BYz1TYKDmhbwsu7D2F7Kmxoc
	5jjwad6hFcYg9e7K6h+5IEHj86HCcz1I4+0tXTC84N1B0Au26bXZYhzAD7MFyx9d1GkkYVj52vW
	LFMi2OMPMT6WEBzm87uv1tKH51Y0CSkjRZCXkjNJPsBGciIgav7+b1bJXgaqiiyPDTj14Gs5BYI
	nM=
X-Received: by 2002:a05:600c:1d0a:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-4830e99b3ffmr44821385e9.27.1770218345229;
        Wed, 04 Feb 2026 07:19:05 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831088c4cesm48962365e9.11.2026.02.04.07.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 07:19:04 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 16:19:04 +0100
Message-Id: <DG6A14TGMNB6.29V017MDIH99G@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] inetutils: patch CVE-2026-24061
X-Mailer: aerc 0.20.0
References: <20260131195344.176216-1-peter.marko@siemens.com>
In-Reply-To: <20260131195344.176216-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 15:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230545

On Sat Jan 31, 2026 at 8:53 PM CET, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patches per [1].
>
> [1] https://security-tracker.debian.org/tracker/CVE-2026-24061
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../inetutils/CVE-2026-24061-01.patch         | 38 +++++++++
>  .../inetutils/CVE-2026-24061-02.patch         | 82 +++++++++++++++++++
>  .../inetutils/inetutils_2.7.bb                |  2 +
>  3 files changed, 122 insertions(+)
>  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-202=
6-24061-01.patch
>  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-202=
6-24061-02.patch

Note to the master review team: I have related CVE fixing patches queued
for whinlatter and scarthgap.
This patch is currently in contrib/mathieu/master-next-success.
--=20
Yoann Congal
Smile ECS


