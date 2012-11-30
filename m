Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1TePUB-0006vi-B8
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 13:14:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAUB2YE0013187
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 03:02:34 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 30 Nov 2012 03:02:32 -0800
From: "yanjun.zhu" <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2012 19:02:30 +0800
Message-ID: <1354273350-6453-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.11
In-Reply-To: <3450>
References: <3450>
MIME-Version: 1.0
Subject: [PATCH 1/1] Python: Fix for CVE-2012-2135
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
X-List-Received-Date: Fri, 30 Nov 2012 12:14:27 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

Reference:http://http://bugs.python.org/issue14579

The utf-16 decoder in Python 3.1 through 3.3 does not update the
aligned_end variable after calling the unicode_decode_call_errorhandler
function, which allows remote attackers to obtain sensitive information
(process memory) or cause a denial of service (memory corruption and crash)
via unspecified vectors.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135

[YOCTO #3450]

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 .../python/python/python-2.7.2-CVE-2012-2135.patch | 24 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch

diff --git a/meta/recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch b/meta/recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch
new file mode 100644
index 0000000..ad118b0
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch
@@ -0,0 +1,24 @@
+Upstream-Status: Backport
+
+Reference:http://bugs.python.org/issue14579
+
+The utf-16 decoder in Python 3.1 through 3.3 does not update the
+aligned_end variable after calling the unicode_decode_call_errorhandler
+function, which allows remote attackers to obtain sensitive information
+(process memory) or cause a denial of service (memory corruption and crash)
+via unspecified vectors.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
+diff -urpN a/Objects/unicodeobject.c b/Objects/unicodeobject.c
+--- a/Objects/unicodeobject.c	2012-11-12 16:25:33.000000000 +0800
++++ b/Objects/unicodeobject.c	2012-11-12 16:26:22.000000000 +0800
+@@ -2568,7 +2568,7 @@ PyUnicode_DecodeUTF16Stateful(const char
+         }
+ 
+         /* UTF-16 code pair: */
+-        if (q >= e) {
++        if (e - q < 2) {
+             errmsg = "unexpected end of data";
+             startinpos = (((const char *)q)-2)-starts;
+             endinpos = ((const char *)e)-starts;
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 2adb4e4..9dabfb7 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -24,6 +24,7 @@ SRC_URI += "\
   file://setuptweaks.patch \
   file://check-if-target-is-64b-not-host.patch \
   file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
+  file://python-2.7.2-CVE-2012-2135.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.11



