Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SsIso-0006W1-My
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 21:29:02 +0200
Received: by yenl13 with SMTP id l13so4038292yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 12:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Iz5urPSTuTd/EiwQUAjLFi4wAMcrL8Izz6E9XH5vxZI=;
	b=H573l3CHPv6YujI8jLJ5rnMq1TsehvlhdNdwfqCEsRdZeaz//r3BAgY3oucdJSAcbz
	arncp+AbVThStZGCPH1tYDUs53o1UPlvb2oHFtPuz9LcT84Q6SADEVD4iFZyXcoN6S2H
	rxCHkkwbR253ourTSLntGZ+GMyMQWxjNGlB2fCMZGmRBig5cwJBSuQAbk3SmKUMcZq2e
	sCMVfNeHqA0d4xPbcEZfYgZecIvZ8L3focqu/J6hbNVvKIV8o94DuSZwwRm1tl3yvdgD
	XXitCPwsrC7GHbytekuxUDKMDjnhVdRrnoZgAbZVBOC05VSHLD8+L0DRskxuqBMElxMT
	liYQ==
Received: by 10.101.136.7 with SMTP id o7mr1964345ann.58.1342811858492;
	Fri, 20 Jul 2012 12:17:38 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id b8sm5763262anm.4.2012.07.20.12.17.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 12:17:37 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 16:17:28 -0300
Message-Id: <1342811849-11556-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH v2 1/2] shadow-native: use 'users' group by default
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
X-List-Received-Date: Fri, 20 Jul 2012 19:29:02 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../shadow/shadow-native_4.1.4.3.bb                |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
index 1e071f1..cd5605f 100644
--- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow.automake-1.11.patch \
@@ -46,4 +46,7 @@ do_install_append() {
 	# Now we don't have a mail system. Disable mail creation for now.
 	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
 	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
+
+	# Use users group by default
+	sed -i 's,^GROUP=1000,GROUP=100,g' ${D}${sysconfdir}/default/useradd
 }
-- 
1.7.2.5



