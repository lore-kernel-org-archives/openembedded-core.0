Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E76C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 04:16:41 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.5206.1643948200709329162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 20:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lx5cejRJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id 13so3822578qkd.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 20:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xYY42ekF/rxMxKKKPn1ZvpUgsB5zgQcf5GiQCAmClcI=;
        b=lx5cejRJ0yUBSNaVdPv9kzDmNB52dV4A5TQJkBh1LcbTTGa26kZdp7oBSkg6ajrplr
         wzESIF4y0l0yEB9kYqYNKWmJrGFaIP7Hi6SC8d8f15JZ6WwiC1bUjXqeoso/VcOrz/pL
         smm/wnAmPZWyDEXaK7ZeulSUoFtAJoQ94KE9FpbAmDRuADHOc63Wde5A8RhdEr7rvzRg
         m7S4P5R80tTdpXr36TZDJIzYOImParQP56jCRfK+QaZagMb8ClcivjIytiUGHIlpMo1p
         1Xz/CKX4Gb5snjK9xdbsD91lQT1/1+l3nWkzRLxluZVwHBUg/4qfWe11E1IwFNXDgsfa
         IM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xYY42ekF/rxMxKKKPn1ZvpUgsB5zgQcf5GiQCAmClcI=;
        b=obm2OdKbw0dDKiP3yrvI0GIeslM2JocQoXoge6VgHfpMTEP5u8pNidQTk3PnmimGJE
         L/K/KiDwqkN7a3sP3+UB+qZ1/9kv9ZYhXBFBsFdTVpemoOXzD4UYTaArwqbOcNSweLqu
         /WS0lSKqEPSzkRTTHHYUvsO4LMJHRKRb21xWOLqkzkZlLjGt1hmNZ0x66ZSxFuizNEk5
         SgqsqlaOd+U9XBVOQZ2bHZAeaQAvwhD2yrL57xwQA8zH3TYDCw83a0QqiNiu85PkbwTW
         emPyK5xr5vpSIS681XFT4dNiP8MZyRnos8xkeGJsmUhYUae6JtbYJj5nIkmKkZXV8EfF
         Iq7Q==
X-Gm-Message-State: AOAM530LM5tNPH09SnqgXulMAUGoZZMVnVk6m6cAzsPve843MmrEHcHY
	5vSxoMBxJSBWT6/YHK8LiLo=
X-Google-Smtp-Source: 
 ABdhPJwW0xdMjY+od3ORsXc6zmrNl96m4ikGMf8nxmxHkKdZxQkaovDgmc/xG03OG6nRwFsWOjJwTg==
X-Received: by 2002:a05:620a:298b:: with SMTP id
 r11mr660811qkp.142.1643948199808;
        Thu, 03 Feb 2022 20:16:39 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 u17sm515424qkp.90.2022.02.03.20.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 20:16:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] qemuarm64: Add tiny ktype to qemuarm64 bsp
Date: Thu,  3 Feb 2022 23:16:31 -0500
Message-Id: 
 <0e7e9280e428f06a1cbae610358cc1a100d60648.1643947217.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1643947217.git.bruce.ashfield@gmail.com>
References: <cover.1643947217.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 04:16:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161334

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    cf716c58bea qemuarm64: Add tiny ktype to qemuarm64 bsp

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e59a4cfad1..161b418293 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3500b1673d3c5cdab46d497c5d492e81cc0a6a13"
-SRCREV_meta ?= "26e884f8c2d22607e97900d22ad52a290f555fd7"
+SRCREV_meta ?= "cf716c58bea8a4c0daba70740803b5074766f2fd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 2c81e3c005..c2ba73fc81 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "67b4c868eafbd63c437d0e79523c3bdc5f3aa834"
 SRCREV_machine ?= "f46816a75d738acbe4b1211153badf2f8e412780"
-SRCREV_meta ?= "26e884f8c2d22607e97900d22ad52a290f555fd7"
+SRCREV_meta ?= "cf716c58bea8a4c0daba70740803b5074766f2fd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index ea10de30cd..8356e6d16c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
 SRCREV_machine:qemux86-64 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
 SRCREV_machine:qemumips64 ?= "6f4bc07807d1e17fde099baadf60752fca51fee8"
 SRCREV_machine ?= "f46816a75d738acbe4b1211153badf2f8e412780"
-SRCREV_meta ?= "26e884f8c2d22607e97900d22ad52a290f555fd7"
+SRCREV_meta ?= "cf716c58bea8a4c0daba70740803b5074766f2fd"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


