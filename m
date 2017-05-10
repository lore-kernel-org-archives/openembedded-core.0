Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F29F6E5FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 07:51:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4A7p3Ka023471
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 May 2017 00:51:04 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 10 May 2017 00:51:02 -0700
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 10 May 2017 15:50:26 +0800
Message-ID: <1494402626-214700-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] archiver: avoid archiving source for glibc-locale
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
X-List-Received-Date: Wed, 10 May 2017 07:51:06 -0000
Content-Type: text/plain

Avoid archiving source for glibc-locale as its tasks
do_fetch do_unpack and do_patch have already been deleted.

Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
---
 meta/classes/archiver.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 2c04557..89a8fb3 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -67,6 +67,12 @@ python () {
     else:
         bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
 
+
+    # glibc-locale: do_fetch, do_unpack and do_patch tasks have been deleted,
+    # so avoid archiving source here.
+    if pn.startswith('glibc-locale'):
+        return
+
     # We just archive gcc-source for all the gcc related recipes
     if d.getVar('BPN') in ['gcc', 'libgcc'] \
             and not pn.startswith('gcc-source'):
-- 
1.9.1


