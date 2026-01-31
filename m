Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C8DD79752
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5008.1769846224862344642
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=W1VytMiM;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso20861365e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846223; x=1770451023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1570IQrm1P7aI/T6XIpQkLKtHEd8pBTaDCpGRxzrEs=;
        b=W1VytMiMtDuyjt/N+vVK3dsNRFfCU/F5Ng/MZnY4MGerZAz//ft6IoHJvUY35qhSOn
         g2+vmXKHErv/KRAUmeTfandrQskORZC6iwtGidYMcF49r4f4tENqhi9OxnOkGj6ZFfWl
         4r8e1hqEgBMeTuMjDt3Bfik1oqF191j7b69oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846223; x=1770451023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1570IQrm1P7aI/T6XIpQkLKtHEd8pBTaDCpGRxzrEs=;
        b=gFhajlPaioqgCiWYsKEH3SrJg1XGoGuadtxGilwfyM7cLMBPqF2kPfhUXINt6kSGgT
         J2nxOId7+hSFIL90lrgitXne2oeDrnV7TqgNBOn5dL4yv38DFMq6GJ6KQ9IWE22ZpoBE
         oqkiuKKz8aVMJt3ZmJAqBmJCFPMbglRid8MaIQ5mED7eO5gMN7ZmRJeXYJoDznCV/wn+
         AaT0eyowKSkiB+jEd9hKcf133Eg+ApbGixGnic0FW/+vlZYpip+UGZtx/CK+htnkZ6MQ
         RJishNKXJX5oX0V4YNok1uPqA0JSaW61w+4ghB1fxFAou2WZ51bu2Cj83dBZ2qvcUO+4
         Ts+Q==
X-Gm-Message-State: AOJu0YxC33uOfN5vMjUQaJEfSssq192XvyIaBFEJdbApjBnyuhphXBbT
	3sgMdGmGDPwWbfBQoKeXdi/lyjoD1Go9xHI54eox7z2YIy02oYv2g9pBvMrnI9NvQlETbQJH3Vk
	KjxDFb5c=
X-Gm-Gg: AZuq6aKlo6xQpbDxcwNv/MR7ffiysJeHAuJk2a9+k4i9QzAt8vBkrP3g4f3nnBg/ErM
	RSruNqww991tLHywK051f7xnxAGIyS+p4c9nWYiZf2Q4PcGgkxmsS03WmkPLeIEKXywYeM7rb/t
	hoyCRuWA98crTaDt+EZC4SnoyfSNGYISdoElmadp8MeCiVsDxnKk0pINPX+KZe547qNFsWuWx9G
	vKVb5vHOD0jJW78sA/gO00znFQzItfKeOagFwPdiZX6PDi4duSpdbqhGii8bjmFJIIJBOtZx/tG
	UdfydvCBuH6j01x20bcrgu+oEekN+ZVvVz44XM6E35eL0c1s17TOMsKo4aW0i06aJbeQi29j11l
	4Rl/HjncNwwXjuboAViu0yo/Mzgot+S0yjOPMk3WnXjyYj+s/BSsi5gw8Q3EtzVV9vJSFIuiNO1
	if8JBPVYJOJ6C6VpYCXSdOsdkwpagNy5BlxDwyTO1O3DytwX1KBcsVJGBh813HPqYojJwxDyj84
	cwYWl1H86q1ltaC
X-Received: by 2002:a05:600c:8b02:b0:47e:e78a:c833 with SMTP id 5b1f17b1804b1-482db4a51d8mr60763055e9.32.1769846222860;
        Fri, 30 Jan 2026 23:57:02 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:02 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 13/22] dpkg: Fix ADMINDIR
Date: Sat, 31 Jan 2026 08:56:24 +0100
Message-ID: <ff338bf1256ae4cce0b121b5627c9da997bd49d1.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230218

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

