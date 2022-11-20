Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84ADEC43217
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:10 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.13216.1668953761960017562
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1o7f+c+W;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id y4so8442096plb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPj1cQGKjp5C9P9oIePpTWLWahjGBi5vuIYBEi9oRLM=;
        b=1o7f+c+WN5kGukXrWC4kME44Xsu+6bihLC9nVR6tnV+W69nbzuYpr0zFg4xJwMpsdY
         baysNWj7yaKG7K4L1kiZRj5UmHQQwZ9HU4hbpNwnQN3khj1XTWIbmFt6orzgnu5ZazUW
         u/0MiTFAz4PIDoViUTAjWTrtQz9by96USuV86HtdgccAJuKqxVS34Q3RHpZI7LmLsapG
         hV6M6/s8cTyA48mmELl5R5hU8Aa/+1mczxC72tRkGH8HMqapw56TC+Z5eUVJdEwBRWWh
         f43HVPYwYq2gy9MwSHb+rL5bW6Dcq1AnO155uP9XQOnVyHS1o2DZPvENzV3fGQ7c1Avr
         DJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPj1cQGKjp5C9P9oIePpTWLWahjGBi5vuIYBEi9oRLM=;
        b=S1d+5F2nUpJTYk+bi4XzkLCtsFmmB18NBfOQ2s0OkBvUNk9CdZIEs3EKfRzjdso0WI
         P5cFd1c7PhzMINURB45PhnLxR1BFbb8fKboOpVVI3Nmr1DLXI3smsqLX0eiNSXBFRCpT
         acxLOzjq4+eranwhmLWyn+kWqc+RzzOMzMT4tCwXkFzOamOxkDI+VFQtfppgYCJ8wVZ6
         vJ/23VU4i8ILnAm5PkGH966uc79fHwAWzaqlL+/Jh0lwqIoYKFWK4UxGz8pLwyN2cd6Y
         ZJJJuQO8SXVddSf8+y2pqajRxLRnjTo6WSVSEj7LP4AVs1acle8/j/2iw9gyuXWYSZTY
         Ph3g==
X-Gm-Message-State: ANoB5pnREgIRb1ACq7zk/gZe5CYbG2jrWIUJHfr9ECYh++9aP4LFpKpg
	o1lY9iIBXiw1jqvHh2MmChOM7FQsLCfHk++4WmU=
X-Google-Smtp-Source: AA0mqf4gLaHD9fYUu1ERAf+gRzAlmSjucWZrUTDhSmm+W2lpmYE5ePl9FEWbGLCOgg5tyyaKvNifJQ==
X-Received: by 2002:a17:903:40cb:b0:188:7dca:6f4a with SMTP id t11-20020a17090340cb00b001887dca6f4amr2872856pld.60.1668953760981;
        Sun, 20 Nov 2022 06:16:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/35] sudo: upgrade 1.9.10 -> sudo 1.9.12p1
Date: Sun, 20 Nov 2022 04:15:02 -1000
Message-Id: <192735486932d64e949d3764629b3706efd1bbc6.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173613

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/sudo/sudo.inc                             | 2 +-
 meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.12p1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.12p1.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 8947c46129..fd5bbf103d 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=16cf60b466f3a0606427a7b624a3a670 \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7aacba499777b719416b293d16f29c8c \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.10.bb b/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.10.bb
rename to meta/recipes-extended/sudo/sudo_1.9.12p1.bb
index aa0d814ed7..1495b67b8b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.10.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "44a1461098e7c7b8e6ac597499c24fb2e43748c0c139a8b4944e57d1349a64f4"
+SRC_URI[sha256sum] = "475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.25.1


