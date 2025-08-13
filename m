Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCD3CA0EE5
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 21:29:13 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.7884.1755120548468647459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 14:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HnW4zF6s;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2445806d44fso1880745ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755120548; x=1755725348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHPLgY9uzoQzHasrx5JZ0njjDBQueE0v/ZN8bwUkm0c=;
        b=HnW4zF6siJfPE8bskcmyd8GPeGxjbD7Fj5KiZ7Fv55zLjCW6i1T8C0EqdqQx628fEh
         AcdD/tNAV+woIqzgyDM05GzaY0RhKf6X2e9JO6WDoqgclN2jCzLY2XmXaOxTaUZBduci
         jzsf6vogHIwMoimWZXbU7+nzWuArf8XkYeKESqv0IfuUbU3680NEoTcrEnea5nwNWGb8
         cRz1PRMald/u4uUM4ZKm4mq109tS8e6+xXm1T5NzWH56sN+3qugs0wUv1LfhsjPmdukH
         mfi6K57qVfsGqtwoPYCjuzu6n3fYlV7ZBvzKFEv8IsA62WMW83E9Bqw/pf1AKApcRKHY
         minQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120548; x=1755725348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHPLgY9uzoQzHasrx5JZ0njjDBQueE0v/ZN8bwUkm0c=;
        b=DizRFm/ejlxaH39H6l9BAMM2iOtQtQRZPsnVzqrk869d/rYMYu4ooJLW97hfc0D6Fp
         SFDU2pKilsr2lWLA9Q65HUBFEIKTKdt5EjlRv0wv7ap8SU3iPSWW4eYpPZlwX8tvL/U/
         RsmUoXWvXVDvsbcBcCg8gFbQ7WAuaPjeR1zfPRN9JXv1X1lwbqm344S0b4jieqvMihvi
         3fCknNeCLext1l542ldR/Yv7EuHz2n7Uo3COxZEOtWradA/7J0njqI1IiECbRH0b7eUN
         ZPhNuiqn0sJIOHGESS7IsQZkmGazD0/oFbcqLhY60RMeojjwnI79xxgpJ7mgl/PxuuBo
         UXjg==
X-Gm-Message-State: AOJu0Yywt3LMI1XZCIcK8BG0h9hgZNT+O8OCFoVQH/2qRYcTJY8LQzUY
	69hH6ngmcCT9a8dXSi+ZUEPX2eOt5oMKg33MQ8POqxBx68Ez10vbz7RbQ86frEk3gtRrHv4X183
	7uDxH
X-Gm-Gg: ASbGncu2DNoSQlDZp23FiiuVxJfrE6uTd9wVr+B4x2vP5Wl+5F/x1IQKVyC2B/DWz99
	txlAtpNd6UZ/kC3des0ZfDZMpWZ3c9W3SaJrVCid0cVrbTOGS4CxrjW3AhnvTk75MkhCn1Z8R5t
	VsE8MXcf+whxiOWeSKbeuw1nSu0OFRTRgE+akje+siIdBmrXRdEQo7iCIMU/Hb7B8qWXpB5eT2k
	LCk+XwVeuPoA+CgGvUjbNNQI3WFTx5IC0okdDBTCzkdv+emev8JgE/wdOe8A+YIi/dPH/AY8KT/
	e3L/TqYP6/5i3vXP/exZ2xKXZVSTNHvdKc2LZD2cyBx/tddClATMeQv76FQKSYkQR/pYHBSak95
	TlRfBDZiUU2oM3A==
X-Google-Smtp-Source: AGHT+IHlPtxCg228EhydMNaltw7ovCdDeyeFqRtFcewGb/qzDeXUB2pF9060XcBaxuei9nBlM2+2dA==
X-Received: by 2002:a17:903:2f05:b0:240:bf59:26ae with SMTP id d9443c01a7336-2445868ee6dmr9880815ad.36.1755120547629;
        Wed, 13 Aug 2025 14:29:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:38b9:9a51:8a43:9529])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a48esm336178545ad.114.2025.08.13.14.29.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 14:29:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] gnupg: disable tests to avoid running target binaries at build time
Date: Wed, 13 Aug 2025 14:28:48 -0700
Message-ID: <b02f99a0b82ed55a07c00b32805ad676c04ee4ab.1755102550.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755102550.git.steve@sakoman.com>
References: <cover.1755102550.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221838

From: Guocai He <guocai.he.cn@windriver.com>

By default, the tests are built and run at do_compile and we can see
errors like below in log.do_compile:

gnupg-2.3.7/tests/cms/inittests: line 99: ../../sm/gpgsm: cannot execute binary file: Exec format error

Note that the do_compile process still succeeds. However, we'd better avoid
executing these target binaries at build time.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(master rev: 74d48497470ce209bc6bdf49c2e2cfda67dce6ae)

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/gnupg_2.3.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.7.bb b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
index 461ec6687c..27b2d3682a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
@@ -37,6 +37,7 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-readline=${STAGING_LIBDIR}/.. \
 		--with-mailprog=${sbindir}/sendmail \
 		--enable-gpg-is-gpg2 \
+		--disable-tests \
                "
 
 # A minimal package containing just enough to run gpg+gpgagent (E.g. use gpgme in opkg)
-- 
2.43.0


