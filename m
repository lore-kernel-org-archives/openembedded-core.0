Received: from mail-pd0-f176.google.com ([209.85.192.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNKz6-00036y-BZ
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 12:32:04 +0200
Received: by mail-pd0-f176.google.com with SMTP id r11so766092pdi.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=vg9VlXZTWAKqdviqRFRlpa+3hTFqKPZOQIysReLME4o=;
	b=NLlfJZWaFRokkuHQJBixKKJxjWY7R1CpNYESQG/fykXjSvM8ybf8eX55pN2YJqi+Hv
	gi+8FH2SuYUKoIwsePxLW8RhF5cPtAzlSNLtJXMzsiSmJ5MNtfDObnKV5RTkqrh7mYT+
	uVuzt6nSxkgZaQS37dKsziOT3NgxCPtiTAatySEgzE5vHk2XV4vj6V4c1XmvSoDR9LQh
	8m8t2UpWIOX3JMsuaGwlT89otXfBNQFR3+VruQ5r7zPV6xljmpCNU1TdC5/n6ZobjvhT
	8z37mjcCDdYjw9zCsakxhPH12qF3aphQvczCzsJMt/XAkrQ97g2gurZcKTq1sKsvQvbi
	Fi3w==
X-Received: by 10.66.170.176 with SMTP id an16mr2336998pac.24.1364984092020;
	Wed, 03 Apr 2013 03:14:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id jb1sm5450933pbc.24.2013.04.03.03.14.49
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 03:14:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 12:14:34 +0200
Message-Id: <1364984074-3636-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1364984074-3636-1-git-send-email-Martin.Jansa@gmail.com>
References: <20130320202206.GD3220@jama>
	<1364984074-3636-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 2/2] packagedata: Show error when trying to change PE/PV/PR from runtime/pkgdata
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
X-List-Received-Date: Wed, 03 Apr 2013 10:32:04 -0000

* causes build failure before do_package_write_ipk fails when trying to use wrong WORKDIR
---
 meta/classes/packagedata.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.bbclass
index 120cd64..b22458e 100644
--- a/meta/classes/packagedata.bbclass
+++ b/meta/classes/packagedata.bbclass
@@ -1,7 +1,10 @@
 python read_subpackage_metadata () {
     import oe.packagedata
 
+    pe = d.getVar('PE', True)
     pn = d.getVar('PN', True)
+    pr = d.getVar('PR', True)
+    pv = d.getVar('PV', True)
     data = oe.packagedata.read_pkgdata(pn, d)
 
     for key in data.keys():
@@ -14,5 +17,17 @@ python read_subpackage_metadata () {
                 if sdata[key] != pn:
                     bb.fatal("Recipe %s is trying to create package %s which was already written by recipe %s. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes." % (pn, pkg, sdata[key]))
                 continue
+            if key == "PE":
+                if sdata[key] != pe:
+                    bb.fatal("Recipe %s is trying to change PE from '%s' to '%s'. This will cause do_package_write_ipk failing to find right workdir." % (pn, pe, sdata[key]))
+                continue
+            if key == "PV":
+                if sdata[key] != pv:
+                    bb.fatal("Recipe %s is trying to change PV from '%s' to '%s'. This will cause do_package_write_ipk failing to find right workdir." % (pn, pv, sdata[key]))
+                continue
+            if key == "PR":
+                if sdata[key] != pr:
+                    bb.fatal("Recipe %s is trying to change PR from '%s' to '%s'. This will cause do_package_write_ipk failing to find right workdir." % (pn, pr, sdata[key]))
+                continue
             d.setVar(key, sdata[key])
 }
-- 
1.8.1.5



