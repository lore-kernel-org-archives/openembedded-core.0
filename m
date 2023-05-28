Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8695EC7EE32
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:18 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.33140.1685293694103172809
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EIlzJyDc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64d341bdedcso1829422b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293695; x=1687885695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjbZ/vVS4DyGwde4fLihfCqOR+qKEnej09HRJNCJjtA=;
        b=EIlzJyDcy7srutXfJinh41tCkP0zdY+oE/47sztDV4wTlyr6m1zcettyhfOxgN74wt
         f5JDtDRqUWw9pTeFSDUvtOmfqkr4PuozDhIdmPPn+U0jAXeVogPMu9obmH3c/Ad9GF4x
         XmYPCht38+37QeYhh2SNzxuZBrrdavtGgOITiEjxmKlKNfyYCqldMJRje1sIQBmOXhM0
         wW0vegKsTPxb2HSIufUEp1gpammq4Tvy5uE8Y6zAo00g45ze2pF5iV7vk9w7TK1+S3ay
         x7C2KYGoKJYlbAQurVadW9Faffs9OU00tpKMkh80IpdNu6bXB+VnKY1aHfcZSMq438pc
         CoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293695; x=1687885695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjbZ/vVS4DyGwde4fLihfCqOR+qKEnej09HRJNCJjtA=;
        b=EGyiyfNJL7ZC6Qbcz59x9rIMs2tCB/un54+ekNGGWKOxGHpgMCBMlV2Sb7hqpMQgqV
         kkLLAWqb07tV+l8flFyt/32ogVySkTm/EAqjRn5zaXAwF3H0tRUCvUGOc2top/JUx3GB
         Iyi9CwhXiP5YI/SSY/htxpnitSGWiA6OdxjFUPKtqH3/NnW7Fjx/+TAFDKEwod5CSbbx
         J0qpmQ9/xDuP8IDmdd+FctoBpt0AQdbXv5YFq7FLwnVzcwge7jXTWEjUgZX34cZ0yTZS
         b2YUNsUpqEYRaDIIsqZhWVsafJ86PTKjQsX40tNGaNJBdPykZPNh8q8/OD9ozwbnTj0u
         B/gQ==
X-Gm-Message-State: AC+VfDwK8zIp8Q/+zrzSoUQ5JaWBWosjnxRMxGDkpsLfOK7y5m1QMPRq
	fTRJig/RS7uHGzzBgOoJT/I/jsJy0oFFMX1nHdw=
X-Google-Smtp-Source: ACHHUZ6/fbUf7++Fo9dVS96eNaeP9BRf+BLj1ftF0VMot1X7qy/UQzlshVyMgC+MsNfpjOVCpn7zxw==
X-Received: by 2002:a05:6a20:144e:b0:f2:ad27:f98a with SMTP id a14-20020a056a20144e00b000f2ad27f98amr8121891pzi.14.1685293694774;
        Sun, 28 May 2023 10:08:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/12] expect: Add ptest support
Date: Sun, 28 May 2023 07:07:50 -1000
Message-Id: <e145ddefac0cb65072797c13f6067670d4631bfb.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181842

From: Chi Xu <chi.xu@windriver.com>

Test results:
root@qemux86-64:~# ptest-runner expect
START: ptest-runner
2023-05-23T05:17
BEGIN: /usr/lib64/expect/ptest
via send_stdout
PASS: cat-1.1
PASS: expect-1.1
PASS: expect-1.2
PASS: expect-1.3
PASS: expect-1.4
PASS: expect-1.5
PASS: expect-1.6
PASS: expect-1.7
PASS: expect-1.10
PASS: expect-1.11
PASS: expect-1.12
PASS: expect-1.13
PASS: expect-1.8
PASS: expect-1.8b
PASS: expect-1.9
PASS: logfile-1.1
PASS: pid-1.2
PASS: pid-1.3
PASS: pid-1.4
PASS: pid-1.5
PASS: send-1.1
PASS: send-1.2
PASS: spawn-1.1
PASS: spawn-1.2
PASS: spawn-1.3
PASS: spawn-1.4
PASS: spawn-1.5
PASS: stty-1.1
PASS: stty-1.2
DURATION: 17
END: /usr/lib64/expect/ptest
2023-05-23T05:17
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Chi Xu <chi.xu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 meta/recipes-devtools/expect/expect/run-ptest   | 6 ++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb   | 8 +++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-devtools/expect/expect/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index d60ebb38fc..003348906a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -17,6 +17,7 @@ PTESTS_FAST = "\
     diffutils \
     ethtool \
     expat \
+    expect \
     findutils \
     flex \
     gawk \
diff --git a/meta/recipes-devtools/expect/expect/run-ptest b/meta/recipes-devtools/expect/expect/run-ptest
new file mode 100755
index 0000000000..856c314eaf
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+out_put=`tclsh tests/all.tcl -verbose bpse`
+echo
+echo "${out_put}" | awk '/PASSED|FAILED|SKIPPED/{gsub(/PASSED/,"PASS"); gsub(/FAILED/,"FAIL"); gsub(/SKIPPED/,"SKIP"); if ($NF=="PASS"){print $NF": "$(NF-1)}else{print $NF": "$2}}' | uniq
+
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 6cb46f334c..7b610b1ff2 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=fbf2de7e9102505b1439db06fc36ce5c"
 DEPENDS += "tcl"
 RDEPENDS:${PN} = "tcl"
 
-inherit autotools update-alternatives
+inherit autotools update-alternatives ptest
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-configure.in.patch \
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch \
            file://0001-fixline1-fix-line-1.patch \
            file://0001-Add-prototype-to-function-definitions.patch \
+           file://run-ptest \
            "
 SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
 SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34"
@@ -44,6 +45,11 @@ do_install:append() {
         sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    cp -r ${S}/tests ${D}${PTEST_PATH}
+}
+
 # Apparently the public Tcl headers are only in /usr/include/tcl8.6
 # when building for the target and nativesdk.
 TCL_INCLUDE_PATH = "--with-tclinclude=${STAGING_INCDIR}/tcl8.6"
-- 
2.34.1


