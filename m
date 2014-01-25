Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0567A6E3C1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 21:25:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 25 Jan 2014 13:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,720,1384329600"; d="scan'208";a="464717991"
Received: from garethcl-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.28])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2014 13:25:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Jan 2014 21:25:05 +0000
Message-Id: <1390685105-16717-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] classes/buildhistory: fix expansion of escape sequences
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
X-List-Received-Date: Sat, 25 Jan 2014 21:25:22 -0000

OE-Core commit 259b8718a31b886f8a158aeb5de164840c9a28b2 fixed UTF-8
errors but broke decoding of escape sequences in strings (e.g.
pkg_postinst scripts had \n \t in them instead of newlines and tabs.)
We need a second call to decode() here as specifying 'string_escape' as
the second parameter won't do anything.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index e9a9c3b..debeea8 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -190,7 +190,7 @@ python buildhistory_emit_pkghistory() {
                 key = item[0]
                 if key.endswith('_' + pkg):
                     key = key[:-len(pkg)-1]
-                pkgdata[key] = item[1].decode('utf-8', 'string_escape')
+                pkgdata[key] = item[1].decode('utf-8').decode('string_escape')
 
         pkge = pkgdata.get('PKGE', '0')
         pkgv = pkgdata['PKGV']
-- 
1.8.5.3


