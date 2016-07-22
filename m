Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD6B66067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 14:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6MEP63H009219; Fri, 22 Jul 2016 15:25:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7vH45QD3caHn; Fri, 22 Jul 2016 15:25:06 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6MEP0mU009215
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 22 Jul 2016 15:25:01 +0100
Message-ID: <1469197500.23580.64.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jul 2016 15:25:00 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] insane: Add mechanism to extend QA machine information from BSP layer
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
X-List-Received-Date: Fri, 22 Jul 2016 14:25:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In order to add a new architecture or sub-architecture to OE, you currently
need to tweak the table in insane.bbclass. This adds a mechanism so this
can be done from a BSP layer. It needs a function definition which needs
a class file but can then be done with something like:

def my_testfunc(machdata, d):
    machdata["testmachine"] = {
                        "test64":       ( 8,     0,    0,          False,         32),
                        "testel":     ( 8,     0,    0,          True,          32),
                      }
    return machdata

PACKAGEQA_EXTRA_MACHDEFFUNCS = "my_testfunc"

[YOCTO #8554]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9b2337c..98381c2 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -54,8 +54,8 @@ UNKNOWN_CONFIGURE_WHITELIST ?= "--enable-nls --disable-nls --disable-silent-rule
 # feel free to add and correct.
 #
 #           TARGET_OS  TARGET_ARCH   MACHINE, OSABI, ABIVERSION, Little Endian, 32bit?
-def package_qa_get_machine_dict():
-    return {
+def package_qa_get_machine_dict(d):
+    machdata = {
             "darwin9" : { 
                         "arm" :       (40,     0,    0,          True,          32),
                       },
@@ -168,6 +168,16 @@ def package_qa_get_machine_dict():
                       },
         }
 
+    # Add in any extra user supplied data which may come from a BSP layer, removing the
+    # need to always change this class directly
+    extra_machdata = (d.getVar("PACKAGEQA_EXTRA_MACHDEFFUNCS", True) or "").split()
+    for m in extra_machdata:
+        call = m + "(machdata, d)"
+        locs = { "machdata" : machdata, "d" : d}
+        machdata = bb.utils.better_eval(call, locs)
+
+    return machdata
+
 
 def package_qa_clean_path(path,d):
     """ Remove the common prefix from the path. In this case it is the TMPDIR"""
@@ -519,7 +529,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     #if this will throw an exception, then fix the dict above
     (machine, osabi, abiversion, littleendian, bits) \
-        = package_qa_get_machine_dict()[target_os][target_arch]
+        = package_qa_get_machine_dict(d)[target_os][target_arch]
 
     # Check the architecture and endiannes of the binary
     if not ((machine == elf.machine()) or \



