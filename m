Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S62hl-0002wk-UO
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 17:30:10 +0100
Received: by yenm3 with SMTP id m3so910034yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2012 08:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=49g9B6qf9sUC736Abr6PvucprnaJ9+6sZYvqeLCm/KI=;
	b=F7M41ha8IxEVR9YfbWBMi7HP7xZP/6hi4bmO6waNu1ISK3pfOwgvc/kxxrTcO/q+Fz
	5cdl7MCY1JpYji5N7/cDFLH35ZaDD/e2/QRH78Mdjnmqn073rF6pK3R/DZ3Gmq/78c+w
	93V/m9t+1wzaKSgTDymZU35phDkZDdq9K+W1DAqqHaBEXWnIipS5W8FAqH1JZegxG0OA
	cNqKkPQC15XcaFMkmhBKY0nzvicgoybe2mmuFQzDTbBBDCG622d1bIbdCENJg1w0Efv/
	wxsqWi1sVLeQkEn6NvtkYRAiGMcjgN7uAuGIo24HYw5pwFiIixm9GBbb1VJJxqLyLTz/
	mY3A==
Received: by 10.101.151.34 with SMTP id d34mr947284ano.19.1331310089825;
	Fri, 09 Mar 2012 08:21:29 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o41sm15000143yhj.7.2012.03.09.08.21.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 08:21:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2012 16:21:14 +0000
Message-Id: <aa48a55556ed5ae5aeb9e49575ea1647778d1008.1331310044.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331310044.git.otavio@ossystems.com.br>
References: <cover.1331310044.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331310044.git.otavio@ossystems.com.br>
References: <cover.1331310044.git.otavio@ossystems.com.br>
Subject: [PATCH 3/6] rootfs_rpm.bbclass: rename postinst trigger script
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
X-List-Received-Date: Fri, 09 Mar 2012 16:30:10 -0000

Use 'run-postinsts' as trigger script name as it describes better the
intent of it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/rootfs_rpm.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 48133f0..9039b21 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -112,7 +112,7 @@ EOF
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
 	# Stop $i getting expanded below...
 	i=\$i
-	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure << EOF
+	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
 #!/bin/sh
 for i in /etc/rpm-postinsts/*; do
 	echo "Running postinst $i..."
@@ -122,9 +122,9 @@ for i in /etc/rpm-postinsts/*; do
 		echo "ERROR: postinst $i failed."
 	fi
 done
-rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
+rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 EOF
-	chmod 0755 ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
+	chmod 0755 ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
-- 
1.7.2.5



