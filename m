Return-Path: <oobitots@cisco.com>
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	by mail.openembedded.org (Postfix) with ESMTP id 7B27F7887D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3347; q=dns/txt; s=iport;
	t=1521816062; x=1523025662;
	h=from:to:cc:subject:date:message-id;
	bh=NfIAZ92iJH+9+WQMqv+tcvcad0wssZibW+ZQn0bU6UM=;
	b=QbdfiX0Cpfy3xBexhk7i6P9Jk93iYV20DGY2sYKGpBC35skyavpgLvfs
	bjoN/jhRFrQa/jjJxR42nHh+LNHy9gEdnjIfFHA7Wyi7HyjibTQAh10KG
	1HxQA7om/nBVuFuZOYwfzukmRLgUFD1M2ODxm6xV5/PDD+lrZkUL/KK3G g=;
X-IronPort-AV: E=Sophos;i="5.48,350,1517875200"; d="scan'208";a="364670318"
Received: from alln-core-10.cisco.com ([173.36.13.132])
	by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2018 14:41:01 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by alln-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id w2NEf1Ah026634; 
	Fri, 23 Mar 2018 14:41:01 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 36B94647; Fri, 23 Mar 2018 07:41:00 -0700 (PDT)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2018 07:40:58 -0700
Message-Id: <20180323144058.31088-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.10.3.dirty
Subject: [PATCH V2] tcp-wrappers: Fix build with clang
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
X-List-Received-Date: Fri, 23 Mar 2018 14:41:00 -0000

Fix non-void function 'fix_options' should return a value.
Add function prototype to tcpd.c and miscd.c.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 v2 - add function prototypes

 .../0001-Fix-build-with-clang.patch                | 65 ++++++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
new file mode 100644
index 0000000..9d1e05d
--- /dev/null
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
@@ -0,0 +1,65 @@
+From 7f8878ac1aaf4a19992d39379797c151301bedb1 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Mon, 5 Feb 2018 08:29:10 -0800
+Subject: [PATCH] Fix build with clang
+
+Fix "error: non-void function 'fix_options' should return a value".
+Add function prototype to tcpd.c and miscd.c.
+
+Upstream-Status: Pending
+
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ v2 - add function prototypes
+
+ fix_options.c | 2 +-
+ miscd.c       | 4 ++++
+ tcpd.c        | 4 ++++
+ 3 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/fix_options.c b/fix_options.c
+index b5e81b8..9958ff4 100644
+--- a/fix_options.c
++++ b/fix_options.c
+@@ -29,7 +29,7 @@ static char sccsid[] = "@(#) fix_options.c 1.6 97/04/08 02:29:19";
+ 
+ /* fix_options - get rid of IP-level socket options */
+ 
+-fix_options(request)
++void fix_options(request)
+ struct request_info *request;
+ {
+ #ifdef IP_OPTIONS
+diff --git a/miscd.c b/miscd.c
+index 1ab835c..723b83a 100644
+--- a/miscd.c
++++ b/miscd.c
+@@ -40,6 +40,10 @@ static char sccsid[] = "@(#) miscd.c 1.10 96/02/11 17:01:30";
+ #include "patchlevel.h"
+ #include "tcpd.h"
+ 
++#ifdef KILL_IP_OPTIONS
++void fix_options(struct request_info *);
++#endif
++
+ int     allow_severity = SEVERITY;	/* run-time adjustable */
+ int     deny_severity = LOG_WARNING;	/* ditto */
+ 
+diff --git a/tcpd.c b/tcpd.c
+index d865b9c..a179891 100644
+--- a/tcpd.c
++++ b/tcpd.c
+@@ -38,6 +38,10 @@ static char sccsid[] = "@(#) tcpd.c 1.10 96/02/11 17:01:32";
+ #include "patchlevel.h"
+ #include "tcpd.h"
+ 
++#ifdef KILL_IP_OPTIONS
++void fix_options(struct request_info *);
++#endif
++
+ int     allow_severity = SEVERITY;	/* run-time adjustable */
+ int     deny_severity = LOG_WARNING;	/* ditto */
+ 
+-- 
+2.10.3.dirty
+
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 5fdbbce..8519da6 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -44,6 +44,7 @@ SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://safe_finger.8 \
            file://makefile-fix-parallel.patch \
            file://musl-decls.patch \
+           file://0001-Fix-build-with-clang.patch \
            "
 
 SRC_URI[md5sum] = "e6fa25f71226d090f34de3f6b122fb5a"
-- 
2.10.3.dirty


