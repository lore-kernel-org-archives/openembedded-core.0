Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TJS5b-00013K-Nn
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 18:46:28 +0200
Received: by pbbro12 with SMTP id ro12so10205612pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=ju+YDD6dEQ+uj0+xqccxj36Ci09eqbW5IhMlyM58gIk=;
	b=T3ZKP+m92qxBPwGslTVw4R7eGBwmHI7ekaHgRY1vXDzEHwxYahGMCW3dVj39JB6hWh
	TJInSZTbH9B2pIBTXf6AljAZmK8GbuihqKCqUCkYO9n7ZCxWF9XTN0FrMaJ/qKszlsqf
	E9jt1Pb7CrucG6AAEo7mBMDpbrx7C8PTDo+R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ju+YDD6dEQ+uj0+xqccxj36Ci09eqbW5IhMlyM58gIk=;
	b=YT/V3F1GAAPk37BDiXB3eFZIaTbT/QQVOUT7PPg7DjCPIl1JEzXyYUSozNAQ5jDaKQ
	HfT557PFM1EfxjsF0Hz7uJZPnU3z0Io9HpDUezMl78u4AsUBhEiaZgBXmXVsyEgODIkS
	qZwO3eyvt0U8T1/TJCBxMJt1NUDmn4m5IrmAYp0/RIG5YKDx2KVRgmG8IcngOqprbJcf
	EbWYc6q+jYm5HtTJ4mJbMOHLoVGSa9ahgCs43c9uio+wk+yR4ZGZew8ax2zwbXgsoiJq
	Ixd2Qg2/42S6Njy8Et/l0Y6ujCm/QMjX0EDtMDPy8neotdnpg7r2lfP2sRfatzjYSdP4
	dRWg==
Received: by 10.68.135.168 with SMTP id pt8mr14648175pbb.24.1349282007232;
	Wed, 03 Oct 2012 09:33:27 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id gv1sm2842463pbc.38.2012.10.03.09.33.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 09:33:26 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 09:33:16 -0700
Message-Id: <1349281996-2252-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkk9n4DP+wWqk5id8wwz96NrMRt8x9Du4i/HgZ8DE5w9yypkHHhI5G6byIQBWlVcisbVQuK
Subject: [PATCH v2] distrodata: Update distrocheck functions
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
X-List-Received-Date: Wed, 03 Oct 2012 16:46:28 -0000

Fix the distro check functions for the change of nativesdk
being a suffix to a prefix. Also added crosssdk as another
case for converting to PN for matching in the distro_tracking

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



