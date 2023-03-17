Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5837FC7619A
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:42:59 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.467.1679092971314275220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yqgk5MfH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id c18so6802789ple.11
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+8Pxdf9CnwGOxycVdbc98ZghM7KC6uU4KWiDMVJ64U=;
        b=yqgk5MfHsT5x8gZ47uMN/xgFt0maluhKNdX6OjA39DpqMp83XRVnRU8sVFxz75/ouN
         lD9Y/t2//0MPigvF7OqH4s+7hQYpD9oz79hUisUd+x+3hnRKNY+Zelizyd+h+TiNNzll
         UFeEZl39gO/nBR6+jFb4mDaC991EtNjN8wZKAgXSj9g8DpxeY24hXboZ0g9/3jZSBmTg
         rvKen5Lw+HKfWUcriqUclsrXh4hLsDsMV4u3qgJgfTaDoGmw9I9Ihf4nZaGhQIpxNnrW
         3iGyQ3+ooR73LGzYq1p4gVqH/pRclJzUh9Pi/AA50TMjmx9Ui6UiK7JO/ZidC1KEhutB
         wQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+8Pxdf9CnwGOxycVdbc98ZghM7KC6uU4KWiDMVJ64U=;
        b=Prph7leyGNMJiM7BVemGZVV5vD5Fbu4U9nzOCgPI/X6SNwtcFQqHvywspNSPEanUZx
         +7ZgvB55PSwakHcZEtfiYIt5WjV+olSjexMLs5BRUjB8gSykzF09P/wjOpcqkewHyvId
         mc6zkg3L8h+q33cXEevKrd91dZjplWANVdH6n6MOOWy0+lCSbfsb5PwdYmfUCNXTzio2
         VkSrqilhYM3GAGnG9OYHpiO7VvtwZulMqLgWYmVMEi/QkvVlOpjWtLnKQuhdLyGBpL/0
         eqMphMyznj4TJ1Mlz1aGjvDCNIdvzgZ3/DQTaD47BEo32gD8XTCXebGw4HMQDOmnbkpV
         vbzw==
X-Gm-Message-State: AO0yUKVLwXMIWYArTMRtFVIvud/XLDa5cFSVhdHuAa4ox++gIIon+EW0
	OuNx3VzdXXeIHShnzYepdDwLBhLef9UQFXa57ZQ=
X-Google-Smtp-Source: AK7set+sjaqwCUUR0rziUU5VqbCMJ9l0xoau/hprP9fasFykwTbZBfnA/FlF+QNn4ng+Q4ZEdsfKlw==
X-Received: by 2002:a17:903:186:b0:19e:6d83:8277 with SMTP id z6-20020a170903018600b0019e6d838277mr10625084plg.51.1679092970421;
        Fri, 17 Mar 2023 15:42:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.42.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:42:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/21] vim: upgrade to 9.0.1403
Date: Fri, 17 Mar 2023 12:42:18 -1000
Message-Id: <2d9a183467def574bf3c4a2e2f9bc59965797f6e.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178765

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
index da586a5699..40ad44486d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,8 +10,7 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
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


