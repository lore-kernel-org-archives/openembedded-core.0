Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BA0416010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 19:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2UJti9L023415 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 20:55:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1RwhCZJ6kfFq
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 20:55:44 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2UJtgak023403
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 20:55:43 +0100
Message-ID: <1459367742.21672.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 20:55:42 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] sanity.bbclass: Use pythonexception to raise real exceptions without backtraces
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
X-List-Received-Date: Wed, 30 Mar 2016 19:55:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If the sanity code encounters a version change is doesn't understand, the current
output is unreadable and confusing for the user, particularly due to the presence 
of the backtrace.

Use improved functionality in bitbake to improve this and correctly pass python 
exceptions around.

[YOCTO #9291]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a400bca..662f764 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -563,10 +563,10 @@ def sanity_check_conffiles(status, d):
                 d.getVar(current_version, True) != d.getVar(required_version, True):
             success = True
             try:
-                bb.build.exec_func(func, d)
+                bb.build.exec_func(func, d, pythonexception=True)
             except NotImplementedError as e:
                 success = False
-                status.addresult(e.msg)
+                status.addresult(str(e))
             if success:
                 status.reparse = True
 
-- 
cgit v0.10.2


