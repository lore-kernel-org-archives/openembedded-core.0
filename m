Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 011D46CAA3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 05:23:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8Q5NVIY011469
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 22:23:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 25 Sep 2013 22:23:30 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Sep 2013 13:23:32 +0800
Message-ID: <d46d403192a73aaf1a5d61aefb890dcc03e41b25.1380172958.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1380172958.git.Qi.Chen@windriver.com>
References: <cover.1380172958.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] buildhistory.bbclass: always record PKG, PKGE, PKGV and PKGR
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
X-List-Received-Date: Thu, 26 Sep 2013 05:23:30 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The buildhistory.bbclass always records PV instead of PKGV. However,
the buildhistory-diff script treats PKGV as a monitored variable
instead of PV.

If a recipe's PV changes, for example, hello_1.0.bb is renamed to
hello_2.0.bb, then buildhistory-diff reports nothing because PV is
not monitored and PKGV is not recorded.

So the buildhistory.bbclass should always record PKGV no matter it
equals to PV or not.

The same logic applies to PKG, PKGE and PKGR.

[YOCTO #5263]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/buildhistory.bbclass |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3da03c8..cea917c 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -277,10 +277,10 @@ def write_pkghistory(pkginfo, d):
         f.write("PR = %s\n" %  pkginfo.pr)
 
         pkgvars = {}
-        pkgvars['PKG'] = pkginfo.pkg if pkginfo.pkg != pkginfo.name else ''
-        pkgvars['PKGE'] = pkginfo.pkge if pkginfo.pkge != pkginfo.pe else ''
-        pkgvars['PKGV'] = pkginfo.pkgv if pkginfo.pkgv != pkginfo.pv else ''
-        pkgvars['PKGR'] = pkginfo.pkgr if pkginfo.pkgr != pkginfo.pr else ''
+        pkgvars['PKG'] = pkginfo.pkg
+        pkgvars['PKGE'] = pkginfo.pkge
+        pkgvars['PKGV'] = pkginfo.pkgv
+        pkgvars['PKGR'] = pkginfo.pkgr
         for pkgvar in pkgvars:
             val = pkgvars[pkgvar]
             if val:
-- 
1.7.9.5


