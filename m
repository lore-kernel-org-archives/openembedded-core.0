Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA71C43219
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:10:29 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.2917.1668262225152223694
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=b+T352q2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso10076230pjc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5krHqb5Et9hoWflJK3A67rriEl6B/NvlkbuN2HdIYg=;
        b=b+T352q2b+VYaKjsGXIy60MbhNOuipDSYHTPdnFFDS1dDIvSkv1AY2wgnWWmO401qJ
         wpPi5d+rHKjwvf7olSaHlwaOmfwOG/yBorrzyMLqIWp9kbHdk3gLceLRD2YjwBWTI5aL
         +KplMJMw0KeDI12f0ZSi0ecV0NAKyIkTd87mSPkXBXtuUcLyRdYpvTMYyQAWF1d3QSB6
         OZwLBAl0UhbL71+i20SWSYl001GjDY/tssLFJ6FwZ7PDmS5cLcFa6GtRuxiz38rGeLkh
         SNBI2dgsIMvpyl6+kVxeE4Ek8NPjUKTqhpNqboEJuUk4bLWKlk3uGUA45obqAa877SVx
         102A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5krHqb5Et9hoWflJK3A67rriEl6B/NvlkbuN2HdIYg=;
        b=JrJEaTr3JvuPunoVH2HYHXFEv+dDmuXft7f4MrMJ9j8k5Iwx2GHDZYUW7HkvPwofvy
         O+VtXlS01QuqWWNQJh1rg9SGu/3/dp0mzIqvJsZNg8A5EvKhPwzN6iXkdK1om0x1JDx6
         f+vP7ZEesTFYEu0DxErMmzJUbWLp5Xi5OqO+zTYa0TqFEfQ/e8zMoRpoJgOmNnXqU5cM
         vanWMmGNZQoAB5r4pHHd5SwjKYlULow6tJAVWqX0RzVJXWkd8V4FEQmQL0/GU2Kn9tsj
         +68NFgHV+wCg5hnt6eDjuiuqmS1qwPLdEnxqSoWWWmUyQUoTmY7RTfeZliToHBlce/3x
         XwPw==
X-Gm-Message-State: ANoB5pn/xCm4Rh9yPBufiOKKbidPV8TFUEN6svPGsc4B0SbeDfr1yl+T
	vjSkyk01y8fONSRBjwvjjZREsZzC6ibsn1jz
X-Google-Smtp-Source: AA0mqf5S50Z+PzkrtIXVwyiPJiUpxh4FPnBmBKYH1B2YMbjEDUZcSeXz0wwiFAR3DNm/55a85urPww==
X-Received: by 2002:a17:90a:a102:b0:218:f84:3f98 with SMTP id s2-20020a17090aa10200b002180f843f98mr6625404pjp.238.1668262224122;
        Sat, 12 Nov 2022 06:10:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b0018853dd8832sm3733883plt.4.2022.11.12.06.10.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:10:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/11] externalsrc.bbclass: Remove a trailing slash from ${B}
Date: Sat, 12 Nov 2022 04:09:57 -1000
Message-Id: <fa89e048e223ae2e96d0f55979f93f29904b5229.1668262073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668262073.git.steve@sakoman.com>
References: <cover.1668262073.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173158

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The trailing slash in ${B} caused -fdebug-prefix-map=${B}=... to not
match as intended, resulting in ${TMPDIR} ending up in files in
${PN}-dbg when externalsrc was in use, which in turn triggered buildpath
QA warnings.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9b5031ed5a0d102905fa75acc418246c23df6eef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index fc20eedf4d..3f7f533cc6 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -60,7 +60,7 @@ python () {
         if externalsrcbuild:
             d.setVar('B', externalsrcbuild)
         else:
-            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
+            d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
-- 
2.25.1


