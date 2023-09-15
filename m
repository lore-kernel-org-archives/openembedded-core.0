Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7692EED60B
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:22:15 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.23125.1694791333254602448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V7TBadTy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-273d10d3df3so1964821a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694791332; x=1695396132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzK4Yu8pKLDXuGsyJgK1k4spjRZUQakBENcmzlcVW4A=;
        b=V7TBadTym/mhiEwq8PpbDdP9/3Ex3ivbKi9vfQNH/v9cOakX3MmFjlY+x7gGrVKc20
         6fDKbzwsCfyTK79Kz7s/Kd89K9uULSIQU1ctXQM6UbST9BsoOyHUqXAGwJ31c3ZFCfQZ
         K6E+VHHoimQnaiYgv7jdLJygzitvSf7yJf17HtH+sDYeo9eSkiXcnX4HF97OSBDB+1fM
         aaD/pquWqDeUahPb1S8RcvmB/ArnPhZNEKf59uQLJiJG1r8Mhqd/vHKmhGXjGV6+E4lO
         XEptQELU/oa49ctTPWPnPTdBi0lI1M8PBo873Ek7DKLz8MpnMTGHwYP1yfBrH94h9LPQ
         kGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791332; x=1695396132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzK4Yu8pKLDXuGsyJgK1k4spjRZUQakBENcmzlcVW4A=;
        b=WCZwbeQBsBSs3+F3HPNxf9zVeTz6Qlai9dDLi2UMtR6WGYoIuQjgaHI2pzPjwhAT0V
         mci7V1eQYrmXWgtm8TjL42nDl0EissQNyzhAPalWN4UGSBvQy0TwD4TESpHmHupMPTkK
         Kaqf1GfkZFsnHTcTV+xjRiuhA70OTJZ9H7R+h1SceabDVxaJLSllY0xqhUif0EA9bA6G
         U+hzKLJVMcZPXrq0joHOvrMIyE0lRhFMrnhuq38ZHN2s2DjfUZZVe3Av9IRnqvYLDRyD
         VXFj760LZOMkrl75R+IxBZslSJ93NuJYjENHuVm8JhX+mYT3ygGz0kK/EtxLet8Mg4yU
         +MLg==
X-Gm-Message-State: AOJu0YzF8xre9Yc5KdikBzQhXZoQnrEd1HthdXC9yYGXcfSev7F0kkUf
	bVWr4LHkhd5bxCIvPEczJQW6p+qmzYmnjgMSow8=
X-Google-Smtp-Source: AGHT+IEr5Fe/xYws5uayUQBfJ4nhWKfmb+W/AdWUGSoAeT0bVwQhNWFgjDaCPhDmIyxSs0x2Kao8zQ==
X-Received: by 2002:a17:90a:17cb:b0:274:8f11:96c9 with SMTP id q69-20020a17090a17cb00b002748f1196c9mr1686340pja.44.1694791332392;
        Fri, 15 Sep 2023 08:22:12 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090ae29500b002749ae93778sm1375398pjz.23.2023.09.15.08.22.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:22:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 7/8] vim: Upgrade 9.0.1664 -> 9.0.1894
Date: Fri, 15 Sep 2023 05:21:45 -1000
Message-Id: <df2aa4b32484735dba8f7a62bf817b1f4bb518d8.1694790288.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694790288.git.steve@sakoman.com>
References: <cover.1694790288.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187675

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This includes multiple CVE fixes.

The license change is due to changes in maintainership, the license
itself is unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91e66b93a0c0928f0c2cfe78e22898a6c9800f34)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 8a399cd802..5f55f590e6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,7 +10,7 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d1a651ab770b45d41c0f8cb5a8ca930e"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1664"
-SRCREV = "8154e642aa476e1a5d3de66c34e8289845b2b797"
+PV .= ".1894"
+SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


