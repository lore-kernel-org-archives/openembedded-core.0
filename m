Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6823CCA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:36 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.64604.1756215687640249747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jqaaZiiT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-323267b98a4so4587164a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215687; x=1756820487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9t3WPgzDcULs+tcKtDzIbE3oKgKpR2SYpniunFoez/k=;
        b=jqaaZiiTsKf2EyvqjHZgSXrrpjSB2+cxJ8XRcHqkyzqhiYQ9WsDR/hx8hMmKmoLZ2a
         sdbLrWXc/xcW/s4MnJvzdh2xt+qEYmH5M02HFRctt7dNeQdAR6TNU4/iKz+QvaTkGImF
         +CTPeXyBdo3nsJXZaiaEhpX2rb8F7l2+2ZB7YsljttvpbXukjOge6ONYKxHLQ2gW2u86
         KXzRYDktUNgbmkTF5Ot+CJ5XHZDr2oxLxZLr3BXRxl3eEMh/pe023tsydmcfRE9blUKe
         N2v3NjKmMKYAy+S1img/IwWWg/0OcrL9DIfRd5FRysKkOKGbO15Nzd5T/0wLnLW+6nuj
         qaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215687; x=1756820487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9t3WPgzDcULs+tcKtDzIbE3oKgKpR2SYpniunFoez/k=;
        b=wnQvOATMAJeuaZUNNCwAnOA/YTkwuB5AjNs0fyOT+qNCG5BezC1AmC7D+E/Z30Uqz5
         2nafpCV3ZSxQ5M+l7q6XYjV/oq/CFsvGZao+9rT9ElciNodM0eks5Q9oT5QQTH5j0s00
         C7ea5zp9fKffda5YTGkP+4UKy/XOzMAySwxwCGU0pqo7TQFLDhjY/7WfUX79mBpjMuPR
         CiegHhx2z/k5TPPv0ghm64wO6RY5zh+xLG1gbGoCb2cqXlIQ5+dLcP1/oVDvxeB+urlG
         jJ3YPEXGRcWsEeXpB8JWaI+VAKK99QOVXRbeG6uHIft86dMU6y0OpNdcfzQfqI3/93XU
         tiqw==
X-Gm-Message-State: AOJu0Yy/GMGSMKUSuPLBLdZyTPcwnJQlO9pspiD7GE/MJsVbCFcnidis
	Vb5PzrXHbncFRGKr4aRaptj+782hfQ3jTjyxuFdZTudRF3clSQ10CdGeKF2CRJOicx1qMZhYVE9
	hFlTt
X-Gm-Gg: ASbGncvGtumupHRRHYr2XBe1gb7z48j5sbnULvjeUModDcWwXWcGa9Rix88J44Qwgdb
	LiB3VWnHU4TSODHqzcSCA6j0Jb0bdLcECQUOmLFtfiZw1QGI4yX8RIoY9iTE3+SiM4jiblL9Dln
	IstM16jyY7hkk5qB9tn8t9JyIyyHAanEkyJnGjW0jQdhBJklA0OxO/RbrDv0ZN/kW8C+5+c15Bn
	k14gkjhsMvakBAxjqaVpVgEeaBQzzEOe17E+LdhNDa63F7abF8Mqx1NUhVx0vL6Xw8PfLtmwSz1
	RZP4+m6aU+9ZM5qHOssMvcVNdF+4XrplkKiGufZTDpxQqGgpqumdgzzluS62xPB7qntfLdPm/7Q
	FZ42u6/9Zb9OhPg==
X-Google-Smtp-Source: AGHT+IFSgs1FovZs8TSOAYEX7/SUic9g6ibfmj3savikSPLuz/g5zbFhJXrXnXbOjifj+Eq7eHyYjQ==
X-Received: by 2002:a17:90b:1b11:b0:325:42f8:d73f with SMTP id 98e67ed59e1d1-32542f8d954mr17787524a91.17.1756215686723;
        Tue, 26 Aug 2025 06:41:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/19] gstreamer1.0-plugins-base: upgrade 1.24.12 -> 1.24.13
Date: Tue, 26 Aug 2025 06:40:45 -0700
Message-ID: <7b024f5983e83fbde68aaaeaeeff4997d22ba825.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222451

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ins-base_1.24.12.bb => gstreamer1.0-plugins-base_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.12.bb => gstreamer1.0-plugins-base_1.24.13.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.13.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.13.bb
index f4505d831e..ee722056af 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.13.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f6efbaa8fea8d00bc380bccca76a530527b1f083e8523eafb3e9b1e18bc653d3"
+SRC_URI[sha256sum] = "31a4a34e02df0471274fd0e8016495475b670320d20a3349faf0634340166c42"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.43.0


