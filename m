Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5EFC0015E
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.348.1688831780823037548
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=PngzVRLH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b9d80e33fbso557235ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831780; x=1691423780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILUq9Z8iMABFgPQpfMaOvJze3gF95BMvINItie0FjnE=;
        b=PngzVRLHtdI51S+e7pajIroHV2icQwy+9HFnhQca3Q8EZdl4h1IoAOvzkElhQiNfUE
         2Vt6VqO9xQs8WuiK5ID5FeM1UvUhd3tovmlyvrjK/Aabiy3TKRzKHrrpOBmCxqM3rHWM
         D+3Yb3JdRPOFmr4ZE6pnBkuR1qZnweNBFz2DMtEOH05zm7ckYoHMnmrf69cgKWLIs2/I
         99u46tTIWg8g21bZpfHRRnxWCrQgzhPKx+e8VMjfTMIXQEkNEQozSV3yX9Vnh82YvDzP
         8f6rXysnxTHui9vvCkvnUJh+lFuf3oi1yz7MIcAv8IAwTFsc78wkv9JzNhfuo9131I/2
         cbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831780; x=1691423780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILUq9Z8iMABFgPQpfMaOvJze3gF95BMvINItie0FjnE=;
        b=L5ILP3DSvvEcPX9m/SiIQHZTryX+u6f7Eg8nBPwzVUVGKCipSkHiZhipa1TiCzhDHR
         sM8FcL/y4sNPFO+K+IgEL750pCvGC71loyQN+sNfr8izZDXEkDnD4wYzOZqZPT6PzxuP
         oD+S39OaOk3+dYZKNkj+WjH0T4B0ha/SSRSn/HY6L62OZ5xiD+oNuP79SOe0hwK+d1/x
         B4t0b6EUN8+dwJdkFHjNjJa2GrWQWV1UAd1T249+83w3ghSYjny/9fKZ1nJXBHt6jRST
         /JYuLfZBpzKIWPg9+M5zrRSvHaiErynuHFCwjBRUiVsCZ01mM4dYPcjbGur1Y9W+K1Jd
         oayg==
X-Gm-Message-State: ABy/qLZWQNe5E+5IA6qIXHNDvZy6KGb+VZwCZcY2S2KXubZAIn732//f
	Fy8dFYRQuhJjLYiLEgyqfhUvgO4+shavyOmRhpo=
X-Google-Smtp-Source: APBJJlF79SCHdvlM9oOdhs4Jw4okfU4z0IY6vTM1gaiPOY4UCFLj2WjSA+mPVnYVV790BfMO0AAkiA==
X-Received: by 2002:a17:902:b117:b0:1b1:b2fa:1903 with SMTP id q23-20020a170902b11700b001b1b2fa1903mr4839907plr.41.1688831779934;
        Sat, 08 Jul 2023 08:56:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/17] kmod: remove unused ptest.patch
Date: Sat,  8 Jul 2023 05:55:45 -1000
Message-Id: <4342d2a60e2ba8a7aeb683b78f1eef94eb2c2edc.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184031

From: Martin Jansa <Martin.Jansa@gmail.com>

* it was removed from SRC_URI in 2015:
  https://git.openembedded.org/openembedded-core/commit/?id=f80d136bdd578468035a88125fa1b84973fd912b

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cfc4586b4bf080a3a4aa419dffc76c5da2a95b74)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kmod/kmod/ptest.patch | 25 -----------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/ptest.patch

diff --git a/meta/recipes-kernel/kmod/kmod/ptest.patch b/meta/recipes-kernel/kmod/kmod/ptest.patch
deleted file mode 100644
index 831dbcb909..0000000000
--- a/meta/recipes-kernel/kmod/kmod/ptest.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Add 'install-ptest' rule.
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Pending
-
-diff -ruN a/Makefile.am b/Makefile.am
---- a/Makefile.am	2013-07-12 17:11:05.278331557 +0200
-+++ b/Makefile.am	2013-07-12 17:14:27.033788016 +0200
-@@ -204,6 +204,16 @@
- 
- distclean-local: $(DISTCLEAN_LOCAL_HOOKS)
- 
-+install-ptest:
-+	@$(MKDIR_P) $(DESTDIR)/testsuite
-+	@for file in $(TESTSUITE); do \
-+		install $$file $(DESTDIR)/testsuite; \
-+	done;
-+	@sed -e 's/^Makefile/_Makefile/' < Makefile > $(DESTDIR)/Makefile
-+	@$(MKDIR_P) $(DESTDIR)/tools
-+	@cp $(noinst_SCRIPTS) $(noinst_PROGRAMS) $(DESTDIR)/tools
-+	@cp -r testsuite/rootfs testsuite/.libs $(DESTDIR)/testsuite
-+
- # ------------------------------------------------------------------------------
- # custom release helpers
- # ------------------------------------------------------------------------------
-- 
2.34.1


