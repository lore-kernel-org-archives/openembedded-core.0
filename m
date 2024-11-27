Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72171D66BBD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:11:57 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.64662.1732680713623882454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ym3X4hIa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-724e1742d0dso4301978b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680713; x=1733285513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlWb2u3YlOAmEjoFrd0i19+bGH0DiMac2v0YpWhQIOg=;
        b=Ym3X4hIakpeNM52ViAh8dZW61NMZZdS8UhCKx8dtVv5ZkJnOiSOsxtHJjv3cwAcKSY
         XbwHOH03Eqg2D0o6uI5XqUWdO2B+XdgY3LYPEpjeVRmqbSN3fkB6VEw7G8MY7dD6L7hI
         s2oaCDq/fUPFfvTXB3ycOmXJlXe3vAMa2fTGCihj9uoOcTORBD61h4G73cp6SCk0kRK/
         NQpNFLcrflMC9AndykRTlo+3RJ1yHUuKXSZ0rJdMadJgHUu60J+uitpLWXAjKI6lU37j
         46I1kHxqffT4GEklmPYZ7dS7mjvV0kqZit/sytgxpwmLqMq4gzosUzIMQaeC99YcRlS9
         Hslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680713; x=1733285513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlWb2u3YlOAmEjoFrd0i19+bGH0DiMac2v0YpWhQIOg=;
        b=BMsloc/hEqEiaBOFCBG2FjuOAsaqFs8Hid/oqOpP4N8F4vtYA4O50LSMkHlmhy4Hkh
         1mXUX3lygqaldWWXbaSiuTu5bELzao+wAzS5JHIpRMGtcxjWchG154TcHNjiypA0fQSa
         RNFFVLKfh1/1juWayqZaMZAn6SMW16BNbPPALmIIKtsxMN45dq/V22D9YC9fRvI2Yfp2
         +anAOuL1IneNfuQZLe1SmnVxzszeH0aMtJPCs9IqbWs940pUNEdtTJ3SNbyyrwCRU05X
         sCkWzc5g2axNysq6EPGBl2EtYaRdRWn92sTMnMmkvd+gJ7aR8gA9/15zOOrw9Llgr/4O
         ri7A==
X-Gm-Message-State: AOJu0YwODWX9+MmZlu44gvdZ7fvor/E1bO3/dUTmoGQnr25/lTDF0N0d
	r1kaRhedMwHexHUHwsyy9dFfw2VrJ4L9k6LbtK0oFu37EJEGxrJnx2Ju89z0oxg/0r0FDEHt1zK
	3
X-Gm-Gg: ASbGncvRDZbyARHJ1cJQNym9klPLT4604KOkqApNB1PP1dsIodmwdn1bi3qFKTmGilW
	BC8WF+lmz+oWRMJhZJYQ6KMueeV+BT4jtZuJeWvtbBvaT7BkM+kcUIuYRxS2PDkCZ0Fn5gewNOR
	AF1lutfhGmaCTci1TkMoQPWCX7QZbv3VlWoejuaz8pE+GYDDeO5nR/oq6o3t97sa+9mE+JGm11A
	RNjfSX3cJtGWQQ1M5fjSBfeOjJeAIC1xcKfkVI=
X-Google-Smtp-Source: AGHT+IHFj2wy9JfneHlS0iujnP0Awc7bvLofFOGQOhCiwnjAS67VUWqONjOZ7fOh2zOGJclClxebbw==
X-Received: by 2002:a05:6a00:92a6:b0:71e:1314:899a with SMTP id d2e1a72fcca58-7253014da2dmr2699230b3a.20.1732680712746;
        Tue, 26 Nov 2024 20:11:52 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.11.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:11:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 06/18] linux-yocto/6.10: genericarm64.cfg: enable CONFIG_DMA_CMA
Date: Tue, 26 Nov 2024 20:11:26 -0800
Message-Id: <0b5476e41714ba1290bad711d9adfe894c3a70e3.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207900

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: enable CONFIG_DMA_CMA
    Date: Thu, 24 Oct 2024 08:49:29 +0300

    It's needed for graphics on AMD KV260.

    Cc: Bill Mills <bill.mills@linaro.org>
    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d1572bce914ff67c3e08f95dfd8504b00b9a8e0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index a1096f6a04..8f87a096ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "3e91e02b6041d6720a5cf2f64323bb9b73f20765"
-SRCREV_meta ?= "83eed9befe28696b06fc5cc7bb31d81b27a7f325"
+SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index 50a461149d..abfee6953d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "83eed9befe28696b06fc5cc7bb31d81b27a7f325"
+SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 81898a4328..9b2334afd0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemux86-64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemumips64 ?= "61cac1396fe9250a4b7a5cc6ae3deb9dda4290c3"
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "83eed9befe28696b06fc5cc7bb31d81b27a7f325"
+SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


