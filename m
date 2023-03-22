Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC24C761AF
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 20:46:25 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.56028.1679517968991405364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 13:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mqp40Gxh;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id m20-20020a9d6094000000b0069caf591747so11096379otj.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 13:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679517977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xH2YvUU2pzK9STcVyHC5jPwo6lkB7C9DWknBBzcP8+M=;
        b=mqp40Gxh5YMeRIiJ25Hkhc24W1Rmhw0EsSaYjTpEmQaPxH0SAAe63QQSrTV+4inCAj
         zA7NqccMo6u9bQfZ8FCvQuREmdXpXceTh7xA2xASinMnm8RJkq6whp8KAGKUfDvi4oq5
         gm9dP//5eDo4xFjWV77rRwxdT04/QfXNWpef8BIWhGJXUjEWma5mb2CVOCuttCdc2Mtz
         mwm6Op5RPjkWoaDvJLIMZ4MSW+wopy/a1dYPfOGFkhzJgoytpkEaCyqSNR3J/ArRANPb
         t/7y8qUP6zIQHhYfWriFCAndUu7iYSP7I7VYDTpmgvB5BuS52F2Cfw8wDd8sZLNJ9rVM
         p9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679517977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xH2YvUU2pzK9STcVyHC5jPwo6lkB7C9DWknBBzcP8+M=;
        b=0NO8jI5wV8xchv4hvuWD6GsWL695H7XWZiAeH2ZbHP5NOXe30+d/Ig4gMu1gu+wEFh
         8+2Hh/eOvz8fpNiCB7fCKr48YOdsnGGsQ0gc6QHJc+nGarXKAeCZwhpl8mw5d6hKDcFJ
         LkKgkw56jkTd2SNtY51+vUx2fsR0E/GvtObiGYahbffz9o9SwRVkIEoVc2IRX3TrQfd4
         DZ8rWa+PPvNeYs4I7K5GTP1RR6cXi4jD75NHEJzvik/VrNFWYulVd3UDzRZ+OtVn2cws
         FYicIxs8aXNz7uzys8Ej8vKytMxXC8VZgwGbYAvX8Lkp0tJTOu3rLASJRwnz88N2PCeD
         CR6Q==
X-Gm-Message-State: AO0yUKX1/nuANNFzlRba7kjEfWwRcUW4h7vMzlmQ19C06LO+i2mZlHkB
	yCqI5vOE6gsCKj9MNGm6GmLbgwZyC/I=
X-Google-Smtp-Source: AK7set9VlsQ0npeeVBpz9v0HsjR9Vi5USRkQzd7zbMplXTjn8PuREHBgkYLsUKm88VtZFAXJzfYNZw==
X-Received: by 2002:a05:6830:10ce:b0:69c:cc09:f5a7 with SMTP id z14-20020a05683010ce00b0069ccc09f5a7mr2206037oto.31.1679517977110;
        Wed, 22 Mar 2023 13:46:17 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y21-20020a0568301d9500b0069f87d2ae09sm2288561oti.54.2023.03.22.13.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 13:46:16 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][dunfell][PATCH 5/5] classes/package: Use gzip for extended package data
Date: Wed, 22 Mar 2023 15:45:58 -0500
Message-Id: <20230322204558.1386634-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230322204558.1386634-1-JPEWhacker@gmail.com>
References: <20230322204558.1386634-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 20:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178961

The master version of extended package data uses zstd for efficient
compression, but it relies on the zstd tool to be present on the host
system. Since dunfell supports older distros, we don't want to add this
tool as an additional requirement so switch to using gzip instead.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/package.bbclass | 7 +++----
 meta/lib/oe/packagedata.py   | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 84fdafa8fe..49d30caef7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1470,7 +1470,7 @@ PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS
 python emit_pkgdata() {
     from glob import glob
     import json
-    import bb.compress.zstd
+    import gzip
 
     def process_postinst_on_target(pkg, mlprefix):
         pkgval = d.getVar('PKG_%s' % pkg)
@@ -1610,9 +1610,8 @@ fi
 
             sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
 
-        subdata_extended_file = pkgdatadir + "/extended/%s.json.zstd" % pkg
-        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
-        with bb.compress.zstd.open(subdata_extended_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
+        subdata_extended_file = pkgdatadir + "/extended/%s.json.gz" % pkg
+        with gzip.open(subdata_extended_file, "wt", encoding="utf-8") as f:
             json.dump(extended_data, f, sort_keys=True, separators=(",", ":"))
 
         # Symlinks needed for rprovides lookup
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 00f7dc1f3d..feb834c0e3 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -59,12 +59,11 @@ def read_subpkgdata_dict(pkg, d):
 
 def read_subpkgdata_extended(pkg, d):
     import json
-    import bb.compress.zstd
+    import gzip
 
-    fn = d.expand("${PKGDATA_DIR}/extended/%s.json.zstd" % pkg)
+    fn = d.expand("${PKGDATA_DIR}/extended/%s.json.gz" % pkg)
     try:
-        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
-        with bb.compress.zstd.open(fn, "rt", encoding="utf-8", num_threads=num_threads) as f:
+        with gzip.open(fn, "rt", encoding="utf-8") as f:
             return json.load(f)
     except FileNotFoundError:
         return None
-- 
2.33.0


