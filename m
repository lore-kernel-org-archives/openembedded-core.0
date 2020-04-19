Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.12736.1587278146861593158
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 23:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n9nNQcM8;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id k11so7975699wrp.5
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 23:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rEohjJ9HtEr8GjsAyCV+gybzA/VGVwg7NyvhhyH4OFA=;
        b=n9nNQcM8KCNUpzihq7MgQTihAaddzILtW43zshaEwIUFs+vmtLS0WnxDQbD+Meq7bL
         mkrBaXtkMVwrBtyDY8Pkd3oNEI3bmncIOhrcYED2U8EMh4uaViaAkrxkMsiI+iQ/+epi
         /8MZpbuXN6HA6oL4pwOwbLDDvuFbgmepgaA8kxpVR6jcQN31+92vAW2QAnGEGJ2TrfJB
         xwPaMZfJ51fEzeJYKrbtTbx1Uprl4GH8S1zZmErMRHe2fOKeZvpsdX3Rjtefe7yvpCJU
         2MblbM3yORrWS/QZhU3kuqVjaLKUzdQmY3ifLAaFKgr6ymuhGJINISgPZ3BIwRXjUPRc
         r5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=rEohjJ9HtEr8GjsAyCV+gybzA/VGVwg7NyvhhyH4OFA=;
        b=q96pxSTidi1W6ig7WhFFzoYh10darsZwstF5lAvflQji63B+N08o8nQDcHOQ3omC7y
         TwOKOF01LAVJyLMGd2W+BY6wtr0jfFFxZYokYWjnb2KyJZ/EYQ9+4zqX1G91nrxhhibd
         6e9p43d7rXtemUK3Sw3+TNkESvqD2S7wHxUISMzMM72ypUIOVuJKHj8y/KFrxPUtau8E
         YCtm6u29zh+iNH1tO3L04TUpaVwchoc4ZcdJ57ssgW6NbeOg6gTbjCd7F1bDT0+DrxqT
         NoYyiNrYO6lvuA8OBLMA9KiMe4xulmfHpm0xyXlKhv9e6OSbuqaXB8wODOii7siKw1f0
         lpSg==
X-Gm-Message-State: AGi0PuZYj0sG3Nx1mQe6kOOAEPzqQj/mfX70KOLz7yv1XlKR0repL+lL
	F6UTPsV9uWs44w61LKuVXw8YElGFKBc=
X-Google-Smtp-Source: APiQypIyAwFGfSCdmtBSLxAB8xW4bIvWQRAIFmityv8PgorgA75j8jzw/xHW6mgdm0GZ4DRH6KpFsg==
X-Received: by 2002:a5d:48cc:: with SMTP id p12mr13020154wrs.170.1587278145088;
        Sat, 18 Apr 2020 23:35:45 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n6sm13980266wmc.28.2020.04.18.23.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 23:35:44 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v7 02/10] wic: Fix multi images .wks with bitbake
Date: Sun, 19 Apr 2020 08:35:30 +0200
Message-Id: <20200419063539.1467641-3-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200419063539.1467641-1-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
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
---
 meta/classes/image_types_wic.bbclass | 8 ++++++--
 scripts/lib/wic/partition.py         | 9 +++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index b83308b45c..96ed0473ee 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -32,8 +32,7 @@ IMAGE_CMD_wic () {
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
-
-	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" ${WIC_CREATE_EXTRA_ARGS}
 	mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
@@ -86,6 +85,10 @@ python do_write_wks_template () {
     bb.utils.copyfile(wks_file, "%s/%s" % (depdir, basename + '-' + os.path.basename(wks_file)))
 }
 
+do_flush_pseudodb() {
+	${FAKEROOTENV} ${FAKEROOTCMD} -S
+}
+
 python () {
     if d.getVar('USING_WIC'):
         wks_file_u = d.getVar('WKS_FULL_PATH', False)
@@ -139,6 +142,7 @@ python do_rootfs_wicenv () {
     depdir = d.getVar('IMGDEPLOYDIR')
     bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
 }
+addtask do_flush_pseudodb after do_image before do_image_wic
 addtask do_rootfs_wicenv after do_image before do_image_wic
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
 do_rootfs_wicenv[prefuncs] = 'set_image_size'
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b02711be37..d850fbd1b1 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -200,13 +200,10 @@ class Partition():
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

