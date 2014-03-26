Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 92FE36EEF3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:33:08 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2Q9X38X005804 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:33:03 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6IAwFnvWGD_c
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:33:03 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2Q9WwBn005800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:33:00 GMT
Message-ID: <1395826372.24890.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 09:32:52 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [RFC PATCH 3/3] base.bbclass: Add detection/sanity check of non-global class inheritance
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
X-List-Received-Date: Wed, 26 Mar 2014 09:33:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Users are doing things like inheriting bootimg in local.conf and not understanding
that there are two types of class, "global" classes and "recipe" classes. This
patch starts to markup the recipe classes to tell the user when they're including
a "recipe" class in global context by mistake.

RFC: Only one class has markup here but we could go through them and mark the "recipe"
classes accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 360b112..08617e8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -295,6 +295,9 @@ python base_eventhandler() {
         preferred_ml_updates(e.data)
         oe.utils.features_backfill("DISTRO_FEATURES", e.data)
         oe.utils.features_backfill("MACHINE_FEATURES", e.data)
+        nonglobalclasses = e.data.getVar("NONGLOBALBBCLASS", True)
+        if nonglobalclasses:
+            bb.error("The following classes were inserted into the global namespace but are not designed for use like this. Please inherit them in the appropriate recipe instead: %s" % nonglobalclasses)
 
     if isinstance(e, bb.event.BuildStarted):
         localdata = bb.data.createCopy(e.data)
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index b13eef9..1562408 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -4,6 +4,8 @@
 # Creates a bootable image using syslinux, your kernel and an optional
 # initrd
 
+NONGLOBALBBCLASS += "bootimg"
+
 #
 # End result is two things:
 #



