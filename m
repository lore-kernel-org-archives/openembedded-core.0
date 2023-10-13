Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872D4C46CA1
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:13 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.51160.1697233992932243368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H5fZZGpB;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.52, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-57bca5b9b0aso1370264eaf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697233992; x=1697838792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TIjkC2w/yML05Qb9CWIdFHmjRuqopCTX6YOaqYwcK4=;
        b=H5fZZGpBlfzHMBxuFaGZlW5tHuIzYfiisZLOMw1AlvU/nsTYN+0F0NXlDepRTPnmrJ
         AOqOqOKzkE/EGeZGEJpaVciBTe++wtGOVxrXJKXzA1RTFbFfx0sYIHXHqnYMhvozcgJp
         5US2DKYaGVIC7suxkBLKufOmyDC3LFhEI05t5mmMd7qdRPx7sWQBC7IYlWw2wWawAswk
         GCi1ivhqa/eYD004IGYTI0RzR56q5P9R07uEcUsIcSUW5d7HTVzm/PS8Ul4PO7JEM/AW
         e4YsBZXQ7t5ahf/e012I14RQQB3ezUaWl00KUBw7PLf/IqSRB3zzcdy9eipuz8EpmZ5m
         VEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697233992; x=1697838792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TIjkC2w/yML05Qb9CWIdFHmjRuqopCTX6YOaqYwcK4=;
        b=tl9nfEhiShXgKY1K8RxlNCLp06nkmP9D5KhjtqLu71p8tnA8Jeu6FQWKiMlMJuAJLs
         omBeYwld4FqExSKK4jDIhV++9RRjLn22EtRnasFgv4Vde3qkB68Kkbrsq6Dh8k6Zz5Jv
         7tc72DCUn663lsT4wzuYTME1XW784nkeAVHy5RF5H0b7knMdFZLb0SuO2aaKTVkn3ihv
         234Ou809OmtBy5dvpKtc9JB/0qe3Ga3+7SS8T3nbxNOIxhgn70negnXNE8ODU0BKhLeR
         h0tFs5LsnT7Y9rJEbE1iEv8Vfigfzg9zzfegzqF8nfF71phaiuJeLS6VQAzo99t/0Q1u
         0Q5w==
X-Gm-Message-State: AOJu0YzSkkSXJPaVhL4ypVaTncKxZWQN2F91wKEn0duuJmCRUTwQ7i7M
	ncCpoSvTelYuvT48w61znBIJx1bP8dorC1MJZTw=
X-Google-Smtp-Source: AGHT+IENQ+hBuJoxRikG5flmx3MLJgtdsK9YFeSsWZl3cQyawF+LY9biYT+GFGfI2R6hOzYp13b6MQ==
X-Received: by 2002:a05:6358:88f:b0:135:47e8:76e2 with SMTP id m15-20020a056358088f00b0013547e876e2mr33562928rwj.4.1697233991839;
        Fri, 13 Oct 2023 14:53:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/27] dbus: upgrade 1.14.8 -> 1.14.10
Date: Fri, 13 Oct 2023 11:52:30 -1000
Message-Id: <67ddf87d3286007a68071685d28a8f9e1ce7f3fa.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189083

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
• Avoid a dbus-daemon crash if re-creating a connection's policy fails.

• If getting the groups from a user ID fails, report the error correctly,
  instead of logging "(null)"

• Return the primary group ID in GetConnectionCredentials()' UnixGroupIDs
  field for processes with a valid-but-empty supplementary group list

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aeabd6dd4e65e5cc31f4c2acc5cc46ea03737bed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/{dbus_1.14.8.bb => dbus_1.14.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus_1.14.8.bb => dbus_1.14.10.bb} (98%)

diff --git a/meta/recipes-core/dbus/dbus_1.14.8.bb b/meta/recipes-core/dbus/dbus_1.14.10.bb
similarity index 98%
rename from meta/recipes-core/dbus/dbus_1.14.8.bb
rename to meta/recipes-core/dbus/dbus_1.14.10.bb
index 2dcbadd50b..2a256beabf 100644
--- a/meta/recipes-core/dbus/dbus_1.14.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.10.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
            "
 
-SRC_URI[sha256sum] = "a6bd5bac5cf19f0c3c594bdae2565a095696980a683a0ef37cb6212e093bde35"
+SRC_URI[sha256sum] = "ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.34.1


