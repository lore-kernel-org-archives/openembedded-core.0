Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC2BCA0FE4
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:27 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.707.1755790817882586538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CoszVsz2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-246151aefaaso5181575ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790817; x=1756395617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ams4DOQu9Ln0Rs0orrwyk0xhVl9TdnfrLemi7D/gLcQ=;
        b=CoszVsz22Hs38WMynkYs8TTRDY8YrJrb2tPd14LERX4/gqi7tHC4p2al7aiGiSTyeI
         qXufiujxRTIFYccfR9o1EQSpTKnGntIFz6lGg3GFBv4CgWx97QK59ej7W1ie5zeZLIvj
         nRdU3gexXYlUMoQugkW09SU4AfDYNk5aIbsC15C4RVjRUnDSXh4u/+RLOCWb6hw3EJ2V
         gz3wAv1XQvTBjOL+DajnzI0Yd3fZ1K/ye4OBzeYoWi546v69SFMXDhkNQ4ARE2uBhNBV
         BX+AWXmmm8IHKGDltkmGM0oKFtfG7r2uHsglqp0HW+Vx83i4k9gSm0uPcUScbhEWlkii
         LMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790817; x=1756395617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ams4DOQu9Ln0Rs0orrwyk0xhVl9TdnfrLemi7D/gLcQ=;
        b=WtkVYbQa5r2jXNFJOMmeenDbI27ftqTMBay5iwkrQuM2Iy46ftY3qv/gs0PfdCMae9
         DJ3QT+rFuHWS4HYe2CSB6/pl7lRTS8nCbbrJQkmFEPCAV7PsN2PKxKinK9S6G97DXuDC
         munyRX+GqiRrBBR4MFvmy4tCHjw8r7pBbq/1BSfm5mkFqIm8HTgu7KZyNvwhTnHrpDy1
         lQ3WQtDFF629r4oDizXD1wC7Tl+4idbT6F1oPnLuozJY5GluKOOffY4j+n0l+6eByIEy
         i5k0E9fVNeweBZ1BMRRJQQAMN40JhU2GokIj8/WD+jOTS1dgeY0Xt1fy6NwAE4IHqQg6
         BzLA==
X-Gm-Message-State: AOJu0YxUiVN9JKr0iKmx034y+UzA8zdAuDAZyifu5BUKh+CudvOrzkA1
	3196drlc3QUCFP0hgL2QQqeqIrGKiZqBgAPIT8FbFhgtWGUIdmk/lHwsZgA+9pSwIx7ylrIwjDT
	V7cA8
X-Gm-Gg: ASbGnct9JzIvnk+cBpaMEDU+wb+U7VTpddAcLliG+TCN9it7MER7piUl1t9OqWsw8hn
	9X91RPlQlkeQUvIgQzyEx8D5X/xWyyzZvZMZOR3O1jS9coWpuz4JSNbO5gVHtwwDZw1MNnvoyiX
	dcIg/e86YTw9JmZAGl0Vvq44RStWfiRd4qa9bKoXiusiIkL0puxKfsWBwvsSfTxeE+1yRAwlK0T
	JCoujftXEFs9L+b48rHSob2Bd+EXOC4KHj7QDb5+ToOu7rSwR8D+LEQNDc6cLGLYdNpxJcJuC0x
	OKpE0b1ZzPSAz/2XMSCL0f5PwBhdsEOnLvglZPKLa1fRZBRJh/FrZGMG7HGMsQbF6ZbRL4H92Kb
	j7Akqf86mCCaDew==
X-Google-Smtp-Source: AGHT+IFYj5Sf5hMahhwV/6Y7fATCDWTQeshY6IashlUV9ARim5rzdtxhJP73MeTx5NIgBb3DZ2dQmA==
X-Received: by 2002:a17:903:166e:b0:23f:b00a:d4c with SMTP id d9443c01a7336-2460616a7f6mr37603455ad.2.1755790816905;
        Thu, 21 Aug 2025 08:40:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/15] glib-2.0: update 2.84.1 -> 2.84.2
Date: Thu, 21 Aug 2025 08:39:49 -0700
Message-ID: <45419176357954027607c7f92fd5ad11b5e87a42.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222257

From: Praveen Kumar <praveen.kumar@windriver.com>

Overview of changes in GLib 2.84.2, 2025-05-20
==============================================

* Bugs fixed:
  - !4576 Backport !4575 “gclosure: fix ATOMIC_CHANGE_FIELD to read vint
    atomically” to glib-2-84
  - !4595 Backport !4582 “Windows: fix wrong typelib path” to glib-2-84
  - !4614 Backport "gstring: carefully handle gssize parameters"
  - !4616 Backport !4613 “Update macOS job for new CI runner” to glib-2-84
  - !4623 Backport !4617 “gdate: Call tzset before localtime_r” to glib-2-84
  - !4639 Backport -Wsign-conversion fixes for g_get_locale_variants() from
    !4590 to glib-2-84
  - !4640 Backport !4620 “glocalfile: Disable faccessat()-based query_exists on
    Android” to glib-2-84

(From OE-Core rev: 3deb6b59f3fa91d4fa755f49dad4ac62c3a518fb)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{glib-2.0-initial_2.84.1.bb => glib-2.0-initial_2.84.2.bb}  | 0
 .../glib-2.0/{glib-2.0_2.84.1.bb => glib-2.0_2.84.2.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.1.bb => glib-2.0-initial_2.84.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.1.bb => glib-2.0_2.84.2.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 4368e51df8..819f3ff50a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -234,7 +234,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "2b4bc2ec49611a5fc35f86aca855f2ed0196e69e53092bab6bb73396bf30789a"
+SRC_URI[sha256sum] = "88e960dd937057407d61fcb3b45a860704b25923c37ae2478b85f2ecb5a4021f"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.43.0


