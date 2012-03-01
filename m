Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S3AYe-0001SC-M7
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 19:16:52 +0100
Received: by pbbrp12 with SMTP id rp12so986244pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 10:08:21 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.224.225 as permitted sender) client-ip=10.68.224.225; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.224.225 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.224.225])
	by 10.68.224.225 with SMTP id rf1mr5867296pbc.133.1330625301852
	(num_hops = 1); Thu, 01 Mar 2012 10:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ivX7fT+T/XsH+bGp6/+lG3xMhvMONV78dofg2YHgjuY=;
	b=saXLJUxfsXdnKu0vAfUO+UsSBhsq4DMaCOzgVr1U07D19JUolKxyf3jKWDnW6DRLV8
	LWerkWSh/RZZ/H8WOlr8rkgBFEJp3RCepB/JJfE6a9xAkEVU6MT3iEijKM9X5/BCMjAO
	jAWrLX2tn/f0fu35/HYG4WHag9Aft72TAq1uQ=
Received: by 10.68.224.225 with SMTP id rf1mr4869740pbc.133.1330625301667;
	Thu, 01 Mar 2012 10:08:21 -0800 (PST)
Received: from localhost.localdomain (garnet.openembedded.org.
	[140.211.169.180])
	by mx.google.com with ESMTPS id i1sm2628939pbj.70.2012.03.01.10.08.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 10:08:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2012 10:08:03 -0800
Message-Id: <1330625283-14582-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] libproxy: Fix build errors due to missing prototypes
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
X-List-Received-Date: Thu, 01 Mar 2012 18:16:52 -0000

g++ really does not like the missing prototypes
here we were missing close() and read() so include
unistd.h to get them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libproxy/libproxy/g++-namepace.patch           |   22 ++++++++++++++++++++
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    6 +++-
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libproxy/libproxy/g++-namepace.patch

diff --git a/meta/recipes-support/libproxy/libproxy/g++-namepace.patch b/meta/recipes-support/libproxy/libproxy/g++-namepace.patch
new file mode 100644
index 0000000..cb90ab7
--- /dev/null
+++ b/meta/recipes-support/libproxy/libproxy/g++-namepace.patch
@@ -0,0 +1,22 @@
+include unistd.h to get prototypes of close() and read()
+otherwise g++ complains
+
+libproxy/url.cpp:439:13: error: 'close' was not declared in this scope
+libproxy/url.cpp:398:37: error: 'read' was not declared in this scope
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: libproxy-0.4.7/libproxy/url.cpp
+===================================================================
+--- libproxy-0.4.7.orig/libproxy/url.cpp	2012-03-01 09:51:11.254156247 -0800
++++ libproxy-0.4.7/libproxy/url.cpp	2012-03-01 09:56:12.058171256 -0800
+@@ -33,6 +33,7 @@
+ #include <cstdlib>    // For atoi()
+ #include <sys/stat.h> // For stat()
+ #include <algorithm> // For transform()
++#include <unistd.h> // For close(), read()
+ 
+ #ifdef WIN32
+ #include <io.h>
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
index f31b701..2cb8ed3 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -8,9 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
 
 DEPENDS = "gconf"
 
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
+SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
+           file://g++-namepace.patch \
+          "
 
 SRC_URI[md5sum] = "509e03a488a61cd62bfbaf3ab6a2a7a5"
 SRC_URI[sha256sum] = "8fe0a58810139ba3c2e186deccf3e68adcd127aa0e972b0862b30b3dde493797"
-- 
1.7.5.4



