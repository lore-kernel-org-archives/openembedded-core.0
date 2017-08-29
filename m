Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE9D7830F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 9C4FF2E329;
	Tue, 29 Aug 2017 23:21:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id lxFy1KBSNbSZ; Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id ECA272E337;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDDD81A0B5;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBD691A0B4;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id B06332144;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLfHG030219;
	Tue, 29 Aug 2017 23:21:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLfQE030218;
	Tue, 29 Aug 2017 23:21:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:05 +0200
Message-Id: <3356c14fcb508cf9d63f38582c47173d5a00dcb0.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 09/25] toaster.bbclass: Ignore some dependencies in toaster_buildhistory_dump()
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:45 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

When using RPM, depends.dot may contain dependencies such as
"/bin/sh", which will confuse _toaster_load_pkgdatafile(). Ignore
them. While at it, also ignore dependencies that contain parentheses,
e.g., "libc.so.6(GLIBC_2.7)".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/toaster.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index fbf463bbb7..6cef0b8f6e 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -279,6 +279,14 @@ python toaster_buildhistory_dump() {
                     dependsname = m.group('dep')
                     deptype = 'recommends' if m.group('rec') else 'depends'
 
+                    # If RPM is used for packaging, then there may be
+                    # dependencies such as "/bin/sh", which will confuse
+                    # _toaster_load_pkgdatafile() later on. While at it, ignore
+                    # any dependencies that contain parentheses, e.g.,
+                    # "libc.so.6(GLIBC_2.7)".
+                    if dependsname.startswith('/') or '(' in dependsname:
+                        continue
+
                     if not pname in images[target]:
                         images[target][pname] = {'size': 0, 'depends' : []}
                     if not dependsname in images[target]:
-- 
2.12.0


