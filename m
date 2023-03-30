Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1724DC77B6F
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:14:24 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.38972.1680210856428173993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UPT2n8sN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id c4so2486856pjs.4
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680210855; x=1682802855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkwO7lInM3ZWHU4d7dKNr+V7I848npMkE4ArMFjkeo0=;
        b=UPT2n8sNdM151Bgb+Zl0zBLWP7LKIcpaxORbi+miuNl0NUA7aNNtULgGjR6lYplBG/
         A4Il+GGVNaxZiVd334qTUez339eqL47fkZtu8moY+uNSbMLXnXMY+A1Lowa9ZGihPS07
         SYYPdgIIN1TwAyKDgd6OmwGtesXDZce6Nl6ojpfsrt6tjJGh8zM6BIIZsrOlNItELvjP
         +tqyujw4JvU3qhrVLExWdPlPy2tjn8WC23pkaQmB+I46fhXxcTUXv0tM8M0iQbyT2x+Q
         x3UzH1bJ90Cn+NLuDDsan62E/ph2ceyhCTt02wGeVyTpW5K9j1Sb1VLjHmA1bGHhw4ga
         Bg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210855; x=1682802855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkwO7lInM3ZWHU4d7dKNr+V7I848npMkE4ArMFjkeo0=;
        b=lXI2hzxPWOd+7pmjbvtN3RgPsI66WhB64uv3p0QG2D7AA64T088LiFHw1gl6QcNAKf
         KRtPlkH+0Ff+ho3g4lqK+WmFKaeRHVwdbUV3Ct4FU6mNoxKEw6aPDXftBQVhXhmmMnGg
         bKI7/cxOo7VN2fKe02+WahiTTd1vREioBbc+eFDz9bZJG6IJoo/SMbCUIEoN2/J84Bp3
         1wJCgooAy4NUfy3rVyepPnC57pQhyI+/xHvK3T4WrJWAOjhplpuQ+/qwe41a7Cypivlq
         YD17TuN03ZSy9jaEQec5lAnr0wvlAWw5nvwM8xEHnhp0gWKRE4xRBzhHYypxcB3+pIYa
         8dZQ==
X-Gm-Message-State: AAQBX9ethpN2ECp8WJpm3CDQfXbfC0wGNRGnU7o/SBZg9pztkV45Zgtl
	GjDqUhxd9wkzVz3jVb9Uy5+bo7nf52vNWLqlfq4=
X-Google-Smtp-Source: AKy350bFEfUkzYTjjrtzkiysTB5i4aRM3V8MNOLJE5aQZQdeS/Y2RftxqDZynuTjkgKsT5BdRG7DKg==
X-Received: by 2002:a17:90b:1d09:b0:240:d327:f3b7 with SMTP id on9-20020a17090b1d0900b00240d327f3b7mr2797817pjb.13.1680210855446;
        Thu, 30 Mar 2023 14:14:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b0050301521335sm250661pgc.11.2023.03.30.14.14.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:14:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/14] cve-check: Fix false negative version issue
Date: Thu, 30 Mar 2023 11:13:46 -1000
Message-Id: <423ba02b0c2a15bf771db2271df17e12c5adabb2.1680210378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680210378.git.steve@sakoman.com>
References: <cover.1680210378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179363

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
index 41fdf8363f..5e2da56046 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -260,7 +260,7 @@ def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
     """
-    from oe.cve_check import Version
+    from oe.cve_check import Version, convert_cve_version
 
     pn = d.getVar("PN")
     real_pv = d.getVar("PV")
@@ -324,6 +324,9 @@ def check_cves(d, patched_cves):
                 if cve in cve_ignore:
                     ignored = True
 
+                version_start = convert_cve_version(version_start)
+                version_end = convert_cve_version(version_end)
+
                 if (operator_start == '=' and pv == version_start) or version_start == '-':
                     vulnerable = True
                 else:
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 4f1d80f050..dbaa0b373a 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -179,3 +179,42 @@ def update_symlinks(target_path, link_path):
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
index ac47af1990..9534c9775c 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -54,6 +54,25 @@ class CVECheck(OESelftestTestCase):
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


