Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C05C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:42:20 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.7375.1742420539500885808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BJp+TisJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225d66a4839so20272895ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742420539; x=1743025339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4kVjeeKSSyvxR7wu2fjxuRl2NAbgpxhUwp3JZvlFqY=;
        b=BJp+TisJBdexghcnvoQkH6UyFhQ/uT/3seUwgEP1n3v0TDSSL70uf6mc68f7bscX2r
         SfhmX6P2e/JZnNp+3B7BMPGZGaBrXTz1AP4cltGzSP4+wWeR4EIXTDpbMpUGbINy1Mrh
         HXu518683KgoyqGqtZTuI5hhWqv3HDdn8pe+PMqJKd531uhaYp2p1J9SoUisaUSb95SG
         oeZ2FKcsiPWNwtJHQf6JfiFp0Q00FFQZ1CR/XpwJP32ltRSP6sBtQaINSAuan9qaLx8p
         vmMTAu5o/0tG2JZM8QgHRjZcZMODwDAijDoJpWASR7+NEJz7/Ewpf+PXrFe/8etvM4jg
         vJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742420539; x=1743025339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4kVjeeKSSyvxR7wu2fjxuRl2NAbgpxhUwp3JZvlFqY=;
        b=bV7VXEn1IUj8nsAn6G2k6Ku5G4G3qrCXBlZU0s0pUPuBAaMKCfYFuJyJE5P4zkPXf1
         /lUHWKZArtQV49C0VgkE9HjM7yncz22RnzsukBzSK1ZFmrwPDd2YLXF0GSZaNa/EJcPb
         ZviX5n1BlE7GfMedIuu9sZWojdZqSambXlx848+uEOWo28x1fzbaGnnEVqEGXspBE4w5
         9CYBaNqddskul6HqZmlWeTzUCtUXspvt2Bh/uez/Sy1GkgsOWkzi4A/L9bui2kP7TRAf
         i61/IbWoTKAM2tOrKoHm7E8anx6aJaljGiXAN1PxdjNG2zJjvuKElmBmWomkP5Luu/bR
         rSPQ==
X-Gm-Message-State: AOJu0YxLxrVa/B5Xsr7fVUMk+STUnDE27ghe5ctn/8gRSj7jgGGMJYtt
	ofOCkVfnH608gF6mEviKyjBI6scC3gE+vDWwrtW2sUwIqb39QIUcK38JBns+
X-Gm-Gg: ASbGncs5ZprZ5MunddBmbAdbALtzpPDBeK/GvyTvl0eshHwH3KvHiEBU4qKPsNsGuL8
	CpmxeKIiI+WKHSKbgMzwi0WMe5C6HhNjb7mE7AT36bmTKUZQgroWhmiHOVM7pSmJYOzd95ba8cC
	F8BLx061bkEAHBaq7EJhdj1wUXooGin3XW141pLMq0+0i5r94lXriERloNpt8AMvdQAo8KnrQGM
	iCi/Y1mnlkbR4p49leKqhgXSPcjIixuYxgkptGbiRHdgjuoAFkYus6I4cE/fStjI0k8uiKpI60w
	C5n5nReIiNpGp9GugyptI3L8j18qlgmFVrtx
X-Google-Smtp-Source: AGHT+IHi3dhPPKLxD3UpLmah4MwI/Z3pwhzCa6nP7EpffFojYCJ02AVxsxMjmmho57XRyl9pzMZFpw==
X-Received: by 2002:a05:6a00:2e22:b0:725:41c4:dbc7 with SMTP id d2e1a72fcca58-7377a0d68fcmr1548305b3a.4.1742420538606;
        Wed, 19 Mar 2025 14:42:18 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73766322e03sm3604964b3a.99.2025.03.19.14.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:42:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 2/9] dbus-glib: Fix build with GCC 15
Date: Wed, 19 Mar 2025 14:42:05 -0700
Message-ID: <20250319214213.2505249-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319214213.2505249-1-raj.khem@gmail.com>
References: <20250319214213.2505249-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 21:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213357

GCC 15 defaults to C23, it can not handle it
latest release is from 2021, and this seems to be
deprecated upstream and no longer actively
developed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/dbus/dbus-glib_0.114.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.114.bb b/meta/recipes-core/dbus/dbus-glib_0.114.bb
index ff7c2d6613a..8795bce5117 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.114.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.114.bb
@@ -30,6 +30,8 @@ PACKAGECONFIG[tests] = "--enable-tests,,,"
 
 EXTRA_OECONF:class-target = "--with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 
+CFLAGS += "-std=gnu17"
+
 PACKAGES += "${PN}-tests"
 
 FILES:${PN} = "${libdir}/lib*${SOLIBS}"

