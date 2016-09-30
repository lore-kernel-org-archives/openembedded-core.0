Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2314A6FF9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8UGhbBP021799; Fri, 30 Sep 2016 17:43:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 59nfmu-mQ4FA; Fri, 30 Sep 2016 17:43:37 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8UGhYZ4021792
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 30 Sep 2016 17:43:35 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1bq0uM-0007Cv-G7; Fri, 30 Sep 2016 17:43:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 17:43:26 +0100
Message-Id: <1475253808-27642-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475253808-27642-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1475253808-27642-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/7] boost: Ensure native recipes have consistent checksums
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
X-List-Received-Date: Fri, 30 Sep 2016 16:43:39 -0000

When building boost-native on i686, the x86 override isn't applied
unless the target also happens to be x86. Similarly the x86_64 override
is only applied on 64 bit target machines.

Avoid various problems by removing the new problematic configure options
in the native case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 7637a4e..ef16533 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -32,6 +32,8 @@ BOOST_LIBS = "\
 BOOST_LIBS_append_x86 = " context coroutine"
 BOOST_LIBS_append_x86-64 = " context coroutine"
 BOOST_LIBS_append_powerpc = " context coroutine"
+# need consistent settings for native builds (x86 override not applied for native)
+BOOST_LIBS_remove_class-native = " context coroutine"
 
 # optional libraries
 PACKAGECONFIG ??= "locale"
-- 
2.7.4


