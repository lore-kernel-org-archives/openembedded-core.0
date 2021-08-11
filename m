Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web08.8516.1628693531720564932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 07:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tHPj4jmb;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id o185so4878150oih.13
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f4IqHXidW9o9hot7xprJqGI8VBZME8fOSfYwSBKz7MQ=;
        b=tHPj4jmbUjegreHGtrc7RwNZeyFHp3qT/Ps3tVWPVLvaLDpg8WoYPQoK+eSwGYLkI/
         izFahmf5el/SC74L2GVcUXdrFIRWi/NR6FP3AFsp8MxuumfbketnUmCjAZfC1hpnbJIr
         uw/FszEY4zEHnFeO08Dwfo+koR9a6OKkYFiAM5wcyR9Tx5OLa3xtvSCwnspMpuOuCqdV
         Qvc6QsjXHOr4BQVjiKsz9I3D7QRkwuknI1wzX62OISg3NWEh2jKb2S6Z8HB6m+Eji22t
         7gA0If4p8l1ViW4X6nrh/A7eVgQmBERnALDVt7Lb00XH0DmtPI+b5IJPMDhPa2UvMFnD
         uGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f4IqHXidW9o9hot7xprJqGI8VBZME8fOSfYwSBKz7MQ=;
        b=OSXfucaeMP0kSKjKxhufRkg6Z6LR+thdP80M7t6T3j7RXjkwUN22dW94KRgyerQBmN
         qJF/plr3ltcWMaKiyQXh4yPuHbT5jMML6WBsdTgRR7us+NfSUOMGL59JZJLCRRh/155S
         SsOlkNAhUCJTwMi0VkHDhb7pvBXFQqZsdOFAwH5R1mMplcPLexYUYmkG0FjUmBVG7P+C
         n3RCqAty5A15urvbR3hri5KClyy2WgxTkZv92kReLZ4wXJ7GtE/MnG6Y6DrXMmy/iMgs
         nFZrRSIpUlKV/qpSopjS1A5gSRVqtDL9f0vmW+U2dCTV6AHj9vEYPR/VqXV/G9uhvmXV
         OEBQ==
X-Gm-Message-State: AOAM530JilI/+iyEI44Fl7UkRjS7cXCursAIVmHTmXtcdshqQllP6iiU
	PLC3ozAPd9MBgJ/FC6hs+x3VQBM2TQ58VQ==
X-Google-Smtp-Source: ABdhPJw6pE5rxIugWsqJkm+5SxSCHKtJ4USD9DOPajY6LBT2oHkxGwbJZwzS7hPx6kvzAbX1Et6gqA==
X-Received: by 2002:a05:6808:1794:: with SMTP id bg20mr7485999oib.162.1628693530688;
        Wed, 11 Aug 2021 07:52:10 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id u17sm1443081oof.43.2021.08.11.07.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 07:52:10 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/cve-check: Move get_patches_cves to library
Date: Wed, 11 Aug 2021 09:51:58 -0500
Message-Id: <20210811145158.12224-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving the function will allow other classes to capture which CVEs have
been patched, in particular SBoM generation.

