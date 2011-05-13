Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKrxk-0004FQ-EU
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 14:59:24 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1944974fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 05:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=DLMzxZTV8Fl9lb7ksx+EUHKTn5VUiYB+/+ddtTpt/yE=;
	b=CMRLop/idCJ7E3tI7ykjjXY/842MqOJBZz3p0Wp0mKVGTSz8S0wGfI+y8V0Wb3Y0zR
	3e8MuAcW5gUbd2Y5t074l3haathbi/HfUnkhEakP4TaExuo8pnfjBnIIyX9hR79IxT3V
	4X3I0vIMi8eStAWmJ/UVeqesrf43uSLb8S83I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=esAZV1twA3DoLdFyNJAF2eM52o8K0u9ctAoZ1kIK6PRVvPfSW25YASjdLEZn5y5cV5
	MS1LKY63P6UPFq26B4na8HS8UWfaRffVT/u+K/qr8dC1DTUj/jBRaUiJg6VjsGl4E8V5
	tYO2CSQKLbkVAJ1N8N8Gcbrr2vHueLwkW6/Ak=
Received: by 10.223.10.150 with SMTP id p22mr596792fap.86.1305291396691;
	Fri, 13 May 2011 05:56:36 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c24sm835166fak.31.2011.05.13.05.56.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 05:56:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 14:56:29 +0200
Message-Id: <6a813fba460d4e6915908b8caa19e266d84f351c.1305291184.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305291184.git.Martin.Jansa@gmail.com>
References: <cover.1305291184.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] bitbake.conf: move VENDOR variables from bitbake.conf to defaultsetup.conf
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
X-List-Received-Date: Fri, 13 May 2011 12:59:24 -0000

* empty TARGET_VENDOR was set before weak assignment in defaultsetup.conf
* -oecore was changed to -oe to be more consistent with SDK_VENDOR as we had -oesdk as SDK_VENDOR and not -oecoresdk

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf             |    4 ----
 meta/conf/distro/defaultsetup.conf |    5 ++++-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7c72de1..418a15d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -62,7 +62,6 @@ target_datadir := "${datadir}"
 
 BUILD_ARCH = "${@os.uname()[4]}"
 BUILD_OS = "${@os.uname()[0].lower()}"
-BUILD_VENDOR = ""
 BUILD_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
 BUILD_PREFIX = ""
 BUILD_CC_ARCH = ""
@@ -70,7 +69,6 @@ BUILD_EXEEXT = ""
 
 HOST_ARCH = "${TARGET_ARCH}"
 HOST_OS = "${TARGET_OS}"
-HOST_VENDOR = "${TARGET_VENDOR}"
 HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 HOST_PREFIX = "${TARGET_PREFIX}"
 HOST_CC_ARCH = "${TARGET_CC_ARCH}"
@@ -78,14 +76,12 @@ HOST_EXEEXT = ""
 
 TARGET_ARCH = "INVALID"
 TARGET_OS = "INVALID"
-TARGET_VENDOR = "${BUILD_VENDOR}"
 TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
 
 SDK_ARCH = "${BUILD_ARCH}"
 SDK_OS = "${BUILD_OS}"
-SDK_VENDOR = "-oesdk"
 SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), ''][bb.data.getVar('SDK_OS', d, 1) == ('' or 'custom')]}"
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 8da6c0a..dd9ffc3 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -3,7 +3,10 @@ include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
 include conf/distro/include/world-broken.inc
 
-TARGET_VENDOR ?= "-oecore"
+BUILD_VENDOR ?= ""
+TARGET_VENDOR ?= "-oe"
+HOST_VENDOR ?= "${TARGET_VENDOR}"
+SDK_VENDOR ?= "-oesdk"
 
 TARGET_FPU_arm ?= "soft"
 TARGET_FPU_armeb ?= "soft"
-- 
1.7.5.rc3



