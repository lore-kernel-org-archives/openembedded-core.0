Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.9970.1616951068761156095
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 10:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gF6Bxscs;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id u9so15832073ejj.7
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Mar 2021 10:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QHtOH3UcOjbbZh5xjfmFWvkERI2IZI7BcT8tceZ517Y=;
        b=gF6BxscsRlCK9Mhkx48Lnn1Lsp9yFyJ/IySosdTGU5pzEw/+bLp5p0bvxfHl11tx1f
         8qAiGPsl/SblAqKcydaLqjNI7CqMeUF/rZBM4qN+8OcCAq4milYN35WOkH+5UPKV5mCS
         mE3FnL4nIeH6LnFUfy70WDtPs5Xe87YR6zr2S5ylwdSkqLKWX7XJm6JQjb757sF5lynh
         o5WLe70aRJL7JpWKrani1N3Ku65qqKiBpVJi42h937gy2NbhoKhPDz5kFelItHzFZOmy
         m04w5PyGbowS2hWYbUEJVPOVIVIy4hBHJ/0Oa5KCeaU0UpmRldFAleJOO92glctnbgCq
         EKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QHtOH3UcOjbbZh5xjfmFWvkERI2IZI7BcT8tceZ517Y=;
        b=Hf5A+vIfPrpLkAm0qhbIo1Hiyeaw5NYSFjni8aa6Ikx/Ps+3k57xM0gdbws3Bk8u1D
         CMGK1WyFj9yrN7sht9NCiU9smraiULpeVKD0StpYy+E3/rzVE/yLDpt/rB8FnDf2ISip
         QoDG/cl8N3+fNJ2Zlk5csF9pYuIfPWjZGJkwi0VTAdWLXghuNdSW6YJRcPnQkQwTOdvL
         z9Q8alGzmnVc+SIglRy2hM8FeZGolW/Xn9Ui39DMTz2mZ9x/iDgD18NnT/x6zx4FZI19
         flXIiDuZ939cOdJj4x3fPrOa5uU2cv5Ebr26ItdiXLBzOjjncFlGHd/92xQezK8TO7sS
         XECQ==
X-Gm-Message-State: AOAM533q2bL7qTc8mJXDFpF95NeqDsfLs++qK2IhUDmAlQ+1d3WCCNDP
	0TUE7A/DPIcOIpz58ZywoT6BOdVoV4Ikvg==
X-Google-Smtp-Source: ABdhPJyEh1+oR3m/pNc9nVvLYeK1m30QQs0UYN8WuckoLorYqIVXTXMMGfDvlF49BKEK0ceN+d/UJA==
X-Received: by 2002:a17:906:51c3:: with SMTP id v3mr25162041ejk.497.1616951066854;
        Sun, 28 Mar 2021 10:04:26 -0700 (PDT)
Return-Path: <jan.vermaete@gmail.com>
Received: from localhost.localdomain (78-20-166-56.access.telenet.be. [78.20.166.56])
        by smtp.googlemail.com with ESMTPSA id i2sm7653109edy.72.2021.03.28.10.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 10:04:26 -0700 (PDT)
From: "jan" <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] Allow to overrule the URL in a bbappend.
Date: Sun, 28 Mar 2021 19:01:08 +0200
Message-Id: <20210328170108.2670-1-jan.vermaete@gmail.com>
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

