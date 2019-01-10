Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 986A27C098
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 13:53:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z5so11425336wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 05:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uKcXpPblS0G7ARKmNZzvgcvBar7OVELjXP7jWr9qLjc=;
	b=u9TYiCiVJ1rzjBaWq77PwjW/hur7RoX9QA6/Ie8Y1U0rvupkcgCNz8/st89usMYIVr
	V39tae9supE3Vo4Rf0U5yq5+C8Wo3S3lxeLofUStAlBwxCrIFajS4C5Wol+1iAFoGFoa
	ua86ZrOQDRpbT7mtca1LJXIOucFG22tN+SRVXdri6sWfAYvRDgojetdI1ejg0t6AES8P
	voWzcITQUq+uA0zg9IudC6s8TXudpnUt/oiy1XDiz9OEhLA5wKKqS/wyPMclU3Axnons
	q64k4hkmutEOQdp4PaJd6rthInK+PdgRMZQFbUSrf6+Ng6v4pAHg9a0NJQ9TgspChL9Y
	bQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uKcXpPblS0G7ARKmNZzvgcvBar7OVELjXP7jWr9qLjc=;
	b=qYKH0Vo7yD36TkVaxXvkvcEEPglbOFmx/GTqTJXbk6gAbRe01Rwj+KOhpn8lH46ZsT
	87SpY1GrTK+jDQb7s5ZKBnFEwFNSEysiScBnjj/pzITVgCd4LYTppLQFXd1LL6ehFyUH
	2cOjAWwmFKstilKblDJI3tX8OPXE1LNV5RzIZcekbnYiTJ4grkvYeHalw364mXUuUFM7
	N72glWyZjsJNRDfC2mAz0TMwviuDtrBw0Pr/XcaEQ7tAGtiugZfEgoafcP6Zg1mkx/tX
	9FsKbdwIeNLp8viwgZCoX+UFW7U22nWOkoqryfjDaunCdJmeBLNrHCezP5T4NSJKeamG
	+D6Q==
X-Gm-Message-State: AJcUukdmun60+PTE8QPTlUBWKjnltnvsczL0MDb59GktGCrD9PtSxXiv
	9yXULL9PKzMLLHbXtBaFoUuMYOMcnWs=
X-Google-Smtp-Source: ALg8bN5/ClqRqVHdUIFsPnReEfIwZ9tmQ1eElcLCC2P4hMYge/Co4096ivaBMKXg29vSa3rUCfKyog==
X-Received: by 2002:a5d:4046:: with SMTP id w6mr9817210wrp.92.1547128386193;
	Thu, 10 Jan 2019 05:53:06 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q9sm78248587wrp.0.2019.01.10.05.53.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 05:53:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2019 13:52:59 +0000
Message-Id: <20190110135301.1888-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190110135301.1888-1-ross.burton@intel.com>
References: <20190110135301.1888-1-ross.burton@intel.com>
Subject: [PATCH 3/5] gsettings: allow the schemas to be in any package
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
X-List-Received-Date: Thu, 10 Jan 2019 13:53:05 -0000

Instead of assuming that the schemas are located in ${PN}, add a
GSETTINGS_PACKAGE variable for the package name and default it to ${PN}.

For recipe that can conditionally ship schemas, support GSETTINGS_PACKAGE being
empty gracefully by doing nothing.

(From OE-Core rev: 28e84a07dd74636554bdf7622da167a1fe1af963)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/gsettings.bbclass | 48 +++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/meta/classes/gsettings.bbclass b/meta/classes/gsettings.bbclass
index eae3dc7999f..33afc96a9ce 100644
--- a/meta/classes/gsettings.bbclass
+++ b/meta/classes/gsettings.bbclass
@@ -7,32 +7,36 @@
 
 # TODO use a trigger so that this runs once per package operation run
 
-
-RDEPENDS_${PN} += "glib-2.0-utils"
-
-FILES_${PN} += "${datadir}/glib-2.0/schemas"
-
-PACKAGE_WRITE_DEPS += "glib-2.0-native"
+GSETTINGS_PACKAGE ?= "${PN}"
+
+python __anonymous() {
+    pkg = d.getVar("GSETTINGS_PACKAGE")
+    if pkg:
+        d.appendVar("PACKAGE_WRITE_DEPS", " glib-2.0-native")
+        d.appendVar("RDEPENDS_" + pkg, " ${MLPREFIX}glib-2.0-utils")
+        d.appendVar("FILES_" + pkg, " ${datadir}/glib-2.0/schemas")
+}
 
 gsettings_postinstrm () {
 	glib-compile-schemas $D${datadir}/glib-2.0/schemas
 }
 
 python populate_packages_append () {
-    pkg = d.getVar('PN')
-    bb.note("adding gsettings postinst scripts to %s" % pkg)
-
-    postinst = d.getVar('pkg_postinst_%s' % pkg) or d.getVar('pkg_postinst')
-    if not postinst:
-        postinst = '#!/bin/sh\n'
-    postinst += d.getVar('gsettings_postinstrm')
-    d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-    bb.note("adding gsettings postrm scripts to %s" % pkg)
-
-    postrm = d.getVar('pkg_postrm_%s' % pkg) or d.getVar('pkg_postrm')
-    if not postrm:
-        postrm = '#!/bin/sh\n'
-    postrm += d.getVar('gsettings_postinstrm')
-    d.setVar('pkg_postrm_%s' % pkg, postrm)
+    pkg = d.getVar('GSETTINGS_PACKAGE')
+    if pkg:
+        bb.note("adding gsettings postinst scripts to %s" % pkg)
+
+        postinst = d.getVar('pkg_postinst_%s' % pkg) or d.getVar('pkg_postinst')
+        if not postinst:
+            postinst = '#!/bin/sh\n'
+        postinst += d.getVar('gsettings_postinstrm')
+        d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+        bb.note("adding gsettings postrm scripts to %s" % pkg)
+
+        postrm = d.getVar('pkg_postrm_%s' % pkg) or d.getVar('pkg_postrm')
+        if not postrm:
+            postrm = '#!/bin/sh\n'
+        postrm += d.getVar('gsettings_postinstrm')
+        d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
-- 
2.11.0


