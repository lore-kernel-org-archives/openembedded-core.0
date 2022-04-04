Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AC7C3526F
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.36574.1649085563803064827
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CqSwIJPK;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id d142so7892679qkc.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UYvXEEB64Y0xDxlxWEvgWMXQ2yRock7xXn7hPkVkwMI=;
        b=CqSwIJPKw6XzkOJf+lh71akM9VlFYrPFeVNPbdm2Mgxm8vv9n0tkDVfyyhN8tK42ZU
         TMInvvwljF2+pGwi4NfrtTyMMTEMYVlNumK8tIFJ9omoGN7VQYEkMt0b5ZWEDrlacHv7
         yFO+c45XDPljSsq1Kh9wU2LCrQsYvhuHdfSiMg62O3gBYWPFM4sHCAl3EB5FRg2dq0Lj
         sq+tRJQuBMKnRuTt/zG4bFXESAGneJE6rUIwbug17XuJQWMeENOJt0/pXi/ZQdXens14
         x7d1Ou9eFZPVt9q86JxjEd0mCjrOqCnTExQ/bajk+HTDY5L2z53Vogep8W1fvGcF1nSb
         mrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UYvXEEB64Y0xDxlxWEvgWMXQ2yRock7xXn7hPkVkwMI=;
        b=nrLePm5UfNmIFVzJNBSRZ7GT3HviD9r3+2QFWIVxk7Zm3ITiQle/yYumDIwWzteJod
         OARyfkrjiD9JFXsalU4URZIuUM1BI3OLQsvX0dojUiRXEVL9d/wbPCOyg+azlPIpNNRL
         QcrowTNsXZmgUXcLnaY9rP8sXy+dlsN0X6BhcipJYRZkV/efZCY25+nKvPXeGazCfHtq
         yHikv6lVuOsLe+1wufb39wq4+YFKT22koHoRa7U2En+lUx+t04x12TH5v2TbusaEMsVs
         SS8HRcgzlfAdpgWmqv3WfHkz0fUHrdbdpeyeQwj11Ii++blU1dEQDK9Zh7gsEDW0OcTK
         DpWQ==
X-Gm-Message-State: AOAM532bnKFS2Gv5EUm86E0ejD5qO3adRqmAmFyRoiXLn60WqiswCpWu
	EQHbp0LHFelTJgKEhSf6RAw=
X-Google-Smtp-Source: 
 ABdhPJxR8cOkWhRCHe2QLRF4doRtmebZ2wCxkRpORTH8cmxP0USFJ1rh7ON49Xgp9R6hX2C0OuGJRQ==
X-Received: by 2002:a05:620a:2681:b0:67e:95f2:7ce2 with SMTP id
 c1-20020a05620a268100b0067e95f27ce2mr194825qkp.223.1649085562680;
        Mon, 04 Apr 2022 08:19:22 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c3-20020ac87d83000000b002e1d1b3df15sm8969772qtd.44.2022.04.04.08.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 08:19:21 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/5.15: aufs: fixes and optimization
Date: Mon,  4 Apr 2022 11:19:13 -0400
Message-Id: 
 <e36a40c51339bd979dc19d1b519858dc5e5b7116.1649085436.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1649085436.git.bruce.ashfield@gmail.com>
References: <cover.1649085436.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163998

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index d28bfaa62e..4efe51ec6b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3b3fed8f3b6d6d691ed4ebc270ed13fc4f24a0b7"
+SRCREV_machine ?= "2982a893fea6919a3ffd1fb6d600fb8cfe8c58b4"
 SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 7b42986357..d5b301b4d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "6a4187344f4b0c1a0e372124a55d164c4db1c1fc"
-SRCREV_machine ?= "38eee29b552caba70723f16b5b7e6c47237baea7"
+SRCREV_machine:qemuarm ?= "cc9e92e826af229b841fcaf8c645e638a86eba43"
+SRCREV_machine ?= "c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4"
 SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 29448ec237..b936257aa7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f6561f66ec8485b0f55fa5c09e3614d85e65da77"
-SRCREV_machine:qemuarm64 ?= "182d2a0dfea7f5a869b8938b5c50fd46153047ff"
-SRCREV_machine:qemumips ?= "5954e50bf90b3e22361b335b3fab47fcbd14a88e"
-SRCREV_machine:qemuppc ?= "114761d623636cafa01bb60b3e0e9262f21d2d56"
-SRCREV_machine:qemuriscv64 ?= "ee43e792dbdecc18d6d72c360712659fc78b997f"
-SRCREV_machine:qemuriscv32 ?= "ee43e792dbdecc18d6d72c360712659fc78b997f"
-SRCREV_machine:qemux86 ?= "ee43e792dbdecc18d6d72c360712659fc78b997f"
-SRCREV_machine:qemux86-64 ?= "ee43e792dbdecc18d6d72c360712659fc78b997f"
-SRCREV_machine:qemumips64 ?= "f57326efb3ee9cba3f867b65b7535d3819da7933"
-SRCREV_machine ?= "ee43e792dbdecc18d6d72c360712659fc78b997f"
+SRCREV_machine:qemuarm ?= "b6fd1a7dd80a336567fa30c1d674f0d5df9af836"
+SRCREV_machine:qemuarm64 ?= "387a676543764b59e38cf6b13d6474846fb07d78"
+SRCREV_machine:qemumips ?= "7c084cf3a700f7a2c68c8909501f4d35b3215e40"
+SRCREV_machine:qemuppc ?= "239f7c8f37bf9ade16325101df3c06a485ccc74e"
+SRCREV_machine:qemuriscv64 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
+SRCREV_machine:qemuriscv32 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
+SRCREV_machine:qemux86 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
+SRCREV_machine:qemux86-64 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
+SRCREV_machine:qemumips64 ?= "a4805fe749c9c56d18a60b5378674760ef0e85ed"
+SRCREV_machine ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
 SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


