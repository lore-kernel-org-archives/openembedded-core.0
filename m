Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.12081.1586447578996175229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 08:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EiKpLTRG;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id t203so260713wmt.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 08:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CVa5dxZzdOFbkFiCcB1j3JUGFJWxNjdMBeKFGxMfMbw=;
        b=EiKpLTRGhYc+Tkf5pSL6PnLUicGfiw4zyx43mG2d97m5xcESF5pDbmXPT63jmlAQkO
         +dwtFXt5EU6za6D+0ZkNbn2endGhfHJVVIvB7KaU11dzUL2PbcCCOKKbLrJ9ZVsJIjow
         G7pyubCTOBj6EAwcmvB96j92h0LloPe4+EvgcLJVQW+zWQKvfwq3caj6B6N/kGoQRbgY
         slzDXWlQWcM2ozljKZbl5/0szqoyRfOULlmkvjuWH97ttlWkROIn9Me6rF6A/NSCwU5G
         YnNXAMspk/WZMoVr0/ClBdtWc6nFyu/JRSYaTuw+evwd7gR4mdwG3/DzgUtX3u/OCdAQ
         JHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CVa5dxZzdOFbkFiCcB1j3JUGFJWxNjdMBeKFGxMfMbw=;
        b=AiKNrOQdxRulFgpCkRWyCkCXdd4oR/RRbcf/lDA9uChtVJO29/VpCC77rkeC1QlWp1
         B5UWcJDmHe4XOM8io5cbwPPpt5ZGG+wP/UQzJrKKBCjCEOieSfS1y+PrWVhbBl559NNQ
         i1O6E49k5AxphKGQ1UtJc1zKgDjHC+nTPWFZXRk/OtTVN9kBgX3TftrQBVW7ccpQz/aR
         9wOcDhJqPCOSHVwxTkn0QjMN8dML11Fft78lbsHzf5WWBe4hqckv5S6qdUoigYz8dXzO
         mjlVsqpFqrkqduVUPCvi32cfxaHhheaBADE7aoG9R/z1vUcGpZq/O8k1XpWUwOvXnJLt
         +wtg==
X-Gm-Message-State: AGi0PuZzFc1scK7lzSIRVl3yWB1CNEH5/X2edyOweXn+I3euBzVVH9Jo
	BqEayUFQa2cqSrONmlxNmJDz4NzntuY=
X-Google-Smtp-Source: APiQypJDc50JOkXNioJ+W1rHH2LApFKETQe4O8GjaPUZ1tGbsvfdqcOtE19GRL+00u82RXL9ke5J2w==
X-Received: by 2002:a05:600c:2214:: with SMTP id z20mr522413wml.189.1586447577242;
        Thu, 09 Apr 2020 08:52:57 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t67sm4253635wmt.48.2020.04.09.08.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 08:52:55 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v5 2/6] wic: Fix multi images .wks with bitbake
Date: Thu,  9 Apr 2020 17:52:47 +0200
Message-Id: <20200409155251.982424-3-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409155251.982424-1-ricardo@ribalda.com>
References: <20200409155251.982424-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to support .wks files with multiple images inside bitbake we
need to explicitly set the pseudo database in use.

Eg: If we try this .mks:
part / --source rootfs --ondisk sda --fstype=ext4
part /export --source rootfs --rootfs=core-image-minimal-mtdutils --fstype=ext4

The username for all the files under /export will be set to the runner
of bitbake (usually UID 1000).

Before we run wic, we need to make sure that the pseudo database will be
flushed, and contains all the data needed.

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

