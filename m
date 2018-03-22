Return-Path: <oobitots@cisco.com>
X-Greylist: delayed 572 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Mar 2018 17:47:20 UTC
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8E978913
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2263; q=dns/txt; s=iport;
	t=1521740842; x=1522950442;
	h=from:to:cc:subject:date:message-id;
	bh=k6VyGFo7Wlasi6ZagqAlR2WR9YBETjYzbedwJcC14zM=;
	b=KDx3GPeSW54+OW1l474yZeZUfgu3W61qugdc4c5T5Qqnki7BLiX9Hgi+
	rPy+8dx+lVbcexx4rYT3PklhbpUy6tFo6gJO0tdN2IYxIEWobpT29GUTM
	DKOg4GZY7abKM2iQDpnxgEFDlfHcnWS1P+kR/zDVj+IEMO3moX25ODS70 c=;
X-IronPort-AV: E=Sophos;i="5.48,345,1517875200"; d="scan'208";a="87420099"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
	by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2018 17:37:49 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by rcdn-core-12.cisco.com (8.14.5/8.14.5) with ESMTP id w2MHbnG4016249; 
	Thu, 22 Mar 2018 17:37:49 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id D2BC2CCC; Thu, 22 Mar 2018 10:37:48 -0700 (PDT)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 10:37:42 -0700
Message-Id: <20180322173742.40112-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.10.3.dirty
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: xe-linux-external@cisco.com
Subject: [PATCH] tcp-wrappers: Fix build with clang
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
X-List-Received-Date: Thu, 22 Mar 2018 17:47:20 -0000

Fix non-void function 'fix_options' should return a value.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 .../0001-Fix-build-with-clang.patch                | 30 ++++++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
new file mode 100644
index 0000000..e601409
--- /dev/null
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
@@ -0,0 +1,30 @@
+From 46ade5e6f3bd3e11b6dd25fa0116c39753d2ba06 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Mon, 5 Feb 2018 08:29:10 -0800
+Subject: [PATCH] Fix build with clang
+
+Fix "error: non-void function 'fix_options' should return a value".
+
+Upstream-Status: Pending
+
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ fix_options.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
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


