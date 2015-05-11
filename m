Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B34C973FBE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 08:32:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4B8W3ob004461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 01:32:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 01:32:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 01:32:01 -0700
Message-ID: <39b8684e8b63f00702f4e7caed0f4a7ab4e74775.1431333085.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431333085.git.liezhi.yang@windriver.com>
References: <cover.1431333085.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] strace: add PACKAGECONFIG for bluez
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
X-List-Received-Date: Mon, 11 May 2015 08:32:06 -0000
Content-Type: text/plain

Fixed:
net.c:65:34: fatal error: bluetooth/bluetooth.h: No such file or directory
 # include <bluetooth/bluetooth.h>
                                  ^
compilation terminated.

And use "??=" rather than "?=" for PACKAGECONFIG.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/strace/strace_4.10.bb |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
index 07a1076..20b7e3d 100644
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ b/meta/recipes-devtools/strace/strace_4.10.bb
@@ -17,14 +17,18 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
 SRC_URI[md5sum] = "107a5be455493861189e9b57a3a51912"
 SRC_URI[sha256sum] = "e6180d866ef9e76586b96e2ece2bfeeb3aa23f5cc88153f76e9caedd65e40ee2"
 
-inherit autotools ptest
+inherit autotools ptest bluetooth
 RDEPENDS_${PN}-ptest += "make coreutils grep gawk"
 
-PACKAGECONFIG_class-target ?= "libaio ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+PACKAGECONFIG_class-target ??= "\
+    libaio ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+"
 
 PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[libunwind] = "--with-libunwind, --without-libunwind, libunwind"
+PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
 
 TESTDIR = "tests"
 
-- 
1.7.9.5


