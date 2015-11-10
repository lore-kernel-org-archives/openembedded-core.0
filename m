Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id CB4F877168
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 09:05:46 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so147404539wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 01:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cghg2CmooGsYjH9WbIOEPDCqX5tv3OmTOd01wjFUXA4=;
	b=zM5/W26u63HfWAEKnwLW8d1mW+z6fe0N5eUW6eB25+Qt/EUwW8rOQHKWQPThTWOU6K
	l125VW2XkS8tTHNVKZaZ5RShRXOOuSVUK9IQWLTGjv9JOhbkzG6DFBJdJieBTgnfAAUf
	3ke4QK/yxG5xNxDwx7IUCDYK7nxPyUfUXfni0vOv/anSNIs3n61b7aSTsykNqIraGXHW
	AmsOkhMEWS8kdzHK+lbepXyTDiwEuwD+wW8i4HMk346VOIk4/5mLACVifvgT+2p32UUC
	NW1niYBar6PEm4dCPEs6R+mYLe9qwAmD2L6iRxs+XQudiXJ7T1LGlI0HDLckgp/1jKUG
	lP2Q==
X-Received: by 10.28.128.210 with SMTP id b201mr3139652wmd.69.1447146346165;
	Tue, 10 Nov 2015 01:05:46 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id q1sm2334615wjy.31.2015.11.10.01.05.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 01:05:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Nov 2015 10:05:49 +0100
Message-Id: <1447146349-29607-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1447145891-13916-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447145891-13916-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] rootfs_*.bbclass: don't add BUILDNAME to do_rootfs vardepsexclude
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
X-List-Received-Date: Tue, 10 Nov 2015 09:05:47 -0000

* rootfs_*.bbclass doesn't use this variable anymore, so we can drop it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rootfs_deb.bbclass | 1 -
 meta/classes/rootfs_ipk.bbclass | 1 -
 meta/classes/rootfs_rpm.bbclass | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index d51b458..f79fca6 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -8,7 +8,6 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb"
-rootfs_deb_do_rootfs[vardepsexclude] += "BUILDNAME"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index dd144e4..d417800 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -13,7 +13,6 @@ do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_popu
 do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_ipk"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
-rootfs_ipk_do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index d85d001..b4cd55b 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -22,7 +22,6 @@ do_rootfs[depends] += "${RPMROOTFSDEPENDS}"
 do_populate_sdk[depends] += "${RPMROOTFSDEPENDS}"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm"
-rootfs_rpm_do_rootfs[vardepsexclude] += "BUILDNAME"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 # RPM doesn't work with multiple rootfs generation at once due to collisions in the use of files 
-- 
2.6.2


