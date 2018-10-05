Return-Path: <tom.rini@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id F03687459B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 19:30:50 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id p6-v6so8679777qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2018 12:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RKEpiWPkMa6lCGEaKdya/Ap90atQfvuKgLj1FLMNQv8=;
	b=h28U9F0WaSqgPIvDG1ggtfOXzUA/O8WG4OQwRBpOeI5caTiR9IV306JUJKY1NyTjG8
	d2SIokw0LCqoAJqnpm+J2oLv7cXB4bnScuCDeeyQOkzBl6DHlIKNUJLEebZzCyIJMnoZ
	vNOFeN1mjMOzzzME5n6oZ2Dz4zYFsC83Rlwe7chfQxEhyXTUbgqI76Xyp/7gWZqXxwMt
	Yv2Xvpxfnr2JaIaTRuc6jAFSClr7HOfYcocytQfbz/OYjkrJySLc6OBDsYlIp+zcSBr7
	jCVSuWiI9LVjvJyCKheplxXIBAuesm1qS9tXBPXp7rriFdC2LvjpJyJILurQ80VngGTB
	c6WA==
X-Gm-Message-State: ABuFfogZlkSySqz4+HRiQ4jwF257ok9TfdPRkjAGHLSezJkRPFKLWdZY
	ceySG/xcFPmatNwowmUdQBqMNFo=
X-Google-Smtp-Source: ACcGV63kYajRKmFeI1mVp+9yxsJKHp9JpDOoKZvtX33GPDGgmxfUvQM6LC+8XqeuCX6/E1AcSkQGbQ==
X-Received: by 2002:a37:8245:: with SMTP id
	e66-v6mr10487359qkd.335.1538767851467; 
	Fri, 05 Oct 2018 12:30:51 -0700 (PDT)
Received: from bill-the-cat.ec.rr.com (cpe-65-184-133-47.ec.res.rr.com.
	[65.184.133.47]) by smtp.gmail.com with ESMTPSA id
	t38-v6sm4842342qte.97.2018.10.05.12.30.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Oct 2018 12:30:50 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 15:30:41 -0400
Message-Id: <1538767841-6449-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] rootfs_*: Also depend on do_package_qa
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
X-List-Received-Date: Fri, 05 Oct 2018 19:30:51 -0000

Make sure that we don't create images that have QA problems with their
package files by adding do_package_qa to do_rootfs[recrdeptask].

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/classes/rootfs_deb.bbclass | 2 +-
 meta/classes/rootfs_ipk.bbclass | 2 +-
 meta/classes/rootfs_rpm.bbclass | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 9ee1dfc8668b..2b93796a7643 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -6,7 +6,7 @@ ROOTFS_PKGMANAGE = "dpkg apt"
 
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
-do_rootfs[recrdeptask] += "do_package_write_deb"
+do_rootfs[recrdeptask] += "do_package_write_deb do_package_qa"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 52b468d85bcb..aabc370cfce9 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -10,7 +10,7 @@ ROOTFS_PKGMANAGE = "opkg ${EXTRAOPKGCONFIG}"
 
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
-do_rootfs[recrdeptask] += "do_package_write_ipk"
+do_rootfs[recrdeptask] += "do_package_write_ipk do_package_qa"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 7f305f51ca2a..51f89ea99023 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -23,7 +23,7 @@ RPMROOTFSDEPENDS = "rpm-native:do_populate_sysroot \
 do_rootfs[depends] += "${RPMROOTFSDEPENDS}"
 do_populate_sdk[depends] += "${RPMROOTFSDEPENDS}"
 
-do_rootfs[recrdeptask] += "do_package_write_rpm"
+do_rootfs[recrdeptask] += "do_package_write_rpm do_package_qa"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 python () {
-- 
2.7.4


