Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B89AC41513
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:55 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.54586.1718625947046613412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oTPsEDJE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70109d34a16so3732382b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625946; x=1719230746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Izs+rw0OP36jpTJjCUCrGHGEzJ9ej6KpSa7KbIIkWOc=;
        b=oTPsEDJEvZxYxGgOuPaM7yY47UUhWepG6R9Bf79fWlso6Zx3AtLwANG+U46V797P7R
         QHQhO1lZinEe/BfjbFVcJC2LlGO80QkyIqQ9cMJRhgPMBl/Qf0xGitAgvAO4Tkr9ajY9
         GV8Hf61aVK+rmKTQo/rjNw6tP3Lx9s2x8ngkQk0mYltCM15Xwfc6qB1S0RfXEIC63rst
         H0SUBpNibStx8mntb9Z0+kIGZPik90bmAv3jwR9jlUNHZWIQdXY9+vdxErqXs/8zUxXl
         naB838lrwpoMypiTQcX76DyuiIzQdKwMK7ITkcv3dZcH44LffY2KrDUTobVfxnaBt1RJ
         HLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625946; x=1719230746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Izs+rw0OP36jpTJjCUCrGHGEzJ9ej6KpSa7KbIIkWOc=;
        b=MeQ2Xyvrh+XNokm8eZsd9mSXbTzZTf/rrqg37hL/TTyp1grJY23BeyAH3x3GJp5JO8
         ewdR3eSEKfLaWDxjv+luKjtTwEpXd/L72BvYEHap1gEm4jQEiFghojvvh0qhnYnLo2BQ
         32IKA0u3TPW9/MhyhLQd/FjTBcXFVxDvIETZI+fHgv78hni+m4fzHuC6wBfTIEuy6My/
         sn1CrHQEDMPBefJgYPfJo26HGWGvjGSjCdGl3PTpnaE02QfyiqGLynrhTUVUS37mdKq1
         oc8Nza8vFaqy1bsg+oGt83Ei+nERnEJTOTpz/7B87sQKLDSMeQ4erbUC9p9eMPIkTKiN
         wApA==
X-Gm-Message-State: AOJu0YzrJA3DSjhHoQs4t9BsQAe5yabsil2PiSVItenWEclFkECpt8+O
	eCFVpuDkKhXvlwGveEPxZFzmvwc6P1CGQ0Au7fbqd3rxnqHlRLoh8jwKP/C83q2WvlQPmz8eh84
	4Pmc=
X-Google-Smtp-Source: AGHT+IFVZqH5ZHLeepz4ONybOZDRhsAaQkLIBxT28st+qR6bkaP2TERF/WA/DyF6AgMkcnh+PPEPxg==
X-Received: by 2002:a05:6a20:2593:b0:1b8:5ac6:4bd3 with SMTP id adf61e73a8af0-1bae7e11304mr11643931637.7.1718625946306;
        Mon, 17 Jun 2024 05:05:46 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/22] gtk4: Disable int-conversion warning as error
Date: Mon, 17 Jun 2024 05:04:51 -0700
Message-Id: <67e5be967e9d10ed295e9ca4cbfdf759f33e143f.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200824

From: Khem Raj <raj.khem@gmail.com>

This helps builds on 32bit machines when using GCC-14
there is a bug filed for fixing this in code [1]

[1] https://gitlab.gnome.org/GNOME/gtk/-/issues/6033
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3735b5566c7e0e1a36171523e7b553497f4da1a4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gtk+/gtk4_4.14.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb b/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
index ce733769a5..497be6805a 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
@@ -76,6 +76,10 @@ PACKAGECONFIG[gstreamer] = "-Dmedia-gstreamer=enabled,-Dmedia-gstreamer=disabled
 PACKAGECONFIG[tracker] = "-Dtracker=enabled,-Dtracker=disabled,tracker,tracker-miners"
 PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled, vulkan-loader vulkan-headers shaderc-native"
 
+# Disable int-conversion warning as error until [1] is fixed
+# [1] https://gitlab.gnome.org/GNOME/gtk/-/issues/6033
+CFLAGS:append = " -Wno-error=int-conversion"
+
 LIBV = "4.0.0"
 
 FILES:${PN}:append = " \
-- 
2.34.1


