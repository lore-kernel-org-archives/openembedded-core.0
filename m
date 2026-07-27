Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719B1C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 10:13:16 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27674.1785147187968473357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 03:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M2zOBGO7;
 spf=pass (domain: smile.fr, ip: 209.85.208.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69f7af97316so3888538a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 03:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785147186; x=1785751986; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8p2u758BYuddg8EDIlxsfIvodO+//AERn6+7bm+Al0=;
        b=M2zOBGO7cPuLwOOGpSfsiyE6YOl9gD1sagN+Ly8Y0fY1JqfY3QZTDTy7nHc3RaKiQR
         ekO85wJU44PWcQCGsl+bPoxBO/pN/7gATXnKz+qk5xqgjs+AztY0TlpbEJpHQUrZNfom
         Qc8ynneOZQtTikm4nEayJ3cIL4ABYR44ItiU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785147186; x=1785751986;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8p2u758BYuddg8EDIlxsfIvodO+//AERn6+7bm+Al0=;
        b=e0Nabz1znT64ChyQcwQLYSAmkn3GYEEtqY/u/L6XTnlrjPPkLH0+r/tpVoR7HdCSKW
         ksz1DOCuE5AofK9+bhUG4C8BUW2OZ9Nre3A3B8sW5nPH/e5i1aAB2UnCPikPkwMdp70h
         Qp/9PJmcDEvUH8XA/eNiDl4TdQarTUaL9l2xuocRnmpPokfPjXTz9cTMC6bFgdcwPYp0
         jHqrzgMuBwC/qoDUQmnToMau3T1TKGAqZnJQZrYXsgJmoJAr6qMwCHtRpMYLtsjHxUgd
         EUjI91Zsf/LNORExijzfFbb29sFWGRcIwwXuJzm59S8Sx8eNtS6YijiRLgcEd7BmsEIG
         LnjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqQNF58a06Fxj3s+H60n00esldhmTMKBOUmzHDU4jusuNA0R5hzvWQKruJG3hOp+gdqsHd9qROkH/5aC7QffjQww==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzN0uQM+Jay7zYtH+pppKYhFOprDvZ85jSChfP43e522EwTGdCQ
	/NNqxNUcyiLgAqbWx2ucOPvjo2buKdQBpGztS4pruyHC87TOtGCFIeVD7y3FsmQaAEo=
X-Gm-Gg: AR+sD13eULZxbCVSuoBKOMWelKFCwLUImIGQQy9qPFA4WwnC57JgvKJWnQycupoLewF
	35rtZ9M1ttcYZeoTwBR6NUG7uwIJIdFB1/MuQTaUresB1R9OffzFmUYdLMc5FGLXuLUSchBceIi
	BtZCjoEHMi8n3L5zaFaM+/C1DJejTkEmbpno4v2ioi1h+BFedhgoEsl+eXW+DCEN2W4vsn5DGYh
	NeaTuIarh32V97fDP8kiv9cKHvC2mxDMSPUqL4G9hs2bnY/FEUjX6xdlRkRqo9rRoClg+Zaa1YU
	hLODbPrhSSykyfg3fXHiz55LvmQbe9u4IBT56Iwh0v7Kqgam1y8UuoMNimKTdLkhWQ99q0LJFjJ
	gVenR0wMw2/DaVdcgqV0hKz0jQ6RTJkZ0fsMSCoon3pBSg5Yu++jtMEMEZ/5LUJycPl++kQeRe6
	gTghNyQ3Sa+Iya+ntjzp6eFM/tsWvNTKe59YTIolS5+cFQ1XY8eEULWLq+Ocv3dw==
X-Received: by 2002:a05:6402:a6c4:10b0:69f:ec6e:89b7 with SMTP id 4fb4d7f45d1cf-69fec6e925cmr1025988a12.40.1785147186152;
        Mon, 27 Jul 2026 03:13:06 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a0002fa679sm717303a12.6.2026.07.27.03.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 03:13:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 12:13:05 +0200
Message-Id: <DK99V3JWQCQU.9V7MD3S1EN5L@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <alexander.stein@ew.tq-group.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH] kea: Fix crosscompilation
X-Mailer: aerc 0.20.0
References: <20260723114222.261331-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20260723114222.261331-1-alexander.stein@ew.tq-group.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 10:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242081

On Thu Jul 23, 2026 at 1:42 PM CEST, Alexander Stein via lists.openembedded=
.org wrote:
> Backport upstream commits to fix cross compilation.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../kea/files/0001-3982-Checkpoint.patch      | 169 +++++++++++++
>  ...002-3982-Checkpoint-applied-proposal.patch | 227 ++++++++++++++++++
>  .../files/0003-3982-Last-improvements.patch   | 104 ++++++++
>  meta/recipes-connectivity/kea/kea_3.0.3.bb    |   3 +
>  4 files changed, 503 insertions(+)
>  create mode 100644 meta/recipes-connectivity/kea/files/0001-3982-Checkpo=
int.patch
>  create mode 100644 meta/recipes-connectivity/kea/files/0002-3982-Checkpo=
int-applied-proposal.patch
>  create mode 100644 meta/recipes-connectivity/kea/files/0003-3982-Last-im=
provements.patch

Hello,

Neither the upstream commit messages or yours really explain why we would
want to backport this.

Can you send a new version with added justification for this patch?
What cross compilation issue does that fix?
How do the patches address them?
Is that just for a specific configuration?
Notes: the current version of wrynose/kea should already be
cross-compiled during usual tests.

Regards,
--=20
Yoann Congal
Smile ECS


