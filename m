Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26BAC88E63
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:12:25 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6006.1789330335769707073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RmAwrUY/;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso3954885e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330334; x=1789935134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=50VlN5b4H8v7rUEBEboVbAr0MG61TecJOUgmBrJzTBg=;
        b=RmAwrUY/Y41nDfPnntj9T8WayjyKGSBq5osxlvnQnLnMN36HBLaWb8K+7DurZ8GL+g
         afpFzdYGOrrj1owHGwMhWZFrc6iwQPtMEIu+VgimyIEcBRrtjaVe8nGrsrpUJk4Zllcp
         YrQXXvjD/r7MYcsnJzWN4ccBC8ooGBEyeHSvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330334; x=1789935134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=50VlN5b4H8v7rUEBEboVbAr0MG61TecJOUgmBrJzTBg=;
        b=Sv713PGyzDVtgBaswHTVSrMMUxsqGvdFvhWZtuWWm005JoHMVcWtRyzOHfcf2qxQZc
         /cf+PNaYegs1CHxaVHk18wxq7bIstOGOcDwdNyhcUXzjzQnfdhDpjeH1pNY0Ilx1aeNF
         g4oyrgPyUw1WDL5XVudp81Etj0EPrawYHhGOLvNZl77IdHhMo5Sl4LWg27gobXB48Ee1
         fBKXKB/Qut8qDrRSxenpty8to6nnZsyGZTkM6ieIiPzD9JnuON/1P+QydeCGUkzB1Hcf
         NmVdZpzeXGawUdLS7eGb7U2+8FO7ITsmuWZlf7hMTXISIHS55JF0g9+mNN0wxlTyVNHA
         lxAQ==
X-Gm-Message-State: AFuF++ni/OW1xX97mK6hgEAUKT0ArtIaQI/Jw2/D5Bf15f1/EojBRlBW
	13j8iUEwTGTmhQ1UJkEgRr0YwL3tStQEy/Y2DRzYnN1zkHKJSu0Qwbx6Ngyb2T3QB9mwJMnVVDC
	1zI/R+CQ=
X-Gm-Gg: AYBFou0fCrJSuvNOsb8/5yifTEUa/JxsYFI/b9ViQoWY76k0hR/kAIAapikgTRQkBMo
	v7cuAqYQLSe8Zzrnz6tLHX27Y9PQZ7JKnhXcfDhcBlWwHxiUzUeATrD0hLwxN0W1icB4vjjbtOj
	dB4efAtFToMg5AE/ErcD9lWObTUOJS1E85/mdwz/78I2dd3AM0HipnLHsbkexRZJ2+XPjmbQtf5
	oGu2Aa6yurT6QkfJIDUuoDks3hmuvkP3W/HuVsqX1o+TMBnA7pEMfJaYE5aVfx/zAX5F52IleHG
	rmdxHVgp+CeIdEcajG+uJ6kDcA4+cLo6gDRMETf+AqZQrCdKOebRK4xYrME0woXQw098GCTcyv+
	wUvMax+ku1AVhJa+UW8szizAlgRGniaodfVmSrHIVN2vB0ELK41u0Bh8zvLvtqZbbmVb3mkHFpJ
	NVuDrmQZ5rJQH3AL3CJU99rlQb39xqIj2OGCBR0FWeDsNAKynE+4Fgfc05C7EgwW+jMEDMXCBIp
	S8yyMjkrPwt6JG+fPnCb2DJeaC5hQ==
X-Received: by 2002:a05:600c:1f91:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-49e7602cd63mr40530775e9.6.1789330333965;
        Sun, 13 Sep 2026 13:12:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm21613916f8f.19.2026.09.13.13.12.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:12:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/11] gtk4: upgrade 4.22.4 -> 4.22.5
Date: Sun, 13 Sep 2026 21:11:57 +0100
Message-ID: <20260913201158.687889-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
References: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245737

Overview of Changes in 4.22.5, 09-09 2026
=========================================

* Bugs fixed:
  - #8098 Crashes with SIGSEGV in `gdk_wayland_toplevel_remove_from_session()`
    (Philip Withnall)
  - #8222 gtk 4.22.4 fails to build on 32-bit arm (oreo639)
  - #8304 Css text-decoration rule requires a resize to take effect (regression)
    (Matthias Clasen)
  - !9538 window: Fixup pointer focus when unmapping a popover (Alessandro
    Astone)
  - !9886 Update Slovak translation
  - !9893 Update Persian translation
  - !9905 [4.22] gpu: Trigger cache GC from dmabuf downloading code (Benjamin
    Otte)
  - !9912 Update Lithuanian translation
  - !9989 gskvulkanimage: fix building on 32-bit (oreo639)
  - !10011 Update Basque translation
  - !10073 Update Belarusian translation
  - !10078 Update Polish translation
  - !10080 Revert "filechooserutils: Stop using pixbufs" (Julian Orth)
  - !10081 Update Polish translation
  - !10086 Fix the build with pango main (Matthias Clasen)
  - !10090 gl: Actually report partial damage (Benjamin Otte)
  - !10092 gl: Actually report partial damage (Benjamin Otte)
  - !10101 gtkapplication-wayland: Add a missing NULL check when forgetting a
    window (Philip Withnall)
  - !10129 css: Fix invalidation for text decorations (Matthias Clasen)
  - !10135 Update French translation
  - !10136 Update French translation
  - !10166 wayland: Fix munmap() of the wrong pointer in the dmabuf format table
    (Benjamin Otte)
  - !10305 wayland: Fix munmap() of the wrong pointer in the dmabuf format table
    (Benjamin Otte)
  - !10326 4.22: Fix CI (Benjamin Otte)
  - !10327 android: Fix other XML file, too (Benjamin Otte)
  - !10346 memoryconvert: Pass the correct pointer address (Benjamin Otte)
  - !10347 memoryconvert: Pass the correct pointer address (Benjamin Otte)
  - !10355 ci: Allow macos-arm64 to fail (Matthias Clasen)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gtk+/{gtk4_4.22.4.bb => gtk4_4.22.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.22.4.bb => gtk4_4.22.5.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb b/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.22.4.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
index 1d2e4bf9b82..5d7385d29ad 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "51bd9f60c7d23a665a556c7364c21fb2e4e282566b3e7e092455e8f910330893"
+SRC_URI[archive.sha256sum] = "7fd725deb2cb3f8dc218ad862c5056ff8548f49d3b0e4081796e444c22d19686"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 

