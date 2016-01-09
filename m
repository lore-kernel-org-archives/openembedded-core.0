Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 52EA160290
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 16:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u09Gg8iL027915 for <openembedded-core@lists.openembedded.org>;
	Sat, 9 Jan 2016 16:42:08 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BZu-YcC0S9CE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 16:42:08 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u09Gg59b027901
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 9 Jan 2016 16:42:07 GMT
Message-ID: <1452357725.7598.158.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 09 Jan 2016 16:42:05 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [RFC PATCH] bitbake.conf/sanity: Add dependency on host xz
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
X-List-Received-Date: Sat, 09 Jan 2016 16:42:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Times change and xz is becoming the defacto compression format and
utility. Adapt to the times and assume that the system provides xz.

This leads into us being able to use xz for sstate instead of gzip.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9f35558..ab28660 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -3,7 +3,7 @@
 #
 
 SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar \
-    gzip gawk chrpath wget cpio perl file"
+    gzip gawk chrpath wget cpio perl file xz"
 
 def bblayers_conf_file(d):
     return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 371af31..4088c22 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -178,6 +178,7 @@ ASSUME_PROVIDED = "\
     texinfo-native \
     bash-native \
     sed-native \
+    xz-native \
     "
 # gzip-native should be listed above?
 



