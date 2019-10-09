Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 545397F45C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 07:26:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x997Q5uU020726
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Oct 2019 00:26:05 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 9 Oct 2019 00:26:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Oct 2019 15:26:02 +0800
Message-ID: <20191009072602.27832-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009072602.27832-1-Qi.Chen@windriver.com>
References: <20191009072602.27832-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python: CVE-2019-16056
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
X-List-Received-Date: Wed, 09 Oct 2019 07:26:06 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...nt-parse-domains-containing-GH-13079.patch | 88 +++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.16.bb |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch

diff --git a/meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch b/meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
new file mode 100644
index 0000000000..d1e287dbbb
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
@@ -0,0 +1,88 @@
+From 532ed09c5454bb789a301bb6f1339a0818255610 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Roberto=20C=2E=20S=C3=A1nchez?= <roberto@connexer.com>
+Date: Sat, 14 Sep 2019 13:26:38 -0400
+Subject: [PATCH] [2.7] bpo-34155: Dont parse domains containing @ (GH-13079)
+ (GH-16006)
+
+This change skips parsing of email addresses where domains include a "@" character, which can be maliciously used since the local part is returned as a complete address.
+
+(cherry picked from commit 8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9)
+
+Excludes changes to Lib/email/_header_value_parser.py, which did not
+exist in 2.7.
+
+Co-authored-by: jpic <jpic@users.noreply.github.com>
+
+https://bugs.python.org/issue34155
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9]
+
+CVE: CVE-2019-16056
+---
+ Lib/email/_parseaddr.py                            | 11 ++++++++++-
+ Lib/email/test/test_email.py                       | 14 ++++++++++++++
+ .../2019-05-04-13-33-37.bpo-34155.MJll68.rst       |  1 +
+ 3 files changed, 25 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
+
+diff --git a/Lib/email/_parseaddr.py b/Lib/email/_parseaddr.py
+index 690db2c22d..dc49d2e45a 100644
+--- a/Lib/email/_parseaddr.py
++++ b/Lib/email/_parseaddr.py
+@@ -336,7 +336,12 @@ class AddrlistClass:
+         aslist.append('@')
+         self.pos += 1
+         self.gotonext()
+-        return EMPTYSTRING.join(aslist) + self.getdomain()
++        domain = self.getdomain()
++        if not domain:
++            # Invalid domain, return an empty address instead of returning a
++            # local part to denote failed parsing.
++            return EMPTYSTRING
++        return EMPTYSTRING.join(aslist) + domain
+ 
+     def getdomain(self):
+         """Get the complete domain name from an address."""
+@@ -351,6 +356,10 @@ class AddrlistClass:
+             elif self.field[self.pos] == '.':
+                 self.pos += 1
+                 sdlist.append('.')
++            elif self.field[self.pos] == '@':
++                # bpo-34155: Don't parse domains with two `@` like
++                # `a@malicious.org@important.com`.
++                return EMPTYSTRING
+             elif self.field[self.pos] in self.atomends:
+                 break
+             else:
+diff --git a/Lib/email/test/test_email.py b/Lib/email/test/test_email.py
+index 4b4dee3d34..2efe44ac5a 100644
+--- a/Lib/email/test/test_email.py
++++ b/Lib/email/test/test_email.py
+@@ -2306,6 +2306,20 @@ class TestMiscellaneous(TestEmailBase):
+         self.assertEqual(Utils.parseaddr('<>'), ('', ''))
+         self.assertEqual(Utils.formataddr(Utils.parseaddr('<>')), '')
+ 
++    def test_parseaddr_multiple_domains(self):
++        self.assertEqual(
++            Utils.parseaddr('a@b@c'),
++            ('', '')
++        )
++        self.assertEqual(
++            Utils.parseaddr('a@b.c@c'),
++            ('', '')
++        )
++        self.assertEqual(
++            Utils.parseaddr('a@172.17.0.1@c'),
++            ('', '')
++        )
++
+     def test_noquote_dump(self):
+         self.assertEqual(
+             Utils.formataddr(('A Silly Person', 'person@dom.ain')),
+diff --git a/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
+new file mode 100644
+index 0000000000..50292e29ed
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
+@@ -0,0 +1 @@
++Fix parsing of invalid email addresses with more than one ``@`` (e.g. a@b@c.com.) to not return the part before 2nd ``@`` as valid email address. Patch by maxking & jpic.
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index 5b856a5097..aec877825e 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -30,6 +30,7 @@ SRC_URI += " \
            file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
            file://float-endian.patch \
            file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
+           file://0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.17.1


