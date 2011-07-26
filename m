Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlpH9-0007HC-6m
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:34:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QLUbg4028034
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:30:37 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 26 Jul 2011 14:30:36 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2011 16:31:02 -0500
Message-ID: <547eb0a8ac9c26e8fbc03948a4ebd402c6e9a3fb.1311715727.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311715727.git.mark.hatle@windriver.com>
References: <cover.1311715727.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [v2 PATCH 1/8] multilib_header.bbclass: Add oe_multilib_header wrapper
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
X-List-Received-Date: Tue, 26 Jul 2011 21:34:51 -0000
Content-Type: text/plain

This helper function and associated header will allow us to
resolve two/three header files that conflict due to contents
that change based on wordsize and ABI.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/multilib_header.bbclass |   29 ++++++++++++++++++
 scripts/multilib_header_wrapper.h    |   55 ++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/multilib_header.bbclass
 create mode 100644 scripts/multilib_header_wrapper.h

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
new file mode 100644
index 0000000..867bce4
--- /dev/null
+++ b/meta/classes/multilib_header.bbclass
@@ -0,0 +1,29 @@
+inherit siteinfo
+
+# If applicable on the architecture, this routine will rename the header and add
+# a unique identifier to the name for the ABI/bitsize that is being used.  A wrapper will
+# be generated for the architecture that knows how to call all of the ABI variants for that
+# given architecture.
+#
+# TODO: mips64 n32 is not yet recognized in this code
+# when that is identified the name of the wrapped item should be "n32" and appropriately
+# determined int he if coding...
+#
+oe_multilib_header() {
+	# Do nothing on ARM, only one ABI is supported at once
+	if echo ${TARGET_ARCH} | grep -q arm; then
+	    return
+	fi
+	for each_header in "$@" ; do
+	   if [ ! -f "${D}/${includedir}/$each_header" ]; then
+	      bberror "oe_multilib_header: Unable to find header $each_header."
+	      continue
+	   fi
+	   stem=$(echo $each_header | sed 's#\.h$##')
+	   ident=${SITEINFO_BITS}
+	   # if mips64/n32 set ident to n32
+	   mv ${D}/${includedir}/$each_header ${D}/${includedir}/${stem}-${ident}.h
+
+	   sed -e "s#ENTER_HEADER_FILENAME_HERE#${stem}#g" ${COREBASE}/scripts/multilib_header_wrapper.h > ${D}/${includedir}/$each_header
+	done
+}
diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
new file mode 100644
index 0000000..5a87540
--- /dev/null
+++ b/scripts/multilib_header_wrapper.h
@@ -0,0 +1,55 @@
+/*
+ * Copyright (C) 2005-2011 by Wind River Systems, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ * 
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
1.7.3.4



