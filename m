Return-Path: <Jianchuan.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 15FD660290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 02:21:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6M2LLLY007887
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:21:21 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jul 2016 19:21:20 -0700
From: <jianchuan.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jul 2016 22:21:19 -0400
Message-ID: <1469154079-88534-1-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] net-tools: lib/inet6.c:INET6_rresolve() - various fixes
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
X-List-Received-Date: Fri, 22 Jul 2016 02:21:21 -0000
Content-Type: text/plain

From: Shan Hai <shan.hai@windriver.com>

Integrate the commit from https://github.com/ecki/net-tools/commit/a70c568b907d23ec2cf7defc81be50c351968f12
to fix a bug which causes the 'netstat -a' to print "[UNKNOWN]" in case of
DNS problem instead of IPv6 address.

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 ...-lib-inet6.c-INET6_rresolve-various-fixes.patch | 87 ++++++++++++++++++++++
 .../net-tools/net-tools_1.60-26.bb                 |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/0001-lib-inet6.c-INET6_rresolve-various-fixes.patch

diff --git a/meta/recipes-extended/net-tools/net-tools/0001-lib-inet6.c-INET6_rresolve-various-fixes.patch b/meta/recipes-extended/net-tools/net-tools/0001-lib-inet6.c-INET6_rresolve-various-fixes.patch
new file mode 100644
index 0000000..8be45cc
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/0001-lib-inet6.c-INET6_rresolve-various-fixes.patch
@@ -0,0 +1,87 @@
+From 08abfcd923e9f37d1902db26771b1dc6731eb265 Mon Sep 17 00:00:00 2001
+From: Jiri Popelka <jpopelka@redhat.com>
+Date: Fri, 27 Sep 2013 18:40:06 +0200
+Subject: [PATCH 1/1] lib/inet6.c:INET6_rresolve() - various fixes
+
+1) Fall-back to numeric address if getnameinfo fails.
+   Reverse lookup is not mandatory, therefore its fail
+   is not an error. Just return numeric address in that case.
+   This makes netstat/route show IPv6 address instead of
+   [UNKNOWN] in case of DNS problems.
+
+2) Pass length of 'name' buffer into function.
+   'name' is a pointer and therefore sizeof(name)
+   returns size of pointer and not size of the buffer.
+   see http://stackoverflow.com/questions/14298710/c-pointers-and-arrays-sizeof-operator
+   The sizeof() usage was added with commit 604785adc,
+   so I checked all the other changes in that commit
+   and they seem to be OK.
+
+3) remove unused 's' variable
+
+Upstream-Status: Pending
+
+Signed-off-by: Shan Hai <shan.hai@windriver.com>
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+---
+ lib/inet6.c | 21 ++++++++++-----------
+ 1 file changed, 10 insertions(+), 11 deletions(-)
+
+diff --git a/lib/inet6.c b/lib/inet6.c
+index 9a484a0..2a9c459 100644
+--- a/lib/inet6.c
++++ b/lib/inet6.c
+@@ -84,10 +84,9 @@ static int INET6_resolve(char *name, struct sockaddr_in6 *sin6)
+ #endif
+ 
+ 
+-static int INET6_rresolve(char *name, struct sockaddr_in6 *sin6, int numeric)
++static int INET6_rresolve(char *name, size_t namelen,
++			  struct sockaddr_in6 *sin6, int numeric)
+ {
+-    int s;
+-
+     /* Grmpf. -FvK */
+     if (sin6->sin6_family != AF_INET6) {
+ #ifdef DEBUG
+@@ -98,21 +97,20 @@ static int INET6_rresolve(char *name, struct sockaddr_in6 *sin6, int numeric)
+ 	return (-1);
+     }
+     if (numeric & 0x7FFF) {
+-	inet_ntop( AF_INET6, &sin6->sin6_addr, name, 80);
++	inet_ntop( AF_INET6, &sin6->sin6_addr, name, namelen);
+ 	return (0);
+     }
+     if (IN6_IS_ADDR_UNSPECIFIED(&sin6->sin6_addr)) {
+         if (numeric & 0x8000)
+-	    strcpy(name, "default");
++	    safe_strncpy(name, "default", namelen);
+ 	else
+-	    strcpy(name, "[::]");
++	    safe_strncpy(name, "[::]", namelen);
+ 	return (0);
+     }
+ 
+-    if ((s = getnameinfo((struct sockaddr *) sin6, sizeof(struct sockaddr_in6),
+-			 name, 255 /* !! */ , NULL, 0, 0))) {
+-	fputs("getnameinfo failed\n", stderr);
+-	return -1;
++    if (getnameinfo((struct sockaddr *) sin6, sizeof(struct sockaddr_in6),
++		    name, namelen , NULL, 0, 0)) {
++	inet_ntop( AF_INET6, &sin6->sin6_addr, name, namelen);
+     }
+     return (0);
+ }
+@@ -143,7 +141,8 @@ static char *INET6_sprint(struct sockaddr *sap, int numeric)
+ 
+     if (sap->sa_family == 0xFFFF || sap->sa_family == 0)
+ 	return safe_strncpy(buff, _("[NONE SET]"), sizeof(buff));
+-    if (INET6_rresolve(buff, (struct sockaddr_in6 *) sap, numeric) != 0)
++    if (INET6_rresolve(buff, sizeof(buff),
++		       (struct sockaddr_in6 *) sap, numeric) != 0)
+ 	return safe_strncpy(buff, _("[UNKNOWN]"), sizeof(buff));
+     return (fix_v4_address(buff, &((struct sockaddr_in6 *)sap)->sin6_addr));
+ }
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 759de0a..9c2adfa 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/
            file://net-tools-1.60-sctp1.patch \
            file://net-tools-1.60-sctp2-quiet.patch \
            file://net-tools-1.60-sctp3-addrs.patch \
+           file://0001-lib-inet6.c-INET6_rresolve-various-fixes.patch \
           "
 
 # for this package we're mostly interested in tracking debian patches,
-- 
2.8.1


