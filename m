Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TJRwe-0000n7-5D
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 18:37:12 +0200
Received: by pbbro12 with SMTP id ro12so10196430pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=5q8DhTGouJfJUT+n1vYDV34/wRjxHaxhNLCIlt9bPCI=;
	b=Q0YHdYuEormJR9NJJ2Ew6qdI2XxwoaBYoy+yHvlm1Dts+xBxoaMdf2n4mhJaN51VB9
	Irg4Zy+6gTUj7+aD+zqaGohqC+Xq23j7CA7IpYYfRYeJmTBsIK1GN9wVGJIJlW5IesLI
	SdzGccDGo1CsG9iCxMXnfBanECPkUslsRY4DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=5q8DhTGouJfJUT+n1vYDV34/wRjxHaxhNLCIlt9bPCI=;
	b=GTkSJR7Fe3gNin9xk7fiOQngZTu0RqwIls5pjmJWUW+P3uOkSv7UuxlfaQwOasoHeN
	5C04gXjAPl53DCicX6Qp4evKx4YoHcFC5Rkxf1TZ96uCuyjtOeh7qdZq8VZi6gFGh+9f
	Moxx6qPiWVUlLgT9pcM2E7RDaz8wxeqMmjnb2rCaWzCD+O2sYjZmO72bU/exM1M2SnqU
	uXFvtEw+l7B1pf9q2KBhq6ndawXd3QK/JpgLXU2CCazBOE825WC9gCfJx+6lGGRMns7G
	/CGLSYQyATQfN/heG6ULUuu2fz2TsDeapl8IdRULv7DApCTYBjzjHh+GgLloN7tuacDd
	t61w==
Received: by 10.68.130.67 with SMTP id oc3mr14363626pbb.18.1349281451608;
	Wed, 03 Oct 2012 09:24:11 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id gf8sm2828318pbc.52.2012.10.03.09.24.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 09:24:10 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 09:24:01 -0700
Message-Id: <1349281441-1534-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQl9wxr6xwZdDxySyItWR3B5lsWsRAMNKUbUCxEJycnyOd9VUEs8cjbEOXE5zXvbcwM0OmuB
Subject: [PATCH] distrodata: Update distrocheck functions for nativesdk- change
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
X-List-Received-Date: Wed, 03 Oct 2012 16:37:12 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/distrodata.bbclass |   25 +++++++++++++++++++------
 meta/lib/oe/distro_check.py     |    6 ++++++
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 945ff53..69bcc35 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -33,12 +33,6 @@ python do_distrodata_np() {
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
             bb.data.update_data(localdata)
 
-        if pn.find("nativesdk-") != -1:
-            pnstripped = pn.replace("nativesdk-", "")
-            bb.note("Native Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
-            bb.data.update_data(localdata)
-
         if pn.find("-cross") != -1:
             pnstripped = pn.split("-cross")
             bb.note("cross Split: %s" % pnstripped)
@@ -51,6 +45,13 @@ python do_distrodata_np() {
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
             bb.data.update_data(localdata)
 
+        if pn.startswith("nativesdk-"):
+            pnstripped = pn.replace("nativesdk-", "")
+            bb.note("NativeSDK Split: %s" % pnstripped)
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
+            bb.data.update_data(localdata)
+
+
         if pn.find("-initial") != -1:
             pnstripped = pn.split("-initial")
             bb.note("initial Split: %s" % pnstripped)
@@ -119,12 +120,24 @@ python do_distrodata() {
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
             bb.data.update_data(localdata)
 
+        if pn.startswith("nativesdk-"):
+            pnstripped = pn.replace("nativesdk-", "")
+            bb.note("NativeSDK Split: %s" % pnstripped)
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
+            bb.data.update_data(localdata)
+
         if pn.find("-cross") != -1:
             pnstripped = pn.split("-cross")
             bb.note("cross Split: %s" % pnstripped)
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
             bb.data.update_data(localdata)
 
+        if pn.find("-crosssdk") != -1:
+            pnstripped = pn.split("-crosssdk")
+            bb.note("cross Split: %s" % pnstripped)
+            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+            bb.data.update_data(localdata)
+
         if pn.find("-initial") != -1:
             pnstripped = pn.split("-initial")
             bb.note("initial Split: %s" % pnstripped)
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 455135e..ad13d5e 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -288,6 +288,12 @@ def compare_in_distro_packages_list(distro_check_dir, d):
         bb.data.update_data(localdata)
         recipe_name = pnstripped[0]
 
+    if pn.startswith("nativesdk-"):
+        pnstripped = pn.split("nativesdk-")
+        localdata.setVar('OVERRIDES', "pn-" + pnstripped[1] + ":" + d.getVar('OVERRIDES', True))
+        bb.data.update_data(localdata)
+        recipe_name = pnstripped[1]
+
     if pn.find("-cross") != -1:
         pnstripped = pn.split("-cross")
         localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
-- 
1.7.9.5



