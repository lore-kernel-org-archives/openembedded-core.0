Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW5Rg-0003pp-HJ
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:08:56 +0100
Received: by mail-ey0-f175.google.com with SMTP id d13so2082708eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 04:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qTOR0jZNJV2KAHBZTFf0gf5dOBzPdWuQ9SQ9P3EOoVo=;
	b=BeTcIrhp+10Xwyl9+P84HKW15LRkZkMCWF4weuST26vlWYzyB9BbiLzKErK7oWilTV
	appoFUI0TP0+4hz6aWOOhEaDC7Dma49Bmau3HNeEkHK7cl2xUXojhVIMddUiA5LHIXg2
	PfK1XOQH5dnP2J7fxhsho5RyliZZ2gILJeE9w=
Received: by 10.14.19.133 with SMTP id n5mr864798een.130.1322740937527;
	Thu, 01 Dec 2011 04:02:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 8sm16894227ees.2.2011.12.01.04.02.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 04:02:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 13:02:06 +0100
Message-Id: <9f1d39eb3edbde086f99f084c2e88d5e9fc21332.1322740824.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1322740824.git.Martin.Jansa@gmail.com>
References: <cover.1322740824.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 1/4] sysstat: don't run populate-volatile.sh update in do_rootfs or without populate-volatile.sh
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
X-List-Received-Date: Thu, 01 Dec 2011 12:08:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/sysstat/sysstat.inc       |    7 ++++++-
 meta/recipes-extended/sysstat/sysstat_10.0.2.bb |    2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 2936f96..ca40ab5 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -22,7 +22,12 @@ do_install() {
 }
 
 pkg_postinst_${PN} () {
-        /etc/init.d/populate-volatile.sh update
+        if [ -n "$D" ]; then
+                exit 1
+        fi
+        if [ -e /etc/init.d/populate-volatile.sh ]; then
+                /etc/init.d/populate-volatile.sh update
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



