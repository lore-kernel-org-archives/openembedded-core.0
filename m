Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B270DCDB484
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:57 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.285073.1697644132424493405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VZGRG94c;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-27db9fdec0dso1780926a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697644131; x=1698248931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apcCQ6irbTInt81w6LvT9VW/z41JKltNcJSJZvC8Gp8=;
        b=VZGRG94cJULnX0BXK0gjuA2dh3GchET0Eq4/CIXW/kuuf9L17pUGtflgT1JQePZMnx
         9NjXg2A+eFH38X3m/q9ZxBtjKBhrdABjh0iD3a/dvfIX3q9ZzAjdpS/FEuuuhIXwVbAR
         ZR2dumw1zu251jJsu8twOT5e2kE+Xb2DpLLCgxI4RgTldte6aTtEsmMj8PulivWinIj0
         Shie7KYjAt8CwcOc2/aQlfnMEfH8JrU6UzFj0fPs4aisZhSzTOOxBtiLEFGh/VH94kxI
         BEU4JUplG2TJ5LUVn8EPKfB5ANUePutudWAH9TXMH/oWU6E0Dc83efIJB7ylztsISY3N
         FFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644131; x=1698248931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apcCQ6irbTInt81w6LvT9VW/z41JKltNcJSJZvC8Gp8=;
        b=Q6Gb27j68HfXSRuKiDIZHIrhlO6/w/zAgn3VAx1fUmm36fGcTCgFdHhkrkguJ5jpAc
         56arbZa4k0mSfsIXmvtSVjGE1R/jso0yCNIF2nx15PMBQoZgEc4avMRLP9lbVMo+PTcw
         XfQbNa852KEjZZa1QKJNQyhylHtGnpsyaiQ6sBIQoKcp8jggtDDk5uBGynWYVTo48kFx
         wgtSNdTYnphoeUbMsJUyXtmUOa/Nhp0Qz69Ahyc+ki5fVohfjgr2KZlPNFsDeI3tdkS1
         l9H5qQ5lzRQ7dBuAstcD1xevc+D6BnI7RxJvc9szesVdoQgRlCpwKm7vW76YNvzSmz82
         WeKw==
X-Gm-Message-State: AOJu0Yw+Ws4sNkgux/7lAT3T/kVW2mdUaLTtp69gJQnMrwuRYiH6hJMS
	NCuqALBkMkmoeq6ThMAT9dPnyiiFxoWdSdMGcHI=
X-Google-Smtp-Source: AGHT+IGchTPHEdgXVlAyvG+41OXbPHTNLyWjryM/1bel94eGVGrAZY2EerynXcr7enT77VLnpg+9eA==
X-Received: by 2002:a17:90a:f003:b0:27d:b3d:5c33 with SMTP id bt3-20020a17090af00300b0027d0b3d5c33mr6067840pjb.28.1697644131650;
        Wed, 18 Oct 2023 08:48:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090ab88e00b002636dfcc6f5sm43268pjr.3.2023.10.18.08.48.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:48:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/10] libxpm: upgrade to 3.5.17
Date: Wed, 18 Oct 2023 05:48:28 -1000
Message-Id: <1475a47239d77a368bcec69f12e5a63f8bebe14f.1697642997.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697642997.git.steve@sakoman.com>
References: <cover.1697642997.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189408

From: Siddharth Doshi <sdoshi@mvista.com>

This release fixes the following CVEs:

- CVE-2023-43788
- CVE-2023-43789

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libxpm_3.5.16.bb => libxpm_3.5.17.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.16.bb => libxpm_3.5.17.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
index 28a775c5f4..7bc494a690 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
@@ -23,6 +23,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e71fa2f6eff649f51"
+SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


