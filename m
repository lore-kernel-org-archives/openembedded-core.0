Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 02BA76C202
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:21 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v70-v6so1685395wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NVzD2Gj8DIiH8K5aBBW0jh630s8Zo9rpqkN8L+Dj7Ww=;
	b=hQGgUxy0u6bkAExMEuj34P/CJG12ZJSfZxcmHU2+eYhcMgRmk8TOCyp51WxBerbDgQ
	wpquVWEO49/Ial7NZBZGFlTr704wuMxni/NSzzaqTgMJcneASVUgFO93nrcsL6kRflyH
	Eu7pu2+j/E6ka8ie2as8sWkCqo4y/ac4DVeJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NVzD2Gj8DIiH8K5aBBW0jh630s8Zo9rpqkN8L+Dj7Ww=;
	b=R1PuT0Ocxa78k05lTBzb3gCzKJqelLnCyjvxfJauc/BPzbH3nPX/1XGmI5x6kzSlat
	4nwdvRtp06ijRvixCXMphPWXXCgpU5QSRmtheiV31LyK06RIsrinr+yHh0yPkXPfTEYc
	4zJF2HMhU3UFwmF6o+bYQGg3v+4R0hUj+EZhYlv78JTNazbSLZ84VXzfx6K/jHrXzeSD
	amCCOQj9LHVN1LKjZzrQ+CbZQO+EPgQyixuZmk8SqHtLWiKRTwPqUlufYDZlQleW3zPx
	dl7x0ITItnwXHNNZG4kp1c5Ypzyjs3vcKSX+2nmsF7nRm5mH4M+BttVI5o3XzMOWfZdI
	dzag==
X-Gm-Message-State: AGRZ1gL39j78ieUhpcP1viBLWDaUy9QU8lRM0zts/BIFgEgxFnGvGZ8X
	kggMczkskr3gl/ffNmvAntbautBnouQ=
X-Google-Smtp-Source: AJdET5e733NoqR/XqGQRcwL86lHo5yDogMb7A+0nq9X6RrZ1g6DE18ovDeVKI7jWnROOITGnysprEQ==
X-Received: by 2002:a1c:2104:: with SMTP id
	h4-v6mr4692928wmh.130.1541773762168; 
	Fri, 09 Nov 2018 06:29:22 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:21 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:08 +0000
Message-Id: <20181109142912.23102-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 08/12] testimage: Simplfy DEFAULT_TEST_SUITES logic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Nov 2018 14:29:22 -0000

Now that the tests have correct markup to automatically determine which images
they can run against, clean up the default test suites logic to be simpler
and not image specific.

Some cleanup of the compiler tests still needs to be completed but this
is a good first step.

The only downside to this is more noise during testing as we now see
many skipped messages for simple images like core-image-minimal.

The auto type is being removed since it currently breaks badly due to the
socat mandatory inclusion from the meta-selftest layer which is a problem
which needs to be addressed seperately.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index ba2d9c491b2..b8acd3ce782 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -40,31 +40,12 @@ TEST_NEEDED_PACKAGES_DIR ?= "${WORKDIR}/testimage/packages"
 TEST_EXTRACTED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/extracted"
 TEST_PACKAGED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/packaged"
 
-PKGMANTESTSUITE = "\
-    ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'dnf rpm', '', d)} \
-    ${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg', '', d)} \
-    ${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt', '', d)} \
-    "
-SYSTEMDSUITE = "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-MINTESTSUITE = "ping"
-NETTESTSUITE = "${MINTESTSUITE} ssh df date scp oe_syslog ${SYSTEMDSUITE}"
-DEVTESTSUITE = "gcc kernelmodule ldd"
-PTESTTESTSUITE = "${MINTESTSUITE} ssh scp ptest"
-
-DEFAULT_TEST_SUITES = "${MINTESTSUITE} auto"
-DEFAULT_TEST_SUITES_pn-core-image-minimal = "${MINTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-minimal-dev = "${MINTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-full-cmdline = "${NETTESTSUITE} perl python logrotate ptest"
-DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${PKGMANTESTSUITE} ptest"
-DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman xorg parselogs ${PKGMANTESTSUITE} \
-    ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)} ptest gi"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
-    connman ${DEVTESTSUITE} logrotate perl parselogs python ${PKGMANTESTSUITE} xorg ptest gi stap"
-DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${PKGMANTESTSUITE} ptest gi"
-DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
-    connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${PKGMANTESTSUITE} ptest gi stap"
-DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
+BASICTESTSUITE = "ping date df ssh scp python perl apt opkg gi ptest dnf rpm parselogs logrotate connman systemd oe_syslog pam stap ldd xorg"
+DEVTESTSUITE = "gcc kernelmodule buildcpio buildlzip buildgalculator "
+
+DEFAULT_TEST_SUITES = "${BASICTESTSUITE}"
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${BASICTESTSUITE} ${DEVTESTSUITE}"
+DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${BASICTESTSUITE} ${DEVTESTSUITE}"
 
 # aarch64 has no graphics
 DEFAULT_TEST_SUITES_remove_aarch64 = "xorg"
-- 
2.17.1


