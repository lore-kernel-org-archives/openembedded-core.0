Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 351186FA5E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:53:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2014 08:48:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; d="scan'208";a="554544822"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2014 08:53:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:53:48 +0100
Message-Id: <689fc16564d20fbe4004a167e689bedb08fc3ad8.1402329160.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1402329156.git.paul.eggleton@linux.intel.com>
References: <cover.1402329156.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1402329156.git.paul.eggleton@linux.intel.com>
References: <cover.1402329156.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 6/6] openssl: fix for CVE-2010-5298
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
X-List-Received-Date: Mon, 09 Jun 2014 15:53:57 -0000

From: Yue Tao <Yue.Tao@windriver.com>

Race condition in the ssl3_read_bytes function in s3_pkt.c in OpenSSL
through 1.0.1g, when SSL_MODE_RELEASE_BUFFERS is enabled, allows remote
attackers to inject data across sessions or cause a denial of service
(use-after-free and parsing error) via an SSL connection in a
multithreaded environment.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-5298

(From OE-Core master rev: 751f81ed8dc488c500837aeb3eb41ebf3237e10b)

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssl-1.0.1e/openssl-CVE-2010-5298.patch     | 24 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
 2 files changed, 25 insertions(+)
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
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index 65083fb..d639d0a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -43,6 +43,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-1.0.1e-cve-2014-0221.patch \
             file://openssl-1.0.1e-cve-2014-0224.patch \
             file://openssl-1.0.1e-cve-2014-3470.patch \
+            file://openssl-CVE-2010-5298.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.9.3


