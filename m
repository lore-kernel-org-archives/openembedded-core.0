Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE90CCCFA18
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:46:01 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7980.1762461945867119650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bJyaAfiy;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b553412a19bso30346a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 12:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762461945; x=1763066745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ue5bjN6uk70Xnn9SVaXNuwIygLAufn5DxZ7aG2sCEZQ=;
        b=bJyaAfiylZfisphwVvcHtQrDd0NZ7pUwTch19w0iwIQ/V7GH1e1JgEQU8nle+dGTro
         YJKQdSvLn6KcEz0mmB5is9OSKyXapORLLppKhMHuabiBMkCRzMCtsI7Ap0UdijzxdiV+
         2jvrLa4a8ynVxCN8IxQmURLiKjvnTiHywCyBaJOTSHyJCCdj/tQO357bZb3M/gydNmc7
         RuE5obt+qx/aRGCj8UakDEMshFlnjg0NsHYhkUh1OaHRE5oZB1212EO+W47zuB0rEBt/
         lK8h5EZZ04mvjZI+JXUCWh51Mwuv5+jy1ra/TGXySZ3Vun4O7Kyg0qWYwFfpUDVyYqeb
         P0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762461945; x=1763066745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ue5bjN6uk70Xnn9SVaXNuwIygLAufn5DxZ7aG2sCEZQ=;
        b=UKhJro06hgb+v9dNW1I5DHyg4F/qVKwu95n3GXjgcWukq/MaCmTDJ+tJ7tbJDXgbmQ
         1aY8R6RmYVdAYAkqqFVI1chc/0GJu8ygFzlreRtLJEF73SmqpmFTObcXh+C07jYNE0bg
         nweIeitGyihYgPHeJA4Reqwuxs63Rwn9+ySng4nQ+0bgNEltvhymcw6M2bSUOXaCOgss
         McBtgG3lN4VIRYegxlVLOLc/Ip6PpWe+FfqZs1gMrm2jBI0rNoBYvesAqJhFQxWTGsru
         0P8FdS8EWO5FYPa8aFxdDChnIfOdsfD1qld0Tj7LhQZQl3+hnnL/H+gaC4IaNfaQCXEX
         l3Rw==
X-Gm-Message-State: AOJu0YzkvRkfSWM5kybUQdklmDbQR8mXtRDOsaavLpVjRu5yVo50O3z7
	+7ld/6rGL1LAIARb0UMwqt63x0Mz35LGzjdD5ogMPvC9UuGFmqb0vmm2w2AYkw==
X-Gm-Gg: ASbGncvOhetl2iUhzPPFDiUtF2HyxnKLf8r/1XCtC9/NnySJtMPLH2qIq3xUinUi2+i
	4vy202Xfz6XEgKyd3j7B6rMUgd+pcNIZYDdrT9X7G8YjBES8YO0DmQqeYCc4jnZy2/eXGCLnuum
	8ihtplq1J1uQcPOgKQ7e89GBX8MSeCnfNdP6nybYveUOy9jOGl/lHFaWBr0g5EYWbzziIwLoAJr
	TTYKFMul5bfliS9WhEfSrvAJ0Vno+xQuBpEmWa7DNmB7jPHa349QdmrXEufOwSkujemmsokygUK
	gNWNfvBim+oInAq7I3wFqlNxx2lZQXOtgUZ26HQL+h692c1TtWg2TlxWC1ZFIMEgWBpNFEUUBqE
	N9F8azg1REEw7QHZp8hpbMSFkAJuQYmXcAOJx7jsYEFq8wF11B4ijfNDO10hSkHw4WIIyfImNFH
	V7VMHR2QQDE6c94A==
X-Google-Smtp-Source: AGHT+IFDzonJGJtMsTNptMBkoxOeVSWsYE4rakF+cqfvDueSsxN7WEDunVlSzS+8fVk+w7l7eOHFlQ==
X-Received: by 2002:a17:903:32ce:b0:295:3a79:e7e5 with SMTP id d9443c01a7336-297c046d856mr8637905ad.34.1762461944965;
        Thu, 06 Nov 2025 12:45:44 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cb47dbsm37527085ad.96.2025.11.06.12.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 12:45:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/4] nghttp2: upgrade 1.66.0 -> 1.68.0
Date: Fri,  7 Nov 2025 09:45:33 +1300
Message-ID: <20251106204536.2079412-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225996

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
https://github.com/nghttp2/nghttp2/releases/tag/v1.67.1
https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nghttp2/{nghttp2_1.66.0.bb => nghttp2_1.68.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.66.0.bb => nghttp2_1.68.0.bb} (84%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.68.0.bb
similarity index 84%
rename from meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.68.0.bb
index 49d6d7e632..952064d268 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.68.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "00ba1bdf0ba2c74b2a4fe6c8b1069dc9d82f82608af24442d430df97c6f9e631"
+SRC_URI[sha256sum] = "5511d3128850e01b5b26ec92bf39df15381c767a63441438b25ad6235def902c"
 
 inherit cmake manpages python3native github-releases
 

