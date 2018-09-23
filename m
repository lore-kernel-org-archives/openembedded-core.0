Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A58560401
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Sep 2018 17:21:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k5-v6so17380560wre.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Sep 2018 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yqqmPI+ZrkT8bipOt0Y6cM5sfnnePybN4ZP2I5KW6rI=;
	b=N3m96hXhpIUcXIBUvatrOdMb5mDaswOSTdFbpe+byKDoBhtK23ywDrdWz10rQWhj/5
	/nk/jh6+gCRxoXwtKuBdyVdhxxiYFGfWGnKpfcqxfF1YuurYrKqk286FFcKXDth1/Zx5
	yZzfkAgvaXEcNms/7SaPLrOnQ6iHIkqXJClezhSZQSQNzr4pLQv/25UNJCEYwrsRSJEy
	NXHL3U5XZnHtVytzn1G8Pw34Wa6rXEhBTR5eKLsaMJswYEKaApk2Kz2YwSMyH7K5KpOH
	yZlT8n7hDAdt0tswfbbWfy6jl248qHYlz67jUPX9opS4rOSuumn4Hh+CX6108UdliKAe
	C/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yqqmPI+ZrkT8bipOt0Y6cM5sfnnePybN4ZP2I5KW6rI=;
	b=Wl8C1p6TjZVIeJJ7YAX4WO7fO0Gu2vt4I9T1toKk4Mqyzo+ie6rhMaZJMfOUVP1V4U
	jlOi6bg+0TvZkQ8Fs65AmuV6Hu0C9kfk+oIUzWI41FDl+0L1eJXz+PKV5BCr++W7wl49
	kIqNsP8IGwgrCufnqSxalVwHZIP0TGxEIBnqt7ei7zPRJW/3BGcApY7U/wILgx1pVjbX
	WiYAH84AN6LlNiM/zzkRx/XunYbt4QHa1zqzk6ec4gT9FM7KQ63hZrqEkstHabgSYNmf
	vGF/8idhhhjN+WuJk7/OPRHUqtdOIbAhdKEiZMNpTfA1ETY5mm+D7Owzq1ulDrEyWDs2
	oudw==
X-Gm-Message-State: ABuFfogLBrAmHqtrA1ipo8k6SnZj8/3iojfspsus353b976bq3FNfa2f
	cyaq3O3uVQSacY8vO42zRsgebfa1pkY=
X-Google-Smtp-Source: ACcGV62Z2llIpnENU9OTe00BwUb+PIRuJhW6lO7pPZ/El/YS3CNScQRSRNplU37VvySUuwTq/dXb0w==
X-Received: by 2002:a5d:61c1:: with SMTP id q1-v6mr5966367wrv.33.1537723264672;
	Sun, 23 Sep 2018 10:21:04 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	q200-v6sm17586178wmd.2.2018.09.23.10.21.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Sep 2018 10:21:03 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Sep 2018 17:21:00 +0000
Message-Id: <1537723260-31975-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] glib-2.0: Drop allow /run/media for root patch
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
X-List-Received-Date: Sun, 23 Sep 2018 17:21:04 -0000

Upstream implemented an equivalent fix in:

c672fcc0a8d6 ("gunixmounts: Allow root to display mounts under /run/media/$username")

As a result, this change is completely broken when running as root, as
user_name is unitialised when testing strcmp(user_name, "root") so just
segfaults.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...un-media-sdX-drive-mount-if-username-root.patch | 37 ----------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb      |  1 -
 2 files changed, 38 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch b/meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch
deleted file mode 100644
index 304047942245..000000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 66e5fd5e870a2de04ec0f0c5dbfa23db496bad43 Mon Sep 17 00:00:00 2001
-From: Marius Avram <marius.avram@intel.com>
-Date: Wed, 27 Aug 2014 12:10:41 +0300
-Subject: [PATCH] Allow /run/media/sdX drive mount if username root
-
-In case that the username logged in the system is root
-the drives are directly mounted in /run/media/sdX and
-not /run/media/<username>/sdX as the function
-g_unix_mount_guess_should_display() expects.
-
-Without this change USB stick mounts are not accesible from
-graphical applications such as the File Manager (pcmanfm).
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Marius Avram <marius.avram@intel.com>
-
----
- gio/gunixmounts.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/gio/gunixmounts.c b/gio/gunixmounts.c
-index 355329c..6467fc5 100644
---- a/gio/gunixmounts.c
-+++ b/gio/gunixmounts.c
-@@ -2745,6 +2745,11 @@ g_unix_mount_guess_should_display (GUnixMountEntry *mount_entry)
-             is_in_runtime_dir = TRUE;
-         }
- 
-+      /* Allow no username in path in /run/media if current user is root */
-+      if (strcmp(user_name, "root") == 0 &&
-+          strncmp (mount_path, "/run/media/", sizeof("run/media")) == 0)
-+        is_in_runtime_dir = TRUE;
-+
-       if (is_in_runtime_dir || g_str_has_prefix (mount_path, "/media/"))
-         {
-           char *path;
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
index 92c7997a2724..6ebf1d259944 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
@@ -8,7 +8,6 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://run-ptest \
            file://uclibc_musl_translation.patch \
-           file://allow-run-media-sdX-drive-mount-if-username-root.patch \
            file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
            file://Enable-more-tests-while-cross-compiling.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
-- 
2.7.4


