Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E55AC6BF5C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 14:43:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86EuOPW024695 for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Sep 2013 15:56:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id f3wTwavU7N6Z
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 15:56:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86EuLd9024691
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Sep 2013 15:56:23 +0100
Message-ID: <1378478579.3484.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 06 Sep 2013 15:42:59 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] lib/oeqa/qemurunner: Use a timeout in select() call
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
X-List-Received-Date: Fri, 06 Sep 2013 14:43:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

A 0 value to select.select() immediately returns with no timeout. This was
pegging the cpu at 100% for the python process which was bad and may be
contributing to some of the timeout problems.

Profile from -P of a core-image-minimal before:

    97526792 function calls (97525652 primitive calls) in 45.189 seconds

and after:

       50204 function calls (49064 primitive calls) in 17.318 seconds

Saving 97.5 million function calls has to be good :)

(From OE-Core rev: a572348c7ec1eb82fa2e5c977b27c24b4a9b29a1)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index e7bd8b1..f837800 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -101,7 +101,7 @@ class QemuRunner:
             reachedlogin = False
             stopread = False
             while time.time() < endtime and not stopread:
-                sread, swrite, serror = select.select(socklist, [], [], 0)
+                sread, swrite, serror = select.select(socklist, [], [], 0.1)
                 for sock in sread:
                     if sock is self.server_socket:
                         self.qemusock, addr = self.server_socket.accept()



