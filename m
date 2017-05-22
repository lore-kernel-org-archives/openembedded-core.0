Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4F39D60269
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 16:43:10 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 22 May 2017 09:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="105515359"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga006.fm.intel.com with ESMTP; 22 May 2017 09:43:11 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2017 09:43:09 -0700
Message-Id: <20170522164309.31121-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170503192603.41086-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170503192603.41086-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2] package_ipk: correct ipk descriptions
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
X-List-Received-Date: Mon, 22 May 2017 16:43:11 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Empty descriptions are set with a space following by a dot. For the non-empty ones,
there is no need for formating the description with textwrap, so remove the logic
for the latter.

[YOCTO #10677]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/package_ipk.bbclass | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 5cc7e0a7b24..862cc3c730b 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -150,14 +150,7 @@ def ipk_write_pkg(pkg, d):
                 if '\\n' in description:
                     # Manually indent
                     for t in description.split('\\n'):
-                        # We don't limit the width when manually indent, but we do
-                        # need the textwrap.fill() to set the initial_indent and
-                        # subsequent_indent, so set a large width
-                        line = textwrap.fill(t.strip(),
-                                             width=100000,
-                                             initial_indent=' ',
-                                             subsequent_indent=' ') or '.'
-                        ctrlfile.write('%s\n' % line)
+                        ctrlfile.write('%s\n' % (t.strip() or ' .'))
                 else:
                     # Auto indent
                     ctrlfile.write('%s\n' % textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' '))
-- 
2.12.0


