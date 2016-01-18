Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 811D3731CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 21:34:21 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id x140so13054483oif.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mCeuU9SVzYpmQWjKED5wyI2gaYxodFqaOPHTQnbFcc0=;
	b=vPqL6bDNQEK8cjpsjx3bA91rznS4PGfL9tK56pXRbsOlU5DaYoSfNTUCSh6X6/09ll
	FctDX2ij4ZJt57gDeF5pLN3MpzaEG0DmfAObB2i3EwFMWio3osXM3MlZ0R9DojYWlCho
	IuZx5Jkq4pVvahzDaC2IfserRFGLpgHePlpit5hF4wbJq/LtR3T5eGHWO81uigELEowR
	OG9FuhNRgSMZ/epRqQdJUNyHm1/AgZ31cFSbUQSTRSjTjvpBZoqPCXOdd0GoqhKX44JI
	p6aWPeNy+ToZiR+seHXEiJfFsB76rwT7rgqXrtWrpWUHng2nxNMB/1Qib+4OmH7PZcb9
	s/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mCeuU9SVzYpmQWjKED5wyI2gaYxodFqaOPHTQnbFcc0=;
	b=cSawuKzUXSdFDjDb45XYaOFESDj+599hu7s/vIDLt9f4J4oPW4dt71xRd7mKsmuvco
	CTN101MbjxpiGpAcNuPrjZDO4o66CQ31n+S1MXipJxKqDKx9Izd/S2/hQhXrxKsEAtwe
	2ENpxCdCWbAMe4WiZCA01jArMvjb98b21Ak1xuJL9Z4Q0l2xCcHl1oac06VxWNAI3URj
	VA7aTMltWaFX1wJv4UKZXxq3SrAJoCUksia6XdDE6lJhldF68ynlwOKC2DldVKoww1K+
	zjyhVDzPqQUwNq1Gi9l6wmFhTFzH5zOdHeNvHjVtoSoZl601C24Oyy2TQojy7JRj9zJ2
	D0eA==
X-Gm-Message-State: AG10YORsc5IF40GPdUdfTlQpaLTMXEKBDsPgW2jnZhSOBeoM7SAtxXISSp8fi81wjz+pVA==
X-Received: by 10.202.241.130 with SMTP id p124mr13343404oih.58.1453152861961; 
	Mon, 18 Jan 2016 13:34:21 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id v6sm5928816oer.10.2016.01.18.13.34.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jan 2016 13:34:21 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 13:33:51 -0800
Message-Id: <1453152832-12019-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453152832-12019-1-git-send-email-armccurdy@gmail.com>
References: <1453152832-12019-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 4/5] strace: fix ARCH definition in tests/Makefile
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
X-List-Received-Date: Mon, 18 Jan 2016 21:34:21 -0000

TARGET_ARCH doesn't map to strace's ARCH variable, so we can't assign
one from the other. Forcing the incorrect value via the make command
line doesn't cause any problems with strace v4.10, but it will do for
strace v4.11.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../define-OS-ARCH-in-tests-Makefile-am.patch      | 26 ++++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.10.bb        |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch

diff --git a/meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch b/meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch
new file mode 100644
index 0000000..4b1bb26
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch
@@ -0,0 +1,26 @@
+Ensure that OS and ARCH are defined in tests/Makefile.am
+
+For strace v4.10 this is a purely cosmetic fix, since the include
+paths derived from $(OS)/${ARCH) are never used. These variables are
+correctly defined by default in strace v4.11.
+
+Partial backport of upstream commit:
+
+  http://sourceforge.net/p/strace/code/ci/25c804ce42261b24b19d35c637bf2745c237ee07
+
+Upstream-Status: Backport
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+Index: strace-4.10/tests/Makefile.am
+===================================================================
+--- strace-4.10.orig/tests/Makefile.am
++++ strace-4.10/tests/Makefile.am
+@@ -1,5 +1,7 @@
+ # Automake input for strace tests.
+ 
++OS = linux
++ARCH = @arch@
+ AM_CFLAGS = $(WARN_CFLAGS)
+ AM_CPPFLAGS = -I$(top_builddir)/$(OS)/$(ARCH) \
+ 	      -I$(top_srcdir)/$(OS)/$(ARCH) \
diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
index 0b2316b..1b64743 100644
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ b/meta/recipes-devtools/strace/strace_4.10.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://run-ptest \
            file://Include-sys-stat.h-for-S_I-macros.patch \
            file://Include-linux-ioctl.h-for-_IOC_-macros.patch \
+           file://define-OS-ARCH-in-tests-Makefile-am.patch \
           "
 
 SRC_URI[md5sum] = "107a5be455493861189e9b57a3a51912"
@@ -37,7 +38,7 @@ do_install_append() {
 }
 
 do_compile_ptest() {
-	oe_runmake -C ${TESTDIR} buildtest-TESTS OS=linux ARCH="${TARGET_ARCH}"
+	oe_runmake -C ${TESTDIR} buildtest-TESTS
 }
 
 do_install_ptest() {
-- 
1.9.1


