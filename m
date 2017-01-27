Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 04CB577459
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 17:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHgEjA019772; Fri, 27 Jan 2017 17:42:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id czu90dbJGqt1; Fri, 27 Jan 2017 17:42:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHg9lw019762
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 27 Jan 2017 17:42:10 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cXAXJ-0001WU-Ml; Fri, 27 Jan 2017 17:42:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 17:42:04 +0000
Message-Id: <1485538927-5797-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485538927-5797-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485538927-5797-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/7] sstate: Allow sstate_clean_manifest to take a prefix
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
X-List-Received-Date: Fri, 27 Jan 2017 17:42:18 -0000

Manifest files containing the same duplicated prefix are wasteful on space
and ultimately this costs build time. Add support for manifest files with
common prefixes removed and use the prefix if the path isn't absolute.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0fdeb9d..31789da 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -426,7 +426,7 @@ def sstate_clean_cachefiles(d):
         ss = sstate_state_fromvars(ld, task)
         sstate_clean_cachefile(ss, ld)
 
-def sstate_clean_manifest(manifest, d):
+def sstate_clean_manifest(manifest, d, prefix=None):
     import oe.path
 
     mfile = open(manifest)
@@ -435,6 +435,8 @@ def sstate_clean_manifest(manifest, d):
 
     for entry in entries:
         entry = entry.strip()
+        if prefix and not entry.startswith("/"):
+            entry = prefix + "/" + entry
         bb.debug(2, "Removing manifest: %s" % entry)
         # We can race against another package populating directories as we're removing them
         # so we ignore errors here.
-- 
2.7.4


