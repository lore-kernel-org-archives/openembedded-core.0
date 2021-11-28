Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31FCC433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:58 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.52896.1638136797693295811
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AxWKKSUC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id g18so14660772pfk.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bGyxdTHpdL5f7m5gXYrn2Pd5L6dgXasW4DNzyLYwcxI=;
        b=AxWKKSUCZlW4sRGgdUjQ7jpDfD0/WfNlO2bfWyRFV3j2cVFgMOjU8+Efsgsc5X6jKr
         IsOqk9FYv8wxxHiE/gyztQuES0oSrZizD46mbzLHkOy6ei5zan8FIIwzSMWWqbkhrFm4
         wBU6bXNYHcqYdtwhIuEI8BXCqdLVWL3cBpE8NgqPl89LMeqahOjCAfItKioWxR/DXgRS
         k0Z5+94oJMp73TxYh2PwbEJphqISx77sMwn6KrbuyW3BusCJjfqypvt4XYr3Cjs6D2BX
         RMzG949QnZVf+vsJ/ShBqQaheVd7F2qG00TqVx8ts5a/lbGVWV6Jo/4LEGzZ1UrfpJyy
         N+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bGyxdTHpdL5f7m5gXYrn2Pd5L6dgXasW4DNzyLYwcxI=;
        b=Uk5fBWpdF8kvhvTYKtUVxP8UZ8dl8Lz7nRkGXFnp0otFuK6VXuqY2hJxjsvibQjrVt
         J3KCRRb4C6B+m6InIWlPMahhUerLVJSlHLoav9nIOlPzFXOyuBcR1EO9shEx26r4ZN4M
         zVroys+GOzPDGfAhp48DuYWQLs32HuxH8pJ2/nDVAFDSm9pH21ssklPwq/yrj5XgOp3f
         UAWxTI8JgcZ0LOFdyLPUrP/gja487AjdcS7JBfgzoqBtvtJgklVUN+bcJZGMfVtWIDbu
         JwlUY8Lg/R/TtrlnOhul0YfUa6yNys8rwUKjm5TZQq+rNcQziYtuqVe7Wmo2q1Icgi9V
         iiGw==
X-Gm-Message-State: AOAM533RJm/upaM/ZDoMZBAPlaMet52MJZ6wfxf2QYRyal9oyBZ6QZhR
	g3gePqlrUdzMnV6GI3GIYI+0lxZum2gSCzlzKD4=
X-Google-Smtp-Source: 
 ABdhPJyLR3lP2Ii/fcLi49aE6qfx3KtHrnf0wHFLgcAhRA2qEoTCjzTSXAEVzFlzy5Sg3aYHYNCfzg==
X-Received: by 2002:a63:7b04:: with SMTP id w4mr18140548pgc.588.1638136796621;
        Sun, 28 Nov 2021 13:59:56 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 39/42] make-mod-scripts: pass CROSS_COMPILE to
 configure and build
Date: Sun, 28 Nov 2021 11:57:51 -1000
Message-Id: 
 <78757b8f1fde1ec77f3edde8c310b64394ead26d.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158921

From: Denys Dmytriyenko <denis@denix.org>

Fixes:
|   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/checksyscalls.sh
|   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/atomic/check-atomics.sh
|   LDS     arch/arm64/kernel/vdso/vdso.lds
|   CC      arch/arm64/kernel/vdso/vgettimeofday.o
|   AS      arch/arm64/kernel/vdso/note.o
|   AS      arch/arm64/kernel/vdso/sigreturn.o
|   LD      arch/arm64/kernel/vdso/vdso.so.dbg
|   VDSOSYM include/generated/vdso-offsets.h
|   OBJCOPY arch/arm64/kernel/vdso/vdso.so
| objcopy: Unable to recognise the format of the input file `arch/arm64/kernel/vdso/vdso.so.dbg'
| /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/arch/arm64/kernel/vdso/Makefile:61: recipe for target 'arch/arm64/kernel/vdso/vdso.so' failed

Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Nishanth Menon <nm@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ddad8183490c725062626fa52985da2b04a2aa8f)
Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index b58fa9a603..f9df345ca5 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -19,7 +19,7 @@ DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
-EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
+EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
 # Build some host tools under work-shared.  CC, LD, and AR are probably
 # not used, but this is the historical way of invoking "make scripts".
-- 
2.25.1


