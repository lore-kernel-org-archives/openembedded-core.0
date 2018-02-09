Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C82AE7864B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 09:55:04 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w199t3gp002451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 9 Feb 2018 09:55:04 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ek5OZ-0005Zu-Ei; Fri, 09 Feb 2018 09:55:03 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Feb 2018 09:54:59 +0000
Message-Id: <1518170099-21404-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH] utility-tasks: Drop fetchall and checkuriall tasks
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
X-List-Received-Date: Fri, 09 Feb 2018 09:55:05 -0000

The same thing can now be done with "bitbake <target> --runall=fetch"
or "bitbake <target> --runall=checkuri".

Dropping the tasks takes "bitbake core-image-sato -g" from 22s to 8s
since it no longer has to resolve the recursive dependencies (it
doesn't know if any given target will touch them or not until it
computes them). That is a significant enough win that its worth any
impact this may have on the small number of users using the tasks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utility-tasks.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index 587bfd4..b1f27d3 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -50,17 +50,4 @@ python do_checkuri() {
         bb.fatal(str(e))
 }
 
-addtask checkuriall after do_checkuri
-do_checkuriall[recrdeptask] = "do_checkuriall do_checkuri"
-do_checkuriall[recideptask] = "do_${BB_DEFAULT_TASK}"
-do_checkuriall[nostamp] = "1"
-do_checkuriall() {
-	:
-}
 
-addtask fetchall after do_fetch
-do_fetchall[recrdeptask] = "do_fetchall do_fetch"
-do_fetchall[recideptask] = "do_${BB_DEFAULT_TASK}"
-do_fetchall() {
-	:
-}
-- 
2.7.4


