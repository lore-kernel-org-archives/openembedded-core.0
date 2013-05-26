Return-Path: <net147@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5C163621E6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 10:59:47 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so5781147pbb.41
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=xgekS/1IuAcnugg3sWbqJ172j4raAD7oyn5YGcC0pmA=;
	b=pm8dUkruTsObOFIw628Jn2/sujiB+yzUSNsMq7XT22MCtPw3mjDhrPgqUpSqXt8cIg
	ryTCHrJVqkqriOGjYeO08C9nLlXVD6fkXjCMuYkp5UAC0pRhJRrhE6m8JkpUVYX7FqP+
	HvoQexEyv/8i0XnhK+YygMCj7LrL/mqWpYik9y3gMu/TVl8kEbtG6DRb2MQPz2am726E
	V5zjpizGVZQOxk8ls1JXaS2445ocNdwitGTPHr3FCQGYxunK930SxpET2pcAzW5akCAs
	gneu9gGT9cIsmIke0ItdiT480MPPnQKi2gK/pWbItY5hTHHCdyS67DUHe/0RwEksTHOR
	E1YQ==
X-Received: by 10.66.230.164 with SMTP id sz4mr25348383pac.124.1369565988719; 
	Sun, 26 May 2013 03:59:48 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	nt2sm24047692pbc.17.2013.05.26.03.59.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 03:59:47 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 21:13:06 +1000
Message-Id: <1369566786-20341-7-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1369566786-20341-1-git-send-email-net147@gmail.com>
References: <1369566786-20341-1-git-send-email-net147@gmail.com>
Subject: [PATCH 6/6] udev: do not create symbolic link from /run to /var/run
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 May 2013 10:59:47 -0000

The /run directory is now a tmpfs with /var/run as a symbolic link
pointing to /run.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/udev/udev.inc       | 6 +-----
 meta/recipes-core/udev/udev/volatiles | 1 -
 2 files changed, 1 insertion(+), 6 deletions(-)
 delete mode 100644 meta/recipes-core/udev/udev/volatiles

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 769d861..92485f5 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -26,8 +26,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://local.rules \
            file://udev-cache \
            file://udev-cache.default \
-           file://init \
-           file://volatiles"
+           file://init"
 
 inherit autotools pkgconfig update-rc.d
 
@@ -85,9 +84,6 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/default
 	install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
 
-	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/00_udev
-
 	touch ${D}${sysconfdir}/udev/cache.data
 
 	install -d ${D}${sysconfdir}/udev/rules.d/
diff --git a/meta/recipes-core/udev/udev/volatiles b/meta/recipes-core/udev/udev/volatiles
deleted file mode 100644
index e33561b..0000000
--- a/meta/recipes-core/udev/udev/volatiles
+++ /dev/null
@@ -1 +0,0 @@
-l root root 0755 /run /var/run
-- 
1.8.2.3


