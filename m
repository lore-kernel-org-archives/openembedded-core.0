Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 929C165F99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 07:00:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4J70dTR006856
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 00:00:40 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 00:00:38 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 15:00:38 +0800
Message-ID: <1400482838-7751-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] openssl: fix for CVE-2010-5298
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
X-List-Received-Date: Mon, 19 May 2014 07:00:46 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Race condition in the ssl3_read_bytes function in s3_pkt.c in OpenSSL
through 1.0.1g, when SSL_MODE_RELEASE_BUFFERS is enabled, allows remote
attackers to inject data across sessions or cause a denial of service
(use-after-free and parsing error) via an SSL connection in a
multithreaded environment.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-5298

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../openssl-1.0.1e/openssl-CVE-2010-5298.patch     |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
new file mode 100644
index 0000000..417a774
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
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
-- 
1.7.10.4


