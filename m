Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED765C3DA42
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:38 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.15284.1720960769977228878
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jU0gDh5X;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-75c3acf90f0so2268086a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960769; x=1721565569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azKfxYsxYrje1xiCVa75Qap7x+Jhldx5CUrNgWbCAK8=;
        b=jU0gDh5XTDtfcCQABDgQ8a2rpHrUL/uPoIXddFvAfUhRII7mjw3Uw4sunO7QKSmGBI
         UbWOo5Vxrk/Q5s/FgogP2JCsoHzx3MAQekpVO4aIXiiRAfWh6TkcsfNY3Tu9vIwrPr2B
         /5s0t3i+a8gTyjk7TjTvuBrIMZwwygUJye9pPWiZdxTqtiKbsfsC9+exiAgIE5PV9kQK
         bZqGQhS2vQeYm2LeqqbMtSREisIz+4duTIYa6lLewVF+3MJbXsx8878lEVse948Dol7k
         dplX6pucfu0axdCPo0vrH+Ac0HR5wDlW9Hd98qyCyUsKJBbrbeVQbMko7dqRTnDDtzuY
         52fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960769; x=1721565569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azKfxYsxYrje1xiCVa75Qap7x+Jhldx5CUrNgWbCAK8=;
        b=M+Mb4Q5GlHGu/LErbi21EWyARQcc24hOcVQBA6umlCW/ix0q2QvFtBW7R/FnQl82nn
         BsygQqfmtDoGFqe9HnhLpnDzOa2q6WG04GZwFYkuOYhg0Xi4DkMVuU6jN4EA5TEzH9p8
         jIJmEOZBjx5YGDfGG2PdC0ryxi2+D+jyB1M8JZhBDpMzMLAJYKH2Poa9pIq7yRE/6kRF
         vK3D9hRF6MC74HOwfRVkpgyD4RVzL0tgRD0Nd/v00NRu0AR8khhBFEy1XIZUHhT0GJ0N
         GnjAxPya9VkptnoLxVl0tu59HG4fcGpP65T9nlpugA/0xAYCSw15S3hgPU+9Q4ZDLsie
         gKqQ==
X-Gm-Message-State: AOJu0YzvKLpjoS5dhgNsjtXoP3qnhmA9t/jqR1IXnNf0KBN0RRh2VhQ4
	ZQMKbdtcoZuMNdu+Hs0zS2CYZzT9ef/JD4M0XUkPNkPygT6X7pEVn+s06B7LM2Agm2FMc6nfg/M
	lNWU=
X-Google-Smtp-Source: AGHT+IGhaIJmhZlGDbug1UgJSW45lCy83oTG7AIU69gP59YPe2BIP6lfRjXyZ6hC11n4pMYBCJfdbg==
X-Received: by 2002:a17:902:ccc7:b0:1fb:de19:ff0c with SMTP id d9443c01a7336-1fbde1a03e2mr76328335ad.18.1720960769229;
        Sun, 14 Jul 2024 05:39:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/27] populate_sdk_ext.bbclass: Fix undefined variable error
Date: Sun, 14 Jul 2024 05:38:41 -0700
Message-Id: <5726348e04381d5c656a530c318775702136ec8c.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201871

From: Jookia <contact@jookia.org>

The variable uninative_checksum is returned without being set, causing a
build error. Set it to None by default instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69ead1f2d403e6a0e5365ce4e89288f846d3ef33)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index f5687e5899..09d5e2aeb6 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -276,6 +276,8 @@ def write_bblayers_conf(d, baseoutpath, sdkbblayers):
 def copy_uninative(d, baseoutpath):
     import shutil
 
+    uninative_checksum = None
+
     # Copy uninative tarball
     # For now this is where uninative.bbclass expects the tarball
     if bb.data.inherits_class('uninative', d):
-- 
2.34.1


