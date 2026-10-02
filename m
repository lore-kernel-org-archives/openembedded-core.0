Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532C5CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 14:54:52 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14136.1790952884368139981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 07:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nAEIGIsE;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso1462345e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790952883; x=1791557683; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t8E2kVYI8BrOf9m91RPeEqWbQdjEVIxqBYk/m6PFYh8=;
        b=nAEIGIsErSegS9e9Q/8ivgLG/TmsapycjbsMiUdK6v9R/Yrp8SsU7nTFFUe0qbsDZr
         RnougV/NKNXXsfGhRtxbN4m5jAFCedh9iSbtpMG07TSER+1dQqoWuUQZlvXhYseSA7nw
         DSZxVj5/Se1X+xYhPRZ3nwSbkcPecvq8l43Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952883; x=1791557683;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8E2kVYI8BrOf9m91RPeEqWbQdjEVIxqBYk/m6PFYh8=;
        b=ibuLByCoD+CQasOYzONpQEZGkMe6tPt+pV8dzOleElqT1DiK2VXHLysUWDrx1/k1As
         DwwvBAmCuMIaBJg/WXAmlDpFC6TsD7M5HA2JZSUnSeX0e6SgTBj0/U3+H/i7zzHQLIY5
         XYahLnaGeEqX9Z+cr7c8pbX0fjr2DP7OLXZ+HuMefnemIY1/boUzqmr/nK2nQVtNjmPI
         wvU6GgzxkWRcANxvlt7zB7AD/9daxCqZu6+6PDdrlBDKRxSRP0v4ukcxG+FVj7l/kzQv
         FDdg44Z2iKg8Myqq0WRWQrtOvrNTR2AGZvDV+Bcsuawu+1AaVbuO7NNCeFHzYZcz3VCc
         +L0w==
X-Forwarded-Encrypted: i=1; AKwUvByZEGlEKY4xf4R1eJWni40m0d4fSdN2D5w4pMAFYNuWl20j68SjLxk90n7JZw725BUxflQhWjWPn3MFK1J0mEwY3Q==@lists.openembedded.org
X-Gm-Message-State: AFuF++lU2GP73Y5xVguoQ5LEiygKujMnDXG9nEGTFTky14EcTkzzLF5d
	4QzBvfL9jwMbi4Ro3fGSxqmQbwzvsvYsDRyM4i9w550rVj2eEsLvl9BAiiAFVmsNhyU=
X-Gm-Gg: AYBFou25NUj3bz5XFemCfd/QDF7VLnz04N7rM+I0uj2s88YBbP9j9CQCT6PNXQX0gm9
	PjCBIMUJW2rTWQeXrQr5Eb6YYU/lvOdj7skqoADsrz6QIftFUDCdYwhRgou4cqG+Xy1yjeOPPNZ
	OYPill7K9CDmM/gJqIgCszrB17azn5+RcM3eXa4S3lbIc/n6miiEaG1uGpgMNCZ61ZV39J32hi6
	UGXwkOQqrkmbg/tHkytLwNn6RtKz7pknsRn/lgSw1TpywSq8U9Op17nJ3SCiY9C3Mjtmz6ZZh+M
	sJJtJfAy6p/vG6UkgubRvs0OhTROokzUOfx0Gw7M+v0TqpxTIu4fpsHDz4H1ic5NPhMEW5zNqXw
	f8fAtTjwM4CEtH22H3CKvb0ztUd590FNNIqTOJzrfvBlf12E8dRFMQpzQg2QrwX+1vPCjGSvAsl
	slYjI+fz27o9EOehs0+cvUeGa/9X13+uD9UdlqYjDgpGdQO2ef0TgduRT0S7rl+wZNgBzpDb87C
	2kVIrhXcnoJgnDtoTR6qPXAZAT/PSgtspGSVSGEorr9cdQQYtssL27LgjZzbg==
X-Received: by 2002:a05:600c:8b88:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a02757ebcdmr54946685e9.16.1790952882573;
        Fri, 02 Oct 2026 07:54:42 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027727cecsm90683385e9.9.2026.10.02.07.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:54:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 16:54:41 +0200
Message-Id: <DLUFT7KF13EN.2X4UVRFZK8GEO@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 6/8] libxml2: Fix CVE-2026-86142
X-Mailer: aerc 0.20.0
References: <20260929041836.2217090-1-hthakar@cisco.com>
 <20260929041836.2217090-6-hthakar@cisco.com>
In-Reply-To: <20260929041836.2217090-6-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 14:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247126

On Tue Sep 29, 2026 at 6:18 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/GNOME/libxml2/commit/6b3a736c0edc74ceec3d82f525249=
9d7911b3a58
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-86142
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../libxml/libxml2/CVE-2026-86142.patch       | 37 +++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch b/meta=
/recipes-core/libxml/libxml2/CVE-2026-86142.patch
> new file mode 100644
> index 0000000000..d63d8cdceb
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch
> @@ -0,0 +1,37 @@
> +From 51f0e78349cbbc9081f14e02f440733e5880fb3d Mon Sep 17 00:00:00 2001
> +From: Daniel Garcia Moreno <daniel.garcia@suse.com>
> +Date: Mon, 4 May 2026 09:32:43 +0200
> +Subject: [PATCH] xpointer: Check overflow in xmlXPtrEvalXPtrPart
> +
> +Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1113
> +
> +CVE: CVE-2026-86142
> +Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/6b3a7=
36c0edc74ceec3d82f5252499d7911b3a58]
> +
> +Backport Changes:
> +- Use xmlXPathErr(ctxt, XPATH_MEMORY_ERROR) because the Scarthgap xpoint=
er implementation does not provide the newer xmlXPathPErrMemory() call shap=
e. This preserves the XPath parser error state as well as reporting the all=
ocation failure.
     ^ wrap at 80 chars please.


> +
> +(cherry picked from commit 6b3a736c0edc74ceec3d82f5252499d7911b3a58)
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> +---
> + xpointer.c | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/xpointer.c b/xpointer.c
> +index 6e1e5f46..f5457c9f 100644
> +--- a/xpointer.c
> ++++ b/xpointer.c
> +@@ -956,6 +956,13 @@ xmlXPtrEvalXPtrPart(xmlXPathParserContextPtr ctxt, =
xmlChar *name) {
> +     level =3D 1;
> +=20
> +     len =3D xmlStrlen(ctxt->cur);
> ++    /* Overflow in xmlStrlen */
> ++    if (len =3D=3D 0 && ctxt->cur !=3D NULL && *ctxt->cur !=3D 0) {
> ++        xmlXPathErr(ctxt, XPATH_MEMORY_ERROR);
> ++        xmlFree(name);
> ++        return;
> ++    }
> ++
> +     len++;
> +     buffer =3D (xmlChar *) xmlMallocAtomic(len);
> +     if (buffer =3D=3D NULL) {
> diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-c=
ore/libxml/libxml2_2.12.10.bb
> index 49a1a8dbaa..881b60133d 100644
> --- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
> @@ -36,6 +36,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.=
tar;subdir=3D${BP};name=3Dtestt
>             file://CVE-2026-86138.patch \
>             file://CVE-2026-86140.patch \
>             file://CVE-2026-86141.patch \
> +           file://CVE-2026-86142.patch \
>             "
> =20
>  SRC_URI[archive.sha256sum] =3D "c3d8c0c34aa39098f66576fe51969db12a5100b9=
56233dc56506f7a8679be995"

Thanks!
--=20
Yoann Congal
Smile ECS


