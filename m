Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1RYK0r-0001wl-Hy
	for openembedded-core@openembedded.org; Wed, 07 Dec 2011 17:06:30 +0100
Received: by qcqw6 with SMTP id w6so460349qcq.6
	for <openembedded-core@openembedded.org>;
	Wed, 07 Dec 2011 07:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=1PnSx5HLQ/C0sj8BJQ95zuvaZvHqe16oSpbshwN7tN4=;
	b=hHisx+S/rIlY1+kwqlmxJQuz32zTo91vCZhdTZqoOYE5gIO4QBbaY1RnX4aB/s6DBm
	B/wNAPPpVdmMPdTTz7aCNminKmkiwHAtHgF/scg4Mf7MNCGBZNuESd7gUbQWDxfQncz9
	7xA0Y7nOTYNhxwfgDeI0qBrHZhwQzScSHOS2U=
Received: by 10.229.65.101 with SMTP id h37mr4330765qci.80.1323273580296;
	Wed, 07 Dec 2011 07:59:40 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-240-172-5.ronkva.east.verizon.net. [96.240.172.5])
	by mx.google.com with ESMTPS id h9sm4117054qac.13.2011.12.07.07.59.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 07:59:39 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@openembedded.org
Date: Wed,  7 Dec 2011 10:59:28 -0500
Message-Id: <1323273568-31152-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1323273568-31152-1-git-send-email-philip@balister.org>
References: <1323273568-31152-1-git-send-email-philip@balister.org>
Subject: [PATCH 2/2] qt4.inc : Add uic, moc, rcc, and lrelease to tools package.
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
X-List-Received-Date: Wed, 07 Dec 2011 16:06:30 -0000

These binaries are needed in the target tools package so we can build
qt apps on the target. You also need to install qmake from meta-oe.

Test by building gnuradio on the USRP e100 with qt support.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-qt/qt4/qt4.inc |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index bec81b4..2638249 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -138,8 +138,8 @@ RRECOMMENDS_${QT_BASE_NAME}-qmlviewer += " \
 RRECOMMENDS_${QT_BASE_NAME}-doc += " \
             ${QT_BASE_NAME}-demos-doc"
 
-FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay ${bindir}/qdoc*"
-FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc*"
+FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay ${bindir}/qdoc* ${bindir}/moc ${bindir}/uic* ${bindir}/rcc"
+FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc* ${bindir}/.debug/uic* ${bindir}/.debug/moc ${bindir}/.debug/rcc"
 FILES_${QT_BASE_NAME}-assistant            = "${bindir}/*assistant* ${bindir}/qcollectiongenerator ${bindir}/qhelpconverter ${bindir}/qhelpgenerator"
 FILES_${QT_BASE_NAME}-assistant-dbg        = "${bindir}/.debug/*assistant* ${bindir}/.debug/qcollectiongenerator ${bindir}/.debug/qhelpconverter ${bindir}/.debug/qhelpgenerator"
 FILES_${QT_BASE_NAME}-common               = "${bindir}/qtconfig"
@@ -287,11 +287,6 @@ do_install() {
 
 	# These are host binaries, we should only use them in staging
 	rm ${D}/${bindir}/qmake
-	rm -f ${D}/${bindir}/uic
-	rm -f ${D}/${bindir}/uic3
-	rm ${D}/${bindir}/moc
-	rm ${D}/${bindir}/rcc
-	rm -f ${D}/${bindir}/lrelease
 
 	# fix pkgconfig, libtool and prl files
 	sed -i -e 's#-L${S}/lib/\?##g' \
-- 
1.7.3.4



