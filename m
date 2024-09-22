Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81761CF9C68
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:42:04 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.11623.1726994514174775293
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Gx/K9kyc;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53655b9bbcdso3899498e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726994512; x=1727599312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0uDRZA04VsIMktPpDX99/nDrmUPNNj3R7DcNAkt110=;
        b=Gx/K9kyckxO6j07kftVx4WuL1TmZ1+14ocERRndW5DYTa2Vuf3xtcIXhtDQN4ty8Qe
         95gf1uzes8warf1AducAndCqqkrUiGPZv3de1aUEgQ9fjKoL3kW/6252n5mBCNTp8JwL
         a7NKhpW7/pO8Kx2iwjtm0KvBHFMFVBGfOKhA5F4v7WbhzhaFcZLHZf+LwABb5nICak1S
         L/ifHptKyYpsKzWOp8PXmgs6NTJ+6UmIFCCPXhlhfoxxsHQ58Ib9D9o6wOQ7Q9K/1fiF
         Ldwu6uk1sdMRYLuraRM0+HSMpX6YTto2UpMpcxf2/86VnY3mjvtY7v5s3IodPnuEg66R
         +DCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994512; x=1727599312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0uDRZA04VsIMktPpDX99/nDrmUPNNj3R7DcNAkt110=;
        b=dGwPt269xudQqw2cm7ry6HMGMe2EFmAL7w6Bq4RDkWHKLaGWOJBqM6lU43EhB7z9IO
         YSyKMvmIxbVIMUi0dpVN+blVv0RSrcH/phUz7HJoepqwx9ZzyxkbaPryvspKL912lfew
         HmBnrFNH5U6m6VrRrv9WfZzOba3pWAxa/Byri21xUhJZRC3zI+tU1FePFX5tUPFGpv6Z
         MKeFzGmEiNAFMqnVrUD1qpQPSH7eA2kUDc+37/rHqAalVeSmtE4Sxuir6i3qS7VD43Wo
         PplrahVIGdigYCEuDlN4AooxDiP5pWMuTIsRmICiv0gfhOX+8tUtfwTV0c1q57QSfLQ3
         u2ow==
X-Gm-Message-State: AOJu0Yyrzu8eHZDLEdfbIICwH7nd1EBVF4BN0z0sp4sNVxmmgBQxZ3Rv
	Gibvi5xckK1JJCexXA0BjHJRPsFmnroUjImQaftrVPPdW7HV9XlwCSCWCjweiVgujc4d7WhQfcT
	48UA=
X-Google-Smtp-Source: AGHT+IG3/jZnvyTtcyly4cdu9kU7cdcxho1EbaUsKYaUTurxCwv3i6NYk7+E/U+UePBr4yR3rhbyVg==
X-Received: by 2002:ac2:4c4b:0:b0:52c:d645:eda7 with SMTP id 2adb3069b0e04-536ad164093mr3330117e87.18.1726994512291;
        Sun, 22 Sep 2024 01:41:52 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8745sm2877339e87.236.2024.09.22.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:41:50 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 01/12] python3-pefile: add recipe from meta-openembedded
Date: Sun, 22 Sep 2024 11:41:17 +0300
Message-ID: <20240922084128.9648-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240922084128.9648-1-mikko.rapeli@linaro.org>
References: <20240922084128.9648-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204773

It is needed by systemd ukify tool and uki.bbclass to generate
UEFI boot binaries. Added to fast list in ptest-packagelists.inc.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-pefile/run-ptest           |  3 ++
 .../python/python3-pefile_2023.2.7.bb         | 28 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pefile/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-pefile_2023.2.7.bb

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 7b8418654a..4a48188562 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -70,6 +70,7 @@ PTESTS_FAST = "\
     python3-more-itertools \
     python3-packaging \
     python3-pluggy \
+    python3-pefile \
     python3-pyasn1 \
     python3-pytz \
     python3-pyyaml \
diff --git a/meta/recipes-devtools/python/python3-pefile/run-ptest b/meta/recipes-devtools/python/python3-pefile/run-ptest
new file mode 100644
index 0000000000..95ae72306f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pefile/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake --ignore=./tests/pefile_test.py
diff --git a/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
new file mode 100644
index 0000000000..e30b362323
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Python PE parsing module"
+DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
+HOMEPAGE = "https://github.com/erocarrera/pefile"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
+
+inherit setuptools3 ptest
+SRCREV = "1ab2807c4eec16041e791d7a6acc68cc23fd5266"
+SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
+           file://run-ptest"
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install_ptest() {
+   install -d ${D}${PTEST_PATH}/tests
+   cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+    python3-mmap \
+    python3-netclient \
+    python3-stringold \
+"
+RDEPENDS:${PN}-ptest += "\
+    python3-pytest \
+    python3-unittest-automake-output \
+"
-- 
2.34.1


