Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFCAC282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 13:41:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.53024.1741009255257900207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 05:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=C8QeR0fz;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: alexis.cellier@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bc4b1603fso4839515e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 05:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741009254; x=1741614054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9N6LrtDtbM5hIcFotkuBrZKuea2xgJoCRV6ZkyZAaU=;
        b=C8QeR0fznkw8iXhAJfZmoMpZsF1qcz09HaF9fOvdrkPDP3ySXeMLFMbQ+GLdy/AdA3
         LWXe669mBIiHSRo51XGOqmS7wF8u1m9O4Sq/8BzT9886l9sOka12UgGpPHKy5cvzCPJc
         BMv2NjnjNZUPM/ICyU4BHssX5GOnivO2LA/DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741009254; x=1741614054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9N6LrtDtbM5hIcFotkuBrZKuea2xgJoCRV6ZkyZAaU=;
        b=KW4dsUO0ZaWjoUgk8MBxIuGh5wj0xbFRpyIdsmGHpi8z8Ux79mZZprLRSOMf8nuGT6
         rpwRGMdaDGEPzXakPTebwbpJHrIUc/uLsE06yAC4yTib9uJ/lnOAnmSRzer+JEfSP9JX
         s6KygKJUaQXFPGLJt605OHvsxoK14m+0YJVSjRPQ8v1B0FjkNDWF7+L+rnTxve5dPo+Q
         DV9e+axtzGnWZclyR0eEyq17jREnLKNWqBs5f4fg/sRrEuyqTxmZduBHjlJcjf6wkIiz
         A1ImCWDe5CbTx1e4wBAheng/um03rrFpPgAgePgaEn5EeAykR5+jG7hSCfbbl8usR4Oc
         rvpA==
X-Gm-Message-State: AOJu0YwzbWQf3jVI5DVNRm7WE0Vhk0dUn4sUrRUBV01AHsY0Ho1nxTOV
	gvQWQZ5Ccq/vO46XZPU7W8c6Io3km5F0r6gAZS8mk22EHmgRd0by8kOK6MO4qmy6NJYh6ksOkea
	X
X-Gm-Gg: ASbGnct4htwyVXStoCQ8gX4CZRJxLHkgRQyQ+NuabRqmOHBIlMbYals4txTJrMUNrTk
	flHkGvBzul5yGil6LDOUCGiLcxcXdgP4Vgcnj1KstA3WbkH+nyDi8qsyIrtPrVBOSiwINyMv10N
	J3nRIGog+yD0i5gXV80u5BBrU4nh/rRtkIbhRMX8vlYE8hS9qa+p7A/QD7FQknakgIWgPidVEkM
	m4xvKhHEYYSSHZ6EbECnOd/VyRKEJsc7maReGIiIEOj8JvCli7iP6wK+uQuihqNAsx6ympINnQX
	kC+5+HDoeEDNELHSGk+GPhptAk/+ydARCyU6l/h4MfXzkoHeFffIhJ/kEFVj7bS5EVzoz2Y=
X-Google-Smtp-Source: AGHT+IHAAwb+RXn5dKKMgO/a89IJNhqzrfKwMNWYLfbm9xiTTPePHPwXQcdPGOp7VL0vwTcVHSsYdQ==
X-Received: by 2002:a05:600c:4693:b0:439:88bb:d017 with SMTP id 5b1f17b1804b1-43ba66da7aamr101747895e9.6.1741009253721;
        Mon, 03 Mar 2025 05:40:53 -0800 (PST)
Received: from falke.. (176-147-181-65.abo.bbox.fr. [176.147.181.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba571274sm190276785e9.31.2025.03.03.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:40:53 -0800 (PST)
From: Alexis Cellier <alexis.cellier@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Alexis Cellier <alexis.cellier@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH] systemd: add libpcre2 as RRECOMMENDS if pcre2 is enabled
Date: Mon,  3 Mar 2025 14:40:38 +0100
Message-ID: <20250303134038.102355-1-alexis.cellier@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 13:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212208

The libpcre2 is now dlopen'ed, so it is not automatically added to the
DEPENDS anymore. Add it to the RRECOMMENDS list.

Cc: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Alexis Cellier <alexis.cellier@smile.fr>
---
 meta/recipes-core/systemd/systemd_255.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.17.bb b/meta/recipes-core/systemd/systemd_255.17.bb
index 8f5170929f..f85ad61080 100644
--- a/meta/recipes-core/systemd/systemd_255.17.bb
+++ b/meta/recipes-core/systemd/systemd_255.17.bb
@@ -188,7 +188,7 @@ PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[p11kit] = "-Dp11kit=true,-Dp11kit=false,p11-kit"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
-PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
+PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2,,libpcre2"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 # If polkit is disabled and networkd+hostnamed are in use, enabling this option and
 # using dbus-broker will allow networkd to be authorized to change the
-- 
2.48.1


