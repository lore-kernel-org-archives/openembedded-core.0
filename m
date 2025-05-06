Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644CFC3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 16:33:06 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.80820.1746549185345499502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 09:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vm7gNovo;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f521957182so39381766d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746549184; x=1747153984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQqR9OuI7Zq2KLpD8unMGLXB7pp0vH3opp2Oj25uAoY=;
        b=Vm7gNovoGG7Q8+Cg7ISUTsVNBcbFCDvl9IKHpooJpO4A6UzYPV324RFlsPluAe3/pc
         qhCrejoLkBGYl/X89bvZDO9JD7MuuNViHMz5210ucJYPXogl7WWSK3B/UI0/NNcxtTvD
         HshiZuqLpsIeefgwinTD0Bs1uTsN+rkNjgZnt/T6tO0gxxZ1JMm5bpI5g+yU9oX062kh
         DvDzWc70uWQ/csSrek5gUYJ3XzaJDxfkW+6l+IP9EnoV1jXBJv4evE07HKkph5BEkaDT
         uorsQPmQ1F8CYE9x5ouIr/7s9G3CJ6GyXgH95FcMbnIWo/DSvSPtzoZSj1nxBdKx1k3Z
         rWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746549184; x=1747153984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQqR9OuI7Zq2KLpD8unMGLXB7pp0vH3opp2Oj25uAoY=;
        b=ZmsUsXyBJAl9sHrWmWfXCDDC1LetQzPutttqksJGOzTGZKBlzOI3+Gj9e6/6RAG4xr
         bPKgxavg1/9FG2IxFH6QUtX3ZkEsdslXqQ+uFUWIZqtmEL7njrnxSDhy+uLDziz/n5Y6
         YFiStYbi3GqPBiZMfA6lD3z2r4z2xoEpLf0utGhr87OCmfwBdoVdpgc1+EjIwYRUIr16
         k9H9KhzwvdIslnGDlWnyTTegltwK4HWwTua1PZjQCMjfTjjEtWNeim/i+9iXqbcvP34E
         JQZ17KvZPr5JLcdbAN8L7iQWuKMhL1q2gqXeacRGuFB6+4RWLc7vFTo2O3U91PDdsmcn
         wEIA==
X-Gm-Message-State: AOJu0YxLaI7kxHeabV+OC+4ximz75UAu0HgDeievbvIpD6mJjIoJuJiq
	0ezOwURxW8ydKDrFQPBGFSOx2RYcUaE+tizFrVwbHk8Otw6idMxy
X-Gm-Gg: ASbGnctudruVbV6HwPVbgZ0pFL/ID90guMwiQz0UAKRYXu3vH1MO2KHDNtDHPSeEZNZ
	eMgK/sQEK2XPZb0K4PcwLdFBc8YX9hOMrvGd2co2f1+EIP8eoxiGXFgVJuWxyde+VzTMLpjGHt6
	uYR7/xfRMq1hrWWEp2g5xdX3nAAIhAbDl3QRDX66IQtGoYTwwNayT2ROBS6KvbeUl0Egcp5KdpX
	j2dAOfWN6ogftBwyk7M+esShZTBk19fFx2rYvdmLDf3nEwLiG9t4ADE0m8zzifXhRO7YWxjoAHY
	J035SBVLe0fVCZF410cKCSqfXNYvG8g1cEMVMTRzoQK3i1uyvZQbMLLgleKH2nBpeWJr1Q1bfxZ
	dfgxJQcw3MDCgULmQgFjQmLA105hDDWwFgyWgV7q0KA==
X-Google-Smtp-Source: AGHT+IHo2uJ7bfsEteKIaQx1Xh8b3knC8Z5UYRWxi8qHARXH9u/qsPnxwXFCBpOW/UaklXJyj67rKg==
X-Received: by 2002:a05:6214:212e:b0:6f2:b7d9:689b with SMTP id 6a1803df08f44-6f528cff04cmr209248586d6.35.1746549184336;
        Tue, 06 May 2025 09:33:04 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23c48ffsm735977085a.45.2025.05.06.09.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:33:03 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto-dev: update to v6.15
Date: Tue,  6 May 2025 12:32:56 -0400
Message-Id: <36e6016b6f378da661865b080fd23204f6f893b9.1746548780.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1746548780.git.bruce.ashfield@gmail.com>
References: <cover.1746548780.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 16:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216075

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping our development version to 6.15.

Note: preempt-rt is still TODO

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 0f9a3464dc..4b1f93a692 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.14/standard/base"
+KBRANCH = "v6.15/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.14"
+LINUX_VERSION ?= "6.15"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


