Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.7153.1624453607095060080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 06:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fXY7gmu3;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id p8-20020a7bcc880000b02901dbb595a9f1so1314322wma.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 06:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lHNGld65zxG6qly2/AnpwtpXUGdwGSclyVdOuB96KaM=;
        b=fXY7gmu35mrN4U6ovuWOrS+OsjK9f7OTThZ7k0E9dK9lmPQRDGbFXlEKVbEzF8u0Bl
         ipEVfjO1Bh5hJQtlR6bV5LEllQCU9LB4DD2xEoxJD3iPNOr9aGvSmwkLRHUez/b3tArb
         1ScYGaHtA8p4auifjhlOd7S0aMm+sRZ5lkRxLFpJck+spB22+aj7U0w2jXTSnBnoM/8J
         DLmso2HzUAx4yehxYWRFq7pLAA8RjKDA0iCCvNyXcDqtIiocb39/GPjekjhlrAf6nbCa
         iypB/+S8CZvnU0fOD+TnK8VSZL5fAsR+709o/8hR3lA7AMSV4u/AkakRnNFhPcQpi1Mb
         d39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lHNGld65zxG6qly2/AnpwtpXUGdwGSclyVdOuB96KaM=;
        b=GqbsmWKKBgnxHzp9ARF88bkjNmFSfNODxQBXlR4CPeuP4gkZUC2G5aocDTjdyQ0xNa
         PDIg0TXTZMwuqcKjwnR7wzB2i+g+8x3/1fU9Ue9jA47/6Yg2QUk4Y/wXRrSemSeGIp/o
         T0yCTP2nYwmCkkSNthqcOaVVnD5c45pvMb1WmiRx5/VgjnRjKr/UUfqYJk2qGUAT+qTS
         65tq0S9Zqj/9Us7MlqSrg7UBCqnDXm3JPbpSbqaCfFJ5am9JRLH8xVTlbkyLFEseNOYr
         rkTstY8s/nTzLQLh30Sl+DyWQmL6vQMLye6HWzOMFee9utHDOvSKXv4kQtr23BkINpUQ
         XlgA==
X-Gm-Message-State: AOAM532i6uNYKqOnEu6GTRLv/3UWEzqmztDrAvGSxXAncjgiXKfXNfsX
	h8VdZ3VQd0azkadG6BCMUQOkomP6h5s=
X-Google-Smtp-Source: ABdhPJyozBDlilg40Z8ndu1UgJLwxaefQxo5hdB/kRagdsi69AxKVUaDgC70/B9j0U54NSrO7cuHeg==
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr10435371wmj.59.1624453605473;
        Wed, 23 Jun 2021 06:06:45 -0700 (PDT)
Return-Path: <frederic.martinsons@gmail.com>
Received: from SGX-CMP-776.sigfox.io ([217.114.204.178])
        by smtp.gmail.com with ESMTPSA id y3sm1752155wru.78.2021.06.23.06.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 06:06:44 -0700 (PDT)
From: "Frederic Martinsons" <frederic.martinsons@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH 1/2] externalsrc.bbclass: dynamical change of DEBUG_PREFIX_MAP
Date: Wed, 23 Jun 2021 15:06:36 +0200
Message-Id: <20210623130637.3314755-1-frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using external source manager (devtool), the debug symbol generated
by the compilation doesn't point to the right directory.
This is normally handled by gcc options that are defined
in DEBUG_PREFIX_MAP in conf/bitbake.conf.

But the path in it are hardcoded and point to WORKDIR which is
not overloaded by devtool.

This patch takes the parent directory of external source directory
and prepend correct path to DEBUG_PREFIX_MAP.

Moreover, to avoid wrong path resolution during dwarfsrcfiles step
in splitdebuginfo, it make B variable point to the same
structure as EXTERNALSRC (if EXTERNALSRC_BUILD is not defined).

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes/externalsrc.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 3d6b80bee2..de5ef714b4 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -53,14 +53,26 @@ python () {
             d.setVar('BB_DONT_CACHE', '1')
 
     if externalsrc:
+        import os
         import oe.recipeutils
         import oe.path
 
+        pn = d.getVar('PN')
+        # taken from bitbake.conf
+        debugsrcdir = "/usr/src/debug/%s/%s%s-%s" % (pn, d.getVar('EXTENDPE'), d.getVar('PV'), d.getVar('PR'))
+        externalsrc_parentdir = os.path.dirname(externalsrc)
+
+        debug_prefix_map_ext = "-fmacro-prefix-map=%s=%s " % (externalsrc_parentdir, debugsrcdir)
+        macro_prefix_map_ext = "-fdebug-prefix-map=%s=%s " % (externalsrc_parentdir, debugsrcdir)
+        d.prependVar('DEBUG_PREFIX_MAP', debug_prefix_map_ext)
+        d.prependVar('DEBUG_PREFIX_MAP', macro_prefix_map_ext)
+
         d.setVar('S', externalsrc)
         if externalsrcbuild:
             d.setVar('B', externalsrcbuild)
         else:
-            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
+            builddir = os.path.join(externalsrc_parentdir, "%s-build" % pn)
+            d.setVar('B', builddir)
 
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
-- 
2.25.1

