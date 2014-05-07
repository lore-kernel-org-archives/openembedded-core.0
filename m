Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 5C7FA606E0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 12:24:17 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Wed, 7 May 2014
	14:24:16 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id AF82028C882;
	Wed,  7 May 2014 14:24:16 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 May 2014 14:24:15 +0200
Message-ID: <1399465455-58463-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] libxml2: fix CVE-2014-0191
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
X-List-Received-Date: Wed, 07 May 2014 12:24:21 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

It was discovered that libxml2, a library providing support to read,
modify and write XML files, incorrectly performs entity substituton in
the doctype prolog, even if the application using libxml2 disabled any
entity substitution. A remote attacker could provide a
specially-crafted XML file that, when processed, would lead to the
exhaustion of CPU and memory resources or file descriptors.

Reference: https://access.redhat.com/security/cve/CVE-2014-0191

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-core/libxml/libxml2.inc               |    1 +
 .../libxml/libxml2/libxml2-CVE-2014-0191-fix.patch |   37 ++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-0191-fix.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 7fb2644..60bb6b8 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -18,6 +18,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://ansidecl.patch \
            file://runtest.patch \
            file://run-ptest \
+           file://libxml2-CVE-2014-0191-fix.patch \
           "
 
 inherit autotools pkgconfig binconfig pythonnative ptest
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-0191-fix.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-0191-fix.patch
new file mode 100644
index 0000000..1c05ae6
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-0191-fix.patch
@@ -0,0 +1,37 @@
+From: Daniel Veillard <veillard@redhat.com>
+Date: Tue, 22 Apr 2014 15:30:56 +0800
+Subject: Do not fetch external parameter entities
+
+Unless explicitely asked for when validating or replacing entities
+with their value. Problem pointed out by Daniel Berrange <berrange@redhat.com>
+
+Upstream-Status: Backport
+Reference: https://access.redhat.com/security/cve/CVE-2014-0191
+
+Signed-off-by: Daniel Veillard <veillard@redhat.com>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+diff -Naur libxml2-2.9.1-orig/parser.c libxml2-2.9.1/parser.c
+--- libxml2-2.9.1-orig/parser.c	2013-04-16 15:39:18.000000000 +0200
++++ libxml2-2.9.1/parser.c	2014-05-07 13:35:46.883687946 +0200
+@@ -2595,6 +2595,20 @@
+ 		    xmlCharEncoding enc;
+ 
+ 		    /*
++		     * Note: external parsed entities will not be loaded, it is
++		     * not required for a non-validating parser, unless the
++		     * option of validating, or substituting entities were
++		     * given. Doing so is far more secure as the parser will
++		     * only process data coming from the document entity by
++		     * default.
++		     */
++                    if ((entity->etype == XML_EXTERNAL_PARAMETER_ENTITY) &&
++		        ((ctxt->options & XML_PARSE_NOENT) == 0) &&
++			((ctxt->options & XML_PARSE_DTDVALID) == 0) &&
++			(ctxt->validate == 0))
++			return;
++
++		    /*
+ 		     * handle the extra spaces added before and after
+ 		     * c.f. http://www.w3.org/TR/REC-xml#as-PE
+ 		     * this is done independently.
-- 
1.7.10.4


