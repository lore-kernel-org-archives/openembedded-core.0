Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB40CA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 09:18:59 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7059.1790846332035756886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 02:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=G/VUt6Ct;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so39274625e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 02:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790846330; x=1791451130; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VkQcxxTTLaF9y+u3r9MjsCEWiBrqh+iU0M2MWSi+B8=;
        b=G/VUt6CtmYGDwotcqy6Tbv7ghSNCVB3Dt6+o7i7tLFuzdNLtoDgvBKjkr+q7JaVFa2
         1fasR4SbpXyyjHI7T/A2IDkPKZkPcntow9KScEcM+HXS16kYQGHxc0z29EJijwn8Vdd+
         J3C2ht9OxPj0Wchs7/eNC0Roi+sHX21AsijgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846330; x=1791451130;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VkQcxxTTLaF9y+u3r9MjsCEWiBrqh+iU0M2MWSi+B8=;
        b=hujfGFDxSLir0fp5hZszbAkxtB+9zOAHnY3/+2QiUjwXbzl4NI5w+7UF3mwHveQ/7a
         TyldZaw8ucrY1mIOxtRY7Bg6CwkueOJ/kYMxZojJCaUQ/L6YTqZ2fkj5vV1R191Nca+0
         3qFJ0/HYdNQ2eeA0+lcRFDjK3nKKaSSy/vSoW6o/IuuxXsGObgWjx3ubj30TmTD491uH
         SENHVI24XwG8wU1emM6NN/f8iNHDTc4jCJ0GC680HicXOO3LLJ1T1gw6t9X2/p3Sl893
         C7fFx+HFzpbsHYAJIsCBrzHZSMAXpNJ20oSTF3REN7bQbNkf/aJAzXVn8BqhvEL0uQRr
         ce+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3yyiyaoAbLsXZkHvsPSij0I6icVW8ueeUYOfSI30W2ehbyESqZo9rqOvJU+mY1YFraInv3ykd6YbCYySfy5YiRQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++kRCboNwoHalBGw7o02kQAj+dyknWlgvo0rlvpE9lIMop4pE5G+
	LeUUNntvxeg/EJR0F8e3bMgDidcLKNiPIbOFpG8B+0p7R7ORu2QchBzEY1GEBrbG1zI=
X-Gm-Gg: AYBFou3c+bndFZVvSwYSii1Rg7AwZ87BGFNtNxA42cVJSXP5CLnbe7vJbG/K5VL7xu2
	idpPtt4MlDEFAQaIJsa2r9bEA/5qMbhzZgI9jw+8A9+P5ioUioK/cWEeF6dJ0eTewzk3RLO66VT
	vX61d9KkQtjlEUZ8z4WIO3B81D2heZbr0r250I4CJR2PStrj2RGsn5TsMZfGmVfvty/K8zciQn+
	BTcIVPJz5TwV3GO5JevzYWQ+0RlrGyDRH7/nez2oU9vfMeHMAkaZhRaAVQpAEnzinzORUouqUFx
	fQkEeXj9VRriks1DkHD6Dg3jJal3sVLhlcvFRb+vdFI+gUqFZskovTUm8FJAZ9DJWq70JfmmF8V
	BjEPlIMa+mnO6/ZZZJ2Zd4bLpQNET7aodfddhRouvGIwZ+33OXDSanqbBnSGikr29iFxxkeMeo0
	oG6psP1NRmhMimN0gksXViJvDrw2AqDD+xw/ews7AhxXlVjh3GrCS3pODutk7pGkgJZd+q6Ytsi
	qPIhfWF1UwwZQcPq8sibCb0O5k3WzNf8IAzzwBIS8S7ZablIcIuZaWmHYXzvw==
X-Received: by 2002:a05:600c:6815:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a01b004e5bmr69804615e9.12.1790846330171;
        Thu, 01 Oct 2026 02:18:50 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f947898sm57644015e9.10.2026.10.01.02.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 02:18:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 11:18:49 +0200
Message-Id: <DLTE1I9N9VX4.1MSS99F2ZAMYK@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 2/5] libsoup-2.4: fix CVE-2026-1801
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jason.stasiak@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260929205055.2403390-1-jason.stasiak@garmin.com>
 <20260929205055.2403390-3-jason.stasiak@garmin.com>
