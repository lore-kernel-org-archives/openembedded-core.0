Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.766.1622821048660217756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 08:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K9KMrv77;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id b9so15100527ejc.13
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kfgtlbphPwgzKG8mJ9AKh8Q1xeuqqhdHITbsavKsFSA=;
        b=K9KMrv7736WDbTKszrn1URV7vreUjXESV0ZKgaUcepIpd2UuAgXmisZTURvjcQWa0k
         j+EiIL3Plis/Zq53AoquAg0x8mk6smvYYvNdMfxyFjr3f9JPMARR8u03pCtqsoiUVWOy
         3zmlZVq5QjHBSuDMK91n0RVnJwKKyHuY13UvOYnLtaFbJws0nE1+IzvCawITmovmpxgJ
         UH9zpF1NXIgSGpD/HpICdA3Wk1/HKA9YYGBZbiqRqjAIvq087C53cXWu3kbv4NrLPAs1
         1KD3oVgWwRjY02eZhLhsON/p28fKuZ7dqS5BeSpLe4f2CoRkCqK+VjYGRHDrjWpjju7s
         z0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kfgtlbphPwgzKG8mJ9AKh8Q1xeuqqhdHITbsavKsFSA=;
        b=iCg2R8A/AleV1LpzWdP6J17CFwxT73/lafc6aqo6ekptdZsQKHguC8MPBihMoiit0M
         9nX93GSxq0qdN4UbRELS7jsryk/jDW8MLlPGd7xXIiXTI0sHU+33Cpd+AqpfwKctzeId
         feHWkKVbHgzHEYZE/30W2Xq75wvmCor7Fqo/1/T5f4Ck5WMSQve1Yp3nPslIGo/tV4XK
         +TqurcRzcArF94QbgSc53DGibtBkHE1a2YAdGuO8YSnonzql68DfSijjPd/+chKS701c
         DyKYFp/8lnbMiVCfreBe/j9hPcqDWZXZky40+i7EW+vIEBmUAVD98fNDxDDTznWP2TLQ
         fDBQ==
X-Gm-Message-State: AOAM531uOyRKQ0yD0YL3HoYQQqhqqHAbDFCrZ2yhZR3Qno/shJMGjlYb
	PDsIUL5lfZCKX/7W2f+V71/sfFMQNDOOH6nn
X-Google-Smtp-Source: ABdhPJzdTIHrIbmAbu5eRW0VZNO3aJ7czTqGGiHuY3i+FBSSfJynGsC3HfgW4T/wNzd38tcIuu1LLg==
X-Received: by 2002:a17:906:7ce:: with SMTP id m14mr4733059ejc.444.1622821046832;
        Fri, 04 Jun 2021 08:37:26 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id dy19sm3402511edb.68.2021.06.04.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:37:26 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/3] meta-skeleton: update service example
Date: Fri,  4 Jun 2021 17:37:13 +0200
Message-Id: <20210604153715.1651762-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604153715.1651762-1-adrian.freihofer@siemens.com>
References: <20210604153715.1651762-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Support systemd as well
- Add a simple ptest
---
 .../service/service/run-ptest                 | 45 +++++++++++++++++++
 .../service/service/skeleton.service          |  9 ++++
 .../recipes-skeleton/service/service_0.1.bb   | 32 ++++++++++---
 3 files changed, 81 insertions(+), 5 deletions(-)
 create mode 100644 meta-skeleton/recipes-skeleton/service/service/run-ptest
 create mode 100644 meta-skeleton/recipes-skeleton/service/service/skeleton.service

