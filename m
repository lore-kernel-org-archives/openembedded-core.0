Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web12.11526.1593825298120973422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 18:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: vctlabs.com, ip: 207.154.65.135, mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 48BF62803A3; Fri,  3 Jul 2020 18:18:30 -0700 (PDT)
Date: Fri, 3 Jul 2020 18:18:30 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-yocto.bbclass: fix failure to find defconfig
Message-ID: <20200704011830.6i2uyextz7oml4sk@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-core@lists.openembedded.org
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix build failure in do_kernel_metadata

do_kernel_metadata: Could not locate BSP definition for $MACHINE/standard
                    and no defconfig was provided

The original awk statements looking for the current MACHINE's defconfig
expected to find an entry from SRC_URI that exactly matched 'defconfig'.
In fact, the actual defconfig entry in SRC_URI had been resolved to a
full path inside the working dir, e.g. '/path/to/workdir/defconfig'

Instead of an exact match, use a looser criteria of matching (or not
matching) 'defconfig' as a word in the current record, which still works
if there is a path in front of it. This should achieve the intended
objective of splitting the list into defconfig and non-defconfig
entries.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta/classes/kernel-yocto.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 41d8620e67..97d6f61850 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -156,9 +156,9 @@ do_kernel_metadata() {
 	# a quick check to make sure we don't have duplicate defconfigs If
 	# there's a defconfig in the SRC_URI, did we also have one from the
 	# KBUILD_DEFCONFIG processing above ?
-	src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
+	src_uri_defconfig=$(echo $sccs_from_src_uri | awk '/\<defconfig\>/ { print $0 }' RS=' ')
 	# drop and defconfig's from the src_uri variable, we captured it just above here if it existed
-	sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
+	sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '!/\<defconfig\>/ { print $0 }' RS=' ')
 	if [ -n "$in_tree_defconfig" ]; then
 		sccs_defconfig=$in_tree_defconfig
 		if [ -n "$src_uri_defconfig" ]; then
-- 
2.20.1

