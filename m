Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A23C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 22:08:00 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.558.1783634877408822223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 15:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0xy0FP+C;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso206281f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 15:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783634876; x=1784239676; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dP43QteRnJ4nCDKM52r3ESs0kEE+gXnJxzoS3o8d+Rk=;
        b=0xy0FP+C8rE8rnoQKkCmtn5Tke08ns3py+xIvG/uvPWB0zV4bEOsGBZ//QZBEoDcmt
         LQ9peQe5hLdMeRO4zgkMw3zTTDSx86JIDTw5gakKWOEdMh2lm5hQplBN3/IpvpIW5J6k
         b3mzQDf5+pDNU50me/rqpVsd5sWV/M/MujpKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783634876; x=1784239676;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dP43QteRnJ4nCDKM52r3ESs0kEE+gXnJxzoS3o8d+Rk=;
        b=ETjLa6ovf08Mqm9vol0NbeNDHjVXSmuRQa52KxXX4MIYBKr4FLkP7Efl3c/n/6durV
         PZgsd/Jmugn8Vcr82dclKARz5KrgpKXBi7XwxUNZ/SF7/E5//ilQdFbQFNoWqCDvwf1w
         2ZZRG5XcEUsiXg9Zr4uMK7vK/cSfyhGaUoN//c1wNZqn3oqUB5xwg3E94wETQLB4ngC4
         Q2ZvWccK2CzBIasQ2jfRmQnvdVPP6p592OT/uBd/N1xyHH7O3AdFvom30q0vX7tq/aC2
         etY6ZleN5YSzgBxW6lnaf7z+x+mDQDvTzfGbWJfDQJ7ZmLYLAKvENXk6nf18QpGhycFi
         nwTA==
X-Forwarded-Encrypted: i=1; AHgh+RpE/82vwOMjuPUoqXZpZ/nsbu3C/zr23oaxYkra9zc62X1RIRYZpVW6FlMEQPvH8DWuUILxDMsqEcDxKN2X0kaMnA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yza4PFCj0XQTYBxErLjX1VXSjH1XYJYxb4uKpk+8FoYqtvpeVUI
	Wdk3UqE6Exl6tSiDIvx+b/DJ5FsP3MuMvCi8cPWsqg6jBNZ7UGf8Ted0OMsXBN1c9ls=
X-Gm-Gg: AfdE7ckeIyfHAgp3c6dzrYpRpuRsdQ2fDtIuDhXz7UukWkK0ZaTazrIbGAQY667S34o
	wcm3Cwx96bIv6MdygZFgX5dz5Gkvi/AJQejdAg/NhRZm3iwITUvjKIsrVlOaoo0rGX3ZcCasGoP
	H/mcjYJ7C4Tycc1pTF5IwCX0XYMGyGXuvbSPVblThIUSm6k0FCCrTUs7CnJApu0xM9nfLJAlHKW
	JNTgzsaDaBQkje2JREdeWPMizMyOsXJwF59Yh++wr4HSsRPj5YNuuJZHN2CWW9FHwKQA/ocPVmI
	yvYK5yL2OZ6qOM/aJtvqo/zitQitpFppnCxO1RHG5OHXZ56A2jYeMDbyKaMp6pkb0DUIKl9Q3tV
	ayQ0W+TH6cFwS0oFAEUHcMy1zkNAm1Xh4NvZg9XM3PCMWrLT4uTiDeFmRqswOFp6/8nj9Lhrw0P
	9i72kw0TKwxsBxXZgAKw0UJiz6P/bXU6l54/Lm5hmgEVMLUAN184tntGSdhV/G4yS8xcHPRxqv4
	bRg
X-Received: by 2002:a05:6000:1a8d:b0:46e:997e:b4c5 with SMTP id ffacd0b85a97d-47df07318ebmr9880878f8f.18.1783634875603;
        Thu, 09 Jul 2026 15:07:55 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm54379029f8f.28.2026.07.09.15.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 15:07:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 00:07:54 +0200
Message-Id: <DJUDSLR3YAV6.3UE0XNXCDULBT@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <pascal.eberhard@se.com>, <wahid.essid@se.com>
To: <benjamin.robin@bootlin.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH] glib-2.0: fix CVE-2026-58016
X-Mailer: aerc 0.20.0
References: <20260703-glib-2-0-cve-2026-58016-wrynose-v1-1-46befa36c6d1@bootlin.com>
In-Reply-To: <20260703-glib-2-0-cve-2026-58016-wrynose-v1-1-46befa36c6d1@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 22:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240594

On Fri Jul 3, 2026 at 4:36 PM CEST, Benjamin Robin via lists.openembedded.o=
rg wrote:
> A flaw was found in GLib. A state confusion issue exists in
> g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
> processing malformed D-Bus introspection XML, specifically with a <node>
> element nested within other elements like <method>, <signal>, <property>
> or <arg>. This issue can cause an unsigned integer overflow and lead to a=
n
> out-of-bounds read, resulting in a denial of service.
>
> The CVE NVD entry is wrong, it indicates that the CVE is fixed in 2.88.1
> but the fix was realized in 2.89.0, see [1]. The fix is not present in 2.=
88.2.
>
> [1] https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f=
9fdf5dc433d6fcc2
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
>  .../glib-2.0/files/CVE-2026-58016-1.patch          | 92 ++++++++++++++++=
+++++
>  .../glib-2.0/files/CVE-2026-58016-2.patch          | 96 ++++++++++++++++=
++++++
>  meta/recipes-core/glib-2.0/glib.inc                |  2 +
>  3 files changed, 190 insertions(+)
>
> diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/me=
ta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
> new file mode 100644
> index 000000000000..ee6321361455
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
> @@ -0,0 +1,92 @@
> +From 38eee3870fbcf6bdf8e6b1281bc7a98d32b68521 Mon Sep 17 00:00:00 2001
> +From: Philip Withnall <pwithnall@gnome.org>
> +Date: Thu, 16 Apr 2026 15:27:37 +0100
> +Subject: [PATCH 1/2] gdbusintrospection: Fix XML parser state handling f=
or
> + <node> element nesting
> +
> +The check for whether a `<node>` element in D-Bus introspection XML was
> +nested correctly was broken. `<node>` elements can only be at the top
> +level, or nested immediately within another `<node>` element.
> +
> +Fix the check and add some unit tests for it.
> +
> +Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit te=
st
> +uses example XML strings adapted from their report.
> +
> +Fixes: #3932
> +
> +CVE: CVE-2026-58016
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2]
> +
> +Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>

Hello,

Upstream patch had a "Signed-off-by:" that I readded on my branch.
Can you send a patch to master to re-add it there too?

Thanks!
--=20
Yoann Congal
Smile ECS


