Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id B89C87067B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 22:40:30 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 20so922165yks.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 15:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=OKeR9FCNsJykJgrq4eOKjYwzy+k+xC1XjGcgQLZ5UnE=;
	b=sdXN3gQGCdqyHWmYxIlTC0zf4gAJkmsPf/SIppVQiU60KP0Las6SW/cQq3VpjeT4Np
	8A+aEKgPN4cMQWfWe0/1nRD8kmFUnaARBjPYKOY/AMcPRCCEo2BxWhIOJMjO8TNk0Ygi
	JvQShBQ/Q1S2KneULqzQ7nJ/25Gkg3ioazQJCz6ijsblV8vKldzFlRTwD5c3D3eA8lbZ
	IodlYGlt2i2NQGGVR4Cfb0ziX8/ELpZGx5bEd4sG9t/446En/1S1Eyp7Ixflu38myiqX
	46QCh0dt8keOCjR8Dx4bg86M8EVFxCuMrJgf2Y/YhRLh8Do85my6ApmQze5jC/JA9k9a
	yPNg==
X-Received: by 10.236.136.168 with SMTP id w28mr9154253yhi.132.1409265631958; 
	Thu, 28 Aug 2014 15:40:31 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id e35sm2379639yho.35.2014.08.28.15.40.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 15:40:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Aug 2014 19:40:05 -0300
Message-Id: <1409265606-16818-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] libpam: Fix runtime providers
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
X-List-Received-Date: Thu, 28 Aug 2014 22:40:39 -0000

The runtime providers were commented out. Removing the comment brings
up a issue with the native renaming which has been workarounded
disabling the runtime recommendation. This is indeed a workaround so a
FIXME comment has been added to remind about it in case we someday
move to native prefix.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index c06709f..0bf416b 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -74,7 +74,10 @@ RPROVIDES_${PN}-runtime += "${PN}-runtime-${libpam_suffix}"
 
 RDEPENDS_${PN}-runtime = "${PN}-${libpam_suffix} pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix}"
 RDEPENDS_${PN}-xtests = "${PN}-${libpam_suffix} pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} coreutils"
-#RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
+
+# FIXME: Native suffix breaks here, disable it for now
+RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
+RRECOMMENDS_${PN}_class-native = ""
 
 python populate_packages_prepend () {
     def pam_plugin_append_file(pn, dir, file):
-- 
1.7.10.4


