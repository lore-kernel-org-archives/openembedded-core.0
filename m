Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlLZL-0001OL-DF
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 15:51:40 +0200
Received: by rex (Postfix, from userid 1000)
	id 6F1D2205A9; Mon, 25 Jul 2011 14:47:22 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 14:47:16 +0100
Message-Id: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311601422.git.richard.purdie@linuxfoundation.org>
References: <cover.1311601422.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/5] multilib_header.bbclass: Add oe_multilib_header wrapper
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jul 2011 13:51:40 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/multilib_header.bbclass |   25 +++++++++++++++++
 scripts/multilib_header_wrapper.h    |   48 ++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/multilib_header.bbclass
 create mode 100644 scripts/multilib_header_wrapper.h

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
new file mode 100644
index 0000000..fedf247
--- /dev/null
+++ b/meta/classes/multilib_header.bbclass
@@ -0,0 +1,25 @@
+inherit siteinfo
+
+export SITEINFO_BITS
+
+#
+# This routine will allow someone to specify a list of headers that need to be
+# wrapped in a way that the bitsize of the target will be used to determine
+# which header to use.
+#
+# TODO: mips64 n32 is not yet recognized in this code
+# The check should be if the arch is mips64 and the bitsize is 32.
+# then the siteinfo_bits should be set to "n32".
+#
+oe_multilib_header() {
+	for each_header in "$@" ; do
+	   if [ ! -f "${D}/${includedir}/$each_header" ]; then
+	      bberror "oe_multilib_header: Unable to find header $each_header."
+	      continue
+	   fi
+	   stem=$(echo $each_header | sed 's#\.h$##')
+	   mv ${D}/${includedir}/$each_header ${D}/${includedir}/${stem}-${SITEINFO_BITS}.h
+
+	   sed -e "s#ENTER_HEADER_FILENAME_HERE#${stem}#g" ${COREBASE}/scripts/multilib_header_wrapper.h > ${D}/${includedir}/$each_header
+	done
+}
diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
new file mode 100644
index 0000000..8d9a3c4
--- /dev/null
+++ b/scripts/multilib_header_wrapper.h
@@ -0,0 +1,48 @@
+/*  Copyright (c) 2005-2011 Wind River Systems, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License version 2.1 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+ * See the GNU Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
+
+#include <bits/wordsize.h>
+
+#ifdef __WORDSIZE
+
+#if __WORDSIZE == 32
+
+#ifdef _MIPS_SIM
+
+#if _MIPS_SIM == _ABIO32
+#include <ENTER_HEADER_FILENAME_HERE-32.h>
+#elif _MIPS_SIM == _ABIN32
+#include <ENTER_HEADER_FILENAME_HERE-n32.h>
+#else
+#error "Unknown _MIPS_SIM"
+#endif
+
+#else /* _MIPS_SIM is not defined */
+#include <ENTER_HEADER_FILENAME_HERE-32.h>
+#endif
+
+#elif __WORDSIZE == 64
+#include <ENTER_HEADER_FILENAME_HERE-64.h>
+#else
+#error "Unknown __WORDSIZE detected"
+#endif /* matches #if __WORDSIZE == 32 */
+
+#else /* __WORDSIZE is not defined */
+
+#error "__WORDSIZE is not defined"
+
+#endif
+  
-- 
1.7.4.1



