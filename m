Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B21C10F1D
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.30738.1671657444730131267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i1dFRSZm;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id z10so5632840wrh.10
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 13:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HA/VgbRt4K5DtgWiWJz+bCKxX+eSYbjrNMB/rIykaA=;
        b=i1dFRSZmmhWa9gvdrj6e5naSac6Fakbxt0C6EW1suBaD6S94nNg8bT7YV80zw9b7Vx
         r22K84oA2DUNGIiiU/qSQi3ee3yn8xkCuWoFhtVii9rwytc4zMnzpO12fhxT5CQA1DkE
         NKDtODPg3X/FdimQVC4f1/cVkY3TpJqnnD2R83wo/ULFAQEym/JGKEq/McGtbk5aw7F5
         chZRWrUKyx0qTfawM20KwayQ0ZH1+wSwib3iMphx7t6ngDedDgT647jH7U7DH3ogYm5O
         +b48M2zTICkPUj2Q7ro1qbcx4TfqceIR/RL+kNNkF5qnd9kTBiiFWMtXjGhiiu8XYLtF
         QgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HA/VgbRt4K5DtgWiWJz+bCKxX+eSYbjrNMB/rIykaA=;
        b=s+tZbQZJtEL5nL3SkoI1j0ExMvVpF/Y5AUBRJOgBKE/eL7B8Bk+kI+pQfRd8QpBnh3
         dzkokwsfJnlsXdMuDX9HXPBOtz3g2+7PQZ4TWCNWsZ91r85cJQrr+OpKba8sV7ALzZOE
         HpssX19Z+2zxo5lvv+NDq0o1HaKlfR86Yx/SbwTovCEVU7nYnfXaXaeWmzqzSPmpBrjD
         AJhxQ/+YAOaQ1CETE3mnQ4UWuV6R4lEJ7bi+lCwAsLlKtzU1wy5mh8R0rfMqdDNydFof
         k+pU9Gu7jrS+ogO1hxqe8oMxFMO9SLbQmdvoA0OlF52L2EHSnerhlFOjKIvLZ1JSLGVU
         2V/A==
X-Gm-Message-State: AFqh2koIqp69RNMjo57RrG68GWMvl7dEyFPAp6yHdOjjDCM0eSIGJAO0
	ENRcLKUzHbLqDPIartcKrcII1AaSFEM=
X-Google-Smtp-Source: AMrXdXvmZ8ekFdtWqqvK0WYFDCKpwb9zSVWissULrbmAN5b7Zi0+sYWcxPI8p2OaYKzcIt346oeSjA==
X-Received: by 2002:a05:6000:120a:b0:24d:58b3:e55b with SMTP id e10-20020a056000120a00b0024d58b3e55bmr2261130wrx.22.1671657443124;
        Wed, 21 Dec 2022 13:17:23 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx25-20020a5d5b19000000b00225307f43fbsm16312442wrb.44.2022.12.21.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 13:17:22 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 07/10] cargo: Extend DEBUG_PREFIX_MAP to cover vendor
Date: Wed, 21 Dec 2022 21:17:03 +0000
Message-Id: <20221221211706.25347-8-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221211706.25347-1-alex.kiernan@gmail.com>
References: <20221221211706.25347-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174947

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


