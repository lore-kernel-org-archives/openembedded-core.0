Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 22CC870746
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 07:18:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s717IIwM021896
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Aug 2014 00:18:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 1 Aug 2014 00:18:17 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Aug 2014 15:15:06 +0800
Message-ID: <9360e259384a804353f25dd5891a319099dff5bc.1406876955.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1406876955.git.Chong.Lu@windriver.com>
References: <cover.1406876955.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] oelint.bbclass: make oelint bbclass work
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
X-List-Received-Date: Fri, 01 Aug 2014 07:18:22 -0000
Content-Type: text/plain

Remove LICENSE, MAINTAINER, PRIORITY and valid SECTION checking.
Convert tab indentation into four-space.

[YOCTO #5427]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/classes/oelint.bbclass | 196 ++++++--------------------------------------
 1 file changed, 26 insertions(+), 170 deletions(-)

diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
index f2e7540..1c6f4b8 100644
--- a/meta/classes/oelint.bbclass
+++ b/meta/classes/oelint.bbclass
@@ -1,174 +1,30 @@
 addtask lint before do_fetch
 do_lint[nostamp] = "1"
 python do_lint() {
-	def testVar(var, explain=None):
-		try:
-			s = d[var]
-			return s["content"]
-		except KeyError:
-			bb.error("%s is not set" % var)
-			if explain: bb.note(explain)
-			return None
-
-
-	##############################
-	# Test that DESCRIPTION exists
-	#
-	testVar("DESCRIPTION")
-
-
-	##############################
-	# Test that HOMEPAGE exists
-	#
-	s = testVar("HOMEPAGE")
-	if s=="unknown":
-		bb.error("HOMEPAGE is not set")
-	elif not s.startswith("http://"):
-		bb.error("HOMEPAGE doesn't start with http://")
-
-
-
-	##############################
-	# Test for valid LICENSE
-	#
-	valid_licenses = {
-		"GPL-2"		: "GPLv2",
-		"GPL LGPL FDL"	: True,
-		"GPL PSF"	: True,
-		"GPL/QPL"	: True,
-		"GPL"		: True,
-		"GPLv2"		: True,
-		"IBM"		: True,
-		"LGPL GPL"	: True,
-		"LGPL"		: True,
-		"MIT"		: True,
-		"OSL"		: True,
-		"Perl"		: True,
-		"Public Domain"	: True,
-		"QPL"		: "GPL/QPL",
-		}
-	s = testVar("LICENSE")
-	if s=="unknown":
-		bb.error("LICENSE is not set")
-	elif s.startswith("Vendor"):
-		pass
-	else:
-		try:
-			newlic = valid_licenses[s]
-			if newlic == False:
-				bb.note("LICENSE '%s' is not recommended" % s)
-			elif newlic != True:
-				bb.note("LICENSE '%s' is not recommended, better use '%s'" % (s, newsect))
-		except:
-			bb.note("LICENSE '%s' is not recommended" % s)
-
-
-	##############################
-	# Test for valid MAINTAINER
-	#
-	s = testVar("MAINTAINER")
-	if s=="OpenEmbedded Team <openembedded-devel@openembedded.org>":
-		bb.error("explicit MAINTAINER is missing, using default")
-	elif s and s.find("@") == -1:
-		bb.error("You forgot to put an e-mail address into MAINTAINER")
-
-
-	##############################
-	# Test for valid SECTION
-	#
-	# if Correct section: True	section name is valid
-	#                     False	section name is invalid, no suggestion
-	#                     string	section name is invalid, better name suggested
-	#
-	valid_sections = {
-		# Current Section         Correct section
-		"apps"			: True,
-		"audio"			: True,
-		"base"			: True,
-		"console/games"		: True,
-		"console/net"		: "console/network",
-		"console/network"	: True,
-		"console/utils"		: True,
-		"devel"			: True,
-		"developing"		: "devel",
-		"devel/python"		: True,
-		"fonts"			: True,
-		"games"			: True,
-		"games/libs"		: True,
-		"gnome/base"		: True,
-		"gnome/libs"		: True,
-		"gpe"			: True,
-		"gpe/libs"		: True,
-		"gui"			: False,
-		"libc"			: "libs",
-		"libs"			: True,
-		"libs/net"		: True,
-		"multimedia"		: True,
-		"net"			: "network",
-		"NET"			: "network",
-		"network"		: True,
-		"opie/applets"		: True,
-		"opie/applications"	: True,
-		"opie/base"		: True,
-		"opie/codecs"		: True,
-		"opie/decorations"	: True,
-		"opie/fontfactories"	: True,
-		"opie/fonts"		: True,
-		"opie/games"		: True,
-		"opie/help"		: True,
-		"opie/inputmethods"	: True,
-		"opie/libs"		: True,
-		"opie/multimedia"	: True,
-		"opie/pim"		: True,
-		"opie/setting"		: "opie/settings",
-		"opie/settings"		: True,
-		"opie/Shell"		: False,
-		"opie/styles"		: True,
-		"opie/today"		: True,
-		"scientific"		: True,
-		"utils"			: True,
-		"x11"			: True,
-		"x11/libs"		: True,
-		"x11/wm"		: True,
-		}
-	s = testVar("SECTION")
-	if s:
-		try:
-			newsect = valid_sections[s]
-			if newsect == False:
-				bb.note("SECTION '%s' is not recommended" % s)
-			elif newsect != True:
-				bb.note("SECTION '%s' is not recommended, better use '%s'" % (s, newsect))
-		except:
-			bb.note("SECTION '%s' is not recommended" % s)
-
-		if not s.islower():
-			bb.error("SECTION should only use lower case")
-
-
-
-	
-	##############################
-	# Test for valid PRIORITY
-	#
-	valid_priorities = {
-		"standard"		: True,
-		"required"		: True,
-		"optional"		: True,
-		"extra"			: True,
-		}
-	s = testVar("PRIORITY")
-	if s:
-		try:
-			newprio = valid_priorities[s]
-			if newprio == False:
-				bb.note("PRIORITY '%s' is not recommended" % s)
-			elif newprio != True:
-				bb.note("PRIORITY '%s' is not recommended, better use '%s'" % (s, newprio))
-		except:
-			bb.note("PRIORITY '%s' is not recommended" % s)
-
-		if not s.islower():
-			bb.error("PRIORITY should only use lower case")
-	
+    ##############################
+    # Test that DESCRIPTION exists
+    #
+    s = d.getVar("DESCRIPTION")
+    if s[1:10] == '{SUMMARY}':
+        bb.warn("${PN}: DESCRIPTION is not set")
+
+
+    ##############################
+    # Test that HOMEPAGE exists
+    #
+    s = d.getVar("HOMEPAGE")
+    if s == '':
+        bb.warn("${PN}: HOMEPAGE is not set")
+    elif not s.startswith("http://") and not s.startswith("https://"):
+        bb.warn("${PN}: HOMEPAGE doesn't start with http:// or https://")
+
+
+    ##############################
+    # Test for valid SECTION
+    #
+    s = d.getVar("SECTION")
+    if s == '':
+        bb.warn("${PN}: SECTION is not set")
+    elif not s.islower():
+        bb.warn("${PN}: SECTION should only use lower case")
 }
-- 
1.9.1


