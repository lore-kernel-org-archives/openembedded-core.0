Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 09DC57D43C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 20:56:00 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id E39961C001F;
	Tue,  9 Apr 2019 08:56:00 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 08:55:58 +1200
Message-Id: <20190408205558.11994-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Cc: Nikhil Pal Singh <nikhilpal.singh@taitradio.com>
Subject: [PATCH] cmake: Support Eclipse and other cmake generators
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
X-List-Received-Date: Mon, 08 Apr 2019 20:56:01 -0000

From: Nikhil Pal Singh <nikhilpal.singh@taitradio.com>

As per Generators information mentioned in the cmake --help file
only "Unix Makefiles" and "Ninja" generators are supported as
standard project files.
With this change generic solution can be created for all the other
supported generators such as CodeBlocks, CodeLite, Eclipse CDT4,
KDevelop3, Kate and others for make or Ninja build systems.
It will also give and option to set OECMAKE_GENERATOR in local.conf
file for configuring any specific generators.

Signed-off-by: Nikhil Pal Singh <nikhilpal.singh@taitradio.com>
---
 meta/classes/cmake.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index e16630434e..d3f0d70847 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -10,13 +10,14 @@ OECMAKE_GENERATOR ?= "Ninja"
 
 python() {
     generator = d.getVar("OECMAKE_GENERATOR")
-    if generator == "Unix Makefiles":
-        args = "-G 'Unix Makefiles' -DCMAKE_MAKE_PROGRAM=" + d.getVar("MAKE")
+    if "Unix Makefiles" in generator:
+        args = "-G '" + generator +  "' -DCMAKE_MAKE_PROGRAM=" + d.getVar("MAKE")
         d.setVar("OECMAKE_GENERATOR_ARGS", args)
         d.setVarFlag("do_compile", "progress", "percent")
-    elif generator == "Ninja":
+    elif "Ninja" in generator:
+        args = "-G '" + generator + "' -DCMAKE_MAKE_PROGRAM=ninja"
         d.appendVar("DEPENDS", " ninja-native")
-        d.setVar("OECMAKE_GENERATOR_ARGS", "-G Ninja -DCMAKE_MAKE_PROGRAM=ninja")
+        d.setVar("OECMAKE_GENERATOR_ARGS", args)
         d.setVarFlag("do_compile", "progress", r"outof:^\[(\d+)/(\d+)\]\s+")
     else:
         bb.fatal("Unknown CMake Generator %s" % generator)
-- 
2.17.1


