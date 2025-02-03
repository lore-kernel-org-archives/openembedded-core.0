Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E91C02198
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.92299.1738600907986580590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZJLQw/zx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361c705434so34468935e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600906; x=1739205706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dg97IOkr+23x1eQaqOdeWemsS7bfT+ME5H9cHXv/hho=;
        b=ZJLQw/zxxe0An5Eovs2rJ7HFKvJOidLAuJ8HC06/tPXNh2QTxjPAZ/gXBeAcsoKIit
         OBmwQ+J3dg5SozL905HMgAkc5MwaxbMvw1TeCl4W3hN1/a3KombZZaRBCRyq9Et8VbE7
         GJi2pjM08TxvC5GdKoKxITksrV/VTh+ENk460=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600906; x=1739205706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dg97IOkr+23x1eQaqOdeWemsS7bfT+ME5H9cHXv/hho=;
        b=AhrWocGtO7UtKcugeERc4LnKWc3Ky2LIFmwWrkK1Pi7gBHNQfV9b6zXxtejaDMXO8I
         jOmlFzaKyiDQNEvbsWhTBDNF+yNp4rPqD8skEbG9JFmdrIBWTlPkTAYDnEoKCwBt0sLh
         tzH9L3OQnOMdC7ddfxMQL53MPaFSHWShifc3e+eaE4itw5k20vuegqcMJoXCOFtaFVdq
         lv8cvQ5bl7KsxKvvy4H4P/nusgUqdeT4aBq6ON5iLF2ZACYJpNM/htEylyD54c/f81al
         85QfEeoNroGoPPstHw+EnYWwsHDXmOWsFYCMotB1hr70fxOvRl6SjpGMGss87thS2drR
         pDvg==
X-Gm-Message-State: AOJu0YyNpzoNYYNLpKT2Y0F5bbLyfAn2ym62LP6yo0zDRcj6Vy1OeIF1
	ahuNSW4Nc6ArhYZQTP0gj+CPnu4NMo3CKItoC4xRkrqagCdkMlnLWzg1++DsWwsLJMKg3+Fv671
	Z
X-Gm-Gg: ASbGnctfR5mkRMlxc7Xp8hCSiW4/EJKS854tDaL8UPFx8GjOR7ZfD1j+tXY/pHujBKZ
	ovY6fC5o/VHJs72i0yg1UvgfyJ/YmfwEs01O+XfpR+IQ9y8qmtGvPiIfzPQOxH2z7RrO+lFCsvs
	kia1jc8EmVM1sMgXYp3VLdqDvm+XAXvBDWj26wNNW+jBipZBCTPBIeO5WCB/H9rqnphVwwLNoJ1
	pWFDyi5mQND5rAr8GDuHSk7IbCZVQSZZyPP+oyEJD0tRt5y5/RA294NqwcILcSfBGMKhmIfXYhI
	C2Z4aAP1ujjS4q/0xnshRKoz7YLP9jrj9mc1DKSyulD2
X-Google-Smtp-Source: AGHT+IHlNRF1WeB4Pc6MMcgXkZ5XFRq0RlJSPDWBb4uEIx+NypeY7E2cxPeIcLeABR8oqCsYa2Orxw==
X-Received: by 2002:a5d:5987:0:b0:38a:5122:5a07 with SMTP id ffacd0b85a97d-38c5194a22emr18899127f8f.15.1738600906069;
        Mon, 03 Feb 2025 08:41:46 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/46] libexif: upgrade 0.6.24 -> 0.6.25
Date: Mon,  3 Feb 2025 16:40:59 +0000
Message-ID: <20250203164130.3403325-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210688

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Add-serial-tests-config-needed-by-ptest.patch      | 6 +++---
 .../libexif/{libexif_0.6.24.bb => libexif_0.6.25.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libexif/{libexif_0.6.24.bb => libexif_0.6.25.bb} (94%)

diff --git a/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch b/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
index 505aa073309..26ab7f657f9 100644
--- a/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
+++ b/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
@@ -1,4 +1,4 @@
-From 1ee7217c8ae724d793f9a9876c3608057a2ccbf8 Mon Sep 17 00:00:00 2001
+From ea0110e5def8eaf2567193323601f06ff892ce15 Mon Sep 17 00:00:00 2001
 From: Julien Stephan <jstephan@baylibre.com>
 Date: Tue, 11 Jul 2023 16:07:54 +0200
 Subject: [PATCH] Add serial-tests config needed by ptest
@@ -13,10 +13,10 @@ Signed-off-by: Julien Stephan <jstephan@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/configure.ac b/configure.ac
-index cd48047..5413907 100644
+index 9e483c9..561b61c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -16,6 +16,7 @@ AM_INIT_AUTOMAKE([
+@@ -21,6 +21,7 @@ AM_INIT_AUTOMAKE([
    dist-zip
    check-news
    subdir-objects
diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipes-support/libexif/libexif_0.6.25.bb
similarity index 94%
rename from meta/recipes-support/libexif/libexif_0.6.24.bb
rename to meta/recipes-support/libexif/libexif_0.6.25.bb
index b407ee52de0..59c22753d04 100644
--- a/meta/recipes-support/libexif/libexif_0.6.24.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.25.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae"
+SRC_URI[sha256sum] = "7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528bc989d3b3e7a26307"
 
 inherit autotools gettext github-releases ptest
 

