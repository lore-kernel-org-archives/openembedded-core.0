Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7095CCF9F8
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:48 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.3356.1761844366892791939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQ9re0Oh;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-89e7a7e0256so135394885a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844366; x=1762449166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwYQ1CzGEtGFHOUV+KB6lAWxkb1s+yxNbcS27UrAlE4=;
        b=TQ9re0OhZRObs5TmWKN9aKboMXuaUXHAYHoeW3EfH1anPiT+2/vO66zMSzjBl2VYnk
         lkTPy+qnA9+agI5FVuQ+ZyghgLPJvVk8B8Y427qM4rhvDT5O6/7jtRLYAE1QQmVGRsAq
         azw+U1u4rt5b1mKYQGVnXMZERD0hEMUmY6mRvQhaUKheRI7j73gOK6W6LAaVWzlx4Ky8
         qLc7F601pGO3RN9sB8EJ8x8dmDnwscjeJEb+z3H1BoQPVUC8bibWcxHByUZCcUcZtQOO
         cB5n/lN/sG1wHNe7CXhbxI8jK72Yk2nuThu0KZ3MhXoV8SW+wq/NYniGPr/ADkG56T3s
         fOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844366; x=1762449166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwYQ1CzGEtGFHOUV+KB6lAWxkb1s+yxNbcS27UrAlE4=;
        b=mmcxp9iX45UWFUBd7qxE+4qifGavejJkHbGPpLi+2MIrDYFGRNkxtv7y8yyi2yo8+Q
         R4kM4+ps5N81n4hfNYobdis58b/VX5S/gl6mnS2Y150ZVt+JnrV7Iq5BZXFB3NvpKbpf
         8aJSLs+PrwiJjhyEcWYsl1lYzm2CIaN1BVH3inGuTmwh+X2y2uLqTsB3w3h1e4+gpjiA
         NGfTy712nz5HSWrxpTq+oKeNSxPZ/RfZ51miQ91mD/1X8GBwiIYG1n8kuR+pWIsX5PDX
         762VVKoSluzVvsr8WTJM8zaFbTfRkxqZnGyGaQTWyxfyevCcLe6lqGSP1z20EgsBK30s
         ChvQ==
X-Gm-Message-State: AOJu0YwXSklDAp7dths9HtC5zqSNfFOHNvF2Qkx+fwEHrzkxOdE9aCTi
	CLfU1jXKx7NwTNmZ0AkRx4W4mzY3MtJzSl28r/1G13I8qk0Yp93Zp6OlbDDUkESwgSg=
X-Gm-Gg: ASbGncsWTEdYn6DxjDGc+k9C479CIGk1KFG0iCqmHM6yqApq2vJy6Cfb1LP8IkkOj6r
	YJbiR8eo3prLrjCQXjLKbAlZDxGw/EIVzrhM2Bn7boKLB85Fkljt+58w2uupjyfRog66rPEBXvZ
	xAFgQoCPs9tQ8IounoBQ7Z9jvkL56VEq6Cmex2hC85CAmQN0f7GUzH5c+ooSwedDtfGsGhBYGZY
	pDxZML7/OkRDqmnUiUQtwBLXYJdEWl3jOIW75by91Kqm8wLtiU337S7J1u+ATEPuTHMbxnkr3J9
	BR/GEX0tYh3JxQLLKoeZrEQ5xL7vC1ntjhiCzOzanO7ULPY81ZkdXl1uiH6rvShgrz27OMNzJFu
	Xbj10L9VIzECT1zbCAq5oPjcfAAYeZskqOkexRkyDtSq73x3S/aLKkR3gjX+mhkWK9kAyaTeGvg
	VEaBP1bZ2631I6fzBsDHWLT/s+WbjNsjl+CG08rUsYNFG4BnKqmraNddSXT5M0UXKf0jT1vIJrB
	/lf
X-Google-Smtp-Source: AGHT+IFJoAHTOCS9zjRqKvcHRAT3hCTsthVgYZYTtuKgFvZDvARKxsdkCAQAGA7rap6lmhBzxtBAvg==
X-Received: by 2002:a05:620a:462a:b0:89f:7aab:60c3 with SMTP id af79cd13be357-8ab9949ba6emr27190385a.35.1761844365713;
        Thu, 30 Oct 2025 10:12:45 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/14] poky: make linux-yocto 6.17 the preferred version
Date: Thu, 30 Oct 2025 13:12:25 -0400
Message-Id: <af06dcbe41bf640a6b3d23301a26b801f0fcd31e.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225514

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 +-
 meta-poky/conf/distro/poky.conf      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index 84baef347c..c20d5ec8db 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -41,7 +41,7 @@ FULL_OPTIMIZATION = "-Os"
 # Distro config is evaluated after the machine config, so we have to explicitly
 # set the kernel provider to override a machine config.
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
-PREFERRED_VERSION_linux-yocto-tiny ?= "6.16%"
+PREFERRED_VERSION_linux-yocto-tiny ?= "6.17%"
 
 # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
 #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 8c291d305e..7af1145d53 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
-PREFERRED_VERSION_linux-yocto ?= "6.16%"
-PREFERRED_VERSION_linux-yocto-rt ?= "6.16%"
+PREFERRED_VERSION_linux-yocto ?= "6.17%"
+PREFERRED_VERSION_linux-yocto-rt ?= "6.17%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
 SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"
-- 
2.39.2


