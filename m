Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87256C48BC4
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 21:43:47 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.26107.1707860621099112087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 13:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iGo4fqtG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-290fb65531eso1017901a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 13:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707860620; x=1708465420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rRBCSnS1/MmIFDcQt8qtb8ChbMyanMYrOpA40P8BrM=;
        b=iGo4fqtGYe2t0+yEOc6VOEmlCGKk9fuOrPalPqVukToTNNW2tMsp5Xq8Lbys6Q64Gn
         z1PsgItMXGvmJN14eEILbb9dwIxLAUTJAq6t+e2djH43g+k4luskDC+OMe63WNMYJEZk
         84w5+NbXRzBjPMAviVdwuNzKzeaboFT0bmovE3+ODhzNBdN4Fg0gCxSqyBHHHPUgDf7O
         PaYk9CCOCrCfuz9f2J1N6iHapX2RdE0flBWB4R06CD/p2GlgN0w7GJ2YJ7WEVwJlcg4p
         LeI3cKiE1Y+naRzpD6JKmJ6USzy2w13hg8uZKfNE3sKR8pbMUuxufP6gN8K/RgngRqzX
         kksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860620; x=1708465420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rRBCSnS1/MmIFDcQt8qtb8ChbMyanMYrOpA40P8BrM=;
        b=CObuwtu+Nlj+Ow+ggMaVtnwUPZfnSvAlVt9X1BbM+H1gI6TG4/e6a12j6Q2gVnwiY3
         AXCqIJskvRJlI032u5jrxZCpwkgR92NyGoqtaPPGv2SBLNU5XWHCgNnTa3qGeHzp7mCW
         RzoSv4eCKFz4LQ+Ci2NrpP4zfqE1Kuo/3f3fX0X4UEITPOviiuxW1Yag8TqT3gpMbzIj
         fPOGNJxnsY8GcFHNaZnRxS/q5kIb9Ot3lELWtKTJ/5Tde957bjHWQWxgVZcEwOijFGcf
         fdxgfWPwNCaSItYRRXDKsXoyYWDBkxscN0UOmDZYcmVlKD1JqR47nlfnmg4EEfM5XTaS
         yVaw==
X-Gm-Message-State: AOJu0Yy+fIHmO8WnZUm2uDNrUyd1EGT27x14LDrwcnbkMOjEF6b3pqIG
	cyir09dvGyMoQR7CGmzrpvuRxTAggOl7eCcoHUIdvnLtFtHfgAl4vlVKiClW6sPVoIh8j6U+Jfm
	l
X-Google-Smtp-Source: AGHT+IFzl8eglwopH1f/3x4ucJDCK5Tuz7PFBc1hhZxygWZMo3nbjM1nUr3WmTnO8g7TfWNUvhOORQ==
X-Received: by 2002:a05:6a20:9d90:b0:1a0:5c37:9201 with SMTP id mu16-20020a056a209d9000b001a05c379201mr1000464pzb.52.1707860620373;
        Tue, 13 Feb 2024 13:43:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id x37-20020a056a0018a500b006e04efcfbc2sm7767327pfh.74.2024.02.13.13.43.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:43:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] perl: Whitelist CVE-2023-47039
Date: Tue, 13 Feb 2024 11:43:22 -1000
Message-Id: <970a0a64ce147970c7743411584c9bd1dc1ce414.1707860435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707860435.git.steve@sakoman.com>
References: <cover.1707860435.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 21:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195431

From: virendra thakur <thakur.virendra1810@gmail.com>

This CVE is related to Windows.

Link: https://nvd.nist.gov/vuln/detail/CVE-2023-47039

Signed-off-by: virendra thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 4b5a4a5619..bf81a023b8 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -46,6 +46,10 @@ SRC_URI[perl-cross.sha256sum] = "edce0b0c2f725e2db3f203d6d8e9f3f7161256f5d159055
 
 S = "${WORKDIR}/perl-${PV}"
 
+# This is windows only issue.
+# https://ubuntu.com/security/CVE-2023-47039
+CVE_CHECK_WHITELIST += "CVE-2023-47039"
+
 inherit upstream-version-is-even update-alternatives
 
 DEPENDS += "zlib virtual/crypt"
-- 
2.34.1


