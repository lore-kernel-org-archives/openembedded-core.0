Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 34F7C6E2E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:48:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0FHlu8d008066 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:47:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AAIUEQWPXBFN
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:47:56 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0FHlo3g008062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:47:52 GMT
Message-ID: <1389808065.14987.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jan 2014 17:47:45 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] package_rpm: Fix a race with package_deb/package_ipk
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
X-List-Received-Date: Wed, 15 Jan 2014 17:48:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have the odd situation where the CONTROL/DEBIAN directory can be removed
in the middle of the walk, the isdir() test would then fail and the walk code
would assume its a file hence we check for the names in files too.

This resolves the autobuilder failure:

error: File not found: /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-fsl-arm/build/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xinit/1_1.3.3-r0/package/DEBIAN

RPM build errors:
     File not found: /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-fsl-arm/build/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xinit/1_1.3.3-r0/package/DEBIAN

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index fcde73e..acbb18d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -659,6 +659,9 @@ python write_specfile () {
         # We can race against the ipk/deb backends which create CONTROL or DEBIAN directories
         # when packaging. We just ignore these files which are created in 
         # packages-split/ and not package/
+        # We have the odd situation where the CONTROL/DEBIAN directory can be removed in the middle of
+        # of the walk, the isdir() test would then fail and the walk code would assume its a file
+        # hence we check for the names in files too.
         for rootpath, dirs, files in os.walk(walkpath):
             path = rootpath.replace(walkpath, "")
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
@@ -669,6 +672,8 @@ python write_specfile () {
                 # All packages own the directories their files are in...
                 target.append('%dir "' + path + '/' + dir + '"')
             for file in files:
+                if file == "CONTROL" or file == "DEBIAN":
+                    continue
                 if conffiles.count(path + '/' + file):
                     target.append('%config "' + path + '/' + file + '"')
                 else:



