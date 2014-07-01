Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A78D065E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 20:01:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s61K1Fh0009706
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Jul 2014 13:01:15 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 1 Jul 2014 13:01:15 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Jul 2014 15:01:08 -0500
Message-ID: <2304283af395d567930b1ac61fc36ecc201405ee.1404244287.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1404244287.git.mark.hatle@windriver.com>
References: <cover.1404244287.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] lib/oe/package_manager.py: Fix _pkg_translate_smart_to_oe function
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
X-List-Received-Date: Tue, 01 Jul 2014 20:01:22 -0000
Content-Type: text/plain

File: '/home/mhatle/git/oss/oe-core/meta/lib/oe/package_manager.py', lineno: 278, function: _pkg_translate_smart_to_oe
     0274:
     0275:            if found == 1 and fixed_arch == fixed_cmp_arch:
     0276:                break
     0277:        #bb.note('%s, %s -> %s, %s' % (pkg, arch, new_pkg, new_arch))
 *** 0278:        return new_pkg, new_arch
     0279:
     0280:    def _list_pkg_deps(self):
     0281:        cmd = [bb.utils.which(os.getenv('PATH'), "rpmresolve"),
     0282:               "-t", self.image_rpmlib]
Exception: UnboundLocalError: local variable 'new_arch' referenced before assignment

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/lib/oe/package_manager.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 18eb792..5444422 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -248,6 +248,7 @@ class RpmPkgsList(PkgsList):
     '''
     def _pkg_translate_smart_to_oe(self, pkg, arch):
         new_pkg = pkg
+        new_arch = arch
         fixed_arch = arch.replace('_', '-')
         found = 0
         for mlib in self.ml_prefix_list:
-- 
1.9.3


