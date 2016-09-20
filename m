Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDE7A62136
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 10:32:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8KAWxIv007689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 03:32:59 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 03:32:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2016 03:32:57 -0700
Message-ID: <8aca9a43cc476fe3e2fc1901176fbe4c48e1231c.1474367289.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1474367289.git.liezhi.yang@windriver.com>
References: <cover.1474367289.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] asciidoc: set CLEANBROKEN to fix rebuild
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
X-List-Received-Date: Tue, 20 Sep 2016 10:32:58 -0000
Content-Type: text/plain

The make clean removes doc/a2x.1 and doc/asciidoc.1, then it would cause
build failures since in the second build:
Fixing CONF_DIR in asciidoc.py
Fixing CONF_DIR in a2x.py
python a2x.py -f manpage doc/a2x.1.txt
a2x: ERROR: "xmllint" --nonet --noout --valid "/path/to/asciidoc-native/8.6.9-r0/asciidoc-8.6.9/doc/a2x.1.xml" returned non-zero exit status 4
make: *** [doc/a2x.1] Error 1

The xmllint failed because "--nonext" is used:
I/O error : Attempt to load network entity http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd
/buildarea/lyang1/test_arm/tmp/work/x86_64-linux/asciidoc-native/8.6.9-r0/asciidoc-8.6.9/doc/a2x.1.xml:2: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"

Avoid running make clean will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
index 2091eec..1cd1454 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
@@ -20,3 +20,5 @@ export DESTDIR = "${D}"
 DEPENDS_class-native = "docbook-xml-dtd4-native"
 RDEPENDS_${PN} += "python" 
 BBCLASSEXTEND = "native"
+
+CLEANBROKEN = "1"
-- 
2.9.0


