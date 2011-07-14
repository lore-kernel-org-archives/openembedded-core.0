Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhFWI-0003OI-CX
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 08:35:34 +0200
Received: by iym10 with SMTP id 10so6347206iym.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 23:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WrAV/0p7Cil98gzY4HNqvYcBQMBS/ksuWMalwqwzn6U=;
	b=ZjQv1pzMVwlhF9JH2WLX3Yv/Dy1qsGeqVBD4KrnrKWjYkd/oa7RoeWRnIWrGwYObLu
	uYnupF9wKJsLeDI9y/j189hv6mj1oF49bIbyA8D7dIsd7J5mB14O67bPfJryzrZrOGG+
	embbis6x42S0FVcvFg9P0+LioY7cmNZHW4Jvc=
Received: by 10.42.197.1 with SMTP id ei1mr2026966icb.275.1310625094885;
	Wed, 13 Jul 2011 23:31:34 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id h6sm1508400icy.1.2011.07.13.23.31.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 23:31:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 23:31:20 -0700
Message-Id: <1310625080-30964-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1310625080-30964-1-git-send-email-raj.khem@gmail.com>
References: <1310625080-30964-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] opkg-utils: Print out License field
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jul 2011 06:35:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opkg-utils/opkg-utils/add-license-field.patch  |   39 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    3 +-
 2 files changed, 41 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch
new file mode 100644
index 0000000..0d33459
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch
@@ -0,0 +1,39 @@
+Add knowledge about License field in ipk headers
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: opkg-utils/opkg.py
+===================================================================
+--- opkg-utils.orig/opkg.py	2010-11-01 04:52:35.000000000 -0700
++++ opkg-utils/opkg.py	2011-07-13 15:18:03.900037344 -0700
+@@ -145,6 +145,7 @@
+         self.priority = None
+         self.tags = None
+         self.fn = fn
++        self.license = None
+ 
+         if fn:
+             # see if it is deb format
+@@ -319,6 +320,12 @@
+     def get_section(self, section):
+         return self.section
+ 
++    def set_license(self, license):
++        self.license = license
++
++    def get_license(self, license):
++        return self.license
++
+     def get_file_list(self):
+         if not self.fn:
+             return []
+@@ -425,6 +432,7 @@
+         if self.description: out = out + "Description: %s\n" % (self.description)
+         if self.oe: out = out + "OE: %s\n" % (self.oe)
+         if self.homepage: out = out + "HomePage: %s\n" % (self.homepage)
++        if self.license: out = out + "License: %s\n" % (self.license)
+         if self.priority: out = out + "Priority: %s\n" % (self.priority)
+         if self.tags: out = out + "Tags: %s\n" % (self.tags)
+         out = out + "\n"
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
index 897fe11..fd2b5e6 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
@@ -8,11 +8,12 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
            file://index-ignore-filenotfound.patch \
            file://mtime-int.patch \
+           file://add-license-field.patch \
            "
 
 S = "${WORKDIR}/opkg-utils"
-- 
1.7.4.1



