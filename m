Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7A172A78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 10:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAo75T028820 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:50:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3aqEFlLbnNdZ
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:50:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAntFI028798
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:50:06 +0100
Message-ID: <1430218184.13022.162.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 11:49:44 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] gcc-shared-source: Add PV to PN
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
X-List-Received-Date: Tue, 28 Apr 2015 10:50:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This means you can have one gcc version for some gcc recipes
(e.g. crosssdk/nativesdk) and another gcc version for target code which
is useful for more obscure architecture toolchains.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index cb5d907..9acffb1 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -5,5 +5,5 @@ do_fetch[noexec] = "1"
 deltask do_unpack
 deltask do_patch
 
-do_configure[depends] += "gcc-source:do_preconfigure"
-do_populate_lic[depends] += "gcc-source:do_unpack"
+do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
+do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 10e9285..a4b27c8 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -11,6 +11,7 @@ deltask do_package_qa
 deltask do_packagedata
 deltask do_rm_work
 
+PN = "gcc-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
 SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
 



