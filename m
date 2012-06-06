Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ScHto-0002oG-Rk
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 17:11:53 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 06 Jun 2012 08:01:23 -0700
Received: by wibhj8 with SMTP id hj8so4194143wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2012 08:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=FfgcAMg2HpSIsd7L9Z1CFuTQuy84opOdroMfZWEv+b4=;
	b=K+v25zbaK45om+ZK0yInjJoCcjMc60gceF9HwHLcevoSrzFd6K0a3vHc2gQmT14ZQj
	jrNXtapQZ0UbgYI3m7YFbCV56sjAm9KaQ6NTAdCDEOWbHZf8qvHLtP5CyUtTAjSEakYJ
	d+RblL5m/eNMkNopJmdXIuFOqWD+Zz1Ke4jh5TO35mGthPy+/zNRMByPLfoZXBIUdyWQ
	KvWU5WcL4ok2UTKd+So3VxQGm7toOqC+S+u5K039iJjGFbq+nQVP23xvv68+85EApBGd
	PyUT0Jk/T0DoNQuA8UViSqxTZRRilqXi+FwpDDmypG6nc/g9K3qc2hrqObtSGAjpuaYp
	sldw==
Received: by 10.216.218.216 with SMTP id k66mr16409265wep.191.1338994881664;
	Wed, 06 Jun 2012 08:01:21 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id db7sm2935212wib.6.2012.06.06.08.01.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:01:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2012 16:00:41 +0100
Message-Id: <143970248e6096cf714e449bb16f7266eef14291.1338994282.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1338994282.git.ross.burton@intel.com>
References: <cover.1338994282.git.ross.burton@intel.com>
In-Reply-To: <cover.1338994282.git.ross.burton@intel.com>
References: <cover.1338994282.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnLlbppVhp4VjQS2HL9UPhKURJBXOXdnlIeXYyGPUUUcXp2HdnxrBiyyVO9gJi7H8pw70tz
Subject: [PATCH 1/3] connman: respect the 3g feature and enable/disable ofono support
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
X-List-Received-Date: Wed, 06 Jun 2012 15:11:53 -0000

[YOCTO #2357]
---
 meta/recipes-connectivity/connman/connman.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index f2da8d9..58e3f56 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
             ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
-            ofono \
+            ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
 TIST = "--enable-tist"
@@ -34,7 +34,7 @@ EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', '--disable-wifi', d)} \
     ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
     --enable-dnsproxy \
-    --enable-ofono \
+    ${@base_contains('DISTRO_FEATURES', '3g', '', '--disable-ofono', d)} \
     --enable-tools \
     --enable-test \
     --disable-polkit \
-- 
1.7.7.6



