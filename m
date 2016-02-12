Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 26D7F7609A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBYAvf017033 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:34:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1Ml55b4Xh_vs
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:34:09 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBY7xE017030
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:34:08 GMT
Message-ID: <1455276847.16142.273.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Feb 2016 11:34:07 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] autotools: Correct dependency search logic error
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
X-List-Received-Date: Fri, 12 Feb 2016 11:34:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We go to the effort of finding the value of start, we should then use it
rather than relying on the value of dep being preserved from the previous
loop. Took me far too long to notice this issue when changing the code.

Also drop an unused variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index abbc782..a5f2bff 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -160,8 +160,8 @@ python autotools_copy_aclocals () {
     # We need to find configure tasks which are either from <target> -> <target>
     # or <native> -> <native> but not <target> -> <native> unless they're direct
     # dependencies. This mirrors what would get restored from sstate.
-    done = [dep]
-    next = [dep]
+    done = [start]
+    next = [start]
     while next:
         new = []
         for dep in next:
@@ -188,7 +188,6 @@ python autotools_copy_aclocals () {
     #bb.warn(str(configuredeps2))
 
     cp = []
-    siteconf = []    
     for c in configuredeps:
         if c.endswith("-native"):
             manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}-%s.populate_sysroot" % c)



