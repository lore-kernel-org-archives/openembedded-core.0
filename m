Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.324.1611586344222222596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=S9qlEvNq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id md11so8559655pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+me/bbTvivw9lhsE1krhs8yJqPVhx8Ifs49hIl5R+V4=;
        b=S9qlEvNqzfa3l7CsO3n7RrmYvkWLUypjYM6dQGBRLh5dgMd0slA277arKBXDlW0R0y
         CBYjBfkHr0BUHm9XU5tm6mar+ME6wkAzBh1pYC2seAyMnoYrMMykGpWu+4hPhYJTJLWs
         5+k9vc/GYd64mKy6rXGvIdjCeNcgvpmFyqa5KtlRBjlgNOMfLIeYvhQHMeD9IfYrZjKZ
         PUyu7Vx1yhIn8NidYI084NqQnoxRjaAzuL3B8OxHRAtBTk8BLIbn1MVc39/TTSpi490B
         0/jWxPIKuWVfs1MT3lVqkpIZWpNt4TH99roUeaEN/lfkq9Zg62nFe4Z93EAtoTbi33ZJ
         BNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+me/bbTvivw9lhsE1krhs8yJqPVhx8Ifs49hIl5R+V4=;
        b=A/cdLDLNgmxtkXPGZqMnNDpZBbz4qc/nssdwfauaVK65itIGpOiVIn8XmNOwdfakBU
         ctqM7uhcKZrsgdYt43aPvszH5BEZ6WY9eLLyPmk/nfeW2t912K6x8abakOBanUN6Skk7
         RGB9TsK7CjZxZ57xzcUdWaF6N6AEkCPPmfkUAxQEjo1EPYoRPQXYAp4gSZ4gIX+0hJHZ
         G7UauFwLJQxrnl+c7/KtSPfuEwCZzkCYAfH4lWrIBKKcHu1k+tqtzclGDXQFTiBHhQw3
         VoLV5LNxypx9a2zZ5HVgRL4EXwJzk/yfyQLUB+NOS90STaG4nsZJ4rEA54Bh27z/1/ES
         Uxng==
X-Gm-Message-State: AOAM530ECOH9LSxlJYQYy7jqmLwD5gnarhnrILF8aKbIK6Aae+tMfUqC
	gA096vVlK0e3C5Ep+JEj1pNSHPtWNPV5HCKrs+Q=
X-Google-Smtp-Source: ABdhPJwRh+yrhORd2rHSxdVIUg7+McptNrvitE9FbkYUZn0eIud+nbMj/lCMRievhYTKJkyKOIZNuA==
X-Received: by 2002:a17:90a:448f:: with SMTP id t15mr564046pjg.159.1611586343312;
        Mon, 25 Jan 2021 06:52:23 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:22 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/47] wic: Fix multi images .wks with bitbake
Date: Mon, 25 Jan 2021 04:50:47 -1000
Message-Id: <2e0660ef870ab711502de61b5a5f4269fb136601.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
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

