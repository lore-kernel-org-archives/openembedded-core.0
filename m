Return-Path: <kamensky@cisco.com>
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3B7796E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 05:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1440; q=dns/txt; s=iport;
	t=1540357478; x=1541567078; h=from:to:subject:date:message-id;
	bh=kzS2wG1l/qfp+d9uOlmTrAi5Bx8mbKE1eKcnsgF03VE=;
	b=dX1DnMoGcp9Nm9c/3GVJHs9FK7Ig6Ftb2sdPwVgsAQgsh+DLOAdLcfAo
	nfP1yUwp4Q3QT/PtxXDyJB3r9rBFusfgiq2ChKTM7sppIW0hk/23n4mg+
	36H5TfCkvjbDJsK0nE58yvVcW6tDT0sA1z4GaHLUU2LEMnrt+5yPE3v3O M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AFAADZ/M9b/5NdJa1jGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBUQUBAQEBCwGCBGZ/KIwNjB6ZJIF6CwEBH4dYITQNDQEDAQE?=
	=?us-ascii?q?CAQECbRwMh3gBEoMhAYIBqXeFO4RrhzyEJheCAIIojDEiAo9CjxEJhmaKBws?=
	=?us-ascii?q?XkDIBlk4CBAYFAhSBQziBVU0jFYMnCYRXjBcfMIwsAQE?=
X-IronPort-AV: E=Sophos;i="5.54,418,1534809600"; d="scan'208";a="190712927"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Oct 2018 05:04:37 +0000
Received: from kamensky-w541.cisco.com ([10.24.23.231]) (authenticated bits=0)
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPSA id
	w9O54THw000940
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Wed, 24 Oct 2018 05:04:36 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 23 Oct 2018 22:04:26 -0700
Message-Id: <20181024050426.15711-1-kamensky@cisco.com>
X-Mailer: git-send-email 2.17.2
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.23.231, [10.24.23.231]
X-Outbound-Node: rcdn-core-11.cisco.com
Subject: [PATCH] kernel-devsrc: add selinux include files needed by scripts/selinux build
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
X-List-Received-Date: Wed, 24 Oct 2018 05:04:36 -0000

If CONFIG_SECURITY_SELINUX=y is enabled in kernel configuration, then
'make scripts' command in /usr/src/kernel fails to build
utilities under scripts/selinux that would be pulled in by this config:

  HOSTCC  scripts/selinux/genheaders/genheaders
scripts/selinux/genheaders/genheaders.c:19:10: fatal error: classmap.h: No such file or directory
 #include "classmap.h"

To address this issue add security/selinux/include files into
kernel-devsrc.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
To reproduce this issue add to conf/local.conf selinux fragment:
KERNEL_EXTRA_FEATURES_append = " cgl/features/selinux/selinux.scc"
build core-image-lsb-sdk and run 'cd /usr/src/kernel; make scripts'

 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 5758572221..361ad21e1f 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -210,6 +210,9 @@ do_install() {
 	    cp -a --parents kernel/bounds.c $kerneldir/build
 	    cp -a --parents Kbuild $kerneldir/build
 	fi
+
+        # required to build scripts/selinux/genheaders/genheaders
+        cp -a --parents security/selinux/include/* $kerneldir/build/
     )
 
     # Make sure the Makefile and version.h have a matching timestamp so that
-- 
2.17.2


