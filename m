Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D81C48BF0
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.18122.1708013907120792680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PacoFWk5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d95d67ff45so8108725ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013901; x=1708618701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVDGHwyPoszr/LrOM2j8jBmWFTMG6lsaS32jrKGdHSQ=;
        b=PacoFWk5jKGj+nSs18AYIjRdlId7muUh/7sP91zGNnFRlmC3PClznOLcOqe7T+Vp8A
         9nWr0KGeX1NKjYcXYXbxWxTjg4pcnDlijs1C/mYzkaXdF14Mzra9QBVUT/QuqQFdPJUv
         I0TLOl/6G6l1QgnLPGg8hdTF26pO7XzXZjpgvvDjaFX1zfFZbakl137Zg7zhrsNbXtaS
         u4U+CiZKDmKV8AZGbKi49TLaEWKIaa+fbyFoyLXtxrNBOmNu0z3XeIaLg8IzKwlFWMV5
         rYLDGvMPVRDRk40bIMU9AzZdG1oj7tRo/2dh3n0EMc7YEJkCpxncYpnbEWhpRLW/ecdj
         mQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013901; x=1708618701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVDGHwyPoszr/LrOM2j8jBmWFTMG6lsaS32jrKGdHSQ=;
        b=DBjmEt6NCspqmzf/z98hn3Tvl8djZYnn2PW6g+TLVRKdIbGMd3O/Gn2Y7YI6jfbZwP
         nfavORFQVHyQwqPRNqY1T98yo/JwQzoFu4imO0wp+qpTai0a9SCF5zbKqSg0/SBZyznT
         y4Us7Ib6JhIrkuW/+UrHiGGZ2RycKq4QKDDosd4Pvv0M9BmWRDiGMPx+/hvnVGs5kLwN
         y4R5zMBPRf6hQhnFig5IvFFDPaWnn+vWXlrahuEswM9geOlPSV/8RryyFmLFVD5pF1rm
         E4IA7u2JsQGsNitsghby5PsDn7JT7vPDrzBD3EovfjxZ3GdgPstcV1iq0CMxwrNLshvR
         oIGg==
X-Gm-Message-State: AOJu0Yx0oT1XN1r8VQQQXvMgzcBuORtQi8Nbc4pDAuKH4dMgoGqojTgK
	qxNG06q225yIQ2WkZPcTzR04o3RJGpNjiNG5nrqVpSXQAgOy3fU5sPmwY9mgtsFbRjN9GZGS5xe
	OzWI=
X-Google-Smtp-Source: AGHT+IHwghaT/qwBJs/ulbLruw+O+OOkTOJ2Yx9p4wQG0osgkAboKiUwfDK7NfT83mTOnRx8KwQcvQ==
X-Received: by 2002:a17:903:449:b0:1db:8fd9:ba0d with SMTP id iw9-20020a170903044900b001db8fd9ba0dmr1532415plb.23.1708013901600;
        Thu, 15 Feb 2024 08:18:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 05/21] gcc: Update status of CVE-2023-4039
Date: Thu, 15 Feb 2024 06:17:48 -1000
Message-Id: <cc78945cf8372eea743ecddfca47cbc084641678.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195527

From: Simone Weiß <simone.p.weiss@posteo.com>

This is fixed via a patch added in gcc-13.2.inc already, but still
reported e.g. for libgcc as it is not defining an own source but use the
shared gcc-source.

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 301d45eacfd4ae6bddfb13207e2af9e8b4662bc8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-13.2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtools/gcc/gcc-13.2.inc
index 359db1e278..32fddd11c2 100644
--- a/meta/recipes-devtools/gcc/gcc-13.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
@@ -115,3 +115,4 @@ EXTRA_OECONF_PATHS = "\
 "
 
 CVE_STATUS[CVE-2021-37322] = "cpe-incorrect: Is a binutils 2.26 issue, not gcc"
+CVE_STATUS[CVE-2023-4039] = "fixed-version: Fixed via CVE-2023-4039.patch included here. Set the status explictly to deal with all recipes that share the gcc-source"
-- 
2.34.1


