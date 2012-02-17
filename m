Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyS1s-0002lp-KZ
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 18:55:32 +0100
Received: by yenr5 with SMTP id r5so1935171yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 09:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=G9sLC31pWWKfQSJVhdxzYVBOxXuSS+7HLVWhToCu4CU=;
	b=HVrpnzEffdve5nFVM5Tp/058PXEV3mwzsp8Y/xe3jJCyRaH84Qq7FU9tKcqivpks7a
	Cl/snJ9bk3Ll9VFokoeUwSZBgQyN19nc+cnv6RRPfucwNOg3pCx5ISVUObsPy4bb1To4
	99alOg/UN8Ob9STL0bqH1M3Rd0oDUsXA7J/PQ=
Received: by 10.236.178.72 with SMTP id e48mr10736333yhm.28.1329500837961;
	Fri, 17 Feb 2012 09:47:17 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id e45sm24123959yhk.2.2012.02.17.09.47.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 09:47:17 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2012 17:47:05 +0000
Message-Id: <a186127453b155d8f35a32fac48a56dad98aad7f.1329500798.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1329500798.git.otavio@ossystems.com.br>
References: <cover.1329500798.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1329500798.git.otavio@ossystems.com.br>
References: <cover.1329500798.git.otavio@ossystems.com.br>
Subject: [PATCH 3/3] rootfs_ipk.bbclass: fix unpacked postinst support if no package management
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
X-List-Received-Date: Fri, 17 Feb 2012 17:55:33 -0000

When building without package management we can end with a system
without opkg and thus without support for running unfinished postinsts
on first boot, we fix this providing a S98configure script for this
use case.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/rootfs_ipk.bbclass |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 2df8ca4..11ab8a1 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -96,6 +96,22 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 			# Also delete the status files
 			rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+		else
+			if [ ! -e ${IMAGE_ROOTFS}${bindir}/opkg-cl ]; then
+				# We need to run postinsts but lack opkg, do it byhand
+				cat > ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d/S98configure <<EOF
+#!/bin/sh
+
+for pkg in \`grep -B4 Status:.install.ok.unpacked ${opkglibdir}/status | awk '/^Package: / { print \$2 }'\`; do
+	${opkglibdir}/info/\$pkg.postinst configure
+done
+
+rm -rf ${opkglibdir}
+
+rm ${sysconfdir}/rcS.d/S98configure
+EOF
+				chmod a+x ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d/S98configure
+			fi
 		fi
 	fi
 	set +x
-- 
1.7.2.5



