Return-Path: <net147@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 322A86F190
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 00:12:10 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id x10so3124686pdj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 16:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Qm5bF8dOTuitGnWD45w5ypMR+FcTRhS1dIBE/ZJ1cho=;
	b=oeOKrh31Ud3jbV79PR23OvNPast+FpCzMVKUeibW1XgZclV7gjYh5KCCNmsBzZeZLV
	vSrHiEozcRAcBguaezY44AMkUl55aoVTgPiido0peIjlbxYcYNM34uSjjVhXlmIubfDt
	FjhvsGKWMVQgxgPH2cUxHlawAbIIH3rI89FdnmhEeSrmd1arK0XMw4DHemKgO9CMBEr9
	/gS3HPk0SlKTJoGAU7xwSBM+JrzBFvO7WI3C40dSTiBeMtrp1Go6duy+UKkoNiJAZ2qD
	Zxna3KmFeFiWiHbLQXZGy3thuQoMfdRPBVGQksuDoT1A8GeaXlTkwEytadw+7vqyr/KZ
	AVaA==
X-Received: by 10.66.182.199 with SMTP id eg7mr18136104pac.135.1393546332057; 
	Thu, 27 Feb 2014 16:12:12 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	yh4sm17576495pbb.19.2014.02.27.16.12.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 16:12:11 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 11:15:27 +1100
Message-Id: <1393546527-8758-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] consolekit: fix console-kit-log-system-start.service startup
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
X-List-Received-Date: Fri, 28 Feb 2014 00:12:11 -0000

console-kit-log-system-start.service fails to to start if the
/var/log/ConsoleKit directory does not exist. Normally it is created
automatically but as we mount a tmpfs at /var/log, we need to add
a tmpfiles.d entry to create it.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.6.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 2df97c5..c97b449 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -37,6 +37,12 @@ FILES_pam-plugin-ck-connector += "${base_libdir}/security/*.so"
 RDEPENDS_pam-plugin-ck-connector += "${PN}"
 
 do_install_append() {
+	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d ${localstatedir}/log/ConsoleKit - - - -" \
+			> ${D}${sysconfdir}/tmpfiles.d/consolekit.conf
+	fi
+
 	# Remove /var/run from package as console-kit-daemon will populate it on startup
 	rm -fr "${D}${localstatedir}/run"
 }
-- 
1.9.0


