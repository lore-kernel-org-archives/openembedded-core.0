Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D5623758D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 22:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5BM239E001330 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:02:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id odpoU0ZDbuW4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:02:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5BM1mfk001327
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:01:59 +0100
Message-ID: <1434060108.28975.240.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 23:01:48 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] multilib_global: Stop empty space influencing RPROVIDES
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
X-List-Received-Date: Thu, 11 Jun 2015 22:02:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If the resulting RPROVIDES is empty, don't set it. This streamlines
pkgdata slightly removing empty values and avoids other errors which
confuse the datastore when the variable is best left unset.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 8ea2a5a..67bd70d 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -142,7 +142,8 @@ python multilib_virtclass_handler_global () {
             origrprovs = rprovs = e.data.getVar("RPROVIDES", True) or ""
             for clsextend in clsextends:
                 rprovs = rprovs + " " + clsextend.map_variable("RPROVIDES", setvar=False)
-            e.data.setVar("RPROVIDES", rprovs)
+            if rprovs.strip():
+                e.data.setVar("RPROVIDES", rprovs)
 
 	    # Process RPROVIDES_${PN}...
             for pkg in (e.data.getVar("PACKAGES", True) or "").split():



