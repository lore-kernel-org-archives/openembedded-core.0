Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28694C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 06:08:23 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.37563.1702879698144399016
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 22:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kmc0FczN;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6d7e67d31caso138498b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 22:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702879697; x=1703484497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSXScv1uWrzDGG/hTjj7TZfY7ppBHO+8VsBgmKph/S4=;
        b=kmc0FczN3rOiu9sLRplgouQqG/KoY498WSWqX8IQPbYMjpVnrAYLCv29gRs5hD2h33
         y1oqu3SarWudB+nXUDJtRItklSJvNUNFZYVr75zCYMrt49jT3qwtOhtCmgEuQCvNHE6k
         ushbXCXxy7WMux0LJBgjvB4j2z8PD6HOyNdFK3XMw5G2LefBVJKWDJcgKvPh3jxCu2zc
         jWxFsM15wmc1Uqj/Ac9To35mix0t95ae1Mw2usAtraKKB7jZzDgbZA9StzBOL5p1lyLi
         +ComMSeCiWp5wdLGTW+VJIKYT9eXpGfTGicvNehfIj+OX1QoOJaCZutAaqldnykiI2J4
         1h4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702879697; x=1703484497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSXScv1uWrzDGG/hTjj7TZfY7ppBHO+8VsBgmKph/S4=;
        b=iFfqqzv22/IAlbsbIJepkaVYDosWsUY6DzNZ0/DSIhncM+z9xxwKriIP6GwcwxRkAn
         vZT8iJZVSdJhwoJekYDgZUdAbx9YNn8LsTJxEZKVg7eFMcgcclwh/udlANbdI+jrNA4G
         pvEpIm8KCBY6a/L8LzgZzBmSaqIDrivBtHnUEtT4C+UtQjtPhhp/XjdnIZxdkwuHQbfL
         rLy0D2gxankDHaMiFtv+3xREsgBTXQzJU57vOJBibnmTIbME+Rikw8PdvDNTGZwMOBxx
         tRt9I3tqeGtZSmAP+lGVKpPH2lwRRCLYd9mw1cD5Bbo4pp6FnRflegU3UtA6UHRddWtw
         x2Ng==
X-Gm-Message-State: AOJu0YxSaQ5irbbbZZdxt6pGyWnQoVrelF3Dsviw226iqEUAVgN9GCOJ
	LKaKTZ7XNWIlBf+RlrnWJ7kKEXzn5U8=
X-Google-Smtp-Source: AGHT+IECzr09n1xvYnEJYAqqrzDfv1T33zHhIdNIXphER0j25rX7ls28oRy+zGOq1AeFqLEJ/dmK+g==
X-Received: by 2002:a17:902:7008:b0:1d0:b594:3367 with SMTP id y8-20020a170902700800b001d0b5943367mr6971685plk.63.1702879697219;
        Sun, 17 Dec 2023 22:08:17 -0800 (PST)
Received: from kamensky-p15s.cisco.com ([2601:641:8080:1a70::73a5])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902e85200b001d0675e59f9sm18128716plg.200.2023.12.17.22.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 22:08:16 -0800 (PST)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH 1/2] systemtap: explicit handling debuginfod library dependency
Date: Sun, 17 Dec 2023 22:07:56 -0800
Message-Id: <20231218060757.14170-1-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 06:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192600

After systemtap commit 2e67b053e3796ee7cf29a39f9698729b52078406
"configury: rework debuginfod searches" automatic detection of
libdebuginfod is broken. Let's handle it explicitly with debuginfod
package feature. It is good to have such feature anyway.

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index d320a8a5e0..0a1349e128 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -24,12 +24,13 @@ STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 
 EXTRA_OECONF += "${STAP_DOCS} "
 
-PACKAGECONFIG ??= "translator sqlite monitor python3-probes"
+PACKAGECONFIG ??= "translator sqlite monitor python3-probes ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 PACKAGECONFIG[translator] = "--enable-translator,--disable-translator,boost,bash"
 PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
 PACKAGECONFIG[sqlite] = "--enable-sqlite,--disable-sqlite,sqlite3"
 PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
 PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,python3-setuptools-native"
+PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod"
 
 inherit autotools gettext pkgconfig systemd
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'setuptools3-base', '', d)}
-- 
2.31.1


