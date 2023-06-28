Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21DDC0015E
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:37 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.17590.1687961616358919913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VaNyCoPh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b7e1875cc1so24994285ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961615; x=1690553615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDvTlixEiVm1Y2EJ6byPx0ZcJN4IyHsLy5PrZUA9x3o=;
        b=VaNyCoPheA9YPxmbkN+zuS/sIcHRQ93OavASRWqln9oQr/qchC6bjKucW9DfiS2U54
         7hB7ZKdBoI1Cxxj0fIwQLpInhdYe57bhrQbyEiy/3VgqRmN4b0KSWFPjZmgt9wLh4lMj
         C8eKC2kyyhLu9a3aAfjNa1xQMpDo9e7A3jFfH8Yh3jtDVTqwifgHXW6ipgL0IB7Zq2TC
         SMU4g020qU8+bWCUHZ4WgajNaz2o02UkqIvY3cprQvoy6RWI0vEBSndFzCVfsXdN/0Wx
         BvWm00u66Tcvt7KL5vK+5h0zQKFJxwwJWk17NRqXGUGjK2bqO92s0XDtYFKiMgzZ+Ngv
         /WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961615; x=1690553615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDvTlixEiVm1Y2EJ6byPx0ZcJN4IyHsLy5PrZUA9x3o=;
        b=MG1cyYqdyfEfFlLRhD72NzKhe91hSvoprsXfrjGb/Gz+AFinQyixwhWLvBKi4Jy3ha
         C0TuPu7FFron7+TN/qyoCes4JKuL9oNDag1Zb96RB1dBf/tZUEm1mSyBzbxu91FHPL4V
         GZA3C5xK4rj87XCAH2tudlwOeBjuLOhiYVu7cbw9EPGbBZsVFOnXCF2bDREegd0a9l0Q
         tXOri8vQP1+tgtH5v51E2YrW52PmXu9ormAue+4243UXkHPLI0lmgcaIj6v0lnev2XCM
         eFOm/J0hKTF6aEL2n3kr1JRw5lqxXJYhjpb8VgPxEXNUdQKVGLVTe+clWrZrD90lF0Is
         3K3g==
X-Gm-Message-State: AC+VfDzPfHG7wBW8Zs/nB7f7Fbm0Sr89qotmG2VeXu2ejXCZYycz/zcw
	7E6QACIiboOiR1eJeU198vyK+GAb0XUzL8GxU1DHKg==
X-Google-Smtp-Source: ACHHUZ7CsLCFRRtkH2bbyCWFA7VZ94OiddYiuO8DGUrcBikT/uZbGmZEDOy1HHWDZMvBcaaZA6CJRQ==
X-Received: by 2002:a17:902:ce01:b0:1b6:9b29:bb1a with SMTP id k1-20020a170902ce0100b001b69b29bb1amr8963856plg.9.1687961615458;
        Wed, 28 Jun 2023 07:13:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/29] pm-utils: fix multilib conflictions
Date: Wed, 28 Jun 2023 04:12:45 -1000
Message-Id: <7d99987f76c58ec1f9ee5efffee0705b2c542ad7.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183575

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


