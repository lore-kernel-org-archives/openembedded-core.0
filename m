Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 5003F6A61B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 14:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 1D6D719D0A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vyBMNvnsrpMu
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:16 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id A106519D05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:15 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 8AC20371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:15 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.localdomain (Postfix) with ESMTP id 7D164827
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:15 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 7B52C3405E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:15 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r4TEuFGt028543
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:56:15 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r4TEuF53028542
	for openembedded-core@lists.openembedded.org;
	Wed, 29 May 2013 16:56:15 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2013 16:55:58 +0200
Message-Id: <e95c7006a8e02ae0394f0057877407a486641046.1369839249.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1369839249.git.pkj@axis.com>
References: <cover.1369839249.git.pkj@axis.com>
In-Reply-To: <cover.1369839249.git.pkj@axis.com>
References: <cover.1369839249.git.pkj@axis.com>
Subject: [PATCH 2/4] makedevs: Correct the device number calculation for blocks of devices
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
X-List-Received-Date: Wed, 29 May 2013 14:56:19 -0000

If the increment > 1 and the start > 0 then the calculation for the
minor device number was incorrect.
---
 meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
index 247d6c1..d58e891 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
@@ -226,7 +226,7 @@ static int interpret_table_entry(char *line)
 				sprintf(path, "%s/%s%d", rootdir, name, i);
 				/* FIXME:  MKDEV uses illicit insider knowledge of kernel 
 				 * major/minor representation...  */
-				rdev = MKDEV(major, minor + (i * increment - start));
+				rdev = MKDEV(major, minor + (i - start) * increment);
 				add_new_device(buf, path, uid, gid, mode, rdev);
 			}
 		} else {
-- 
1.8.2.1


