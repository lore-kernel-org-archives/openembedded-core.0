Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3910C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 14:15:29 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.23285.1754662526183233053
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 07:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=law4/cxU;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-617d24e7246so2827084a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754662524; x=1755267324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9tAGNyf/6oWB9b6XydeB552hXHhF5mVWElwoG39JZdM=;
        b=law4/cxU7YlvAuXnBQWVgbcQuhwlQfcMEW9eHHl/qV8otxUnkJsv824nteJsVHwwuB
         GZ8GkUFVusiKgui+oRuR50/gkvb3O6vlInuaGQCkvsOkplYUtY4Jrzdd8NuFWT+aRuYS
         CfFcewvpNMGHt6Zx6KTQMwU0culW9tR3qBon5kfU9Hiwx8cOcuYBIz8IWlo+4p/NLEm/
         ZdQPosxW9HltpfISfcpxkPlYW6lo/OWWoWrj5qGujabUDVDDXDMz510x3ofS/sfS0hG+
         tQeopy0QkuRshvuQG6V78tumVVaBPLTtAR1tiQhHS4MR2cOPmoQd3szipwcdZYH3TKHy
         I0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754662524; x=1755267324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tAGNyf/6oWB9b6XydeB552hXHhF5mVWElwoG39JZdM=;
        b=m8LhPaiAZ8dRX1OHj/1F2ZBUG6lxqjEklCcET4hHYOnl228GhopEzlTHGD40u/Gvnd
         ZIl/iV0PoQXYNBU7XGzF0wl0GcYOI2DtWydwOL+SmKccqoMCLdOJrXrQfKjNB7rkoL0+
         BsnQ+R7SLVXC8iS9mPX7dFYC+qVF6ayvMBIh5VJJE8uzmA5N+XnHyK0fPzpINVJYAKPO
         J/DSjaXUm0t81exeL4R2C3iJyeaXY9oZ9lzbuZcRg/NyO42yT2ek29aAs5ZC4F05fJjN
         dRNdZ0jlh1SME011RwFcINyR4/IodjPHEt1sM86bT8lQaohGX7YHj1YKgVtXS1vNgmdS
         p6ow==
X-Gm-Message-State: AOJu0YyB3QnQNTbqGEZ0VsYI9Z+BVyalNupWr70KznuQPi8A7hzHLUur
	LddPLAkYwVMZwHQ0Arfdsb9ST+0kTWrG82w+kxT8XlaSkrtuDsTu5aEccU873Q==
X-Gm-Gg: ASbGncvInRzeH2Fxx5ylHAyW+WogcDmnuf43I/ny1XFXPwt6IZrY33xb6U+Z6KnvMVx
	d4fslGPb9MPMgUXEKEOn9qciIFQgOLD4EeUxDGLTOpgrlOI4jPF3n6+3ZnMR3gf5P29C0fF+9YJ
	qxFvX0/LQacgW6IJr6VNDb3GYoOGonkocxVNxXRtiCGBr7gh+iK9R6JTwmABLVraY8N+7RuPpaZ
	FyoCL3IWfeKQLymb5cz1pV99TtboAV5xlHWrdoUKi6gaDF8LjdHRA1EJbvyNki6CDDl8KOAiOfa
	yXF+NTAZ9+KeDrKQjam9mcriPcqHcLG96se+4nh7eSqFavPtPLh5S0WknnKYCw+RfTyaJPSyxjr
	sPIvP3C694NHK4lHuOG0=
X-Google-Smtp-Source: AGHT+IH3lrL3T8bcFHcCZeEmXBcc4ALAjIjfHnp3id0Iudyb3x0WV1w763kLuXgI2Lnm6Axhj13y+g==
X-Received: by 2002:a05:6402:5214:b0:606:a26c:6f46 with SMTP id 4fb4d7f45d1cf-617e2c4a190mr2466739a12.19.1754662524316;
        Fri, 08 Aug 2025 07:15:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8ff9fd1sm13443773a12.44.2025.08.08.07.15.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 07:15:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ed: upgrade 1.21.1 -> 1.22.1
Date: Fri,  8 Aug 2025 16:15:22 +0200
Message-ID: <20250808141522.1534230-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 14:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221655

Changelog:
1.22.1:
Ed now departs from POSIX and ignores SIGPIPE to prevent commands like
'w !:' or ',!:' from terminating ed. A broken pipe is now detected as any
other write error. (Reported by Sergei Trofimovich).

1.22.0:
An ex(1) style filter has been implemented; the shell escape command
(!) now accepts line addresses to filter the addressed lines through a shell
command. (Suggested by Shawn Wagner, Andrew L. Moore, and John Cowan).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-extended/ed/{ed_1.21.1.bb => ed_1.22.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.21.1.bb => ed_1.22.1.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.21.1.bb b/meta/recipes-extended/ed/ed_1.22.1.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.21.1.bb
rename to meta/recipes-extended/ed/ed_1.22.1.bb
index 03a61c6d5f..bfcff37e69 100644
--- a/meta/recipes-extended/ed/ed_1.21.1.bb
+++ b/meta/recipes-extended/ed/ed_1.22.1.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "d6d0c7192b02b0519c902a93719053e865ade5a784a3b327d93d888457b23c4b"
+SRC_URI[sha256sum] = "1af541116796d6b9e4b66ef9c45ddce0e15a19ed62bfca362ccd7d472cc1c8fb"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 

