Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id D3DAB601F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 22:27:52 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id d2-v6so7441533wro.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 15:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=gdx02goCTUKXxw1PwiIR2UUH+JGGBtRgHdA23EoY4mQ=;
	b=OAxcM2uEvCnlTd0gnVuwgOBTGInIKrzfs6D00gttgi/9344LymZOqQII01mN/Um4sR
	x6RJBJu0GDyqCBBi/9uf0P04+E0U95QTrNJju42AV7iPXme1MNFKsqI4D7rUOxHB4szr
	8NLfJll0EDxu+z9TOehFgEPyBf6MgL+vxqLY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gdx02goCTUKXxw1PwiIR2UUH+JGGBtRgHdA23EoY4mQ=;
	b=snMsgXxgRQyR/TyNhvfNOUSryy11+tWVeD+XdSa0TZZc1A1ABZT3oX1a5t/BZnBAJR
	I1qJPmCAhvYEVyF6AYm7BDnl9e94MZAmenP9rj7PLYeYpvATbGCN8RufI6V+udzTYP1B
	Nrkz/Li8h9HjsojYewRzrr0pIrNheZMiydvCbbju5BhgBtoUvYvOUF+F1K4sOpApz3nC
	PpaWtDWqyVcicjRvk1VzY6ULIHvHurERWx77DhX7MV61xq+o5YsEZR1OOehhivr0O8+i
	ly5I3uTNt2sOSs8D2s+pK6ysKxAAahRAU0/8BZTh+kf6WAsQvy7BdtPKtgj1Hghcfgny
	OrhA==
X-Gm-Message-State: ABuFfoiFfJdX3yCBslwFkkJlqIHnvP+EZmGV31cpv0sAJNX9dJaxyd71
	1cHCvMR4TgLFwz71jTBQNYXikQ1Hbfc=
X-Google-Smtp-Source: ACcGV60AMKCmk9v5HUlCIvi42BUcH+hlN9kSQJU6SgRB3PSQtqyEJ7d8HjT2tD+1bA2MIlYm0n0RNg==
X-Received: by 2002:adf:a352:: with SMTP id
	d18-v6mr25099200wrb.31.1539210472836; 
	Wed, 10 Oct 2018 15:27:52 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y76-v6sm9441673wmd.37.2018.10.10.15.27.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 15:27:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 23:27:48 +0100
Message-Id: <20181010222750.378-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] testimage: Ensure opkg/apt test suites are run
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
X-List-Received-Date: Wed, 10 Oct 2018 22:27:53 -0000

Currently only the dnf package manager tests are automatically added to the
list of tests to run. Improve the code to handle automatic addition of
the apt and opkg tests too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 39de191a73b..e289b9343cd 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -40,7 +40,11 @@ TEST_NEEDED_PACKAGES_DIR ?= "${WORKDIR}/testimage/packages"
 TEST_EXTRACTED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/extracted"
 TEST_PACKAGED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/packaged"
 
-RPMTESTSUITE = "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'dnf rpm', '', d)}"
+PKGMANTESTSUITE = "\
+    ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'dnf rpm', '', d)} \
+    ${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg', '', d)} \
+    ${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt', '', d)} \
+    "
 SYSTEMDSUITE = "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 MINTESTSUITE = "ping"
 NETTESTSUITE = "${MINTESTSUITE} ssh df date scp oe_syslog ${SYSTEMDSUITE}"
@@ -51,14 +55,14 @@ DEFAULT_TEST_SUITES_pn-core-image-minimal = "${MINTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-minimal-dev = "${MINTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-full-cmdline = "${NETTESTSUITE} perl python logrotate ptest"
 DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${RPMTESTSUITE} ptest"
-DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman xorg parselogs ${RPMTESTSUITE} \
+DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${PKGMANTESTSUITE} ptest"
+DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman xorg parselogs ${PKGMANTESTSUITE} \
     ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)} ptest gi"
 DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
-    connman ${DEVTESTSUITE} logrotate perl parselogs python ${RPMTESTSUITE} xorg ptest gi stap"
-DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${RPMTESTSUITE} ptest gi"
+    connman ${DEVTESTSUITE} logrotate perl parselogs python ${PKGMANTESTSUITE} xorg ptest gi stap"
+DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${PKGMANTESTSUITE} ptest gi"
 DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
-    connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${RPMTESTSUITE} ptest gi stap"
+    connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${PKGMANTESTSUITE} ptest gi stap"
 DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
 
 # aarch64 has no graphics
-- 
2.17.1


