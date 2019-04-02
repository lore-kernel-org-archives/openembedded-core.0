Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 617117D1DF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 15:25:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y13so17229629wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+++zhgmdZWWGknxsKRxzUD8f/tS1BzqgDFPTyiDq9jc=;
	b=WMnfLxVdZFNEffV1JDqJVGbn+QbNPjgjF1orjH9Al1IF0TQDdMkcKaoDMZRZEdR3s5
	0TpxwDUdLBBY1uPVobe6Q5H3kxVUNqVdIWAdxo/ZVJynW1K4GYevD24CUBqC/xK401ts
	6s8Hz4ORgJGzytgEXxvvfVmWDPoD0YsVIjL1BU2lHl+3qMyrOp7OHi+2eFSjKm2BwM88
	M07szs6AFSXHL3/j1+3b/WGEKdVKDUFMVmkHwiFoU6vBBoV2bMwxsK3wrTLQicr3N2S0
	pneJsFpXoDxk4y8/S8QrYNxwEIOB47M2o0JV8UozfWd50yYRR8WM7F+6NQdB5vCttxqh
	Dwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+++zhgmdZWWGknxsKRxzUD8f/tS1BzqgDFPTyiDq9jc=;
	b=W0VaLGTzy8uSquJigYfDpLwYDdcVz29/100rGgfDhRMsNIwwHmBvfhqAIMCFeXu+9/
	XIrHOqMFSnXS9++hK/KAsEFqzfOK0e2bVC2fNxTqFwIwkVN1oZ7Ex79sSUe9N+eSYVYB
	Lakfeym/NruI8scbk/KxY7ip1DHjDXCeF6MVHXKMyKEiyuP66TJcviKbBFWKIl3sfQ4B
	y2XKpNI6HyVR5HxynsjY8qwi0Sr+H0oifv5CXas4muCvUlGOsmJ6keW5C5oBYdK3wvAO
	GndAQ9ZRRRiJj3QxCbCl2luI6AoBFQjpcmcD8p7ItZKOyI1RYBhNcohoZj8X8mHjHgFj
	Uc3g==
X-Gm-Message-State: APjAAAVtDBPoFlI+XhY0+GhZkxrhy7fBmOl+egfXxS2GliT3KGTZY9pX
	+p+lrwalLeNUNkRFZm3s2zw46AS7kl4=
X-Google-Smtp-Source: APXvYqxFqngDd/aSRHFX7AyzJUWCi0ahEfg1wa2gSBP2RcFZMbWcyWYpBrScs++6g1ThVBIXaJJAuQ==
X-Received: by 2002:adf:f04e:: with SMTP id t14mr46682633wro.263.1554218715744;
	Tue, 02 Apr 2019 08:25:15 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q17sm11097708wrw.70.2019.04.02.08.25.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Apr 2019 08:25:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 16:25:12 +0100
Message-Id: <20190402152512.13112-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] asciidoc: use local docbook XML catalogue
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
X-List-Received-Date: Tue, 02 Apr 2019 15:25:15 -0000

libxml-native by default uses a XML catalogue at /etc/xml/catalog, instead of
the one in the sysroot.  Until this is fixed (#13260) override the XML catalogue
manually in the recipe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../asciidoc/asciidoc/auto-catalogs.patch          | 27 ++++++++++++++++++++++
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb   |  7 +++++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch

diff --git a/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch b/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch
new file mode 100644
index 00000000000..f507080cd3c
--- /dev/null
+++ b/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch
@@ -0,0 +1,27 @@
+If SGML_CATALOG_FILES is in the environment, pass --catalogs to xmllint.
+
+Upstream-Status: Submitted [https://github.com/asciidoc/asciidoc-py3/issues/61]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/a2x.py b/a2x.py
+index 2d7699a..5bb995f 100755
+--- a/a2x.py
++++ b/a2x.py
+@@ -47,6 +47,8 @@ FOP = 'fop'                 # pdf generation (--fop option).
+ W3M = 'w3m'                 # primary text file generator.
+ LYNX = 'lynx'               # alternate text file generator.
+ XMLLINT = 'xmllint'         # Set to '' to disable.
++if "SGML_CATALOG_FILES" in os.environ:
++  XMLLINT += " --catalogs"
+ EPUBCHECK = 'epubcheck'     # Set to '' to disable.
+ # External executable default options.
+ ASCIIDOC_OPTS = ''
+@@ -634,7 +636,7 @@ class A2X(AttrDict):
+         shell('"%s" --backend docbook -a "a2x-format=%s" %s --out-file "%s" "%s"' %
+              (self.asciidoc, self.format, self.asciidoc_opts, docbook_file, self.asciidoc_file))
+         if not self.no_xmllint and XMLLINT:
+-            shell('"%s" --nonet --noout --valid "%s"' % (XMLLINT, docbook_file))
++            shell('%s --nonet --noout --valid "%s"' % (XMLLINT, docbook_file))
+ 
+     def to_xhtml(self):
+         self.to_docbook()
diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
index d0d15171ac4..88ee93bfc10 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
@@ -8,7 +8,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
 
-SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https"
+SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
+           file://auto-catalogs.patch"
 SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
 PV .= "+py3-git${SRCPV}"
 
@@ -16,6 +17,10 @@ DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native"
 
 S = "${WORKDIR}/git"
 
+# Tell xmllint where to find the DocBook XML catalogue, because right now it
+# opens /etc/xml/catalog on the host. Depends on auto-catalogs.patch
+export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/docbook-xml.xml"
+
 # Not using automake
 inherit autotools-brokensep
 CLEANBROKEN = "1"
-- 
2.11.0


