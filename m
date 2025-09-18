Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F91CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:28:11 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.672.1758230890569268537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ra/fJbK7;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-827923a97e9so148675585a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 14:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758230889; x=1758835689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JW8CEvdMtSiLCrDHW3JLqTzY+IfFgQ3X7CZeMpOcd0I=;
        b=Ra/fJbK7hrTL6gbMCTpcL2FwG8Js+pzZxal7e1wcNUmzpOaWQnd0ZkyqBET+1I075C
         ClSf547AoK3IDGjSAn+IVL9shkiUgrPPu8RDF33v/4zsepWetJFuKpdez03hIWA0MJLP
         Cxu3Kdvgi9S7WbFQzERVPblwOJKhmo6rCe8n9dUGwtF/jF0sUQXFP+BldHNM77QwSCev
         Mi6XEGMFK1rmN+JYYm2L8tSdSsjU2DI1AyuLZMaVfjuhsa5V9ijPpEs1HM2Uab4m2Ies
         Gfl2bp8Ekd6wNYQrxOiI+dqECELdmeM1rC+ZBPWh0O3TzzOtCf0QY+6953cdmnX3bqvX
         bKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230889; x=1758835689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW8CEvdMtSiLCrDHW3JLqTzY+IfFgQ3X7CZeMpOcd0I=;
        b=Fy3ykBAawLj4umB3hzixxNevvgunA8EOLjwlTmbaF4PwrUfzSF6rH092u4j0Pz3jUX
         vpbeKTN32hGiNai9uhXjUvUWmSvI8nWHO2LY5NgxeFpxbwVBs15QIhWHY1MyT4Jq9dbT
         UJn0/a4J6L/wjYOUIa07LWW059uNYp4TkhEXi+nk6YYatHckgMmIY6kmOLzTnZNwjwqu
         V9MNdkqfitcDQvIjgFAMO2tsffs2rQo6ACD17CPUi7+abqOXoek5WyqSlDWpLAFQchLh
         8M95cF9SFWrwImCiAeW7krDppvFkcvRWYEIQRyVThzKilyM6y26OJIqfrvNELsb/ph9H
         BNlg==
X-Gm-Message-State: AOJu0Yyjuhts7iVoJ/Z5IGQjDSea+lY382rOQ0pMjLIekMKT3jkZ7JXt
	T7s1wcYOk/P/Qki3lHwXsvBdedEnrtDIF7tpoW7DWbUK/IFNzjaAfZWf1d6N0w==
X-Gm-Gg: ASbGncvfBhDVm+7S6orr0CaHh/oCbL7bpzPCuX8pgZViX4I0ZMZ1Jb4QHHZk12Z2uJa
	5NMf7N09ao+jsst834PxCjMTFJrNvXsibtK6hk8Gy3qqZYAP6FcCkgUIPfquClKq6p5GqB6VzPU
	oLEmwzUyy0UyrPCXwFZy8o+jNzAMxyqcfxaWOhv/1sloBPdhP5DZPgInCCp/xxjGv24/wmbVVpt
	BaqIKzrYHqOeGAuDfO5DZw63nhmWhWCZ/TyEZndHsgcYQdUh89qhvGrxR2ZWYsLLAgYCQgA9wa0
	mltaWYmosbQZLdwXb9rAkCQUo+eRnFFiywa/3C/8Eh9uhZAVb8jk6qt1Sp9PI8/uqkTGcJ4v74P
	9oREsgfCfCBGylzkScuTNZoqUWDG8J7sorNT27bM+bjXH51yKrRZTjw/77gcnpfZ1wHJ/
X-Google-Smtp-Source: AGHT+IHN033QHJLhMhKKDOZ1wHVzp5tBI5/FD8LhETbAhm1oaUXSb3fkcsN+5pD3jg7JqWn0xzRMjQ==
X-Received: by 2002:a05:620a:3988:b0:813:5f77:fb85 with SMTP id af79cd13be357-83ba631db2fmr95706985a.38.1758230888745;
        Thu, 18 Sep 2025 14:28:08 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836263ab544sm235016185a.9.2025.09.18.14.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 14:28:06 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH 6/6] patchtest.README: update selftest section
Date: Thu, 18 Sep 2025 17:27:29 -0400
Message-ID: <20250918212743.3960-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0.193.g4975ec3473b4
In-Reply-To: <20250918212743.3960-1-twoerner@gmail.com>
References: <20250918212743.3960-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223685

Update the "Running Patchtest Selftest to include a cmdline example of
runing the selftest.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/patchtest.README | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/patchtest.README b/scripts/patchtest.README
index 30f7538529ed..fc1267f05387 100644
--- a/scripts/patchtest.README
+++ b/scripts/patchtest.README
@@ -267,6 +267,18 @@ bitbake) in local.conf to reduce runtime, as the bitbake startup process
 will otherwise add to it significantly when restarted for each test
 patch.
 
+If you have setup a Python virtual environment and sourced the
+oe-init-build-env script to run patchtest following the directions
+provided above in the "Installation" section, and you have added the
+meta-selftest layer (from oe-core or poky) to your build, running the
+patchtest selftest is as simple as:
+
+    (patchtest.venv) $ yocto/openembedded-core/meta/lib/patchtest/selftest/selftest
+
+or:
+
+    (patchtest.venv) $ yocto/poky/meta/lib/patchtest/selftest/selftest
+
 ## Contributing
 
 The yocto mailing list (openembedded-core@lists.openembedded.org) is used for questions,
-- 
2.51.0.193.g4975ec3473b4


