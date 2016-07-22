Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CC8857317F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 14:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6MEPnjP009241 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 15:25:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CtSsBwHn26sJ
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 15:25:49 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6MEPhej009236
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 15:25:44 +0100
Message-ID: <1469197543.23580.65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jul 2016 15:25:43 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] siteinfo: Add mechanism to extend siteinfo information from BSP layer
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
X-List-Received-Date: Fri, 22 Jul 2016 14:25:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In order to add a new architecture or sub-architecture to OE, you currently
need to tweak the table in siteinfo.bbclass. This adds a mechanism so this
can be done from a BSP layer. It needs a function definition which needs
a class file but can then be done with something like:

def rp_testfunc2(archinfo, osinfo, targetinfo, d):
    archinfo['testarch'] = "little-endian bit-32"
    osinfo['testos'] = "common-linux"
    targetinfo['mymach-linux'] = "mymach-linux-common"

    return archinfo, osinfo, targetinfo

SITEINFO_EXTRA_DATAFUNCS = "rp_testfunc2"

[YOCTO #8554]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 50141a3..3c9ab2a 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -107,6 +107,14 @@ def siteinfo_data(d):
         "x86_64-mingw32": "bit-64",
     }
 
+    # Add in any extra user supplied data which may come from a BSP layer, removing the
+    # need to always change this class directly
+    extra_siteinfo = (d.getVar("SITEINFO_EXTRA_DATAFUNCS", True) or "").split()
+    for m in extra_siteinfo:
+        call = m + "(archinfo, osinfo, targetinfo, d)"
+        locs = { "archinfo" : archinfo, "osinfo" : osinfo, "targetinfo" : targetinfo, "d" : d}
+        archinfo, osinfo, targetinfo = bb.utils.better_eval(call, locs)
+
     hostarch = d.getVar("HOST_ARCH", True)
     hostos = d.getVar("HOST_OS", True)
     target = "%s-%s" % (hostarch, hostos)



