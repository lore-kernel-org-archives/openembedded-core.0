Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 530616E681
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 03:33:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4D3XR5t010755
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 20:33:27 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 May 2016 20:33:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 May 2016 20:33:26 -0700
Message-ID: <1463110406-10064-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [meta-oe] [PATCH V2] rrdtool: only unset PERLHOSTLIB in do_configure
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
X-List-Received-Date: Fri, 13 May 2016 03:33:32 -0000
Content-Type: text/plain

The do_compile requires it, otherwise it can't find the native module
correctly when perl-native is mirrored from another build.

Fixed:
| Compilation failed in require.
| BEGIN failed--compilation aborted.
| Can't locate loadable object for module File::Glob in @INC

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 216aafc..73a5d0e 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -58,9 +58,9 @@ export STAGING_INCDIR
 # emulate cpan_do_configure
 EXTRA_OEMAKE = ' PERL5LIB="${PERL_ARCHLIB}" '
 # Avoid do_configure error on some hosts
-export PERLHOSTLIB = ""
 
 do_configure() {
+    unset PERLHOSTLIB
     #fix the pkglib problem with newer automake
     #perl
     sed -i -e "s|-Wl,--rpath -Wl,\$rp||g" \
-- 
2.8.0


