Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F87C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:06 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.53230.1638136745708135217
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Fm5T841I;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id g18so14658902pfk.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Dj7HaZkX/9BNw4IhDdWE5Yo+udsUSKwtSVfEnXjxX5Y=;
        b=Fm5T841IwBePQpFVRsFp7ZsEKfPhw4zt7vBYueBA+hLX3KulivoTYo3eazbGJ1cPB4
         TBw5vN/P0NMePqi6lGRfGZ37eIox9dvJ7F2NSLVziTpUxE20H/JERCGilxJ+ZZGP4E+w
         M+DE1dh1Kg6P3VZg7fKX4Wu8+j/zJPsGZHvtDC0wxUubA8Qxb7un/2FywM9r8KKE+leM
         v3jPqXTCVlX5IjxVzHEoWR2ZzHA9Wz5OJ25hCcAKEznlqIGjcX4KAnc0lILmVo1cNe+Z
         ZHy5+ENwJHbdJ0V+KX8jHyyKzIzRPYjlyECbpnTypkHwelnofaBkqD+Da/c3rDfozyZo
         7W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dj7HaZkX/9BNw4IhDdWE5Yo+udsUSKwtSVfEnXjxX5Y=;
        b=lrvhkp1EwCLdqWjirWbl9WahGYZ2X3eV+qHLPLeQhZ+35Ctrihzzm4cQgbcVILzgaL
         /N7gLRllzXEtJ+pSZ+loL1RD1jQ4zmi1U+iRXLvEx2iTWz0f7pDRlTx3DyWC/VMKSyp+
         UE8H0o8AyIh1e5lrRuVRWXItW2CFbiSpEnc/u7V1OBfSmr21LRWQRYroK+TBs4wVQRWL
         Z+1H0raw+hzH+PpyJj4vR8ZhJC3PXJ4xgjG0qYNrGbRR7WHjjn1TXctwPy7wpddWuLwl
         zrSBJZyaeSB4gG64JUTdpC0q5THRz5JeOtv8RYRQxdDHbkGf02O0BtmS5uj3rC8EE+ij
         xPxg==
X-Gm-Message-State: AOAM532wDcsRtSWEaj/vO9HSiQJusRSGXh99ezThR6PcpTEO7F5xOteZ
	w12KuNWhtmKjmhiHYyfZnvF23yb9J+/fLym7Vfo=
X-Google-Smtp-Source: 
 ABdhPJz6l2WeJITsWTHwvpyTphXnYbSODM8L8bJlHoEVSrW0Z3LVKeipHQKUuAV+NnMmOTbbo9qSMw==
X-Received: by 2002:a63:5816:: with SMTP id m22mr32114671pgb.98.1638136744697;
        Sun, 28 Nov 2021 13:59:04 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/42] os-release: Add DISTRO_CODENAME as vardeps
 for do_compile
Date: Sun, 28 Nov 2021 11:57:30 -1000
Message-Id: 
 <f73a0fbe29434e26285b220964a0d0567c87dbf0.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158900

From: Daniel Gomez <daniel@qtec.com>

DISTRO_CODENAME is part of VERSION variable but not used as dependency
for do_compile task. Append it to the vardeps list to rebuild in case it
changes.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee0345057459c6d77fb64902a955e836c6c1e8e4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/os-release/os-release.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index a29d678125..33f75e39b8 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -12,7 +12,9 @@ do_configure[noexec] = "1"
 
 # Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
 #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
-OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
+OS_RELEASE_FIELDS = "\
+    ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME DISTRO_CODENAME \
+"
 OS_RELEASE_UNQUOTED_FIELDS = "ID VERSION_ID VARIANT_ID"
 
 ID = "${DISTRO}"
-- 
2.25.1


