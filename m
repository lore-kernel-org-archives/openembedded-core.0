Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5741.1608859836118174669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 17:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,446,1599494400"; 
   d="scan'208";a="102919468"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Dec 2020 09:30:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 526014CE5468
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Dec 2020 09:30:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Dec 2020 09:30:16 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] ell: upgrade 0.33 -> 0.35
Date: Fri, 25 Dec 2020 09:30:14 +0800
Message-ID: <1608859814-70850-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 526014CE5468.A2DF0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Add the following patch to solve the compilation error when using musl:
0001-Fix-bug-caused-by-missing-types.h-file.patch
0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...x-bug-caused-by-missing-types.h-file.patch | 48 +++++++++++++++++++
 ...ed-by-using-functions-not-provided-b.patch | 26 ++++++++++
 .../ell/{ell_0.33.bb => ell_0.35.bb}          |  9 +++-
 3 files changed, 81 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.patch
 create mode 100644 meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch
 rename meta/recipes-core/ell/{ell_0.33.bb => ell_0.35.bb} (70%)

diff --git a/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.patch b/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.patch
new file mode 100644
index 0000000000..6f26ec4e7d
--- /dev/null
+++ b/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.patch
@@ -0,0 +1,48 @@
+Subject: [PATCH] Fix bug caused by missing types.h file.
+
+Fix the following error:
+../ell-0.35/ell/dhcp-private.h:75:2: error: unknown type name '__be32'
+|    75 |  __be32 xid;
+|       |  ^~~~~~
+| ../ell-0.35/ell/dhcp-private.h:76:2: error: unknown type name '__be16'
+|    76 |  __be16 secs;
+|       |  ^~~~~~
+| ../ell-0.35/ell/dhcp-private.h:77:2: error: unknown type name '__be16'
+|    77 |  __be16 flags;
+|       |  ^~~~~~
+| ../ell-0.35/ell/dhcp-private.h:85:2: error: unknown type name '__be32'
+|    85 |  __be32 magic;
+
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+---
+ ell/dhcp-private.h  | 1 +
+ ell/dhcp6-private.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/ell/dhcp-private.h b/ell/dhcp-private.h
+index 204e54e..b418535 100644
+--- a/ell/dhcp-private.h
++++ b/ell/dhcp-private.h
+@@ -19,6 +19,7 @@
+  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+  *
+  */
++#include <linux/types.h>
+ 
+ struct l_dhcp_client;
+ struct l_dhcp_server;
+diff --git a/ell/dhcp6-private.h b/ell/dhcp6-private.h
+index 2bbd1d3..14dd85c 100644
+--- a/ell/dhcp6-private.h
++++ b/ell/dhcp6-private.h
+@@ -19,6 +19,7 @@
+  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+  *
+  */
++#include <linux/types.h>
+ 
+ struct l_dhcp6_client;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch b/meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch
new file mode 100644
index 0000000000..da0018a8df
--- /dev/null
+++ b/meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch
@@ -0,0 +1,26 @@
+Subject: [PATCH] Fix the bug caused by using functions not provided by musl.
+
+Fix the following error:
+/usr/src/debug/ell/0.35-r0/build/../ell-0.35/ell/pem.c:227: undefined reference to `rawmemchr'
+
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+---
+ ell/pem.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ell/pem.c b/ell/pem.c
+index 790f2c2..27d47a0 100644
+--- a/ell/pem.c
++++ b/ell/pem.c
+@@ -224,7 +224,7 @@ static uint8_t *pem_load_buffer(const void *buf, size_t buf_len,
+ 
+ 		/* Check that each header line has a key and a colon */
+ 		while (start < end) {
+-			const char *lf = rawmemchr(start, '\n');
++			const char *lf = strchr(start, '\n');
+ 			const char *colon = memchr(start, ':', lf - start);
+ 
+ 			if (!colon)
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/ell/ell_0.33.bb b/meta/recipes-core/ell/ell_0.35.bb
similarity index 70%
rename from meta/recipes-core/ell/ell_0.33.bb
rename to meta/recipes-core/ell/ell_0.35.bb
index 2fa05104fb..718b01f5cb 100644
--- a/meta/recipes-core/ell/ell_0.33.bb
+++ b/meta/recipes-core/ell/ell_0.35.bb
@@ -13,8 +13,13 @@ DEPENDS = "dbus"
 
 inherit autotools pkgconfig
 
-SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d9e40e641164150394b74b719b9726fc734f24b2cde679cf5f3be6915c34eded"
+SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
+           file://0001-Fix-bug-caused-by-missing-types.h-file.patch \
+"
+
+SRC_URI_append_libc-musl = "file://0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch"
+
+SRC_URI[sha256sum] = "2bfe9da7781f65f1cb1595a5a068a3ae74d4b68b74f287c6f0c892cfe623913f"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1



