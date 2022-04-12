Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5BFC4321E
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:13 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.2114.1649799971879037378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xsu3+Aq6;
 spf=pass (domain: gmail.com, ip: 209.85.217.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id j16so1258564vsv.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AEJx30nU3B0qxuVuCKXTB8ssw+d+4dselca8TmBcWfY=;
        b=Xsu3+Aq6xOSVYuKaAFUmLRWl8KeON0nxluw0V/UZ/O1odc0sJSWMILn73oOPJ4pV9L
         cVUEL7hDq5RVODeRxA5+Z0slKhgU7wGABIBQ9w3KMbgoCYn3QSfVVSKZvDAvMpBiRZNo
         3omYZmU1XvGEFaSQNO57A7mtIMOFRwkvfgmwcWzn5fLPcuNvdm4JwtupmdFXnlVKjtqN
         dCYwqkO29oWPlvPo0U2a4I0Atb/KWTnTVhjGvdiIC+5OJLwYkRCGc/hVFcwlHYeaD+/q
         aRWUncT/5yjG5Q+6uZFXjfTUVTbwDLcZHPt1ix1yaqavxLUt+oGLzW70RbfR5MO9p8dS
         XwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AEJx30nU3B0qxuVuCKXTB8ssw+d+4dselca8TmBcWfY=;
        b=FCAoquB4nB5ebUP6to0u5jadmP79Xb6tA8A2ff0eC9JhQ80kWm9M3W+42fB+hvj//E
         F0+R+dN9F6xk5zmD/h4BhTeolTF4UgVLh+vJfb3vGvPxm38h2imZqu+yyadS9SjKDWDi
         hUG6HR9/3CzCKX4NMA69UK1NbxFftXau8fws38geWiUXRC5iGdt5i0nrj7muXORT7Z0Y
         Yl+JFfWq5RypE84Dh110pS0smCmrRdd70T4nI+vv4dr7v3gEXLbC1vRm8j5GmyIfUqpI
         3PFQEYTXi+4J3f1fSCbzKvSe2Q9T7yA+e52XbsuVfOlxlORrl3MJ+HmKlwzrKX6GdGB4
         bZug==
X-Gm-Message-State: AOAM532hUid6tSUEmj87VVsbJlXlq0TML2Q+NahjwtNzutogknriEl1k
	R1QNox2QggfuGnAU/Kiu00RSplVKFsHrgw==
X-Google-Smtp-Source: 
 ABdhPJzEeM4lczOofwWlsWJM9xQ1KN6e0PEPgxINxWCDZNSXI+opRMsMoxxmkYzkkyZvPxTfs4h5IA==
X-Received: by 2002:a05:6102:d92:b0:325:9309:7ba with SMTP id
 d18-20020a0561020d9200b00325930907bamr11787961vst.28.1649799970946;
        Tue, 12 Apr 2022 14:46:10 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n14-20020a9f3ece000000b0035d20c94b68sm1527638uaj.29.2022.04.12.14.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:46:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto/5.10: base: enable kernel crypto userspace
 API
Date: Tue, 12 Apr 2022 17:45:59 -0400
Message-Id: 
 <72df2ccdbf3647b73bb2abc083fce74b7c5590fe.1649799823.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1649799823.git.bruce.ashfield@gmail.com>
References: <cover.1649799823.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164287

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    bddb0e4921f base.cfg: enable kernel crypto userspace API

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index b8a280a615..9731a738b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "c11f8738640c3c52f4ffc2adf9aa8f6c097e4a4e"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index bafa486d23..f75c0d70d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "3851408a9f5d9d4531f29340056a1089debd5b58"
 SRCREV_machine ?= "0a47fd76cb0f7e22d47afcb88bf884c750ba5d92"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 72293768dd..a7485be1de 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "a275cd6839513c72ceae989a575b6accbb262016"
 SRCREV_machine:qemux86-64 ?= "a275cd6839513c72ceae989a575b6accbb262016"
 SRCREV_machine:qemumips64 ?= "36a2d17167ee66a2feda5fb1efee0a2ee2dc4740"
 SRCREV_machine ?= "a275cd6839513c72ceae989a575b6accbb262016"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.19.1


