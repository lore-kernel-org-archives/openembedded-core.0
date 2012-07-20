Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SsHtH-0005T3-N7
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 20:25:27 +0200
Received: by ghbz2 with SMTP id z2so3976693ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 11:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=xupSRQNwF68V5l86Yvxl8p135ygthtHDXc8WWKFbMgo=;
	b=hnKtQXewH21Z+EUp/Fg/hFf3JUDeGWVMRVLbtJXMl+ggAR/zSFfJAAACwgQBAGjmJY
	ryW62lnsopE16ZVSXXEozW/sFO7mr+toQjJS+3UgxYOwfW15JHewNYvnGFBoFxtwlLt1
	5w/fcduDLT9+lEDeRk2GXieXe4VWY9gozqRUx9zRHUsdh8YxAoXHocr1zSGsmb5oMnw/
	ZTbCT/EK7E8QXnMhdMJxtzN/hVVy1CQVEZ9dq0EeMnq61q62Ew5+wxRG7veDS8E8Yarh
	EIFBCowld6f9VvD7yAGgSaWyfI1nmFAEGBJukLXhKqt7SPF7pULgSPCnNd4EElRqEvxx
	8yOw==
Received: by 10.236.170.36 with SMTP id o24mr6510220yhl.40.1342808043848;
	Fri, 20 Jul 2012 11:14:03 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id s1sm5609408anl.8.2012.07.20.11.14.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 11:14:02 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 15:13:50 -0300
Message-Id: <1342808031-21564-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 1/2] shadow-native: use 'users' group by default
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
X-List-Received-Date: Fri, 20 Jul 2012 18:25:27 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../shadow/shadow-native_4.1.4.3.bb                |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
index 1e071f1..8115328 100644
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
+	sed -i sed 's,^GROUP=1000,GROUP=100,g' ${D}${sysconfdir}/default/useradd
 }
-- 
1.7.2.5



