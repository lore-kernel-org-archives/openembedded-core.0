Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B7AC54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 16:19:55 +0000 (UTC)
Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web11.27972.1709655584462247589
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 08:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=m0CCXrQG;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=787e54d6c=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1709655584; x=1741191584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y8PwzUzSHc5sGecDaDNnmrlxv9z3bejaUbZGe3KmFcQ=;
  b=m0CCXrQGihcdGmGiD3zrM9+NVcnWBxavQWYCapl4MiNZB0kshGx0WcVJ
   zdsz58aglCbudr1tA3y+I86CaUmrlfDCJ/SpqwvC7en45z0wgmYyd35gL
   QO5eE9ceSI89oYEjOHyLDnViWSPrl/AB9bESFDNp02bIbE0q4HE+ea3u5
   M=;
X-CSE-ConnectionGUID: UPEj3ElJSlCQcAORxwnQjA==
X-CSE-MsgGUID: oUBuVthhSumWe+On69CQsw==
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 05 Mar 2024 17:19:29 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw5.muc with ESMTP/TLS;
 05 Mar 2024 17:19:26 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb4.muc with ESMTP/TLS; 05 Mar 2024 17:19:26 +0100
Received: from localhost.localdomain (10.30.85.204) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Tue, 5 Mar 2024 17:19:26 +0100
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [RFC PATCH v2 3/3] packagedata: Extract GNU build ID during pkgdata creation
Date: Tue, 5 Mar 2024 17:18:30 +0100
Message-ID: <20240305161856.4163138-4-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240228062139.473528-1-philip.lorenz@bmw.de>
References: <20240228062139.473528-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP10F.europe.bmw.corp (2a03:1e80:a15:58f::202c) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 16:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196640

Extract the GNU build ID from all files containing debug symbols and
store it within the "extended" package information of pkgdata as an
attribute of the files contained within a package - e.g.

{
  "files_info": {
    "/lib/.debug/ld-linux-x86-64.so.2": {
      "gnu_build_id": "a165bf2a6c9c6a0818450293bd6bb66a316eaa4f",
      "size":1170552
    }
  }
}

Tools can then consume this data for different purposes such as building
an build ID index into the generated package feed or to preseed the
database of a debug info server such as debuginfod.

Sequentially reading out the GNU build ID of ~8000 debug symbol files
(from a core-image-minimal build) took approximately 90 seconds on my
machine. Given that the read out in a typical build will be highly
parallel, I deemed this figure low enough to simply enable it without
an additional configuration flag.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/lib/oe/packagedata.py              | 25 +++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/pkgdata.py |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 2d1d6ddeb75..3404c2a5cd2 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -255,6 +255,27 @@ fi
         fd.write("PACKAGES: %s\n" % packages)
 
     pkgdebugsource = d.getVar("PKGDEBUGSOURCES") or []
+    pkgdebugfiles = d.getVar("PKGDEBUGFILES") or []
+
+    pkgd = d.getVar("PKGD")
+    readelf = d.getVar("READELF")
+
+    def extract_gnu_build_id(file):
+        import subprocess
+
+        cmd = "%s -n '%s' | grep '^    Build ID: '" % (readelf, pkgd + file)
+        try:
+            result = subprocess.check_output(cmd, shell=True)
+            # If grep hadn't matched it would've returned a non-zero exit code
+            # and the CalledProcessError would've been raised. It is therefore
+            # safe to assume that the output has the format "    Build ID: "
+            gnu_build_id = result[result.rfind(b" ") + 1:].rstrip().decode()
+            return (file, gnu_build_id)
+        except subprocess.CalledProcessError:
+            return (None, None)
+
+    pkg_debug_build_ids = { debug_file: build_id \
+        for debug_file, build_id in oe.utils.multiprocess_launch(extract_gnu_build_id, pkgdebugfiles, d) if debug_file}
 
     pn = d.getVar('PN')
     global_variants = (d.getVar('MULTILIB_GLOBAL_VARIANTS') or "").split()
@@ -300,6 +321,10 @@ fi
             if fpath in pkgdebugsource:
                 extended_data["files_info"][fpath]['debugsrc'] = pkgdebugsource[fpath]
                 del pkgdebugsource[fpath]
+            if fpath in pkg_debug_build_ids:
+                extended_data["files_info"][fpath]['gnu_build_id'] = pkg_debug_build_ids[fpath]
+                del pkg_debug_build_ids[fpath]
+
 
         d.setVar('FILES_INFO:' + pkg , json.dumps(files, sort_keys=True))
 
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 6c5b7a84f47..8b993261055 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -241,3 +241,5 @@ class OePkgdataUtilTests(OESelftestTestCase):
 
         file_info = files_info[libz_file_name]
         self.assertIn('size', file_info, "Couldn't find key 'size' in '%s'" % file_info)
+        self.assertIn('gnu_build_id', file_info, "Couldn't find key 'gnu_build_id' in '%s'" % file_info)
+        self.assertGreater(len(file_info['gnu_build_id']), 0)
-- 
2.44.0


