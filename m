Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 98BF76098C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 12:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 2873419DC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YmKJq1KEcWcC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from boulder.localdomain (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 7F80219DAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from boulder.localdomain (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 691363B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.localdomain (Postfix) with ESMTP id 5AEBEA24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 590893405E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r4UCIgCB017033
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:18:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r4UCIg5i017032
	for openembedded-core@lists.openembedded.org;
	Thu, 30 May 2013 14:18:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:18:30 +0200
Message-Id: <96e901a9e3cd5047c319233bd7cd904ea5600ae0.1369916015.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1369916015.git.pkj@axis.com>
References: <cover.1369916015.git.pkj@axis.com>
In-Reply-To: <cover.1369916015.git.pkj@axis.com>
References: <cover.1369916015.git.pkj@axis.com>
Subject: [PATCH v3 2/5] makedevs: Correct the device number calculation for blocks of devices
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
X-List-Received-Date: Thu, 30 May 2013 12:18:45 -0000

If the increment > 1 and the start > 0 then the calculation for the
minor device number was incorrect.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
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


