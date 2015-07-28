Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4A173761A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6SDN6wD003293 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 14:23:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2CSrkagOiYGs
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 14:23:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6SDMrfQ003265
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 14:23:04 +0100
Message-ID: <1438089773.11208.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 14:22:53 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH 1/4] lib/oe/classextend: Fix nativesdk double name mapping
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
X-List-Received-Date: Tue, 28 Jul 2015 13:23:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Handle the case a name has already been extended in the nativesdk case
(avoids double name extensions which can happen with nativesdk-gcc).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 8da87b7..5107ecd 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -110,6 +110,8 @@ class ClassExtender(object):
 
 class NativesdkClassExtender(ClassExtender):
     def map_depends(self, dep):
+        if dep.startswith(self.extname):
+            return dep
         if dep.endswith(("-gcc-initial", "-gcc", "-g++")):
             return dep + "-crosssdk"
         elif dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('-cross-' in dep) or ('-crosssdk-' in dep):



