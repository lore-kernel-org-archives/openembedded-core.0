Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3E156B114
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 03:17:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r683HPia024227
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Jul 2013 20:17:25 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 7 Jul 2013 20:17:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 7 Jul 2013 23:17:15 -0400
Message-ID: <768b39c74cae9f845a4b11fafe0d46be305b9f88.1373253036.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1373253036.git.liezhi.yang@windriver.com>
References: <cover.1373253036.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] package_deb.bbclass: make DESCRIPTION support newline
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
X-List-Received-Date: Mon, 08 Jul 2013 03:17:23 -0000
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
 meta/classes/package_deb.bbclass |   14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 949432e..663f646 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -279,10 +279,20 @@ python do_package_deb () {
                 # Special behavior for description...
                 if 'DESCRIPTION' in fs:
                      summary = localdata.getVar('SUMMARY', True) or localdata.getVar('DESCRIPTION', True) or "."
+                     ctrlfile.write('Description: %s\n' % unicode(summary))
                      description = localdata.getVar('DESCRIPTION', True) or "."
                      description = textwrap.dedent(description).strip()
-                     ctrlfile.write('Description: %s\n' % unicode(summary))
-                     ctrlfile.write('%s\n' % unicode(textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' ')))
+                     if '\\n' in description:
+                         # Manually indent
+                         for t in description.split('\\n'):
+                             # We don't limit the width when manually indent, but we do
+                             # need the textwrap.fill() to set the initial_indent and
+                             # subsequent_indent, so set a large width
+                             ctrlfile.write('%s\n' % unicode(textwrap.fill(t, width=100000, initial_indent=' ', subsequent_indent=' ')))
+                     else:
+                         # Auto indent
+                         ctrlfile.write('%s\n' % unicode(textwrap.fill(description.strip(), width=74, initial_indent=' ', subsequent_indent=' ')))
+
                 else:
                      ctrlfile.write(unicode(c % tuple(pullData(fs, localdata))))
         except KeyError:
-- 
1.7.10.4


