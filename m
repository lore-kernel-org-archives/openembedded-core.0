Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81C457E7CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 07:53:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5K7rCSn019284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 00:53:12 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Thu, 20 Jun 2019 00:53:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2019 16:15:25 +0800
Message-ID: <d02500d78c61f9cdee7a5f4bc99148379054cfcd.1561018476.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561018476.git.liezhi.yang@windriver.com>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] update-alternatives.bbclass: run update-alternatives firstly in postinst script
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
X-List-Received-Date: Thu, 20 Jun 2019 07:53:11 -0000
Content-Type: text/plain

Recipes like postfix run command newaliases in postinst, but newaliases is
installed newaliases.postfix, and need run update-alternatives to update it to
newaliases, so we would get the error when install postinst on target.

Fixed:
$ opkg install postfix
Configuring postfix.
///var/lib/opkg/info/postfix.postinst: line 4: newaliases: command not found

Run update-alternatives firstly will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/update-alternatives.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index b702e77..8c2b66e 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -284,8 +284,11 @@ python populate_packages_updatealternatives () {
 
             bb.note('adding update-alternatives calls to postinst/prerm for %s' % pkg)
             bb.note('%s' % alt_setup_links)
-            postinst = d.getVar('pkg_postinst_%s' % pkg) or '#!/bin/sh\n'
-            postinst += alt_setup_links
+            postinst = d.getVar('pkg_postinst_%s' % pkg)
+            if postinst:
+                postinst = alt_setup_links + postinst
+            else:
+                postinst = '#!/bin/sh\n' + alt_setup_links
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
             bb.note('%s' % alt_remove_links)
-- 
2.7.4


