Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB257769A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v23BG8xM003827; Fri, 3 Mar 2017 11:16:08 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id m7cWMpNyoxuk; Fri,  3 Mar 2017 11:16:08 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v23BG6Pf003814
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Mar 2017 11:16:07 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cjlBu-0005bU-Og; Fri, 03 Mar 2017 11:16:06 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 11:16:02 +0000
Message-Id: <1488539763-21490-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488539763-21490-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488539763-21490-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/4] populate_ext_sdk: Append to SSTATE_MIRRORS
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
X-List-Received-Date: Fri, 03 Mar 2017 11:16:10 -0000

We need to appent to SSTATE_MIRRORS in case other areas of code are also
setting the variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 51b98a8..fb38ebc 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -312,7 +312,7 @@ python copy_buildsystem () {
             f.write('BUILDCFG_HEADER = ""\n\n')
 
             # Map gcc-dependent uninative sstate cache for installer usage
-            f.write('SSTATE_MIRRORS = "file://universal/(.*) file://universal-4.9/\\1\\nfile://universal-4.9/(.*) file://universal-4.8/\\1"\n\n')
+            f.write('SSTATE_MIRRORS += " file://universal/(.*) file://universal-4.9/\\1 file://universal-4.9/(.*) file://universal-4.8/\\1"\n\n')
 
             # Allow additional config through sdk-extra.conf
             fn = bb.cookerdata.findConfigFile('sdk-extra.conf', d)
-- 
2.7.4


