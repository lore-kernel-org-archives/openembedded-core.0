Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id CF147719F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:05:52 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id k184so167162937wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OVGOcmkX4JMTPEHJYRvCLsZQ9YEeJmd4bncPsJGHtcc=;
	b=DHShb5kmBKdqDWDI1T47XQpWo5IDwvGP8y7Huj4xLx2sVzSvbqSNEl3VX7TkJMr8AV
	d391MFNHYatBOhd/MLomxDoviVyMh6uY6rI9p0QlsBRexXL+vb1QJZgdBpNRsLQKvkeh
	3u01wRx7qKl+WqmAASDGnk+5CuN/H3rVtquZyzdX/c7S3eU5AhPVALhdl3L0yWxrbJrM
	tQGQHoFWAxQV2zuxxWgpIPX7nT2WY8HW1xNY91UNYFErCg1++8icCzsRKJ3bt/4hvxpH
	d042cnOIVMQqCMrZO7ZW2mijz9j5TEyqyOvCoK8+4wD7YbS9O9tnlPuSYgrakOo68Y2k
	5wUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OVGOcmkX4JMTPEHJYRvCLsZQ9YEeJmd4bncPsJGHtcc=;
	b=tIy+a63AKhtI06v3Cb+ZvBXl2P2M6i8qjvtb25y5OaGPoF/iPpuNE/2yMIdMr/NbGJ
	LpWuBdntGlIrpNjO6YL6cYon8QJfGwOCL/vcakt0br1WBXRdRAt+n6mtnmiZTMUhrWt1
	ovDThsYmPL8Z0qINqCBwVDZQn6Gzv+b8Vs10Qyln7Ep5+YReZs5uQfLegUnHIDxrfclU
	CXVWbI25zvPjcNKOp3DI2dzdBL3YeFdpT45G+2uVsRiNGgovhJDmslZKxzllwNjgMK91
	xb0sygYDBfeT+bXCoqVGTs78bb4StHq/bXOh4lBPLKpa4b49NYLiYBXePCNmC9jBzXrp
	/f4g==
X-Gm-Message-State: AIkVDXJO1iJZqDnvILWATc+xx8uPRk45rv191Bi7l8KuTExFQsOFZIFbciJqNPPTZzyIy25V
X-Received: by 10.223.172.245 with SMTP id o108mr2860663wrc.39.1484064352332; 
	Tue, 10 Jan 2017 08:05:52 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	di9sm3958074wjc.37.2017.01.10.08.05.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 08:05:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 16:05:47 +0000
Message-Id: <1484064348-22446-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] opkg: fix conffile errors in 'opkg status' calls
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
X-List-Received-Date: Tue, 10 Jan 2017 16:05:53 -0000

If a conffile has been deleted (common when building a debugfs) the status
command will throw errors instead of handling that situation.  Stop the code
being executed in the first place if it wasn't asked for, and handle errors
gracefully.

[ YOCTO #10761 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../opkg/opkg/status-conffile.patch                | 69 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.3.4.bb           |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/status-conffile.patch

diff --git a/meta/recipes-devtools/opkg/opkg/status-conffile.patch b/meta/recipes-devtools/opkg/opkg/status-conffile.patch
new file mode 100644
index 0000000..6fc405b
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/status-conffile.patch
@@ -0,0 +1,69 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 086d5083dfe0102368cb7c8ce89b0c06b64ca773 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 10 Jan 2017 15:24:59 +0000
+Subject: [PATCH 1/2] opkg_cmd: only look at conffile status if we're going to
+ output it
+
+The loop to compare the recorded conffile hash with their hash on disk is
+outputted at level INFO but the loop was executed at level NOTICE and higher.
+
+This means that if a conffile had been deleted the status operation would
+produce error messages for output it isn't displaying.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ libopkg/opkg_cmd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libopkg/opkg_cmd.c b/libopkg/opkg_cmd.c
+index ba57c6a..37416fd 100644
+--- a/libopkg/opkg_cmd.c
++++ b/libopkg/opkg_cmd.c
+@@ -638,7 +638,7 @@ static int opkg_info_status_cmd(int argc, char **argv, int installed_only)
+ 
+         pkg_formatted_info(stdout, pkg);
+ 
+-        if (opkg_config->verbosity >= NOTICE) {
++        if (opkg_config->verbosity >= INFO) {
+             conffile_list_elt_t *iter;
+             for (iter = nv_pair_list_first(&pkg->conffiles); iter;
+                  iter = nv_pair_list_next(&pkg->conffiles, iter)) {
+-- 
+2.8.1
+
+From 225e30e0f9fa7cfeaa3f89e2713e5147ab371def Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 10 Jan 2017 15:28:47 +0000
+Subject: [PATCH 2/2] conffile: gracefully handle deleted conffiles in
+ conffile_has_been_modified
+
+Handle conffiles that don't exist gracefully so that instead of showing an error
+message from file_md5sum_alloc() a notice that the file has been deleted is
+shown instead.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ libopkg/conffile.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libopkg/conffile.c b/libopkg/conffile.c
+index b2f2469..7b4b87b 100644
+--- a/libopkg/conffile.c
++++ b/libopkg/conffile.c
+@@ -51,6 +51,11 @@ int conffile_has_been_modified(conffile_t * conffile)
+     }
+ 
+     root_filename = root_filename_alloc(filename);
++    if (!file_exists(root_filename)) {
++        opkg_msg(INFO, "Conffile %s deleted\n", conffile->name);
++        free(root_filename);
++        return 1;
++    }
+ 
+     md5sum = file_md5sum_alloc(root_filename);
+ 
+-- 
+2.8.1
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.4.bb b/meta/recipes-devtools/opkg/opkg_0.3.4.bb
index 5cf2fac..6ac9438 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg-configure.service \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://status-conffile.patch \
 "
 
 SRC_URI[md5sum] = "6c52a065499056a196e0b45a27e392de"
-- 
2.8.1


