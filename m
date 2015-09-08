Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2492460053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:06 +0000 (UTC)
Received: by qkdw123 with SMTP id w123so35245124qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=i2IbiBrfLtidfKfAQtZroY0lLorwr91FDYZsTbJSXs0=;
	b=LOqb83k9gkA2MQBqreTnWP3bwDe6ELVQZzCSjQN4T8hV3WHjFKI4DKx8Pzl6Dy3mGJ
	tqBieY80CEZX/bUSmuJ3XzsnKgRv3YNHYUvY2rYo+QdvB6Kpemazjalqjqk8KpBOq7UU
	dIniggJ9Cnvt2DCzUbsRbHb/AUpFscGrbGU6tVv9orr0J2zDuxmn4THir+/AIfpkf8Fo
	UNFyuIhN65GNpVAYPp9pyJOttpMYf1jayRzF2CLzplSEJC/jTfF1xsq3N+WHoovi7+SQ
	8HC0CF6Dft/0hklYnT39f5G9s6BE4S+6393qbKhYM0PnOOCZYIS5AtL6c7qOSM92x38q
	A6Rg==
X-Received: by 10.55.24.78 with SMTP id j75mr39758460qkh.95.1441753687071;
	Tue, 08 Sep 2015 16:08:07 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:48 +0000
Message-Id: <d95601e6b0ab4ee446942f5826ce7963b3cdb505.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 08/16] latencytop: Fix build with clang
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:07 -0000

Clang is stricter with syntax checking and flags the functions return
values if they dont match with function signatures, Fixed thusly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-function-signatures-to-fix-prototype-mis.patch | 64 ++++++++++++++++++++++
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |  6 +-
 2 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/0001-Rectify-the-function-signatures-to-fix-prototype-mis.patch

diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/0001-Rectify-the-function-signatures-to-fix-prototype-mis.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/0001-Rectify-the-function-signatures-to-fix-prototype-mis.patch
new file mode 100644
index 0000000..b248133
--- /dev/null
+++ b/meta/recipes-kernel/latencytop/latencytop-0.5/0001-Rectify-the-function-signatures-to-fix-prototype-mis.patch
@@ -0,0 +1,64 @@
+From db112739dc4f608a968b8104b382955dc3d96ca3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Sep 2015 07:40:10 +0000
+Subject: [PATCH] Rectify the function signatures to fix prototype mismatches
+
+clang is less forgiving when it comes to coding standards, correct the
+function signatures to reflect the function logic
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ fsync.c      | 7 ++++---
+ latencytop.h | 2 +-
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/fsync.c b/fsync.c
+index 82dff0e..5cefba9 100644
+--- a/fsync.c
++++ b/fsync.c
+@@ -51,7 +51,7 @@ struct fsync_files {
+ static GList *fsync_data;
+ 
+ 
+-static chain_file(struct fsync_process *proc, char *filename)
++static void chain_file(struct fsync_process *proc, char *filename)
+ {
+ 	struct fsync_files *file;
+ 	GList *item;
+@@ -75,7 +75,7 @@ static chain_file(struct fsync_process *proc, char *filename)
+ 	proc->files = g_list_append(proc->files, file);
+ }
+ 
+-static report_file(char *process, char *file)
++static void report_file(char *process, char *file)
+ {
+ 	struct fsync_process *proc;
+ 	GList *item;
+@@ -157,9 +157,10 @@ int enable_fsync_tracer(void)
+ 	write_to_file("/sys/kernel/debug/tracing/current_tracer", "fsync");	
+ 	write_to_file("/sys/kernel/debug/tracing/iter_ctrl", "ftrace_printk");	
+ 	write_to_file("/sys/kernel/debug/tracing/tracing_on", "1");
++	return ret;
+ }
+ 
+-int disable_fsync_tracer(void)
++void disable_fsync_tracer(void)
+ {
+ 	write_to_file("/sys/kernel/debug/tracing/tracing_on", "0");
+ }
+diff --git a/latencytop.h b/latencytop.h
+index 5394d73..9d107a8 100644
+--- a/latencytop.h
++++ b/latencytop.h
+@@ -54,5 +54,5 @@ extern char *translate(char *line);
+ extern void init_translations(char *filename);
+ extern int fsync_display(int duration);
+ extern int enable_fsync_tracer(void);
+-extern int disable_fsync_tracer(void);
++extern void disable_fsync_tracer(void);
+ extern void update_list(void);
+-- 
+2.5.1
+
diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index cb0a3c5..f31f1bb 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -10,7 +10,9 @@ PR = "r3"
 
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.gz/73bb3371c6ee0b0e68e25289027e865c/${BP}.tar.gz \
             file://latencytop-makefile.patch \
-            file://latencytop-fsync.patch"
+            file://latencytop-fsync.patch \
+            file://0001-Rectify-the-function-signatures-to-fix-prototype-mis.patch \
+"
 
 SRC_URI[md5sum] = "73bb3371c6ee0b0e68e25289027e865c"
 SRC_URI[sha256sum] = "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef"
@@ -21,7 +23,7 @@ PACKAGECONFIG[x11] = ",,gtk+"
 
 EXTRA_OEMAKE_X = "${@bb.utils.contains('PACKAGECONFIG', 'x11', 'HAS_GTK_GUI=1', '', d)}"
 
-CFLAGS += "${LDFLAGS}"
+#CFLAGS += "${LDFLAGS}"
 
 do_install() {
     oe_runmake install DESTDIR=${D} ${EXTRA_OEMAKE_X}
-- 
2.5.1


