Return-Path: <kergoth@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6336D60EF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:56:46 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so925454eek.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 06:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DJjOQiXnVRLn7K5rPgUSAzuwgp3GV3lS1tMxJ3aRP9A=;
	b=An/QraFlxV8JdctJ4FhtF12RkTUmuSsyfJe27CAshWUk7JCvvfsMEhKTkJtmbq3bjV
	0tRjkRtrhFy8FLaPfUnWLqNvSnBBaFR3BOmN6Ze036hVRp1Xn8QZCmSVixSdUPoBX5qC
	MY7SCKxvMCbxDnaYlrq4dXFPrAgLQxAv81hM31Iade7mTj1+w/L//usFnsPDlWZQjr2h
	BkSuTEdfLjCchTGtDikEdU9rGvwaNzI+vlQXsHiOxC8b5RcwBqrIQayTbgsQPTS86ZVQ
	ct90WP2bfBK2ikwhfoB0YJ0QQ+0c/FPTp0wg2+0nbu6wu8D4VAuyb6WoVA3t+aig1RQM
	JrDA==
X-Received: by 10.15.75.68 with SMTP id k44mr3353433eey.57.1386946605773;
	Fri, 13 Dec 2013 06:56:45 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id 44sm7648810eek.5.2013.12.13.06.56.44
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 06:56:45 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 07:56:37 -0700
Message-Id: <6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1386946335.git.kergoth@gmail.com>
References: <cover.1386946335.git.kergoth@gmail.com>
In-Reply-To: <cover.1386946335.git.kergoth@gmail.com>
References: <cover.1386946335.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [RFC 1/2] os-release: add new operating system identification recipe
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
X-List-Received-Date: Fri, 13 Dec 2013 14:56:46 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is needed by systemd, among other useful applications. All fields are
metadata driven, and initial values come from our DISTRO variables.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/os-release/os-release.bb | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/os-release/os-release.bb

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
new file mode 100644
index 0000000..0f67597
--- /dev/null
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -0,0 +1,42 @@
+inherit allarch
+
+SUMMARY = "Operating system identification"
+DESCRIPTION = "The /etc/os-release file contains operating system identification data."
+LICENSE = "MIT"
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+
+# Other valid fields: BUILD_ID ANSI_COLOR CPE_NAME HOME_URL SUPPORT_URL BUG_REPORT_URL
+OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
+
+export ID = "${DISTRO}"
+export NAME = "${DISTRO_NAME}"
+export VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in d else ''}"
+export VERSION_ID = "${DISTRO_VERSION}"
+export PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
+
+export BUILD_ID ?= "${DATETIME}"
+export ID_LIKE
+export ANSI_COLOR
+export CPE_NAME
+export HOME_URL
+export SUPPORT_URL
+export BUG_REPORT_URL
+
+do_compile () {
+    for field in ${OS_RELEASE_FIELDS}; do
+        if eval "test -n \"\$$field\""; then
+            eval "printf \"%s=%s\n\" \"\$field\" \"\$$field\""
+        fi
+    done >os-release
+}
+do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
+
+do_install () {
+    install -d ${D}${sysconfdir}
+    install -m 0644 os-release ${D}${sysconfdir}/
+}
-- 
1.8.3.4


