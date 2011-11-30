Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVu1d-0004nQ-Hw
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:57:17 +0100
Received: by bkbzv15 with SMTP id zv15so899317bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qTOR0jZNJV2KAHBZTFf0gf5dOBzPdWuQ9SQ9P3EOoVo=;
	b=o/eHWSONx2ChcdWQcxZi/RPhdDo52RFhNQdyWczZPtQL+iywzpDtVOwJ6J5uqbqChn
	lvejr3HnccwDWwJlWMjOW+O8yzVzLwWHeeQUZnu8PklgIxKZlPePfdL/ENVKfM6hJ2Aq
	pVdwIvEctcN14SlwabmpycS9JLp2ZLl6tH/H0=
Received: by 10.204.154.1 with SMTP id m1mr4576331bkw.107.1322697036836;
	Wed, 30 Nov 2011 15:50:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id jf4sm7426725bkc.5.2011.11.30.15.50.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 15:50:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 00:50:25 +0100
Message-Id: <1322697025-22754-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <1322696033.17484.84.camel@ted>
References: <1322696033.17484.84.camel@ted>
Subject: [PATCH] sysstat: don't run populate-volatile.sh update in do_rootfs or without populate-volatile.sh
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
X-List-Received-Date: Wed, 30 Nov 2011 23:57:17 -0000

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



