Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 66DFB759B4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:43 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id 6so270214198qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tp5nYEaogwS0JHrCHgpnNSBbNkyq6ugmJkViGLBJ9xs=;
	b=J2D30+aCwLewI5N80W1EqHtSMi5RR3MhFX2H5Lhmt2I5Ih/z85mTEiKBHpKxGgMI40
	ak18zO2aYwhUmY0JF/qG1gQVMuvK72sfAkA7lzRnw+fS+p94VEsPBASmDytOgWMs9tqk
	XX7gkjg9bKCW1S9isSDqXMB5qre+pf388HR8wbXsffRgbQ/Mds9SJuaG7y9m7vlPU9/a
	IQ1iBF834FTpMDDZmkRsdrj7Q9w/nBf3gi3LGGwbbN9Dp2VrnTDix0XKWtm2QbVzAgde
	xz854EjFTVXt3p0A8R9r9x1v4RL6G5Mk5Ojqsw2gJhbrfJMMmvSUFbJ2Ips7aPcsf/xw
	XiHQ==
X-Received: by 10.140.38.73 with SMTP id s67mr133994479qgs.82.1452248384201;
	Fri, 08 Jan 2016 02:19:44 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:53 +0000
Message-Id: <e4897b8adaab48a23702e574c722238c3e538cce.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 25/53] gzip: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:44 -0000

gzip 1.6 uses an older version of gnulib when cross compiling it treats
fseeko as broken since it cant do runtime checks for it during configure
this only shows up on musl since for glibc since it has special check
for gnu c library, so we aid the system by telling it that fflush on
stdin works well with musl

Use NO_ASM to avoid textrels

Delete charset.alias for musl which is again another issue in gnulib not
knowing musl platform

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/gzip/gzip.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index 58e5e0c..6e81883 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -6,8 +6,10 @@ SECTION = "console/utils"
 # change to GPLv3+ in 2007/07. Previous GPLv2 version is 1.3.12
 
 inherit autotools texinfo
+export DEFS="NO_ASM"
 
 EXTRA_OEMAKE_class-target = "GREP=${base_bindir}/grep"
+EXTRA_OECONF_append_libc-musl = " gl_cv_func_fflush_stdin=yes "
 
 do_install_append () {
 	if [ "${base_bindir}" != "${bindir}" ]; then
@@ -20,6 +22,11 @@ do_install_append () {
 	fi
 }
 
+do_install_append_libc-musl () {
+	rm ${D}${libdir}/charset.alias
+	rmdir ${D}${libdir}
+}
+
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-- 
2.7.0


