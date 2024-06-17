Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8F2C2BA18
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:55 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.55027.1718625945686775464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L7YmTGFc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7042cb2abc8so3043890b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625945; x=1719230745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IO9sEE0rbjBdkqcJLGRpfjckRr7He/gAUdyXEwD50w=;
        b=L7YmTGFc40u2sGxFR0TN92GnR1udl0mODUg070Aqwgvvu5bCnu7ItVhO8C7XBmh5n3
         vgeK8lBdW7uU0vB2iUbpqDYcrOBmdwgHGiwQQ7q9YoGPalxRZxYXiL3wo0jbOSAbdsQy
         gNgNq2a/1DFTF64ONsW/Tzp+vMGeJKFNVa8/lsQLkV69RfMd4rSYwZ5PRr7lFjXsWS7M
         DFMB4EQkEUwuimzTy4iWmGnisOWI9+QJFZOdbuE2e4XPP6p8USTC4EMCKqW4GKe4dmeW
         5j+1MQ2eWDhINyVTiii+cICOS+Z+xlbBZ0jJzePdFWT/Afj2AG+tIqRiKDUVdaNFh3F8
         BJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625945; x=1719230745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IO9sEE0rbjBdkqcJLGRpfjckRr7He/gAUdyXEwD50w=;
        b=GiI6pnt9Tar2wIf5Ci/MvgG3Qkm6yVXR38lkFDLFuzLws9aOvBvY4u78WROS6x2keN
         Ex1phQIGAW8anqIslOoL2LnZHvf67kz0LlIQrtmxZGu/FQOAeenrzdB/idb2qrjSExX8
         xlM8bOffTC3NLWOkOZQdLPOYrhcir7HbQxJZ3VUY4ORSiBBDFj3v28lCQn50WXPuYGx4
         9gz6eXZc0IinodUl9QmsEROCcnPBvfozptR5nqGPb1MCvrO/aEJhKrxQLkMjr7i5OTHJ
         px1w8g+LLoHcRRaevtEpFE3tcurkUHVlglxLomeQHROTk9yR17HL/+/mKV5sZJlo4oT6
         vzYQ==
X-Gm-Message-State: AOJu0YyITpFhFZlwbqgXQBsJA6D57Wmok6T7/lPbHn0IoD0Tj45/GxLJ
	sp3F30EGE0AxrZ3fX7S9tYUoK9LfQdov7I9VVE5IJtf2vefT2Ps4Z5aifslPr7qF/kIY4vwLdxP
	mpQY=
X-Google-Smtp-Source: AGHT+IGOesnnTwpw6RQqvcQ7F3RLroqnWLfcoF6spgC3mBeX6AyL5mrN/CpQVs1YQaqi6J6Hw33B1Q==
X-Received: by 2002:a05:6a21:1a7:b0:1b2:47f9:3814 with SMTP id adf61e73a8af0-1bae7e1caffmr10148614637.2.1718625944937;
        Mon, 17 Jun 2024 05:05:44 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/22] consolekit: Disable incompatible-pointer-types warning as error
Date: Mon, 17 Jun 2024 05:04:50 -0700
Message-Id: <9199d64629e8d27736c7f1e73cd9e95e8f04158b.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200823

From: Khem Raj <raj.khem@gmail.com>

Fixes build with gcc-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4fb4007cbaf545e023b0cb55b80fb5c70cf5b57)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 346bd60e4d..0f2153d493 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -31,6 +31,9 @@ PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/s
 PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/,--with-systemdsystemunitdir="
 
+# Fails to build with GCC14 with incompatible pointer error warning being treated as error
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+
 FILES:${PN} += "${exec_prefix}/lib/ConsoleKit \
                 ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \
                 ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
-- 
2.34.1


