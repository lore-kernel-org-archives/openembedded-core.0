Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72CF36FF5D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 08:19:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2S8JdW9000034
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Mar 2016 01:19:39 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 01:19:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<mark.hatle@windriver.com>
Date: Mon, 28 Mar 2016 04:18:57 -0400
Message-ID: <6569a2db9c17752ae174cf72828b88b694a51f8e.1459147231.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1459147231.git.hongxu.jia@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/17] waf.bbclass: support do patch on extracted files
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
X-List-Received-Date: Mon, 28 Mar 2016 08:19:39 -0000
Content-Type: text/plain

Along with do_unpack, run './waf --help' to do the self extract,
so we could do patch on the extracted files later.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/waf.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 5e55833..a36bdd4 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -23,8 +23,17 @@ def get_waf_parallel_make(d):
 
     return ""
 
+do_unpack[postfuncs] += "unpack_waf"
+do_unpack[vardeps] += "unpack_waf"
+unpack_waf() {
+	# Just self extract tarball embedded in waf, do not care help message.
+	# Do not generate bytecode, becuase we may need to patch python file
+        # later
+	PYTHONDONTWRITEBYTECODE=True ./waf --help >/dev/null
+}
+
 waf_do_configure() {
-	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
+	${CACHED_CONFIGUREVARS} ${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
 }
 
 waf_do_compile()  {
-- 
1.9.1


