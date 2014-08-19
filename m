Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3B30465DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 12:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JChL3K005080 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:43:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id u97J8AnfKrsc
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:43:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JChHKm005075
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:43:18 +0100
Message-ID: <1408452198.1669.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Aug 2014 13:43:18 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] Disable runtime mapping of RPROVIDES/RCONFLICTS/RREPLACES
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
X-List-Received-Date: Tue, 19 Aug 2014 12:43:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It doesn't really make sense to run the remapping code on these
variables. If specific renaming is needed, it should be applied
manually. This means that the debian RPROVIDES of the original package
name can be preserved. There was also a bug report about this on the
OE-Core mailing list recently where someone else ran into this problem
too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6a552d9..88793fa 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2029,7 +2029,4 @@ def mapping_rename_hook(d):
     runtime_mapping_rename("RDEPENDS", pkg, d)
     runtime_mapping_rename("RRECOMMENDS", pkg, d)
     runtime_mapping_rename("RSUGGESTS", pkg, d)
-    runtime_mapping_rename("RPROVIDES", pkg, d)
-    runtime_mapping_rename("RREPLACES", pkg, d)
-    runtime_mapping_rename("RCONFLICTS", pkg, d)
 



