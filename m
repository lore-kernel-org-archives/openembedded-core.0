Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 33D816FF97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 16:41:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 11 May 2016 09:41:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,608,1455004800"; d="scan'208";a="977646358"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.164])
	by fmsmga002.fm.intel.com with ESMTP; 11 May 2016 09:41:23 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 11:41:55 -0500
Message-Id: <1462984915-12056-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: patrick.ohly@gmx.de
Subject: [PATCH] classes/base: get_lic_checksum_file_list imporve validaton of url's
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
X-List-Received-Date: Wed, 11 May 2016 16:41:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When specify an URL different that supported file:// the function
returns an empty path causing an exception without notice the user
that the URL is Malformed.

[YOCTO #9211]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/base.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a7ca3a6..c3c2669 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -105,6 +105,9 @@ def get_lic_checksum_file_list(d):
         # any others should be covered by SRC_URI.
         try:
             path = bb.fetch.decodeurl(url)[2]
+            if not path:
+                raise bb.fetch.MalformedUrl(url)
+
             if path[0] == '/':
                 if path.startswith(tmpdir):
                     continue
-- 
2.1.4


