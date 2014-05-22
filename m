Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 758F065E37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 06:42:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4M6grMi003383
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 23:42:53 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 21 May 2014 23:42:52 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 14:42:51 +0800
Message-ID: <1400740971-11403-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] openssl: add openssl-CVE-2010-5298.patch SRC_URI
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
X-List-Received-Date: Thu, 22 May 2014 06:42:53 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

make openssl-CVE-2010-5298.patch truely work

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../openssl-1.0.1e/openssl-CVE-2010-5298.patch     |   24 --------------------
 .../openssl/openssl/openssl-CVE-2010-5298.patch    |   24 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1g.bb |    1 +
 3 files changed, 25 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-CVE-2010-5298.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
deleted file mode 100644
index 417a774..0000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-openssl fix for CVE-2010-5298
-
-Upstream-Status: Backport
-
-Race condition in the ssl3_read_bytes function in s3_pkt.c in OpenSSL
-through 1.0.1g, when SSL_MODE_RELEASE_BUFFERS is enabled, allows remote
-attackers to inject data across sessions or cause a denial of service
-(use-after-free and parsing error) via an SSL connection in a
-multithreaded environment.
-
-http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-5298
-
-Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---- a/ssl/s3_pkt.c
-+++ b/ssl/s3_pkt.c
-@@ -1013,7 +1013,7 @@ start:
- 				{
- 				s->rstate=SSL_ST_READ_HEADER;
- 				rr->off=0;
--				if (s->mode & SSL_MODE_RELEASE_BUFFERS)
-+				if (s->mode & SSL_MODE_RELEASE_BUFFERS && s->s3->rbuf.left == 0)
- 					ssl3_release_read_buffer(s);
- 				}
- 			}
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2010-5298.patch b/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2010-5298.patch
new file mode 100644
index 0000000..417a774
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-CVE-2010-5298.patch
@@ -0,0 +1,24 @@
+openssl fix for CVE-2010-5298
+
+Upstream-Status: Backport
+
+Race condition in the ssl3_read_bytes function in s3_pkt.c in OpenSSL
+through 1.0.1g, when SSL_MODE_RELEASE_BUFFERS is enabled, allows remote
+attackers to inject data across sessions or cause a denial of service
+(use-after-free and parsing error) via an SSL connection in a
+multithreaded environment.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-5298
+
+Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
+--- a/ssl/s3_pkt.c
++++ b/ssl/s3_pkt.c
+@@ -1013,7 +1013,7 @@ start:
+ 				{
+ 				s->rstate=SSL_ST_READ_HEADER;
+ 				rr->off=0;
+-				if (s->mode & SSL_MODE_RELEASE_BUFFERS)
++				if (s->mode & SSL_MODE_RELEASE_BUFFERS && s->s3->rbuf.left == 0)
+ 					ssl3_release_read_buffer(s);
+ 				}
+ 			}
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
index 7c44546..bbf1455 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-CVE-2014-0198-fix.patch \
             file://Makefiles-ptest.patch \
             file://run-ptest \
+            file://openssl-CVE-2010-5298.patch \
            "
 
 SRC_URI[md5sum] = "de62b43dfcd858e66a74bee1c834e959"
-- 
1.7.10.4


