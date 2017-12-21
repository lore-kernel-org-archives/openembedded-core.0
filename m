Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 618487866B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 04:41:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBL4fqjP023907
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 20:41:53 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 20 Dec 2017 20:41:52 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Dec 2017 12:41:45 +0800
Message-ID: <65382db74f44d0296de2ccc3e5f67bef740e8422.1513831180.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513831180.git.liezhi.yang@windriver.com>
References: <cover.1513831180.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: fix PACKAGECONFIG for lz4
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
X-List-Received-Date: Thu, 21 Dec 2017 04:41:52 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
PACKAGECONFIG_append_pn-systemd = "lz4"
DISTRO_FEATURES_append = " systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
VIRTUAL-RUNTIME_init_manager = "systemd"
VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"

$ bitbake core-image-minimal
$ runqemu tmp/deploy/images/qemux86-64/ nographic
/sbin/init: error while loading shared libraries: liblz4.so.1: cannot open shared object file: No such file or directory

Add lz4 to RDEPENDS to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 778b868..ed82c33 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -122,7 +122,7 @@ PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 PACKAGECONFIG[localed] = "--enable-localed,--disable-localed"
 PACKAGECONFIG[logind] = "--enable-logind,--disable-logind"
-PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
+PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4,lz4"
 PACKAGECONFIG[machined] = "--enable-machined,--disable-machined"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
-- 
2.7.4


