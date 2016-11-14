Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 260F87197B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:34:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTP id uAEEYAO9025878
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 06:34:10 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 14 Nov 2016 06:34:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2016 06:34:06 -0800
Message-ID: <8c8065fec7073acfbe7c9ea308137e7bb8b83321.1479133967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479133967.git.liezhi.yang@windriver.com>
References: <cover.1479133967.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] sanity.bbclass: fix check_connectivity() for BB_NO_NETWORK = "0"
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
X-List-Received-Date: Mon, 14 Nov 2016 14:34:09 -0000
Content-Type: text/plain

The old code:
network_enabled = not d.getVar('BB_NO_NETWORK', True)

It is True only when BB_NO_NETWORK is not set (None),
but BB_NO_NETWORK = "0" should also be True while "1" means no network,
"0" means need network in a normal case.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7e383f9..c5e3809 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -363,15 +363,19 @@ def check_connectivity(d):
     test_uris = (d.getVar('CONNECTIVITY_CHECK_URIS', True) or "").split()
     retval = ""
 
+    bbn = d.getVar('BB_NO_NETWORK', True)
+    if bbn not in (None, '0', '1'):
+        return 'BB_NO_NETWORK should be "0" or "1", but it is "%s"' % bbn
+
     # Only check connectivity if network enabled and the
     # CONNECTIVITY_CHECK_URIS are set
-    network_enabled = not d.getVar('BB_NO_NETWORK', True)
+    network_enabled = not (bbn == '1')
     check_enabled = len(test_uris)
-    # Take a copy of the data store and unset MIRRORS and PREMIRRORS
-    data = bb.data.createCopy(d)
-    data.delVar('PREMIRRORS')
-    data.delVar('MIRRORS')
     if check_enabled and network_enabled:
+        # Take a copy of the data store and unset MIRRORS and PREMIRRORS
+        data = bb.data.createCopy(d)
+        data.delVar('PREMIRRORS')
+        data.delVar('MIRRORS')
         try:
             fetcher = bb.fetch2.Fetch(test_uris, data)
             fetcher.checkstatus()
-- 
2.10.2


