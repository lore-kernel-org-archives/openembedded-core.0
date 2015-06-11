Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8C760670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 22:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5BM7AiY001432 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:07:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wg1HLgScZ5Nw
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:07:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5BM6uaG001429
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:07:07 +0100
Message-ID: <1434060416.28975.245.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 23:06:56 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] packagedata: Fix to ensure variables expand correctly
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
X-List-Received-Date: Thu, 11 Jun 2015 22:07:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we set unsuffixed variables here there is a chance they could clobber
override versions of that variable, e.g. DESCRIPTION could clobber
DESCRIPTION_<pkgname>. We therefore don't clobber for the unsuffixed
variable versions by using the parsing flag to setVar.

This becomes a problem with the modifications to bitbake to 
have continual expansion of the datastore, its about the one place this 
turns out to be problematic.

The parameter to setVar works with current bitbake even though
we don't have the new API since it gets swallowed by the logging code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.bbclass
index d1aedf2..3397f1e 100644
--- a/meta/classes/packagedata.bbclass
+++ b/meta/classes/packagedata.bbclass
@@ -22,5 +22,13 @@ python read_subpackage_metadata () {
                         bb.fatal("Recipe %s is trying to create package %s which was already written by recipe %s. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes." % (vars[key], pkg, sdata[key]))
                     bb.fatal("Recipe %s is trying to change %s from '%s' to '%s'. This will cause do_package_write_* failures since the incorrect data will be used and they will be unable to find the right workdir." % (vars["PN"], key, vars[key], sdata[key]))
                 continue
-            d.setVar(key, sdata[key])
+            #
+            # If we set unsuffixed variables here there is a chance they could clobber override versions
+            # of that variable, e.g. DESCRIPTION could clobber DESCRIPTION_<pkgname>
+            # We therefore don't clobber for the unsuffixed variable versions
+            #
+            if key.endswith("_" + pkg):
+                d.setVar(key, sdata[key])
+            else:
+                d.setVar(key, sdata[key], parsing=True)
 }



