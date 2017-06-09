Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id CB02978312
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 19:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id CBD152E6BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Cf9ez9HnPmLh
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:43 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id D48C42E6DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FE061E07C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8533A1E07A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 79B3C2C15
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v59JYgUD010979
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Jun 2017 21:34:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v59JYgEV010978
	for openembedded-core@lists.openembedded.org;
	Fri, 9 Jun 2017 21:34:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 21:34:29 +0200
Message-Id: <d4c6e79893728c36fc745036a2295b5ded653a14.1497036762.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497036762.git.pkj@axis.com>
References: <cover.1497036762.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 07/13] toaster.bbclass: Ignore some dependencies in toaster_buildhistory_dump()
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
X-List-Received-Date: Fri, 09 Jun 2017 19:34:45 -0000

When using RPM, depends.dot may contain dependencies such as
"/bin/sh", which will confuse _toaster_load_pkgdatafile(). Ignore
them. While at it, also ignore dependencies that contain parentheses,
e.g., "libc.so.6(GLIBC_2.7)".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
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


