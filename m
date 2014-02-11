Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED726EE47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 22:43:10 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id e4so494536wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 14:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=q2ulqaVRqH4CNIA3EfW0ihEXnui6S6THXSuza+3KgM0=;
	b=lJ66+BVNxFlggVYIvChivn8y9MaAsf6mG0L5xZC2UcR1gsMJLMsHGvrn64n8NSLSW4
	ZZ1UOlH0a5rlpYWjOnz4RMzVV5l0O6wnddsR9myjmCm2fWxMTzp+N/BNDx3RifHpS39N
	vVtXFO9NgekYIkF5y5E8Pli5w7Z3DQpJFZaH57k9dXE5vJNlQeYTJHVr/w7p2pZG9Q4n
	YJ/t84MT5vrcxuuxVyo/qk4And2lr2O2v6/iEp9Q09iMeEPfS5/qwvjM507GuKYDrkca
	FTKvEVhg5NKxSUu77mi1AhhiLIwtI4V3LDRWmK0TYEXIrEUHTZA4eEB4hjE0qp9OcZyF
	UrMw==
X-Gm-Message-State: ALoCoQkDR7pgcJwSLnHqYQM7GD1BR3wlUPutoy9/gvoc0sV63t9LkL8FgQEfRE8am0bdT6Y7cUH3
X-Received: by 10.180.99.39 with SMTP id en7mr329084wib.10.1392158590071;
	Tue, 11 Feb 2014 14:43:10 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id t5sm17403287wjw.15.2014.02.11.14.43.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Feb 2014 14:43:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2014 22:43:04 +0000
Message-Id: <1392158584-6952-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] initscripts: mask initscripts from systemd
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
X-List-Received-Date: Tue, 11 Feb 2014 22:43:11 -0000

Many of the init scripts in here will do nasty things if systemd decides to run
them.  Mask the obviously bad ones so that systemd won't attempt to invoke them
if initscripts is installed with systemd.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb |   25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index d1644a3..20c0257 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -41,6 +41,7 @@ KERNEL_VERSION = ""
 
 inherit update-alternatives
 DEPENDS_append = " update-rc.d-native"
+DEPENDS_append = " ${@base_contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
 
 PACKAGES =+ "${PN}-functions"
 RDEPENDS_${PN} = "${PN}-functions"
@@ -134,3 +135,27 @@ do_install () {
 	# populate-volatile.sh
 	update-rc.d -r ${D} dmesg.sh start 38 S .
 }
+
+MASKED_SCRIPTS = " \
+  banner \
+  bootmisc \
+  checkroot \
+  devpts \
+  hostname \
+  mountall \
+  mountnfs \
+  rmnologin \
+  sysfs \
+  urandom"
+
+pkg_postinst_${PN} () {
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		if [ -n "$D" ]; then
+			OPTS="--root=$D"
+		fi
+		for SERVICE in ${MASKED_SCRIPTS}; do
+			systemctl $OPTS mask $SERVICE.service
+		done
+	fi
+fi
+}
-- 
1.7.10.4


