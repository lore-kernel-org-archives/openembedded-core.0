Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVtC0-00031I-8i
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:03:56 +0100
Received: by mail-bw0-f47.google.com with SMTP id zv15so839230bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=TIkVUIULpTJlVhteRU0XZGKCqMMmOCikVlAyJDmfKA4=;
	b=CYl/JLUif1ydJF9YUwBimbyZWDMvWLF00xdF67IY73H8623G2jaE5WIQ+pnZ/UqsNd
	DLxRVGM9NZaeBiG9pG8RQatIFoFjFJTxtxzbE/A/MRLl7sgJGvOU0xLKW78V708A+Y/z
	mlDOiSQszoVSQyVfLQw0ipc32SwkLTrxA6azo=
Received: by 10.205.127.139 with SMTP id ha11mr4524016bkc.111.1322693837250;
	Wed, 30 Nov 2011 14:57:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fa8sm7122137bkc.14.2011.11.30.14.57.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 14:57:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 23:56:59 +0100
Message-Id: <6d1a17a6a97b72caa8790538af19ba2c942c91ff.1322693708.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1322693708.git.Martin.Jansa@gmail.com>
References: <cover.1322693708.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 1/3] sysstat: don't run populate-volatile.sh update in do_rootfs or without populate-volatile.sh
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
X-List-Received-Date: Wed, 30 Nov 2011 23:03:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/sysstat/sysstat.inc       |    6 +++++-
 meta/recipes-extended/sysstat/sysstat_10.0.2.bb |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 2936f96..5e0f7af 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -22,7 +22,11 @@ do_install() {
 }
 
 pkg_postinst_${PN} () {
-        /etc/init.d/populate-volatile.sh update
+        if [ "x$D" != "x" ]; then
+                if [ -e /etc/init.d/populate-volatile.sh ]; then
+                        /etc/init.d/populate-volatile.sh update
+                fi
+        fi
 }
 
 
diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.2.bb b/meta/recipes-extended/sysstat/sysstat_10.0.2.bb
index bd559d8..7b57bc8 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.0.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.2.bb
@@ -2,7 +2,7 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r0"
+PR = "r1"
 
 
 
-- 
1.7.8.rc4



