Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPsTG-0004sn-Ku
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 12:41:43 +0200
Received: by mail-wg0-f41.google.com with SMTP id y10so5813051wgg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 03:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=x/Enxzd8Sepk7XP92kuGZJeVCjGeFRPJYdKwDHNY+Uw=;
	b=Iwe/N6VNOKCi0qmBjMrA7ktNxcFv90w98hket1fIXNtIkjbCanB6A0HM9jCPZSMR1t
	+WUs5Hm+/c4Ycvv28NwQuLFTT3QraWGPKLKRs5TLEgjVoL8T1wTLv7pdbcCbxdnOXWVg
	miiuEkNJMrT9FLTNs+gMXKjdrO45pvG66zdpKd1vhNnKZIbDVioICg7V1UIhn0t4qSNz
	3Zp49TJwkJ+IpFfXMrJD03c20PCjFvO6MwHh6GUyJFQBm+nc0FRoFxxi6A2rqAOiwtQw
	+jbO8NbocHnsXWnzolgZKdbN2GBjCteBXKAu1bZSxgbcYtyC2R1O2jhDBBLoh4NYoO4x
	1qoQ==
X-Received: by 10.194.81.71 with SMTP id y7mr2377591wjx.19.1365589461264;
	Wed, 10 Apr 2013 03:24:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm30882682wib.3.2013.04.10.03.24.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 03:24:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2013 11:21:33 +0100
Message-Id: <1365589293-16745-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkL5INI1F2ZDGE1M9j1pl7Oc9OfC8bskIIp0aFhsJl62RMHfTqh+WWLbS2cRqjiVO2JuFrY
Subject: [PATCH] update-rc.d: correctly look up the initscript params with overrides
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 10:41:45 -0000

The creation of a clone of d with extra OVERRIDES was removed in
72c1fd72d3b479c728e249eaa763116d352e945b but some of the lookups are essential
so that variables such as ${INITSCRIPT_PARAMS} get overriden and resolved
correctly on a per-package basis.

[ YOCTO #3960 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/update-rc.d.bbclass |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 0c2b94a..d8cc342 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -62,22 +62,28 @@ python populate_packages_updatercd () {
         execute on the target. Not doing so may cause update_rc.d postinst invoked
         twice to cause unwanted warnings.
         """ 
+
+        localdata = bb.data.createCopy(d)
+        overrides = localdata.getVar("OVERRIDES", True)
+        localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
+        bb.data.update_data(localdata)
+
         postinst = d.getVar('pkg_postinst_%s' % pkg, True)
         if not postinst:
             postinst = '#!/bin/sh\n'
-        postinst += d.getVar('updatercd_postinst', True)
+        postinst += localdata.getVar('updatercd_postinst', True)
         d.setVar('pkg_postinst_%s' % pkg, postinst)
 
         prerm = d.getVar('pkg_prerm_%s' % pkg, True)
         if not prerm:
             prerm = '#!/bin/sh\n'
-        prerm += d.getVar('updatercd_prerm', True)
+        prerm += localdata.getVar('updatercd_prerm', True)
         d.setVar('pkg_prerm_%s' % pkg, prerm)
 
         postrm = d.getVar('pkg_postrm_%s' % pkg, True)
         if not postrm:
                 postrm = '#!/bin/sh\n'
-        postrm += d.getVar('updatercd_postrm', True)
+        postrm += localdata.getVar('updatercd_postrm', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 
     # Check that this class isn't being inhibited (generally, by
-- 
1.7.10.4



