Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3885BC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:05 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.31271.1750195262600809379
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LMsPObqX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742caef5896so5174852b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195262; x=1750800062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYlAxPuXA8dnfmu8i+wfbdgDc6Ycx58eTjl1jZj+m5E=;
        b=LMsPObqX388VTqFXkjL2DvZrezEnlEfDSNCDcCoHm2nXlKCijHQITkmnM2uvsAnfGU
         PIUvmsJ/yeFJMTV/PpomP2BEQxnjf0RDNMK/8IMsGs136u+DyugBLvrqtGDat3tVNlKx
         rB3P9p/UAVAv8DAKBpBkaKwp9iof0etS0c8hF1EMcM0XG/91VnSECRoiv+4xyu4uGcTE
         A+QxjCrEwAGhInMELX+JBpEWnRzJMVomMWH7MLMonCagZD7ApKCCERWlGhKKHVfkeyEp
         gBMF4ss7R39od2EQdzBA+Kh6nSEybOW5dXTPrFvmvGCIYFo2HOFWsAtYfXrxfanLojUR
         hrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195262; x=1750800062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYlAxPuXA8dnfmu8i+wfbdgDc6Ycx58eTjl1jZj+m5E=;
        b=dhTdZ5ji92QpQKxqc8KTGH4v4Gx/cjEGx+D3dTyJ2353G2vLenJgl1QXBUXcoRVelD
         j8qKIHV3y0dYMluCddUbOxzgm4xOukZA7DF3UxKO3QvQBHqcLxLyT7u6FTVdLz42tppZ
         v36pm1HdAnGhuw0c0RcYPgZSdIVG2DxjRNHViXrSafScAbaZdQmcG2Q2GhL+Nm60D5ho
         dftaHcsMf3/zsnPnHYEWXDq35On46Cz47u8FpiuAR16WpFaB4X1X3/F4fS0up9tigQaL
         7kxloDL8TI/YZPEheNxL9EwGXSlOEyCRYkh1IvsL27LuV/pXHEBj8W5Yp7g+8u816beD
         EaJA==
X-Gm-Message-State: AOJu0Yy7SXGqMK4JGG3QG3yKC1rLOXoQHWpm2D58aGZfA5YLvnzfFdLy
	7Qxs6dUts11It1GBEFN7qCPfGfj/tiwgBc13pD9CP6OE3SL8qXQmGOtpb0aX+/Qy5HOp+foI8GH
	HhUza
X-Gm-Gg: ASbGncu22YNX/NCQodKL61QyzHYDu1f0J19WtVf0Plwccoewe+5Vdh1SFelgA1dh4/B
	5SffDw8hhxbwNw0aaTeRsPYVvMjgU4V0M+ABGQDcmyVev93Up4ud53N4+kreEv+jn3sdulqNL9l
	DZyPgPy++nMGQ3yPdIv/jAcTRrRQ6o6D6x+nYgycWs3xj+uC7Fb8Z6D/ZLWvs+TZYVPQyLI8YHw
	UeS50uOioQIbsuwyDvRi/Sybjw/l11MU5l9OSelsas8ASZ64O8gwe6ixA0RCtZB0H3QhXqKwLZw
	K/MO+P5g4z1WyqhgsJ2WknlHO2MFHRVHDAEv1rS2sJhrvYvPL9VD7A==
X-Google-Smtp-Source: AGHT+IGSli+bcx9ox1ljWWCtoc3dN8uAUq7nUnmH47eroCYvy7soufkfO1Js6SUaqxYXNpJqxg+xxQ==
X-Received: by 2002:a05:6a00:3a17:b0:748:2fa4:14c0 with SMTP id d2e1a72fcca58-7489ccc780cmr20445449b3a.0.1750195261783;
        Tue, 17 Jun 2025 14:21:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.21.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:21:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/27] xz: Update LICENSE variable for xz packages
Date: Tue, 17 Jun 2025 14:20:15 -0700
Message-ID: <a9b751f211ccfc1c8d58aba290dc8b4de5383acc.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218935

From: aszh07 <mail2szahir@gmail.com>

Update LICENSE defined for xz packages to match the license
information provided in the xz COPYING file.

The License information from PACKAGERS file of xz mentions
packages with lzma files are in public domain.They ask to
use GPLv2+, if only it's not possible to mention "PD and GPLv2+".

Include PD license with GPLv2 to packages with lzma content:
xz-dev package contains lzma header
xz-doc package contains lzma man pages
xz packages contains lzma binaries

Links: https://github.com/tukaani-project/xz/blob/v5.4.6/COPYING
       https://github.com/tukaani-project/xz/blob/v5.4.6/PACKAGERS

(From OE-Core rev: d511c41dac048fbdd93a54136e93b0623a18a83d)

Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e5b955def5d9f305f5aba2c68b73287c03fd163)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/xz/xz_5.2.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.2.6.bb b/meta/recipes-extended/xz/xz_5.2.6.bb
index 7f889e4367..938c659008 100644
--- a/meta/recipes-extended/xz/xz_5.2.6.bb
+++ b/meta/recipes-extended/xz/xz_5.2.6.bb
@@ -9,10 +9,10 @@ SECTION = "base"
 # libgnu, which appears to be used for DOS builds. So we're left with
 # GPL-2.0-or-later and PD.
 LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & PD"
-LICENSE:${PN} = "GPL-2.0-or-later"
-LICENSE:${PN}-dev = "GPL-2.0-or-later"
+LICENSE:${PN} = "PD & GPL-2.0-or-later"
+LICENSE:${PN}-dev = "PD & GPL-2.0-or-later"
 LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
-LICENSE:${PN}-doc = "GPL-2.0-or-later"
+LICENSE:${PN}-doc = "PD & GPL-2.0-or-later"
 LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "PD"
-- 
2.43.0


