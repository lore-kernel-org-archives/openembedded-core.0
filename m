Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id DC783746E8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 00:39:15 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [13.68.168.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CDA0020645;
	Fri,  5 Oct 2018 00:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1538699957;
	bh=qPdATWzXRlXgxTqEV2XTyrRnOzZjrQ1qDG0RbKYeF3A=;
	h=From:To:Cc:Subject:Date:From;
	b=Uo0ZdYRWx2aMTY6qQKx9s0X//wM+5U7xiKA1Mp819KLYnTizeNBisMaeaUqkQv8Rr
	917hCV8zefzllYakmuDLxH/v/VIOgYUpd1hPrriSlDkwN60FiuudJhQAJssccbdxlr
	IqndCSHAdxV/0MC6lmEALZzbK4czpXO/jJMjHXOA=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 00:39:07 +0000
Message-Id: <20181005003908.6888-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [sumo] [PATCH v1 1/2] libxml2: CVE-2018-14404
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
X-List-Received-Date: Fri, 05 Oct 2018 00:39:16 -0000
Content-Transfer-Encoding: 8bit

* CVE-2018-14404
A null pointer dereference vulnerability exists in the xpath.c:xmlXPathCompOpEval()
function of libxml2 when parsing invalid XPath expression. Applications processing
untrusted XSL format inputs with the use of libxml2 library may be vulnerable to
denial of service attack due to crash of the application.

Affects libxml <= 2.9.8

CVE: CVE-2018-14404
Ref: https://access.redhat.com/security/cve/cve-2018-14404

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../libxml/libxml2/CVE-2018-14404.patch       | 58 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.7.bb     |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2018-14404.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2018-14404.patch b/meta/recipes-core/libxml/libxml2/CVE-2018-14404.patch
new file mode 100644
index 0000000000..af3e7b2af9
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2018-14404.patch
@@ -0,0 +1,58 @@
+From 29115868c92c81a4119b05ea95b3c91608a0b6e8 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Mon, 30 Jul 2018 12:54:38 +0200
+Subject: [PATCH] Fix nullptr deref with XPath logic ops
+
+If the XPath stack is corrupted, for example by a misbehaving extension
+function, the "and" and "or" XPath operators could dereference NULL
+pointers. Check that the XPath stack isn't empty and optimize the
+logic operators slightly.
+
+Closes: https://gitlab.gnome.org/GNOME/libxml2/issues/5
+
+Also see
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=901817
+https://bugzilla.redhat.com/show_bug.cgi?id=1595985
+
+This is CVE-2018-14404.
+
+Thanks to Guy Inbar for the report.
+
+CVE: CVE-2018-14404
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/a436374994c47b12d5de1b8b1d191a098fa23594]
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ xpath.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/xpath.c b/xpath.c
+index 35274731..3fcdc9e1 100644
+--- a/xpath.c
++++ b/xpath.c
+@@ -13337,9 +13337,8 @@ xmlXPathCompOpEval(xmlXPathParserContextPtr ctxt, xmlXPathStepOpPtr op)
+ 		return(0);
+ 	    }
+             xmlXPathBooleanFunction(ctxt, 1);
+-            arg1 = valuePop(ctxt);
+-            arg1->boolval &= arg2->boolval;
+-            valuePush(ctxt, arg1);
++            if (ctxt->value != NULL)
++                ctxt->value->boolval &= arg2->boolval;
+ 	    xmlXPathReleaseObject(ctxt->context, arg2);
+             return (total);
+         case XPATH_OP_OR:
+@@ -13363,9 +13362,8 @@ xmlXPathCompOpEval(xmlXPathParserContextPtr ctxt, xmlXPathStepOpPtr op)
+ 		return(0);
+ 	    }
+             xmlXPathBooleanFunction(ctxt, 1);
+-            arg1 = valuePop(ctxt);
+-            arg1->boolval |= arg2->boolval;
+-            valuePush(ctxt, arg1);
++            if (ctxt->value != NULL)
++                ctxt->value->boolval |= arg2->boolval;
+ 	    xmlXPathReleaseObject(ctxt->context, arg2);
+             return (total);
+         case XPATH_OP_EQUAL:
+-- 
+2.19.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.7.bb b/meta/recipes-core/libxml/libxml2_2.9.7.bb
index deb3488a7a..c749a81657 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.7.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.7.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
+           file://CVE-2018-14404.patch \
            "
 
 SRC_URI[libtar.md5sum] = "896608641a08b465098a40ddf51cefba"
-- 
2.19.0


