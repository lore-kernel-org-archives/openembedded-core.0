Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B90CC2BD08
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:45 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.55022.1718625940357601932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f7X5Za3P;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-704189f1225so3786468b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625939; x=1719230739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyvJR8SR1e7IrqHTLuwbWbmtQ1AcVuwXTOET5zDkjTE=;
        b=f7X5Za3Posbe7FiZb6pn+o2VpwKovjrArWJt/ntCwW/2IccWo3ZG9EB0hL9lQHIYrH
         NR9uJGxKx44zx1IVJ7Cnv0EbVfwfbx2bvCg4JB450GWd1GrT009r12R1ft8jrMpLmPpU
         hTyvUqEvmrLdoV3XCmOYTVMtj0CUmU9ccXT9pJUSBqW6LIERMMygKeYN+6ADQRN9k+4O
         5Xh/bTPk6A4c1NTEOjfpzb4tOuC5Q5/ORIBlFacCWFzpV3Fj5GqQAKJ3BN2ZT5GjTBnK
         9rwyo1pfismFWYNk0V6+HMEbEnhaYaj0bn5dC30H/MC1iceemwqzIqEeqrRw0TpjXlh4
         OltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625939; x=1719230739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyvJR8SR1e7IrqHTLuwbWbmtQ1AcVuwXTOET5zDkjTE=;
        b=W3vml777KpPo60Ih11q71jUTQWBwyPiqatx39XZqVl0/ONZvDzW1GORrbroh4ClnHf
         heILQtArtjbNQKDJUeV632IK4dzla2JQzBiTRELfCY+Bfsmarwat4cu/s6ACsXwFQ6VT
         dWQBXm7HhQ8BWKTcfwGibwBgac4BPYg3MbFhc17XjbNc1MtlpoM9nQIU49bQFShGwb44
         2u2IzJSwE9rmMb8UlUI39nifq1noDCjLwjWM+BNXu7g4kMZPgSuvGqQZt69ojWVpwLys
         RV3zzt0SExw2JDunDT92CKXP7Auofgd2OT9RleWPshFWKbM/zBWRcPhUCvCQ68hdt/3z
         uyug==
X-Gm-Message-State: AOJu0Yyo6yWBB2x0Lm3KwmMUfLIT5/fCg4DdMDm7lecnDC/447DMwo4j
	hKCqpFYP1hwRK+GkgerzpUzCNSk9sfc8XSRtYJcfFdHS48cOo1BglFUq2e4Exkgc+dm8TyDE/63
	yr40=
X-Google-Smtp-Source: AGHT+IEcpW2c0GcnyF8diQ89bBq1P4rub/rKEYruNDII023mA5uiGGUC5FvI4o+MSCWg9QLvw12low==
X-Received: by 2002:a05:6a20:4e26:b0:1bb:603:c68 with SMTP id adf61e73a8af0-1bb06030dc4mr3389371637.52.1718625938121;
        Mon, 17 Jun 2024 05:05:38 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/22] appstream: upgrade 1.0.2 -> 1.0.3
Date: Mon, 17 Jun 2024 05:04:45 -0700
Message-Id: <c2315a8879070b514870ded07cc2a49c0616a8c7.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200819

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * qt: Fix relocation of Config.cmake files
 * cli: check-syscompat: Recognize available required controls as available
 * validator: Guard issue emission functions with G_GNUC_PRINTF
 * validator: Always use secure string formatting for issue emit function
 * utils: Explicitly set format style when installing catalog metadata
 * Suppress static-analyzer drawing wrong conclusions on GCC 14

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be566cf0fecba34f1f792cbf060143be710970ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../appstream/{appstream_1.0.2.bb => appstream_1.0.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/appstream/{appstream_1.0.2.bb => appstream_1.0.3.bb} (93%)

diff --git a/meta/recipes-support/appstream/appstream_1.0.2.bb b/meta/recipes-support/appstream/appstream_1.0.3.bb
similarity index 93%
rename from meta/recipes-support/appstream/appstream_1.0.2.bb
rename to meta/recipes-support/appstream/appstream_1.0.3.bb
index 7eb12a04c5..625e85a0ae 100644
--- a/meta/recipes-support/appstream/appstream_1.0.2.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.3.bb
@@ -28,7 +28,7 @@ SRC_URI = " \
 	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
 	file://0001-remove-hardcoded-path.patch \
 "
-SRC_URI[sha256sum] = "1a5148ca97dcbf5eb6e9c380278bb0d20938569292ea8652df1b3cac8bd2736b"
+SRC_URI[sha256sum] = "5ab6f6cf644e7875a9508593962e56bb430f4e59ae0bf03be6be7029deb6baa4"
 
 S = "${WORKDIR}/AppStream-${PV}"
 
-- 
2.34.1


