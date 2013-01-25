Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tyna3-00023N-2b
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 19:00:47 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 09:45:10 -0800
Received: by mail-ee0-f69.google.com with SMTP id e49so715107eek.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 09:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=1mmi7bX3xMSIakEF4+oX0ORkfmrtTo/4iYzI5ymarUI=;
	b=FmS6tdecRirqctXhpVgWajAq0luWhVqLobDz4Ff4IGFWGSxKPjRDsIdmZgU0yiGt0F
	doLQI5geMXw4LLfp1436dCSow6nkMmG1Swn7s7MQyBdw3JwvaUePBxQEUd0s1zpyFtwl
	aYQVnxv+5+GyicvKTKD9EqaAqnSumQJIRG78UpicaTwkOgsVgepXPEUBA4HbB1BBFL/2
	uN+ovsbeK6jugSRg7+M9B6QKRqJfQVWMuZ4IldFLTBfuzkyK6zgrHyVXyjMrAe9AnEhK
	Ei2Tlhh9sU0YxiPyxz3O9zZK6MO+RrF35kooBBXes+UQzQUPdxEXs/5iRrq3NxjLQYI4
	RcyQ==
X-Received: by 10.180.86.36 with SMTP id m4mr10209588wiz.5.1359135905820;
	Fri, 25 Jan 2013 09:45:05 -0800 (PST)
X-Received: by 10.180.86.36 with SMTP id m4mr10209557wiz.5.1359135905474;
	Fri, 25 Jan 2013 09:45:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t17sm2848886wiv.6.2013.01.25.09.45.03
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 09:45:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 17:43:02 +0000
Message-Id: <1359135782-8953-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmbFF2HHI1UhyjaZ11NYbsHuON+SMj3AC+Vk+5nnwuCGxw9jW2nqogLmeX0K4GXpLMPpdWMcIJuwStyKtag+UdRxi8dn2HlVxcAwjFAV1P848MkB3ui5OkL864EhCwZsUHnz1/dLu6nm0yUE+ahg6MRNHbmdpI+QxleCgPvkK1ka9O9/pGBftjcKjPdpBTUa0O40Gi6
Subject: [PATCH] scripts/wipe-sysroot: add script to safely wipe the sysroots
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 18:00:47 -0000

Add a script to wipe the sysroots and all of the relevant stamps, so that it
will be correctly re-populated.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/wipe-sysroot |   34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100755 scripts/wipe-sysroot

diff --git a/scripts/wipe-sysroot b/scripts/wipe-sysroot
new file mode 100755
index 0000000..e751a91
--- /dev/null
+++ b/scripts/wipe-sysroot
@@ -0,0 +1,34 @@
+#! /bin/sh
+
+# Wipe out all of the sysroots and all of the stamps that populated it.
+# Author: Ross Burton <ross.burton@intel.com>
+#
+# Copyright (c) 2012 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+# See the GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+if [ -z "$BUILDDIR" ]; then
+    echo >&2 "Error: BUILDDIR is not defined, please initialise the build system."
+    return 1
+fi
+
+# The sysroots themselves
+rm -rf $BUILDDIR/tmp/sysroots/
+
+# The stamps that said the sysroot was populated
+rm -rf $BUILDDIR/tmp/stamps/*/*/*.do_populate_sysroot.*
+rm -rf $BUILDDIR/tmp/stamps/*/*/*.do_populate_sysroot_setscene.*
+
+# The sstate manifests
+rm -rf $BUILDDIR/tmp/sstate-control/manifest-*.populate-sysroot
-- 
1.7.10.4



