Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11E6C54EBC
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:45 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.126058.1672005577660685637
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KNlASZQn;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id vm8so16242759ejc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HA/VgbRt4K5DtgWiWJz+bCKxX+eSYbjrNMB/rIykaA=;
        b=KNlASZQnzAiUqI0T+jEXJmjurw6dOwdUW4OABexoU8GDZgoDikETkG9bWSFkgtgkgJ
         WcNuYlyPYsSdGF+8NR0CCg+X9Tl2I31M+zt2UMhRrRjSvIM+pa9AmCjGmWQw2q8jN5O/
         J6z+i9nsklTNK8mRSvIv2K5Oo7x+f2VNxBRFQ31eCP7z1Ot3K7WcDmybgI3yDCByaSqA
         e3pPKKp0SThwPTdO+7W4kmOJlRJjKBvgDMEw4/H2lesfm/lE3e9arc4XUHlvksYm0tsv
         4Y+C/Lg8x0NQZm0BmVyYXk1Yr2NBRl81cRDx/ua2J6etKkMpuGaoMgZGQRpHZdG6Bf+O
         st5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HA/VgbRt4K5DtgWiWJz+bCKxX+eSYbjrNMB/rIykaA=;
        b=1yI3BpN6mGD3pxJ06c+FffwGbZcTWguYBlSSxjTVeguOyoo6bNZe7AMcCuEMY4A6mB
         /any/Gh6rsLZD+wTvllfRlNFnfuDrhVXcGr6dwbZMQKqXdgoEnTmCRP7iQNWE/c6QSTj
         J+X4ur43JeKLumm/4+bkaoX/jQA/s/P8S5Jv1ZJZi0jevRSYYSEuxAjUJQ42evm7yFhb
         QqxlSTGJeySurwkiihBdB2lW+tPI9n759dAUtjyYex+RoDY0SOe+ZuKD3AnQNiEXoGfN
         XmgpKHtk7TIPqNFNWEnAWUlF57+sHgnGE9+6+8ayWDg/FYrFS1A7UG+f+yZZjj7biIW0
         yUKg==
X-Gm-Message-State: AFqh2kpzNC3OhFSFAK4Q+eMrOEvRWKDVNa2w0IKvw4kC+GJbt/4emCBz
	0l3VlaJZnX26D3EMXF3Jp57HTuT9lCE=
X-Google-Smtp-Source: AMrXdXuvQPD/uGicwjNg4pd40zlHISQOQwsiWMwKfTezTNoFQEGrKhTY7rgEkSJMaGAzWJD8dvwHOw==
X-Received: by 2002:a17:906:30d3:b0:838:9b81:1c98 with SMTP id b19-20020a17090630d300b008389b811c98mr13029131ejb.1.1672005575804;
        Sun, 25 Dec 2022 13:59:35 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:35 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 06/11] cargo: Extend DEBUG_PREFIX_MAP to cover vendor
Date: Sun, 25 Dec 2022 21:59:16 +0000
Message-Id: <20221225215921.12868-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175001

The cargo build builds vendored libgit and curl, but these exist outside
${S} which DEBUG_PREFIX_MAP covers.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/cargo/cargo_1.66.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/cargo/cargo_1.66.0.bb b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
index 6c167c0c5f0b..fe8049b68c9b 100644
--- a/meta/recipes-devtools/cargo/cargo_1.66.0.bb
+++ b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
@@ -20,6 +20,8 @@ EXCLUDE_FROM_WORLD = "1"
 
 inherit cargo pkgconfig
 
+DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+
 do_cargo_setup_snapshot () {
 	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
 	# Need to use uninative's loader if enabled/present since the library paths
-- 
2.39.0


