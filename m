Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2A7BC6FDD6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 12:32:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4UCVsu4006542 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 13:32:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lii7kX-dyVOW
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 13:32:01 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4UCVthF006536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 13:31:56 +0100
Message-ID: <1401453107.31309.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 30 May 2014 13:31:47 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] classextend: Fix crosssdk remapping for multilib
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
X-List-Received-Date: Fri, 30 May 2014 12:32:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Multilib builds only require one crosssdk toolchain. We therefore shouldn't
be remapping crosssdk names. This resolves build failures looking for
weird multilib crosssdk toolchains.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 14d6f20a..71c7759 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -9,6 +9,8 @@ class ClassExtender(object):
             return name
         if name.startswith("rtld"):
             return name
+        if name.endswith("-crosssdk"):
+            return name
         if name.endswith("-" + self.extname):
             name = name.replace("-" + self.extname, "")
         if name.startswith("virtual/"):



