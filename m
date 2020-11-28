Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.28876.1606537509192153856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B/95WuRM;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id w202so6137889pff.10
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y8qM1JOq6cAX7L4lWkgO6WscEORmGtkBbpSsgF+/vew=;
        b=B/95WuRMy71B72kEpXGZBfH/+r8ZalxKyJ5ShtjCOFqLbTKi84PW979J8Sr7H2LtHO
         Bs03M1ERMJlXNLjFuUIMYfuabNhpyKioCSELR1BLUC8W7/4T33lR/Ej0k1AAj+bZBjJj
         SjTLQ5kDIVjTiBb/3YBqHQYHLp8vBGJgQ8gHirSvozza8GkyFB0R5OgySxywNgNvwlad
         cv7LecNNHiq82iBZ15HmatBh2y8e8P1rahh6DH7Qtrjnu07Q9eaS7w0CKwIpQEMDEr+5
         ZI+o2spevOaHCksZET/jEf2njujwGhVslLFbeTdJF0RGJZDYg8KzJF5vDBFOtUlMnz+Y
         wF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y8qM1JOq6cAX7L4lWkgO6WscEORmGtkBbpSsgF+/vew=;
        b=ZTw227OJMy0WU717JI5PDNyyCkvo8VHC2iQYnAJO4zo8VZGurfjrs/g9lsijeyu4OK
         vwQxNCuvZ2JrJOxHDAwfh1VytYZCw4kRhgDYQsF9km1eryc1amJ93H4Glub2Okqi7QhS
         6hgoLCbPdEPTVaz4bSk8f8x4qFZxMybec/oAGKtnuHbOB1F+IFXiYPxjRr98lZ2n4r3p
         mSuzZ1UZRJZc+MNt/f849DNSJSL0byMdXQr09ngcVQFWO6Bdtro/+3Sjb763iSiCUSLW
         XMep0kORBiPpeX26IeYJjgJh+scym2MEi6RhDpuvblNqpc1bYuT/nWPU4WYEsK6tHCNS
         d14A==
X-Gm-Message-State: AOAM533cfNppZQk45aOLCP2ea5hCNhIAiGPTqan3AUTI7cGAdONj/vo5
	F6dzrgttlPzdtv+tCP8/ZWTjQnjI/gPiwQ==
X-Google-Smtp-Source: ABdhPJz2IgEFZ5patCvJ36hx8Vfkt0I13HpZJ65enVEHB2AkqbXvKjaUetyhxrG3cg23SkusL45L3g==
X-Received: by 2002:a17:90a:4596:: with SMTP id v22mr923100pjg.12.1606537508618;
        Fri, 27 Nov 2020 20:25:08 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.25.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:25:08 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/18] python3-pluggy: move from meta-python
Date: Fri, 27 Nov 2020 20:24:26 -0800
Message-Id: <17ca5e6a689fcdc32b0467a500b53d8719afd1d4.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Plugin and hook calling mechanisms for python

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-pluggy/run-ptest           |  3 +++
 .../python/python3-pluggy_0.13.1.bb           | 27 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pluggy/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-pluggy_0.13.1.bb

diff --git a/meta/recipes-devtools/python/python3-pluggy/run-ptest b/meta/recipes-devtools/python/python3-pluggy/run-ptest
new file mode 100644
index 00000000000..b63c4de0d9a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pluggy/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb b/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb
new file mode 100644
index 00000000000..d3e0365ca1d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Plugin and hook calling mechanisms for python"
+HOMEPAGE = "https://github.com/pytest-dev/pluggy"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
+
+SRC_URI[md5sum] = "7f610e28b8b34487336b585a3dfb803d"
+SRC_URI[sha256sum] = "15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} += "${PYTHON_PN}-importlib-metadata \
+                   ${PYTHON_PN}-more-itertools \
+"
+
+inherit pypi ptest setuptools3
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/testing
+	cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
+}
-- 
2.25.0

