Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423F3CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 10:22:14 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8053.1790936529689250474
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 03:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2OXW/CbL;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso39798915e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 03:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790936528; x=1791541328; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoxobYiROAyE0hgc/9fXWrrFXkRxK33vePVYe96WI4o=;
        b=2OXW/CbLGfnXKVkObiwIJTtn5bUJOzaR0Z1sF5+DiTXRdHpGS/B4YgkoJgd0x+NA+V
         MCAqZC56EBiMNnu2+GXLkRbE5MElB1gVDNCUmGwL6CQoNMv8pajzxA9R0EQ3k0G21Kdw
         v8pmTG4M+2NUAK7G4fEaJ6duXF+FibHrRcv/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936528; x=1791541328;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoxobYiROAyE0hgc/9fXWrrFXkRxK33vePVYe96WI4o=;
        b=RZ6QbsyMxYjK/75exQlQHUIK/7PQHnVubgw7AS6rwZ1Vh9KjAXG5iXCM2GUgxBt64X
         XF1ODfDvked6xdREJFCmXIGutlFxKPgAXgSvItVyBIL+KiKvv7f1a6aFJshl5EzxuWm3
         JeIMU8rU5bEYRELnhi7eGYCDFMt5yBx+49dan6+EaghQktcmWUXwhOyqftCJGFDVyRTn
         LA2tL1T0XNJSMC6rf2ld6GLU1uIM7Tnt7uDaXHuby4bVkDnkAutbKjcXexcnoqvr6+SS
         j28Ksnbolyk/TdAc4LoxecKFaCPIg8hRAKZ3dXf9WLUTGr+Z0R2sYpq3WLgmzTBN6yDw
         635w==
X-Forwarded-Encrypted: i=1; AKwUvBzQHv6xMF9aGE2Ic0KP8OKVDh4ofPO63+iQcLNzygL2uFMcq/Ag9VygZJHyFjBKXGPyf/lAB8/L/pBFeeMVtaCVXw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kwXHDXXof5SbJ6FPdxibLeXHOCcd41mQ9Jaq1ChvyZl8FmvMkh
	oWKWGLZR5HbXXp3MGYuoKOBrH8LMPedxHzXi46Yac4tO/bsRW3pkinLyyVfBfqOI9zc=
X-Gm-Gg: AYBFou1O5L2JyTZaP1b+c1vyqN012ieKWKc+D9dTfgfakG1oRh22B8sSD1QJmqSvlvM
	gn6LoYNZkCZvwyC43BQT7OTApBfssY5+Mg1HIqUB4iE4RkGU/QfyV8iqN1clOecQMBr+nC9pnnl
	2qF0wl7NoGr+0dYJbD3+O6BWFZZK+bWgwUIUTd4ZWuE2Htqa/WSK+EVY4TzerKGg91QzwMtA1gU
	TSbPeEGGFZQXzSzJkZ8l7td2Js1gmZJ2tqEthVIgV5N7ynAYWD982W0HRsbGrj5aAl01NhKzqlB
	EfuU2SqU1jBawImd7Z3I9EY508gmShqd0JRmYZrKzNHb/7O/D2EXD3b0A7m1/STEGb2k7lpCNIK
	1A77oQcui00yawVq5AshXRjHL4vA8fIeSPy6VsNSiG78IMbFLjODrcMZxQPULV8LwiSZYPZLWcX
	NRD46JMYUdpGmoMYE1RbJL0ZVHh7mX0O+ZZDPjFXWwKTYnZf13vYq8Qb2DVPFg9rbRlppXTB4nr
	EVgqvI6NB76MUN7XinzcbTDHWu26jJ5ddjs/4LojG/Q9Sr0vJWHC9Rt6W4AsA==
X-Received: by 2002:a05:600c:4e93:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a02756efa5mr43117105e9.12.1790936527845;
        Fri, 02 Oct 2026 03:22:07 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm69650095e9.1.2026.10.02.03.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:22:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 12:22:06 +0200
Message-Id: <DLUA0IDDMIN2.1WN7ILFAZNFQY@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 1/6] bind: fix for CVE-2026-10723
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260928071115.304055-1-hprajapati@mvista.com>
In-Reply-To: <20260928071115.304055-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 10:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247099

On Mon Sep 28, 2026 at 9:11 AM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1], [2] & [3] also mentioned at Debian report in [4]
>
> [1] https://gitlab.isc.org/isc-projects/bind9/-/commit/c9cb6a5e24e43489cf=
3fd4d4cc2193b6a74499cb
> [2] https://gitlab.isc.org/isc-projects/bind9/-/commit/35e3d49d2222c13786=
a06021c7ed583d2a656e51
> [3] https://gitlab.isc.org/isc-projects/bind9/-/commit/833dd3b230b9259607=
4e8da15b12298f46c939f2
> [4] https://security-tracker.debian.org/tracker/CVE-2026-10723
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../bind/bind/CVE-2026-10723-01.patch         |  70 +++
>  .../bind/bind/CVE-2026-10723-02.patch         | 496 ++++++++++++++++++
>  .../bind/bind/CVE-2026-10723-03.patch         | 310 +++++++++++
>  .../recipes-connectivity/bind/bind_9.18.49.bb |   3 +
>  4 files changed, 879 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10723-01=
.patch
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10723-02=
.patch
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-10723-03=
.patch
> [...]
> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-10723-02.patch =
b/meta/recipes-connectivity/bind/bind/CVE-2026-10723-02.patch
> new file mode 100644
> index 0000000000..a3ff47b8bf
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/CVE-2026-10723-02.patch
> @@ -0,0 +1,496 @@
> +From: Alessio Podda <alessio@isc.org>
> +Date: Wed, 3 Jun 2026 10:42:43 +0200
> +Subject: Reproducer for #5874 NSEC3 impersonation
> +
> +LLM generated.
> +
> +(cherry picked from commit f3e2eb333be3ac636f745aa13cfb8d9ee8af87d8)
> +
> +Origin: https://gitlab.isc.org/isc-projects/bind9/-/commit/35e3d49d2222c=
13786a06021c7ed583d2a656e51
> +Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-202=
6-10723
> +Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE=
-2026-10723
> +
> +CVE: CVE-2026-10723
> +Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/c=
ommit/35e3d49d2222c13786a06021c7ed583d2a656e51b]

Hello,

That URL is wrong and return a 404 (an extra 'b'?)

Can you check please?
Can you also check the other URLs of this series?
FYI this gitlab instance seem to be under load of bot pressure and I
can't reach it right now. I'll also accept
https://github.com/isc-projects/bind9/ URLs (official mirror).

Regards,
--=20
Yoann Congal
Smile ECS


