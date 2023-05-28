Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2C9C7EE33
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:18 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.33136.1685293690721399088
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Gwu9eI42;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-64d3491609fso1881024b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293690; x=1687885690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ellMAkuIGTqntcYG9t2uAd3fBGrIvVJX+WPeW4RlXww=;
        b=Gwu9eI428k38EjcG31A9jfYceYdONCAhHsaYY50zX1T8EYuumU3hZgEGp+h/2hiYsJ
         FgUqT8evXyUHMJtEuEy7IM7cXbwqMn9BkRhEu9j1sRMCpWUsLljF0VG040Rvm9IwyqHk
         cVGOSqbYl3cuTTQcyHqHi0QdJGAPQW26xOkaRgA1mWWQ1t7PZWmDjq0DnnUk/Jw04vmY
         1gItBdsdlFlsmR5HKryve0RHLbCPu8jyjIwQipKGz99CaZ9u6xp0+TM4qrQZgE9/22qQ
         9TTYbXyM7NHlS+CQCgcD//Dh9ep6HlKLiuseCMFjNIvLIx6NivehohKI/s0QJkmWTX90
         BZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293690; x=1687885690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ellMAkuIGTqntcYG9t2uAd3fBGrIvVJX+WPeW4RlXww=;
        b=VUUH0QsnPGJjj2n1SHzGCWujn31fdiUi6YFxu74zpWG61rKiJEgkUqU0nl77xbPItq
         lGrY+qgZ4ERZHte9oDesQpy7dzOGEPm7uzD+aKxlk2p7K+nbnaYnTK5P/Xv4xoeq9Fx7
         97StKt2C9PoD0Y75x6zByv1h+7EIN0gaCAsa6PaTJj2MOedJ1VN/i/iXDMTZPgj2/HxV
         ilL7G3OEZxy1d14cvRJS5GWSRBm3HxlV50SZ8bsbGXATNrp0VCReS2u6OSapOmLWkYaB
         lV5C791tqRWWJCmGcpKwIxlFhp8U0qOhjeJres4CkhlN93IjGAh2VYiuB5AowR5VcnlW
         c2jw==
X-Gm-Message-State: AC+VfDxT2T+h1qE9BoFCAPmRyZrMlVnXArMF78PEBl6slJzjCT+NFQXv
	MPtmA5lWaYlQHsS3xdWbl9KtH5is0iriKV415kw=
X-Google-Smtp-Source: ACHHUZ6Y6vXLrFg2XNnkLBbdUnlYo0ugP/JeQETqtSE5sJrukLdN5MiCLbXA1b+sQ25oCi1PEYdpEQ==
X-Received: by 2002:a05:6a00:170b:b0:64c:c5f9:1533 with SMTP id h11-20020a056a00170b00b0064cc5f91533mr12386085pfc.33.1685293689825;
        Sun, 28 May 2023 10:08:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/12] xinput: upgrade to v1.6.4
Date: Sun, 28 May 2023 07:07:47 -1000
Message-Id: <b9c32ee7412985805e322a7e7037dd2ca541e8fb.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181839

From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

Changes:
Use xz: upstream has not released bz2.
Update sha256sum and md5sum for new version.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4080fda237b8c7c540b54b7abc2075fd40a684d4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-app/{xinput_1.6.3.bb => xinput_1.6.4.bb}            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.3.bb => xinput_1.6.4.bb} (64%)

diff --git a/meta/recipes-graphics/xorg-app/xinput_1.6.3.bb b/meta/recipes-graphics/xorg-app/xinput_1.6.4.bb
similarity index 64%
rename from meta/recipes-graphics/xorg-app/xinput_1.6.3.bb
rename to meta/recipes-graphics/xorg-app/xinput_1.6.4.bb
index ff1f1c9148..f5e3f5da12 100644
--- a/meta/recipes-graphics/xorg-app/xinput_1.6.3.bb
+++ b/meta/recipes-graphics/xorg-app/xinput_1.6.4.bb
@@ -8,5 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=881525f89f99cad39c9832bcb72e6fa5"
 
 DEPENDS += " libxi libxrandr libxinerama"
 
-SRC_URI[md5sum] = "ac6b7432726008b2f50eba82b0e2dbe4"
-SRC_URI[sha256sum] = "35a281dd3b9b22ea85e39869bb7670ba78955d5fec17c6ef7165d61e5aeb66ed"
+SRC_URI_EXT = "xz"
+SRC_URI[md5sum] = "8e4d14823b7cbefe1581c398c6ab0035"
+SRC_URI[sha256sum] = "ad04d00d656884d133110eeddc34e9c69e626ebebbbab04dc95791c2907057c8"
-- 
2.34.1


