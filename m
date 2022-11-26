Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE5BC4167B
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:36 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.70828.1669472132129867342
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=52UjgJWI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id a1-20020a17090abe0100b00218a7df7789so9991324pjs.5
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJfEm4cvf5jXuH89l0BDzRw8IzjpsFJOPmJ3zP8P5hY=;
        b=52UjgJWIXnOjGlezZvEcZJxGFne3d7Q8Wir97oAZMD2+FMmUM5fNa/iq/lPRv+p2V+
         kV4Gz/to07kEuJJUOkWNMg7EO/jFGfhKPV4+tzpxSGIlodzIei1HLwR6Ct1DWvcZRxg+
         JkPpgSFOkwE/0GEffA3TUBHMmW8SXiMCPWp7+EEf0bF74J65Uqcxclsv0cHZYeNKpKnz
         o22ijxwc8DHIxUWelEzhV48SoRloHPRe8zhCr+IqmH8g7Gp9kkS25NoNIAnCcoWgO7E7
         mXAEFvKUFxzLfE1MYKOc0Nd98+1ZpwyEP/V+uYGIgrhTADgvdEshDB8PmvuAcKK4KHX6
         JrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJfEm4cvf5jXuH89l0BDzRw8IzjpsFJOPmJ3zP8P5hY=;
        b=OyVdNfqWtvnca5C09sg1nUKR6fN8JSTIpgz78xYK28Ud9/jMcZPA1do7gkV1PtqTMh
         loGTPJvJY2cRUOgMWc+ucrjgT3NvEh/BlB7cwevLMAezS3wzUMl6g6JYT79j+EIDlrhk
         rtzpHnQVyRILXI9QIv2FOkR4poyGDtkFA9B2KX1Ghle3CZxv6v7psZZjOLQhXBFDvk3T
         FYl1vWGtpRTgtQmBPy3CveGQMxIo70cEJ+pxDYcSY5f0iufb/SI3D3KthZoG5OXIGxu4
         7mpRZgjk19Htwio4lFSTMPpIchUDl8t6ZFMnpGQyNLT2LJ4xbkqHO2Ctmc1Z5E1gujAn
         vv2w==
X-Gm-Message-State: ANoB5plIzP9+fatkMl6+2ApctqnAzC7ik5SsDVXJIxw16kZJokG6YWJI
	MP1j0dRj/kXgtf6ooSDGR2GSBh9aq57ybTVwymg=
X-Google-Smtp-Source: AA0mqf7gt2caCiT2+NvuSOIx77bwTTWufononmlAwpKdWzD+6Fq8D0NxrhIyeXmPM5PzAs4mw13rzA==
X-Received: by 2002:a17:90a:7804:b0:211:2d90:321 with SMTP id w4-20020a17090a780400b002112d900321mr51729881pjk.84.1669472131240;
        Sat, 26 Nov 2022 06:15:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/37] pango: Make it build with ptest disabled
Date: Sat, 26 Nov 2022 04:14:15 -1000
Message-Id: <0a449acddca1ba9022c9ffd8af0d9ac5ad2c4e4c.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173804

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This avoids the following error:

  ERROR: pango-1.50.11-r0 do_package: QA Issue: pango: Files/directories
  were installed but not shipped in any package:
    /usr/libexec
    /usr/libexec/installed-tests
    /usr/libexec/installed-tests/pango
    /usr/libexec/installed-tests/pango/nofonts
    /usr/libexec/installed-tests/pango/nofonts/fonts.conf

Also use tabs for indentation of shell code.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4bcd4050a6a9b6b1cb8e68b2053523cc0501814)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/pango/pango_1.50.11.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango_1.50.11.bb b/meta/recipes-graphics/pango/pango_1.50.11.bb
index f545689811..f982d9a65b 100644
--- a/meta/recipes-graphics/pango/pango_1.50.11.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
@@ -38,13 +38,15 @@ PACKAGECONFIG[thai] = ",,libthai"
 GIR_MESON_OPTION = 'introspection'
 
 do_configure:prepend() {
-    chmod +x ${S}/tests/*.py
+	chmod +x ${S}/tests/*.py
 }
 
 # https://gitlab.gnome.org/GNOME/pango/-/issues/713
 do_install:append() {
-    mkdir -p ${D}/${libexecdir}/installed-tests/pango/nofonts/
-    install ${S}/tests/nofonts/fonts.conf ${D}/${libexecdir}/installed-tests/pango/nofonts/
+	if [ "${@bb.utils.filter('PACKAGECONFIG', 'tests', d)}" ]; then
+		mkdir -p ${D}${libexecdir}/installed-tests/pango/nofonts
+		install ${S}/tests/nofonts/fonts.conf ${D}${libexecdir}/installed-tests/pango/nofonts
+	fi
 }
 
 LEAD_SONAME = "libpango-1.0*"
-- 
2.25.1


