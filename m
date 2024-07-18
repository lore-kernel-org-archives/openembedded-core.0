Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88087C3DA63
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:46:11 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.15394.1721310367031953368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XTSt7Zax;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc6a017abdso3460695ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721310366; x=1721915166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZ+QGVvvRo+JwSwbKTQJkN4+hTn3DrZHrsUS8m1uI9g=;
        b=XTSt7ZaxIRtVek7AcT6rmszsX8k4j1KG2O/sn30vQ8IPjxt9NdnSNdHZ/Woi3H57fx
         W+IQFBqSGtp2fVb966+6zx5bN2iBzmy4E52Cyekewa24Zsx7SXnkWBc/necsWnSoGnQF
         +yrYcHHuNmcdxtXSafc2+dxqpS71GRs6sKM5ySujvqmXXS15eQG7xKcHj9z3v1wlt3T6
         tqhsD2jIf3XdVpCCETRIr4qPah/S98sFpwhp64UodoZyRlC+P5EmQFdV0ayRvs2Pk8Hp
         pnVznnkKwZqIqRCiiYk1mXVUHiIumgkMbh++QgQp4on9yoHduCN7P6NDnEM2nhbEzFWs
         6gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310366; x=1721915166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZ+QGVvvRo+JwSwbKTQJkN4+hTn3DrZHrsUS8m1uI9g=;
        b=gAhXITx9ZnlXkXbT5kc2mgDoL3ldck59yQHL6ofrOpWb2vL3r+TLfLdLJ4/gZP3RPX
         rMa4mZdSaQDlKL9M5aCdjH52TI0pg/Qwq8l503IJtrgDfQA7rESgiWI7y870sDNIJRzb
         ShCwdNV8rebRUFtf+Z+eS49VDrrO1uW9zrRyzhYPpBflO+it0ZLO8w9EaKQQ3aB+WaXV
         Qb1QwG429LFtveAcLX5p81zHpKc+7nCyOwLVc1ARd6veFEsSX36vEQflrR7Dh8tPCx+M
         nwT1JfYxbFouVAwXVB3KnNI0d271cFlEex3VS5fITE7QEpKXchqsgJ8tc/GbpXbR+p73
         rbIw==
X-Gm-Message-State: AOJu0Yzx+oR9OeA0wg2Ja2r3VXIjKhalnM0fIgDTMgpJKMkBPZ7ZR2N9
	bUx9CQKLgkUlmwfwfRg0VydtiUsIDL7xxVXa1xbJVROZSez49bUEcIrz6DECV1Xyt8k5J00uPTb
	D
X-Google-Smtp-Source: AGHT+IFMqNVnNnESONr7OGhr+nqh/CX1bVoFFdoX8M7TN1CO722RcolOEhTTkzUdfn87k0IzkBxHtg==
X-Received: by 2002:a17:902:e548:b0:1fc:4763:445c with SMTP id d9443c01a7336-1fc4e14fe3amr40269435ad.32.1721310366311;
        Thu, 18 Jul 2024 06:46:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6ffbdsm93366985ad.60.2024.07.18.06.46.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:46:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/12] multilib.conf: remove appending to PKG_CONFIG_PATH
Date: Thu, 18 Jul 2024 06:45:38 -0700
Message-Id: <e88f159989cbf8080f0a8fb449c878f2a5747774.1721310237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721310237.git.steve@sakoman.com>
References: <cover.1721310237.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202222

From: Changqing Li <changqing.li@windriver.com>

* Since commit [a23c482cab allarch: only enable allarch when multilib is
not used], allarch recipes will also be installed into
${MLPREFIX}recipe-sysroot, so this appending is not needed.

* This appending also causes some QA errors. Eg: for lib32-php, the
recipe will use 's@${RECIPE_SYSROOT}@@g' to remove host specific path,
this appending makes not all the host specific path are matched.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e6e6076f1956c711814c14d76194794d950e45f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/multilib.conf | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index ef3605a73d..09546315b8 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -22,15 +22,6 @@ MULTILIB_GLOBAL_VARIANTS ?= "lib32 lib64 libx32"
 
 OPKG_ARGS:append = " --force-maintainer --force-overwrite"
 
-# When multilib is enabled, allarch recipes will be installed into the MACHINE
-# sysroot, not MLPREFIXMACHINE.  This means that anything using pkg-config to
-# find an allarch pkgconfig file will fail as the PKG_CONFIG_PATH only looks
-# inside the multilib sysroot.  Fix this by explicitly adding the MACHINE's
-# architecture-independent pkgconfig location to PKG_CONFIG_PATH.
-PKG_CONFIG_PATH .= ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
-PKG_CONFIG_PATH[vardepsexclude] = "datadir WORKDIR"
-PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
-
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
 NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
-- 
2.34.1


