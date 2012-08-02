Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Sx3mq-00006z-BP
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 00:22:32 +0200
Received: by ggmq1 with SMTP id q1so48891ggm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 15:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kptLc00XP2sZH1xiFdFKma1iYqVZIIwXWp/t38+Qclw=;
	b=nl8Pkonxu1Fh6R0P4oVluFOk8nmdKoockSh+k6uUBVyXGa6Zfm25wXzy8KaTWqmTgM
	sjqmq7u/8cXWwhBqFl5atb06n9dNq4NSS0HPKRdUxfjf41lH5fDOO0vomNZHFaQgU6Dh
	sBkKMX5InTp+cwqioWsvY6v0V52KUuKi3+O11aBFxlUVUKtN2pBlwiS/ZOdVY2hTGR4o
	JFW4ddpEinK3mzBQRymApWAKkI3o3qsjIdzJVBdMN2QsGUke+BwLCxfv0SMV8fmRKGx3
	rUYIexwllgzoyPuLPpd61Hh0F0TjVIPCLNBfHISA3eq4GWP33VU5vG3VsMIJsDQ6sfXw
	Pl/Q==
Received: by 10.60.0.161 with SMTP id 1mr40134201oef.63.1343945451742;
	Thu, 02 Aug 2012 15:10:51 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id hc9sm7319281obc.15.2012.08.02.15.10.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 15:10:50 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 15:10:50 -0700
Message-Id: <1343945450-26806-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] base.bbclass: allow specifying an lsb distro hook via the metadata
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
X-List-Received-Date: Thu, 02 Aug 2012 22:22:33 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is useful when you have a rather large set of compatible distros. For
example: Centos 5.4, 5.5, 5.6, etc, RHEL server 5.x, RHEL workstation 5.x.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e15fa26..192c777 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -34,11 +34,21 @@ def oe_import(d):
 python oe_import_eh () {
     if isinstance(e, bb.event.ConfigParsed):
         oe_import(e.data)
-        e.data.setVar("NATIVELSBSTRING", oe.lsb.distro_identifier())
+        e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
 }
 
 addhandler oe_import_eh
 
+def lsb_distro_identifier(d):
+    adjust = d.getVar('LSB_DISTRO_ADJUST', True)
+    adjust_func = None
+    if adjust:
+        try:
+            adjust_func = globals()[adjust]
+        except KeyError:
+            pass
+    return oe.lsb.distro_identifier(adjust_func)
+
 die() {
 	bbfatal "$*"
 }
-- 
1.7.9.5



