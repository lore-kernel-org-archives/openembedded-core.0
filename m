Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71690D172C2
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13487.1770113971685483992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NqlARc6n;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432d2670932so4918668f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113970; x=1770718770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1570IQrm1P7aI/T6XIpQkLKtHEd8pBTaDCpGRxzrEs=;
        b=NqlARc6n6pZ6Wnuj/J6cqObzMbYtXNbepJCku2vHG243CVDr7mydDwcTD9hJAlbWHu
         WnfpnsluS7AEv33dwh4XrtOjPOqBI82oLP9emU+RoPFzP6t3issLmOqKJbAmL2gZ9HMP
         rOlbJKPPWJev2BGMiGlv2i8MBqNtTvWZbOTEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113970; x=1770718770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1570IQrm1P7aI/T6XIpQkLKtHEd8pBTaDCpGRxzrEs=;
        b=meDoHou+ibXb7lqC9Rr1x6ibBolxX7oKby09fandX+6E7/c2uAMGULhoTqwhRijPfP
         tuz51JADVG8IfUevp3vnM6xAmHiMMeIAvYSGZjVcWuC8Ev5LMiE0SHNT8xKvwRiCC7rf
         Ocs5lXgEDTX2wJSiJwM9YHcNqoMPqCvTtHEOgVYE2ZkLV/7ZVAidBwBckbdAiXNk1Rex
         /w4SWPQK9zj5UvARQbnesHMaKlEncz3g84afhLFdUEHPiT/nb7VZFEAXD3PnmjPB6OO5
         F6NpJ8kR1exdKjzfZJMOzUczYnbiJrC1wayN+vHU7PM6l+lSXcaC0oWcO5PfUUY8HudC
         wXEw==
X-Gm-Message-State: AOJu0YwBq4eXPoRQP3Ummfci2u2V8KaMt0EqRD0j+VUcXkgzEeNLMHTB
	GRQLleQe/IcNnxN+Em7SHVkXa3DK/fUmIQRUCD69MR9qtCQUYfZuGGJtOpTvE1glP2JhFQviHy5
	JqG5JZOs=
X-Gm-Gg: AZuq6aIYIq+31xvoEIxSLhxgufeI/uGD8teuDrG1B2anweQ/GSjHyT//M45ZZYppA1T
	VaFCM0zZERK23QD+laTwfkGPSSqN2+i2O/QpL8P6LqasY84qrlhoOeZEZV/Jt8H/EeTLcITCWZh
	zYxxQHDYjzoq0aOdoBj0SkW1I/AnmHcHD1V/SftaGnbbL2J7RrjpWJ7OrEsfe+MWlyOQv9yEMjI
	yY1j4GHitDzb2K5URNreecJeLrXtybI4wT4VrvYcxlbjkYwMCWmgtgVIaRbhtaHhiPF4cT9o300
	ck698mY5cJ0uJVnYMUVR8wcJWH0+xIY+ipsW0cgLjdUUYG1Y/wBdO5wpJPT0/ZN6KUD96oFDR0y
	d9mXzQEr43HMdKnRG0ZUpDDncCIXsdBcJLoeuHX/kGRoFwnqDJ1ecFPWJs2X6Is4ugSAqnzFTy9
	EL4dm09TzRm0I0n11VzB2skOvN6XXmnGc61hXchpUyyDGO5PTsYY8OU/9xjDdXLvK/3ixccpYKA
	+BhdXHoeKv/B7TE5S8pOjqxPA==
X-Received: by 2002:a05:6000:2004:b0:42f:b690:6788 with SMTP id ffacd0b85a97d-435f3a6baa6mr19946280f8f.10.1770113969782;
        Tue, 03 Feb 2026 02:19:29 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 11/22] dpkg: Fix ADMINDIR
Date: Tue,  3 Feb 2026 11:16:40 +0100
Message-ID: <759a12066a2c6126bc3a7fb2dccc92f3e2b4d6fe.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230439

From: Mark Hatle <mark.hatle@kernel.crashing.org>

