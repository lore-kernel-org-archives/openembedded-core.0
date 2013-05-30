Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C84C60825
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 12:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id C550011FD5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i+SoEzTDZtjc
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:43 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 9E59811FDA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 8885F1199
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.localdomain (Postfix) with ESMTP id 7B57CA0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 79CBB3405E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r4UCIgsb017045
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r4UCIgwp017044
	for openembedded-core@lists.openembedded.org;
	Thu, 30 May 2013 14:18:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:18:33 +0200
Message-Id: <d3bc55086bd5ab4f56dbad4d302beafc49fe0a84.1369916015.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1369916015.git.pkj@axis.com>
References: <cover.1369916015.git.pkj@axis.com>
In-Reply-To: <cover.1369916015.git.pkj@axis.com>
References: <cover.1369916015.git.pkj@axis.com>
Subject: [PATCH v3 5/5] makedevs: Make count actually behave as a count for device blocks
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
X-List-Received-Date: Thu, 30 May 2013 12:18:43 -0000

Previously count actually behaved as end, and did not take start into
account.
---
 meta/files/device_table-minimal.txt                      | 2 +-
 meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/device_table-minimal.txt b/meta/files/device_table-minimal.txt
index c6e5463..02ed534 100644
--- a/meta/files/device_table-minimal.txt
+++ b/meta/files/device_table-minimal.txt
@@ -13,7 +13,7 @@
 /dev/apm_bios	c	660	0	46	10	134	-	-	-
 /dev/fb0	c	600	0	0	29	0	-	-	-
 /dev/hda	b	660	0	6	3	0	-	-	-
-/dev/hda	b	660	0	6	3	1	1	1	20
+/dev/hda	b	660	0	6	3	1	1	1	19
 /dev/kmem	c	640	0	15	1	2	-	-	-
 /dev/kmsg	c	600	0	0	1	11	-	-	-
 /dev/mem	c	640	0	15	1	1	-	-	-
diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
index 4bb316b..6c1f2fb 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
@@ -219,7 +219,7 @@ static int interpret_table_entry(char *line)
 			dev_t rdev;
 			char buf[80];
 
-			for (i = start; i < count; i++) {
+			for (i = start; i < start + count; i++) {
 				sprintf(buf, "%s%d", name, i);
 				sprintf(path, "%s/%s%d", rootdir, name, i);
 				/* FIXME:  MKDEV uses illicit insider knowledge of kernel 
-- 
1.8.2.1


