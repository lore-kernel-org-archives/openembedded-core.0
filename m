Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 78FDA770FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 12:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0RCNc2f013179; Wed, 27 Jan 2016 12:23:38 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4rxNmzuy-2Zn; Wed, 27 Jan 2016 12:23:38 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0RCNYc3013176
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 Jan 2016 12:23:35 GMT
Message-ID: <1453897414.10340.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jan 2016 12:23:34 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] base: Move COMPATIBLE_MACHINE out the scope of SOURCE_MIRROR_FETCH
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
X-List-Received-Date: Wed, 27 Jan 2016 12:23:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Recipes setting COMPATIBLE_MACHINE are likely to have SRC_URI
entries which can heavily depend on the configured machine. Skipping
them for SOURCE_MIRROR_FETCH is therefore not advised and leads to
build errors whilst not particularly improving source mirrors.

[YOCTO #8802]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5fc9271..dad198f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -462,6 +462,17 @@ python () {
         d.appendVarFlag('do_package_setscene', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_devshell', 'fakeroot', '1')
         d.appendVarFlag('do_devshell', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
+
+    need_machine = d.getVar('COMPATIBLE_MACHINE', True)
+    if need_machine:
+        import re
+        compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
+        for m in compat_machines:
+            if re.match(need_machine, m):
+                break
+        else:
+            raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
+
     source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', 0)
     if not source_mirror_fetch:
         need_host = d.getVar('COMPATIBLE_HOST', True)
@@ -471,17 +482,6 @@ python () {
             if not re.match(need_host, this_host):
                 raise bb.parse.SkipPackage("incompatible with host %s (not in COMPATIBLE_HOST)" % this_host)
 
-        need_machine = d.getVar('COMPATIBLE_MACHINE', True)
-        if need_machine:
-            import re
-            compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
-            for m in compat_machines:
-                if re.match(need_machine, m):
-                    break
-            else:
-                raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
-
-
         bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE', True) or "").split()
 
         check_license = False if pn.startswith("nativesdk-") else True



