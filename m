Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 4370F78310
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 5D49C2E363;
	Tue, 29 Aug 2017 23:21:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id G1_WZORu4o9R; Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id E29E52E32D;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA7911A0B0;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEB751A0B3;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id A32712198;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLfIC030215;
	Tue, 29 Aug 2017 23:21:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLftB030214;
	Tue, 29 Aug 2017 23:21:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:04 +0200
Message-Id: <132756d2af16aee6df5f1b9f9741b011e9bd2ddc.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 08/25] toaster.bbclass: Simplify parsing of depends.dot
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:44 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

By using a single regular expression, the parsing of the depends.dot
file can be simplified a lot. This should also make it less
susceptible to formatting changes in that file.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/toaster.bbclass | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 296e4764f0..fbf463bbb7 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -270,22 +270,20 @@ python toaster_buildhistory_dump() {
                     images[target][pname.strip()] = {'size':int(psize)*1024, 'depends' : []}
 
             with open("%s/depends.dot" % installed_img_path, "r") as fin:
-                p = re.compile(r' -> ')
-                dot = re.compile(r'.*style=dotted')
+                p = re.compile(r'\s*"(?P<name>[^"]+)"\s*->\s*"(?P<dep>[^"]+)"(?P<rec>.*?\[style=dotted\])?')
                 for line in fin:
-                    line = line.rstrip(';')
-                    linesplit = p.split(line)
-                    if len(linesplit) == 2:
-                        pname = linesplit[0].rstrip('"').strip('"')
-                        dependsname = linesplit[1].split(" ")[0].strip().strip(";").strip('"').rstrip('"')
-                        deptype = "depends"
-                        if dot.match(line):
-                            deptype = "recommends"
-                        if not pname in images[target]:
-                            images[target][pname] = {'size': 0, 'depends' : []}
-                        if not dependsname in images[target]:
-                            images[target][dependsname] = {'size': 0, 'depends' : []}
-                        images[target][pname]['depends'].append((dependsname, deptype))
+                    m = p.match(line)
+                    if not m:
+                        continue
+                    pname = m.group('name')
+                    dependsname = m.group('dep')
+                    deptype = 'recommends' if m.group('rec') else 'depends'
+
+                    if not pname in images[target]:
+                        images[target][pname] = {'size': 0, 'depends' : []}
+                    if not dependsname in images[target]:
+                        images[target][dependsname] = {'size': 0, 'depends' : []}
+                    images[target][pname]['depends'].append((dependsname, deptype))
 
             # files-in-image.txt is only generated if an image file is created,
             # so the file entries ('syms', 'dirs', 'files') for a target will be
-- 
2.12.0