dpkg has a hard coded path (from build time) for the ADMINDIR, for some
reason the "set_root" function was using this hard coded value instead
of the value from apt.conf or the environment.

Follow the example of db_dir.c and use the environment if set.

Adjust the matching oe package_manager functions to set the ADMINDIR,
even though the apt.conf sets --admindir.  Note it's unclear if the
--admindir value that is set is reasonable or not.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
[AG: add Upstream-Status - Submitted to patch]
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 22c3ebacd3c21d1caf9fddb0f7f4ff06c7728d3a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/package_manager/deb/__init__.py   |  4 ++
 ...-dirs.c-set_rootfs-was-not-checking-.patch | 46 +++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.22.21.bb    |  1 +
 3 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index eb48f3f9822..cdb58bee101 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -213,6 +213,7 @@ class DpkgPM(OpkgDpkgPM):
 
     def update(self):
         os.environ['APT_CONFIG'] = self.apt_conf_file
+        os.environ['DPKG_ADMINDIR'] = '/var/lib/dpkg'
 
         self.deploy_dir_lock()
 
@@ -231,6 +232,7 @@ class DpkgPM(OpkgDpkgPM):
             return
 
         os.environ['APT_CONFIG'] = self.apt_conf_file
+        os.environ['DPKG_ADMINDIR'] = '/var/lib/dpkg'
 
         extra_args = ""
         if hard_depends_only:
@@ -282,6 +284,7 @@ class DpkgPM(OpkgDpkgPM):
         os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
         os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
         os.environ['INTERCEPT_DIR'] = self.intercepts_dir
+        os.environ['DPKG_ADMINDIR'] = '/var/lib/dpkg'
 
         if with_dependencies:
             os.environ['APT_CONFIG'] = self.apt_conf_file
@@ -424,6 +427,7 @@ class DpkgPM(OpkgDpkgPM):
 
     def fix_broken_dependencies(self):
         os.environ['APT_CONFIG'] = self.apt_conf_file
+        os.environ['DPKG_ADMINDIR'] = '/var/lib/dpkg'
 
         cmd = "%s %s --allow-unauthenticated -f install" % (self.apt_get_cmd, self.apt_args)
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch b/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch
new file mode 100644
index 00000000000..34060c74634
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch
@@ -0,0 +1,46 @@
+From c036cfa1ee53a900b4ed45bc91e45a0792547eea Mon Sep 17 00:00:00 2001
+From: Mark Hatle <mark.hatle@kernel.crashing.org>
+Date: Sat, 17 Jan 2026 20:20:23 +0000
+Subject: [PATCH] lib/dpkg/options-dirs.c: set_rootfs was not checking
+ environment
+
+The set_rootfs function was using the hardcoded ADMINDIR (define).  It
+should be checking the environment, and then falling back to the define
+if not set.
+
+This matches the behavior in db_dir.c.
+
+Upstream-Status: Submitted [https://lists.debian.org/debian-dpkg/2026/01/maillist.html]]
+
+Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
+---
+ lib/dpkg/options-dirs.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/dpkg/options-dirs.c b/lib/dpkg/options-dirs.c
+index 9b7a122fe..34869d792 100644
+--- a/lib/dpkg/options-dirs.c
++++ b/lib/dpkg/options-dirs.c
+@@ -49,13 +49,18 @@ set_admindir(const struct cmdinfo *cip, const char *value)
+ void
+ set_root(const struct cmdinfo *cip, const char *value)
+ {
++	const char *env;
+ 	char *db_dir;
+ 
+ 	/* Initialize the root directory. */
+ 	dpkg_fsys_set_dir(value);
+ 
+ 	/* Set the database directory based on the new root directory. */
+-	db_dir = dpkg_fsys_get_path(ADMINDIR);
++	env = getenv("DPKG_ADMINDIR");
++	if (env)
++		db_dir = dpkg_fsys_get_path(env);
++	else
++		db_dir = dpkg_fsys_get_path(ADMINDIR);
+ 	dpkg_db_set_dir(db_dir);
+ 	free(db_dir);
+ }
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
index d793c26d57a..20f98d5d2d3 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.22.
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
+           file://0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"

