Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id B838760EF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2013 16:30:24 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id q59so1053522wes.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2013 09:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=C1C3JIh2ZSGMRDU7mE5UP7sC8xe5ygcNYFxg5aMM3qk=;
	b=Y5mmGJD1XPyd31IaoFOUXOGto/CcXCtZ5PvfB1QRn24s99gYDCsdWxKgBieDWRCT4y
	heR7OYut4XwBhO+XwcYf7TbcL2MnLzGN/7XZ2FMm5OnW1zF3hwqKqbOeOrU6Wn0J80uU
	D+ofqiK8ikpZQRgi1Y51qZatY009L/MIVUmRllxCuoll2vuBq4POSHlZqSE5cCuLDYCe
	a8wEqAeOJXiZOk3e2mfxpV5tcInYR940c2r4yfLaUrXVKiIKuzUokCJ3wkd/wGISRAAz
	mjfeF24r7VYQLz5jyIp2pqm7ttxZzXlHtmPRxPYPTvkyXg/GMj87lizbDs9XvhQ5yFAW
	rQmw==
X-Gm-Message-State: ALoCoQmnTxjPJ8OB4i4gFUalv9LWNq70GmT0nAC/ZAA3D+j84K3zDPFhqAUX/tGLSA/q/SBniaBh
X-Received: by 10.180.187.2 with SMTP id fo2mr24341162wic.65.1380731425627;
	Wed, 02 Oct 2013 09:30:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id iz19sm5163639wic.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 02 Oct 2013 09:30:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2013 17:30:21 +0100
Message-Id: <1380731421-948-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] license.bbclass: use shutil instead of bb.utils.copyfile
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
X-List-Received-Date: Wed, 02 Oct 2013 16:30:26 -0000

bb.utils.copyfile is for a specific purpose and more complicated than needed
here, so just use shutil.copyfile.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/license.bbclass |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 0160313..6abdae4 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -128,12 +128,14 @@ def add_package_and_files(d):
             d.setVar('RRECOMMENDS_' + pn, "%s" % (pn_lic))
 
 def copy_license_files(lic_files_paths, destdir):
+    import shutil
+
     bb.utils.mkdirhier(destdir)
     for (basename, path) in lic_files_paths:
-        ret = bb.utils.copyfile(path, os.path.join(destdir, basename))
-        # If the copy didn't occur, something horrible went wrong and we fail out
-        if not ret:
-            bb.warn("%s could not be copied for some reason. It may not exist. WARN for now." % path)
+        try:
+            ret = shutil.copyfile(path, os.path.join(destdir, basename))
+        except Exception as e:
+            bb.warn("Could not copy license file %s: %s" % (basename, e))
 
 def find_license_files(d):
     """
-- 
1.7.10.4


