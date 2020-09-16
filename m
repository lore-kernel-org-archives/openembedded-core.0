Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.22206.1600262940717530152
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lxx3YcIq;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id b12so6242867edz.11
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 06:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xFpqa0lbDbRcrQMgUbn0UFllDMM23MBEMrjhO+rUDEs=;
        b=lxx3YcIqfkI31nK+kft/m61oMqVvGjVLLf0wFtZvlWSiw9SzcS8IQK+tC8p1wRQJPA
         ZBRNF05YzDxVRciX9BIzSzXHtHACEO0R5htj+rRZ5C5ufgBoOa4MM+gla1PDlP2r5yWX
         ychdJfZBj4H5PGMyYJthC1ZxaZlD+yiX947mnk8qH7VjZ0zA03VcApy+8bqYycVnqXt4
         Fa/PCNjBEf3vgrxN0U4cvCElqI3fptNnXw1iCLJW99ccjb3/lRot4jMc1l0kj79N9O4v
         xuJgRRYpHnblTGqAfgM+fwrniT8R4khoEKfeM3Nb9d2FtOvFPFWzOgcdJGyOyFhPAOd8
         FTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xFpqa0lbDbRcrQMgUbn0UFllDMM23MBEMrjhO+rUDEs=;
        b=CXobaijQvXspEGIKOX70X99k49tHv7cavythKh6PiVky+Hota8E0Jp/xKfxZwy81fs
         dkI2Xc8mVtLGQtI+KJ6bQBJVDiVA3wlMer36eOKgcPNy0hl7sH7Nv3jW9URYqSonePDZ
         RFvPguJ7FVpe6r8uLjEfmVZPTJGtIUdKcdolJmB1vwShaWRpZ9ZPVQQwaMyAuBptmQwF
         FdChT6LJMfLKxgCWJ+/tstPxChkIjj3C3COMNzLRL7o9q3bdLmZ/06Rg+ElRxfm6cdzs
         Mj/h9BGIVslVPCUgXiHWDojbYoQ1uEtCfyH3O4ivc/er6xDMyK+h5oFzuy+k8NnQdthV
         e9eg==
X-Gm-Message-State: AOAM531x/CJjz+OIxDgV5Rl7A79Mi9w9VFeKr9FzSuPuxchOnzAAaAFv
	jR4AqUM+zOyEcx9cxLrum5t2VzNpmqM=
X-Google-Smtp-Source: ABdhPJw3dOLSepgQ8AnMdm7LnueZJa91St78i+QPWLKpQPezDYfGILd1rEUcJGxZ0rJ3f0FVhlkHTQ==
X-Received: by 2002:aa7:d4d0:: with SMTP id t16mr27720592edr.83.1600262938518;
        Wed, 16 Sep 2020 06:28:58 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d6sm14586624edm.31.2020.09.16.06.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 06:28:57 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] bitbake.conf: use ${TCMODE}-${TCLIBC} directory for CACHE
Date: Wed, 16 Sep 2020 15:28:52 +0200
Message-Id: <20200916132852.2083399-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* move TCMODE and TCLIBC from defaultsetup.conf to bitbake.conf
* set CACHE as it was in defaultsetup.conf and drop it from defaultsetup.conf
* most if not all DISTROs are now including defaultsetup.conf and
  TCLIBC is pretty much expected to be always set correctly, e.g.:
  meta/recipes-core/systemd/systemd_243.2.bb:    if d.getVar('TCLIBC') == "musl":
  meta/recipes-devtools/gcc/gcc-runtime.inc:        if [ "${TCLIBC}" != "glibc" ]; then
  meta/recipes-devtools/gcc/libgcc.inc:     if [ "${TCLIBC}" != "glibc" ]; then
  meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb:ENV_NAME="${DISTRO}-${TCLIBC}-${SDK_ARCH}-@TARGET_PREFIX@${DISTRO_VERSION}.tar.gz"
  meta/recipes-devtools/valgrind/valgrind_3.15.0.bb:RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
  meta/recipes-kernel/linux/kernel-devsrc.bb:RDEPENDS_${PN} = "bc python3 flex bison ${TCLIBC}-utils"

  meta/classes/buildhistory.bbclass:BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
  meta/classes/cross-canadian.bbclass:    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib' ]:
  meta/classes/kernel.bbclass:    tclibc = d.getVar('TCLIBC')
  meta/classes/toaster.bbclass:    BUILDHISTORY_DIR_IMAGE_BASE = e.data.expand("%s/images/${MACHINE_ARCH}/${TCLIBC}/"% BUILDHISTORY_DIR)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf             | 5 ++++-
 meta/conf/distro/defaultsetup.conf | 5 -----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5d994f067d..a318d1ca58 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -357,8 +357,11 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar
 # General work and output directories for the build system.
 ##################################################################
 
+TCMODE ?= "default"
+TCLIBC ?= "glibc"
 TMPDIR ?= "${TOPDIR}/tmp"
-CACHE = "${TMPDIR}/cache${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
+
+CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
 # The persistent cache should be shared by all builds
 PERSISTENT_DIR = "${TOPDIR}/cache"
 LOG_DIR = "${TMPDIR}/log"
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 66fd246526..b36a4ffffe 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -3,10 +3,7 @@ include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
 include conf/distro/include/maintainers.inc
 
-TCMODE ?= "default"
 require conf/distro/include/tcmode-${TCMODE}.inc
-
-TCLIBC ?= "glibc"
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
 require conf/distro/include/uninative-flags.inc
@@ -15,8 +12,6 @@ require conf/distro/include/uninative-flags.inc
 TCLIBCAPPEND ?= "-${TCLIBC}"
 TMPDIR .= "${TCLIBCAPPEND}"
 
-CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
-
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
 INHERIT_BLACKLIST = "blacklist"
-- 
2.25.1