diff --git a/meta-skeleton/recipes-skeleton/service/service/run-ptest b/meta-skeleton/recipes-skeleton/service/service/run-ptest
new file mode 100644
index 0000000000..16d172609e
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/service/service/run-ptest
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+failures=0
+
+# The result should be PASS, FAIL, or SKIP, and the testname can be any identifying string.
+result_autostart=0
+testname="skeleton autostart"
+if @@STATUS_COMMAND@@; then
+    echo "PASS:  ${testname}"
+else
+    echo "FAIL:  ${testname}"
+    result_autostart=1
+    failures="$(expr "$failures" + 1)"
+fi
+
+
+# Optional ----------------------
+# A ptest might provide a machine readable report such as JUnit XML.
+# Reports are collected by the ptest imagetest if the TESTIMAGE_PTEST_REPORT_DIR
+# variable is configured for the tested image.
+# Example to fetch a xml report to ${TEST_LOG_DIR}/reports-xml/skeleton-test.xml:
+#   TESTIMAGE_PTEST_REPORT_DIR ?= "/tmp/ptest-xml/*.xml:reports-xml"
+# Usually one of the common unit test frameworks such as googletest or python unittest would generate a xml file.
+# Example for calling a C++ goolgetest test: my-gtest --gtest_output="xml:/tmp/ptest-xml/"
+XML_DIR="/tmp/ptest-xml"
+XML_FILE="${XML_DIR}/skeleton-test.xml"
+timestamp="$(date +"%Y-%m-%dT%H:%M:%S")"
+
+mkdir -p "$XML_DIR"
+cat << xxxEOFxxx > "$XML_FILE"
+<?xml version="1.0" encoding="UTF-8"?>
+<testsuites tests="1" failures="0" disabled="0" errors="0" time="0.010" timestamp="$timestamp" name="AllTests">
+  <testsuite name="ServiceTests" tests="1" failures="$failures" disabled="0" errors="0" time="0.010" timestamp="$timestamp">
+    <testcase name="SkeletonAutostart" status="completed" result="$result_autostart" time="0.010" timestamp="$timestamp" classname="SystemTest"/>
+  </testsuite>
+</testsuites>
+xxxEOFxxx
+# End Optional ----------------------
+
+
+# The ptest-runner evaluates the exit value of a test case: 0 means pass, 1 means fail.
+if [ "$failures" -eq 0 ]; then
+    exit 0
+fi
+exit 1
diff --git a/meta-skeleton/recipes-skeleton/service/service/skeleton.service b/meta-skeleton/recipes-skeleton/service/service/skeleton.service
new file mode 100644
index 0000000000..ee1f8c2e21
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/service/service/skeleton.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=skeleton demo service
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/skeleton-test
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-skeleton/recipes-skeleton/service/service_0.1.bb b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
index 669d173ad1..07c8756071 100644
--- a/meta-skeleton/recipes-skeleton/service/service_0.1.bb
+++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
@@ -4,16 +4,24 @@ DESCRIPTION = "This recipe is a canonical example of init scripts"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYRIGHT;md5=349c872e0066155e1818b786938876a4"
 
-SRC_URI = "file://skeleton \
-	   file://skeleton_test.c \
-	   file://COPYRIGHT \
-	   "
+SRC_URI = "\
+    file://skeleton \
+    file://skeleton.service \
+    file://skeleton_test.c \
+    file://COPYRIGHT \
+    file://run-ptest \
+"
+
+# A recipe is "ptest-enabled" if it inherits the ptest class
+inherit update-rc.d systemd ptest
+
 
 do_compile () {
 	${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/skeleton_test.c -o ${WORKDIR}/skeleton-test
 }
 
 do_install () {
+	# init script
 	install -d ${D}${sysconfdir}/init.d
 	cat ${WORKDIR}/skeleton | \
 	  sed -e 's,/etc,${sysconfdir},g' \
@@ -23,10 +31,24 @@ do_install () {
 	      -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/skeleton
 	chmod a+x ${D}${sysconfdir}/init.d/skeleton
 
+	# systemd service file
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/skeleton.service ${D}${systemd_system_unitdir}
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/skeleton.service
+
+	# skeleton-test
 	install -d ${D}${sbindir}
 	install -m 0755 ${WORKDIR}/skeleton-test ${D}${sbindir}/
 }
 
-RDEPENDS_${PN} = "initscripts"
+do_install_ptest() {
+	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
+		sed -i -e 's,@@STATUS_COMMAND@@,systemctl is-active --quiet skeleton,g' ${D}${PTEST_PATH}/run-ptest
+	else
+		sed -i -e 's,@@STATUS_COMMAND@@,${sysconfdir}/init.d/skeleton status,g' ${D}${PTEST_PATH}/run-ptest
+	fi
+}
 
 CONFFILES_${PN} += "${sysconfdir}/init.d/skeleton"
+INITSCRIPT_NAME = "skeleton"
+SYSTEMD_SERVICE_${PN} = "skeleton.service"
-- 
2.31.1

