Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DB7C0015E
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:49 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.274.1686926267761260381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ARN48bHp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b4fef08cfdso5340635ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926267; x=1689518267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDvTlixEiVm1Y2EJ6byPx0ZcJN4IyHsLy5PrZUA9x3o=;
        b=ARN48bHpu2AXGeM8Jdcay7VtKbbxWiTw5bBpA1cYOITiMVyKZ9/6ROWopZGhGF2crb
         ca//wgxtyQJXmPym00Bsx5Fm78VYvuDWIbi152AaNxA6DRQfS9/f32Ao+IO8PDeMgEax
         RED9LBT8rnMp4atKPQBsDa+86+fjNyDFc96UqL76CS5ovMhsj6UvofH8HGZY6yUeWFZz
         sZ1eWN3C+nKvQxnARZG2+JYwkfhH2zFI4Wnm2KRj7MPa4qbWWp/R1CfVkNOO6kz/KZlA
         Wr/Gk6SDV8aPtnTFREWPyCuxq5N3wG/YbY3V54bwMYWKDB7xT7h7ZeE6Jt8QVKBrrglD
         MaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926267; x=1689518267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDvTlixEiVm1Y2EJ6byPx0ZcJN4IyHsLy5PrZUA9x3o=;
        b=bmMcfqG84cYp240lJLcaBKHpnSbkcjyY6zm09MNidkUAXU6NQzUjUhOYj2ShQMdomO
         TTCnAWMXJf8VaB6GBgK/62ftj5xlGckDqKj2qP4usPWSdBmdzNJZEnTQGHXUHZ82Bzfm
         +zNMuh0cVHHKrf0iZ3EoLN9RkU6Qms6JB3I7kudXL+ZtY0aSezhaXBYvAc1imX1BrcMD
         FFAPHJZFPbHIC0zyqZW/4kf7BR8lQ2+Wu9E4ObD2crrAB6LVBjMHwQymhNOnXvaw0Nud
         +5kjAwVJBE2O5r6S5UTmmOoS802qZtN10GGW64JpDGMYHGpqsPCgkFe1MR9FQsMQu+U8
         cKKw==
X-Gm-Message-State: AC+VfDzdyF9OMS19IjIaUTj/rXSLTf0SOOzVPGfnxEck1N8hPir7p97l
	S66fPhhRSzEdMi1870mYVhZorOs4YS7no0cTUNc=
X-Google-Smtp-Source: ACHHUZ4oYsm041awlpYpMD7WBZgxKCUFbS2D0dThWZp6Xcx8QEn8CqY6Orw2vnNREdmMC+SG7Y3s1Q==
X-Received: by 2002:a17:902:ec8d:b0:1b3:f72e:13a0 with SMTP id x13-20020a170902ec8d00b001b3f72e13a0mr2117412plg.6.1686926266731;
        Fri, 16 Jun 2023 07:37:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/24] pm-utils: fix multilib conflictions
Date: Fri, 16 Jun 2023 04:37:06 -1000
Message-Id: <18d15c59ef5bba92e5223c96c28259feac037410.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183036

From: Kai Kang <kai.kang@windriver.com>

It fails to instal pm-utils and lib32-pm-utils at same time:

Error: Transaction test error:
  file /usr/bin/pm-is-supported conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-hibernate conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-powersave conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-suspend conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-suspend-hybrid conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64

All of the conflicted files either is script which source a file in
${libdir}, or a link file to some file in ${libdir}. Compare the content
of installed files in ${libdir} exclude binaries, only the paths of
${libdir} diff. So re-define libdir with ${nonarch_libdir} to fix the
conflicts.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f836541bcfdbf033a37537530b4e3b87b0a7f003)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index c6a4bc4932..dcc09f279e 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -19,9 +19,12 @@ PACKAGECONFIG[manpages] = "--enable-doc, --disable-doc, libxslt-native xmlto-nat
 
 RDEPENDS:${PN} = "grep bash"
 
+EXTRA_OECONF = "--libdir=${nonarch_libdir}"
+
 do_configure:prepend () {
 	( cd ${S}; autoreconf -f -i -s )
 }
 
-FILES:${PN} += "${libdir}/${BPN}/*"
+FILES:${PN} += "${nonarch_libdir}/${BPN}/*"
 FILES:${PN}-dbg += "${datadir}/doc/pm-utils/README.debugging"
+FILES:${PN}-dev += "${nonarch_libdir}/pkgconfig/pm-utils.pc"
-- 
2.34.1


