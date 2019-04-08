Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 0ECF77D592
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 21:24:37 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 5E7FD1C001F;
	Tue,  9 Apr 2019 09:24:38 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 09:24:36 +1200
Message-Id: <20190408212436.12812-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190408205558.11994-1-douglas.royds@taitradio.com>
References: <20190408205558.11994-1-douglas.royds@taitradio.com>
Cc: Nikhil Pal Singh <nikhilpal.singh@taitradio.com>
Subject: [PATCH v2] cmake: Support Eclipse and other cmake generators
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
X-List-Received-Date: Mon, 08 Apr 2019 21:24:38 -0000

From: Nikhil Pal Singh <nikhilpal.singh@taitradio.com>

Support project-file generators such as CodeBlocks, CodeLite,
Eclipse, Sublime, and Kate for both make and Ninja build systems.

The following generators are listed in cmake --help:

  Unix Makefiles               = Generates standard UNIX makefiles.
  Ninja                        = Generates build.ninja files.
  Watcom WMake                 = Generates Watcom WMake makefiles.
  CodeBlocks - Ninja           = Generates CodeBlocks project files.
  CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files.
  CodeLite - Ninja             = Generates CodeLite project files.
  CodeLite - Unix Makefiles    = Generates CodeLite project files.
  Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files.
  Sublime Text 2 - Unix Makefiles
                               = Generates Sublime Text 2 project files.
  Kate - Ninja                 = Generates Kate project files.
  Kate - Unix Makefiles        = Generates Kate project files.
  Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files.
  Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files.

All but one of these contain one of the strings, "Unix Makefiles" or "Ninja".
In each of these cases, cmake generates the Makefiles (or ninja files respectively),
and also the appropriate project files, eg. .project and .cproject for Eclipse.

A user can set OECMAKE_GENERATOR in their local.conf to any
one of these strings, except "Watcom WMake" (not supported).

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


