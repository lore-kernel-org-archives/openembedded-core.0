Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id EEDA9605B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:29:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c84so4211674wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wBohBcGY92+UbYSCbLBOId+sCvCCVmYtzaYL+ElxAdw=;
	b=uOm8eJ0pj4IhB/SRfCyUXvS7GzowR98W8myRd1Ix4sQnbSlDgx/RJQlLN1FMw7/AMJ
	eRnxE5mQSk0t/mYMufOU8gx41Ybyced50mAurZlo8ytuIJFZRlauGyd8Y+t/c6pL5zaG
	WhVKUiCQbSU3iwvvBEi6mC7xXXqMja57WbF+hvaEazJg48CQUWXT+3AC/Rdkr6dyB3k5
	BJgcTFJwTKNYRvWL0jPdrHaDm26ONa+bod5Olo4mVt6O++tQ4bvB5bpzbQaSD8D1dSic
	cVl1dWMn14DJySl6uRPSAkJaCZ6oJY0qo7V9ypsd19yw2QUgxbwJM1DtyWHfMUN3FTb9
	S8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wBohBcGY92+UbYSCbLBOId+sCvCCVmYtzaYL+ElxAdw=;
	b=El67y5QbnKUesh5jdwc1MeFSDzbXSTnIutzVzS7yk1gsEz3ArCkM78f96EiRtsnQxr
	/b9dKkEKi1X00lAsXLDINEU3IQh2K/ahwP9bgcpfRtSed/7vNUr5wwrDlg/4KtHfXyb5
	qcP9drZ8rB8ClyqK8IVy4RoF227E9AXhLWDP/vakRjmRAxYUz7bgsUjP9PQ5s4g3vHp+
	QmUs2JPh6FAPB3ETAWfPpIwP7RoiWMxsB2qiHDffehViHQ9MrN09VsDujdkJiJAZ+NS3
	UeDhfIIQSa8x0co2GjZz5A0Zac+LZ4xYp6GG5w+D4iqHVHuNqERomRfA+hC5nby/ealV
	3Chw==
X-Gm-Message-State: APjAAAW5RE21GQnVoCbayVai7Fl8RNYfaIoEtnJMx6+cRnWis1xvr9b5
	IWKp4bXqwKMgTnNhQyCLo3chmu2J
X-Google-Smtp-Source: APXvYqwu4dGp3JVKONQdwm5/0iLgKJ7dzFYhu0y+bJN9CzIRdaBlMON449/esrt5pCWEi5xZFwu3qQ==
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr3053612wmj.170.1580360089723; 
	Wed, 29 Jan 2020 20:54:49 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	a132sm4702434wme.3.2020.01.29.20.54.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 20:54:48 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2020 04:54:46 +0000
Message-Id: <20200130045446.44017-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [RESEND PATCH] rootfs-postcommands: Remove spaces before ; in -ROOTFS_..._COMMAND
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
X-List-Received-Date: Thu, 30 Jan 2020 13:30:46 -0000

With spaces in ROOTFS_POSTPROCESS_COMMAND attempts to remove elements
using ROOTFS_POSTPROCESS_COMMAND_remove causes parse failures of the
form:

  bb.pysh.sherrors.ShellSyntaxError: LexToken(COMMA,';',0,0)
  followed by:
    LexToken(TOKEN,'write_image_test_data',0,0)
    LexToken(COMMA,';',0,0)
    LexToken(TOKEN,'set_systemd_default_target',0,0)
    LexToken(COMMA,';',0,0)
    LexToken(TOKEN,'systemd_create_users',0,0)

Removing the spaces between the function name and semicolon allows the
list to parse correctly.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/rootfs-postcommands.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index a7f33fbf9e77..ebf96be7e85f 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -1,6 +1,6 @@
 
 # Zap the root password if debug-tweaks feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
 
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks or allow-empty-password is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
@@ -12,7 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
 
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
-ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
 
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
@@ -26,11 +26,11 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only
 APPEND_append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro", "", d)}'
 
 # Generates test data file with data store variables expanded in json format
-ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
+ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data; "
 
 # Write manifest
 IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
-ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
+ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest; "
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 # Set default target for systemd images
-- 
2.17.1


