Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 71F41601AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 13:05:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JDBdsf022922 for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 14:11:39 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Dplp0cOnn2jy
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 14:11:39 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JDBaaG022918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 14:11:38 +0100
Message-ID: <1371647117.20823.182.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2013 14:05:17 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] utility-tasks: Add recideptask flag for fetchall/checkuriall
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
X-List-Received-Date: Wed, 19 Jun 2013 13:05:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

See the bitbake commit adding the recideptask flag for details of the
problem but in summary, we weren't seeing the [depends] of tasks like
do_rootfs being taking into account for fetchall. This was leading
to not all sources being fetched and this is the OE-Core part of the
fix for this problem.

BB_DEFAULT_TASK is the default task used since this is the one that
most commands would end up targeting and is how users expect the command
to behave.

[YOCTO #4597]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
index 16c4bf2..5a1cb33 100644
--- a/meta/classes/prexport.bbclass
+++ b/meta/classes/prexport.bbclass
@@ -55,4 +55,4 @@ python prexport_handler () {
 }
 
 addhandler prexport_handler
-prexport_handler bb.event.RecipeParsed bb.event.ParseStarted bb.event.ParseCompleted"
+prexport_handler[eventmask] = "bb.event.RecipeParsed bb.event.ParseStarted bb.event.ParseCompleted"
diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index bb26eb7..507e0f1 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -48,6 +48,7 @@ python do_checkuri() {
 
 addtask checkuriall after do_checkuri
 do_checkuriall[recrdeptask] = "do_checkuriall do_checkuri"
+do_checkuriall[recideptask] = "do_${BB_DEFAULT_TASK}"
 do_checkuriall[nostamp] = "1"
 do_checkuriall() {
 	:
@@ -55,6 +56,7 @@ do_checkuriall() {
 
 addtask fetchall after do_fetch
 do_fetchall[recrdeptask] = "do_fetchall do_fetch"
+do_fetchall[recideptask] = "do_${BB_DEFAULT_TASK}"
 do_fetchall() {
 	:
 }



