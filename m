Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634D0CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 07:50:27 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.33798.1725263419033778674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 00:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hiy+y4Ni;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428e0d18666so33363005e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 00:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725263417; x=1725868217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r0UU/3fraBilvxgV/ErFK9fGUT1xDWQEmOxMnRq9V/8=;
        b=hiy+y4Niy/u+c7RHeFP/g44n+bFQjt4ZjZAKP8/U1MAikUGB2p6FSivr1B+i7u6t8R
         cErjIYpBpZTgBYMp+8ublcjpbxcIQyKzPSMzwTraOm5ZrETsoA6cB2rcHcj6K2L6aRF/
         8yPSdk1ZEw44pcsxf+DdpPbAskNxhPIkT2Mj+MrZyQCRXWCxkeVrZZAPCQ3WMM/A5loQ
         NFK8uNYIg1InYt22vtIU1IdIjrpuFzMJvUgXcu78qqjwOc3QWN1PFeOV1qaE5gDibF8l
         MKteuiHfhwCPOXwjeEWH4d7RhOnDMKTCputs3Jek63xbJWj2x63TGEYqyXtRsAWz/GqO
         rQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263417; x=1725868217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0UU/3fraBilvxgV/ErFK9fGUT1xDWQEmOxMnRq9V/8=;
        b=Y9g0XolYk14cYOWX4EJ+jy1rso/QSq8TEkqU63001S2TpPD6aXsx6gYIx2gZDgHlTF
         OtmeIr/s3xv/lvxxAJoXOmeJerYMvYGqF+dK8lsKkgVpq5DkS1D70EC/O+GerdClGZWa
         m4BXera+AxQuomMUPTUypXCSlS6yk8UkbuNJIPCLDdzUtaESg1QSA04oAXOCm2GfsRSt
         CTukwlhW1lKsx6/bHMYAc4NxQQbDUgRPZNhxWut87jYv91BOPL8AcXdOQFQRiuP0XYVp
         AYbPnb7+zt+Uz1+BbovwbVHLgbUFRWAlZLwZKLtR+KsRmUMhBoACUgA5L83GbwmBzerR
         cYWw==
X-Gm-Message-State: AOJu0Ywv6DLe+DmlnWERLOz2xdT9XhcYn5p4nQR69ecZ8JPPSeMrfFRI
	gOUp7l03HIRQ6QtTPGeWXLCgfUu/UPqddUdv+z0BHP3jkFwSNVJnKoR4Jw==
X-Google-Smtp-Source: AGHT+IG+/E4CXOGceLWNFlT4zdkiDq5hnDQOm/5HLYjgSTaNzZfeUgjARFXMXWY5y+Wa1G6GKYQopQ==
X-Received: by 2002:a05:600c:1d85:b0:426:6f62:3bc1 with SMTP id 5b1f17b1804b1-42bbb10d2c8mr68468405e9.5.1725263416748;
        Mon, 02 Sep 2024 00:50:16 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba7b4271fsm158981045e9.29.2024.09.02.00.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:50:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] mc: set ac_cv_path_ZIP to avoid buildpaths QA issues
Date: Mon,  2 Sep 2024 09:50:10 +0200
Message-ID: <20240902075010.3411100-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 07:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204062

* in builds with zip in HOSTTOOLS mc fails with:
  ERROR: mc-4.8.31-r0 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.d/uzip in package mc-helpers-perl contains reference to TMPDIR [buildpaths]
  and it's because of the path to zip:
  mc/4.8.31/package $ grep -R styhead .
  ./usr/libexec/mc/extfs.d/uzip:my $app_zip = "TMPDIR/hosttools/zip";

* don't use /usr/bin/env as in other cases, because app_zip is then used e.g. with:
  my $cmd_addlink = "$app_zip -g -y";

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-extended/mc/mc_4.8.31.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/mc/mc_4.8.31.bb b/meta/recipes-extended/mc/mc_4.8.31.bb
index 5f8257f71f..69d089d267 100644
--- a/meta/recipes-extended/mc/mc_4.8.31.bb
+++ b/meta/recipes-extended/mc/mc_4.8.31.bb
@@ -31,6 +31,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL_FOR_BUILD='/usr/bin/env perl'"
 CACHED_CONFIGUREVARS += "ac_cv_path_PYTHON='/usr/bin/env python'"
 CACHED_CONFIGUREVARS += "ac_cv_path_GREP='/usr/bin/env grep'"
+CACHED_CONFIGUREVARS += "ac_cv_path_ZIP='/usr/bin/zip'"
 CACHED_CONFIGUREVARS += "mc_cv_have_zipinfo=yes"
 
 do_install:append () {
-- 
2.46.0


