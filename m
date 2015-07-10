Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6243C607BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 13:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6ADArk0010675 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:11:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 87fA8EjpSWP7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:11:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6ADBGRJ010749
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:11:28 +0100
Message-ID: <1436533876.3310.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 14:11:16 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: lib/oe/recipeutils: Ensure order of data store doesn't influence the result
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
X-List-Received-Date: Fri, 10 Jul 2015 13:11:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The order of the keys from the data store is not prescribed. If
target_datadir comes before datadir the selftests fail since the 'wrong'
variable is used for substitutions. This highlights an issue with the
replace_dir_vars() function. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index d8094c8..ccec2a1 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -620,7 +620,7 @@ def replace_dir_vars(path, d):
     for var in d:
         if var.endswith('dir') and var.lower() == var:
             value = d.getVar(var, True)
-            if value.startswith('/') and not '\n' in value:
+            if value.startswith('/') and not '\n' in value and value not in dirvars:
                 dirvars[value] = var
     for dirpath in sorted(dirvars.keys(), reverse=True):
         path = path.replace(dirpath, '${%s}' % dirvars[dirpath])



