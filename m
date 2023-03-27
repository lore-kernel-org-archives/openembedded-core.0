Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952FDC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 20:05:51 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.46588.1679947546100170183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 13:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ecynjl+G;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id a30-20020a9d3e1e000000b006a13f728172so2029571otd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679947545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xH2YvUU2pzK9STcVyHC5jPwo6lkB7C9DWknBBzcP8+M=;
        b=Ecynjl+GF3LNbiD/gdQpm8AcgoOd5EzcB7XOfazjR8UgodH2URiWn0K4NPdW2i/WFs
         enuZj9sK06PaS62ZP7LoGIUnXyo6CkE4cSG3hTSXXhLJnlR2Yl94nXabXqXkuImPWXTX
         jGcGj4ITAb6Eagwtz6dUTatFlGyPmN+QFyuqCrKfDmlaSWezrF7Y7RogyErXTcrhX79P
         yRsSrJS2nQXWpyeywi5SDGu0PMGoJNIXL3sBHTIsS2vlFIrABtpx6mxqSXSUnN+7cxh3
         PdGEI3+55QFQ8I7mNmUHSr40eMv3WVJix3fFVS4AmF4+46TQHUVttdy/x5sJTK78DW+t
         oV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679947545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xH2YvUU2pzK9STcVyHC5jPwo6lkB7C9DWknBBzcP8+M=;
        b=yJwd8IgPSiYKbxVwSEAzi00tOKGMYHrgRJYxGBPRjHcobbEra1oc3o16sxLTQzVbzX
         RtxNxcGbML0Iq/g//pbPOkGoSjnGjdPGi/1KqXlZGRZA1nFqSnQKUoFouwHeFsLhz4Yv
         QVkrEhzmTVmjJ8RTXfsBRVrjtxlIwYvXViSDgZITe/hG5JWLxlunrD1WgPDWisHKq5Ii
         G1VnlWWPloMSQChAw4GqIQYnYQvQJ5pxUZG1It4Zb5uiqA7OQdGPpoVGmuXMKlOrMTH4
         8125jLPB4QgiyvNrQPfE4GfMN3pzmGXSzUEhWKnnzUKxD1XaljYtmP3V8UTttH3y7Pu4
         a4pA==
X-Gm-Message-State: AO0yUKU5ADQxEioUmRelrQHgww9cVqwXGE2NRVHNfRXGyTphoWONZ+kz
	EH9UrUAaXxn3a26OV+yJvZXdU3wZ2JY=
X-Google-Smtp-Source: AK7set8IIV85uh9RMdKMlmy2Wx/ZMmeS0qT1jgbe0QLsu+eWCSUoTMAL4JjMCGyagXNEojnb7WpagA==
X-Received: by 2002:a05:6830:1d5a:b0:6a1:1980:6909 with SMTP id p26-20020a0568301d5a00b006a119806909mr4862712oth.35.1679947544868;
        Mon, 27 Mar 2023 13:05:44 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id n16-20020a9d6f10000000b0069fa641bd25sm5942988otq.8.2023.03.27.13.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 13:05:43 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][dunfell][PATCH v2 5/5] classes/package: Use gzip for extended package data
Date: Mon, 27 Mar 2023 15:05:30 -0500
Message-Id: <20230327200530.3354151-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230327200530.3354151-1-JPEWhacker@gmail.com>
References: <20230322204558.1386634-1-JPEWhacker@gmail.com>
 <20230327200530.3354151-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 20:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179181

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


