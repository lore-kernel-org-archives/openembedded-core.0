Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2C8C47072
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:48 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.151524.1703864739112646162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V5clH1qU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d3ec3db764so19247795ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864738; x=1704469538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cl4SZSvk6tCpz7W4dW6Dmre+e1gVFGMK0xxsGkdqkO8=;
        b=V5clH1qUDwTSRTAUFePhpoES4Dy0euz2r0K0d0TEpSXNzZVbHGX+HnJx9hO5X5xjVE
         pF5iFqDuQuC7wQwzfkeDJMDBO/s2UiXR/4xCboaF7jqGTAOfk3uzGXzLslw9Yq1I9wmL
         sZYcbLqnG0lwOBpEurAEMl7A25fWqiFiw6M1VGL9RvtgkfuPGWZkNHVFhQ0BhbU7OLkV
         PvkXtYHmwP+a7NWiUv4ksRqVvaTqp8/9GWCwbX3/W4KaKQGSCfImZ+6E7FPqx86oIkKy
         fdAMczlcUSFe8G8m0xzsEKl6hZGVcEXmRxtps576RqiKb81tHOiL4/Juhk3x76G5O89a
         4QWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864738; x=1704469538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cl4SZSvk6tCpz7W4dW6Dmre+e1gVFGMK0xxsGkdqkO8=;
        b=wdG0GXZKJ3HDoHr9AE6A31uGeBuBhdf6mBUEXhI4kpdluEp8fbef3EIYnVSNfqtSh8
         s8iuhX0kHs9b+kJnoxA05a/wDnOkXtNwATOd/qPyCTbAiJR2SP1TFAW6SxDd9s+wtUga
         2SHtViRmTSm2wxGMF+H1+t9c+Jf9X5xDE4/mTCifCnQl6G/S9OZyBHxZMBy1yzyxkHYb
         HP57a2SUioTPeC6ALH2jpsvXJg90f9MAm/IV64FVvXdg0DWh1Bb432I8pVgm8Q3vx7XS
         jSQd9S9OvnN4TmWMnYxY7YHpWk07v/kAEgTXtnOqLAbw5juXz4cBPIYY+tBJKMniOhOE
         H3qA==
X-Gm-Message-State: AOJu0YwvFM1Zi5AfwRIB8GArh9g+W+kVLDgRcMNdqaWxpSI+pZq3LFWb
	Ux9DKXBaOndBvIe2DDF5Plt+ZU+xG6hkC2VUEgUs5DT7zwLv7A==
X-Google-Smtp-Source: AGHT+IHSFQkPAB/2Y3U8Bqi8V27L6yu7vmmjPWbuaeJCF1slXQStQWWvUCamttJQ7tHDD+PGSLDQWQ==
X-Received: by 2002:a17:903:a88:b0:1d4:5e24:b90b with SMTP id mo8-20020a1709030a8800b001d45e24b90bmr4155908plb.128.1703864737901;
        Fri, 29 Dec 2023 07:45:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 18/41] ell: upgrade 0.59 -> 0.60
Date: Fri, 29 Dec 2023 05:44:32 -1000
Message-Id: <2b799f27bb005a314ac87117ab2e9fc34be90fa3.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193035

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix issue with missing NETLINK_EXT_ACK definition.
-Fix issue with incorrect derivation of ECC compressed points.
-Add support for ECC usage from SPAKE2+ key exchange protocol.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9b13c1ffadda0893561e804d2ab789bf1c401d3a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ell/{ell_0.59.bb => ell_0.60.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.59.bb => ell_0.60.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.59.bb b/meta/recipes-core/ell/ell_0.60.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.59.bb
rename to meta/recipes-core/ell/ell_0.60.bb
index 0483dbe582..4e414f3b90 100644
--- a/meta/recipes-core/ell/ell_0.59.bb
+++ b/meta/recipes-core/ell/ell_0.60.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "370dc2b7c73cd57856017180a2a70a15ca1b0183bfd453b3cffe2d707c37da3d"
+SRC_URI[sha256sum] = "61cec2df694b548e51afa3e7ffd1e1ad31a9fea7bedb93a3a3cc60894390c70f"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.34.1


