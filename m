Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id F0D9760110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:58:15 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so151507568wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=VXl8DckSEAEPX/I5DPqnqOp5mh2BFmCXtrNtbIUCHu8=;
	b=sCU7lRsYKioYiytVGhuRNBRSncWjUWhsWYTy4MQZYa/mhML33y179wl3efHx0cUx5j
	9OyMiNGsbUA0TVUTCgaUChEDo5tccg9B/KFZIJqwhb4D6nz8Mt6djnSPqA6mttk+aUMA
	9b03EqVKt44+VfGreb3rwU/eTKGoYtFT9SSFZYx6PGTE8nElc8wFwMaeL6M2vEu4Zf51
	cGkifKrq1SuSzWTpGJuYYCQNnlgG59mKAua688hDbyL8ttp4EEpDdJmwxVJdy10Ei7jg
	yVHeVTk9pjEl+TIc/x/yuiDRQo/GCyrG8xDW1u6twJx86pw2IedDX+25+DXc0ldnGfYf
	8N6Q==
X-Received: by 10.194.11.67 with SMTP id o3mr43151346wjb.3.1447761496123;
	Tue, 17 Nov 2015 03:58:16 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q141sm23611030wmg.3.2015.11.17.03.58.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:58:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:58:06 +0100
Message-Id: <cde84a7f8d8c2bf49b72aae8e61b31fa8e5a5273.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 14/16] rootfs_*.bbclass: don't add BUILDNAME to do_rootfs vardepsexclude
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:16 -0000

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
2.6.3


