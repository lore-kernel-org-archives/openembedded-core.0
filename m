Return-Path: <frank.wolff@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037F0C77B60
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 14:36:19 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.131706.1680705373599996009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 07:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=RbIiRe4+;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: frank.wolff@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so18569625wmq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680705372; x=1683297372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKXe7vGixeSXGGrOEs4oLdtn9JH5zfhTWP35O3jni+Y=;
        b=RbIiRe4+4/R+uxPBObSMYy35wQIXhi9ub3SBdm9IWOJD1t33bTn9LbYSMZyU4b7tc5
         crniWH4g2FiYze7xW8xnvYEvWAKfZR6btCPHUC5db/DVx2reb8g1fl/q+WnsPydBE7Et
         vSrgWqTL2buYEPke1v4sZKcl8LLHwfmyLti3+282EBoeHNotikkupqfcuSBdC6X3/n2L
         YBhUAyo5KJs28i7Kel6vQc0ls5qehJTyMZs/vIOzRWkK15QGpDspMtpgXci9wFihutPf
         IkF8Qgp3yVEM7yU1O4fh8qMJVjW7J5wEefkZp/L5tliJWvq+H0VWIe3gjTqW6T2woFw3
         FBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680705372; x=1683297372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKXe7vGixeSXGGrOEs4oLdtn9JH5zfhTWP35O3jni+Y=;
        b=Zo/qivw13P/cDs0aO4WM69G93zj2gARjOxpUnPR+V9M72uY+IzDX5LosbABcCcVEKA
         FF5XEkxBpCeoGcDdYAftUD9GO3bhZZ5CPhspn7bn8CqbVqdhZ6APKye/Nwwse/zCt79p
         xuRW/4xj6+omSjtBrutGkYXr5u/uzC24XLMdB701YJ2Rb0WcuQyBKV9kXTlH9SwOhQ0D
         xdpuEdy2+hvgSPEaAGkGn+TaPpn4t3bHHF4p0H5jD3fMw37ERrtjmqQB22DfZre6rDJf
         NRo2BzgT565AqqldhCn01dx6vHs1evxJf7ULyGaylSY4V1mrObHJ6IaE41207Srp551F
         exng==
X-Gm-Message-State: AAQBX9dOhE8meBVCfoHnYimsO99ku6yVCrifZYbGndjVb6ViMi+VR13m
	TqSwIi97ByH8gSMO5YzJ2ZTy4PHanqU9J7Ic0pU=
X-Google-Smtp-Source: AKy350a7bjv1pH02zARYXUJ3DutSlunY6YMaYgBLf2jsmN2jWwZRpH+A54dFtwRta9gv3Pp9trbVbw==
X-Received: by 2002:a05:600c:c4:b0:3ef:76dc:4b92 with SMTP id u4-20020a05600c00c400b003ef76dc4b92mr4684375wmm.28.1680705371681;
        Wed, 05 Apr 2023 07:36:11 -0700 (PDT)
Received: from P-GNB-MrWolff-frwol.. ([93.23.208.52])
        by smtp.gmail.com with ESMTPSA id m23-20020a7bca57000000b003ed2384566fsm2359288wml.21.2023.04.05.07.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:36:11 -0700 (PDT)
From: Frank WOLFF <frank.wolff@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Frank WOLFF <frank.wolff@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH] logrotate: add ptest support
Date: Wed,  5 Apr 2023 16:36:04 +0200
Message-Id: <20230405143604.2769501-1-frank.wolff@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 14:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179737

Below is an extract of the test log:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2023-04-05T12:20
BEGIN: /usr/lib/logrotate/ptest
make  check-TESTS
make[1]: Entering directory '/usr/lib/logrotate/ptest'
make[2]: Entering directory '/usr/lib/logrotate/ptest'
PASS: test-0001.sh
PASS: test-0002.sh
...
...
PASS: test-0107.sh
PASS: test-0108.sh
============================================================================
Testsuite summary for logrotate 3.21.0
============================================================================
 # TOTAL: 102
 # PASS:  97
 # SKIP:  5
 # XFAIL: 0
 # FAIL:  0
 # XPASS: 0
 # ERROR: 0
============================================================================
make[2]: Leaving directory '/usr/lib/logrotate/ptest'
make[1]: Leaving directory '/usr/lib/logrotate/ptest'
DURATION: 353
END: /usr/lib/logrotate/ptest
2023-04-05T12:26
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Frank WOLFF <frank.wolff@smile.fr>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../logrotate/logrotate/run-ptest             |  5 ++++
 .../logrotate/logrotate_3.21.0.bb             | 30 +++++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-extended/logrotate/logrotate/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index d60ebb38fc..78750a0d98 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -46,6 +46,7 @@ PTESTS_FAST = "\
     libxml-sax-base-perl \
     libxml-simple-perl \
     libxml2 \
+    logrotate \
     lua \
     lzo \
     m4 \
diff --git a/meta/recipes-extended/logrotate/logrotate/run-ptest b/meta/recipes-extended/logrotate/logrotate/run-ptest
new file mode 100755
index 0000000000..b272def65f
--- /dev/null
+++ b/meta/recipes-extended/logrotate/logrotate/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+set -u
+
+make -k check
diff --git a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb b/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
index 4e4ea10628..87c0d9ae60 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
@@ -10,7 +10,9 @@ DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
+           file://run-ptest \
+           "
 
 SRC_URI[sha256sum] = "8fa12015e3b8415c121fc9c0ca53aa872f7b0702f543afda7e32b6c4900f6516"
 
@@ -44,7 +46,7 @@ EXTRA_OEMAKE = "\
 # INSTALL=install and BASEDIR=/usr.
 OS_NAME = "Linux"
 
-inherit autotools systemd github-releases
+inherit autotools systemd github-releases ptest
 
 SYSTEMD_SERVICE:${PN} = "\
     ${BPN}.service \
@@ -86,3 +88,27 @@ do_install(){
         install -p -m 0755 ${S}/examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
     fi
 }
+
+do_install_ptest() {
+    cp -r ${S}/test/* ${D}${PTEST_PATH}
+    cp ${S}/test-driver ${D}${PTEST_PATH}
+    cp ${B}/test/Makefile ${D}${PTEST_PATH}
+
+    # Do not rebuild Makefile
+    sed -i 's/^Makefile:/_Makefile:/' ${D}${PTEST_PATH}/Makefile
+
+    # Fix top_builddir and top_srcdir
+    sed -e 's/^top_builddir = \(.*\)/top_builddir = ./' \
+        -e 's/^top_srcdir = \(.*\)/top_srcdir = ./' \
+        -i ${D}${PTEST_PATH}/Makefile
+
+    # Replace bash with sh
+    sed -i 's,/bin/bash,/bin/sh,' ${D}${PTEST_PATH}/Makefile
+
+    # Replace gawk with awk
+    sed -i 's/gawk/awk/' ${D}${PTEST_PATH}/Makefile
+    ln -s ${sbindir}/logrotate ${D}${PTEST_PATH}
+}
+
+# coreutils is needed to have "readlink"
+RDEPENDS:${PN}-ptest += "make coreutils"
-- 
2.39.2


