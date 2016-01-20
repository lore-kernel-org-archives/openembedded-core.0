Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id B870B605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:34:13 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id is5so18083291obc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 17:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UGT3MZQpPQoDc6Tgeh0X3AMdEJVPBxFyyoeCuVxDHhE=;
	b=H876qP//ezqsuiIQ2gLV1VYuHK5ckyy4i63iPpKw0OQvltHl5obp6wHu/5CaR55EFk
	f20PY7OGKUYLR9wU/yUDmcq5CaPurbBnBVzrsmhtbHTJM1A2xiUENxviBk9lRgy0Vi/k
	vQtB8fCBGq07HY8eof7r7ipumNC2aFyghtcG8UG6Hc0ckjZEqlg/j3/vMqGGM+cKKP+J
	VxLq+00COic7npFpbdw1DH3oSFLmsfA7V7NrKrWZsbbGzLBtY9ARNO4RLmbX2sq1iKRD
	MnQYMEGkwAjilT226mAS+1UHfcMXs1wUgoTtNttBaeiCesz85fyYDWvXMWKD5xb69rBC
	6e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UGT3MZQpPQoDc6Tgeh0X3AMdEJVPBxFyyoeCuVxDHhE=;
	b=d67VSwR8ZeiU+klr1vVEjBylrcj000z6U4hF/dYBRtAzv5Y8z9l+qcMYCt30mkAhE3
	78GDSjZIG0HwDi79uTzvCfD8SuLWHayEwYGHnNY9P7S4bQN3CHeYYrkdGujDjM4165jy
	F2TBZgdZ2Jtdsbutog8tzTRnel4BFnsgEbs4AuPxB9bEL26DqrY/Mgxixav3CIOgMxdv
	mrBKXcQ6nDMqdmJ0r02UYhuprzpZQCcPxxS2FEUxYprUD3Wp/dz6jERfo8cAXvHvxK7r
	k2Q/lhcIQYvJt1KbTLu0afmCEnVnWwJO+k6JfytDFgscfJwYEdd+eRLJBsq1P7BtRbEO
	X7LQ==
X-Gm-Message-State: AG10YOSUv9CI5e+eDrhdP7t5/3FFjniEPea9l0/uQkla21+ABMfI8olo2ckI4NAmRjE6bg==
X-Received: by 10.60.155.97 with SMTP id vv1mr19102747oeb.60.1453253654153;
	Tue, 19 Jan 2016 17:34:14 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	j201sm11858118oih.19.2016.01.19.17.34.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 17:34:13 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:33:59 -0800
Message-Id: <1453253641-6309-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453253641-6309-1-git-send-email-armccurdy@gmail.com>
References: <1453253641-6309-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/3] valgrind: let valgrind determine its own optimisation flags
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
X-List-Received-Date: Wed, 20 Jan 2016 01:34:14 -0000

Valgrind likes to control its own optimisation flags. It generally
defaults to -O2 but uses -O0 for some specific test apps etc. Passing
our own flags (via CFLAGS) means we interfere with that.

Giving valgrind control of optimisation is hopefully an even better
solution than the previous one of forcing -O0 for all tests.

  http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=98c4a3ffb8dca10739be600e8d6df7fb6aa4958f

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 70d84fe..8e9b72c 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -44,6 +44,11 @@ EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
 
 EXTRA_OEMAKE = "-w"
 
+# valgrind likes to control its own optimisation flags. It generally defaults
+# to -O2 but uses -O0 for some specific test apps etc. Passing our own flags
+# (via CFLAGS) means we interfere with that.
+SELECTED_OPTIMIZATION = ""
+
 CFLAGS_append_libc-uclibc = " -D__UCLIBC__ "
 
 do_install_append () {
@@ -63,10 +68,9 @@ RDEPENDS_${PN}-ptest += " sed perl glibc-utils perl-module-file-glob"
 INSANE_SKIP_${PN}-ptest += "file-rdeps"
 
 do_compile_ptest() {
-    oe_runmake check CFLAGS="${CFLAGS} -O0" CXXFLAGS="${CXXFLAGS} -O0"
+    oe_runmake check
 }
 
-
 do_install_ptest() {
     chmod +x ${B}/tests/vg_regtest
 
@@ -107,4 +111,3 @@ do_install_ptest() {
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
-
-- 
1.9.1


