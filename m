Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE06EB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:37 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.17383.1687961614704152238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Yu9r/VZt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b7ffab7ff1so23981235ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961614; x=1690553614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILUq9Z8iMABFgPQpfMaOvJze3gF95BMvINItie0FjnE=;
        b=Yu9r/VZt79AUXu0YZvczEwgoFJGv2jj+OJkpX9KSs3tpX3VQC9NVHdwwDnPVpjRWxo
         sfdo8lgfiI7/g+568QXO7WzOG4RFa0aZm1biV0odtHuoJyWYcfPyY80mnORRGX3J3HZi
         ontpvlY6LWlcIDoNeTnveafrWZype25vcOX36DQqEJbhijB3NjIAlXM/QdbsPw/qL9D8
         HSCP2QNBQ3ogghA+xmQb/Fi6ny5TTTJbbrPP9ZXWBItM38MX1wNINJtaJyUfvDVKz4wV
         335p9rMDeK4OU3aoy8+oXlu5aZg9vf+yS1v1sNQuldP0aY1GdFlLkepH0KW2E841EKAX
         Sg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961614; x=1690553614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILUq9Z8iMABFgPQpfMaOvJze3gF95BMvINItie0FjnE=;
        b=gUh1wX/Y/uBmrh9AjjJfbS1PMxjD/TV5xqHmtXrrFt0ylaQ/BrlLp4vPU1SYy6px84
         5+dOdQJ4yOucKXPMDrJISljoPHdw+SCBaUk0AWDSnXNkOsYx3Ut01uUMzEPCa4ObMFE4
         52evYIO4O2I+dsFKUc1Y+3O/I9eraijeEDBS21uUIjKCvAPv5U79OR/Ergn3G9Dw5X91
         Z2hpyrZx+bZgt6EDWdD5zkzSxXj5q0+fbV54BMgm4CPVNfDyzWewW0cfpdX3XTDgy0Gg
         zyeojqVCP1hn43XkyNQa2Ae/CUKj9nU58fkMLUNM/t8jENLRk+C02LMa8dMYFHMyD89P
         1g9A==
X-Gm-Message-State: AC+VfDzSioz0o6BEAji4Nz5P7ws64ZvCv7cD80xpgXvNwyMYOQen5YiS
	glamKp5Iiqix2k40rAVf9aFfrNQTqzSHQ+0gF1+YoQ==
X-Google-Smtp-Source: ACHHUZ4PUOPrI1UoU6Aao7dPKqbVxpK0FEq0MIVFP6o0n34MVCUjSwlTlzHMlbn7GlsAxvuMeZpirw==
X-Received: by 2002:a17:902:ab17:b0:1b0:e0a:b7ab with SMTP id ik23-20020a170902ab1700b001b00e0ab7abmr8276853plb.31.1687961613675;
        Wed, 28 Jun 2023 07:13:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/29] kmod: remove unused ptest.patch
Date: Wed, 28 Jun 2023 04:12:44 -1000
Message-Id: <960b61a53b6a670b4b3a23faff85850a3485f00e.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183574

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


