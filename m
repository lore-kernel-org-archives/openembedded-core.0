Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BD2C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 13:28:02 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11229.1785245277579464554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 06:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Jgc0uFhl;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954afac04bso44392005e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785245276; x=1785850076; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VHjA+ma9dsYaXzHSvDpNp9n06tWl+kO1ERIQh8boh64=;
        b=Jgc0uFhl36jkDGnD1vZxc0vzWrcc/Vqu7yBowNTeNXWuaUbF2Aki9do5hU8cQOaATB
         O+sbLLZourXHKb4/RosftlAE2+X8uzKN/3G49cxMQmPMeBwKfBDlpS5h1LdM6xkvtt1g
         kH+Xdu/POvk+V4V+B6ILx4eeIK5aYdSabYJ+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245276; x=1785850076;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHjA+ma9dsYaXzHSvDpNp9n06tWl+kO1ERIQh8boh64=;
        b=XdN1ZuRqH5eQJi1r9/kJ/3Y6qVPx6uCPwIeSC+7jXPuNHYLFZNYnxUu/OOrrdFXFey
         2RBn63pylup4tsrvjBQ/6AoMJoxOj1GMg1QjNKD+YNRVhm/0bMH+w5ZItxkgfFVA956Q
         XM4mHInDcunzinU38kN0egnL/y+Rc9MxVlOBsRaqdZk3e2nhtXFmLLCQzVEnJf/56qgm
         auaQggjgv7ua+2E904mhTpbALuCm0bm5A7rPobWSmSjE8VlAH5oXYfHkuecnuR/v7XDk
         +Fk3Wyaci9U4vwSHigMswWFXhyV5GHBVzpHRdfnCoFDToEtppNjgPzoNxCD/EImUsDy+
         ZSFg==
X-Forwarded-Encrypted: i=1; AHgh+Rqr/qNvUdraVql5LZwaS3SIQlm1EAal1CmMrHwEtSCBXvJMKl7l+9gmwH9hvKPOBXs0gI8WuArqF3oKCQ+h4B7zzQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YywJnduJuiF8IPIoUX0xsmtNo3xqkMZiMhKGbI29tCaYQyO14BB
	IqbEia7muM1yt0HU/AVe7zo2V/xDJmJ6bydQRft+6v+QlPDC5mt7wQ1Jj9SN2XVGK2c=
X-Gm-Gg: AR+sD11i+9lrH1Rh6CsD2Rzbvyrx2VuKbA6CVtwbyA1NY2c5F4c7Ltfy3Nz5Zf6MRH1
	2EHTGgrRyGU3npmxh+N5d+RLYMXTf1mMJlHkc+/PcjSnU0eoxn3bI8lZYxhvGTS++6FVbZY1yr0
	aEDHTfUhtps3Dlk0pQD/Tw9GbMtZZ4T8WdsOb3ciA/D3TfsDb/UwqWD/RCQYwxoXSliOMXLnkn1
	h5p5M5Rmvy8s3JseBjk6mHCEVwZ4WQTPvfXWS9mJrjGbB6LJnHJePu/OQi1Pm0oPC7TB/GQSTM8
	BcBSQmh+b4wb2um7OfzNG6YsjyVG6ivTTlIOh+xsfW/TKRF/0UJYyQn23JmPpV4uCHH06K4zvoF
	etzgZYgdsALVdAhgc1CZmKDrimtydQeiIfAkS1D7R9832PA5dtU8YlTnhtDLFkQwkWpyHMBHr+h
	hF9+ep0gTlKg/lU7F29Jb51/Wdh3166+d6UPy0N5IHUzBUbya7H4PPG5+kPxzr3L855LtGfKk1
X-Received: by 2002:a05:600c:c48f:b0:495:4487:61af with SMTP id 5b1f17b1804b1-496c65cbceemr28487325e9.36.1785245275702;
        Tue, 28 Jul 2026 06:27:55 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfd1a60sm301243685e9.2.2026.07.28.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 06:27:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 15:27:53 +0200
Message-Id: <DKA8MSUA8QRC.3P1RM7SCLTGG4@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH v3 1/6] rsync: Fix CVE-2026-29518
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <asparmar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260724043914.4061351-1-asparmar@cisco.com>
In-Reply-To: <20260724043914.4061351-1-asparmar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 13:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242193

On Fri Jul 24, 2026 at 6:39 AM CEST, Ashishkumar Parmar X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> This patch backports the upstream rsync v3.4.3 security fix train for
> CVE-2026-29518. The direct CVE fixes are [3] and [4]:
>
> - [3] enables secure_relative_open() for daemon modules running with
>   "use chroot =3D no", closing the receiver-side basis-file TOCTOU.
> - [4] routes the sender read path through secure_relative_open() from
>   the trusted module root, closing the matching sender-side TOCTOU.
>
> This patch also carries [1] and [2] from the same upstream v3.4.3
> security/update train. These are supporting secure_relative_open()
> changes, not standalone direct CVE fixes: [1] uses Linux
> openat2(RESOLVE_BENEATH) to preserve the same confinement while allowing
> legitimate in-tree symlinks, fixing upstream issue #715; [2] adds the
> equivalent FreeBSD/macOS O_RESOLVE_BENEATH path. Debian's
> rsync 3.4.1+ds1-5+deb13u3 security update also carries these commits
> before the direct CVE-2026-29518 commits.
>
> The upstream fixed release is referenced in [5], and the public CVE
> record is referenced in [6]. Individual backported commit links are
> also recorded in the embedded patch headers.
>
> [1] https://github.com/RsyncProject/rsync/commit/4fa7156ccdb2ad34b034d18f=
e2fd6cd79adef8a1
> [2] https://github.com/RsyncProject/rsync/commit/7f60ec001a0be63b770707ec=
8b829524c3809a43
> [3] https://github.com/RsyncProject/rsync/commit/f1c24ab03bc85cb2638a569f=
aa60216582fb6c5d
> [4] https://github.com/RsyncProject/rsync/commit/859d44fa4f1420775e4ba050=
337ef32092f2894c
> [5] https://github.com/RsyncProject/rsync/releases/tag/v3.4.3
> [6] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> ---
> Changes in v2:
> - No changes made; rebase only.
>
>  .../rsync/files/CVE-2026-29518_p1.patch       | 392 ++++++++++++++++++
>  .../rsync/files/CVE-2026-29518_p2.patch       |  98 +++++
>  .../rsync/files/CVE-2026-29518_p3.patch       | 328 +++++++++++++++
>  .../rsync/files/CVE-2026-29518_p4.patch       |  71 ++++
>  meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   4 +
>  5 files changed, 893 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.p=
atch

Hello,

This series caused a build issue.
See: https://lore.kernel.org/openembedded-core/cover.1785190123.git.yoann.c=
ongal@smile.fr/T/#mac8cd24d85cb37cd8fa468a51921ac376e238c7f

Regards,
--=20
Yoann Congal
Smile ECS


