Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A18E5600FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 09:00:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5J90lo5027774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 02:00:47 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 19 Jun 2013 02:00:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2013 05:00:39 -0400
Message-ID: <7050a45fbf74dfd6efc2a8990347f3b2181b421f.1371621343.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371621343.git.liezhi.yang@windriver.com>
References: <cover.1371621343.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] package_rpm.bbclass: make DESCRIPTION support newline
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
X-List-Received-Date: Wed, 19 Jun 2013 09:00:45 -0000
Content-Type: text/plain

The recipe's DESCRIPTION is wrapped automatically by textwrap, make it
support newline ("\n") to let the user can wrap it manually, e.g.:

DESCRIPTION = "Foo1\nFoo2"

In the past, it would be:
Foo1\nFoo2

Now:
Foo1
Foo2

[YOCTO #4348]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_rpm.bbclass |   19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index c654cdb..01bfaf1 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -534,7 +534,6 @@ def write_rpm_perfiledata(srcname, d):
 
 
 python write_specfile () {
-    import textwrap
     import oe.packagedata
 
     # append information for logs and patches to %prep
@@ -668,6 +667,18 @@ python write_specfile () {
                 deps.append(depends)
         return " ".join(deps)
 
+    def append_description(spec_preamble, text):
+        """
+        Add the description to the spec file, respect to the rules:
+        - split the DESCRIPTION into multi-lines by newline (\n), and
+        - the text width is 75.
+        """
+        import textwrap
+        dedent_text = textwrap.dedent(text).strip()
+        # Bitbake saves "\n" as "\\n"
+        for t in dedent_text.split('\\n'):
+            spec_preamble.append('%s' % textwrap.fill(t.strip(), width=75))
+
     packages = d.getVar('PACKAGES', True)
     if not packages or packages == '':
         bb.debug(1, "No packages; nothing to do")
@@ -868,8 +879,7 @@ python write_specfile () {
         spec_preamble_bottom.append('')
 
         spec_preamble_bottom.append('%%description -n %s' % splitname)
-        dedent_text = textwrap.dedent(splitdescription).strip()
-        spec_preamble_bottom.append('%s' % textwrap.fill(dedent_text, width=75))
+        append_description(spec_preamble_bottom, splitdescription)
 
         spec_preamble_bottom.append('')
 
@@ -975,8 +985,7 @@ python write_specfile () {
     spec_preamble_top.append('')
 
     spec_preamble_top.append('%description')
-    dedent_text = textwrap.dedent(srcdescription).strip()
-    spec_preamble_top.append('%s' % textwrap.fill(dedent_text, width=75))
+    append_description(spec_preamble_top, srcdescription)
 
     spec_preamble_top.append('')
 
-- 
1.7.10.4