Also add a function to capture the CPE ID from the CVE Product and
Version

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/cve-check.bbclass | 62 +------------------------
 meta/lib/oe/cve_check.py       | 83 ++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 60 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6582f97151..3c4c9218e3 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -94,10 +94,11 @@ python do_cve_check () {
     """
     Check recipe for patched and unpatched CVEs
     """
+    from oe.cve_check import get_patched_cves
 
     if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
         try:
-            patched_cves = get_patches_cves(d)
+            patched_cves = get_patched_cves(d)
         except FileNotFoundError:
             bb.fatal("Failure in searching patches")
         whitelisted, patched, unpatched = check_cves(d, patched_cves)
@@ -156,65 +157,6 @@ python cve_check_write_rootfs_manifest () {
 ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 
-def get_patches_cves(d):
-    """
-    Get patches that solve CVEs using the "CVE: " tag.
-    """
-
-    import re
-
-    pn = d.getVar("PN")
-    cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
-
-    # Matches the last "CVE-YYYY-ID" in the file name, also if written
-    # in lowercase. Possible to have multiple CVE IDs in a single
-    # file name, but only the last one will be detected from the file name.
-    # However, patch files contents addressing multiple CVE IDs are supported
-    # (cve_match regular expression)
-
-    cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
-
-    patched_cves = set()
-    bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
-    for url in src_patches(d):
-        patch_file = bb.fetch.decodeurl(url)[2]
-
-        if not os.path.isfile(patch_file):
-            bb.error("File Not found: %s" % patch_file)
-            raise FileNotFoundError
-
-        # Check patch file name for CVE ID
-        fname_match = cve_file_name_match.search(patch_file)
-        if fname_match:
-            cve = fname_match.group(1).upper()
-            patched_cves.add(cve)
-            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
-
-        with open(patch_file, "r", encoding="utf-8") as f:
-            try:
-                patch_text = f.read()
-            except UnicodeDecodeError:
-                bb.debug(1, "Failed to read patch %s using UTF-8 encoding"
-                        " trying with iso8859-1" %  patch_file)
-                f.close()
-                with open(patch_file, "r", encoding="iso8859-1") as f:
-                    patch_text = f.read()
-
-        # Search for one or more "CVE: " lines
-        text_match = False
-        for match in cve_match.finditer(patch_text):
-            # Get only the CVEs without the "CVE: " tag
-            cves = patch_text[match.start()+5:match.end()]
-            for cve in cves.split():
-                bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
-                patched_cves.add(cve)
-                text_match = True
-
-        if not fname_match and not text_match:
-            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
-
-    return patched_cves
-
 def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index a1d7c292af..0302beeb4a 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -63,3 +63,86 @@ def _cmpkey(release, patch_l, pre_l, pre_v):
     else:
         _pre = float(pre_v) if pre_v else float('-inf')
     return _release, _patch, _pre
+
+
+def get_patched_cves(d):
+    """
+    Get patches that solve CVEs using the "CVE: " tag.
+    """
+
+    import re
+    import oe.patch
+
+    pn = d.getVar("PN")
+    cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
+
+    # Matches the last "CVE-YYYY-ID" in the file name, also if written
+    # in lowercase. Possible to have multiple CVE IDs in a single
+    # file name, but only the last one will be detected from the file name.
+    # However, patch files contents addressing multiple CVE IDs are supported
+    # (cve_match regular expression)
+
+    cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
+
+    patched_cves = set()
+    bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
+    for url in oe.patch.src_patches(d):
+        patch_file = bb.fetch.decodeurl(url)[2]
+
+        if not os.path.isfile(patch_file):
+            bb.error("File Not found: %s" % patch_file)
+            raise FileNotFoundError
+
+        # Check patch file name for CVE ID
+        fname_match = cve_file_name_match.search(patch_file)
+        if fname_match:
+            cve = fname_match.group(1).upper()
+            patched_cves.add(cve)
+            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
+
+        with open(patch_file, "r", encoding="utf-8") as f:
+            try:
+                patch_text = f.read()
+            except UnicodeDecodeError:
+                bb.debug(1, "Failed to read patch %s using UTF-8 encoding"
+                        " trying with iso8859-1" %  patch_file)
+                f.close()
+                with open(patch_file, "r", encoding="iso8859-1") as f:
+                    patch_text = f.read()
+
+        # Search for one or more "CVE: " lines
+        text_match = False
+        for match in cve_match.finditer(patch_text):
+            # Get only the CVEs without the "CVE: " tag
+            cves = patch_text[match.start()+5:match.end()]
+            for cve in cves.split():
+                bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
+                patched_cves.add(cve)
+                text_match = True
+
+        if not fname_match and not text_match:
+            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
+
+    return patched_cves
+
+
+def get_cpe_ids(cve_product, version):
+    """
+    Get list of CPE identifiers for the given product and version
+    """
+
+    version = version.split("+git")[0]
+
+    cpe_ids = []
+    for product in cve_product.split():
+        # CVE_PRODUCT in recipes may include vendor information for CPE identifiers. If not,
+        # use wildcard for vendor.
+        if ":" in product:
+            vendor, product = product.split(":", 1)
+        else:
+            vendor = "*"
+
+        cpe_id = f'cpe:2.3:a:{vendor}:{product}:{version}:*:*:*:*:*:*:*'
+        cpe_ids.append(cpe_id)
+
+    return cpe_ids
-- 
2.32.0

