Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7DD2C6AC3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 16:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2KGSHSW021282; Fri, 20 Mar 2015 16:28:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4Jbxzml8lDG5; Fri, 20 Mar 2015 16:28:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2KGS3AW021278
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Mar 2015 16:28:15 GMT
Message-ID: <1426868883.29168.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Mar 2015 16:28:03 +0000
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "markus.Lehtonen" <markus.Lehtonen@intel.com>
Subject: [PATCH] scripts/combo-layer: Handle update with no repo/revision specified
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
X-List-Received-Date: Fri, 20 Mar 2015 16:28:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Running an update operation with no repo/revision specified was failing.
This fixes that code path which worked until the change from:

http://git.yoctoproject.org/cgit.cgi/poky/commit/scripts/combo-layer?id=3592507a149b668c0a925e176535f7f2002fa543

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/combo-layer b/scripts/combo-layer
index cbff618..83cfc8e 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -571,12 +571,12 @@ def action_update(conf, args):
         apply the generated patches
     """
     components = [arg.split(':')[0] for arg in args[1:]]
-    revisions = []
+    revisions = {}
     for arg in args[1:]:
-        revision= arg.split(':', 1)[1] if ':' in arg else None
-        revisions.append(revision)
-    # Map commitishes to repos
-    repos = OrderedDict(zip(get_repos(conf, components), revisions))
+        if ':' in arg:
+            a = arg.split(':', 1)
+            revisions[a[0]] = a[1]
+    repos = get_repos(conf, components)
 
     # make sure combo repo is clean
     check_repo_clean(os.getcwd())
@@ -592,7 +592,8 @@ def action_update(conf, args):
     else:
         action_pull(conf, ['arg0'] + components)
 
-    for name, revision in repos.iteritems():
+    for name in repos:
+        revision = revisions.get(name, None)
         repo = conf.repos[name]
         ldir = repo['local_repo_dir']
         dest_dir = repo['dest_dir']



