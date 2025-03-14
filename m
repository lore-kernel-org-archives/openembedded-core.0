Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA98C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 09:46:44 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.10279.1741945602472008964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 02:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BAq1/8+Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso12868535e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 02:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741945601; x=1742550401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rdn4pNq60DbRR3kqCUU3nFHgXE2y674Zz8qkwCpfQzo=;
        b=BAq1/8+QLtPxyDIwVGVwJn3ghCfG747vtFA8ziJO6QC4vuGOZM1LaA6sVPOPkkPLiU
         6Fz3kiXGH5h3wnlpBBQ1hjZkpigimISaC+Vq0PEE+k+QLBsA47BS2B09lcfyTqw608o+
         fwAz1XCMjnFQq5oNeGqlc/5q0ANKEEVylzMjum+R23otq0Xo9MMX77bztMBm3rLYiQVM
         NrQon44WOBFbyrqzHbtluGqfDBNtSOI+Q3J0z8cMeJSf9jZBzSrqITmEcSVDlC4EpwYM
         aQP+sHMY+nY4ktXYtdYrxptTq4004k8kX6lyWBBT8bL7/Sl7/Gd+LXPOiY0BN6ao5QQW
         3F7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945601; x=1742550401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdn4pNq60DbRR3kqCUU3nFHgXE2y674Zz8qkwCpfQzo=;
        b=LCcKwb3DmAvHJ/joBBG+ftvMh8hDcaWvFxJNajnwBMtr+gC5mPZP0gFIse9C5mZFAo
         wBSka0FHeIJHoPPUck0quBEMKkgf5oAJqlTynLgxt8sb7qHHIGbANWy0b9iWVv5p4sO6
         790Wiz8BaAmm51bNLzUqPQaIYQktrk885Hs/SWvbfhkjVf8awnQh+sgXxWvdLhwoxgLq
         cMk8Pl5sGdGahGr8+VlJ5QXHXGMaKwVcadq9AX9PKhGk21YXgeaHYwRvp3snIHI98B+k
         TLX7B5Mscc+a+i0ynHJbclfiVcNy1hHNY0j6hRU7+SDzz8GaHQRA+hnbG84okVC4LzhQ
         waJw==
X-Gm-Message-State: AOJu0Yx/j4G9G2VCabyJjZHVmyIOfLLfypzdHINFBUhIuo2zzemS+qUh
	/VZnLMuH39NSXjB5wZCWYwj+YSmV7LESN6cKPtWwVQWRokV4OfPMEUdRlg==
X-Gm-Gg: ASbGncvfUwsqcPE/aNzz0ZerNgKrlsWaG2oWbsAEfkVwzDUOWUqJs73Jmcw6p79FRee
	w3qOUxyDPJNvItWjAYprju4wcIQgv5zJFDkNIH1V/QCmFPlscuffHzdWRhozY+gZW49xvQjCMik
	01EkQ257/jFXWMqBEkn67vdFHlguzpQn5Kjep0U99PW+fEl0wQE5+DPDZ340nD/hgF5Cyg+y/J8
	4EN0jVNdC3iQUubew7PZ2bUBGNUTJHK3TyjHXC5O1FXHoCs5nqmbliy5IKR52oCwIh4scByGZDc
	hjOGomgHyswHGQoPsbzRKczj7Ey4q4kmR1oC+qc18tGCNa/UA4U0cxD8sd4NFZzxtpL0IczxRLi
	E/zBZUw==
X-Google-Smtp-Source: AGHT+IH93AhIipjGaluEtOujQiZ7g3ODS5kNhGDRMuOcstkZb+DFmhx0jy3EM6NA1EBMXXsgyBWD6g==
X-Received: by 2002:a05:600c:1d05:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-43d1ed0f578mr20124045e9.28.1741945600403;
        Fri, 14 Mar 2025 02:46:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbcf00sm11605125e9.10.2025.03.14.02.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:46:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] ppp: remove erroneous generated header from the source tree
Date: Fri, 14 Mar 2025 10:46:38 +0100
Message-Id: <20250314094638.1893858-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 09:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212827

From: Alexander Kanavin <alex@linutronix.de>

ppp-2.5.2 tarball ships a generated header with various
configuration settigns that takes precedence over the same
header generated into the build directory during the actual build.

This resulted in various linking fails that were worked around
by enabling multilink in 2.5.2 version update. The correct fix
that removes all contamination is to remove the bogus header first.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 9ea99cc15a3..fd9223d2d1c 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -29,11 +29,16 @@ SRC_URI[sha256sum] = "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e8f701b8e55
 
 inherit autotools pkgconfig systemd
 
-PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl multilink"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl"
 PACKAGECONFIG[pam] = "--with-pam=yes,--with-pam=no,libpam"
 PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl"
 PACKAGECONFIG[multilink] = "--enable-multilink,--disable-multilink"
 
+# https://github.com/ppp-project/ppp/issues/541#issuecomment-2722260363
+do_configure:prepend () {
+	rm -rf ${S}/pppd/pppdconf.h
+}
+
 do_install:append () {
 	mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d
 	mkdir -p ${D}${sysconfdir}/ppp/ip-up.d/
-- 
2.39.5


