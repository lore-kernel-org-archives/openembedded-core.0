Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6887F1E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 09:35:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6Q9YjbD000912
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 02:35:00 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 26 Jul 2019 02:34:45 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2019 05:34:42 -0400
Message-ID: <20190726093443.40634-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH 1/2] subversion: add packageconfig boost
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
X-List-Received-Date: Fri, 26 Jul 2019 09:35:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

subversion checks whether build with boost during do_configure. If boost
exists on build machine, it causes configure-unsafe QA issue:

| ERROR: subversion-1.12.0-r0 do_configure: QA Issue: This autoconf log
|  indicates errors, it looked at host include and/or library paths
|  while determining system capabilities.
| Rerun configure task after fixing this. [configure-unsafe]

Add a PACKAGECONFIG 'boost' to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/subversion/subversion_1.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.12.0.bb b/meta/recipes-devtools/subversion/subversion_1.12.0.bb
index 3d0f3e688d..f1ac1dcfdc 100644
--- a/meta/recipes-devtools/subversion/subversion_1.12.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.12.0.bb
@@ -23,6 +23,7 @@ CVE_PRODUCT = "apache:subversion"
 
 PACKAGECONFIG ?= ""
 
+PACKAGECONFIG[boost] = "--with-boost=${RECIPE_SYSROOT}${exec_prefix},--without-boost,boost"
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
 PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring,--without-gnome-keyring,glib-2.0 gnome-keyring"
 
-- 
2.20.0


