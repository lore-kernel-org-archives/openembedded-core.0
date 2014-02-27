Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9845860DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 20:20:48 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gf5so2022323lab.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 12:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=adwY67AplqNFnhELmObCvKLkJx7QAPa717YfhE71fcE=;
	b=ddWeT3lb4ta2ZtEMho5xWU1LuYQg3gZUiC8PtAlwgELj4iasH5UpUJbFAHsia+tfAf
	CLhR06eSeZ5/634GBEMX5FMP9xEmgF0rhhPRLplr45Zrk96R77eG57P5pg+WduzEGBMa
	xFR9MDPHLwJ3Spl6u7qRu4uf5Crg0pbUbYJRCwlh8Ux8sR8yufOOoRiu+nCw3aOVhtSQ
	sId0sULJXjeMFnAYx52GuYYjIEHOv1Ab/BfXjatu27T5OfFbvJEsfupmMNtpakXVJ/vF
	ktnTP03i+RqfjElC6Oxw0okbcO7TdfpkMhUUpUpMk2tMtB3l7pUJyn13aexEPMoSlM85
	5nAg==
X-Received: by 10.112.125.225 with SMTP id mt1mr7544238lbb.35.1393532448877;
	Thu, 27 Feb 2014 12:20:48 -0800 (PST)
Received: from localhost (c-5eeaaa2a-74736162.cust.telenor.se. [94.234.170.42])
	by mx.google.com with ESMTPSA id e1sm9376454laa.8.2014.02.27.12.20.47
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 12:20:48 -0800 (PST)
Received: by localhost (Postfix, from userid 1000)
	id E2DBAB4001A; Thu, 27 Feb 2014 21:20:44 +0100 (CET)
From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 21:20:38 +0100
Message-Id: <1393532438-6852-2-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>
References: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] do_rootfs: Add PACKAGE_FEED_URIS as a vardep
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
X-List-Received-Date: Thu, 27 Feb 2014 20:20:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A bit uncertain on where to put this, suggestions welcome.
Needed to automatically rebuild do_rootfs when PACKAGE_FEED_URIS
change.

Signed-off-by: David Nyström <david.c.nystrom@gmail.com>
Signed-off-by: David Nyström <david.nystrom@enea.com>

---
 meta/classes/rootfs_deb.bbclass | 1 +
 meta/classes/rootfs_ipk.bbclass | 1 +
 meta/classes/rootfs_rpm.bbclass | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 728ea0e..a42a472 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -8,6 +8,7 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb"
 rootfs_deb_do_rootfs[vardepsexclude] += "BUILDNAME"
+do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 1887dd3..f5fef00 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -11,6 +11,7 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_ipk"
+do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 rootfs_ipk_do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 032dabc..4b02247 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -23,6 +23,7 @@ do_rootfs[depends] += "createrepo-native:do_populate_sysroot"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm"
 rootfs_rpm_do_rootfs[vardepsexclude] += "BUILDNAME"
+do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 # RPM doesn't work with multiple rootfs generation at once due to collisions in the use of files 
 # in ${DEPLOY_DIR_RPM}. This can be removed if package_update_index_rpm can be called concurrently
-- 
1.8.3.2


