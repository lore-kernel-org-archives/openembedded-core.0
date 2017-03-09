Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1748B774D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 22:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MHiwT030282; Thu, 9 Mar 2017 22:17:44 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kf0f03LvqFd8; Thu,  9 Mar 2017 22:17:44 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MHdXs030267
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Mar 2017 22:17:40 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cm6NP-00055q-Gz; Thu, 09 Mar 2017 22:17:39 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 22:17:33 +0000
Message-Id: <1489097854-19523-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489097854-19523-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1489097854-19523-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/5] quilt: Don't add hardcoded links to utilities
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
X-List-Received-Date: Thu, 09 Mar 2017 22:17:45 -0000

This triggers warnings about absolute symlink paths with the PATH changes.
In reality we simply don't need/care about these so just remove/disable
them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/quilt/quilt.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 9cf7bac..85aaf8d 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -35,6 +35,11 @@ EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
 
+# Don't setup symlinks to host utilities, we don't need them
+do_configure_append () {
+	sed -e 's,^COMPAT_SYMLINKS.*:=.*,COMPAT_SYMLINKS	:=,' -i ${S}/Makefile
+}
+
 # quilt ignores DESTDIR
 do_install () {
 	oe_runmake ${EXTRA_OE_MAKE_ARGS} install
-- 
2.7.4


