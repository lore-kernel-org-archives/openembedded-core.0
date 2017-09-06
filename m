Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B8E3877CEC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:32:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JWuOe022828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Sep 2017 12:32:56 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:32:56 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:26:54 -0500
Message-ID: <1504726014-12929-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504726014-12929-1-git-send-email-mark.hatle@windriver.com>
References: <1504726014-12929-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] iproute2: Default to tipc enabled, and include libmnl dependency
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
X-List-Received-Date: Wed, 06 Sep 2017 19:32:56 -0000
Content-Type: text/plain

iproute2 has the ability to include a tipc tool.  When enabled this requires
the libmnl package (formerly supplied by meta-openembedded).  So both are
needed at the same time.

The change itself is needed because of the tipc-utils package (in
meta-openembedded) which RDEPENDS on iproute2-tipc.  Without this package
the yocto-compat-layer script indicates there is no way for me to have
meta-openembedded pass the checker.  This is because meta-openembedded is
not allowed to just enable 'tipc' on it's own.  (A layer may not make distro
wide changes without a user saying to do it.)  The checker script invokes
bitbake -S none world, which will fail on dependency resolution due to there
being no iproute2-tipc package.  The tipc-utils package does not have a way
to check the PACKAGECONFIG of the iproute2 package so disable itself if the
dependency can not be met.  So the default system behavior needs to be:

iproute2 w/ tipc enabled
tipc-utils RDEPENDS on iproute2-tipc

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc |  2 +-
 meta/recipes-extended/libmnl/libmnl_1.0.4.bb    | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libmnl/libmnl_1.0.4.bb

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 57309b7..a578eb3 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native iptables elfutils"
 
 inherit update-alternatives bash-completion pkgconfig
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "tipc"
 PACKAGECONFIG[tipc] = ",,libmnl,"
 
 EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.4.bb b/meta/recipes-extended/libmnl/libmnl_1.0.4.bb
new file mode 100644
index 0000000..b458799
--- /dev/null
+++ b/meta/recipes-extended/libmnl/libmnl_1.0.4.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Minimalistic user-space Netlink utility library"
+DESCRIPTION = "Minimalistic user-space library oriented to Netlink developers, providing \
+    functions for common tasks in parsing, validating, and constructing both the Netlink header and TLVs."
+HOMEPAGE = "http://www.netfilter.org/projects/libmnl/index.html"
+SECTION = "libs"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://www.netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2;name=tar"
+SRC_URI[tar.md5sum] = "be9b4b5328c6da1bda565ac5dffadb2d"
+SRC_URI[tar.sha256sum] = "171f89699f286a5854b72b91d06e8f8e3683064c5901fb09d954a9ab6f551f81"
+
+inherit autotools pkgconfig
-- 
1.8.3.1


