Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B9B106288A
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:29:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20257.1773232170351020527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 05:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nHXkNDi3;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so37880875e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773232168; x=1773836968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYoQT3ae/+dfHWTIbq4cVQ/BInYIcs2OXaFOl/jnW9k=;
        b=nHXkNDi3q5YFF6SLD9ss23y8PpNP44FEyr//ShlLkPyBxYvFf6g0hlL7YT91KSeTZU
         NHeev6qfOe+qwrIhXxbOFk8HmMVjG7LwjxqjZsekW7qCpKSZgBsGJkBU3O871QaleMhs
         8jaKMQwTEOkpvjL/ZMiIgUxqFCK6EFOWWZtLLO9XVorRh8n4Y8HsyoKGhetR9UhUjcz5
         sU5rr4c+GfHWB06CT6sJinqPyPauo37MFC7Ota2+j6jJvOZJouEKYXv+NK14cstxiZ//
         ENVO4zyoMUn3yhwkxY3prsKnEKzgPEp0jeNOdVqDOXquHGJfNNxr3/Cn/2Fpj5o3AW7o
         j4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232168; x=1773836968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZYoQT3ae/+dfHWTIbq4cVQ/BInYIcs2OXaFOl/jnW9k=;
        b=NB3bdz1xKW6m2p1JTcp+lh31eX4WmuKh9qNH+E28AesecQ7eyPhVW3K77pbxbaJTYL
         6QBivR0HciPj+ki66iLnkCif7NMGirv5fkCr2DyIsTVlQP6KBqSYXq+yBUxC9dJ0j6Rn
         DK+Dn9VinD801UXb1fxwEaZV7HbJwhKlv8cv6JDVX9UTXZrzD4VIvcq4HN7aak2bOYz2
         MVT2PxIy6QQearyJ9IFXdpSOJ79VNZ0wCgkTuJWj0qJYd1QIhV+BH7GAwYGQN7ZjdPnA
         02ICXHTVrC0H09QeOsSGb4YIKdDNDBfWI+dJHG0KAulrdUrUkM7ISRSn1mwiSpFR+m30
         n/4w==
X-Gm-Message-State: AOJu0Yxox72eKdyp1XI77ACUJ4f4q+2K7M9lqMZSfXi36XrArJTHpTrr
	dDRg+0oAet0BEBq8jxGrwWWZtjsBBk3QYo8Rv1+wPOdQK/0hDggu4nPEeGVZww==
X-Gm-Gg: ATEYQzzGmLhkNLm528rjJuYnL1qe7Y5IGBiEnFbwCSsCeBBhkWqSDyqMMHVe5CnHOx0
	bJCgqtGPOnR0y66wEdBEoHxKXLZsNr5rW3tTdTj8oT4e7G1jLJbNmmMG9k4BRwJMMLZNAcgytYc
	J4Gs49aaLgLUDVvIKZT1OZ4oVDZ2A2Ykt59mVoGPHBMorw3umuxZXEupcqibIdUgVvfpXneabVq
	clmfKuY2WC/FsWgA7i4FTIxlGYAFKjHWyHU7U2urYGADWPRD+BjkCqejX989NentSZBzML/EJzE
	7HhWk8DRFNdPJEBA8Uu5XkqsEmZo+snNcriCZADKKuCrGAH9s1xvF1yujZmYelD3z1Yeu/foTEH
	ALldu5X6/0a/ltsjtojOeH0Y2SWF5Q8KkOxWZ2254kH6SOmlIWwBcnELw/nmgmgefeK3Hi4UCuE
	XPZ+88YrPSuhQaUPlexx+1SzpWMmzin7vH1xJR8Ehqlf0=
X-Received: by 2002:a05:600c:4e16:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-4854b14b0dbmr35416985e9.29.1773232168324;
        Wed, 11 Mar 2026 05:29:28 -0700 (PDT)
Received: from fedora (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854ad5ee37sm39671515e9.2.2026.03.11.05.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:29:28 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 2/4] gawk: Add INSANE_SKIP=build-deps to ptest subpackage
Date: Wed, 11 Mar 2026 13:29:20 +0100
Message-ID: <20260311122922.4160133-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311122922.4160133-1-zboszor@gmail.com>
References: <20260311122922.4160133-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232873

This fixes a QA error:

ERROR: QA Issue: gawk-ptest rdepends on locale-base-en-us-iso8559-1,
but it isn't a build dependency? [build-deps]

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-extended/gawk/gawk_5.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
index d7211f28f3..f4746bd041 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -101,6 +101,7 @@ do_install_ptest:append:libc-musl() {
 }
 
 RDEPENDS:${PN}-ptest += "make locale-base-en-us coreutils"
+INSANE_SKIP:${PN}-ptest = "build-deps"
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us.iso-8859-1"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
-- 
2.53.0


