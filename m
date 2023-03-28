Return-Path: <geoffrey.giry@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88084C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 10:24:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.62783.1679999039696150550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 03:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=wv0eU4uw;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: geoffrey.giry@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id j24so11636011wrd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 03:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1679999038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RD2DZKMh4VNVheXeQBhkpPsiHsBwNq72VAMDSVab174=;
        b=wv0eU4uw/nkIu2PF5KUYx0FeN71tMjQ4CRPqu5e2jBysPbrA+JMEw4r/zhlMCv8ecq
         Joc+C5MDQoloQTsH7UAG/zaUV76V0+UHBzK9QwzzJOufnd2Q7tcGE/ThtjdSZStFXCi9
         PHP2hQ1eSpnLsY+O5RSmsTwnOAzT+NDj1WE0Of1NiQwV1zVF8l5h9tx5ZO+x+DLjAZoO
         DIVAkXERrlgsjF+YsxMQRnpbE1Kg2JhloeyaTZloTHDygTr+WlPxv4lhBwV/Fj7YZ8iG
         Eziz1J+CsX8xcPJ1+im0nDANqXYYgqBkNZSCzs/Kektm68607Ja/pZoOXExUT73IuWzy
         ZmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679999038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RD2DZKMh4VNVheXeQBhkpPsiHsBwNq72VAMDSVab174=;
        b=J+k3SdUSxRIpOC5yMeI/2hYWncnrXF4O/f9GnD7L3Ey6XIcl8vwx1LUfIiLmrJisXR
         qyPBbrk2yXe2wUklGwGyH8N08vkS/dPVFOUu0/r7p0089FA6OwqNmuwZgxwqA3cCevpw
         v5Ay/X14Tc/tMp7M4KRCFfbGannpDZbOWNgg4vRmp6OjsQIdG/kvStFVr2afex0KBbOU
         Q1crvSB5KqsQQ2YUy35gxZa7K8ZAAwwNTnoxuaYIeOoEYUCoLfsFOase3bQ7fobNyFUk
         W7Vcp1uTKt53zeS7Yizu7GRJxKk+uceUu4U3kI7MoKGs5BkDeCPAlw34t9+ZPfDabLxd
         N4NQ==
X-Gm-Message-State: AAQBX9egVBOWVy1UQX4Gibn3NJPhqj/VjFmjP1ftHf1l2fYcNckDBm/s
	j2Pf16I4RBiPCDNb9ibBCJbuDEjdYISwnubh8Jo=
X-Google-Smtp-Source: AKy350bm3UIFAPbwGJ6lR6CJL8q2watQz5pqSRwKxbzzlNWG607HYsUgSMU1rUcnckorsNbLQQHPwA==
X-Received: by 2002:a5d:6a91:0:b0:2cf:e496:93d9 with SMTP id s17-20020a5d6a91000000b002cfe49693d9mr10974399wru.52.1679999037961;
        Tue, 28 Mar 2023 03:23:57 -0700 (PDT)
Received: from P-ASN-IGGY.home (2a01cb0802a81d003f7edd470f5e6aed.ipv6.abo.wanadoo.fr. [2a01:cb08:2a8:1d00:3f7e:dd47:f5e:6aed])
        by smtp.gmail.com with ESMTPSA id m9-20020adffa09000000b002c70d97af78sm27447864wrr.85.2023.03.28.03.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 03:23:57 -0700 (PDT)
From: Geoffrey GIRY <geoffrey.giry@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Geoffrey GIRY <geoffrey.giry@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH] Fix cve-check false negative
Date: Tue, 28 Mar 2023 12:23:49 +0200
Message-Id: <20230328102349.57990-1-geoffrey.giry@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 10:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179220

Fixes [YOCTO #14127]

NVD DB store version and update in the same value, separated by '_'.
The proposed patch check if the version from NVD DB contains a "_",
ie 9.2.0_p1 is convert to 9.2.0p1 before version comparison.

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Geoffrey GIRY <geoffrey.giry@smile.fr>
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
2.30.2


