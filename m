Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C42CFA47F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 10:39:16 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.11537.1729766355707105782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 03:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=giyLFMSD;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d5100d0b1so65576f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729766353; x=1730371153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie4BOfgXFL/YRu6OK12zkIazG2OP8J38jgcrI3puW9o=;
        b=giyLFMSDou+8Jv72u6FM2k0FdnkY84FxXTvLdDMLeppggaJVxIMXDj26nQOFezBolw
         +W5nfbroNYeoaJxx0U2stSkyGjDHSGed/ubKvaADg5Fech2bgfctHP9PkfTzrj3Mmzab
         F2lWnropopHXjC3D/Q9CSmkd1zOZpCtITWTGW03/L9nznuUP/Sbeh8e2IpLxUVzu6/Qo
         tN7LZkj1BYFcCsDoDTREiAW60LmB9E20CiHnSzDSRFuHDiK22j3yR4o+gjqqrer6MNG4
         veqQZbpwNeQC3dJvZ+ZP6q/4oPuZMrOF91k1TwYc8XmlnHObv/KiV/LlKPrTqADo0WHl
         whjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766353; x=1730371153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ie4BOfgXFL/YRu6OK12zkIazG2OP8J38jgcrI3puW9o=;
        b=cLJbS72zlslSt/elP9NvaeA2GSyWeVXbb/BZPdRsb6J0TMOFDUmNH2w6st4jmRfuor
         p6AIELjxoZ2iouVTjoQBwYpxedoDtBAN+m2UUR10WzGStGgkIA7HSpBjJ43QjeFM4TwS
         ezRJjyCML9Sykul2ThQ9OMlC5fNOdMiwObYosVtHlkSWnAOjzAO2/gZ2CoPZOQmzXnXX
         iVQDJBicHRpFqufdpGvn3KJ0mqhUQ1vw11GdpV9nf07td/73wmbbLM9RdQ2g+bBvA9CI
         GYYy14t+pzY43VLpACQreLPsAEL3zXqMtLBCBAhPU1EbMuoFC3921qeadpoZODCElBIg
         bv0Q==
X-Gm-Message-State: AOJu0YyC366QNbolVg6w4bxOwLyOKHtpID6JLmVeMTctcb6qrNNCfZuj
	5UbkIb2SgpBNKlSCiFqRMXXaJkJsI4Y5hdxQNTj9xYoiNxXzdBXoKzzOjA==
X-Google-Smtp-Source: AGHT+IF+LY8FVGjM9tUavVr3JZDYmBsjEVx6nTAS6ffOedNED86TbmF8mdMgcdsJ++bfBPWwccmO0g==
X-Received: by 2002:a05:6000:4006:b0:374:c2e9:28aa with SMTP id ffacd0b85a97d-37efcf493e7mr1864287f8f.8.1729766353225;
        Thu, 24 Oct 2024 03:39:13 -0700 (PDT)
Received: from hbox.local (178.72-31-62.static.virginmediabusiness.co.uk. [62.31.72.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bcc8sm10931797f8f.107.2024.10.24.03.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:39:12 -0700 (PDT)
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sreejith Ravi <sreejith.ravi087@gmail.com>
Subject: [PATCH] packagedata.py : Fix RDEPENDS Version issue with AUTOINC
Date: Thu, 24 Oct 2024 11:39:06 +0100
Message-ID: <20241024103906.41742-1-sreejith.ravi087@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 10:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206285

Currently, RDEPENDS for -staticdev and -dev is set using EXTENDPKGV
in meta/conf/bitbake.conf:
----------------------------------
EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"
DEV_PKG_DEPENDENCY = "${PN} (= ${EXTENDPKGV})"
RDEPENDS:${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
----------------------------------

During the do_package task, AUTOINC is replaced in PKGV
(via package_setup_pkgv), which is used for creating the package name.
However, Yocto sets RDEPENDS with PKGV during the recipe parsing stage,
resulting in the RDEPENDS field in the IPK control data containing AUTOINC.

As the IPK name is generated with the updated PKGV, but the version in
RDEPENDS still uses AUTOINC, this mismatch leads to installation failures.

Example: libnsl
install libnsl-staticdev throws the error,  nothing provides
libnsl-dev = 1.2.0+gitAUTOINC+4a062cf418-r0
----------------------------------
IPKs available:
libnsl2_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-src_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-dbg_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-staticdev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-dev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk

control data: libnsl-staticdev
Package: libnsl-staticdev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl-dev (= 1.2.0+gitAUTOINC+4a062cf418-r0)
Provides: libnsl2-staticdev
Source: libnsl2_git.bb

control data: libnsl-dev
Package: libnsl-dev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl2 (= 1.2.0+gitAUTOINC+4a062cf418-r0), libtirpc-dev
Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
Provides: libnsl2-dev
Source: libnsl2_git.bb
----------------------------------

This patch fixes the RDEPENDS versions set using EXTENDPKGV in the -dev and
-staticdev packages. It replaces AUTOINC before generating the package control data.

Updated control data:
----------------------------------
Package: libnsl-dev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl2 (= 1.2.0+git0+4a062cf418-r0), libtirpc-dev
Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
Provides: libnsl2-dev
Source: libnsl2_git.bb

Package: libnsl-staticdev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl-dev (= 1.2.0+git0+4a062cf418-r0)
Provides: libnsl2-staticdev
Source: libnsl2_git.bb
----------------------------------

Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
---
 meta/lib/oe/packagedata.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 2d1d6ddeb7..332681d3ec 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -171,8 +171,11 @@ def runtime_mapping_rename(varname, pkg, d):
     #bb.note("%s before: %s" % (varname, d.getVar(varname)))
 
     new_depends = {}
+    bb.build.exec_func("package_get_auto_pr", d)
     deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
     for depend, depversions in deps.items():
+        if varname == "RDEPENDS":
+            deps[depend] = [ver.replace("AUTOINC", "%s"%d.getVar("PRSERV_PV_AUTOINC")) for ver in deps[depend]]
         new_depend = get_package_mapping(depend, pkg, d, depversions)
         if depend != new_depend:
             bb.note("package name mapping done: %s -> %s" % (depend, new_depend))
-- 
2.43.0


