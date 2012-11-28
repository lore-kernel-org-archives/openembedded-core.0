Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1TdgX5-0006zR-Jp
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 13:14:29 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qASADlMP010248
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 02:13:47 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 28 Nov 2012 02:13:45 -0800
From: "yanjun.zhu" <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Nov 2012 18:13:42 +0800
Message-ID: <1354097622-27424-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.11
In-Reply-To: <3487>
References: <3487>
MIME-Version: 1.0
Subject: [oe][PATCH] libproxy: Fix for CVE-2012-4504
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
X-List-Received-Date: Wed, 28 Nov 2012 12:14:29 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

Reference:https://code.google.com/p/libproxy/source/detail?r=853

Stack-based buffer overflow in the url::get_pac function in url.cpp
in libproxy 0.4.x before 0.4.9 allows remote servers to have an
unspecified impact via a large proxy.pac file.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4504

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 .../libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch  | 15 +++++++++++++++
 meta/recipes-support/libproxy/libproxy_0.4.7.bb           |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch

diff --git a/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch b/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch
new file mode 100644
index 0000000..323a571
--- /dev/null
+++ b/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch
@@ -0,0 +1,15 @@
+diff -urpN a/libproxy/url.cpp b/libproxy/url.cpp
+--- a/libproxy/url.cpp	2012-11-26 10:08:47.000000000 +0800
++++ b/libproxy/url.cpp	2012-11-26 10:05:54.000000000 +0800
+@@ -472,9 +472,10 @@ char* url::get_pac() {
+ 				// Add this chunk to our content length,
+ 				// ensuring that we aren't over our max size
+ 				content_length += chunk_length;
+-				if (content_length >= PAC_MAX_SIZE) break;
+ 			}
+ 
++			if (content_length >= PAC_MAX_SIZE) break;
++
+ 			while (recvd != content_length) {
+ 				int r = recv(sock, buffer + recvd, content_length - recvd, 0);
+ 				if (r < 0) break;
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
index e3721a8..fc32f57 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -13,6 +13,7 @@ PR = "r4"
 SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
            file://g++-namepace.patch \
            file://libproxy_fix_for_gcc4.7.patch \
+           file://libproxy-0.4.7-CVE-2012-4504.patch \
           "
 
 SRC_URI[md5sum] = "509e03a488a61cd62bfbaf3ab6a2a7a5"
-- 
1.7.11



