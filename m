Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 99981610DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 12:36:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8PCarP8030832; Wed, 25 Sep 2013 13:36:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vVNVxT-5Jwpz; Wed, 25 Sep 2013 13:36:53 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8PCaoNQ030825
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 25 Sep 2013 13:36:51 +0100
Message-ID: <1380112606.18603.332.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2013 13:36:46 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] package.bbclass: Clear umask when using os.mkdir
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
X-List-Received-Date: Wed, 25 Sep 2013 12:36:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We switched to using os.mkdir with the file creation mode specified as the
second parameter. Python masks this with umask behind the scenes which isn't
what we want, we really want the permissions we specify.

To avoid this we zero the umask beforehand and restore afterwards. Other
solutions are possible but would not perform as well which is why
we're using os.mkdir in the first place.

Martin Jansa deserves the credit for debugging where the problem was.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fbb6839..c98c6ec 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -953,6 +953,9 @@ python populate_packages () {
 
     seen = []
 
+    # os.mkdir masks the permissions with umask so we have to unset it first
+    oldumask = os.umask(0)
+
     for pkg in package_list:
         root = os.path.join(pkgdest, pkg)
         bb.utils.mkdirhier(root)
@@ -1025,6 +1028,7 @@ python populate_packages () {
             if ret is False or ret == 0:
                 raise bb.build.FuncFailed("File population failed")
 
+    os.umask(oldumask)
     os.chdir(workdir)
 
     unshipped = []



