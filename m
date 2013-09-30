Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6D56CAD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 21:53:49 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8ULrjdT027958 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 22:53:45 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Sj5S2Jcqa-ZD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 22:53:45 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8ULrfoi027955
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 22:53:42 +0100
Message-ID: <1380578017.18603.467.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Sep 2013 22:53:37 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] pseudo: Fix race problems
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
X-List-Received-Date: Mon, 30 Sep 2013 21:53:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is a potential issue with the fastop code in pseudo since a process may
exit and allow some other function to run before the server has processed
the commands run by the process. Issues have been see with unpredictable
file permissions.

To avoid this, we ping the server before exiting which guarantees it has
processed the current command queue.

The patch was written by peter.seebach@windriver.com

[YOCTO #5132]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/pseudo/files/shutdownping.patch b/meta/recipes-devtools/pseudo/files/shutdownping.patch
new file mode 100644
index 0000000..8af8e0b
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/shutdownping.patch
@@ -0,0 +1,53 @@
+There is a potential issue with the fastop code in pseudo since a process may
+exit and allow some other function to run before the server has processed
+the commands run by the process. Issues have been see with unpredictable
+file permissions.
+
+To avoid this, we ping the server before exitting which guarantees it has
+processed the current command queue.
+
+Debugged-by: RP
+Fix written by peter.seebach@windriver.com
+
+Upstream-Status: Submitted
+
+[YOCTO #5132]
+
+diff --git a/pseudo_client.c b/pseudo_client.c
+index f58ce4c..20943b6 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -75,6 +75,9 @@ static int nfds = 0;
+ static int messages = 0;
+ static struct timeval message_time = { .tv_sec = 0 };
+ static int pseudo_inited = 0;
++
++static int sent_messages = 0;
++
+ int pseudo_nosymlinkexp = 0;
+ 
+ /* note: these are int, not uid_t/gid_t, so I can use 'em with scanf */
+@@ -711,6 +714,11 @@ client_ping(void) {
+ 	return 0;
+ }
+ 
++static void
++void_client_ping(void) {
++	client_ping();
++}
++
+ int
+ pseudo_fd(int fd, int how) {
+ 	int newfd;
+@@ -1043,6 +1051,11 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
+ 	/* disable wrappers */
+ 	pseudo_antimagic();
+ 
++	if (!sent_messages) {
++		sent_messages = 1;
++		atexit(void_client_ping);
++	}
++
+ 	if (op == OP_RENAME) {
+ 		va_list ap;
+ 		va_start(ap, buf);
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
index c5df919..bc92856 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
@@ -5,6 +5,7 @@ PR = "r4"
 SRC_URI = " \
     http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
     file://0001-pseudo_has_unload-add-function.patch \
+    file://shutdownping.patch \
 "
 
 SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"



