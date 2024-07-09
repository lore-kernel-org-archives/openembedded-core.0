Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EC4C3DA49
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 19:30:19 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.4651.1720553413352940648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 12:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jizoWIZx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-6bce380eb96so3067381a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 12:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720553412; x=1721158212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unR8DAk+bCwGCDNURmQ0zy+84zOZDBybMjl0vc3DQm0=;
        b=jizoWIZxaML9+FYjRtsRG3D2zEtdsBc3tX3w19z0viSPOG1ldmI1mZ4GXnewsMqCqa
         Q0/06ynGLTMoH8QuB6SumvcDdm34LlXdzgkvkHiB0Gt1ECpyFns4vXe1A58WEXtkD0Fs
         569Gk1XrIoiWcp5FriFN7aPKuLv3vgQI1YFKZF3JoEbxz7pV4l0YAM0b20kUGksgSeja
         un+ctPFtPqEea1QHdnUp2NUJDJ1V6Nki31jN82ZAObecqpHO4QUowegkfjku5WxTJNBO
         BcOuuuvL+uHCBNNHC7iZFdqZ3arc47csBoFlwfs2CoFUnA5C2NXG0p40e0FU10Yj6sou
         FTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720553412; x=1721158212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unR8DAk+bCwGCDNURmQ0zy+84zOZDBybMjl0vc3DQm0=;
        b=CwWb8YE2atUrQC17FgaHWNXIa32Ve1v4S4NFPhrxs++75d2lvKz9TDMPH9/x9QiRSa
         L1Ly9PaT39LGxXDcSjyuKXdUAw4b4a6nSIyEZJ+Rq/9wWH9TmvsYlmWG+ZCLYIrsnQZ8
         ta8YLPQW0wcWGY8qo90/wcoy1OVen/9yAccWpQJYD72sHneCBBur2a3iDOgpF5JQ02du
         fVOU+YU5Y32X4lKOrPDB4v07lnRfxTRk4nSJLvBaFtJ0a+X1lkv5ApuilqayiyJ/P6mi
         2W/A/43cUv8v3682N4QK47gJ82DeTwac7W62tCRbg7rOgAyC7kjmdlccKE7XT+YjHRd8
         S8IQ==
X-Gm-Message-State: AOJu0YyOTDdlBXb3O1zBeX5iF4i339123Xf42pM3XsfQshWp6MprKMbb
	CyZjPQm8pjaB2zI0BfisxeIptJtBbTJMX35HyjJeQGhg0o3a2Hxg3+rSDUdKNaYaraqQlwxmF1P
	o
X-Google-Smtp-Source: AGHT+IGpPVNEyjt+zWuZBavJNUioY4MEVWr6EujXqa88eZgxBDl0QLo5wFL1CQUQqGdbaiYmAdzTww==
X-Received: by 2002:a05:6a21:3393:b0:1c2:8e77:a813 with SMTP id adf61e73a8af0-1c298205f0dmr4256314637.1.1720553412424;
        Tue, 09 Jul 2024 12:30:12 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438995a8sm2282780b3a.10.2024.07.09.12.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 12:30:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/7] flac: fix buildpaths warnings
Date: Tue,  9 Jul 2024 12:29:58 -0700
Message-Id: <860d4d6b54f61342f925ea522f9962555ae5d8ac.1720553275.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720553275.git.steve@sakoman.com>
References: <cover.1720553275.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 19:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201678

From: Peter Marko <peter.marko@siemens.com>

Generated documentation (html) contain absolute paths cources
using buildpaths warnings.
Replace them with relative links.

The file with root path to sources is in my build
/usr/share/doc/flac/api/dir_c122f5d6544f32779f55e8358fb78605.html
which does not looks as stable name, so replace it in all files.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7d826c88933d53d550265f1cc382539c5c52994)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/flac/flac_1.4.3.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-multimedia/flac/flac_1.4.3.bb b/meta/recipes-multimedia/flac/flac_1.4.3.bb
index d4e463cda5..87b67bee1f 100644
--- a/meta/recipes-multimedia/flac/flac_1.4.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.4.3.bb
@@ -34,3 +34,10 @@ PACKAGES += "libflac libflac++"
 FILES:${PN} = "${bindir}/*"
 FILES:libflac = "${libdir}/libFLAC.so.*"
 FILES:libflac++ = "${libdir}/libFLAC++.so.*"
+
+do_install:append() {
+    # make the links in documentation relative to avoid buildpaths reproducibility problem
+    sed -i "s#${S}/include#${includedir}#g" ${D}${docdir}/flac/FLAC.tag ${D}${docdir}/flac/api/*.html
+    # there is also one root path without trailing slash
+    sed -i "s#${S}#/#g" ${D}${docdir}/flac/api/*.html
+}
-- 
2.34.1


