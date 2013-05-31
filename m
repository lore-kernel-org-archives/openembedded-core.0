Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D69E60959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 11:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 275891204E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 13:37:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TpAaDqzHf-t8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 13:37:11 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 8AA2E34962E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 13:37:02 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 751C6AF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 13:37:02 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.localdomain (Postfix) with ESMTP id 69F9A9DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 13:37:02 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 684573E06D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 13:37:02 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r4VBb2ll020866
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 13:37:02 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r4VBb2dQ020865
	for openembedded-core@lists.openembedded.org;
	Fri, 31 May 2013 13:37:02 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 13:36:49 +0200
Message-Id: <2831cdfb534e4a2d07a02b028a5879503a4c6168.1370000176.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1370000176.git.pkj@axis.com>
References: <cover.1370000176.git.pkj@axis.com>
In-Reply-To: <cover.1370000176.git.pkj@axis.com>
References: <cover.1370000176.git.pkj@axis.com>
Subject: [PATCH v4 5/5] makedevs: Make count actually behave as a count for device blocks
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
X-List-Received-Date: Fri, 31 May 2013 11:37:11 -0000

Previously count actually behaved as end, and did not take start into
account.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
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


