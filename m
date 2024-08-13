Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB006C531DD
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:12 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.70601.1723551430849348328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Yo4Boxao;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-76cb5b6b3e4so3505497a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723551430; x=1724156230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZOXkFcltwl+/HXHeS2TKh9SemYcS29+6L1xA+d8XFo=;
        b=Yo4BoxaonqqFErl5owmwlxsPlsBoBf9zpIlhJBUXhj1z+4HGkQ1N9pDXcsCQQjVO8K
         gaxSbALFkDuuoBikgWGe8t8iLcCgtrGySzsHG2wScD0r+brbq04VlxsXhBpuaPIKHTUO
         RI/aYCyr8+XBynAA1Dg6pPxf7e341CT81AF2iQ+FxgQLy91ARXe+XNXskTZjGL5iJWPQ
         rEzTMFAjQ1oILMrBE6BJTJYFc4O1jNgDuN1C4SybBcvaJpNJxfPPFgZkFtxl8XDcQv9u
         P+0GzBJez2xz3yuS3LcTF7PfJGHwEg5FDz0lNvMJ10mdEAhz1rYtLtGppeysTjY9w1kO
         LvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551430; x=1724156230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZOXkFcltwl+/HXHeS2TKh9SemYcS29+6L1xA+d8XFo=;
        b=Q+/GRecNInuQdaO69ieOM1iNowNO4VD2o2+K2dgfdl8cIY3gK+gG+3FZ4ldTqgnW4d
         lT+pmQbGFo2DGWX5NNMdXovUq1pUnQze6Y4Zjl7nzF1L1EPtkzzG5TFisP6o3j+aTZpK
         VVyMhuNNN6/e1/CBoM+Ju/0ZglJMG+qk/QpUF91hBYjBjQpxRWgojihCBpGtwYtFBFay
         SovICPBUh7ypErE+W0cTcL64uDLdRkrHWEfYoOg52NamuWu6OIkmXTSoXljPqFLAq3vl
         ywG38PB0W9URxwKOZOfB4JPnyN0DqjpMso+TWB4yeXN02x53GDS42EkekC6TC5YTzbLw
         Em6Q==
X-Gm-Message-State: AOJu0Yxa5yojEUarAXC9+J9q5llYUv8zArDTJMnssozH689y8RYGkAAC
	EGdQ8Towygye2HNHwTjUhDhnDFTmkcua3/vZ5IoDMBMd5kkuH69YQOqp4T4zdpmn2nMHQ3ZDiyX
	ziC4=
X-Google-Smtp-Source: AGHT+IE1ki3/4N+UEwARWZVpSx0yxji/9CmAO7in46Qa6tXsgwTv9XiPnX0q/krsKeTp9YLJh7X2xw==
X-Received: by 2002:a17:90a:9ef:b0:2c9:b72:7a1f with SMTP id 98e67ed59e1d1-2d39264f73amr3424935a91.28.1723551429890;
        Tue, 13 Aug 2024 05:17:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fced1838sm7148998a91.23.2024.08.13.05.17.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:17:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/11] orc: upgrade 0.4.32 -> 0.4.39
Date: Tue, 13 Aug 2024 05:16:47 -0700
Message-Id: <092d2a6df6eae6f93a35a0429d2cdfc9b246cecf.1723551231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723551231.git.steve@sakoman.com>
References: <cover.1723551231.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203274

From: Vijay Anusuri <vanusuri@mvista.com>

Include security fix CVE-2024-40897

Ref: https://github.com/GStreamer/orc/blob/0.4.39/RELEASE

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/orc/{orc_0.4.32.bb => orc_0.4.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.32.bb => orc_0.4.39.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.32.bb b/meta/recipes-devtools/orc/orc_0.4.39.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.32.bb
rename to meta/recipes-devtools/orc/orc_0.4.39.bb
index 829255f110..320abf536a 100644
--- a/meta/recipes-devtools/orc/orc_0.4.32.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.39.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0"
+SRC_URI[sha256sum] = "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad085ae51143d3040cc0"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.34.1


