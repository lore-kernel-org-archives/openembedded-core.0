Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92791C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:22 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.4285.1667832920515670336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VO7Oy2uO;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id h9so16654337wrt.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQ10OIxiwH+vCA9KybsLFdcV5RLUoHo5LXDfa62yNEg=;
        b=VO7Oy2uOcWfkN6h8mDq5URi4kSiXSsIVO6jKjr3Q7k/mZ6nIHVg8y+pmlkbrX9W9Wt
         HJOmUrQA0i6t3SoYaRfSPvLxoWN6zR9b2TF4YM1dc9Xz1IaB1DcMDol7jfxlsS85YoVz
         udqKslUSvgrkEbo+PC2Qz/Me4SSkhrhJ2BXJNRYIXom4OYC/kKlhS8VGHPCaL1Qtb3zX
         Kv13B0yHIMdSUtVioLCmAJffjtKTzeRYZHcEK4ZFugyXLF+SNpO/eWcJgHZsSWlnrs26
         Ien9nL+PMWDnSQ7dy0nKEoX6asYlma1ZEOT4btfv8T4AwrxETQ1j5q83lYKI268IWpIC
         CWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ10OIxiwH+vCA9KybsLFdcV5RLUoHo5LXDfa62yNEg=;
        b=qKaj2aJ/n8N2yoHTHEyJauoRN0Avgo7gIx0fkpG6ro/8RSXtMkVAxUUyeRtlMs8bMf
         ZSyORjMBlXlP8yfJdk71hMjvCPPcvEXWXRRGcJ5EgT9Uhn2+U44WH0FFCPIVTO071dhk
         bJ0vYETpmbYLsgsjnWZUwOXZ7gdePN747YKDhbHM3gq1KnAPIjdpfyyRvTSlRYJAsyTk
         kI8udanVI/uqdPyZ9i++q5cF4X4YFnC1/KBqryb2JO8dkF8edwwOWlsLnUzo/nfqUN90
         B/d+TYlQ4C10W6A3X4M9fjYReF8wlKhCXkVWUAgLqMUX9EbKpcWB7B5h5623Aydv/xcF
         uicg==
X-Gm-Message-State: ACrzQf2f6grlqgzwl/CWeTeRLt6ACecR/hM23BrlwR8iXA4a3GDy2ZFD
	ZSgHDPYQjvvRzY3tpAw1obwC7UEh1Yk=
X-Google-Smtp-Source: AMsMyM52wiuEJNke7TzORG3uxkNS8k38mCCbiQL2TKrOJ7ddZkZm7wwpPZUDbrW32EmJZDMlqSz7Wg==
X-Received: by 2002:a5d:5e8a:0:b0:236:cdf2:aa33 with SMTP id ck10-20020a5d5e8a000000b00236cdf2aa33mr26725699wrb.713.1667832919012;
        Mon, 07 Nov 2022 06:55:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/48] ccache: upgrade 4.6.3 -> 4.7.2
Date: Mon,  7 Nov 2022 15:54:25 +0100
Message-Id: <20221107145508.1051404-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172855

License-Update: formatting, years, removed redundant copy of a boost license

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ccache/{ccache_4.6.3.bb => ccache_4.7.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.6.3.bb => ccache_4.7.2.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.6.3.bb b/meta/recipes-devtools/ccache/ccache_4.7.2.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.6.3.bb
rename to meta/recipes-devtools/ccache/ccache_4.7.2.bb
index bc1be92bff..b8598af639 100644
--- a/meta/recipes-devtools/ccache/ccache_4.6.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.7.2.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=7a19377a02749d8a1281ed608169b0ee"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=8fc2cae2bbabeb9236cacfa1c83a3dc5"
 
 DEPENDS = "zstd"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
-SRC_URI[sha256sum] = "f46ba3706ad80c30d4d5874dee2bf9227a7fcd0ccaac31b51919a3053d84bd05"
+SRC_URI[sha256sum] = "6b346f441342a25a6c1d7e010957a593f416e94b5d66fdf2e2992953b3860b9d"
 
 inherit cmake github-releases
 
-- 
2.30.2


