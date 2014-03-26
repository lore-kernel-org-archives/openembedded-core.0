Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 012AF6FA9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 11:41:53 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2QBfedR012598; Wed, 26 Mar 2014 11:41:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SCAtwMo6V_qx; Wed, 26 Mar 2014 11:41:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2QBfbr1012584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 26 Mar 2014 11:41:39 GMT
Message-ID: <1395834091.24890.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 11:41:31 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] apt/package_mamager: Ensure WORKDIR is used for lists directory
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
X-List-Received-Date: Wed, 26 Mar 2014 11:41:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The native sysroot should not be used as a store for the lists files since
multiple images running at once would conflict over this. Instead redirect
this to WORKDIR. This means some extra directories need to be created.

Also create apt.conf.d to silence some warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 824af00..764ab72 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1624,6 +1624,8 @@ class DpkgPM(PackageManager):
             bb.utils.remove(self.apt_conf_dir, True)
 
         bb.utils.mkdirhier(self.apt_conf_dir)
+        bb.utils.mkdirhier(self.apt_conf_dir + "/lists/partial/")
+        bb.utils.mkdirhier(self.apt_conf_dir + "/apt.conf.d/")
 
         arch_list = []
         for arch in archs.split():
diff --git a/meta/recipes-devtools/apt/files/apt.conf b/meta/recipes-devtools/apt/files/apt.conf
index 5058650..0335135 100644
--- a/meta/recipes-devtools/apt/files/apt.conf
+++ b/meta/recipes-devtools/apt/files/apt.conf
@@ -2,7 +2,7 @@ Dir "${STAGING_DIR_NATIVE}/"
 {
    State "var/lib/apt/"
    {
-      Lists "lists/";
+      Lists "#APTCONF#/lists/";
       status "#ROOTFS#/var/lib/dpkg/status";
    };
    Cache "var/cache/apt/"



