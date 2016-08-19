Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1414473285
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 15:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JFRmVg001922 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:27:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sU6Czi2QKuRa
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:27:48 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JFRhjc001919
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:27:45 +0100
Message-ID: <1471620463.16712.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 16:27:43 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] sanity.bbclass: Ensure we expand BUILD_PREFIX
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
X-List-Received-Date: Fri, 19 Aug 2016 15:27:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This likely used to work when we expanded python functions and broke when
we stopped. Since it defaults to "", it never caused an issue but
is incorrect usage so fix it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 98345ce..202b5db 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -459,19 +459,19 @@ def check_gcc_march(sanity_data):
 
         # Check if GCC could work without march
         if not result:
-            status,res = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc gcc_test.c -o gcc_test")
+            status,res = oe.utils.getstatusoutput(sanity_data.expand("${BUILD_PREFIX}gcc gcc_test.c -o gcc_test"))
             if status == 0:
                 result = True;
 
         if not result:
-            status,res = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test")
+            status,res = oe.utils.getstatusoutput(sanity_data.expand("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test"))
             if status == 0:
                 message = "BUILD_CFLAGS_append = \" -march=native\""
                 result = True;
 
         if not result:
             build_arch = sanity_data.getVar('BUILD_ARCH', True)
-            status,res = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=%s gcc_test.c -o gcc_test" % build_arch)
+            status,res = oe.utils.getstatusoutput(sanity_data.expand("${BUILD_PREFIX}gcc -march=%s gcc_test.c -o gcc_test" % build_arch))
             if status == 0:
                 message = "BUILD_CFLAGS_append = \" -march=%s\"" % build_arch
                 result = True;



