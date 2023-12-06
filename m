Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC3BC10F07
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:56:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.32054.1701870973549472568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aBENVaao;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d0bcc0c313so17708435ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701870972; x=1702475772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kW5Lve7qI9OpKfNY1KPLWcf76FRMj9SPgU1yTeaaZx0=;
        b=aBENVaao3VPA2u6UJ1DX1ISCBBbDRr4IPXXPJJW0Sm9bBOg6LMxrUXNQtFixam77Ly
         Lm3mKmftg35I+xTtw8fPIDy4wqQR6DnLiPSCq05qwXU5l5i6I/xws1L04wF77SYiiyFN
         1hcT4s4R4PLsANnHb0hsGk/mhTx8EUeQaJU3dknX9uoRNwyIFre0rbqZ4fmXeUNFxRs3
         Kjii6OfJBowINSInkb34d2CW6z5Pcj7Lg8i9s76kczWH+zIRSqJi40lACp63Qt00qFIx
         tptJVhSgVvlPk57bweVU3Cj9hoOl3vfe0kNeSmrKzZlRKhC9IECOf1/FKlfHdQiN2oVV
         3Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870972; x=1702475772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kW5Lve7qI9OpKfNY1KPLWcf76FRMj9SPgU1yTeaaZx0=;
        b=srOVaxxhxuBWgpHqBMBsH3M61k2MhH0PY42mcS1QBjDH6YCbi/B6flHtBf5fmI4zcq
         NeIk4a0aHOrV0Bl631QtSl+TPevAzQNJKa1K6J2Sl29nfbXcetzyhuNRBdrK4En5cvCW
         DSRwg6BJw9XS7fqK8aD4eMw6RbBHr+o/QSovWL73uPzc7ORBtBqXOe1XKA5PYgibmIOW
         USPEeFEl6sIfLS4zUvt2EYfHVZgtfMH1tYCM3RgD9RMAt1FNSnTHEPeM+8LTRL30lukn
         KDT2Z+SDuQbzRCRyU3rYz9PiHZbr3XDnZgvo7bauIIbwKJ+piAKlY4TrdpavpEaV9uTl
         K4Gw==
X-Gm-Message-State: AOJu0YzrWyzVCea/+QCHRfdJ1CGss9wAg0j1bXxM8a9Mvc3OQkqP9Yoj
	hPFo+0ITWdYTjP5ohnt9pJ0OGa3q4EPUgKOKT0A=
X-Google-Smtp-Source: AGHT+IHbKG97znL845WXypDLjxhc7vFfwoH7La6NSU0BDVi5lM0R7Nn3Bdv5Rl7QXWg4lfYTpbz7yg==
X-Received: by 2002:a17:902:c402:b0:1d0:cfdc:10b8 with SMTP id k2-20020a170902c40200b001d0cfdc10b8mr628627plk.76.1701870972235;
        Wed, 06 Dec 2023 05:56:12 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902680e00b001d07b659f91sm7887650plk.6.2023.12.06.05.56.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:56:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/11] vim: upgrade 9.0.2068 -> 9.0.2130
Date: Wed,  6 Dec 2023 03:55:50 -1000
Message-Id: <9cbfeac4aa8b9d3b8e73b27ac32a015b7982803d.1701870718.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701870718.git.steve@sakoman.com>
References: <cover.1701870718.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 13:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191893

From: Tim Orling <ticotimo@gmail.com>

https://github.com/vim/vim/compare/v9.0.2068...v9.0.2130

CVE: CVE-2023-48231
CVE: CVE-2023-48232
CVE: CVE-2023-48233
CVE: CVE-2023-48234
CVE: CVE-2023-48235
CVE: CVE-2023-48236
CVE: CVE-2023-48237

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5978d565a9e700485fc563dfe2e3c0045dd74b59)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0662822202..e6735d5881 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2068"
-SRCREV = "9198c1f2b1ddecde22af918541e0de2a32f0f45a"
+PV .= ".2130"
+SRCREV = "075ad7047457debfeef13442c01e74088b461092"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


