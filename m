Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 59F3A71C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 16:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGDC2E002522; Thu, 19 Jan 2017 16:13:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id r9voqTTwZ84M; Thu, 19 Jan 2017 16:13:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGD6Kg002509
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 16:13:07 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUFKk-0000lX-B5; Thu, 19 Jan 2017 16:13:06 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 16:13:02 +0000
Message-Id: <1484842382-2821-11-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/11] staging: Add dependency on virtual/binutils for strip binary
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
X-List-Received-Date: Thu, 19 Jan 2017 16:13:14 -0000

The staging code strips binaries and we need virtual/binutils for that.
Add a specific dependency since the one from do_configure and others
may not be enough to ensure the binaries are in our own sysroot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/allarch.bbclass | 1 +
 meta/classes/staging.bbclass | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 9dce498..026214e 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -32,6 +32,7 @@ python () {
         d.setVar("TARGET_CFLAGS", "none")
         d.setVar("TARGET_CXXFLAGS", "none")
         d.setVar("TARGET_LDFLAGS", "none")
+        d.setVar("POPULATESYSROOTDEPS", "")
 
         # Avoid this being unnecessarily different due to nuances of
         # the target machine that aren't important for "all" arch
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 72a7421..2512ae6 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -228,6 +228,10 @@ python do_populate_sysroot () {
 do_populate_sysroot[vardeps] += "${SYSROOT_PREPROCESS_FUNCS}"
 do_populate_sysroot[vardepsexclude] += "MULTI_PROVIDER_WHITELIST"
 
+POPULATESYSROOTDEPS = ""
+POPULATESYSROOTDEPS_class-target = "virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot"
+do_populate_sysroot[depends] += "${POPULATESYSROOTDEPS}"
+
 SSTATETASKS += "do_populate_sysroot"
 do_populate_sysroot[cleandirs] = "${SYSROOT_DESTDIR}"
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}"
-- 
2.7.4


