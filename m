Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB056AD8C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 14:35:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5OEZedS000389
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 07:35:40 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 24 Jun 2013 07:35:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 09:45:49 -0500
Message-ID: <1372085149-30510-4-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1372085149-30510-1-git-send-email-mark.hatle@windriver.com>
References: <1372085149-30510-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/3] buildtools-tarball: Add nativesdk-make
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
X-List-Received-Date: Mon, 24 Jun 2013 14:35:40 -0000
Content-Type: text/plain

Recently it was discovered that many Fedora hosts have a broken version of
make 3.82.  Add make to the buildtools-tarball, as well ad modify make to
support building a special nativesdk version.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 3 ++-
 meta/recipes-devtools/make/make_3.82.bb      | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 7a91c6b..f8024f9 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "SDK type target for building a standalone tarball containing python, chrpath, git and tar. The \
+DESCRIPTION = "SDK type target for building a standalone tarball containing python, chrpath, make, git and tar. The \
                tarball can be used to run bitbake builds on systems which don't meet the usual version requirements."
 SUMMARY = "Standalone tarball for running builds on systems with inadequate software"
 LICENSE = "MIT"
@@ -36,6 +36,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-chrpath \
     nativesdk-tar \
     nativesdk-git \
+    nativesdk-make \
     "
 
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
diff --git a/meta/recipes-devtools/make/make_3.82.bb b/meta/recipes-devtools/make/make_3.82.bb
index 8a2f287..6cc467d 100644
--- a/meta/recipes-devtools/make/make_3.82.bb
+++ b/meta/recipes-devtools/make/make_3.82.bb
@@ -13,4 +13,4 @@ SRC_URI += "file://expand_MAKEFLAGS.patch \
 SRC_URI[md5sum] = "1a11100f3c63fcf5753818e59d63088f"
 SRC_URI[sha256sum] = "e2c1a73f179c40c71e2fe8abf8a8a0688b8499538512984da4a76958d0402966"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.1


