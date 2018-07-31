Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E507478D7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 00:01:16 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id h20-v6so1157348wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 17:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=C63+zTD9m0jDPOH0yUzAaxq5bCTMyfOkZAhgjfkJoGA=;
	b=M+ng+AI7urllgu/fD+t9ZfXo8jMmiDy2ns3HSBj1SLmbyHeONvzMImBVfNe3+KTMmU
	ZnkTnZLsbtFXTX/QFFpPSflt2dFBo1cutxIhumKGsyG4vKK7FeJvHo8DVPJQxLVgXVMH
	SPavPll4P920NsEXiXAXLpnh9oQCltSroa8jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=C63+zTD9m0jDPOH0yUzAaxq5bCTMyfOkZAhgjfkJoGA=;
	b=Cbj/nkNT1q31u2vAJCEdxeuOM8efznElHXKF3euhPSIlMc+j/q/VjL5yKX5JRcMt8V
	LZ04q4AecZa9yL3NPUdsa7k3g44TxeiHvgshgTJBVPnDq0NByW4Uf50PtubBOYTqaVTm
	80wMFatRtxIs2b+/RCD4cYIkoHIULpovz0Hq3jEu/kUH0mBTDQXCXdegCCZ7iovRKpbJ
	RyHdm+LY+jdPdScgM2bcePMHOkNaaaAjdfDrXtDLLJohHNnJO7NrzxdT17fTmpFncVi3
	QSRjYnUTbR3BtLZdchJiR4dJnPn103PeK7OHjyzq1pfujUAXDRzLy2xmRKNRhVRTbNTF
	BVVw==
X-Gm-Message-State: AOUpUlH3LIYyZuueJZMrXZTMKor2pHFybU2KbIS7B4psd1klgtHza9Zc
	t3AIT+BE0UIRuVwGioVpNkRGKqZC9+ZmYA==
X-Google-Smtp-Source: AAOMgpcpnxm0TQWCaBRJnnpfEbiTeZbq0oIn/lc/JVemI46puoU06YZveC4E/O/DzBSEr+OhEybHNg==
X-Received: by 2002:a1c:1203:: with SMTP id 3-v6mr825428wms.46.1532995277064; 
	Mon, 30 Jul 2018 17:01:17 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b202-v6sm934937wme.22.2018.07.30.17.01.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jul 2018 17:01:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 01:01:15 +0100
Message-Id: <20180731000115.21019-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/selftest: Add package hardlink test
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
X-List-Received-Date: Tue, 31 Jul 2018 00:01:17 -0000

We keep breaking the preservation of hardlinks during the packaging process.
Add a selftest which tests this to try and prevent this breaking again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../selftest-hardlink/selftest-hardlink.bb    | 19 +++++++++++++++++++
 .../selftest-hardlink/hello.c                 |  5 +++++
 meta/lib/oeqa/selftest/cases/package.py       | 15 ++++++++++++++-
 3 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
 create mode 100644 meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink/hello.c

diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
new file mode 100644
index 00000000000..8a0e6336aa8
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
@@ -0,0 +1,19 @@
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+SRC_URI = "file://hello.c"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} hello.c -o hello ${CFLAGS} ${LDFLAGS}
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 755 hello ${D}${bindir}/hello
+	ln ${D}${bindir}/hello ${D}${bindir}/hello2
+	ln ${D}${bindir}/hello ${D}${bindir}/hello3
+	ln ${D}${bindir}/hello ${D}${bindir}/hello4
+}
diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink/hello.c b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink/hello.c
new file mode 100644
index 00000000000..5c45dc60bd2
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink/hello.c
@@ -0,0 +1,5 @@
+#include <stdio.h>
+
+int main() {
+	printf("Hello World!\n");
+}
\ No newline at end of file
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index ef6eabef665..1e171b5ebef 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -1,6 +1,7 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.utils.commands import bitbake, get_bb_vars
+from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var
+import stat
 import subprocess, os
 import oe.path
 
@@ -84,3 +85,15 @@ class VersionOrdering(OESelftestTestCase):
             status = subprocess.call(command, env=env)
             self.assertIn(status, (99, 100, 101))
             self.assertEqual(status - 100, sort, "%s %s (%d) failed" % (ver1, ver2, sort))
+
+class PackageTests(OESelftestTestCase):
+    # Verify that a recipe which sets up hardlink files has those preserved into split packages
+    def test_preserve_hardlinks(self):
+        result = bitbake("selftest-hardlink")
+
+        dest = get_bb_var('PKGDEST', 'selftest-hardlink')
+        bindir = get_bb_var('bindir', 'selftest-hardlink')
+
+        # Recipe creates 4 hardlinked files, there is a copy in package/ and a copy in packages-split/
+        # so expect 8 in total.
+        self.assertEqual(os.stat(dest + "/selftest-hardlink" + bindir + "/hello").st_nlink, 8)
-- 
2.17.1


