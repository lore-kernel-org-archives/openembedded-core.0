Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A645365FFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NEuVEN025781 for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 15:56:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YlQPbLt4sKHh
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 15:56:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NEuS7w025769
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 15:56:30 +0100
Message-ID: <1411484191.15825.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 15:56:31 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] oe-init-build-env-memres: Fix automatic port usage
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
X-List-Received-Date: Tue, 23 Sep 2014 14:56:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The use of an automatic port wasn't working correctly since the server
was never getting started when port == -1. This fixes things so the
server is started when port is not specified (i.e. automatic) ensuring 
this happens before BBSERVER is set.

[YOCTO #6563]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
index 0007998..9b9e0f4 100755
--- a/oe-init-build-env-memres
+++ b/oe-init-build-env-memres
@@ -60,14 +60,14 @@ if [ -e bitbake.lock ] && grep : bitbake.lock > /dev/null ; then
     res=$?
 fi
 
+if [ $res != 0 ] ; then
+    bitbake --server-only -t xmlrpc -B localhost:$port
+fi
+
 if [ $port = -1 ] ; then
     export BBSERVER=localhost:-1
     echo "Bitbake server started on demand as needed, use bitbake -m to shut it down"
 else
-    if [ $res != 0 ] ; then
-	bitbake --server-only -t xmlrpc -B localhost:$port
-    fi
-
     export BBSERVER=`cat bitbake.lock`
 
     if [ $res = 0 ] ; then



