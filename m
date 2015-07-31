Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CF9587649D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VATp4N020247 for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:29:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GtodynPdGRZ5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:29:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VATZNj020223
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:29:47 +0100
Message-ID: <1438338575.22462.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:29:35 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] multilib_global: Fix PREFERRED_VERSION mapping for gcc-cross-canadian
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
X-List-Received-Date: Fri, 31 Jul 2015 10:29:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Our multilib cross toolchains have <ml_prefix> as a prefix however we
only have a single gcc-cross-canadian for each arch and it is not
prefixed even in the multilib case. We can have two versions of
gcc-cross-canadian, 32 and 64 bit.

This fixes the multilib PREFERRED_VERSION mapping code so that
no prefix is added to the preferred version and therefore the
right versions of gcc-cross-canadian are used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index ed34404..612cfb6 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -30,7 +30,10 @@ def preferred_ml_updates(d):
                 override = ":virtclass-multilib-" + p
                 localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
                 bb.data.update_data(localdata)
-                newname = localdata.expand(v).replace("PREFERRED_VERSION_", "PREFERRED_VERSION_" + p + '-')
+                if "-canadian-" in pkg:
+                    newname = localdata.expand(v)
+                else:
+                    newname = localdata.expand(v).replace("PREFERRED_VERSION_", "PREFERRED_VERSION_" + p + '-')
                 if newname != v:
                     newval = localdata.expand(val)
                     d.setVar(newname, newval)



