Return-Path: <Sen.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB05A61EBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 07:35:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r537ZcqV027141
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Jun 2013 00:35:38 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 3 Jun 2013 00:35:37 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Jun 2013 15:37:48 +0800
Message-ID: <bbbe7f290de18f1837d9182723de8b866e16099d.1370244833.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1370244833.git.sen.zhang@windriver.com>
References: <cover.1370244833.git.sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sanity.bbclass: make sure python is a full install
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
X-List-Received-Date: Mon, 03 Jun 2013 07:35:36 -0000
Content-Type: text/plain

Components of the Standard Library should be available. Add a sanity
check for xml.parsers.expat; we might add more in the future.

[YOCTO #4424]

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/classes/sanity.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 3b01acf..6cad4bc 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -387,6 +387,12 @@ def check_sanity(sanity_data):
     import sys
     if sys.hexversion < 0x020600F0:
         messages = messages + 'The system requires at least Python 2.6 to run. Please update your Python interpreter.\n'
+    # Check the python install is complete. glib-2.0-natives requries
+    # xml.parsers.expat
+    try:
+        import xml.parsers.expat
+    except ImportError:
+        messages = messages + 'Your python is not a full install. Please install the module xml.parsers.expat (python-xml on openSUSE and SUSE Linux).\n'
 
     if (LooseVersion(bb.__version__) < LooseVersion(minversion)):
         messages = messages + 'Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__)
-- 
1.7.11.7


