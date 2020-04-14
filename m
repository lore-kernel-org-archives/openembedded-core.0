Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.11164.1586871385146552863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 06:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aACUkN+3;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id k28so9376314lfe.10
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9/W39eZtCBG5JSNmIfnclNW0umIWM1e9tQSB+rELy5A=;
        b=aACUkN+3LxdeAzx09M+MqDgKhfE1rHF19gaaQbFMdW67c/NvKqQETt3psxnEB1ZwRS
         pG64cnTf+wkMlzXgMQi72wZdcS9CoArxJIL35NI/TCp8dmLicXxW7f75RfqPwLmfcqPy
         mCEpHP+g0R9MMVeONWq0cLqswT/Hfp0xa9Imr/sfWJf9C/hWIHsnGXGsXw5mnAatr8/O
         gucD63r4yO3a+ckb6GlwgsEMKiHIgqxAwoMxH5RJaIH5bhl5E4o5JwFtOE0O/mbil8ZC
         xStQ7CF66QNXrZZw09vu5qOQQSy+ac5ekR0j5ZrMFzJ03pg3X5izzeitvrM95QrmtIBR
         Lskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9/W39eZtCBG5JSNmIfnclNW0umIWM1e9tQSB+rELy5A=;
        b=RrcxDkQLreb5qwV8HLAnRZ/BSNfJ9N0KJh+wPY/ImhekvR3lpJggIJph8lTpyF7JrT
         V30ZDkfYUdz981d9tNNeiFNSj47N2k1tW9NdIZFkOLft3lAiudpGlCPlp7nAKDZWendE
         VDv/5ZRf03kBrT/PsauULS/sZfO7Re2BIQj/g71qPW7LxLHtoRv7XEXxs96FCnxpvs6V
         IzWY8Wq50TkKAP7lVFjct6vB8/+flBVHOYxtVNVhCiFjpOf8SLlXRj9PynVOtefhFbCF
         dKwEcG+gaBXOxTAIDmj5R9UPeiE47uX0jSpDJPE7oULzkL2WfTWiN04xYq5EUjjQeGIA
         +VjA==
X-Gm-Message-State: AGi0PuY9qMdIaoi/Ghaypi9cLJ+A5bQI3xIeAuRUN9G9bGF5apNorP+3
	0Hett4TalaiXuXJWvcMkoePQuYhJQ/k=
X-Google-Smtp-Source: APiQypLE7u4R0Jonu09X3Ppjgf+kNdi6+RDntrJ+4Ti+ovQ/3OdoWeygKwKEqiPZxXAHvEXTR/1Peg==
X-Received: by 2002:a05:6512:3189:: with SMTP id i9mr13840950lfe.178.1586871382834;
        Tue, 14 Apr 2020 06:36:22 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o6sm9218344lji.15.2020.04.14.06.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:36:21 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 02/10] wic: Fix multi images .wks with bitbake
Date: Tue, 14 Apr 2020 15:36:06 +0200
Message-Id: <20200414133614.1830058-3-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414133614.1830058-1-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
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

