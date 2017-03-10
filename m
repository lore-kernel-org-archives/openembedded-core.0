Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 180A07771B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 12:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2ACx5pZ002581; Fri, 10 Mar 2017 12:59:06 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VDWL9oJidQ5Q; Fri, 10 Mar 2017 12:59:06 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2ACwWUM002563
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 10 Mar 2017 12:58:33 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cmK7s-0000Qh-F8; Fri, 10 Mar 2017 12:58:32 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 12:58:30 +0000
Message-Id: <1489150711-1608-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489150711-1608-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1489150711-1608-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] quilt: Avoid hardcoding paths into output
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
X-List-Received-Date: Fri, 10 Mar 2017 12:59:09 -0000

Avoids:
 quilt-0.65-r0 do_package_qa: QA Issue: /usr/lib/quilt/ptest/quilt/scripts/edmail contained in package
 quilt-ptest requires /media/build1/poky/build/tmp/hosttools/perl, but no providers found in
 RDEPENDS_quilt-ptest? [file-rdeps]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/quilt/quilt-native.inc | 1 +
 meta/recipes-devtools/quilt/quilt.inc        | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/quilt/quilt-native.inc b/meta/recipes-devtools/quilt/quilt-native.inc
index 5c4b0a2..fce5fa1 100644
--- a/meta/recipes-devtools/quilt/quilt-native.inc
+++ b/meta/recipes-devtools/quilt/quilt-native.inc
@@ -6,6 +6,7 @@ inherit native
 
 PATCHTOOL = "patch"
 EXTRA_OECONF = "--disable-nls"
+EXTRA_OECONF_append_class-target = "--with-perl=perl"
 
 do_configure () {
 	oe_runconf
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 85aaf8d..57e2a14 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -33,6 +33,8 @@ RDEPENDS_${PN} = "bash"
 EXTRA_OE_MAKE_ARGS_darwin ?= ""
 EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
 
+EXTRA_OECONF = "--with-perl=perl"
+
 CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
 
 # Don't setup symlinks to host utilities, we don't need them
-- 
2.7.4


