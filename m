Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9792960FA4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 11:25:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94BPOT6004331 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Oct 2013 12:25:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dLK3ZK-j5RQA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 12:25:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94BPL08004326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Oct 2013 12:25:23 +0100
Message-ID: <1380885917.18603.592.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Oct 2013 12:25:17 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] cross/crosssdl/native/nativesdk: Fix do_packagedata stamps
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
X-List-Received-Date: Fri, 04 Oct 2013 11:25:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you build nativesdk for machine A, then change to B you will see sstate
manifest warnings for the packagedata files. The stamps are machine
specific and should not be, ditto for native.

This patch copies the populate-sysroot extra stamp entries to avoid
these warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index f6e7dc1..bd14489 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -56,6 +56,7 @@ libexecdir = "${exec_prefix}/libexec/${CROSS_TARGET_SYS_DIR}"
 
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}/"
 do_populate_sysroot[stamp-extra-info] = ""
+do_packagedata[stamp-extra-info] = ""
 
 python cross_virtclass_handler () {
     classextend = e.data.getVar('BBCLASSEXTEND', True) or ""
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index bcc285b..261a374 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -27,6 +27,7 @@ target_exec_prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
 baselib = "lib"
 
 do_populate_sysroot[stamp-extra-info] = ""
+do_packagedata[stamp-extra-info] = ""
 
 # Need to force this to ensure consitency accross architectures
 EXTRA_OECONF_FPU = ""
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 6704e66..7c4e8c3 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -157,6 +157,7 @@ do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 
+do_packagedata[stamp-extra-info] = ""
 do_populate_sysroot[stamp-extra-info] = ""
 
 USE_NLS = "no"
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 26d1e4a..ed276ef 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -87,5 +87,6 @@ addhandler nativesdk_virtclass_handler
 nativesdk_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 
 do_populate_sysroot[stamp-extra-info] = ""
+do_packagedata[stamp-extra-info] = ""
 
 USE_NLS = "${SDKUSE_NLS}"



