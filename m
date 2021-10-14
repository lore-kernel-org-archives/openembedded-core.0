Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AD2C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 20:26:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.465.1634243192951416006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 13:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W7fbger0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id u18so22554670wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 13:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ypGvT1o2yIwXcgI6O6lMcYJbo6ieS53dxV7ALbvv3bA=;
        b=W7fbger0ryOzSQhjfxwn5a0NYhO9xT2dmChWUE6AyF8o5KXncmRb1HtO7h4K72zAks
         J7kLmS8/gCsi4pEIXd6sMMHR19LxiYss62HSSTL404pJigR/TWweSt0Nl1ioGtIeDpQl
         9jbsYzgjut0vl/dsQJBI5/jYZpnF1Lzj1mXj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ypGvT1o2yIwXcgI6O6lMcYJbo6ieS53dxV7ALbvv3bA=;
        b=cFyZVbu33nzvS4UMRdsBScld8L2GGP2fvGGdsO8+EKKGo1cXAus2vCLT3W0vymiKGW
         xW2c1sKZg6893eSXyGhq+bkP1lYXEIbvbb4BhvlESMBP4Jv24UD6zXhpg9PgbBD/1pID
         CC7P6WPIKmLA6bwfNa2sh/WWbCUBCnEzjvuHx4jjKW/Gz/x8RLPaCksmCN4HZy8EpPJD
         Y8j42K1IlYxBp4/ApGz9GVqJdoJCkFTKIVmBhte+b6kBC7kiG12hVgwXbHvBH7n8jPx1
         +CZvoXut5ORL8i4fr04nk6GtMiWy1pbPhxJwM+1rLbfiX870s0kINHlRsJjy84zVWUE1
         KBtw==
X-Gm-Message-State: AOAM533uZivT1nXpiA/gSEHBaMj+sGsxKXg4/QlebxJP0Nci67/0vN+j
	ruozZZeZ19jgLk3/8twS5G+0Y4P3F1F10g==
X-Google-Smtp-Source: 
 ABdhPJwj+BY0aAJkIjxBh+xefrcmgNmRllPdeXMQY3agbOyljYhd8VbQMMnfQIMAEuBhqA6eIHqETw==
X-Received: by 2002:adf:8b5d:: with SMTP id v29mr9529384wra.175.1634243191133;
        Thu, 14 Oct 2021 13:26:31 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id
 u2sm3063516wrr.35.2021.10.14.13.26.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 13:26:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kernel: Rework kernel make flag to variable mappings
Date: Thu, 14 Oct 2021 21:26:29 +0100
Message-Id: <20211014202630.2927426-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 20:26:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156972

In 2017 we added changes to pass the BUILD_CFLAGS into the kernel
via BUILD_CC. This isn't really correct and the upstream kernel now has
places to pass build cflags, ldflags and more. Update our kernel
make flags to correctly use the kernel's variables. This addresses
concerns raised by kernel developers.

If this breaks some usecase please report it so we can work out how
to fix it properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5faa302a165..23eed699b57 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -226,8 +226,8 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 # Some Linux kernel configurations need additional parameters on the command line
 KERNEL_EXTRA_ARGS ?= ""
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
-EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOST_LDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}""
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
-- 
2.32.0


