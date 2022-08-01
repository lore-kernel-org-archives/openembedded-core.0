Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B3BC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 15:44:49 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.26485.1659368680792420178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 08:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N4bFqvLq;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id fy29so21057323ejc.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FL3Wv1U2Emm1trWJEcS+gBi1rLS6wdKF7YkpJpDNRv4=;
        b=N4bFqvLqgDraUXBL+sXNiot4Y3ene/ah/LJjcqk4w+0YDExtrkSxHnagEkB46+QP3D
         5d2hnBMlvTKjgngn1aXqhE/Cr+eZbQWTF2FdEgqzbZRLZQCvKt9VxsU21oc0gPivlP7t
         zPxJGB8US4JX7UmByEpI4bX1SC+vBUO5zf2lKtGKn5jQHFRC/MxBGIVdhR22t0TAQH9Z
         uSAMz2axAtf/zn/Xhxzi7tJ433glazSRHSaXYdfel+25y3nuX5MurOLf6dAOw3Xjt1RX
         jjs5HMiT2YczDkjLBVP0DxWY2mygs6+FGWTVEX3HO6qWThkNkTggqqJzbID87XbkdXQ/
         J5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FL3Wv1U2Emm1trWJEcS+gBi1rLS6wdKF7YkpJpDNRv4=;
        b=HlR8TK50J8d0u9bfP6sZGV9NJK9QkBzUWXAk/2lPub7vBpzchOFVD+P/Pn636amB/R
         kRcjb8Fa9TRdNjHY629pMbv42FXWHvw2q9FCIs8Gy9MlzCAXzvx++265ABI0IUDUjGuf
         ARUo2arqQiB6znPATjgSCfiJUyDocY14dVsRvU3Xl3CREV7Ht2MBWHyyPagTuqSTkc4w
         jO5FOz1a2NVsmZtGh1AyQHcpzT8puAq5GJ3h4Ew+xR2v7QbNMdki1LGzLm1aNDkCUWdY
         CrpXi1ALFuBKfdhbdj5S0KNQAUjMiEH5K5G5Zl5WitftAzd3733mPTgqhGyaoVU65kFR
         meCg==
X-Gm-Message-State: AJIora+F4ycrXosifHGL2BuU6r7V+MTWMXN/y+LPjPxGm0m7L29BJ3WV
	fB/5UhYi0eZ4n1EqVVWVwCOjSy+Dh1w=
X-Google-Smtp-Source: 
 AGRyM1u2tfmp1izuVHosz1PkCGkG7GBFhRBpv99syRskptsljw6+6izbvK0LXGLmP3JJphbcM07Ypw==
X-Received: by 2002:a17:907:6087:b0:72f:36ff:7fa2 with SMTP id
 ht7-20020a170907608700b0072f36ff7fa2mr13074886ejc.162.1659368679180;
        Mon, 01 Aug 2022 08:44:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 wi7-20020a170906fd4700b0072f03d10fa0sm5290655ejb.207.2022.08.01.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 08:44:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] devtool/upgrade: catch bb.fetch2.decodeurl errors
Date: Mon,  1 Aug 2022 17:44:34 +0200
Message-Id: <20220801154434.2673334-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220801154434.2673334-1-alex@linutronix.de>
References: <20220801154434.2673334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 15:44:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168754

Otherwise, workspace cleanup (removing bogus recipe and source tree)
will not happen, leaving breakage behind.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/upgrade.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index c57015eb40..39a1910a49 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -336,7 +336,10 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, src
         replacing = True
         new_src_uri = []
         for entry in src_uri:
-            scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(entry)
+            try:
+                scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(entry)
+            except bb.fetch2.MalformedUrl as e:
+                raise DevtoolError("Could not decode SRC_URI: {}".format(e))
             if replacing and scheme in ['git', 'gitsm']:
                 branch = params.get('branch', 'master')
                 if rd.expand(branch) != srcbranch:
-- 
2.30.2


