Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E222ECA1002
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 00:24:03 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.62987.1756760957813947180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 14:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FIEsTCGp;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: m.kurz92@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61c26f3cf0dso7171192a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756760956; x=1757365756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qAYF5gfRJsv2zhDJKxeS0nJ9ulmPHigDclNFR4Tp0Pg=;
        b=FIEsTCGpswhP4Z/UAf+Bjsg7lNGHLZOP6CPYu8voxj4+QEVgGoGallm52NZZ96VvAo
         GI2o6+CQ205C/2RjV7HjvK6KPMizGernhh78ZP1OUstxPXS9gNoHsOFSgCEO+o71K4MV
         TfItZH+futKR9IeAUPNuboMp128qJ1vUtLDmY4DDadtorMuuf4wccHmIJ1yBiQHFbuKf
         TLpwmsMNVlFw4MW8UrFh2JBoYc/X2gmr7FZt7k0UUl6i2aC6CmzCOXs5LEVaHPbyqFZY
         uySvku14aU0M6SC47DVF6hh7vStLibJR0GAfldvWGHasEHZeU0fpVoYlpUkQTEMdeI5P
         GbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756760956; x=1757365756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAYF5gfRJsv2zhDJKxeS0nJ9ulmPHigDclNFR4Tp0Pg=;
        b=uPaH4HPTKw03mJ4AOIwQBhDj+cQF3lFzFijqq4VdiWpNaAKjSRmG7YzzB5zVK3UULb
         0LN8UsBiYRY76//pkfXcIoFthG2JjFrKnViGcOFCq8l+opOyDTMyTv3alaYIyB+MXtVH
         OhCtE3WaZv39wbKfB9H4kDRBTRuTvpoyaPYc8Wq8q24cZ+pbxQM/EevAKbcIH4+MoCIw
         BYbjxPCU6ECJdw6oNT9rGePRGtcGdI1pIVH1mJTk6tqGb5y8Umep3qyfWAjdsymU9Hd+
         xdKO2B6OUqO35eXnssC0UZ0VfnB/6OlWvdhU9Baz6ywpdotCy1DC0VHHMiAl7obWRsd9
         st5A==
X-Gm-Message-State: AOJu0YzI+xXEKqiVirn6NeMpKjsCEEbpiDzuCjgEpRNeXFi0RXVxSFZy
	JmwGlTFCUCXBFhkqkADT2fPmZzoECPcH/eBynWwZTm2VgIlYzdOaMjhrEL5FygAf
X-Gm-Gg: ASbGncv4a8jPldP6UdgwU/qWy6mRmBbtw1PMveZUG1op4NI6oMn/nTeIN+RBRvMEENi
	Ef0EWD/YIt3VenOl4qHHsvwWp6oqVB1QtzXFNiW+XuDL9HGNGsoN3wpzLAaRgH4epfHTI1qTOwN
	LbmmXoi+tVH5i/o984mwXZVsW+w5UcLix+ZmaXpicNSnNccXZaZX/+pBng02leSFOUziHOUCb7X
	3d+oCo+OP2+Cc5fdKjXEwawNn29VFPmCH3Zk5emGzKt+v52MkyoSYppWcgJuZ7r8gMjUWMmiI4h
	x4V1ifb5pOrDMryDU1StOIbQJ8B2HRvK1fAKWsXJATUzJ255ncHbUNhpLsbswhreAj3nPbKdTGG
	PfTX+nDifHCy9p9ZyMqY1uPPTwhSoonSRjrjzAOpSePDno2CTbjijYoEW1uMxeP8aHwZF+kQ8yL
	1dlxK6Fd3UrL/X9P7oBMwT
X-Google-Smtp-Source: AGHT+IHkWdgYS+kVwi/vRxMOd5E9Vk+c/h2+n0uYZy3KlOsxEL9q0BRa9AZyHqn9o1gaWPEjf2d/kw==
X-Received: by 2002:a05:6402:26cf:b0:61d:30b0:da43 with SMTP id 4fb4d7f45d1cf-61d30b0e1a9mr6691959a12.33.1756760955790;
        Mon, 01 Sep 2025 14:09:15 -0700 (PDT)
Received: from pop-os.fritz.box (ip-046-005-138-135.um12.pools.vodafone-ip.de. [46.5.138.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc52ae40sm7786141a12.44.2025.09.01.14.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 14:09:15 -0700 (PDT)
From: m.kurz92@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Markus Kurz <m.kurz92@gmail.com>
Subject: [PATCH] libpcre2: upgrade 10.45 -> 10.46
Date: Mon,  1 Sep 2025 23:09:09 +0200
Message-Id: <20250901210909.98058-1-m.kurz92@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 00:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222679

From: Markus Kurz <m.kurz92@gmail.com>

For the changelog see:
https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.46

This is a security-only release, to address CVE-2025-58050:
https://nvd.nist.gov/vuln/detail/CVE-2025-58050

Signed-off-by: Markus Kurz <m.kurz92@gmail.com>
---
 .../libpcre/{libpcre2_10.45.bb => libpcre2_10.46.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.45.bb => libpcre2_10.46.bb} (95%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.45.bb b/meta/recipes-support/libpcre/libpcre2_10.46.bb
similarity index 95%
rename from meta/recipes-support/libpcre/libpcre2_10.45.bb
rename to meta/recipes-support/libpcre/libpcre2_10.46.bb
index 4fbb8921c5..0d7823c079 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.45.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.46.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "21547f3516120c75597e5b30a992e27a592a31950b5140e7b8bfde3f192033c4"
+SRC_URI[sha256sum] = "15fbc5aba6beee0b17aecb04602ae39432393aba1ebd8e39b7cabf7db883299f"
 
 CVE_PRODUCT = "pcre2"
 

