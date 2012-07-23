Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1StMkY-0003yu-2b
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 19:48:54 +0200
Received: by ghbz2 with SMTP id z2so5301708ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=wvlTuThbwezv3O2RKqBUmqL0Atc4BpU0pOKi85dxCKA=;
	b=OQJQhWD0F8ynrfvtJo6o1MrcdlVxmXP/ulWLp7sB4/YymA0Bdj4JRZbEzV6CtTJwL3
	mYyrBxtIim3HcZBPJRMuJP1vUjKvj3uc6lE7zP7D7N/Ppna/2HxM/sKfa3kgizt0oH4S
	7NX4qkVM9TKm+MHSSAruS+o4y9qVsJ0uZzBoEQfLHzZoM0z3pmFkk3rwAHtDaDRC0sbo
	PYOTBAPRInQD7SDplf2Jhpihh2zMMvwlWvgQy+5SV+KruZ0FhcCZulWKnIAROWbt+15O
	y6ZQ7kY1UxcgMLvC27VCnX1odgJpkiRgDRQjDpdamBEYd909mt2dMu7CbVf9/UzWst+U
	UP1w==
Received: by 10.236.170.135 with SMTP id p7mr15775576yhl.109.1343065046411;
	Mon, 23 Jul 2012 10:37:26 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id r9sm9104936anj.9.2012.07.23.10.37.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 10:37:25 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2012 14:37:16 -0300
Message-Id: <1343065037-13851-1-git-send-email-otavio@ossystems.com.br>
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
X-List-Received-Date: Mon, 23 Jul 2012 17:48:54 -0000

The rootfs has 'users' group at number 100 and without this fix it
would assign to a non-existent group and if a group with gid as 1000
is created later it would own all files for users created.

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



