Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB6CCF65CC
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 09:59:46 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16920.1769421582641637405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 01:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YG3q34nb;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-502a789834fso37534081cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 01:59:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769421582; cv=none;
        d=google.com; s=arc-20240605;
        b=iwcxSxTl4PkD5A11bBUS7h7gDzdvhpPPu2LbY3UiTqqoNlNviJIFsoUShHAJT9eVNj
         TmWHynsTcvYO+9sM7LvENNVG0E8nF87V9F8wFtmMufbQwhL5VaUpy2PbXAjdJ3oxEA9M
         NwOvrV0JRxVemnlgtCIZTXVc8KNc+e5RMcsDGL4jsFzB0MQqt7W56eyHBxkpifJ/FMU2
         XDu4VVjrilmOmJiVwUh3zyR+u1M1FTJ59RSu7iy8MPFcTfjCzENDYpcDjePHYH7Nx1xB
         wYSczB3h1uqCxmr7uRq8BwLvz6bHxdl99rBuT/Z8Sqo01k+LXYVsuXGhNdZ39C9qck0W
         vCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=glxKJiR3utUQDMlaWAuZ2CQIt7nPLOXJ4G2vXj+7vkY=;
        fh=auW1MvM0y56SOCCFl+00PynN7mYqruBic9xsOz6Y2PA=;
        b=hK2MaQ25vNJYPLlu7BCIHskMzdCps1Y1fqsoKhphIfaTFii2mk2hkGGn9HC4RzMwwZ
         2G1ZVpTRxBPvv2t1UJT8rUQmL3YWnOJxFi7OB9kgE6Ig/u6c2LaIf0ihLsPP7X6DsqZ+
         uV1vpeWBk1+mo2Mu7LeQ5th8x/O4HBvJ9L6ayuhRA6IwI4B77wvKRtAlV9GsSa1mM8n7
         hlf/o/XwvuaTitkyrbuWvPNcNuplD/OqKAIs9iLk8BQEg5jMHe74tRtlSldAJAbKMU98
         imDatmcTctn0E+DFEg/m8YdgL1heiw1LXgLhoOOgjue0DdgrR+FBoRnXC92PFGE/ptE3
         jOnA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769421582; x=1770026382; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=glxKJiR3utUQDMlaWAuZ2CQIt7nPLOXJ4G2vXj+7vkY=;
        b=YG3q34nb01r7j2Lovqk4e+onNE2i1toFijo44zaJlkw1/KMPSDox2QXS19qb3cc5m2
         X9/oagMcTMx3XlxrzhO/rJoE0035j8dwazUb7fiYQB6yh5M/3tAhhAfCz4zbDm7W+P5U
         4qFgELKu/e7FRcG8Yn8t70mb87yOdSb2BdFYyx2I8rXrG/x6MKIY1n/wlaJFj/t6RTXE
         p9kStKvLMaBPoPmwNwhLQTnIUsTTHoU/InGDqlg9UT/xcUIql/haxIxDyrVRWjBOVCh8
         ci3VurpDaDYYU2CyNkDtucaGbkk0D9n7Tgi8VUgD5qUVtZk7+BKlSJc07kGYHyuOeU8y
         UgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421582; x=1770026382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glxKJiR3utUQDMlaWAuZ2CQIt7nPLOXJ4G2vXj+7vkY=;
        b=eYjJttjrMiHgYVtMDyvvV/DEO9qRjoJyK3jN6vQ87hVV675M0E6dTbMlNtZ+rGWODG
         XiLJDsCtDF3DfO1BX61mRN9wRIaYf0gUm/jJEEhiD9SiZ1iDnpdofunoIn5hKLwwxz19
         Cf8jQ/KziTHJxHk8+C2n1Hu4SqZh7S9hXpIqbHXrla+A2W4eyibF4AGS3cGK8vVsiM+D
         nl6+ACvfUQiONystuEu1tQ8IwBvtlkz+H41Dd68o8/Vm0YKn8vu00PPIZcm5sIQuR8nf
         yF8t6+xm6CJMO8up2bSwPA/Hb1AkVBK2fdHMqQNrdNOKszk59M66asx2YrlWjdS/I1d/
         Eo8A==
X-Gm-Message-State: AOJu0YwLWiDoVAjQEVfk+QV3PHFi6Skrlq4+6ocVhvgT8YBK/A1sl4PF
	0kRqsPGZRSzL363qIsWaMLbfees5OKZz3qBHPe+kbBFSczmns6UBRrFdB1EGi6PFKUn3GMSQAsi
	7jlimBbZ/vgZc1Btzhu4mcn0FR0Q1PUU=
X-Gm-Gg: AZuq6aJ6gEofPbheM3HdSTAEUK6Tr8lt5WO1qptFK80W0qhGgW4POStNB92MY547bcg
	HP2LpKc8hfWrw5S3jfeEVOQ9m6B1qH2DtHtGXLkhHxt5oQ63+4qJRkwuQkQOg10hwYlwnCn2oeI
	Y2C415AyhLXgPtcg+eaKQVl43LbsuxgGHJXq0RBLdVy5Ci0PLqklSi0bhQsoU7ieo+MQl1zjRqg
	418FkMaheWGRrT09ZoQ8FiMIkM3kR6RgSaj4K92K9Jp8tag7KlJXb7UDg3yTOZwQqRakGVr+u5q
	VDE2PQujfd+fg06dd3zlmgOIBODQRQ==
X-Received: by 2002:ac8:5d44:0:b0:4ee:1e95:af68 with SMTP id
 d75a77b69052e-50314bd3750mr42557111cf.36.1769421581446; Mon, 26 Jan 2026
 01:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20260122015855.2022014-1-yi.zhao@windriver.com>
In-Reply-To: <20260122015855.2022014-1-yi.zhao@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Jan 2026 10:59:30 +0100
X-Gm-Features: AZwV_QjZtCIQFV2CqZDn3b9RlTKTyeDyySaGxq31lP8GkyVl8y7pQzEnTMYlYEo
Message-ID: <CANNYZj9m=R8boP=A8_-iuJ9YBGXoSx+dAcn032GuWN-zNiCxeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2 v3] blueprint-compiler: add recipe
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 09:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229976

On Thu, 22 Jan 2026 at 02:59, Yi Zhao via lists.openembedded.org
<yi.zhao=eng.windriver.com@lists.openembedded.org> wrote:
> +Subject: [PATCH] Make python site path configurable
> +
> +By making the python site path configurable, we can set the correct
> +installation directory when enabling multilib.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +-  config.set('MODULE_PATH', py.get_install_dir())
> ++  config.set('MODULE_PATH', get_option('python_site_dir'))

This needs further investigation. Why isn't get_install_dir()
providing the correct value? It should be multilib-aware. Does the
recipe need to inherit python3targetconfig to ensure proper target
paths are returned?

Alex

