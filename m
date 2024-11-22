Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9703E6ADC2
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.35760.1732310830198468631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z7QrAnJ2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21288402a26so25432575ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310829; x=1732915629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vu+86QSwUlliW+Kzzzj5D2QPbNLJbsNODniIVdSTnfg=;
        b=z7QrAnJ2kuvia6W+voA0uI6w4UHGLDPng5UVpvlk2WGJX5mUEOCbS+i1AOYHFydH4v
         7XVEFMhw+GpI4mFuZnlLR0B7dnMsRFuIEJDKawTDy+654BiLTUCSySzH0sTTPA7HYbgp
         4YAa/E5YmszttYJq2rXm12ibbqxFGPb82R2wlV3zasPeh7DasTVGSkcEuzISGGsdy+CD
         oa8rAt7fkRlKp9jKoywtSvmuOVNYQQGz/xLUsRZKkcxQhjWFZ8MthC24JDbBeCtxfZWp
         pr8c08dsBi1cJkdH/RbKAJd+dkhUaMUxFRJobYG93XMNoAhyJoI3udHaO4WGtRhB8ysh
         XkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310829; x=1732915629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vu+86QSwUlliW+Kzzzj5D2QPbNLJbsNODniIVdSTnfg=;
        b=CmHRaHOHm0bfAzkv8UsqWqcuh0s3FAcxb7csKFOfdvY9PxH2gV6Y9FPzsqvubvkD/W
         58J1HupXsdsVWKm0FJKNLZFpsKtCad0//CJCip4MeMdvP6h06+YZLsY/N3V1cIdxmh1Q
         lQJmP9i1dbaoL5bJM/saNYQzZPtlUrfm7+R90FndgTlWA7sb1tqsLSrvPF8Lqyt0iTbL
         x+795SkIvxxgd5nrUsBnEBNvysr6uFLPU0IYnmiWwBpL/fTAIbrKToEWTyqjRnOSSqGc
         pJkjy2PwUI/sWqqfaPgbheCWYbRVwLtZbbzyzpFwFD+OMMvty35ozHn5NDNr3ONHvtEa
         KbMQ==
X-Gm-Message-State: AOJu0YwwWtlmUd7cJgcg3LfEL7yuhPX8myA/TkVp29KhVrlh3Gr5OoHz
	RFZfZpIg2FMzdgypzky2Nb5o/aWJWjus5IbvKbh98xni5j8/VKtPdtswZoKKSy8A4RdfjoK5hL8
	Z
X-Gm-Gg: ASbGncuUUqsRFwSNZkZ6RsaxT9GedSx6n6wA/EfyG3BnTmNerug7XSrEj4BluhXWJsx
	jsFGx3E7O04S6SFEVbYJW8kwF8wnd6WiWu8dTBsOU730u/aLpwIMyYMiI8dyUy34ABXf1+ybgpI
	BpaPjlpWo8/n0M8eGls4JMDPXSpYDXZ9nr/iwn04g0jMSaqmFNTElQxd+0rIYvYQFNJaAe87l0q
	SA/PLMYLcBhK1UVzJbQin8gLQ0wDhCGtdpxYBg=
X-Google-Smtp-Source: AGHT+IGq9GgCON9laam+havT5rQvgoWsElNDHIEPW4eUVBrWEHZq8RDUzkq0dpKJBeL4UZ5gzIYy8A==
X-Received: by 2002:a17:902:f78f:b0:212:4835:10a with SMTP id d9443c01a7336-2129f24ca1dmr64763325ad.34.1732310829483;
        Fri, 22 Nov 2024 13:27:09 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.27.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:27:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/19] webkitgtk: fix perl-native dependency
Date: Fri, 22 Nov 2024 13:26:33 -0800
Message-Id: <76cb08195f90b36395d7ad09ab8f2654eda0d204.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207664

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Currently, perl-native is missing from DEPENDS for webkitgtk even though
perlnative bbclass is inherited. This happens because the DEPENDS variable is
reassigned right after perlnative class is inherited:

inherit perlnative (DEPENDS += "perl-native")
...
DEPENDS = " \
            ..."

Adjust the DEPENDS line to use += in order to fix this.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: a207c8f42f809340e0794cd326cb5c45e32d7d56)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 16acb205b1..a62d99b227 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -36,7 +36,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
-DEPENDS = " \
+DEPENDS += " \
           ruby-native \
           gperf-native \
           cairo \
-- 
2.34.1


