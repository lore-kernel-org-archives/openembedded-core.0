Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6BBC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 20:38:24 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.2211.1657744695043330197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 13:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oDDuXh5n;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id p9so11533pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 13:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LzhsV3qQV6Ho2/EXHt7/ZEEfI9b1zHIIbhjeViTxO7c=;
        b=oDDuXh5nuVAvWx26CtrDnjw2uOAM+jtEl0fFMoPuQknbIys2YuOqnXIZrsuXwNQjb/
         ISKU23/WUKyqM2YgeFtave1NAQWFqAewJdSvDCYT8JDSEtAWV3r74OslrEy8R7cAvp0z
         EJypcYHPQZNA2Z9xLODMJKl6XGzSva2hASJ3/0N+BJM56+M1OOcwX7xVS472xJIs5HZw
         EwPja6C058+ZHAxe8arWf+doDqY8nzKiZWSZJpNvysG99kRmjyN8UJVJ2K0v0ZpaWaFO
         Jqzz8bUw/UKWsZ9GIRTy5uiA8Bj23yfB9/ifE5nvSUCNMUvPJ1oWu9Iya4h7RmUernQ1
         9XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LzhsV3qQV6Ho2/EXHt7/ZEEfI9b1zHIIbhjeViTxO7c=;
        b=gEXCXt72INL1mRR6DTo3YUO1d9QujCVsnXiLOF9zDCHkdU+HCeHNPQWt4KOcivwjua
         C2ozJ0rhqBU0JJrQQAo9kanmvB+eim2++tUwuQVZUhIAG0tpk98q5RNpLEmnHwdj/yta
         g5yIEAe54vvzMOwlqoKG5U33i7XAju0B+wpt44uZ5Qb99DQa5YsnLnXk2eqtCasLd5uf
         WJZzzRhqWEBqp5fy21HUBrHYemRWWg/cmECbWnR5ILnc1JSrEh0j/XQ3c3lNtX/neryf
         YBMqFKKiZnJ1UxKumXgvMprWtzv9QyEL4K/ubBB2uxjqCInDYO7AYHCB4Nv1RlfCXfnm
         COsg==
X-Gm-Message-State: AJIora9CnbR0Le+UFCrDA+WFQWXxqH5/rcnNb1n7qdxH3Hyi9ULuARmM
	R8pvTJfILVtsPVWr7Qo9kNEDlbJ+L6Zy0ytd
X-Google-Smtp-Source: 
 AGRyM1se3VRjp9qJL7Dcx88LWdx04PCVXqvCF/u9x8uHqjaNiV869Y+g4rCJ3oVsca0AnygP3J2exw==
X-Received: by 2002:a17:903:2581:b0:16b:d5b5:413a with SMTP id
 jb1-20020a170903258100b0016bd5b5413amr4871754plb.62.1657744693848;
        Wed, 13 Jul 2022 13:38:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a13-20020a170902eccd00b001664d88aab3sm9231892plh.240.2022.07.13.13.38.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 13:38:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/3] classes/cve-check: Move get_patches_cves to
 library
Date: Wed, 13 Jul 2022 10:37:53 -1000
Message-Id: 
 <bba069463ca3813666d084643b0239b9af0199e1.1657739246.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657739246.git.steve@sakoman.com>
References: <cover.1657739246.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 20:38:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167988

From: Joshua Watt <JPEWhacker@gmail.com>

Moving the function will allow other classes to capture which CVEs have
been patched, in particular SBoM generation.

Also add a function to capture the CPE ID from the CVE Product and
Version

(From OE-Core rev: 75d34259a715120be1d023e4fd7b6b4b125f2443)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa6c07bc1a585f204dbdc28704f61448edb8fdc8)
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 62 +------------------------
 meta/lib/oe/cve_check.py       | 82 ++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 60 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1688fe2dfe..9eb9a95574 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -136,10 +136,11 @@ python do_cve_check () {
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
         whitelisted, patched, unpatched, status = check_cves(d, patched_cves)
@@ -247,65 +248,6 @@ ROOTFS_POSTPROCESS_COMMAND_prepend = "${@'cve_check_write_rootfs_manifest; ' if
 do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 do_populate_sdk[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 
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
index b17390de90..a4b831831b 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -89,3 +89,85 @@ def update_symlinks(target_path, link_path):
         if os.path.exists(os.path.realpath(link_path)):
             os.remove(link_path)
         os.symlink(os.path.basename(target_path), link_path)
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
2.25.1


