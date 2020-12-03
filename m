Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.11318.1607008159513523468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mjt/DlB6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id x24so1463849pfn.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZJmV7fAsGG3rS/15fLw6brkRPtlprQ1OGsHvf8ralIQ=;
        b=mjt/DlB6udHzl8ReM287i29YrdHhG4XPrQVcgWE1zrgZU/VzcUOKaujR8AN2qDEcpp
         zuWtVFPzaUL7nQ8iNzENdROfGIKF9KYsaHiVUpW9bvumIioMbzTbqxjikkAL0nR/Lz+t
         5U8EzgT/Qn4DXurpbDUa0KYzFO+KXRhtb9LAJtfpWMH/kMnPHaJUreTiH2hNmKqSKiwI
         9ZY0wPuJyZGOvRwuvGBHhl7KajkJD4uLPiK0vBu0I3e3Lo3YHvXkEn4CDZJJy3ZMGXIK
         cFyadrE0CFUZEiLmMQhSU2d/eAAm+D+HS0rEqGFo6xxW/3/K6Xy9TY73YRvl3n+sC3hG
         GtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZJmV7fAsGG3rS/15fLw6brkRPtlprQ1OGsHvf8ralIQ=;
        b=PiQcgoJ2PUuR/IEWNp6ZjlyBV9vL+agy87pdcAkc8vpShTYSl0d7C9tVWVbs8gGyOh
         7ta88KtAlRzy16+Nd71lQIOle3RkLrSnjnsLCWijdyZve2D3uC/8CD8yT+a+KCZD3gh3
         MkFs9ba1XkmayBjflQ+rZDG05J0P9x2YmjA32JOb0uANsPiQECtppf2YWb0qUzzcdGyh
         natJrABFskxvMdywQlLoUS2Fy7ZxrKzFnX/jMtyIcmYCrHGi9ovtYPf3AITiS6jE7/Xh
         aYX5WhFeeF6Yz6a5bJWJWo7pEy4aTLbCcxeGC9MIVqmUz/vPs6YC91opptVwtLcUN52y
         3iyg==
X-Gm-Message-State: AOAM532SVbgm6pGP4phgn8eutav5NVV0zWCGOpn8EqqaVjAPF2pLfA8y
	Cg1lEDsI9HGUjFtFR9QckKdl8sXEPhkkDSQ3
X-Google-Smtp-Source: ABdhPJzAaLu2WXvviRifYSFOGXy4t6SFO4NVhBdJffVxOTragbS00wfr0qmgBsO1AzR4JJyWMG+Opg==
X-Received: by 2002:a65:66d3:: with SMTP id c19mr3342105pgw.215.1607008158327;
        Thu, 03 Dec 2020 07:09:18 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:17 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/28] wic: Fix multi images .wks with bitbake
Date: Thu,  3 Dec 2020 05:08:05 -1000
Message-Id: <bfd602099f08b60ab6e561a561d47f7406ae22bf.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

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
2.17.1

