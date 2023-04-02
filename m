Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F809C77B6D
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:42:39 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.48699.1680453753453219689
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jWLesIc4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id q102so25046964pjq.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453752; x=1683045752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeXH6KrQ1jKXacuJvqsxeTXauq/RURdqFcetw+/hJAE=;
        b=jWLesIc4gaZeumssm2AFqLWze6PTIi1jyVwM85rAHnVMWlJ23dmNw613YvYc0c348U
         U+lfgKlV4aaf4mhCtPQKU+aQAOhpHRNI1kUs2a8hNNPaWM1c1Zo6cU23hU+9s9DS+eYr
         F/C162akNi8t4BaskiTT1YgZuY0QwJe/+cf/b2LICCn7KOsosRF+cz1QWCcTkb5jzBWX
         ol7GVGstuaHORvK66tUzvnxr7fufXtmxeOZmMf4GtUFp/rXjvXCkWFBJ7g1AjCLzf9/g
         MZ62FJq5/c6LlCi7XyhrSdwipJVNnHafji/RDjcLS3HnCtCukMN3s/goVuBTU5LOlNJC
         cmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453752; x=1683045752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeXH6KrQ1jKXacuJvqsxeTXauq/RURdqFcetw+/hJAE=;
        b=FU4j1nMtXOI3iQsygSUgBwmizcCrZFnNlSIo5JaF1qtDJDUVtxzJt7ZAL44OnBKLuZ
         kIJVVfRQ4CK2gaE2OgeoKArWyJ8DXz6j3vQBlPweC3Ps4Gs69EQKnIxUGl2xEQG9oFdU
         cc0yVJEmKo7LOcM1lXdxSyralTJIPRHT5Cyr9G/UioxPS4Zj85tfGKp08ZNVwzifN0xq
         iUGB4HqLP+LE6TPigsLdwapwU5aPyIZznrjam7336tO1Bu5hTffIOW9w+5Yo+yJDgAW6
         ihdg79BBChLy7qccP2I6t2v1dzB8q57lplCHz67DnERc0SZZrwsX+JIJf6AmMH/B4rV+
         7k0g==
X-Gm-Message-State: AAQBX9eFsKuc8DFjNLZHX80blAHCY6KzxXbXusJCTBTTuIx+QDygsZRR
	97gUyWlqdi6J8knhLOCwlhhh3zscU08oulGZFhU=
X-Google-Smtp-Source: AKy350bPEJE+TzDRqFhz5ofFvtoZ6BbGDbQ5WZsXZmH+RZ1v0m/+RU0hVSsyENmZH5obgF7o8tmbfw==
X-Received: by 2002:a17:902:ce92:b0:1a2:1042:cadc with SMTP id f18-20020a170902ce9200b001a21042cadcmr39206265plg.18.1680453752507;
        Sun, 02 Apr 2023 09:42:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/21] cve-check: Fix false negative version issue
Date: Sun,  2 Apr 2023 06:41:59 -1000
Message-Id: <f331c80df6c447d3073ebe3f00102c78ced242f3.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179585

From: Geoffrey GIRY <geoffrey.giry@smile.fr>

NVD DB store version and update in the same value, separated by '_'.
The proposed patch check if the version from NVD DB contains a "_",
ie 9.2.0_p1 is convert to 9.2.0p1 before version comparison.

[YOCTO #14127]

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Geoffrey GIRY <geoffrey.giry@smile.fr>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7d00f6ec578084a0a0e5caf36241d53036d996c4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass            |  5 ++-
 meta/lib/oe/cve_check.py                  | 39 +++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/cve_check.py | 19 +++++++++++
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index b9c0bfd6d8..3c922b27af 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -254,7 +254,7 @@ def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
     """
-    from oe.cve_check import Version
+    from oe.cve_check import Version, convert_cve_version
 
     pn = d.getVar("PN")
     real_pv = d.getVar("PV")
@@ -318,6 +318,9 @@ def check_cves(d, patched_cves):
                 if cve in cve_ignore:
                     ignored = True
 
+                version_start = convert_cve_version(version_start)
+                version_end = convert_cve_version(version_end)
+
                 if (operator_start == '=' and pv == version_start) or version_start == '-':
                     vulnerable = True
                 else:
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index f40f16d7ab..42a77872e9 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -173,3 +173,42 @@ def update_symlinks(target_path, link_path):
         if os.path.exists(os.path.realpath(link_path)):
             os.remove(link_path)
         os.symlink(os.path.basename(target_path), link_path)
+
+
+def convert_cve_version(version):
+    """
+    This function converts from CVE format to Yocto version format.
+    eg 8.3_p1 -> 8.3p1, 6.2_rc1 -> 6.2-rc1
+
+    Unless it is redefined using CVE_VERSION in the recipe,
+    cve_check uses the version in the name of the recipe (${PV})
+    to check vulnerabilities against a CVE in the database downloaded from NVD.
+
+    When the version has an update, i.e.
+    "p1" in OpenSSH 8.3p1,
+    "-rc1" in linux kernel 6.2-rc1,
+    the database stores the version as version_update (8.3_p1, 6.2_rc1).
+    Therefore, we must transform this version before comparing to the
+    recipe version.
+
+    In this case, the parameter of the function is 8.3_p1.
+    If the version uses the Release Candidate format, "rc",
+    this function replaces the '_' by '-'.
+    If the version uses the Update format, "p",
+    this function removes the '_' completely.
+    """
+    import re
+
+    matches = re.match('^([0-9.]+)_((p|rc)[0-9]+)$', version)
+
+    if not matches:
+        return version
+
+    version = matches.group(1)
+    update = matches.group(2)
+
+    if matches.group(3) == "rc":
+        return version + '-' + update
+
+    return version + update
+
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index d0b2213703..22ffeffd29 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -48,6 +48,25 @@ class CVECheck(OESelftestTestCase):
         self.assertTrue( result ,msg="Failed to compare version with suffix '1.0_patch2' < '1.0_patch3'")
 
 
+    def test_convert_cve_version(self):
+        from oe.cve_check import convert_cve_version
+
+        # Default format
+        self.assertEqual(convert_cve_version("8.3"), "8.3")
+        self.assertEqual(convert_cve_version(""), "")
+
+        # OpenSSL format version
+        self.assertEqual(convert_cve_version("1.1.1t"), "1.1.1t")
+
+        # OpenSSH format
+        self.assertEqual(convert_cve_version("8.3_p1"), "8.3p1")
+        self.assertEqual(convert_cve_version("8.3_p22"), "8.3p22")
+
+        # Linux kernel format
+        self.assertEqual(convert_cve_version("6.2_rc8"), "6.2-rc8")
+        self.assertEqual(convert_cve_version("6.2_rc31"), "6.2-rc31")
+
+
     def test_recipe_report_json(self):
         config = """
 INHERIT += "cve-check"
-- 
2.34.1


