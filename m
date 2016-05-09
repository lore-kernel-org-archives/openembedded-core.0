Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2727870031
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 13:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u49DCMYW016193 for <openembedded-core@lists.openembedded.org>;
	Mon, 9 May 2016 14:12:22 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ewybE8OD1NTB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 14:12:22 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u49DCGnS016184
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 May 2016 14:12:17 +0100
Message-ID: <1462799536.21831.140.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 09 May 2016 14:12:16 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] update-alternatives: Fix determinism issue
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
X-List-Received-Date: Mon, 09 May 2016 13:12:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

getVarFlags returns a dict and there is therefore no sort order. This
means the order of the X_VARDEPS_X variables can change and hence the 
task checksums can change. This can lead to rebuilds of any parts of 
the system using update-alternatives and their dependees. This is a
particular issue under python v3.

Add in a sort to make the order of the variables deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 70a8185..1fdd681 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -71,14 +71,14 @@ def gen_updatealternativesvardeps(d):
 
     # First compute them for non_pkg versions
     for v in vars:
-        for flag in (d.getVarFlags(v) or {}):
+        for flag in sorted((d.getVarFlags(v) or {}).keys()):
             if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
                 continue
             d.appendVar('%s_VARDEPS' % (v), ' %s:%s' % (flag, d.getVarFlag(v, flag, False)))
 
     for p in pkgs:
         for v in vars:
-            for flag in (d.getVarFlags("%s_%s" % (v,p)) or {}):
+            for flag in sorted((d.getVarFlags("%s_%s" % (v,p)) or {}).keys()):
                 if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
                     continue
                 d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s_%s' % (v,p), flag, False)))
-- 
cgit v0.10.2


