Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265DBC52D7E
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 02:29:04 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.51045.1723084143114930336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 19:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w5p9hISx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so342912a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 19:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723084142; x=1723688942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2O3QLizVwzvQ2e4nP5WxHz9YJR/ZzYeU2ML0cgixdgk=;
        b=w5p9hISxnfxJ3WAwSBA101YHcl3MLOrS4nzDhcPXgt4Z5YuVSkbx50RfB3+hqOEnvm
         m390JJfNTnMFer42ECUSYNPCU2TYJzwRTCsSfH+hbDX9OWy31tDRB83uQUjJXaqxPzBN
         XjAwQfLMyejNzq8bwLuuef0yFw9aeWqubeq96oHp0aiADCWkdk/BTxwHaGfhutfRQ30Q
         hyp25o/DOadpRATrYKgR/RxaZvaFb1xYUHSEkixhqmCaInyPcRarTrylxZgCEDxupjpP
         S/efUVq5ZaOEvpiQhrEBsFGIhh+eAB+7FPWK1lTkMkSgE5k4/lIkLh90pJhzXUGQPDiv
         Vtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084142; x=1723688942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2O3QLizVwzvQ2e4nP5WxHz9YJR/ZzYeU2ML0cgixdgk=;
        b=POIrhugJunqOcEf6LbeGQu0ScYK6udtbzybeZljCjXQyCeXLr9P6JeupbY52Nu5XOQ
         F8Z/MA5pyQs+bTkhZYU04VqvKs9KZTRLoOPcvpNU6L+sghGtmkJdTazqQGxGOwOUdq3C
         tvcc6br4phhVYA/OOjBbFKafoYbhFPWgN9kHNKT/tAwyNWwxRCxSKE7r9x5SoJnIYrgA
         0N9cVt9TutL5P2JFsFY6vJZgjaqAAgaYxljeWsmIwnw6TewmeKa9LheJVru+w6CIV7L1
         FdnzPM/z1cNpSX40ACR84gULyK5Xs32Uwdgo276/H1yLqLkvv5A20R/pHi/U2v9YVTuo
         5aVw==
X-Gm-Message-State: AOJu0YzM3SoKCLic3FTsGCRSi18UeTgXzOHuLJg2DcaCe/cBwGQ1oAt8
	C9WnjhvDl2LxKKPR797TricYoi7a/jr21uMAHvTJ9vwSHFmQHvyvAas6fyMfWnh6mxP/wP2tfbi
	wtPc=
X-Google-Smtp-Source: AGHT+IH/NCwygsF8MGDcELmSqRA0IgY27MtTZpun/tFotQeGfyzGZwGDqRBzzIjL9ROicjt7dISNwQ==
X-Received: by 2002:a05:6a20:840e:b0:1c4:214c:cc0d with SMTP id adf61e73a8af0-1c6fcf996d2mr382864637.36.1723084142315;
        Wed, 07 Aug 2024 19:29:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b0c796sm2269198a91.33.2024.08.07.19.29.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:29:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/10] orc: upgrade 0.4.38 -> 0.4.39
Date: Wed,  7 Aug 2024 19:28:42 -0700
Message-Id: <9be9260985e751f90f9432aa68a789bf0a26fb43.1723083840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723083840.git.steve@sakoman.com>
References: <cover.1723083840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 02:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203106

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bcbaaa9f7d88686915c354fb66682cbe9b1d0536)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/orc/{orc_0.4.38.bb => orc_0.4.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.38.bb => orc_0.4.39.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.38.bb b/meta/recipes-devtools/orc/orc_0.4.39.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.38.bb
rename to meta/recipes-devtools/orc/orc_0.4.39.bb
index 5d2296694a..320abf536a 100644
--- a/meta/recipes-devtools/orc/orc_0.4.38.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.39.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a55a98d4772567aa3faed8fb84d540c3db77eaba16d3e2e10b044fbc9228668d"
+SRC_URI[sha256sum] = "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad085ae51143d3040cc0"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.34.1


