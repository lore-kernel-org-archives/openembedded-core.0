Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D91ECCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:09:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35598.1792418957981385862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Rp4iJAuU;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a01933b584so15471605e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792418956; x=1793023756; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w2Vu+/csFB0fvD+kOTgX85Q9tpS4gC6H6hhEaJ5G6IY=;
        b=Rp4iJAuUwKGi0Kwca49u5xIf5yBNqYQ5S8CR30MzL8ZOCurMlCqyTn6hpAMfoUBl4U
         rnLxCeiflgyg/wn5WoHTz4JtntBP25f3TYSh476QX5emnbYuhApBZmONQrrpE73PqdCG
         mgbMCdIdSGPZBQyu23LcfrqfXBPdwQUJMTQ4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418956; x=1793023756;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w2Vu+/csFB0fvD+kOTgX85Q9tpS4gC6H6hhEaJ5G6IY=;
        b=VweFsZH5oysFNUbx12fwf8qymq3o0veq3EJh/5agjUrZWT7WLE8c+Rjx09TNlGUK9Z
         B22ozykCBq2Q7UdDOkLFE74tGT6/B+DJhNXpN9m2HQggcGgB4bw2FHxqiKdt/8a9HLsI
         OqC5/SoSCZB+aMJu6cHJ0jqrI+hfp98zVLJczlMnl80RvnSZisvrIxcii1/jiNyAYFV8
         9Owq7wOg+JbDWaNJo9Q1LfLE+J2mxeP6VmTxzvWN/VVEWXGfVyNge41th/J6nt0RofjC
         0B4xK5W6toQuaTOya4eDvz4c36qzUZ5d7i735JE3Vv5iVPDLpaJFS8pxt9YOBKTbJpIC
         frfA==
X-Forwarded-Encrypted: i=1; AKwUvBwx71MXbwU/mzXYjj6GlIYHFoc7QNJ+A+ZMJQIrcR8cCPk+sF3l2sxRbVcR/ZzgiQ91LagUNgIhp5CB9o00871Hag==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJ2eUKskso/UO9t1wgiRjTEVldUdG7yR3Xv611sToRGEZKiht9/
	JM4iXHtk/IgKxKeG/uZDScaC35ZmLvkDj9HQb34r04Na5n9FkekPSLBS8Hzt3Gcudno=
X-Gm-Gg: AYBFou1+cWAv9pG59JlQdFkRNfWYEfZVtxoh23H7KkmaYzWLYmaJUlfSLrmn9O4UQGX
	igXoTCKe/5Wk+NOQ0HlMJrqs3xsvgwHJ3CTJF5Y3cH8h/b7viZ1WkfLnvQlPSiEfZfmMkrs6a5E
	jcjbzOfRBBclE5S4UFxv+kDtUK8nguf/A8Z5zRL38wTmGXVAH/LGMjFDsAxSg3fJZVXVYqu+i0u
	GS4YcjOFTScvD/fAR/Qvgjrg7NUdymhXeDtamb3RTddOm/m4HmjMfY6qt+aBWv/fsM2BJpleg9N
	DWL+6tuMDmGaszQLtcyn21IwgTY5/0/R0JD1Ky1Pi1IrJWmHaoapOKzSg44JstVu0f8JgHx0dgZ
	2yKdNtuufV0j0yZ/4cXGnCFupOyAwXiYrW+g23YplStL4vwZLFwx4+QcaMvLxmVjA6f01Q6BSVn
	57noJlvVvmgaByzIcnzNnCzEo/wajGUNPSkeAyOxbFDo19EsLqn52SB7H8yONleZpTF3FpKd+m7
	UDKKsaprYXzq5B4XYlbaSHLCheuJdfdamjoTdlynpRYtqKvKsf5h0GMD84Caw==
X-Received: by 2002:a05:600c:5492:b0:4a1:e4c4:f6a9 with SMTP id 5b1f17b1804b1-4a1e4c4f8a8mr80223685e9.23.1792418955937;
        Mon, 19 Oct 2026 07:09:15 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cc642573sm229531155e9.2.2026.10.19.07.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:09:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 16:09:14 +0200
Message-Id: <DM8VHO5HY4L5.2OTI5CNBGV9OT@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-105841
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016033726.426908-1-hthakar@cisco.com>
In-Reply-To: <20261016033726.426908-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248171

Hello,

On Fri Oct 16, 2026 at 5:37 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359ae=
c96121215bd
> [2] https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-os-command-i=
njection-via-lrz-pipe-mode

Where does [2] reference [1]?
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch | 267 ++++++++++++++++++
>  meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |   1 +
>  2 files changed, 268 insertions(+)
>  create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.=
patch
>
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch b=
/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
> new file mode 100644
> index 00000000000..268218fb8a6
> --- /dev/null
> +++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
> @@ -0,0 +1,267 @@
> +From 9eef71ce20fda2b345ef8431359aec96121215bd Mon Sep 17 00:00:00 2001
> +From: Uwe Ohse at akiar <uwe@ohse.de>
> +Date: Mon, 10 Aug 2026 17:55:28 +0200
> +Subject: [PATCH] remove topipe 'feature'
> +
> +CVE: CVE-2026-105841
> +Upstream-Status: Backport [https://github.com/UweOhse/lrzsz/commit/9eef7=
1ce20fda2b345ef8431359aec96121215bd]
> +
> +Backport Changes:
> +- Retained sys2() and exec2() and their declarations because 0.12.20
> +  still calls them in its separate, opt-in ZCOMMAND handling. Removing
> +  them as upstream does causes undefined references when linking lrz.
> +- Omitted NEWS because its 0.13.0 release-note hunk conflicts with the
> +  0.12.20 release history and is not needed for the security fix.
> +
> +(cherry picked from commit 9eef71ce20fda2b345ef8431359aec96121215bd)
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

That upstream commit is not in master nor blacksail as far as I know.
Can you send the proper upgrades/backports?

NB: I suspect the same goes to the rest of the series, so I'll wait for
your ping before reviewing it.

Thanks!
--=20
Yoann Congal
Smile ECS


