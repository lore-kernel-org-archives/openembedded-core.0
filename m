Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923A3C54E69
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 21:49:09 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.8412.1710366542902588387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 14:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VftEo2Vx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6b54a28d0so331712b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710366542; x=1710971342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+B31k29ly0flI5uWUarMsSP9FeJeHefT+R7AHZ87zj4=;
        b=VftEo2VxXFlRBCkIktjQ2H5vP1mhMdSwhlSQ0msxxw462NePD+7nTKr4mHijEN8LYl
         KMUUYW/6jb2/wWG/63ZAK3Mfl47PKg/x9N6zi8Wh6xVbkF+e9FqsUR8CNZStbU+CNWHE
         WzVu1XShoBEC9UHE18N+wa4Sokb/L42Zx1Ba1Iu5fli+LhsIp7VtjKSzm5wf1GvJd/wq
         iGzoFlYEa0EnyTZ4wFweC/+4BvAEgYw0CbXpJolaO2SNz4iYxdFa8+O6dZt9qRPVJ83w
         AlSsMfScz9NTMnH1Cz7MjqCVbfpXoclce0ANTnvakORVlaK80ixA55iA1Pueq3JQf+KE
         oREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366542; x=1710971342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+B31k29ly0flI5uWUarMsSP9FeJeHefT+R7AHZ87zj4=;
        b=dgA03t0S1iTGAKHIhYkzrUiWRzwlTqWaDBXQ8K/d+0SBMr2ZoblE3ZdfV48gkB0ocm
         8svXY6mXZLCmU/MbWp+0qjZJUfL6B8yKF7SlfIxD9AXpE5gw38Zqk/uww2IE3sBUQfQ9
         It+DE9BNcAgdpn355Yn6M5fpYL2BmeAlo9BTB0ZfFItE2ggmevpG1QwJgHSKNtYl5GmS
         MNPO0dNKzSCTeE/3sBjr+KItZE7TAqYZP+En89GsD8TXiD37fNxvQ08ycu/HWgms8zjc
         iAI4x2CbK/5UmIFypLHv5nvcgjaYVuaTOlB5JKATjm7k9gYfrOArwHRQ5VZF0Q4EH42z
         j1RQ==
X-Gm-Message-State: AOJu0Yw7uJo2I+WGJ918Nu9JipQC+9SCEG5fIVVoDFJrVy8gmiNP7T9s
	o+lLEEJI3rZ6BLFFVKVHQ96KJThaSzIWRFqRaspSo4+wBol37U+WH0hMQzP88ypWhP4BuH/Ut2x
	blkA=
X-Google-Smtp-Source: AGHT+IEudp5sJnSFiXUp1gErWn0hIBRzUDkO+Jd51/fzpQP2fDczvRfxhxEdH8Fr+acSFcMyKtVSJw==
X-Received: by 2002:a05:6a00:8cc9:b0:6e6:c38e:e8a6 with SMTP id ij9-20020a056a008cc900b006e6c38ee8a6mr1461482pfb.4.1710366541399;
        Wed, 13 Mar 2024 14:49:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id it17-20020a056a00459100b006e6b2beb030sm87226pfb.48.2024.03.13.14.49.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:49:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 6/7] gnutls: upgrade 3.8.1 -> 3.8.2
Date: Wed, 13 Mar 2024 11:48:44 -1000
Message-Id: <d9310c3ce0f88798de6d2d3d0c600b9014c1d872.1710366394.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710366394.git.steve@sakoman.com>
References: <cover.1710366394.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 21:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197090

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
** libgnutls: Fix timing side-channel inside RSA-PSK key exchange.
** libgnutls: Add API functions to perform ECDH and DH key agreement
** libgnutls: Added support for AES-GCM-SIV ciphers
** libgnutls: transparent KTLS support is extended to FreeBSD kernel
** gnutls-cli: New option --starttls-name

(cherry-pick from Oe-Core rev 3c01bb0be8ddafa0aa1ad996ec524b51fd28f512)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-support/gnutls/{gnutls_3.8.1.bb => gnutls_3.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.1.bb => gnutls_3.8.2.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.1.bb b/meta/recipes-support/gnutls/gnutls_3.8.2.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.2.bb
index 455031dd47..43fb5c4c4e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.2.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "ba8b9e15ae20aba88f44661978f5b5863494316fe7e722ede9d069fe6294829c"
+SRC_URI[sha256sum] = "e765e5016ffa9b9dd243e363a0460d577074444ee2491267db2e96c9c2adef77"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.34.1


