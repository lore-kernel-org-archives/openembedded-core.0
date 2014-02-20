Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB716F1C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 02:11:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1K2BGhB021589
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Feb 2014 18:11:17 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 19 Feb 2014 18:11:16 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <pb@pbcl.net>, <laurentiu.palcu@intel.com>
Date: Thu, 20 Feb 2014 10:11:09 +0800
Message-ID: <1392862269-14520-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1392862269-14520-1-git-send-email-kai.kang@windriver.com>
References: <1392862269-14520-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] update-rc.d.bbclass: fix inhibit check
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
X-List-Received-Date: Thu, 20 Feb 2014 02:11:18 -0000
Content-Type: text/plain

In update-rc.d.bbclass it checks variable INHIBIT_UPDATERCD_BBCLASS to
inhibit from inheriting this class. But it is wrong logic that when
'sysvinit' is in 'DISTRO_FEATURES', INHIBIT_UPDATERCD_BBCLASS will not
be checked.

Replace 'or' with 'and' to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/update-rc.d.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 4b92d8d..0ac2af7 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -117,7 +117,7 @@ python populate_packages_updatercd () {
 
     # Check that this class isn't being inhibited (generally, by
     # systemd.bbclass) before doing any work.
-    if oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or \
+    if oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
        not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
         pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
         if pkgs == None:
-- 
1.8.1.2


