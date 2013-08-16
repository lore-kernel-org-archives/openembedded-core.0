Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE6F66B2CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 20:07:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7GK7U4F003070
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 13:07:30 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 16 Aug 2013 13:07:30 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 13:07:28 -0700
Message-ID: <1376683648-21673-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1376683648-21673-1-git-send-email-jslater@windriver.com>
References: <1376683648-21673-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [v3][PATCH 2/2] coreutils: allow for acl support
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
X-List-Received-Date: Fri, 16 Aug 2013 20:07:31 -0000
Content-Type: text/plain

CQID: 430353

Define PACKAGECONFIG info for acl assuming it
might be a DISTRO_FEATURE.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.21.bb |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.21.bb b/meta/recipes-core/coreutils/coreutils_8.21.bb
index 26ada48..35c9100 100644
--- a/meta/recipes-core/coreutils/coreutils_8.21.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.21.bb
@@ -22,8 +22,16 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
 SRC_URI[md5sum] = "065ba41828644eca5dd8163446de5d64"
 SRC_URI[sha256sum] = "adaa44bdab3fa5eb352e80d8a31fdbf957b78653d0c2cd30d63e161444288e18"
 
-EXTRA_OECONF = "--disable-acl"
-EXTRA_OECONF_class-native = "--disable-acl --without-gmp"
+EXTRA_OECONF_class-native = "--without-gmp"
+
+# acl is not a default feature
+#
+PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+PACKAGECONFIG_class-native ??= ""
+
+# with, without, depends, rdepends
+#
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 
 # [ df mktemp base64 gets a special treatment and is not included in this
 bindir_progs = "basename chcon cksum comm csplit cut dir dircolors dirname du \
-- 
1.7.3.4


