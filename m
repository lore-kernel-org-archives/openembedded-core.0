Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8942C6FD1B
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3857.1676835080802475834
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ingbWhE7;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id bg37-20020a05600c3ca500b003e21e018039so291357wmb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTx9+1q6bIKXaHMa5r2xFMejfMZnPRILFLWfr6pewcs=;
        b=ingbWhE7ZPQLsmaR0nAuKYRbITxO72LZ8MzoUvliFDzWc59WnuXmad714awS41c4k3
         54jIXa3DfgJC0C7aAoxl3rNX8UT5gdIe5sRpXJKewjUbIqLJfyxn8WGb3GD6TphaW0Gx
         2K+caAFeyGHOBOASjmBTD13R11vmyX0Jecy1PQzjU/uaOfioZmO1Y8nMp/uGhO54DriO
         7FJdJwmLZMCo9qCVZ3gMAxuo3xZsbR/T7Pumf4WX0B55deQoL7zYh+g00TZ5Dj/DM+lY
         deYzGEBMoH4bly+qn4VdHnWRY/1Y0ZY0gQFAJVjN4IRCi3T+qQ+5/LD3hSPBvbDlnxzi
         ezxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTx9+1q6bIKXaHMa5r2xFMejfMZnPRILFLWfr6pewcs=;
        b=UN19MXkIP1Q0xLKTilbYPop5lTa/tABdNLpPGaRCnK/RFuSzbx9N/+dfgVoU5zyrhs
         uhus+Fl86fc+9ONqL2MKTb6kmklbhAAvqmdcbA5GZnq48ltGVhBRBxfBUN9jC4+sCvgt
         /IGcPjUkoNXIg0epbh5vF2pupivBoMmJNmO5zCF9S1xde/A4+24yC+fIt+Y9FwDqKIM4
         KW99ExZHdgSx4iQQOykPMSR8MN4Wgy52jjXgKp1/N5Az76js5us7v4orE0YKa2WYr1Lj
         IDOwYbNmX0onHdXia6fHZR+PbiG34d94I6VuUp3GObUKOc9D7sLAUbxoYHiQdJH0J9FP
         8bvQ==
X-Gm-Message-State: AO0yUKU+w3L4MVyRcJTp/H9hUOlfn0ZtVFdrwp9DtP2in9Xi8CktrWOc
	H11SqAUfV2LLZr90KLx/yZM8jP3xg4Y=
X-Google-Smtp-Source: AK7set9GKTyZM+deVvlkpayl19hTZE/5HBdFGZxkpicv3+1rahIVXwvjAz/VqViGNjJA+Od3PYf2gA==
X-Received: by 2002:a05:600c:4a9b:b0:3e2:665:4e40 with SMTP id b27-20020a05600c4a9b00b003e206654e40mr4751470wmp.19.1676835079363;
        Sun, 19 Feb 2023 11:31:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/39] ruby: upgrade 3.2.0 -> 3.2.1
Date: Sun, 19 Feb 2023 20:30:44 +0100
Message-Id: <20230219193101.338397-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177366

License-Update: additional items under MIT

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/ruby/{ruby_3.2.0.bb => ruby_3.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.2.0.bb => ruby_3.2.1.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.2.0.bb b/meta/recipes-devtools/ruby/ruby_3.2.1.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.2.0.bb
rename to meta/recipes-devtools/ruby/ruby_3.2.1.bb
index 0e1336f5b0..3f1bbc262b 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.1.bb
@@ -10,7 +10,7 @@ LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
                     file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LEGAL;md5=f260190bc1e92e363f0ee3c0463d4c7c \
+                    file://LEGAL;md5=bcd74b47bbaf2051c5e49811a5faa97a \
                     "
 
 DEPENDS = "zlib openssl libyaml gdbm readline libffi"
@@ -51,7 +51,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "daaa78e1360b2783f98deeceb677ad900f3a36c0ffa6e2b6b19090be77abc272"
+SRC_URI[sha256sum] = "13d67901660ee3217dbd9dd56059346bd4212ce64a69c306ef52df64935f8dbd"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.30.2


