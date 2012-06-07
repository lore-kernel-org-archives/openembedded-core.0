Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Scdjj-0005r9-CT
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 16:30:55 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 07 Jun 2012 07:20:25 -0700
Received: by wgbdr13 with SMTP id dr13so387209wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2012 07:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=XF3rIfyPmUev5whBkbNlL6e4B7TgaTgT2xVcp9Gqq80=;
	b=Q8AG2EI7PF6ZCfYXpeoMgRFOCfRm2KOrGb4xpNyQ7T5hCcsZGMpk9k2Nnlcm4XJ2Pe
	uGxYJq1Yu7uWD05AWdX/33WgIB7diOF5SH1Z8Bs6ZLqBcb3lrlPwBlE8W4M4cKvU7/WA
	beuESiZkyzv5oCJvgnxQVSVJLkLg/iPb+35SpJEJUdjanTEnFJyL3SaxCC6+hvgGR9xF
	Qxk11LMUzADJnT/sblMcQlvs0gCKwM9oAk3qw5qiZtkUw/CK7C/rdaBrxfzEaj9Iu4Mj
	49ccnkT/TuOq6UjUXPKkHr9BCf4kacwOubhrWAzDyhKM5lVHfTNAWk+zHcj0wYPgJW6x
	yA1Q==
Received: by 10.216.144.145 with SMTP id n17mr1026357wej.101.1339078823337;
	Thu, 07 Jun 2012 07:20:23 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	eb8sm1341625wib.11.2012.06.07.07.20.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 07:20:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 15:19:36 +0100
Message-Id: <5afc9f367cc3224e82bbe59fe9bda14f504b45c0.1339078729.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339078729.git.ross.burton@intel.com>
References: <cover.1339078729.git.ross.burton@intel.com>
In-Reply-To: <cover.1339078729.git.ross.burton@intel.com>
References: <cover.1339078729.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQleP85oG1Z5R/xGoHfPaL+P4UjJzs7uK+x/zcBXNrzb4QU6WsunRCPomG/ZvFKKVSHpZt5G
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
X-List-Received-Date: Thu, 07 Jun 2012 14:30:55 -0000

[YOCTO #2357]

Signed-off-by: Ross Burton <ross.burton@intel.com>
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



