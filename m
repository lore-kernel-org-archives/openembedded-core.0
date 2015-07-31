Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B902C7647D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VAOHPm019864 for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:24:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 79QJrplOlRaJ
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:24:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VAO17X019857
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:24:13 +0100
Message-ID: <1438338241.22462.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:24:01 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] utils: Handle MLPREFIX in all_multilib_tune_values()
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
X-List-Received-Date: Fri, 31 Jul 2015 10:24:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

MLPREFIX wasn't being set by the function correctly since its
not an overridden value but directly set. Handle this variable
explicitly so the function returns the expected values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 80e90e8..81b92cb 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -360,6 +360,7 @@ def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = '
         localdata = bb.data.createCopy(d)
         overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
+        localdata.setVar("MLPREFIX", item + "-")
         bb.data.update_data(localdata)
         value = localdata.getVar(var, True) or ""
         if value != "":



