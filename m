Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 99BDE77046
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDr4oU007692 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:53:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id O0mrO-daTvZn
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:53:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDqnUn007677
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:53:00 +0100
Message-ID: <1443621169.5162.92.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 14:52:49 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf: Exclude sstate-outputdirs flag from checksums
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
X-List-Received-Date: Wed, 30 Sep 2015 13:53:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This was making deploy tasks MACHINE specific since they place output
into DEPLOY_DIR_IMAGE which contains MACHINE. On the plus side, this
was accidentally ensuring the output was placed for each machine,
on the downside it was triggering a rebuild every time for the different
checksum.

There is a better way to handle this which avoids the rebuild, see
the following tweak to do_deploy to mark it as MACHINE specific
in a different way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index aff2e89..08f34e0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -800,7 +800,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     lockfiles type vardepsexclude vardeps vardepvalue vardepvalueexclude \
     file-checksums python func task export unexport noexec nostamp dirs cleandirs \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
-    recrdeptask nodeprrecs stamp-base stamp-extra-info"
+    recrdeptask nodeprrecs stamp-base stamp-extra-info sstate-outputdirs"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""



