Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A44FC3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 21:52:23 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.4010.1721080338337555778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 14:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gm37dhba;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-703775e4d5dso2463136a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721080336; x=1721685136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mR9nziAa/xiUHhXEQXLGqL3dWQYCCRTQILOGBAwJUF8=;
        b=gm37dhbatWmtlxUi4b7oPlGAQ4a+RQgoEME0o8625H8TJ7yx3Ws/nvb5RbcqtwkyNU
         Psi8qyq4qfMvtOLi6SVIZqiGZow8A77xbjRqNaso55Stj2gIc4ZWKtUvca4WvCmZVAaM
         IRBjuCfh7U2xFbsbZTKWYyzMAMxn+ivXIkFch6/wskjfrVDWMvcoaCYlNswd9AhoKKom
         jf3p10uVwyTCxdbVd9UmYIFr7hTKH9nlwgyY/yzogCCewsax9JQS8dD3YfVjRNOA+iWq
         mzCwxWh+QCH3cVS00piHvIB3iofY5fyeFoSfEi5U81yV/BhqqVwgKL3wfqFiQNbjcjon
         X31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721080336; x=1721685136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mR9nziAa/xiUHhXEQXLGqL3dWQYCCRTQILOGBAwJUF8=;
        b=cdUkf4hR/nhdEZKQzy33ij2b+DKyI2Gea/1lkAGKOfd/BTCU5LpPt0Phn58uXMyiCg
         fQ7Hk9E5BEPVJrsQ59HYorybnUH+xn9GZ58fGAZe/mJ5yxDFgK5oFPYjHIfkTLi0Usa8
         mxIDyxumdnW9p6v8F+jQ5Lk3ytGK5hMlxedJUHK5JnjLvKbu4aMpIDZl/85kHv20ilFU
         Nh42mm524aoUorFXVgC2W7nHve6b06ShBSFqttG9feOPEWZlGjg2spcUIbuLT3Mt9Hhs
         Ks8R5WefVJkeJ+UQoVnBwlv1qNiVfw6WoPEJEzcIP73AX8i2J1BaHzX9pPNW4WvhdRUF
         Dc4Q==
X-Gm-Message-State: AOJu0YwU2yxcjavKsIRQOtzdFHALnuFEUh00qW95UCY35Lb5evRmwqJQ
	UtmiavT0JDgMNxEOBneYXNhY5i0jB/YR1WDxTYBVa03rghvyd5gaIbnfcg==
X-Google-Smtp-Source: AGHT+IGH9KR6KWL/G4u2qV3mX7/9cQCdVRRy5WIS+S1yU54u7qHr2ay9ZpDKo58xWSAue+/XGU7mrQ==
X-Received: by 2002:a05:6830:3903:b0:708:7dbe:61f6 with SMTP id 46e09a7af769-708d99b455fmr585239a34.29.1721080336437;
        Mon, 15 Jul 2024 14:52:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::8fe4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708c0c78e93sm1130328a34.31.2024.07.15.14.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 14:52:15 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes-recipe/multilib_script: Expand before splitting
Date: Mon, 15 Jul 2024 15:52:12 -0600
Message-ID: <20240715215212.1859324-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 21:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202072

multilib_script.bbclass was unable to work correctly in the case where
e.g. a PACKAGECONFIG removed the script that it was intended to rename
(as an example, the "trace" PACKAGECONFIG in cairo). The way to fix this
would be to do something like:

 MULTILIB_SCRIPTS = "${@bb.utils.contains('PACKAGECONFIG', 'trace', '${PN}-perf-utils:${bindir}/cairo-trace', '', d)}"

but this is not possible because the variable is not expanded before
being split.

To fix this, change the class to expand the variable before splitting.
There are two cases to be considered that could possibly break:
 1) If the RHS of the ":" contains a ":", which is accounted for by
    limiting the splitting to 1 split, which will leave the ":" in the
    RHS in tact. Of note, this works because ":" isn't valid in a
    package name
 2) If the RHS of the ":" contained whitespace, however this would have
    broken the mv command written to multilibscript_rename(), so this
    isn't occurring in practice.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/multilib_script.bbclass | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/classes-recipe/multilib_script.bbclass b/meta/classes-recipe/multilib_script.bbclass
index e6f0249529c..a7a08930b7e 100644
--- a/meta/classes-recipe/multilib_script.bbclass
+++ b/meta/classes-recipe/multilib_script.bbclass
@@ -28,14 +28,12 @@ python () {
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d):
         return
 
-    for entry in (d.getVar("MULTILIB_SCRIPTS", False) or "").split():
-        pkg, script = entry.split(":")
-        epkg = d.expand(pkg)
-        escript = d.expand(script)
-        scriptname = os.path.basename(escript)
-        d.appendVar("ALTERNATIVE:" + epkg, " " + scriptname + " ")
-        d.setVarFlag("ALTERNATIVE_LINK_NAME", scriptname, escript)
-        d.setVarFlag("ALTERNATIVE_TARGET", scriptname, escript + "-${MULTILIB_SUFFIX}")
-        d.appendVar("multilibscript_rename",  "\n	mv ${PKGD}" + escript + " ${PKGD}" + escript + "-${MULTILIB_SUFFIX}")
-        d.appendVar("FILES:" + epkg, " " + escript + "-${MULTILIB_SUFFIX}")
+    for entry in (d.getVar("MULTILIB_SCRIPTS") or "").split():
+        pkg, script = entry.split(":", 1)
+        scriptname = os.path.basename(script)
+        d.appendVar("ALTERNATIVE:" + pkg, " " + scriptname + " ")
+        d.setVarFlag("ALTERNATIVE_LINK_NAME", scriptname, script)
+        d.setVarFlag("ALTERNATIVE_TARGET", scriptname, script + "-${MULTILIB_SUFFIX}")
+        d.appendVar("multilibscript_rename",  "\n	mv ${PKGD}" + script + " ${PKGD}" + script + "-${MULTILIB_SUFFIX}")
+        d.appendVar("FILES:" + pkg, " " + script + "-${MULTILIB_SUFFIX}")
 }
-- 
2.45.2


