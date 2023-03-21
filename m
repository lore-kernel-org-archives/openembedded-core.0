Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BEDC761A6
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:20:47 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.14681.1679408440847285442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0uKzOgo6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id j3-20020a17090adc8300b0023d09aea4a6so20387007pjv.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy+FBZoV7gjJzBXPIpL/HA9vOCGxoksf+w+GYY+bDQY=;
        b=0uKzOgo6ondmZHXap9+JBiz+fF7OM0EOP12FFWksSAS0NTLP93pMlD4Aru699F9fjM
         AqBBoY4nLipwv6derdGFAD5zcq+SIr2DXHrWCJ16/EK/KhkGfu/PrPfiYhSjOGZ8IwX2
         ti3CQkCAxAMSPRgrNSfOjtS1C1HZiJ6XjseMkjYs4QXqn/LwZg+6PxDK9WzUF8LeEUcz
         UXs3ntn9Fhc9YLVI4rhA+MFtNV5NerWukl+jND3uQZuYU1szKQC/R3M4SLwKxBAuWIxC
         UYFLIPby4F4ckhM8j38GuZ6Jp3KOh4ZFcmlqN8JfucfvwnezGmp0CyrD4G4ap6msvMKW
         3ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sy+FBZoV7gjJzBXPIpL/HA9vOCGxoksf+w+GYY+bDQY=;
        b=4uTh+QxMyvqKiKB7lMSh9Oq4Uj99gS+tqN6HTKZ4Dd9XHFVVnUSJ4NEYcOJmPDnByE
         UMRLdTgZyOPYZ7OMG1+fBz7R7A4O65Dy/VoTtMipBN+MYvuouFUm+Lx2quohc/BET0yy
         S06f7ZjQxNRCT3ETNI+FPZdjrcD2F3C7/Z9J+N/bBz0nvJl/5Zai6O+e+7vl6Ngd1B60
         wUoRMyJabiJvXl5lUszO1QRm++RnNwjg1Z7bzSVEZHYfA4PQXFwGe1V0mgqiTZlOaaVz
         eXqaKHen4ZTt6NxoOlvY4G2eKeYTfzYbG1GRGfPmSrwEWCXVx4SIAZgJvPyXGUaJ+Roe
         fo+w==
X-Gm-Message-State: AO0yUKW3cQ2qp2yufM/nSoL39NSQJmMst5SGuSxuNInWzeWUdZLogMf5
	EeysYLjGBgaQYTKanzonRUYnmgRfc7uUCLdTeuc=
X-Google-Smtp-Source: AK7set9jJfMwzm2mtettQyo9dU46HHFUkgxG0DV47gxhnU1ha7TEvnJwpO5Y4XtvASoGlWNTWstaqQ==
X-Received: by 2002:a05:6a20:1be1:b0:da:2591:277d with SMTP id cv33-20020a056a201be100b000da2591277dmr1641687pzb.61.1679408439874;
        Tue, 21 Mar 2023 07:20:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/14] vim: upgrade to 9.0.1403
Date: Tue, 21 Mar 2023 04:20:10 -1000
Message-Id: <9351cd3bf259260c17e7c99612b3c28d58a89bf3.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679408291.git.steve@sakoman.com>
References: <cover.1679408291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178876

From: Ross Burton <ross.burton@arm.com>

This incorporates fixes for CVE-2023-1127, CVE-2023-1170, CVE-2023-1175.

Also remove runtime/doc/uganda.txt from the license checksum: the Vim
license is also in the top-level LICENSE file so this is redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 71111e6b62d37c5e6853d7940dec2993df127a35)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 828cf84757..1f5e570757 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,8 +10,7 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS_${PN} = "diffutils"
 
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=001ef779f422a0e9106d428c84495b4d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -20,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1293"
-SRCREV = "0caaf1e46511f7a92e036f05e6aa9d5992540117"
+PV .= ".1403"
+SRCREV = "e764d1b4219e6615a04df1c3a6a5c0210a0a7dac"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


