Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RuW6n-0004z5-Vx
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 22:28:22 +0100
Received: by yhfq46 with SMTP id q46so2607910yhf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 13:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=DTWUVyIRPQrx+R2rjEPv4p8tHQNK+B6jeXwXlSkTvUY=;
	b=plpfgjrOha7UVVk8PIW6Y6E6Kms3AjtKCTTCwBlpazxR6Ki8sV6yBNE7gl6QFy6Hq7
	MukIiBWpIdkRQHnVJ48Jo+9utvwTBHCec8DTXgC8/wNWeB+VJ5+wcV6dPMbdeC8NBd4c
	pIfaLyUgtCAisyl3BEbCVRLmFiM9ScWtRwJUQ=
Received: by 10.236.187.3 with SMTP id x3mr23826890yhm.50.1328563220348;
	Mon, 06 Feb 2012 13:20:20 -0800 (PST)
Received: from localhost.localdomain (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id u11sm37999299anc.12.2012.02.06.13.20.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 13:20:19 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 15:20:12 -0600
Message-Id: <3152866b7b0cdcda251f2b73c78016ace0118150.1328563142.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1328563142.git.chris_larson@mentor.com>
References: <cover.1328563142.git.chris_larson@mentor.com>
In-Reply-To: <cover.1328563142.git.chris_larson@mentor.com>
References: <cover.1328563142.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/4] external-csl-toolchain: correct binary packaging
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
X-List-Received-Date: Mon, 06 Feb 2012 21:28:22 -0000

From: Christopher Larson <chris_larson@mentor.com>

CS puts optimized executables in usr/lib/bin, not usr/bin.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index e81559a..5b4134e 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -58,7 +58,12 @@ do_install() {
 
 	rm ${D}${sysconfdir}/rpc
 	rm -r ${D}${datadir}/zoneinfo
-	rm -r ${D}${libdir}/bin
+
+	mv ${D}${libdir}/bin/* ${D}${bindir}/
+	if [ -e ${D}${libdir}/bin/.debug ]; then
+		install -d ${D}${bindir}/.debug
+		mv ${D}${libdir}/bin/.debug/* ${D}${bindir}/.debug/
+	fi
 
 	sed -i -e 's/__packed/__attribute__ ((packed))/' ${D}${includedir}/mtd/ubi-user.h
 	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
-- 
1.7.7



