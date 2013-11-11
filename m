Return-Path: <layliu@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id B0CB26D4D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 04:30:47 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md4so4651810pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2013 20:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=ZD4T1ER6gPm+Pkns+DdArKrcc8bBqEURZ4yoUVwHMks=;
	b=EcQVOPaFes5K1VWp9aUjqIB3Gzv6gMhOz1aHd93GwuBbfDK5vBS0MeTik5qw1AOEKn
	a1wQRXfoIpxDYL6KZsgy5/PqBoBzcNTAbNvRuO9CYBVRQNROAiydcIxLLzyH3xHIPxxa
	SZCm2MfDJ7jIxsbB3pNdYnSk5flkJiBK9RGMMwhkyGYFeWCE66Kv92+J8awgza0pOt68
	N7PNWqfuNPsowTBtJEH5Mb0O8HR4LTLsNf5sTaH/YPBd2GDlRaBk00T7T5HJQa0UpFum
	aLq6AodjMEoTZosNq0LmJLDPSGu/yjJ3R5uaWgMVwowdqqE/orxWz0DmAAev1p885Brb
	HsLg==
X-Received: by 10.68.17.132 with SMTP id o4mr28109505pbd.44.1384144249273;
	Sun, 10 Nov 2013 20:30:49 -0800 (PST)
Received: from [128.224.163.160] ([1.202.252.122])
	by mx.google.com with ESMTPSA id
	iu7sm27684279pbc.45.2013.11.10.20.30.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 10 Nov 2013 20:30:48 -0800 (PST)
Message-ID: <52805D73.4050306@gmail.com>
Date: Mon, 11 Nov 2013 12:30:43 +0800
From: Lei Liu <layliu@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Disable building libgcc with -O0
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
X-List-Received-Date: Mon, 11 Nov 2013 04:30:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Link error happens for valgrind when linking unoptimized libgcc.
Libgcc requires symbol _Unwind_Resume defined in libgcc_eh which
in turn requires pulling in entire glibc.  We can't make valgrind
link with glibc due to its design.  So don't build libgcc without
optimizations, so that calls to _Unwind_Resume get eliminated.

Signed-off-by: Lei Liu <lei.liu2@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 25a3142..cf03c08 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -25,6 +25,15 @@ EXTRA_OECONF_PATHS = " \
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
+def get_optimization(d):
+    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
+    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
+        bb.note("libgcc can't be built with -O0, -O2 will be used instead.")
+        return selected_optimization.replace("-O0", "-O2")
+    return selected_optimization
+
+SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
+
 do_configure_prepend () {
 	sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure
 }
--
1.8.2.1 

