Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73610CD5BAF
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1005.1779233433617266606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sA8IouUS;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49021532ebdso11202025e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233432; x=1779838232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKAibZaJIyPC5sMXiaobr2pZnJFF43Hci6ox8FMVN7s=;
        b=sA8IouUS7e2oUjjQW3BDf84iV7K2iubWZ5yUHeNxheCSuG8d1ZOecTAQGSWjNAqxtC
         EFDcLRw2aiRJPXxQX+vbv2S2qWkKsbJ8144lYCtfI1j/x60i7xFomJQCvBjb9iVbzNnf
         8nnYyRWB4kIkve+8+iDZDvmrnja4kbfP+f4mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233432; x=1779838232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oKAibZaJIyPC5sMXiaobr2pZnJFF43Hci6ox8FMVN7s=;
        b=c8QLqyPvU4WiLZS+t2UjJtsOPOG6Y+hBr1MO5kJdqTlo56TazMNu/f+lLdvHkgbOP9
         CZ0Pepf/Vr6AxkM++chMP2bB9wWUQ7Y1xQdH1D3t0IA2YJqWbdNZbLdYhTlG4zcjvX0P
         l9asuk9uaxI/UOlCEn3GcYTup5130DuCugOPQgER6qQECkwlu9WIC4eNNQo4O4gfhTB5
         G5ThkqeumxJLe94/84AlPnl6kf31WklbrZxVQNcXsPac+O6Y+u+Osl2PcaYHZNKzdCE0
         Xqagndz/z5ZwteAY4r6evcKRas1C+8uu34C1FvQ5lBrOX2uVbojMm3KkY+sqUARaaeg2
         0Row==
X-Gm-Message-State: AOJu0Yz/pfUT9HY1GIULG0YFlXM+RnZmiihEcQERiejvnl96hhMfDreO
	YGKkeSVKRC3eVl45LNqx9gh1namHbGT1niyL+7XSJAvz9e/P3BUOh36cqXZ5BQaYawk8k3FUiJy
	IT0y8
X-Gm-Gg: Acq92OEcg5kif5PR7jsHd2akK9j7Hetu/xIwSIKSkkDH9v4Pn8896U2k3y9PuqTvGv1
	aHGlOEk+Z00Fi5Hok3NoCuFTF0waParP99RmzApww+pBHP2H85YjjWf/uRQR0S5PiVR+ffoT6m1
	P6D6dvDVJ+QJOziP0OdyRZi4V+gUo8iSQXLvcvpT8gjlBMSnOcekGl/fIluNz6hljd/QDrwS2Db
	QvOgrp9NTFoUV3ckTjHu8ETJFcnsfSjKlJJ8rz3zCMirOsk1S9r13KOfm8qEfNd6WB8CrzdAtLs
	j0Bse1Kkw1uZofa2y/GvYUuc2pviZI0KqpAsGHrVBpqJ0ZAVmM0hsljTESa8zjDseGTfk+vWLau
	HexmIFLxzWAE+tf7ygP5UxwPCNRQe1kxKkHNSMU9RUWcerfgpT7XEkbSxlCJkRfZkmsZ3MU6GUo
	lLoNIKdH0roN7nAsv0XXbZCJ53ipLUvhrQeRr3ewnKMO7/J/Ffr5BM0dGPy1vsDM5a9iG6QT5V/
	K3mMCoDDE5eu0PmIaGj/cw7DV8=
X-Received: by 2002:a05:600c:4685:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-48fe5fd494dmr326419845e9.1.1779233431736;
        Tue, 19 May 2026 16:30:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/28] libsoup: set status for CVE-2026-2369
Date: Wed, 20 May 2026 01:29:47 +0200
Message-ID: <e11c5c8f5b9e646c65f4eb417c9a3e9309295443.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237357

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is fixed by commit in version 3.6.6.
It is RedHat version-less CVE.

[1] https://security-tracker.debian.org/tracker/CVE-2026-2369

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 14d6ba9a0f4a2813c1dd7554e4eddf93bd2f2b55)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libsoup/libsoup_3.6.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index b36976a2be4..792cb26e930 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -63,5 +63,6 @@ BBCLASSEXTEND = "native nativesdk"
 CVE_STATUS[CVE-2026-1467] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-1536] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-1801] = "fixed-version: fixed in 3.6.6"
+CVE_STATUS[CVE-2026-2369] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2436] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2443] = "fixed-version: fixed in 3.6.6"