In-Reply-To: <20260929205055.2403390-3-jason.stasiak@garmin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 09:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247021

On Tue Sep 29, 2026 at 10:50 PM CEST, Jason Stasiak via lists.openembedded.=
org wrote:
> Backport fix for CVE-2026-1801 from meta-oe to OE-core. Update CVE
> patch to restore the chunked server validation unit test from the
> upstream libsoup3 patch (b9a1c0663ff8ab6e79715db4b35b54f560416ddd).
>
> (From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)
>
> Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2026-1801.patch   | 217 ++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
>  2 files changed, 218 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-180=
1.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch=
 b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
> new file mode 100644
> index 0000000000..13666b6d87
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
> @@ -0,0 +1,217 @@
> +From f9c933e258e9ef2f221cca6395f8092a1c4b93dd Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 19 Mar 2026 17:10:36 +0800
> +Subject: [PATCH 2/4] Fix CVE-2026-1801
> +
> +This patch merges 3 upstream patches
> +
> +Chery-pick the first two patches to make the context is the same as the
> +third patch that fix CVE-2026-1801
> +
> +Upstream-Status: Backport
> +[https://gitlab.gnome.org/GNOME/libsoup/-/commit/1e32b5e123aa1689505472b=
dbfcbd897eac41977,
> +https://gitlab.gnome.org/GNOME/libsoup/-/commit/8a2e15c88512ae4517d2c2c8=
87d39299725b22da,
> +https://gitlab.gnome.org/GNOME/libsoup/-/commit/b9a1c0663ff8ab6e79715db4=
b35b54f560416ddd]
> +CVE: CVE-2026-1801
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +Backport the chunked server validation unit test from the upstream
> +libsoup3 patch (b9a1c0663ff8ab6e79715db4b35b54f560416ddd).
> +
> +Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>

Hello,

This patch has formating issues:

> +---
> + libsoup/soup-body-input-stream.c | 66 +++++++++++++++++++------------
> + tests/server-test.c              | 67 ++++++++++++++++++++++++++++++++
> + 2 files changed, 108 insertions(+), 25 deletions(-)
> +
> +diff --git a/libsoup/soup-body-input-stream.c b/libsoup/soup-body-input-=
stream.c
> +index 6b95884..25d9312 100644
> +--- a/libsoup/soup-body-input-stream.c
> ++++ b/libsoup/soup-body-input-stream.c
> +@@ -159,15 +159,18 @@ soup_body_input_stream_read_chunked (SoupBodyInput=
Stream  *bistream,
> + again:
> + 	switch (bistream->priv->chunked_state) {
> + 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK_SIZE:
> +-		nread =3D soup_filter_input_stream_read_line (
> +-			fstream, metabuf, sizeof (metabuf), blocking,
> +-			&got_line, cancellable, error);
> +-		if (nread <=3D 0)
> ++		nread =3D soup_filter_input_stream_read_until (
> ++				fstream, metabuf, sizeof (metabuf),
> ++				"\r\n", 2, blocking, TRUE,
> ++				&got_line, cancellable, error);
> ++		if (nread < 0)
> + 			return nread;
> +-		if (!got_line) {
> +-			g_set_error_literal (error, G_IO_ERROR,
> +-					     G_IO_ERROR_PARTIAL_INPUT,
> +-					     _("Connection terminated unexpectedly"));
> ++		if (nread =3D=3D 0 || !got_line) {
> ++			if (error && *error =3D=3D NULL) {
> ++				g_set_error_literal (error, G_IO_ERROR,
> ++									G_IO_ERROR_PARTIAL_INPUT,
> ++									("Connection terminated unexpectedly"));
> ++			}
> + 			return -1;
> + 		}
> +
   ^
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1801.patch:58
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.


Other issues:
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1801.patch:60
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1801.patch:74
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1801.patch:100
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1801.patch:103
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1801.patch:115
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1801.patch:137
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1801.patch:212
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-support/libsoup/libsoup-2.4/CVE=
-2026-1801.patch:214
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.

Regards,
--=20
Yoann Congal
Smile ECS


