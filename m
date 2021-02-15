Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.982.1613428976320207338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 14:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BKg/eSY4;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 75so1657971pgf.13
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 14:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TTsGXBuIMZ3rBEz90OQ/Rny008EQToriLY/zWh7X96c=;
        b=BKg/eSY4bSfHEGDin4ec3zu1K/2xoYttKPU8SrmDCMVdgzuVAOzqxoGEB4etwJYJ9T
         w8dXy2Hr4I2P06UXOJrMEwqCPieLKBPm58oodPOKxL+2Fv20YupvLztES7W+2TTTMDrj
         iN0KoEgYJf73+LrV+u8pQDkMKfoRuetttfHLNcNbu6theCnLdIfutjBQvK551fZFmbE8
         znlIB/L0JR4PjDAMZmgPlJAqgA+zZZNnRPiJxDiXrJdUuuS8IwUm/e0CqUbd5IzfTs9v
         zBC+MY/E9zJoHsH2g+ckRi8PbY4aNXF7CrGdZJcTjPAy7yz1YP7SrBqElJ+/UnHjg9KK
         Sqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TTsGXBuIMZ3rBEz90OQ/Rny008EQToriLY/zWh7X96c=;
        b=Fh0qPA6Q+Z5WzV3v38HkimoF0TdENlQKANn7Xcxlar6sBhJ1cUDuwvs9koT1uVqW32
         OSV4X2H/NHBoSU88zlHjZkPoXfKZeII7jmdfp49Q14EA5YVC9k6nPtXR6sfSga/LylaD
         tjE3rjha92hOuYxgKye9CGvwzN+LKu2LqA7aMIsne10rGeC8WLPDt9V79ODhlA0Lwc/s
         nTzc3T89MV5TYBdXv9nyQIT5Jco9CQAs1F0WgqhgHwatG5kp5C+7mwfsZSxcGay6Mdzh
         48fdmnLwreLJbnR7q3Oa/h+ZYMfDfYhBNcElhM38xHOdZPkPw7YQbvFaj9KQXVO1HYaR
         3wug==
X-Gm-Message-State: AOAM5330CCFd0QwD4GjTE2aaWg0UbJIwk0FwCMGtJjxBSJh0Cy4lemBj
	gEDkS1MA7J27QSzJxs9PpHw5Ivv8ah8=
X-Google-Smtp-Source: ABdhPJxmiGevOav1mH2J5FWJram+A+ttT6D6Gvl8LK/F6mjYiq3MvZzHENlcW+GOzYPGVxm+8vT//Q==
X-Received: by 2002:a65:4904:: with SMTP id p4mr16754357pgs.429.1613428975603;
        Mon, 15 Feb 2021 14:42:55 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id x17sm18829286pfq.132.2021.02.15.14.42.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 14:42:55 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [V2][PATCH] cve-check.bbclass: allow skiping non pbn
Date: Mon, 15 Feb 2021 22:42:54 +0000
Message-Id: <20210215224254.2550264-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I don't see the point in logging native, nativesdk etc.
The bottom line is the BPN has the issue.

Allow folks to filter out those other package name variations via
CVE_CHECK_MANIFEST_FILTER

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
[V2]
rename varible to CVE_CHECK_FILTER_BUILD_TOOLS
---
 meta/classes/cve-check.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 112ee3379d3..1bed815d8e4 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -59,6 +59,7 @@ CVE_CHECK_LAYER_EXCLUDELIST ??= ""
 # Layers to be included 
 CVE_CHECK_LAYER_INCLUDELIST ??= ""
 
+CVE_CHECK_FILTER_BUILD_TOOLS ??="0"
 
 # set to "alphabetical" for version using single alphabetical character as increament release
 CVE_VERSION_SUFFIX ??= ""
@@ -96,6 +97,13 @@ python do_cve_check () {
     """
 
     if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
+        if d.getVar("CVE_CHECK_FILTER_BUILD_TOOLS") == "1":
+            # drop native, nativesdk, cross, etc
+            bpn = d.getVar("BPN")
+            pn = d.getVar("PN")
+            if bpn != pn:
+               return
+
         try:
             patched_cves = get_patches_cves(d)
         except FileNotFoundError:
@@ -164,6 +172,7 @@ def get_patches_cves(d):
     import re
 
     pn = d.getVar("PN")
+
     cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
 
     # Matches last CVE-1234-211432 in the file name, also if written
-- 
2.25.1

