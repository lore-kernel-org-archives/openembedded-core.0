Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id DB7937D1F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 16:52:09 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id k17so17528302wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=c4w3esIkBKtzRcoqoRwpC6LwOIAa1Bqj5t3tVk5o7rM=;
	b=xi+MMYQLd28iI5AvV1zCerM5RyTTMM6U2PUF6OOQgC+oRW747rV6VYwInIMF3yp2It
	rbt5lZZe2cc7f58yqATtN3nTPzlc+6nKWgXTW2d4gpLm+huxK9gDi5otYGNySplhY9NZ
	0ovk0bkn5QNUVZOW05jw0Spbc/OcnDBDHTskF6u4m58aJi+Oe0nB4Q6opiswhDNHCzwk
	bGL/4dMwe/mThWGfowy8xaUUeqW0KqkPMw1/Llgk0I+efaz1VAEvW8fUESW4ppcl0tiE
	/2wyKWuRv5VCcovKfB50LfMZdf9MiB1NKk2vdJIBhT0IMXjOs1zm41BDNN6t96pTCcQJ
	G6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=c4w3esIkBKtzRcoqoRwpC6LwOIAa1Bqj5t3tVk5o7rM=;
	b=OQef4Q/mpQVufF4zf7spv6NjnlUoEF1Yw56tRA5c6OskBG3GY+9ZotUBYx6vevCpb+
	4rCYGu7Xu+O8KmmEgfP8qQ4PiD/5WQ7AQuE7B+6EfBVlPvqCwL/gav0UnfmZ4LcF+By3
	fkKSHswUqDrljJkwkuHaFLXgYRYUk80gV4+Jj9h9svwcMtZgjLlWURtyG2W1UB7vDr/A
	aWy0ysyvzdLCoeKz1RXreY1CPj19rv4a46c5RSm0UGs1l+PyYSV2YtTBYWmuR6+bMIt8
	JUxAQ7pQ+bXLMSESWg4YyCt5m4K6MYaoiJyCiIij7TbWUcGElyZCNKVKvg3kaKc+NqBl
	5X4Q==
X-Gm-Message-State: APjAAAU8Rp5cvS4c0QTRqkQoNV37QxcrLnmydec8jGhluGOMsi06iwqF
	5o1yaasB2RMNL4EKr8tL1xjT5L8BB1Y=
X-Google-Smtp-Source: APXvYqwzSU/usQmiklZALqLuY5AAs+aK0Yc4ZSgch4Gh7zuTO2dpJSi9H9R94DfOR8jTTyl6lHEeiA==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr9278922wrj.8.1554223930307;
	Tue, 02 Apr 2019 09:52:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t15sm19898114wmt.2.2019.04.02.09.52.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Apr 2019 09:52:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 17:52:07 +0100
Message-Id: <20190402165207.24366-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] asciidoc: specify XML catalogue to use
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
X-List-Received-Date: Tue, 02 Apr 2019 16:52:10 -0000

libxml-native by default uses a XML catalogue at /etc/xml/catalog, instead of
the one in the sysroot.  Until this is fixed (#13260) override the XML catalogue
manually in the recipe to point explicitly at the docbook-xml and docbook-xsl
catalogues.

This fixes either complete build failures (where the host doesn't have
docbook-xml installed) or slow builds (where the host doesn't have docbook-xsl
installed).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../asciidoc/asciidoc/auto-catalogs.patch          | 53 ++++++++++++++++++++++
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb   |  9 +++-
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch

diff --git a/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch b/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch
new file mode 100644
index 00000000000..ca170db00f2
--- /dev/null
+++ b/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch
@@ -0,0 +1,53 @@
+If SGML_CATALOG_FILES is in the environment, pass --catalogs to xmllint and
+xsltproc. Also pass --nonet to xsltproc to detect future missing stylesheet
+problems.
+
+An earlier version of this patch was filed upstream at
+https://github.com/asciidoc/asciidoc-py3/issues/61 so depending on how that goes
+this could get merged.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/a2x.py b/a2x.py
+index 2d7699a..582d809 100755
+--- a/a2x.py
++++ b/a2x.py
+@@ -57,6 +57,10 @@ LYNX_OPTS = '-dump'
+ W3M_OPTS = '-dump -cols 70 -T text/html -no-graph'
+ XSLTPROC_OPTS = ''
+ 
++if "SGML_CATALOG_FILES" in os.environ:
++  XMLLINT += " --catalogs"
++  XSLTPROC += " --catalogs"
++
+ ######################################################################
+ # End of configuration file parameters.
+ ######################################################################
+@@ -298,7 +302,7 @@ def exec_xsltproc(xsl_file, xml_file, dst_dir, opts = ''):
+     cwd = os.getcwd()
+     shell_cd(dst_dir)
+     try:
+-        shell('"%s" %s "%s" "%s"' % (XSLTPROC, opts, xsl_file, xml_file))
++        shell('%s %s "%s" "%s"' % (XSLTPROC, opts, xsl_file, xml_file))
+     finally:
+         shell_cd(cwd)
+ 
+@@ -483,7 +487,7 @@ class A2X(AttrDict):
+             self.asciidoc_opts += ' --doctype %s' % self.doctype
+         for attr in self.attributes:
+             self.asciidoc_opts += ' --attribute "%s"' % attr
+-#        self.xsltproc_opts += ' --nonet'
++        self.xsltproc_opts += ' --nonet'
+         if self.verbose:
+             self.asciidoc_opts += ' --verbose'
+             self.dblatex_opts += ' -V'
+@@ -634,7 +638,7 @@ class A2X(AttrDict):
+         shell('"%s" --backend docbook -a "a2x-format=%s" %s --out-file "%s" "%s"' %
+              (self.asciidoc, self.format, self.asciidoc_opts, docbook_file, self.asciidoc_file))
+         if not self.no_xmllint and XMLLINT:
+-            shell('"%s" --nonet --noout --valid "%s"' % (XMLLINT, docbook_file))
++            shell('%s --nonet --noout --valid "%s"' % (XMLLINT, docbook_file))
+ 
+     def to_xhtml(self):
+         self.to_docbook()
diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
index d0d15171ac4..f684f12dc72 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
@@ -8,14 +8,19 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
 
-SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https"
+SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
+           file://auto-catalogs.patch"
 SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
 PV .= "+py3-git${SRCPV}"
 
-DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native"
+DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 S = "${WORKDIR}/git"
 
+# Tell xmllint where to find the DocBook XML catalogue, because right now it
+# opens /etc/xml/catalog on the host. Depends on auto-catalogs.patch
+export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/docbook-xml.xml file://${STAGING_ETCDIR_NATIVE}/xml/docbook-xsl.xml"
+
 # Not using automake
 inherit autotools-brokensep
 CLEANBROKEN = "1"
-- 
2.11.0


