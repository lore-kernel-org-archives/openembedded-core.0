Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E47EA4FCF
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:01:06 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36895.1771858864193984533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:01:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oyGI4AzH;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-436356740e6so4681536f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 07:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771858862; x=1772463662; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC6Ya2BbyajcO8X7EmJXY1uoCjbD/HDXaDnl4X/faSw=;
        b=oyGI4AzHA3jE67t+YU4jB/fKeJE0XhI2C2a7ibUsl2dlc2j0G2lLENBhmpXv+/hygr
         fBZWuu+DnJl41NPfZIHeAQWcqkWMnMEGxhCDPrzXYzyq0evVWiOuUpFIkA2sVD5p+ix7
         ekR6gbFp52+kFdrxgg5HH+z+CKTiH3Ymybae0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771858862; x=1772463662;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rC6Ya2BbyajcO8X7EmJXY1uoCjbD/HDXaDnl4X/faSw=;
        b=Aa1Ql5KWGM4V3CWw3Zyozf+RReZleC9FGijdCz9JASJIE0Q7kGhxCJz7PmkN+JP8dW
         +PQH8AtsC4CnzeeXiSFtmpQVY52j5mD9TL5e1QksnF6N0mKPyHSVxDqLtHGlbz96pOqT
         i2fjyEwniGDnjGRk2OvUFhSJyLkR0r0H+3ygpZtHZD3EnMLpvllLBHriKXsyGOwjhQpE
         7FnuPT5TLCJJiVFVLFX54TJ4i6XPh1kYxyyLo2hV/Gy725RmpIusbJOni28jHfK6Zgfy
         6dNfAAMV+RXzoNAvPIshpaXD+mHV0Yq9SE25rYBpLgB9JagZ/S9TCqknGWUJdYp1MQ+A
         IOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMZKxajCJS1OuIfZXA2/TuMu29SKU0E5qVNefDImyi0tSpxpX9btP+wf96CGGBEnq+iHiyJnF26rXnxKDiXgOiEw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1V5vqm6ZAoAmpzxhMXLZKmJDP7plHpdAj7oRdEQgR3bQptjfj
	oDCG88qr2CAz+6NjMoA8lz0OhQyqlcE2/0AlJ/D1ytUzdDko8z8XPfBGm0zb6rEXDdI=
X-Gm-Gg: ATEYQzxFwoe6e1L6uzHxcNuUw4OX2uhas00wJvQ+oLJtZn7WQBYHKiRUHD+Ua/zXRKw
	nSkyQqkNTnlBgEYbM4GYqkKLgvJYYnlrLM9F7b5oO4cffVvfO537GFk5/q7YKJgjTR3M8f4wcbc
	UPbUL+AKTbLKK+1csLq+jt1PKl7EPv2KFdVWD1KWvP5JuJYyHsWYvBC72VfJLqm46DBmWeKa0se
	KdW8a7wZWs94tX6WuhYFC/utszl+4OspIl2Ms5eHGKHwaGbopvYPO/4a3l1AnnMb8eGKd5DTczH
	ud9ENRFdZPgT8nFAm99xds3SwK6IaLIpf9+ex90ZdoYQEU94KrHhvLdOxsXkMfhKyTgj/UanlS+
	m25N0ZYyILd4MApL9jTd7KSv7/0BHoiv7/Zoe3yMz6pqw4HHASyupEbfjM0u3KgJc4MQMc1FWxy
	xROJSpsXnzHPgemxHq3Qe0qqIhT0AHow41YlEBpuspMC1heUaF7BAhvU3XuE+fmA4LDr15Y6eMC
	FOqz/nt+PEdLcnq+vZ5qp9gP5A=
X-Received: by 2002:a05:6000:40cd:b0:439:6ee2:d8fb with SMTP id ffacd0b85a97d-4396f157f07mr16413890f8f.20.1771858862158;
        Mon, 23 Feb 2026 07:01:02 -0800 (PST)
Received: from localhost (2a01cb001331aa00f13df544104db802.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:f13d:f544:104d:b802])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm19791377f8f.21.2026.02.23.07.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 07:01:01 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 16:01:00 +0100
Message-Id: <DGMFJNENIURO.9N6LG8TE00IY@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [kirkstone][PATCH] libsoup-2.4: fix CVE-2025-32049
X-Mailer: aerc 0.20.0
References: <20260218064234.34789-1-hprajapati@mvista.com>
In-Reply-To: <20260218064234.34789-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 15:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231671

Hello,

On Wed Feb 18, 2026 at 7:42 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Refer:
> https://gitlab.gnome.org/GNOME/libsoup/-/issues/448

That issue is for CVE-2025-4945.

> https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/408 (simplified)
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2025-32049.patch  | 36 +++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
49.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049.patch
> new file mode 100644
> index 0000000000..465f8ed3fb
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049.patch
> @@ -0,0 +1,36 @@
> +From 6ec7c5be50b48d6ce0a09aa3468f2c5725406a97 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Wed, 21 May 2025 10:42:51 -0500
> +Subject: [PATCH] Add size limit for total message size
> +
> +This size limit could break applications, but it will close the denial
> +of service issue.
> +
> +Reference : https://access.redhat.com/errata/RHSA-2025:8132
> +
> +CVE: CVE-2025-32049
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/6ec7c5be50b48d6ce0a09aa3468f2c5725406a9]

That URL is 404. I'm not sure this commit exists (?)
Please target a commit on a merged branch.

> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + libsoup/soup-websocket-connection.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocke=
t-connection.c
> +index 9d5f4f8..9493fdf 100644
> +--- a/libsoup/soup-websocket-connection.c
> ++++ b/libsoup/soup-websocket-connection.c
> +@@ -913,6 +913,11 @@ process_contents (SoupWebsocketConnection *self,
> + 		switch (pv->message_opcode) {
> + 		case 0x01:
> + 		case 0x02:
> ++			/* Safety valve */
> ++			if (pv->message_data->len + payload_len > pv->max_incoming_payload_s=
ize) {
> ++				too_big_error_and_close (self, (pv->message_data->len + payload_len=
));
> ++				return;
> ++			}
> + 			g_byte_array_append (pv->message_data, payload, payload_len);
> + 			break;
> + 		default:
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/re=
cipes-support/libsoup/libsoup-2.4_2.74.2.bb
> index 0cc90a17cc..bd3960e2f7 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
> @@ -43,6 +43,7 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsou=
p-${PV}.tar.xz \
>             file://CVE-2025-4948.patch \
>             file://CVE-2025-4476.patch \
>             file://CVE-2025-4945.patch \
> +           file://CVE-2025-32049.patch \
>            "
>  SRC_URI[sha256sum] =3D "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b78=
23b6018b40d01159"
> =20

Can you send a v2 with the above remarks fixed?

Thanks!
--=20
Yoann Congal
Smile ECS


