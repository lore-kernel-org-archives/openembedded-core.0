Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 360D361037
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 02:10:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7G2ACTW012465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 19:10:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 15 Aug 2013 19:10:11 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 10:10:12 +0800
Message-ID: <e6a20d726b71351903f90b6d209104bc9a753b3d.1376618940.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1376618940.git.Qi.Chen@windriver.com>
References: <cover.1376618940.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 1/1] useradd.bbclass: add missing functions to preinst
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
X-List-Received-Date: Fri, 16 Aug 2013 02:10:11 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The preinst scripts are calling bbnote, bbwarn and bbfatal functions,
but these functions are not written to the preinst scripts.

This patch writes these missing functions to the preinst scripts to
avoid the 'not found' errors.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/useradd.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 21daae8..eabfc5d 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -168,6 +168,9 @@ fakeroot python populate_packages_prepend () {
         preinst = d.getVar('pkg_preinst_%s' % pkg, True) or d.getVar('pkg_preinst', True)
         if not preinst:
             preinst = '#!/bin/sh\n'
+        preinst += 'bbnote () {\n%s}\n' % d.getVar('bbnote', True)
+        preinst += 'bbwarn () {\n%s}\n' % d.getVar('bbwarn', True)
+        preinst += 'bbfatal () {\n%s}\n' % d.getVar('bbfatal', True)
         preinst += 'perform_groupadd () {\n%s}\n' % d.getVar('perform_groupadd', True)
         preinst += 'perform_useradd () {\n%s}\n' % d.getVar('perform_useradd', True)
         preinst += 'perform_groupmems () {\n%s}\n' % d.getVar('perform_groupmems', True)
-- 
1.7.9.5


