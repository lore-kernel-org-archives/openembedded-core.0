Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Greylist: delayed 1659 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 10 Sep 2015 17:18:19 UTC
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 6891873232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 17:18:18 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	t8AGskVI019081
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 18:54:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1441904089;
	bh=OYm4waXCkn9focmeVOaMAQ0GuhuMxvghvMdoB8YCjqw=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=KXv8OyovT53jejCqyAsv3yqruBCopZ9QfaDPvpEz86+QxLyKxxJwU5jFD0MiCKflV
	jgRoKhyPHm7PB3Uk5qwWQPihnoOlnXYFjSXjw7hz3p1pjSRrQSnUjxpAPZrKp4KGnY
	Ig8nblULZ6XzvM6vJUrN1K/GnZvWlCck8Rl6tOiQ=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id t8AGsYK2026936
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Thu, 10 Sep 2015 18:54:35 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.85) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Za57K-0006yY-Lk; Thu, 10 Sep 2015 18:54:34 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 18:54:33 +0200
Message-Id: <1441904073-26776-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.4.3
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.8
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.78
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] waf.bbclass: filter out non -j from PARALLEL_MAKE
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
X-List-Received-Date: Thu, 10 Sep 2015 17:18:22 -0000

'waf' supports only simple '-j' and fails when parallel make flags
contain extended options like '--load-average'.

Patch uses the method from 'boost.inc' to filter '-j'.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/waf.bbclass | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 3a221e7..220dc58 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -1,9 +1,31 @@
+def get_waf_parallel_make(bb, d):
+    pm = d.getVar('PARALLEL_MAKE', True)
+    if pm:
+        # look for '-j' and throw other options (e.g. '-l') away
+        # because they might have different meaning in bjam
+        pm = pm.split()
+        while pm:
+            v = None
+            opt = pm.pop(0)
+            if opt == '-j':
+                v = pm.pop(0)
+            elif opt.startswith('-j'):
+                v = opt[2:].strip()
+            else:
+                v = None
+
+            if v:
+                v = min(64, int(v))
+                return '-j' + str(v)
+
+    return ""
+
 waf_do_configure() {
 	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
 }
 
 waf_do_compile()  {
-	${S}/waf build ${PARALLEL_MAKE}
+	${S}/waf build ${@get_waf_parallel_make('PARALLEL_MAKE', d)}
 }
 
 waf_do_install() {
-- 
2.4.3


