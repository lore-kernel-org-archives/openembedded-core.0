Return-Path: <martin@hundeboll.net>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 22E3A65C87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 11:27:23 +0000 (UTC)
Received: from hundeboll.es.aau.dk (192.38.55.25.natpool.es.aau.dk
	[192.38.55.25])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 8BC3C1BF62D;
	Wed, 29 Oct 2014 12:18:49 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@hundeboll.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 12:18:47 +0100
Message-Id: <1414581527-5448-3-git-send-email-martin@hundeboll.net>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <1414581527-5448-1-git-send-email-martin@hundeboll.net>
References: <1414581527-5448-1-git-send-email-martin@hundeboll.net>
MIME-Version: 1.0
Subject: [RFC 2/2] meta: rm __pycache__ in glib.inc::do_install_append()
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
X-List-Received-Date: Wed, 29 Oct 2014 11:27:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Python3 places bytecode files in./ __pycache__ instead of simple .pyc
and .pyo in the script folder.

With python3 as the default python binary (i.e. /usr/bin/python ->
python3), the building glib-2.0 fails in do_package() due to the mentioned
python cache files not being installed/removed. Fix this by removing the
__pycache__ folder during do_install_append(), as is done with *.pyc and
*.pyo.

Signed-off-by: Martin Hundebøll <martin@hundeboll.net>
---
 meta/recipes-core/glib-2.0/glib.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 993320b..77644a9 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -63,6 +63,7 @@ do_install_append () {
 	# Remove some unpackaged files
 	rm -f ${D}${datadir}/glib-2.0/codegen/*.pyc
 	rm -f ${D}${datadir}/glib-2.0/codegen/*.pyo
+	rm -rf ${D}${datadir}/glib-2.0/codegen/__pycache__/
 
 	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
 	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-- 
2.1.2


