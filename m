Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.12954.1611672172081569215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tK97qbR6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id s24so774098pjp.5
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+me/bbTvivw9lhsE1krhs8yJqPVhx8Ifs49hIl5R+V4=;
        b=tK97qbR6bBZoErjZsus5RZJBytoeRGM6Tp18WsPxioadlwOHHmGGNlyPWhAqEUER3/
         yHAIRPh84buAPgv+eAtJ0JfeuQ/vCE8nzYtIJOqca1XyCak3NJt3jq7QFHlR1wNBm7nn
         gTR5CivNN2m0vJVVsMB3x2nkYOv4YPZ7QoItj5kYhCSZWAXHw+iwPXLmot/EvfWEwQS5
         4IGPUko2IuRyuJ0132W7fQ4n+jVIpg3MWbpav5jFLorMOonMORpUfuH3YwSBzSfo4foD
         gpR49AywW+1xl4dd1KzE4+b7JMSPOAwNg8xoubmuOsrFlVNKfBa8WP6asEyyKpeVXQKY
         yozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+me/bbTvivw9lhsE1krhs8yJqPVhx8Ifs49hIl5R+V4=;
        b=at3R71q3pal27WSCvaijCNP162OrwwS6XRLyE/7bUFQ7JaizchE+/tjzF8zBSL98qw
         KAGYB8moec8+L7tltHN/RXz9PM+iYM5KB3kRfwT+txWL8iaXppQ5zEAufr/2pbnmFn5T
         eMRSsLnaO/eQLug8j9jQcn5aGdVuVfDepPxVHL/X6CoMYeOJWqtSZagLMu+cFd35hi7l
         oVIWtfPxCOSc8yOnLMXaNv8BqXKnnYk8YZ1h7PJZDO1NeOc+cD0FCXidMcfqgOs5hHws
         tADDdZtqxf6Kr18QEu+HZ/lHvRL4Hy/hxhCnHgkkDoleKO8J7M0ID+5hNaVuB+IEjtMQ
         uz3w==
X-Gm-Message-State: AOAM532L2jFDmTLQcH/5yAkK5lJGvTDn2vAI/dmr0F6pF909b3ioiD3s
	TZFfkND9rR95kOf0P4e/0l0+dwLOWziYmh/mJ5g=
X-Google-Smtp-Source: ABdhPJx/iL/KDOrWw49jykG0MUPcTFgc669WCeNFzOFqYjVnhWRFU1fbP1KO3tbKrEXSoq7Q2WYvyg==
X-Received: by 2002:a17:902:7205:b029:db:d2d5:fe79 with SMTP id ba5-20020a1709027205b02900dbd2d5fe79mr6370935plb.30.1611672171044;
        Tue, 26 Jan 2021 06:42:51 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:50 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 14/46] wic: Fix multi images .wks with bitbake
Date: Tue, 26 Jan 2021 04:41:25 -1000
Message-Id: <4ce1e304279581f592c77b0e254801d13fa10caa.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

In order to support .wks files with multiple images inside bitbake we
need to explicitly set the pseudo database in use.

Eg: If we try this .mks:
part / --source rootfs --ondisk sda --fstype=ext4
part /export --source rootfs --rootfs=core-image-minimal-mtdutils --fstype=ext4

The username for all the files under /export will be set to the runner
of bitbake (usually UID 1000).

Before we run wic, we need to make sure that the pseudo database will be
flushed, and contains all the data needed.

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dde90a5dd2b22a539095d1bac82acc15c6380ac8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types_wic.bbclass | 8 ++++++--
 scripts/lib/wic/partition.py         | 9 +++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 70ea46ef5b..82f0985eeb 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -33,8 +33,7 @@ IMAGE_CMD_wic () {
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
-
-	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" ${WIC_CREATE_EXTRA_ARGS}
 	mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
@@ -89,6 +88,10 @@ python do_write_wks_template () {
     bb.utils.copyfile(wks_file, "%s/%s" % (depdir, basename + '-' + os.path.basename(wks_file)))
 }
 
+do_flush_pseudodb() {
+	${FAKEROOTENV} ${FAKEROOTCMD} -S
+}
+
 python () {
     if d.getVar('USING_WIC'):
         wks_file_u = d.getVar('WKS_FULL_PATH', False)
@@ -142,6 +145,7 @@ python do_rootfs_wicenv () {
     depdir = d.getVar('IMGDEPLOYDIR')
     bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
 }
+addtask do_flush_pseudodb after do_image before do_image_wic
 addtask do_rootfs_wicenv after do_image before do_image_wic
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
 do_rootfs_wicenv[prefuncs] = 'set_image_size'
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 6e87770f3a..18ecec2de9 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -201,13 +201,10 @@ class Partition():
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
         if (pseudo_dir == None):
             pseudo_dir = "%s/../pseudo" %  rootfs_dir
-        p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR", pseudo_dir)
-        p_passwd = os.environ.get("PSEUDO_PASSWD", rootfs_dir)
-        p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
         pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
-        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % p_localstatedir
-        pseudo += "export PSEUDO_PASSWD=%s;" % p_passwd
-        pseudo += "export PSEUDO_NOSYMLINKEXP=%s;" % p_nosymlinkexp
+        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
+        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
+        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
         pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
 
         rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
-- 
2.25.1

