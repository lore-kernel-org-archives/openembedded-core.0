Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C63E6917C
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87676.1766434092461258087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ArQ5qQ9x;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso5793892a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434091; x=1767038891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n669pYwi0PUJIxIhQdOgPPouuqXlqdBlRJK+B0HBOmY=;
        b=ArQ5qQ9xOOcwiFAiuzTXWiVNS3xs1B62mF4aP7IAqZRy6CC9irb1l1Y4XtWm9kkz8z
         b/PMrjkz0eZjNzrFYWwZ2MD6WNJyUV/ZLl0Id+XThovtQezVcLkEB11A9DQxT6I/h2Ts
         f3N6mG37Zz7VCipXMJeSOZi6jPND1nI9fOUco5Va5bSekQB26RjLHFq2r+zesLAje6iV
         aeRk7csrYO+zRXvCUbmo/N49PdZzwsOEDN7P+5Yk8l3RZSOeKYQJSIsFPcEbueGJqPIs
         w2cxPT0AIO7BsgS+x7lI1ug2ITdEPNPWfjZmzBjhxbTn0FRBLZ2wwBPNyGOx2ZsJtF1w
         2Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434091; x=1767038891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n669pYwi0PUJIxIhQdOgPPouuqXlqdBlRJK+B0HBOmY=;
        b=ZDaTK1sCxW+H+l5BFL99omG1WwCTOg5N3LtITVVdicuAp1OcSVJRcnBDhO8gNS2JIz
         rk28JqpMH0fRvq9EenC5CGNd+eN8pSdIN4Ekeme2BLq2ZsDcJV5L7T+qGlWYaeiYsmEN
         6yhbHNWvn0pOsOIODvTqOKp0IXztzkzSQd2A12RA+DPrR6J5cU33ZKpXTsU6penqHSzi
         JAZlFwzPk2sxI+lMuFhefksuU5bG/Uq1zgRBhC7Rx+lfWYE1FJZRizL7m5kgbRQudooN
         yGWMUO73/QfpJ2sDKyDZC4sej1zKaxWr8azsLxrvrrzf76ieIK78wPwDvNSQUBYmu9z3
         cFvQ==
X-Gm-Message-State: AOJu0Yz8k90REeIudlux6vfITJAGZoVFThFvvAT6vvdaGiYXwAWsj1Or
	1TSWvkHvmSPRPc1as72ZXwHEoizpwW54Br+hsqNGXPrgp4pBdEForUc5DnW/Fw==
X-Gm-Gg: AY/fxX56+JbkX2PurmNbYCu9nl92UKfIHJDhrKXq0YpoQxBO0rv0dX67xGR30+HQjpr
	EDEhNFKph9YRc2kUdmNCttNV+lFXxp1XTvCIIQK+jjXmHvSqd0kKhLz7XLA3Y4Gcxep/KFK7xya
	kQZLNr1BILwTTlUvaCVz9YtXTb3Vpge8uTVV+XBC45HZ/k6uuGeW+gY+FtT7bh0waXcmUM7xPN7
	O3ciXQfQU73D5xa+duPQ3umrhGnlGANEYzGjKbjV6TjXNaZYpvjE+JozNmALYuNcui4RFbs8B53
	uO+EbUAs3B57OO2Hek7ZCzffpi5TG4bx7DAoN2OzRajqcGvX9sjgwcbgGrSecWcfNqOBDnfDLyk
	v2Lbmks8q5qrfEy7ZY83LbY50nWKwE2Jq8QIL9cA6qrLEb74ZfBFslN3ymKL16JKU92g4e8fzIM
	kktin0lUu0wBxueF7WLn4Fg2KKGr4J45SKHBSWDRzWHF4N+Jc=
X-Google-Smtp-Source: AGHT+IHVh0mA5QjBa+/nmwotV7yRLlMkWpJV9y/4bHlHQgrKzEvbM8LDWNcaIc21g1ysMNbBJdNJsw==
X-Received: by 2002:a17:907:3ccb:b0:b73:8cea:62bb with SMTP id a640c23a62f3a-b80371a3d87mr1359367566b.31.1766434090643;
        Mon, 22 Dec 2025 12:08:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 035/114] libpcre2: upgrade 10.46 -> 10.47
Date: Mon, 22 Dec 2025 21:06:17 +0100
Message-ID: <20251222200739.2278706-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228360

From: Alexander Kanavin <alex@linutronix.de>

License-Update: additional files under BSD-2-Clause and MIT
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libpcre/{libpcre2_10.46.bb => libpcre2_10.47.bb}      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.46.bb => libpcre2_10.47.bb} (85%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.46.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
similarity index 85%
rename from meta/recipes-support/libpcre/libpcre2_10.46.bb
rename to meta/recipes-support/libpcre/libpcre2_10.47.bb
index 0d7823c079..98e3c716d6 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.46.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -7,15 +7,17 @@ not the original PCRE 8.x series."
 SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE.md;md5=8446a1fd12e40d9d64c79234fbb1f812"
+LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT"
+LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
+                    file://deps/sljit/LICENSE;md5=97268427d235c41c0be238ce8e5fda17 \
+                    "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "15fbc5aba6beee0b17aecb04602ae39432393aba1ebd8e39b7cabf7db883299f"
+SRC_URI[sha256sum] = "47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.47.3


