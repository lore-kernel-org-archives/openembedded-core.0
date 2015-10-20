Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 676C776104
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 21:28:26 +0000 (UTC)
Received: by wijp11 with SMTP id p11so66993954wij.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 14:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rx0epXe25IZeEAHkTBcYUG1B3adP07Pan+cX7dPzQZ8=;
	b=e+0Y/GkFOuLvSYuJl6vEnDEx919eB7T9rcH5bxeusmST7dWFA6BO6zJuc5Z9699/sN
	8NRL0zwHSHFn2xxrII7hHaxiCpCOS7KFyYPgY2Bom7X/cKOLcmQPRgArWrz2W4EnA9KC
	SsGZBPgzXpfUDImTPHGuOyS4DCMfl4aeRTIw3xoAWHhMEdp1vjcqoNknv7Z7Q32vH7/v
	mqkbUbpECE5D76J/l6XsH2xM9CtKI2feVTWG0wXIrltTvW5Qgze71zVyHqStBi35HqFf
	qlXQ87X8KEa64lcHiAVAqppTbPOZFlYGo8Ce+vcxGJtBR7a9prltJalEW2axnlySEe/o
	r2bA==
X-Gm-Message-State: ALoCoQlRcZIrpVk5x+zUu9u6BpXT7DfwkVcjXJ0b6BJk8TfeNd1eF2loAnxPlhCwVo1VmPbnUAPU
X-Received: by 10.194.19.169 with SMTP id g9mr6361240wje.64.1445376506507;
	Tue, 20 Oct 2015 14:28:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w1sm6140784wjz.37.2015.10.20.14.28.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 14:28:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 22:20:48 +0100
Message-Id: <1445376048-30316-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] qemu: disable Valgrind
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
X-List-Received-Date: Tue, 20 Oct 2015 21:28:29 -0000

Qemu has an automatic dependency on valgrind which cannot be disabled, which
causes non-deterministic builds and build failures.  As Valgrind wasn't enabled
previously make this deterministic by forcibly disabling it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu/no-valgrind.patch | 19 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb          |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/no-valgrind.patch

diff --git a/meta/recipes-devtools/qemu/qemu/no-valgrind.patch b/meta/recipes-devtools/qemu/qemu/no-valgrind.patch
new file mode 100644
index 0000000..91f7280
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/no-valgrind.patch
@@ -0,0 +1,19 @@
+There isn't an option to enable or disable valgrind support, so disable it to avoid non-deterministic builds.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure b/configure
+index b3c4f51..4d3929e 100755
+--- a/configure
++++ b/configure
+@@ -4193,9 +4192,0 @@ valgrind_h=no
+-cat > $TMPC << EOF
+-#include <valgrind/valgrind.h>
+-int main(void) {
+-  return 0;
+-}
+-EOF
+-if compile_prog "" "" ; then
+-    valgrind_h=yes
+-fi
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index 59b1788..1505b80 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://smc91c111_fix1.patch \
             file://smc91c111_fix2.patch \
             file://smc91c111_fix3.patch \
+            file://no-valgrind.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-- 
2.1.4


