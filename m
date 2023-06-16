Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088FDEB64DD
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.271.1686926265876478872
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Dd0ynxC3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b52864b701so6169625ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926265; x=1689518265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILUq9Z8iMABFgPQpfMaOvJze3gF95BMvINItie0FjnE=;
        b=Dd0ynxC3XROzURsfRfPhx7M/hoQ51nM6CWMUVdNkXfl20V1Rrs4hN4J1BGauXqyMXN
         t9zPLWETqdbJunhTbYauFeXoln2/B3IfhyCwJmv70cSrGMNwUIGK9os32tQGL7vnY6EW
         4v4cyTI6PVHuyoH+xj/UtdqKXf3pIEOrmaJsqGE72RdKSGMzfgkPIgrruXVbM4iWHiE2
         R9jEmgUuQc+Th65V7CEq/7l9hV7XdAFlL77JMP0cOUaf5rf+AEIUe63nKlbQRJwePt1e
         PR3+Jd+w0azc1FUZ1yei+68b0vxO7mnVyPOw318Gx+30G0NbgLiLi/T/4547ohU0uGJY
         ICeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926265; x=1689518265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILUq9Z8iMABFgPQpfMaOvJze3gF95BMvINItie0FjnE=;
        b=LZIuycE2C+6Zo0Jnt62lJsK6hV7ZDnEGmHRv82rbGxvMqvNwJeYgmIxFDFOz7bxzyR
         NTRAUU3oW7gYh0bjL1ykiYn096ZO+Guq8B7erUKz6khkO3xMOqE506ieLqWWLDLLoBbg
         tvIbhYBcCuBwFT+4k+9xmOVn6hM17Apb/cKSlIXaJbSFy4fM0b5/wZddvZoZz8XCjQgV
         lHEkF9ZeMmi5XeWRL0qpaMPohR3CaVS8v4Hok+q686S4/vJxapt8St6j259/biSfFR74
         DwYu7yBvaT6ZIlBAI58PsFiCNz7XZclQCQ2QBQhaJmj62qx92TAeRQ9lxPf/sNzkXxmq
         WzJQ==
X-Gm-Message-State: AC+VfDyVCLCZCGerleW4CnZa4JEa1KdsRCFx6GF8Elu/G2iB1HLfgr1v
	vPUdvuP/3Z5YZBno05VFaRoEQUCSbu5mKLsCBaM=
X-Google-Smtp-Source: ACHHUZ6sbh2tbpIUO0kKd4HSKX4SZ5xaTtr7t75El3CXFRMapXaIrbFtpJ6Czw1ESMHCePJvqEAsAA==
X-Received: by 2002:a17:902:ea0b:b0:1b5:2ca9:f717 with SMTP id s11-20020a170902ea0b00b001b52ca9f717mr2301603plg.39.1686926264917;
        Fri, 16 Jun 2023 07:37:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/24] kmod: remove unused ptest.patch
Date: Fri, 16 Jun 2023 04:37:05 -1000
Message-Id: <c977c338f1f45876fd19480abb67379dcf112a1e.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183035

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


