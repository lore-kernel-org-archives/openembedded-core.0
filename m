Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C944EEEAA50
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 14:39:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.14007.1694702370521603295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 07:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=HlmLGFgi;
 spf=pass (domain: baylibre.com, ip: 209.85.221.50, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31f71b25a99so967259f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 07:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694702369; x=1695307169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUAas+AHAVjNvpQQempZ3c5nRU83ugN362bbeK+PGO4=;
        b=HlmLGFgi8g3GkmKhxTGNtpuwJxYE+Bmy1n1vpWizgfwI3EQsYl5TwOM3ndTtL9eGVo
         zBM3IQDfoxi/nM06dtp3L56J8+Ar1C8cW/gHWt8u9E6Nm7R2TqSKog2c/DbMmScVHb46
         cAYCtUAOpM+3LQF4rC+VXsqjSUqaXAoSmU+QjDcDBiDMlpBEJh/Hbw8U3ehY9NEWzEHC
         NVTW+Os3s6+UbFsB4+N8OJjAe8YlJwjpviOj5hZQVTk5cRcQ4wNnGIfXvth+61WSYghp
         TQ+9hr+DtSeiC7WyF3SbnX8f9nv48eqWVshE874b73MDl+OFS6Os4YRvScuhKbfLXg2t
         PZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702369; x=1695307169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUAas+AHAVjNvpQQempZ3c5nRU83ugN362bbeK+PGO4=;
        b=sXx74XXaSXmRit0gn+8jPPmLGpd3qycQ761Wcu++aKlL4JALkvOMBjZ8PZtRaQ3YnW
         qlSqbj3nb1V4sSaYBXfxtmW6l4DdJYqEKR6CDZytnTbw7gtc3jbxudSp9Ea/47sTl5WE
         rPATjRbq5hr0YZxdvEcY/H3bq2cPb/r39lFY5lSEGW0PB7yusR9zMLfpXLd83JcP5oPk
         B5G56DnJNiCh9QZK6hxeWVvhCSpc6wgdQZ31fd6mqOh6Bucd9QMrZs4wgGuYl+yy+Jj/
         RdTufDpIkk5VsxIfnpAtt7D/1i6oApCb81Im3koE51BQ8b3jgk6gDG40n15OkpI+RD0y
         5p2g==
X-Gm-Message-State: AOJu0YyiC6+ajaf54r0VQz3mQVrfVt3rMgH6SCGMQ3+P8CxYJLvQ7M7u
	Elqzj0xd+rvGVhS96Dy2xwPben4RH5ZNEiE4QkQ=
X-Google-Smtp-Source: AGHT+IFd7Toty4ijIaMBxm83Osr20JO+XravKRnlxHh0AOAWWEMWoYNnmTw6NskrhXN9kmDFYlnEYg==
X-Received: by 2002:a05:6000:104d:b0:319:7abf:d8e2 with SMTP id c13-20020a056000104d00b003197abfd8e2mr4312655wrx.24.1694702369068;
        Thu, 14 Sep 2023 07:39:29 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d15-20020adfe84f000000b003197b85bad2sm1951818wrn.79.2023.09.14.07.39.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 07:39:28 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] update_mandb: deb fails due to missing man cache
Date: Thu, 14 Sep 2023 14:39:19 +0000
Message-Id: <20230914143919.985474-3-pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 14:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187644

This only occurs in debian package builds when populating the sdk
and is a work around that seems to work. Eventually we should look
at why this is failing (I have ideas, it's somewhere in
lib/oe/package_management/deb/sdk.py), but for now, do this so we can
fix the core issue with nativesdk-intercepts.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 scripts/postinst-intercepts/update_mandb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/postinst-intercepts/update_mandb
index a061bb426a6..f91bafdb117 100644
--- a/scripts/postinst-intercepts/update_mandb
+++ b/scripts/postinst-intercepts/update_mandb
@@ -9,6 +9,8 @@ set -eu
 CONFIG=$(mktemp --tmpdir update-mandb.XXXXX)
 sed "s:\(\s\)/:\1$D/:g" $D${sysconfdir}/man_db.conf > $CONFIG
 
+mkdir -p $D${localstatedir}/cache/man/
+
 PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${bindir}/mandb --config-file $CONFIG --create
 
 rm -f $CONFIG
-- 
2.34.1


