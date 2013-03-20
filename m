Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UIFj3-0002Rs-4v
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 10:54:33 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 42C40D22E9;
	Wed, 20 Mar 2013 10:37:42 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 10:37:22 +0100
Message-Id: <1363772243-370-6-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 5/6] rpcbind: disable yellow pages support
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
X-List-Received-Date: Wed, 20 Mar 2013 09:54:40 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../rpcbind/rpcbind/rpcbind-01-no-yp-support.patch | 49 ++++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind-01-no-yp-support.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind-01-no-yp-support.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbind-01-no-yp-support.patch
new file mode 100644
index 0000000..db26214
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind-01-no-yp-support.patch
@@ -0,0 +1,49 @@
+Remove yellow pages support
+
+This support requires yellow pages support in libtirpc, which isn't
+available. As most Buildroot users are most likely never going to need
+such feature, get rid of it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Upstream-Status: inappropriate [embedded specific]
+
+Index: b/src/security.c
+===================================================================
+--- a/src/security.c
++++ b/src/security.c
+@@ -23,9 +23,6 @@
+ #include <rpcsvc/mount.h>
+ #include <rpcsvc/rquota.h>
+ #include <rpcsvc/nfs_prot.h>
+-#include <rpcsvc/yp.h>
+-#include <rpcsvc/ypclnt.h>
+-#include <rpcsvc/yppasswd.h>
+ 
+ #include "rpcbind.h"
+ 
+@@ -322,24 +319,9 @@
+ 		    args->rmt_proc != MOUNTPROC_UMNT)
+ 			break;
+ 		goto deny;
+-	case YPBINDPROG:
+-		if (args->rmt_proc != YPBINDPROC_SETDOM)
+-			break;
+-		/* FALLTHROUGH */
+-	case YPPASSWDPROG:
+ 	case NFS_PROGRAM:
+ 	case RQUOTAPROG:
+ 		goto deny;
+-	case YPPROG:
+-		switch (args->rmt_proc) {
+-		case YPPROC_ALL:
+-		case YPPROC_MATCH:
+-		case YPPROC_FIRST:
+-		case YPPROC_NEXT:
+-			goto deny;
+-		default:
+-			break;
+-		}
+ 	default:
+ 		break;
+ 	}
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
index 1007613..0a1b2d9 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
            file://fix_host_path.patch \
            file://obsolete_automake_macros.patch \
+           file://rpcbind-01-no-yp-support.patch \
            ${UCLIBCPATCHES} \
           "
 
-- 
1.8.1.2



