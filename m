Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FBFC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:00:06 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.11300.1641924005885489782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HKDF9yyA;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id c19so126542qtx.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2GUIgZbMeRuUNX/CoVBw075vGRM9NU4iNysAArO+yIs=;
        b=HKDF9yyAFiIwUfWp2y5hTBvYskU5lT8KtQ0tIBifhFKFNSf3WvtcKYswPgXH2jziUD
         EFasQ043x2nk5pwrUtxzR9m5CStOQaD9ryMbkcbW9q+MUOixHrT3OGeN0JDT1oEjRUa5
         Jvr8ipyyzzmdYb2ztrZZh2f6AShxVWrmL9zhoSA8Mt1Mc5hsGh0HytbKvjDPSwwWYXVO
         iphRNYct54gIPKpBwBgD6BVZfVirVdtLSKo6U5DNz1V24dusdKFqaVmwr0P5EkO1CilU
         sn4Tp3yliSmetm7nchIU2CjmgdOUDn466X/oFWuX9H0aYEZaxFpxyopUCbZJPCyPvqkj
         qMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2GUIgZbMeRuUNX/CoVBw075vGRM9NU4iNysAArO+yIs=;
        b=aNlOFoGlWYkp6Yov/7ua8/pQinOAeEmAT4MJEh8VLaHnvGoRZUxN3HZUrZYChRAqA0
         R6Jg9EuNtzuGG1y6vzgCjjachivw60xpGgRmswDvVmi0xwi2P6mgwpDVc3HQsCSwyZ7e
         5wpxaHomzRmQz9ktbjCOU5bNVBvBh6WEkU7aXh1Rd6bpt39IiMoV8ZPcivvUdwjWFSD8
         fgO69MZ5HPKvFN0m0vN0d8IFfp7z15ilmxE1YtDyjh8jdPKEqylrkEA4zcOd4mbLeGJZ
         ZOD3WfL5BMK9Vg+jQ69zRB4TDo5tS8ByZxmTrxGPww1DuIiBKio/t9Tw3ZIb8XSrrdDI
         nKIw==
X-Gm-Message-State: AOAM531lxjVWXIZSOVZ7IUgOKxo7untVCh15MHqk6pR9KoY64I+cT/Ce
	NYNXaJXh8Qmba3xh3Pi3X/sfEPPVOpacLw==
X-Google-Smtp-Source: 
 ABdhPJwSR7ZV4wxHn2fpd1XdQm9ChBUxZTUFqjRaRvU83x453bvBoeroPb84ajyD4AZxTTckRtP+JA==
X-Received: by 2002:ac8:59c5:: with SMTP id f5mr4611167qtf.135.1641924004916;
        Tue, 11 Jan 2022 10:00:04 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x7sm7360749qkp.128.2022.01.11.10.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 10:00:04 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] linux-yocto/5.10/cfg: add kcov feature fragment
Date: Tue, 11 Jan 2022 12:59:53 -0500
Message-Id: 
 <eff381bf16260907fb91c533dd09e0ff256319ab.1641923693.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1641923693.git.bruce.ashfield@gmail.com>
References: <cover.1641923693.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 18:00:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160429

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto:

41721be8a03 cfg/debug: add kcov kernel configs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index f2279326b7..dd8326e92c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "301346d30bcaccedc71da8d5f78bd262063d4ba7"
-SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
+SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index ae6d884954..9d2bbc010c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "913d41ebe409dfd03c49fafd1923f8663df2a4ff"
 SRCREV_machine ?= "5575e67330fb6d979ed1cd2e9e64400b4c21b595"
-SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
+SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 3df4e86bd1..50fa1fb281 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
 SRCREV_machine:qemux86-64 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
 SRCREV_machine:qemumips64 ?= "29cb56446b0b66b7a15d2577773e69c4e813bfd7"
 SRCREV_machine ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
-SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
+SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.19.1


