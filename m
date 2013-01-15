Received: from mail-ie0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvDH8-0000GB-M6
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:38:35 +0100
Received: by mail-ie0-f178.google.com with SMTP id c12so1049698ieb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 12:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=dMIx7X/1M4IF0ChJ/kCMrCggG1+QDciVYx2s6Evl4k8=;
	b=OSUkEJFMtVG+2174oKdD79TaT929yLA4oC9j5rcZOKYaT3CmVXsC+/d+plUTFNxdsP
	QfAhgVqvhpXWN2dup1Bl/YOanq6wfEN+ljwJrzBk+PGObsgEN1FXVGnz6MRRl0p0SvO7
	BAB/qsGHtQByqt4l7JqKlfNz91mAnU3GxIARhxnQgVx9xrlasQTEE9IScs8XR9qge55o
	FAEoyPqVOXp7i0K8JQFF+nO6/r2J1ahosvimxpP1TR1LzSSvJdy03o9ImKpS0EkZM1ZF
	zB8WVBii4hGAekdeP6n36MZruEMFJot0GISb1B189up8fRMaD70tAu0FjVG4k4vayq9y
	+K8A==
X-Received: by 10.50.88.168 with SMTP id bh8mr2790698igb.71.1358281385298;
	Tue, 15 Jan 2013 12:23:05 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id qn10sm2655187igc.15.2013.01.15.12.23.02
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 12:23:04 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 13:22:48 -0700
Message-Id: <15719a0894a4a514d5cad911198ac789524dcfc3.1358281118.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0.3
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/6] license.bbclass: cleanly handle invalid licenses in incompatible_license
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
X-List-Received-Date: Tue, 15 Jan 2013 20:38:37 -0000

From: Christopher Larson <chris_larson@mentor.com>

This gives us an error message (bb.fatal) rather than a traceback due to the
uncaught LicenseError.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/license.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index cfb816d..cd18e19 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -237,7 +237,10 @@ def incompatible_license(d, dont_want_licenses, package=None):
     def choose_lic_set(a, b):
         return a if all(license_ok(lic) for lic in a) else b
 
-    licenses=oe.license.flattened_licenses(license, choose_lic_set)
+    try:
+        licenses = oe.license.flattened_licenses(license, choose_lic_set)
+    except oe.license.LicenseError as exc:
+        bb.fatal('%s: %s' % (d.getVar('P', True), exc))
     return any(not license_ok(l) for l in licenses)
 
 def check_license_flags(d):
-- 
1.8.0.3



