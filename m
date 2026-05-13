Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485D8CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 12:56:21 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4310.1778667624165221516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 03:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eI+XyTiR;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: jackson.james9803@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3660ab73adbso4357530a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 03:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778667623; x=1779272423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5k8aB5hjihHq+pEmnmwooFg7HVtSOtussEkv1OqYHGU=;
        b=eI+XyTiRKde3hGn67syIpnY4KjdSKPHCQYJp4ntwpPS/cWCR3oQkgVnz8nfrVTwCIC
         Mxr7CzoF1MHvByB71OlXkHykKlkqcjjLctI8mjzZtAHhFw/bpWwta4FouhLpJG3GBw3B
         D8exHKvLgor8i7kMWaOEsDUSUEPpLy3BUHDn4n27tLXGwY7vGrV4HDOoGJOqin5BF3nb
         wupPXXwyOTBd2l5VrDZ1Cru7OhxqYhNtlxtu37qK3kriC4WZZ3v84xEWVFy4OIZlpAHm
         dfjbVNJM4UdGkw7Uom9XFY8AVOmb8kchiFyBW0LYNrcF9SpSAa4wzQXh8O5KHAVuWTQA
         OCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778667623; x=1779272423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5k8aB5hjihHq+pEmnmwooFg7HVtSOtussEkv1OqYHGU=;
        b=h4BBuF7a/caXsv3OuvrabTyt/jQ0DRt9LRg04XYt87mS8PIjV5TCYADtlA1O6/1Cgi
         RkS1gtsN36kYe4kInI+4i5pryYZ6gEuGCPpAMWmPXvmeG7Kbn9WtKsg2Gml19jMV79IT
         sQnY4hvM46+0mOzPgEIUEGdaeosyx7toezrVQCaMx5EycSNwbJbRJJ5cM1WOKhkoQ26x
         ksc2Chr/htsUDjEbvMYDy5uXLW2G/dLDAMb25RnlbO0Wb4DSmrBEM6YDwaltwmB5p/GT
         QpKss6fZQajuFc2y+eXjk6PSJ7wCOwkSuHd+JlSKNLhPeUVZT7vyMt6ksWnRvMEnwoL9
         M/Rw==
X-Gm-Message-State: AOJu0YwX61OoNedc8SbAAcDFffagow8L2okuQhaane2Yg7iRPHgSuy8I
	phi9A7Tvty/qB4P47yPxqFSHZsjo2yuk+gEpcFWLotZd3rhoM2xqD0bUmQhb8A==
X-Gm-Gg: Acq92OFQZicsHrJp+xuj4fJXoxLZb4Z/DnczQwA3GbIx84wRqZpdmkTapCApK6qBmRe
	DUoj4WM4eqchKs47jhQadwXyF06wUYcH5v6ymEkFxweEOwJnxwHZS0C6on5kDcjGOTRNB/ysbGT
	o5+2BicTVksJv1Sl/lUzdz9iicxAaNHLa5ZEU7XlAAk8QLpPzdOaUy7MGofAMXhFJWX4nThGLIS
	Ohh3FUxeA5NATHs6dXGcIiVMGqC6D32HHiKdLn8mwwX/8N3Jq2+OXM+KH93KwTPtF1GDFg+D+y7
	5Nd5KrI3WSBnac66Wbn9Emj8rz6huZs9XsJaF0mqdaQ8W5AgJzQ8QU4Ui05HTQg1FMixCOt5+Z0
	mUwZXoWvFq6WpaLPKVcdEcw4peWhNPlEADCJhXX8FASMD5RtgCJJQw8GjltykIDMKF/tk/6Aat8
	z5Y388MtubY42zMMBpXdjJXs268g==
X-Received: by 2002:a17:90b:3d8e:b0:368:3fa8:dbfa with SMTP id 98e67ed59e1d1-368f3bce573mr2233404a91.7.1778667623084;
        Wed, 13 May 2026 03:20:23 -0700 (PDT)
Received: from LL-868L.kpit.com ([49.206.134.86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf5161sm3569187a91.2.2026.05.13.03.20.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:20:22 -0700 (PDT)
From: Jackson James <jackson.james9803@gmail.com>
X-Google-Original-From: Jackson James <jacksonj2@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] cargo: set CVE_PRODUCT
Date: Wed, 13 May 2026 15:49:52 +0530
Message-Id: <20260513101952.289236-1-jacksonj2@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 12:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236972

This removes mediawiki:cargo CVEs from CVE metrics.
* CVE-2026-39837, CVE-2026-39839, CVE-2026-39840, CVE-2026-39841

Reference: [https://git.openembedded.org/openembedded-core/commit/?id=a5cb71e7df95925a5c342c341e699e244b1b84f6]

Signed-off-by: Jackson James <jacksonj2@kpit.com>
---
 meta/recipes-devtools/rust/cargo_1.75.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo_1.75.0.bb b/meta/recipes-devtools/rust/cargo_1.75.0.bb
index a6d3f1754b..573430ef4e 100644
--- a/meta/recipes-devtools/rust/cargo_1.75.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.75.0.bb
@@ -17,6 +17,8 @@ require rust-snapshot.inc
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
+CVE_PRODUCT = "rust-lang:cargo"
+
 inherit cargo pkgconfig
 
 DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
-- 
2.34.1


