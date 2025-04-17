Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460D2C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:15:57 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.6172.1744888556392886123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 04:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N2Q5Tr91;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so689282f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744888555; x=1745493355; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dB+UAp+3yRgJERhIDytLVXS9i8h2SrvyDBzFzdT/Ihs=;
        b=N2Q5Tr91awC+Zw2NnX2SjU5/CULPBAje++PHidDueCEaPavH3MxMOAre3f6AzZtw6d
         nz/+fUqpwxlwWCH32H3koAuW/gdKCbQAKv+9ttVznPBrwOVEEiTRREa1pRpoUzKDaoLy
         5GX1uNkCHHQKgoAa7E5x7ZCrS2njRA9lTzDMV8hsJ9PDp6Xl7GEWJpLx9zo91TfWjxKb
         twfEFaKkwfq83RChsVeYPfJ9sEeX+jRksm2tv7IU4FLQ1Pir5cx/d13LsULU0Ehprriv
         cTC/q1KruTZWvYR9v8f8Fq88Gk3tkB1b6GlgJXzmoriqAlMVm74/KTcVU+qgSNB9DpJH
         HtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744888555; x=1745493355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dB+UAp+3yRgJERhIDytLVXS9i8h2SrvyDBzFzdT/Ihs=;
        b=jyo8TaUXWOap5oAnfhm2ylOF26VztNA/f1/OijHjzmv+QsvebQHSdp3+Vx7jrUoGOX
         n/SdaleGl3asCOKy2fjyZfdA8mBSFkL/1tFM9nrfDMajrDEIhu9QRlcUwbxSl/UeAYv4
         Ct4OHZFwxsQ4vgiDp4oJl9gcSLEvhKoctxT5+fgki16xKwmQSEx1zyhhTpZ7MtEcVOlV
         pdDcu8oJHKS7R8rxNeYqKa+omrlgaFUwnoVCVDdxlFStJ9lexy3F/EXFUW4BDDJeFchq
         5PkdQnsKJ2H77pCapeRrBjyCGM+1lHL6qWIU//1m9yj6RIHizHRY/o8VyrOtznECjW+6
         J91w==
X-Forwarded-Encrypted: i=1; AJvYcCUkKlBaouSz9+hwmT37w5lNZvQ9oRT4syvoXL1FNsURQZ5w4fm8HQrwjRnWhapgDXtK8DxGtyCaHwpNMJ/PmGS2xA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yws+Iecmm+cUCx45DP9+X3GqubAvFQimiZLLoK2yUVzEFVuIb1u
	Q5CPVMAWWQ9f4O7kGyoOnPFvPS968yIhpEwMQhNXwv9h6ZX5a1jUPEtrqCAp
X-Gm-Gg: ASbGnctCRkR/U9zRychhN9RzRcWx55IhHQ9NXa+w/ic88W3XeW5qUM1U34Dva6JnOtC
	Oheji+QHsD14YEYIAMr+XRN66dEU+xIcxUeSpdgBpN6lGzCyJlrsUQ/AJSNyOmWSLPHln7xMz1y
	LY7WD1Sn3tFM/soo+e0N+NvZLee4hya4s8Q0S5ke61YSnC1tyBPrsLWq4pzgfLZrhg0/Ui02I41
	XH8FILRoeyx6utaOq+qcYhvTvTpoD/amKFHbqtFOCR3/3tUDFFAC0AZSGySyKZisZyti6WGmChN
	bO6cCnocKXGSSlLWPjNBZyfyC9wYnqeQHwfa4jjDUa9hsKZu
X-Google-Smtp-Source: AGHT+IEKVmdr9DcSd8sKJ6Pj9uvKZngK+SoAFYU1E58TUwa4L+Ngd7vNhsHX/M4z/0qW0nFtHG6R1Q==
X-Received: by 2002:a05:6000:228a:b0:39c:cd5:4bc0 with SMTP id ffacd0b85a97d-39ee5b9f9edmr5130265f8f.52.1744888554682;
        Thu, 17 Apr 2025 04:15:54 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cc72sm20331904f8f.67.2025.04.17.04.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 04:15:54 -0700 (PDT)
Message-ID: <5d660e04-3839-4af3-a2d3-398e199448bb@gmail.com>
Date: Thu, 17 Apr 2025 13:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH v2 1/5] libsoup: Fix CVE-2025-32910
To: vanusuri@mvista.com, openembedded-core@lists.openembedded.org
References: <20250417104258.64180-1-vanusuri@mvista.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250417104258.64180-1-vanusuri@mvista.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 11:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215068

This seems to be identical to v1.

On 4/17/25 12:42, Vijay Anusuri via lists.openembedded.org wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../libsoup-3.4.4/CVE-2025-32910.patch        | 27 +++++++++++++++++++
>  meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
> new file mode 100644
> index 0000000000..32e0c86e62
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
> @@ -0,0 +1,27 @@
> +From ea16eeacb052e423eb5c3b0b705e5eab34b13832 Mon Sep 17 00:00:00 2001
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Fri, 27 Dec 2024 13:52:52 -0600
> +Subject: [PATCH] auth-digest: Fix leak
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832]
> +CVE: CVE-2025-32910
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + libsoup/auth/soup-auth-digest.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
> +index 350bfde6..9eb7fa0e 100644
> +--- a/libsoup/auth/soup-auth-digest.c
> ++++ b/libsoup/auth/soup-auth-digest.c
> +@@ -72,6 +72,7 @@ soup_auth_digest_finalize (GObject *object)
> + 	g_free (priv->nonce);
> + 	g_free (priv->domain);
> + 	g_free (priv->cnonce);
> ++        g_free (priv->opaque);
> + 
> + 	memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
> + 	memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
> +-- 
> +GitLab
> +
> diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> index b2e32b892a..757e6432f7 100644
> --- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> +++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> @@ -18,6 +18,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
>             file://CVE-2024-52531-1.patch \
>             file://CVE-2024-52531-2.patch \
>             file://CVE-2024-52531-3.patch \
> +           file://CVE-2025-32910.patch \
>            "
>  SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215059): https://lists.openembedded.org/g/openembedded-core/message/215059
> Mute This Topic: https://lists.openembedded.org/mt/112311177/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

