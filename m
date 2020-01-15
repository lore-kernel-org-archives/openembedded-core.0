Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 89A827FA2B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 07:25:13 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y17so14668277wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 23:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LOfuo7PqZtdBsn9W6O+PEWYrssVAUPgRoD16kBEAOX8=;
	b=N2zVJC6SjTOiI4w9PLK/i8Z9YLqGdbfxh7w0v+1XfzzKxMLxFZwf18kHO46DLrD7EV
	48FV93rfT5aZcZlVqF8KnEh+oqUYRs7vcrthwFBLj7UcqIKVVTazq2Qvq8aLv5xMeDQn
	+rJAkWnqsriSi2OZn25l8byn0CpnEQSNaL1bBKhyxnVKqLbqVVPOxNJBqZKOjJtmrBuO
	+f+G+ahXzZ8M2gUUIa9/5lHgW+7/SvhXDnfAiJ2TmmzEr3XurP7oSvDIY80A/xfkJoO0
	DX/XxPbqzCx25pFn4HmWuVnx8vchQvGmW2mGhJX6y4zYO4toVC6hMZ7u5itCuW5/PgFZ
	poCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LOfuo7PqZtdBsn9W6O+PEWYrssVAUPgRoD16kBEAOX8=;
	b=WHLFWRDSUes+sI5fy3HMz8ukJI/ZLjaCpzdEnZ1t408n6M9Hjpo1CgKB4Uu6XTyXvl
	T7Rx3gLIfxlafM5/gDmxklmdmGAs6GptMnu4l0ymyCMkrLSGzhnnBWkC1Q8/ymVhBzAd
	qJgT2d6fdy5Ejpv4HdwEgU0mvAZDMR29UjE0Job575Y3owj1XbPC7jZZxe7q8Imd8Ldi
	4nO4szUgolg/g4GfjH2CFOwXrAGuzS14iOjqMZrwDYQSynxMzUU3/rO0sUPk8aqMELIB
	VF8aJs4jIaFwBfuhA6Rtm0jxTdBvrWA1hSUiIQdD02fosINEPOpLoKpgH7L2K4QTSsoc
	iBdw==
X-Gm-Message-State: APjAAAXTdHpowbFzl1zuXWT47IqaWzvJ2H6hoXg6Up4DzelbkfCDtFD+
	C2yBXov5C/ZmnBgBGzspUuv5OOug
X-Google-Smtp-Source: APXvYqwgcFtcdXUysYSx7U2l+PMMGYjOb2fJHO4I7Yvz4H+dBCbezgnrm7PgjUnQm0gmlQ52TFiYjw==
X-Received: by 2002:adf:f802:: with SMTP id s2mr29878632wrp.201.1579073113794; 
	Tue, 14 Jan 2020 23:25:13 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	s19sm21199596wmj.33.2020.01.14.23.25.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 23:25:13 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 07:25:11 +0000
Message-Id: <20200115072511.105367-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] rootfs-postcommands: Remove spaces before ; in -ROOTFS_..._COMMAND
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
X-List-Received-Date: Wed, 15 Jan 2020 07:25:14 -0000

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
index 2c0f16cebd4c..fdc63bb64d55 100644
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


