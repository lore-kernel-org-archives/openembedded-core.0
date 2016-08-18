Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E691975CF1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 06:16:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7I6Gw53016363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 23:16:58 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 17 Aug 2016 23:16:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2016 23:16:56 -0700
Message-ID: <d50cfa4249a186502631b272a5e0894c3b07b366.1471500999.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471500999.git.liezhi.yang@windriver.com>
References: <cover.1471500999.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] packagefeed-stability.bbclass: cleansstate should remove pkgs from deploy dir
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
X-List-Received-Date: Thu, 18 Aug 2016 06:16:58 -0000
Content-Type: text/plain

"bitbake recipe -ccleansstate" should remove binary pkgs from deploy dir
as normal cleansstate does without packagefeed-stability.bbclass.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/packagefeed-stability.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/packagefeed-stability.bbclass
index bcd3e44..aa01def 100644
--- a/meta/classes/packagefeed-stability.bbclass
+++ b/meta/classes/packagefeed-stability.bbclass
@@ -226,7 +226,8 @@ def package_compare_impl(pkgtype, d):
     else:
         bb.plain('Not copying packages for recipe %s' % pn)
 
-do_cleanall_append() {
+do_cleansstate[postfuncs] += "pfs_cleanpkgs"
+python pfs_cleanpkgs () {
     import errno
     for pkgclass in (d.getVar('PACKAGE_CLASSES', True) or '').split():
         if pkgclass.startswith('package_'):
-- 
2.9.0


