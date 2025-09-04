Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1A1CA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:23:05 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.927.1756999374993262581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1YYWujXC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4d1e7d5036so699752a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999374; x=1757604174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+ozeAbys4xK2zlPubh3Wn58HafqeUQQS/hR7ewiic8=;
        b=1YYWujXCgpQ+Qj7dGmH5wzvzUjSE+2OA+8/yLJXLWejco8DmF0AAO3IVokRtFqGh6V
         uTihqYJ5mhV75yj1Tdr8OlRYm/AtiVmVhPK1DdaDwG5PrEJdE04VTytmQ6hnyUl3+DIi
         R0aNCCb3qaWYkayrJa19Wn3LC2xFTdG5tVY10G71/3jRREqpJnLBBuN0Va7ptdRYi7Mu
         AP38Ma3isKQa9oiWmwEfF90V38NKDJSRNt1l0nS8sEBsR1TR/j4ZGccgxDK3KpiQ+Hfo
         uuH5glcQAaKHhMwjhY55dNcN7dp5LevVZlvK+mhzfMWH66f4vaWtaLXIA0qzdJ9SrVl8
         goUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999374; x=1757604174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+ozeAbys4xK2zlPubh3Wn58HafqeUQQS/hR7ewiic8=;
        b=GSrIHdVJ+0myJWpujiStBAiiLEmLFTEtOOswH6jQQ/bx3LC3xph9rTk4QIXZnF4D8G
         LN7WXTE0+v6qSBqA6grew63hbm7V3lRuZiAinTugntJ1CKJB1KO3EB+fAUx107DjU/WQ
         N5lnf54Gf3ic0RbMa++qX6TcTTdGN2bS9civGvbOyEkaj/LtJO6JsK/4YjupSLDZRn1c
         MHscgLZyQ1SNwtU4QSODNdsS1rkyH2QiQFkbfcx4J3YcG7b2XPmJKUJ9FjACw8tuGcqm
         zZGPnHXq3Bmn6qf67u9nT+aLcCzl30huok5ot5GIPpLrJ1UYxhJ47ZtcV5gDWjAM9zGJ
         Mdkw==
X-Gm-Message-State: AOJu0YzXmnB171gScppxHX/rdgsa9lhXev4Iy1xNauspnHn4dt1G8e49
	xdo/0Qa7dv47iY25v9xgEAUs2eKavP0+aET9z+fAQ8F+SOpO2gJf/nZeBd0Hz2VVxNZK4kSet1x
	ynxHZ
X-Gm-Gg: ASbGnct1/fPW23u1z8J65x3CoOQ8HrqqUracNME5dTISbBBma66K4C0AdISSmiBQ9Hm
	5Jx6n3a8jwcOlxb/pMzn5l4RQomgBA72ziCpNjnMpOQt7Ld+XstQ0lWuwTjaoMRkwc+9F2soL3J
	sCmzwjTSPjY39S1h1eRiUOKKAhPhWJAihu9twz0iiyZitSYg10yCnvsuEVlR9lHFf2vpDtyiBr2
	RX6pgR3/qx8EWSe1aoYUTxkI5gjJELl493H+YrSQUENXhyXclVoCiNqmi4BKXxfERSM7Xb+Vo4g
	M2QwzdXxH4FnwwKtpREpPpaXFpiLcDk+TnWS57lk9Kz5fUWKPmxPl+fZK41WfOAm8SM0A7kLqGi
	+bvDsnJwg6SjMdA==
X-Google-Smtp-Source: AGHT+IE1XrVaz18kL22bovXFKoKcZUKUh+VmWhgKpCj/ByoW2O5kn7Ag9ahcCLPmAwpzFQci2NGRxA==
X-Received: by 2002:a17:902:e5c5:b0:24c:1a84:f73e with SMTP id d9443c01a7336-24c1a84f94cmr101193925ad.60.1756999374146;
        Thu, 04 Sep 2025 08:22:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b11448a5asm82528085ad.54.2025.09.04.08.22.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:22:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/5] pulseaudio: Add audio group explicitly
Date: Thu,  4 Sep 2025 08:22:37 -0700
Message-ID: <baa5e7ea5f37f54c2a00080798ad7fb4c0664f69.1756999195.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756999195.git.steve@sakoman.com>
References: <cover.1756999195.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222960

From: Kyungjik Min <dpmin7@gmail.com>

Since pulseaudio-server requires the audio group, we explicitly add it.

When use useradd-staticids or do not use the default group in
base-passwd, an error will occur because the audio group is not defined.

NOTE: pulseaudio: Performing useradd with [--root
TOPDIR/tmp/work/cortexa72-poky-linux/pulseaudio/17.0/recipe-sysroot
--home-dir /var/run/pulse --gid 998 --groups audio,pulse
--no-create-home --system --shell /bin/false --uid 998 pulse]
useradd: group 'audio' does not exist
ERROR: pulseaudio: useradd command did not succeed.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/files/static-group                  | 1 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index f7a66de24d..c59f9e3019 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -27,3 +27,4 @@ render:x:527:
 sgx:x:528:
 ptest:x:529:
 xuser:x:530:
+audio:x:531:
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 1ab3831519..a93ef8f338 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -146,7 +146,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"
-- 
2.43.0


