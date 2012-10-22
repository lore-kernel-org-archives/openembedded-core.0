Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQEwB-0004sg-1w
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 12:08:47 +0200
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 02:55:21 -0700
Received: by mail-ea0-f197.google.com with SMTP id i1so1814501eaa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=8B5p19FtNI3jjzu7TcTEYGkqwbBBXTWAOhD87C1b5sc=;
	b=GIoOpiubS1W0oHWSu9JrYc/iZGwRe2TDApLR5L+0Qg6Ldo9V0FjMOc8oMgt1JhS/oX
	bsQzsq14K6CciBvf5UIZ0UuTFKDrA2FsuxA9erUWjaoBFnwzTRlKPetKn1UzThsl+Enh
	IlGiwBlu3JmuTVyJJp/QP9l3sO2x6mdX+BOdi5ewVe+gjuZtPDEe0h1DdobZo6pZghkG
	f8m+OBk3uIluH8zZL1QnpUEveoL3NPOKac/b/Ptwj8E69bP1FXU4jVq9qCh+gsO+A7SL
	YszWSgumtdPPIZp5MCpNj7eVmHxIA2dLZAWONlS4HN3Aiualez1R/BDcj3l/d0fY1E3v
	Ew5g==
Received: by 10.180.96.164 with SMTP id dt4mr35603295wib.10.1350899719725;
	Mon, 22 Oct 2012 02:55:19 -0700 (PDT)
Received: by 10.180.96.164 with SMTP id dt4mr35603288wib.10.1350899719625;
	Mon, 22 Oct 2012 02:55:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id m14sm50330591wie.8.2012.10.22.02.55.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:55:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 10:37:26 +0100
Message-Id: <4bb20610fa08a2daf71f59b42929181500345e75.1350898411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <d54dfc8939a32ddde2b861d437dd2bf814d7ce15.1350898411.git.ross.burton@intel.com>
References: <d54dfc8939a32ddde2b861d437dd2bf814d7ce15.1350898411.git.ross.burton@intel.com>
In-Reply-To: <cover.1350898411.git.ross.burton@intel.com>
References: <cover.1350898411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmlyohgT/xePPJ/AgzD2zNux8gLNM6iVpDBF/ds3CuswnaG4lc/KOCg6PtyZFnOd8YdNPyyKELVsAOWsGulwZ/nl+fmpiaouqNXZUs/1h2TBV4CCVN2zIVQYmqM4zB869ebw5ZmapAokR28IZJgL1t2iOnpCe3WdLXEvcxO3FZDCP30/7ln/RjmPfC8m/nGeT7LaekC
Subject: [PATCH 3/3] insane: add a check for Xorg driver ABI dependencies
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
X-List-Received-Date: Mon, 22 Oct 2012 10:08:48 -0000

Now that xserver provides driver ABI names, all drivers should depend on the ABI
version that they have been built against.

All drivers that include xorg-driver-input.inc or xorg-driver-video.inc will get
these automatically, so this should only impact binary drivers.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass |   20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 71a9a58..29b122e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -109,7 +109,7 @@ def package_qa_get_machine_dict():
 
 
 # Currently not being used by default "desktop"
-WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir"
+WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir xorg-driver-abi"
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms dep-cmp"
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
@@ -496,6 +496,24 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     if tmpdir in file_content:
         messages.append("File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d))
 
+
+QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
+def package_qa_check_xorg_driver_abi(path, name, d, elf, messages):
+    """
+    Check that all packages containing Xorg drivers have ABI dependencies
+    """
+
+    # Skip dev, dbg or nativesdk packages
+    if name.endswith("-dev") or name.endswith("-dbg") or name.startswith("nativesdk-"):
+        return
+
+    driverdir = d.expand("${libdir}/xorg/modules/drivers/")
+    if driverdir in path and path.endswith(".so"):
+        for rdep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + name, True) or ""):
+            if rdep.startswith("xorg-abi-"):
+                return
+        messages.append("Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)))
+
 def package_qa_check_license(workdir, d):
     """
     Check for changes in the license files 
-- 
1.7.10



