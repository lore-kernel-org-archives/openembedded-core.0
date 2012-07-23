Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1StJkb-0004Bn-IR
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 16:36:45 +0200
Received: by bkcik5 with SMTP id ik5so4174890bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uxZgJBcvWajMIiDHXNFMiJfUuk+wlb8QKg65fGwBr50=;
	b=dFT7r9rGoD2xAA/y+dG2e3au3DLX4X8kv3CJC3kAAb2JLEUHH+sCCunsY3rlkCCPf9
	VbrLl2teVtOPcPHMSMNiGjph2UhIauSk/9aykkeQaNoBtrvaxVFFopfKeQbyGaSnSkwD
	ge4Cb28tnqvDDkGkmLQA6vfqlnoNRqOIcDQUrnZlZxlVE7Z4nnIt+t4NJHsEYp7jnG6w
	1o6tDac1ztyaeOcxxWidZq7v55vL0P/7nCqt8/39Yr4I1EJAHy0eFSDqwbQmIj0wQJvI
	raxHnsxMmWcaMnadwZCPPerfgaJi1qVguPB0bPsze1K0s9hkE98K2Z+eiocNe39kEApv
	Xskw==
Received: by 10.204.148.83 with SMTP id o19mr7792758bkv.74.1343053518451;
	Mon, 23 Jul 2012 07:25:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hs2sm7755803bkc.1.2012.07.23.07.25.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 07:25:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2012 16:25:09 +0200
Message-Id: <1343053509-5931-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [RFC] bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 14:36:45 -0000

* whole MACHINEOVERRIDES can change e.g. between MACHINES with different arm architecture, causing allarch packages to reexecute do_package
  bitbake-diffsigs ../shr-core/tmp-eglibc/stamps/all-oe-linux/xserver-nodm-init-2.0-r16.do_package.sigdata.90e760a8f6cecbd87cb2e95f1237e3cc ../shr-core/tmp-eglibc/stamps/all-oe-linux/xserver-nodm-init-2.0-r16.do_package.sigdata.9eeccfd15f25032b3b6b132534660fff
  basehash changed from 7618e17d3fda05d1f15246e6800ca0f0 to 97bc4dc8c1521c535bd96b2aa62d8a03
  Variable MACHINEOVERRIDES value changed from ${MACHINE}${@bb.utils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}:${MACHINE_CLASS} to ${MACHINE}${@bb.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}:${MACHINE_CLASS}

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1525e44..163b311 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -652,6 +652,7 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
 OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
+OVERRIDES[vardepsexclude] = "MACHINEOVERRIDES"
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO', True) or ''}"
 MACHINEOVERRIDES ?= "${MACHINE}"
-- 
1.7.8.6



