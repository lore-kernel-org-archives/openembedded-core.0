Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E86C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 02:39:48 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.91959.1680575979758827511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 19:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JfOFURnN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id s19so18799992pgi.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680575979; x=1683167979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFtnDlEjJ81npO4zlrw3kcdyIiZ5zzQA2wDnYuxoSCI=;
        b=JfOFURnNcmcVLU3/5sGCEAgO+wmxse5fP5sfHhK/ESUKYnDGniTM2sCE9Vkr0dABtN
         uTnss3M2lMAU2lF+Hr2W1uZgKvyvz69okIUwrbfz+HMquu6tNuoJgTZRo5RLwBjVKqAO
         NoejB60rXwGz2sY8xD4rEVPA+cH2PP5nVFLJRp0PsTG3He/zVtgazjs22pVyRAVBVqQM
         6r/TVcw9qnH2PvQxm46gFnt8gB5dR2INppLKkRQO652lwCvp9v2YckKZcDaYNtqOMCBn
         CfAHv3gWvmsHRGnU1ezbcEUi3vBoL5vC0gy6xeyvPZGRSWzOFBZIduqRDrisIMS6+t/g
         ETYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680575979; x=1683167979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFtnDlEjJ81npO4zlrw3kcdyIiZ5zzQA2wDnYuxoSCI=;
        b=ATqLp5l9xS3TdCy5Ujnc5f8rtoJBKRjO4uj3SRBgf2zxObTndz2xESG0qT+n6d1a4H
         qjqlpMR/dJ1prhUmyWLeSS2g774eQ49IW1c73Uzbe41/bKdPSEbjeSxL0bAOzuEunkTu
         skocwdI9EZWoqwj34DRKNFcwC6WAH+u+SqH93TgCfc0Mth6PYw4NNmfTiAoAfqSIprxW
         6Ax+OmgjlNKgZLswX63tqns1h8naCEZdcojqhVdOBYxOVR2LbYgEf1z7P6g5xwL3j4HF
         9vOWELeXV8uI3wep2L+OEBKEJMB+/hgcRd9spRNfh5egCLLapuwwxZOlz4lMjDRsu4WY
         +xpw==
X-Gm-Message-State: AAQBX9fw8SKUClyLXJzeOuDeLsDNSYI/7X9e/FC1tS0wumWMKNn9prhl
	jz75kzBgpHCplXBgwZWeL7HQ2//inPTSvozVf8s=
X-Google-Smtp-Source: AKy350ZFaG4zs0xZlAhvLUN9d6nClJNehlNYmnBiQHGUJ5FU9Pyi1ey+8lGiCEiJchoAl/EVPJzU9w==
X-Received: by 2002:a62:cfc1:0:b0:625:ebc3:b26c with SMTP id b184-20020a62cfc1000000b00625ebc3b26cmr652294pfg.22.1680575978769;
        Mon, 03 Apr 2023 19:39:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a14-20020aa7864e000000b0062deace7c0csm6850569pfo.190.2023.04.03.19.39.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 19:39:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] cve-check: Fix false negative version issue
Date: Mon,  3 Apr 2023 16:39:14 -1000
Message-Id: <eb439b1283b60e6665694ff28c89fbd633eda6b0.1680575792.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680575792.git.steve@sakoman.com>
References: <cover.1680575792.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179664

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
 meta/lib/oe/cve_check.py                  | 37 +++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/cve_check.py | 19 ++++++++++++
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 87a59d5c6d..05b9cb47dc 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -253,7 +253,7 @@ def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
     """
-    from oe.cve_check import Version
+    from oe.cve_check import Version, convert_cve_version
 
     pn = d.getVar("PN")
     real_pv = d.getVar("PV")
@@ -317,6 +317,9 @@ def check_cves(d, patched_cves):
                 if cve in cve_whitelist:
                     ignored = True
 
+                version_start = convert_cve_version(version_start)
+                version_end = convert_cve_version(version_end)
+
                 if (operator_start == '=' and pv == version_start) or version_start == '-':
                     vulnerable = True
                 else:
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 67f0644889..c508865738 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -172,3 +172,40 @@ def get_cpe_ids(cve_product, version):
         cpe_ids.append(cpe_id)
 
     return cpe_ids
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


