Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B973C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.4679.1741809190557352632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AitRYRuu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff80290e44so656659a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809190; x=1742413990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvvMw/Yrihnu0256qsQk9zfyo2QxcRR3HvUIVoh9wbQ=;
        b=AitRYRuuTS7EF6EHCTrD1h3vcFjxRrAL2UJITYRTEyOFFiP/qsrzmywm3vuM7T9NW4
         X4Iy5nBk/mjojZtG10Y8H1SvElfp+ByE5mznjVYkVN16owDWow2yQuDYqgCePkldz2J6
         31k7MmQniSjAYTM+NNnOxRC7295gF47ZohMEKs7CLF6meSyl2nEQo+qVVmCg0nLlDU5e
         h+x3PxJILtFKzZaf4+Y8xqnlPDOB/UT4soAHVOSUR8Vz1SjkVT9h9JMLpUrsl1n/gAXH
         jYhwTMx7OzEhcEBlIO1ZfjiBd3UwA1YbCjMJOZ8WEhMjA1nPJWH0UsMJn79qVMoQYCSf
         2W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809190; x=1742413990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvvMw/Yrihnu0256qsQk9zfyo2QxcRR3HvUIVoh9wbQ=;
        b=QNE3al5wX2er1xizR/1i6oT7ewUtP/Y3XIqirPFIyikfbw2MN0Jd/XVwyUPgMmUbie
         ek84nEJUC63BcnMWnsFYL9x08inhcPA/dyd8HwJCGyvop/6KnaN9Z78chdXCSOFdvbWy
         mbrqzpP7DLuve6JFbn/g7JQq9NWClHlmUuRtZG2sEi94Guj1UtVVKAZPMLwCKo7NsA/x
         G9ueCfDfuWv+eJNnanGntz0NtR0/jYc/hU1jaaB4JVs71/OlFCQMKHj92oXqCFi++yLv
         oDWbYZ45dYJNCFFQbDmUyxYkgTIQwobiUz1voB5rN3Tl+96koYQvBSryb36oq5No2sQR
         UVgw==
X-Gm-Message-State: AOJu0YykOWSYaAr27y4TyU3FKfFPn0zPiU2k4Ioz3TGomO2LzoaOqJ25
	zh2JXCPvGZRiCrvUrppqvuk2Dii5hX1MEIj9yvyF0Um0almT7aGf9Fl08vxDyl+e/W2K8UT7i3J
	G
X-Gm-Gg: ASbGncvktROfcczO6Do//dMni78ihljTxRezAFuTNg8fS4GEo4ZIoeYHXA+cTjwHer9
	jdKcnpfWqeBMFXM4dIGJ3NPBpU4XA9QfrCv6V5Oo2jMk+6tK+LbYknS/IV6TgGwjE2cGO1qX+Un
	HY6BPgolJlxl/RmeoG9AqScOQN4zMbZjG5MbBRx93p4NGT7IAfMXJ0XvTzwdFu8ULwALWtTOOOc
	h9AD5VT027MkbVLSASFk/2RdyVtkDH2g6urP70aVFWUAY2Icfsao0RHOlv5lw669b/vUTclyUC+
	Awhf4DHMfNBtjOIbgbBfA41E/utafRLeW4I=
X-Google-Smtp-Source: AGHT+IHn0Kr3U1y5qDAXQUR/0UsqBNnJgi4M7sQ5QV2a1vgh0Mr+CSt5KZvjrUIBVliwpx2x1BvT9w==
X-Received: by 2002:a05:6a21:6f13:b0:1f5:67c2:e3eb with SMTP id adf61e73a8af0-1f567c2e621mr27172265637.41.1741809189889;
        Wed, 12 Mar 2025 12:53:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.53.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:53:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 20/25] xwayland: upgrade 21.1.4 -> 21.1.6
Date: Wed, 12 Mar 2025 12:52:28 -0700
Message-ID: <57c278ec18eb2daba8bed1ea96f924491e11a78e.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212687

From: Peter Marko <peter.marko@siemens.com>

Handle following CVEs:
* CVE-2025-26594
* CVE-2025-26595
* CVE-2025-26596
* CVE-2025-26597
* CVE-2025-26598
* CVE-2025-26599
* CVE-2025-26600
* CVE-2025-26601

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_24.1.4.bb => xwayland_24.1.6.bb}     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.4.bb => xwayland_24.1.6.bb} (84%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
similarity index 84%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
index 6f8589ba5a..0774c1bbf5 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d96a78dbab819f55750173444444995b5031ebdcc15b77afebbd8dbc02af34f4"
+SRC_URI[sha256sum] = "737e612ca36bbdf415a911644eb7592cf9389846847b47fa46dc705bd754d2d7"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
@@ -48,3 +48,7 @@ do_install:append() {
 FILES:${PN} += "${libdir}/xorg/protocol.txt"
 
 RDEPENDS:${PN} += "xkbcomp"
+
+CVE_STATUS_GROUPS = "CVE_STATUS_REDHAT"
+CVE_STATUS_REDHAT = "CVE-2025-26594 CVE-2025-26595 CVE-2025-26596 CVE-2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 CVE-2025-26601"
+CVE_STATUS_REDHAT[status] = "fixed-version: these are tracked as versionless redhat CVEs in NVD DB, fixed in 24.1.6"
-- 
2.43.0


