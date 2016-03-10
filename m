Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 54D4E7017D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:23:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2A7NhOc028966
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 9 Mar 2016 23:23:43 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 23:23:42 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 02:23:12 -0500
Message-ID: <1824b9aaceb361d65e47eceeea9ed341d8c03cb1.1457593651.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457593651.git.hongxu.jia@windriver.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/18] python-pygobject: fix buildpath QA issue
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
X-List-Received-Date: Thu, 10 Mar 2016 07:23:44 -0000
Content-Type: text/plain

The variable PYTHON is assigned with native python.
But for target, it caused pygobject-codegen has
build path.

vim ${S}/codegen/pygobject-codegen-2.0.in
[snip]...
exec @PYTHON@ $codegendir/codegen.py "$@"
[snip]...

So use "${bindir}/python" to replace.

[YOCTO #7058]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python-pygobject_2.28.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
index 81d37b4..c6a9446 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
@@ -51,3 +51,8 @@ FILES_${PN}-lib = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${bindir} ${datadir}"
 
 BBCLASSEXTEND = "native"
+
+do_install_append_class-target() {
+	sed -i -e "s:${PYTHON}:${bindir}/python:g" \
+	    ${D}${bindir}/pygobject-codegen-2.0
+}
-- 
1.9.1


