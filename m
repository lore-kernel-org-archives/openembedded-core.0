Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.164.1617038723766413634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 10:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dSicEMGA;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id r12so20678964ejr.5
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 10:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QHtOH3UcOjbbZh5xjfmFWvkERI2IZI7BcT8tceZ517Y=;
        b=dSicEMGA4J5FWSHkrj6En8pYKcdEz1DndXhi1WdE9qkDdQJIcOzNX71oSpJO5xTVit
         /KqM/cawmEv6eOSqMORUlWiMlVkULoBISt+OOG6dOik3spvShLn2slKswOjvXKRapOLG
         HHcqi1RJR2nB14jxq4mQ2ZRHoNSBgQXizyDR1oQQq5bCbrvMWGgvyAr44EVmk/mLmsi1
         QqlrxGbyIRB8ud3wpSO0it7kxFmF19LW0J+/OF4KGIODT00t6FQ4H19MarNFHCIZAzOF
         pHHFI7jK62p+c43hnnmHFjdwwTfUc87N0qBUNww5NjAvNsdil6uq/LjfiaMMESJt2Vj6
         bnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QHtOH3UcOjbbZh5xjfmFWvkERI2IZI7BcT8tceZ517Y=;
        b=LRyhCI1WZ7HOHRQDWR44B24fvr2EQpRmGX5RUf47CGAPFUzPthTgGV0lm0eX3GbhBI
         cdoC0fcxlHPpn0IzgyKaSUKPOpVgnYN/iYNgiav6ftXthfuHSEreUZJi2+pHwNRmtsg0
         fDNXbRRARjHGRqtqd2M/EL7l8lgORBLdeGgWrR9bE2vOxGURAUwJBIEmzsYcWLRRS/A3
         yuGI5+NMD9rNOywbsNTiAMpnR4ajzx2z/GbJoSkmk5MIxHzf4IfzyK305kyvKW+2ntl7
         H6AwUxnUWCFfwaRLTCH2KnIxFk1CePwtBhrTPoOuLObHgYzFdkblh1e7JcbTT4Ba++wb
         Rb6A==
X-Gm-Message-State: AOAM530ucxueLxI66Oxucv5Ac5e2w4LQBEErttW+k7B7tw4/sgylBcr7
	CPpzjKF6xEkZELHU57oPQtKWlZ5e2ZHMSA==
X-Google-Smtp-Source: ABdhPJweu5aga4g6E/xR4wHHREJB8vj2Yl61mVJsqldHLtG4PlRBOAQS2KwrvWW/ojNWaSzHpHokuA==
X-Received: by 2002:a17:906:5295:: with SMTP id c21mr29603524ejm.67.1617038721943;
        Mon, 29 Mar 2021 10:25:21 -0700 (PDT)
Return-Path: <jan.vermaete@gmail.com>
Received: from localhost.localdomain (78-20-166-56.access.telenet.be. [78.20.166.56])
        by smtp.googlemail.com with ESMTPSA id p27sm8556970eja.79.2021.03.29.10.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 10:25:21 -0700 (PDT)
From: "jan" <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH v2] cve-update-db-native: Allow to overrule the URL in a bbappend.
Date: Mon, 29 Mar 2021 19:21:52 +0200
Message-Id: <20210329172151.4219-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With this small patch, it's possible to overrule the public
URL with a local mirror for those without Internet access.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index b3dc33734d..25ec6bac71 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -12,6 +12,8 @@ deltask do_compile
 deltask do_install
 deltask do_populate_sysroot
 
+NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
+
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
@@ -28,7 +30,6 @@ python do_fetch() {
 
     bb.utils.export_proxies(d)
 
-    BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
     YEAR_START = 2002
 
     db_file = d.getVar("CVE_CHECK_DB_FILE")
@@ -64,7 +65,7 @@ python do_fetch() {
         for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
             bb.debug(2, "Updating %d" % year)
             ph.update((float(i + 1) / total_years) * 100)
-            year_url = BASE_URL + str(year)
+            year_url = (d.getVar('NVDCVE_URL')) + str(year)
             meta_url = year_url + ".meta"
             json_url = year_url + ".json.gz"
 
-- 
2.25.1

