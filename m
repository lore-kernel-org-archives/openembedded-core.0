Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RkxfU-0007KX-Mb
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 13:52:40 +0100
Received: by wgbdt11 with SMTP id dt11so666825wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 04:45:10 -0800 (PST)
Received: by 10.180.24.198 with SMTP id w6mr23721205wif.19.1326285910102;
	Wed, 11 Jan 2012 04:45:10 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id r1sm4266485wia.8.2012.01.11.04.45.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jan 2012 04:45:09 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 14:45:02 +0200
Message-Id: <1326285902-31525-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Cc: flocirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] license.py: remove duplicate '&' or '|' from LICENSE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2012 12:52:40 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

Some upstream layers (ex: meta-oe) use '&&' or '||' syntax in LICENSE
variable. Because of my last commit, these bbfiles are failing as LICENSE
is tested with oe.license where '&&' and '||' are the bug source.
The fix is to replace multiple characters of '&' or '|' with a single one.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/lib/oe/license.py |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 7ab66e7..5b8d47c 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -18,6 +18,7 @@ license_pattern = re.compile('[a-zA-Z0-9.+_\-]+$')
 class LicenseVisitor(ast.NodeVisitor):
     """Syntax tree visitor which can accept OpenEmbedded license strings"""
     def visit_string(self, licensestr):
+	licensestr = re.sub(r'([|&])\1+', r'\1', licensestr)
         new_elements = []
         elements = filter(lambda x: x.strip(), license_operator.split(licensestr))
         for pos, element in enumerate(elements):
-- 
1.7.5.4



