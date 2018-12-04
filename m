Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C948A60053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 09:23:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,313,1539619200"; d="scan'208";a="48988440"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2018 17:23:53 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A58324B734CD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 17:23:54 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 4 Dec 2018 17:23:58 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 02:22:50 +0800
Message-ID: <1543947770-97931-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: A58324B734CD.A5E7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] nss: Fix SHA_HTONL bug for arm 32be.
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
X-List-Received-Date: Tue, 04 Dec 2018 09:23:54 -0000
Content-Type: text/plain

Rpm use nss as digest crypto library and which will cause an error as follows:

error: test-manual-1.2.3-20181012.noarch.rpm: Header SHA1 digest: BAD (Expected
f1deb7dc4a10742d88ccd1e967dbc62ae45095a5 !=4ad9d7dad6d70d6086eefec62612ad5d77f2fe81)  => this value is wrong
error: test-manual-1.2.3-20181012.noarch.rpm: not an rpm package (or package manifest)

The error is caused by SHA_HTONL in nss, for there is no need to reverse the host value for arm 32be, so fix it.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch   | 34 ++++++++++++++++++++++
 meta/recipes-support/nss/nss_3.40.bb               |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch

diff --git a/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch b/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
new file mode 100644
index 0000000..7ba8d16
--- /dev/null
+++ b/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
@@ -0,0 +1,34 @@
+Subject: [PATCH] Fix SHA_HTONL bug for arm 32be.
+
+In arm 32be, there is no need to reverse the host value.
+
+Upstream Status: Pending
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ lib/freebl/sha_fast.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nss/lib/freebl/sha_fast.h b/nss/lib/freebl/sha_fast.h
+index 4f37d13..8072eda 100644
+--- a/nss/lib/freebl/sha_fast.h
++++ b/nss/lib/freebl/sha_fast.h
+@@ -99,6 +99,7 @@ swap4b(PRUint32 value)
+       defined(__ARM_ARCH_7__) ||   \
+       defined(__ARM_ARCH_7A__) ||  \
+       defined(__ARM_ARCH_7R__)))
++#if defined(IS_LITTLE_ENDIAN)  
+ static __inline__ PRUint32
+ swap4b(PRUint32 value)
+ {
+@@ -109,6 +110,7 @@ swap4b(PRUint32 value)
+     return ret;
+ }
+ #define SHA_HTONL(x) swap4b(x)
++#endif
+ 
+ #endif /* x86 family */
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/nss/nss_3.40.bb b/meta/recipes-support/nss/nss_3.40.bb
index 23c95dd..afc5081 100644
--- a/meta/recipes-support/nss/nss_3.40.bb
+++ b/meta/recipes-support/nss/nss_3.40.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://blank-cert9.db \
            file://blank-key4.db \
            file://system-pkcs11.txt \
+           file://nss-fix-SHA_HTONL-bug-for-arm-32be.patch \
            "
 
 SRC_URI[md5sum] = "f7aec858d192ae03d0e9a35a730c70fa"
-- 
2.7.4




