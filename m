Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3366C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 14:16:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.32306.1661264174227670159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=brhEIIIc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so754458wmk.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=V2A6zuwMe7l9LayuAGyNQ40kmnvLssVBgkSWC7JaCv8=;
        b=brhEIIIctlgYd6jW3JNxEy+PGJZXqURD1htbVsrrSVC1hkChbyI+TOkJxYN0dlBid7
         NbdGSPvUjci1fCsaOp4xL8ddTyQMImAeMUC+loARIW6/hU+KD0qLjDdiOaBkffMVe4uO
         iUruP7iDAeY2H5SB/6iNw8d6nsUZ/ycRhUS7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=V2A6zuwMe7l9LayuAGyNQ40kmnvLssVBgkSWC7JaCv8=;
        b=pcf5c4i86H2lZQS1plwytEqnR/PkwuXxkEKb6hNf3xBzRDz9mFjWqP9V61VaAAl1Po
         pbzNtP8DY+uga4fKrpJDUa51Saoki8oF9LZIrvN5/BDil9pfatfGbshHu6vt9YuGjYVl
         DpEnX7ZAVHRTj+VOl2pPy0Ar5ulqnkmlQzErG4iRtOgy1ZZ/pjJmQuIKunXQVtBRo9cf
         rvu1/itfTmw4eVMrw/4YvO/nqzrSe7ZJTXrp9a6ijdAH1SFNaAHgyBqDKCksxBMQyd00
         vyyebUmDfanUOMjAxy9mmhBwDsNTGyuxTInt8242EK+O5bycwFbxUf+8QeNqEhmv9VtF
         qMFA==
X-Gm-Message-State: ACgBeo3/0c+8t0DzXXqYRCWE0ARGQ6S8lAvUR5bX4prgIahYbimEgYNt
	dQZS6wURg5XQloDoCBvHfzXU6Dho9wYkeA==
X-Google-Smtp-Source: 
 AA6agR5sR/TLxkxX2Zz4Uhao7+V0yz3/kfwaq/CukiHkJh1E4ONaCVxVYq5HPYtH25i6rwkgcsGfVg==
X-Received: by 2002:a05:600c:4e15:b0:3a6:152a:9143 with SMTP id
 b21-20020a05600c4e1500b003a6152a9143mr2371204wmq.20.1661264172155;
        Tue, 23 Aug 2022 07:16:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6994:a175:4613:7bc4])
        by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c089a00b003a2cf1ba9e2sm17079667wmp.6.2022.08.23.07.16.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 07:16:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mesa: Rework llvm handling
Date: Tue, 23 Aug 2022 15:16:09 +0100
Message-Id: <20220823141610.2934060-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 14:16:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169707

meson in mesa no longer uses WANT_LLVM_RELEASE and LLVM_CONFIG so drop
those. Instead, copy the llvm-config binary into the target sysroot which
allows the paths to be relocated to the target in question. This should allow
the llvm patch for YOCTO_ALTERNATE_EXE_PATH to be dropped assuming nothing
else relies upon it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c4efc134387..c2313e91cc5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -55,11 +55,16 @@ ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
-export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-config"
-export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
-export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
-
+# By placing llvm-config in the target sysroot bindir, it will then map values
+# to the target libdir magically. We can safely add to path as there are no other binaries
+# there.
+PATH:prepend = "${STAGING_BINDIR}:"
 MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
+do_configure:prepend () {
+	if [ -e ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ]; then
+		cp ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGING_BINDIR}
+	fi
+}
 
 # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
 # by default the upstream mesa sources build a debug release
-- 
2.34.1


