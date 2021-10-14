Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603DCC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:10:32 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.8335.1634213430834355200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QLAXDl+O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id e12so18772663wra.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ym7md/jxH/APioRYXBBtJUYxMuQO+1inxWUVio4VPTE=;
        b=QLAXDl+ODMh7CvNXoa5hpVzZcDnjeKNDdDbz1wnL6DFjklVaO7cGHSohJyFAdQ7fZL
         ByKCL2WVzHy51Li626mH7NyiO/Xkh4Z59clKqTii0/6qLZ0xztyf3pphqf4yBkRzNAzs
         gArrK1z98OnCmiT6dXntWTUUgBM3Eh7/c+ppM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ym7md/jxH/APioRYXBBtJUYxMuQO+1inxWUVio4VPTE=;
        b=6PhoOk6Al6etaD/RgWgGdGT6qLStVSX4foYC8hsMXXoJ8CgKB8eZqgs+b/bKf+Chta
         G8s3a9NEgpzfZmcCUyg+3socZQ8qtZhYuXk1oTIugmerZKcuS6WR6aRcAN0ZyG6DMnXT
         Wj+Kqr1imlflpMz8Yq27tedX0l0gXphClXgAfESf7EQxsJqmEOAYOAn8qXL8CVFf2QlE
         6O+m8Ynhb3Btd/qSpbt53ZbChSMIk7IUsCh9DyKA1xR1u1IcviOQ07tR8T8Xv4bQXlOk
         gHelBkOlndDSM59vb7qLOvR7hm2q45chC6v9FR4VtQyzt5UK4Gc7Ktdl7xlEThhQoJK6
         EPTw==
X-Gm-Message-State: AOAM531yi5ptm5yMvdrlGtHWg4Beudxn7+3obDcExwEAraDtc18Ev2i4
	F56BfVoS2fIXNHkYcIgotnqbcwvpOroD5Q==
X-Google-Smtp-Source: 
 ABdhPJxvpCX1kk9FI3Lmf3nmruJRmZADBJZYErjP2x50ZnOUXQzYXMDtC504z/l/jw2hpiQgp0jd/A==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr6323404wri.62.1634213429217;
        Thu, 14 Oct 2021 05:10:29 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 10sm4296152wme.27.2021.10.14.05.10.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:10:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] python: Update now reproducibile builds are the default
Date: Thu, 14 Oct 2021 13:10:24 +0100
Message-Id: <20211014121025.2913401-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:10:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156941

Now reproducible builds are the default move the qemu-usermode check to anon
python code so that invalid configurations are detected.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.10.0.bb | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.10.0.bb b/meta/recipes-devtools/python/python3_3.10.0.bb
index 2e850710b68..e3300b6495b 100644
--- a/meta/recipes-devtools/python/python3_3.10.0.bb
+++ b/meta/recipes-devtools/python/python3_3.10.0.bb
@@ -95,15 +95,8 @@ CACHED_CONFIGUREVARS = " \
                 ac_cv_working_tzset=yes \
 "
 
-def possibly_include_pgo(d):
-    # PGO currently causes builds to not be reproducible, so disable it for
-    # now. See YOCTO #13407
-    if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) and d.getVar('BUILD_REPRODUCIBLE_BINARIES') != '1':
-        return 'pgo'
-    
-    return ''
-
-PACKAGECONFIG:class-target ??= "readline ${@possibly_include_pgo(d)} gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
+# PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
+PACKAGECONFIG:class-target ??= "readline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
 PACKAGECONFIG:class-native ??= "readline gdbm"
 PACKAGECONFIG:class-nativesdk ??= "readline gdbm"
 PACKAGECONFIG[readline] = ",,readline"
@@ -320,6 +313,9 @@ python(){
     d.setVar('PACKAGES', ' '.join(packages))
     d.setVar('ALLOW_EMPTY:${PN}-modules', '1')
     d.setVar('ALLOW_EMPTY:${PN}-pkgutil', '1')
+
+    if "pgo" in d.getVar("PACKAGECONFIG").split() and not bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d):
+        bb.fatal("pgo cannot be enabled as there is no qemu-usermode support for this architecture/machine")
 }
 
 # Files needed to create a new manifest
-- 
2.32.0


