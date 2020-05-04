Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web11.5009.1588595557262007060
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 05:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 78.40.148.184, mailfrom: frazer.clews@codethink.co.uk)
Received: from host86-177-45-246.range86-177.btcentralplus.com ([86.177.45.246] helo=localhost.localdomain)
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1jVaGw-0002OB-7Z; Mon, 04 May 2020 13:32:34 +0100
From: "Frazer Clews" <frazer.clews@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: Frazer Clews <frazer.clews@codethink.co.uk>
Subject: [PATCH] lib/bs4/testing.py: fix bs4 testing
Date: Mon,  4 May 2020 13:32:17 +0100
Message-Id: <20200504123217.150728-1-frazer.clews@codethink.co.uk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frazer Clews <frazer.clews@codethink.co.uk>

Have classes actually inherit SoupTest so it can
use it's original methods, also correctly import
HTMLParserTreeBuilder

Signed-off-by: Frazer Clews <frazer.clews@codethink.co.uk>
---
 lib/bs4/testing.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/bs4/testing.py b/lib/bs4/testing.py
index 953bca8e..6584ecf3 100644
--- a/lib/bs4/testing.py
+++ b/lib/bs4/testing.py
@@ -15,7 +15,7 @@ from bs4.element import (
     SoupStrainer,
 )
 
-from bs4.builder import HTMLParserTreeBuilder
+from bs4.builder._htmlparser import HTMLParserTreeBuilder
 default_builder = HTMLParserTreeBuilder
 
 
@@ -56,7 +56,7 @@ class SoupTest(unittest.TestCase):
                 self.assertEqual(earlier, e.previous_element)
             earlier = e
 
-class HTMLTreeBuilderSmokeTest(object):
+class HTMLTreeBuilderSmokeTest(SoupTest):
 
     """A basic test of a treebuilder's competence.
 
@@ -541,7 +541,7 @@ Hello, world!
         data.a['foo'] = 'bar'
         self.assertEqual('<a foo="bar">text</a>', data.a.decode())
 
-class XMLTreeBuilderSmokeTest(object):
+class XMLTreeBuilderSmokeTest(SoupTest):
 
     def test_pickle_and_unpickle_identity(self):
         # Pickling a tree, then unpickling it, yields a tree identical
-- 
2.26.2

