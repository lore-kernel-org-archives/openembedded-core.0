Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C7F17773D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 01:45:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1Q1jNJH016734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Feb 2016 17:45:23 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 17:45:22 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <alejandro.hernandez@linux.intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 25 Feb 2016 20:45:00 -0500
Message-ID: <05c06ed8ffad83ab3bf492ef793f33f2a5d346e3.1456449257.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456449257.git.hongxu.jia@windriver.com>
References: <cover.1456449257.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/15] python-pygobject: fix buildpath QA issue
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
X-List-Received-Date: Fri, 26 Feb 2016 01:45:24 -0000
Content-Type: text/plain

The variable PYTHON is assigned with native python.
But for target, it caused pygobject-codegen has
build path.

vim ${S}/codegen/pygobject-codegen-2.0.in
[snip]...
exec @PYTHON@ $codegendir/codegen.py "$@"
[snip]...

So we replace it by invoking "which python".

[YOCTO #7058]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python-pygobject_2.28.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
index 81d37b4..6082d35 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
@@ -51,3 +51,8 @@ FILES_${PN}-lib = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${bindir} ${datadir}"
 
 BBCLASSEXTEND = "native"
+
+do_install_append_class-target() {
+	sed -i -e "s:${PYTHON}:\`which python\`:g" \
+	    ${D}${bindir}/pygobject-codegen-2.0
+}
-- 
1.9.1


