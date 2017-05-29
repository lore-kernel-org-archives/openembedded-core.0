Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 77AF471A62
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 17:37:16 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 May 2017 10:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,415,1491289200"; d="scan'208";a="108391582"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga006.fm.intel.com with ESMTP; 29 May 2017 10:37:18 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 10:36:47 -0700
Message-Id: <20170529173647.2792-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170522164309.31121-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170522164309.31121-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v3] package_ipk: correct ipk multiline descriptions
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
X-List-Received-Date: Mon, 29 May 2017 17:37:19 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Empty descriptions lines are set with a space following by a dot and
the multiline ones require a leading space. Also, for non-empty lines,
there is no need for formating with textwrap, so remove the logic for
the latter. The documentation for multiline description was taken from [1].

[1] https://web.archive.org/web/20100727133051/http://handhelds.org:80/moin/moin.cgi/BuildingIpkgs

[YOCTO #10677]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/package_ipk.bbclass | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 5cc7e0a7b24..d2ce3b3e17a 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -148,16 +148,9 @@ def ipk_write_pkg(pkg, d):
                 description = localdata.getVar('DESCRIPTION') or "."
                 description = textwrap.dedent(description).strip()
                 if '\\n' in description:
-                    # Manually indent
+                    # Manually indent: multiline description includes a leading space
                     for t in description.split('\\n'):
-                        # We don't limit the width when manually indent, but we do
-                        # need the textwrap.fill() to set the initial_indent and
-                        # subsequent_indent, so set a large width
-                        line = textwrap.fill(t.strip(),
-                                             width=100000,
-                                             initial_indent=' ',
-                                             subsequent_indent=' ') or '.'
-                        ctrlfile.write('%s\n' % line)
+                        ctrlfile.write(' %s\n' % (t.strip() or ' .'))
                 else:
                     # Auto indent
                     ctrlfile.write('%s\n' % textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' '))
-- 
2.12.0


