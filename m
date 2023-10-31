Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF486C4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:05:44 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.8517.1698789936842204693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q4d5DmTs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6b1ef786b7fso6179795b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698789935; x=1699394735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKJ3WKgftyaOhIo3+up5mIzXZnH5SmfMPGh373VqImU=;
        b=q4d5DmTs8kqS4FZz42SH2fqkiC/YnaReDmEFwMHfbEUUV/N/ya6PqKRJeGnlTjxhVU
         gZrgBQ5Qg6G6yBzV5lE7zXLCEPkTAEVXDL6uqsp3XcF7WbuMJVvRHIeBrHxRWcRRnqSE
         VmJcsa6rxzWk5LwizDwLpKvyEcZ7j+zsTPn0n2fpbsRTEgZA8FBy5zGqfwlZoWf6ywRk
         /6GRRSOhNW6ttYPodS4b9FFPq3boGdo6gt/2RPBLePKGG4+yq0h5xF/yclLZWmu4PFsH
         W3gqQF5+DdFiIRysFqGD8mRZWbDlcohx7Cm6zO/znzRjXVSOuZ4pT4zD/X7fvOPzvZP4
         erzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698789935; x=1699394735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKJ3WKgftyaOhIo3+up5mIzXZnH5SmfMPGh373VqImU=;
        b=ObL9NR2kgCxo2drVMDUTQz1eJ1DORUuFZ3cqaKCpE3MmEW7sW4bbM0aSsfaH/+zw13
         l3YEafu1c0S4krNkVHdWFcFppuJydmCXlL12Psi26toboGHllUijBNxrxmXeUTaO9icc
         y1Zy5aC3NwwZFhs026e6Elv29yzvSO1bx6GtArlnVCAIQUMWc6KAYQOZA/L3VTfz3VPn
         LnNy5z3jM1sHuvvsIKqn0IwcjJ76akxzwpsuCWA5V7kcw4Z1ava+P5eETinF6qpulMe+
         R9Kq0x5urSGB2MLGF0h42IAD83Hx+jbqALnjWUXwR0lhxdLjSLo81ZvEsg1nqbhhoym4
         xGTw==
X-Gm-Message-State: AOJu0YwNgNdz1cDw8i4cYHJ1Bi4zw0ZPMVWs6H61g5AUFOoDStwne2ID
	5XzEQhNW+EOrrCfhvfr/d7UhxkXVxVIhLsSN0/9GOg==
X-Google-Smtp-Source: AGHT+IE9TNtC+Y197TVHnNp9NIAZRP/5MTl0EX4mz7aVtyMvkLCvyG1d0lrx253AsDR0qOz0kGppog==
X-Received: by 2002:a05:6a00:24cb:b0:6b4:ac0e:2f70 with SMTP id d11-20020a056a0024cb00b006b4ac0e2f70mr17780544pfv.29.1698789935490;
        Tue, 31 Oct 2023 15:05:35 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c24-20020a62e818000000b0068be3489b0dsm100301pfi.172.2023.10.31.15.05.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 15:05:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/3] tiff: CVE patch correction for CVE-2023-3576
Date: Tue, 31 Oct 2023 12:05:18 -1000
Message-Id: <63daa00279c0c3a8650d6e08a68cc32a2b98d843.1698789786.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698789786.git.steve@sakoman.com>
References: <cover.1698789786.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189872

From: Vijay Anusuri <vanusuri@mvista.com>

- The commit [https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37]
fixes CVE-2023-3576
- Hence, renamed the CVE-2023-3618-1.patch to CVE-2023-3576.patch
- Reference: https://security-tracker.debian.org/tracker/CVE-2023-3576
             https://security-tracker.debian.org/tracker/CVE-2023-3618

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../tiff/{CVE-2023-3618-1.patch => CVE-2023-3576.patch}       | 3 ++-
 .../tiff/{CVE-2023-3618-2.patch => CVE-2023-3618.patch}       | 0
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb                 | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libtiff/tiff/{CVE-2023-3618-1.patch => CVE-2023-3576.patch} (93%)
 rename meta/recipes-multimedia/libtiff/tiff/{CVE-2023-3618-2.patch => CVE-2023-3618.patch} (100%)

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3576.patch
similarity index 93%
rename from meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-1.patch
rename to meta/recipes-multimedia/libtiff/tiff/CVE-2023-3576.patch
index 8f55d2b496..b17dd72170 100644
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-1.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3576.patch
@@ -4,8 +4,9 @@ Date: Tue, 7 Mar 2023 15:02:08 +0800
 Subject: [PATCH] Fix memory leak in tiffcrop.c
 
 Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37]
-CVE: CVE-2023-3618
+CVE: CVE-2023-3576
 Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
 ---
  tools/tiffcrop.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618.patch
similarity index 100%
rename from meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-2.patch
rename to meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618.patch
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 8dcd73273e..e925b7d652 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -40,8 +40,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-26965.patch \
            file://CVE-2023-2908.patch \
            file://CVE-2023-3316.patch \
-           file://CVE-2023-3618-1.patch \
-           file://CVE-2023-3618-2.patch \
+           file://CVE-2023-3576.patch \
+           file://CVE-2023-3618.patch \
            file://CVE-2023-26966.patch \
            file://CVE-2022-40090.patch \
            file://CVE-2023-1916.patch \
-- 
2.34.1


