Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91B947646C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:18:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6UFIBsu024234
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 08:18:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 30 Jul 2015 08:17:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 08:18:10 -0700
Message-ID: <50edd6dd2fa86d9a51cc54ecdaa1599a1efc5a43.1438269391.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438269391.git.liezhi.yang@windriver.com>
References: <cover.1438269391.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] base.bbclass/blacklist.bbclass: remove doc item when d.getVarFlags()
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
X-List-Received-Date: Thu, 30 Jul 2015 15:18:12 -0000
Content-Type: text/plain

The FOO[doc] is set in meta/conf/documentation.conf, we need remove it
from d.getVarFlags()'s return dict when it causes many loops.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass      |    2 ++
 meta/classes/blacklist.bbclass |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b7e22ad..9e33f44 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -336,6 +336,8 @@ python () {
     # PACKAGECONFIG ??= "<default options>"
     # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
+    # Remove PACKAGECONFIG[doc]
+    pkgconfigflags.pop('doc', None)
     if pkgconfigflags:
         pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
         pn = d.getVar("PN", True)
diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index a0141a8..39b3f82 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -28,6 +28,8 @@ python blacklist_multilib_eventhandler() {
             prefixes.append(eext[1])
 
     blacklists = e.data.getVarFlags('PNBLACKLIST') or {}
+    # Remove PNBLACKLIST[doc]
+    blacklists.pop('doc', None)
     for pkg, reason in blacklists.items():
         if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in pkg:
             continue
-- 
1.7.9.5


