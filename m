Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 356F27E4E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 12:21:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5PCL42n027163
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 05:21:04 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Tue, 25 Jun 2019 05:21:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Jun 2019 20:44:50 +0800
Message-ID: <d60c082c2c60c704d0d050c62ee91667c90a4eef.1561465895.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561465895.git.liezhi.yang@windriver.com>
References: <cover.1561465895.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/2] update-alternatives.bbclass: run update-alternatives firstly in postinst script
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
X-List-Received-Date: Tue, 25 Jun 2019 12:21:03 -0000
Content-Type: text/plain

Recipes like postfix run command newaliases in postinst, but newaliases is
installed as newaliases.postfix, it needs run update-alternatives to update it
to newaliases, so there was an error when installed postinst on target.

Fixed:
$ opkg install postfix
Configuring postfix.
///var/lib/opkg/info/postfix.postinst: line 4: newaliases: command not found

Run update-alternatives firstly will fix the problem. And handle busybox as an
exception since it needs set basic tools such as sed command firstly, otherwise
update-alternatives doesn't work.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/update-alternatives.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index b702e77..9ab9298 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -265,6 +265,7 @@ python populate_packages_updatealternatives () {
     if not update_alternatives_enabled(d):
         return
 
+    bpn = d.getVar('BPN')
     # Do actual update alternatives processing
     for pkg in (d.getVar('PACKAGES') or "").split():
         # Create post install/removal scripts
@@ -284,8 +285,16 @@ python populate_packages_updatealternatives () {
 
             bb.note('adding update-alternatives calls to postinst/prerm for %s' % pkg)
             bb.note('%s' % alt_setup_links)
-            postinst = d.getVar('pkg_postinst_%s' % pkg) or '#!/bin/sh\n'
-            postinst += alt_setup_links
+            postinst = d.getVar('pkg_postinst_%s' % pkg)
+            if postinst:
+                # Busybox needs handle basic tools such as sed command
+                # firstly, otherwise, update-alternatives doesn't work.
+                if bpn == 'busybox':
+                    postinst += alt_setup_links
+                else:
+                    postinst = alt_setup_links + postinst
+            else:
+                postinst = '#!/bin/sh\n' + alt_setup_links
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
             bb.note('%s' % alt_remove_links)
-- 
2.7.4


