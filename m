Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B293B6E374
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:42:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2OFgHi4032632 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:42:17 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hUh67sglEgJ0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:42:16 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2OFgCAD032614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:42:14 GMT
Message-ID: <1395675726.24890.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 15:42:06 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] staging: Save out provider information into the sysroot
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
X-List-Received-Date: Mon, 24 Mar 2014 15:42:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch saves out provider information into the sysroot for all providers
except those in MULTI_PROVIDER_WHITELIST. This means that we will start seeing
warnings when two providers for the same thing are installed into the sysroot.

In the future those warnings can be turned into errors.

Partially addresses [YOCTO #4102]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index d17a53e..f4ab04a 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -93,6 +93,16 @@ python do_populate_sysroot () {
     bb.build.exec_func("sysroot_stage_all", d)
     for f in (d.getVar('SYSROOT_PREPROCESS_FUNCS', True) or '').split():
         bb.build.exec_func(f, d)
+    pn = d.getVar("PN", True)
+    multiprov = d.getVar("MULTI_PROVIDER_WHITELIST", True).split()
+    provdir = d.expand("${SYSROOT_DESTDIR}${base_prefix}/sysroot-providers/")
+    bb.utils.mkdirhier(provdir)
+    for p in d.getVar("PROVIDES", True).split():
+        if p in multiprov:
+            continue
+        p = p.replace("/", "_")
+        with open(provdir + p, "w") as f:
+            f.write(pn)
 }
 
 SSTATETASKS += "do_populate_sysroot"



