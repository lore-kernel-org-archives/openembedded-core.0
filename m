Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CFC9C6ABF0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 09:00:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5J90oHR027778
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 02:00:50 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 19 Jun 2013 02:00:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2013 05:00:41 -0400
Message-ID: <05537d671f3bf2aacf400d50d4bdfb5f251446f5.1371621343.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371621343.git.liezhi.yang@windriver.com>
References: <cover.1371621343.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Wed, 19 Jun 2013 09:00:48 -0000
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
 meta/classes/package_deb.bbclass |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 949432e..74b7d25 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -279,10 +279,11 @@ python do_package_deb () {
                 # Special behavior for description...
                 if 'DESCRIPTION' in fs:
                      summary = localdata.getVar('SUMMARY', True) or localdata.getVar('DESCRIPTION', True) or "."
+                     ctrlfile.write('Description: %s\n' % unicode(summary))
                      description = localdata.getVar('DESCRIPTION', True) or "."
                      description = textwrap.dedent(description).strip()
-                     ctrlfile.write('Description: %s\n' % unicode(summary))
-                     ctrlfile.write('%s\n' % unicode(textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' ')))
+                     for t in description.split('\\n'):
+                         ctrlfile.write('%s\n' % unicode(textwrap.fill(t, width=74, initial_indent=' ', subsequent_indent=' ')))
                 else:
                      ctrlfile.write(unicode(c % tuple(pullData(fs, localdata))))
         except KeyError:
-- 
1.7.10.4


