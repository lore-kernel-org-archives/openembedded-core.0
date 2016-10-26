Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C03A071AFD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 02:31:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9Q2VLIe023662
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Oct 2016 19:31:21 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Oct 2016 19:31:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 25 Oct 2016 22:31:17 -0400
Message-ID: <f1a7d03a68bf628db677027d48281c55f2b8dfba.1477448814.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1477448814.git.hongxu.jia@windriver.com>
References: <cover.1477448814.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] fontcache: fix fonts postinst failed
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
X-List-Received-Date: Wed, 26 Oct 2016 02:31:21 -0000
Content-Type: text/plain

While instal liberation-fonts to image, the fonts postinst
failed at do_rootfs time:
-----------------------------------------------
|WARNING: core-image-minimal-1.0-r0 do_rootfs: The postinstall intercept hook
'update_font_cache' failed (exit code: 139)! See log for details!
|WARNING: core-image-minimal-1.0-r0 do_rootfs: The postinstalls for the
following packages will be postponed for first boot: liberation-fonts
-----------------------------------------------

Since the following commit applied in oe-core
-----------------------------------------------
commit ce1e7fcc60276040477c1d5e3129e029bb9f204b
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Fri Sep 30 17:43:23 2016 +0100

    allarch: Fixes to stop rebuilds when change multilibs
-----------------------------------------------
It assignes base_libdir="/none" which caused fonts postinst failed at
do_rootfs.

The fonts postinst invoke qemu to update font cache which requires
base_libdir arch relative(such as base_libdir="/lib64").

We refer what meta/conf/multilib.conf does, assign it with arch relative.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/fontcache.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 8ebdfc4..ce22170 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -38,6 +38,10 @@ python () {
 }
 
 python add_fontcache_postinsts() {
+    baselib = d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or \
+              d.getVar('BASELIB', True)
+    d.setVar("baselib", baselib)
+
     for pkg in d.getVar('FONT_PACKAGES', True).split():
         bb.note("adding fonts postinst and postrm scripts to %s" % pkg)
         postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
-- 
2.8.1


