Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.6416.1586429399377388396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 03:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cCtmPpqF;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id a25so11406833wrd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 03:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CVa5dxZzdOFbkFiCcB1j3JUGFJWxNjdMBeKFGxMfMbw=;
        b=cCtmPpqFPQrMWFD5qIsXegEA6saIb8Wnt2EcglvwmRT7r+Qk0vrqN6lFiV0OqVkuh4
         7xrEjc5dX2OjViRHiYMQKdHO6UIz5PpJKyIjnlaZhndlmK0QLrItl4rmVIPdnKY1mqrS
         Occ2Z/jLHqBPkIs9m4GBnXmQAl2Q44HByz6csjJD8YL2tzqLxLIGNvJtyfywICz8+Zr1
         XLgEIoCG9PkCcJyh6m/9Lp2Fpj4DkfPjFDo9mG2ywbB+gTneyTVYA7n8r/dERdEJdWSH
         AfJZcESguYf69V94lu+u27hg4CcoRyDVqRUwEBrxDczI2B3pHLNzzQ5/UkduB20ImrAW
         1sdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CVa5dxZzdOFbkFiCcB1j3JUGFJWxNjdMBeKFGxMfMbw=;
        b=mKqbanyc23xhQrWXNz6Z08W3f1tCFukk4nJny9L3qlT8Kzu5eIXgLLZNAikTkGmw2D
         vCnLhFtBaGDZH5T1xvO6FwGAcj+0v2THbYBgO/k/HyGCAkyFCfLefdZ9xCjokZ9AgWnG
         siBqI6aGWkxV/D+PFoU+tkBhiq/KRkvARSRDHD3hQUXwQhU2nVdjIGepiNAjJh10N8uv
         m+q9mzZvIPvNFKEyY4Tr84q0TYRAdV9ptBwRK3ZW9DCmzz1zkuvhYKafPIs9f8Xyut/M
         okVFpa2E2KuKB8+/13y8Q34Z4DxxOx5n4agFkaQhzKZTm7w5wBTEpchHAvDM563ucjL/
         UbCQ==
X-Gm-Message-State: AGi0PubF6C3XENX+k1HiCGV2ekDVDHae4VZV5vjZS+xId5KYeCQzMJrm
	ICIt9BM1yi4CkDOYzKtROy2Yh+aFAM0=
X-Google-Smtp-Source: APiQypJMg9fvjFJNWzzchKYo3ergljZLFLrtyPlowJwMTbmu3MJ8R+yaxFUuvbQzIYMh3OdNYlPlSA==
X-Received: by 2002:adf:f8d1:: with SMTP id f17mr13134750wrq.194.1586429397707;
        Thu, 09 Apr 2020 03:49:57 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id l5sm4985737wrm.66.2020.04.09.03.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 03:49:56 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v4 2/4] wic: Fix multi images .wks with bitbake
Date: Thu,  9 Apr 2020 12:49:49 +0200
Message-Id: <20200409104951.948242-3-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409104951.948242-1-ricardo@ribalda.com>
References: <20200409104951.948242-1-ricardo@ribalda.com>
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

