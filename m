Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957FECEE333
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 16:17:12 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.21079.1728490625942402119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 09:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1xiFrl/L;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b86298710so60750975ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728490625; x=1729095425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56DjX3eDXWvO6+ZsCO+Lhq1mAyJpc0jS2Dk7KgnHBGY=;
        b=1xiFrl/LB3Fy06BDs9RaadIvXNIE6Q0WDJ+R/0ms9XciX41eIa5jQF8JIVGl8QjLZI
         dYUofJPmE1wxFIbxLUm4A3yXXzemZA6Yu7+sTXTV1hHvk+EfFgBJOhcZmhVomWix/1Gd
         O6eNX05xp/sMUfGk14aNsSeo2CHZeh5CyRRyswzSD6D6GYvMIhYILaBpb5os6y8ZQHJu
         lv7BZPVvFbADaVZpY5Fwl1VUisVUCHf48HipP0DHx1Bu79TA2jQ+TmA4sWHh6HdqjfIr
         vOmWnamDp264iz1DXG47TDPj7sp3ZvQ8qENtcXe+iAcz00IWe/a5xlqNaS1lEYYxFB5U
         iaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490625; x=1729095425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56DjX3eDXWvO6+ZsCO+Lhq1mAyJpc0jS2Dk7KgnHBGY=;
        b=HE5A5PlDxMduJgyAiDj6NJnLQ99eSAoHikIpEWViype/aoIxE2nDP87dYaYFMUhrk/
         58VMLcvlKQswMr/vY7iwrGO5lZewDX4KtDZqCgOXPPgPhWffX7MGFAnIrI5swGPFZOms
         k+fdpFbshB1gyRKHrO7LdXXOSlYVqSTNPfuwEDjnHIdw7sumfFof7QY2ZX/gPCr4g5vL
         MMangCfoG27UCHJdjOd1AjSAlJ0TjFmvhwL3FVoFYg8Wau9lgjLyc5xgplprOZ3i37ct
         Dx42AYL7AxClD6dfTBzHVRO9WKH/h/ni/b/M8ghfEXXF8HbN8cnhLHhowt90vZyZ8fI+
         DajQ==
X-Gm-Message-State: AOJu0YypyVW0QofAYCviBAZI8pJ3MZvBCKn4KoXp1VdAp/eoaQrzViS7
	noLHeIFrMss1ZK/G7BA+cv699sCrp4bgfS88i+s3cUeLklzIfV2gBFvf50ZZ62gajjlHzcITM+j
	l
X-Google-Smtp-Source: AGHT+IGvrzTexvUzg4TX9PeIizw+eZFV09bL/9jPKX7DGeE0vKSzmyWDC+TEezR/F3rW7Ptem0qz7g==
X-Received: by 2002:a17:902:ce12:b0:20b:a728:d130 with SMTP id d9443c01a7336-20c637112d1mr49071535ad.14.1728490625068;
        Wed, 09 Oct 2024 09:17:05 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13934817sm72545045ad.158.2024.10.09.09.17.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 09:17:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/5] rust: ignore CVE-2024-43402
Date: Wed,  9 Oct 2024 09:16:52 -0700
Message-Id: <62bb1b8f89c97fa32a7b15021e9e3fbbb878ae68.1728490465.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728490465.git.steve@sakoman.com>
References: <cover.1728490465.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 16:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205362

From: Peter Marko <peter.marko@siemens.com>

This CVE iwas created because fix for CVE-2024-24576 was incomplete.
Ignore the new CVE in the same way as the old one.

See https://nvd.nist.gov/vuln/detail/CVE-2024-43402

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index c377a680a7..fc22b9990c 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -6,5 +6,5 @@ RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
-#CVE-2024-24576 is specific to Microsoft Windows
-CVE_CHECK_IGNORE += "CVE-2024-24576"
+# These CVEs are specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2024-24576 CVE-2024-43402"
-- 
2.34.1


