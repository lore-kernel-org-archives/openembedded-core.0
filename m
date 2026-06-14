Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6ACCD98D2
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105040.1781424224643219449
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y0Uqee3g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ac357c55so21326615e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424223; x=1782029023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPKU/qLahzb0KCx6nqHSXD7E3vZ3DnI1mCzdn0d5KZY=;
        b=Y0Uqee3g1LnzYRGctjU7/sNoU+V6aq4IOBUwqzK57WqrP3FvU6HfdjgeR9JpeAFc13
         Nm1QjPqZvKIaTxZwjcYnOArn/kfnrvxvB+Ir1YUMcW7aWAEuohwXZuGH0YrtzygdQE4x
         vVe/fS5u0+v0L/lYgFx1Yv+j1pKocVjvPephI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424223; x=1782029023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dPKU/qLahzb0KCx6nqHSXD7E3vZ3DnI1mCzdn0d5KZY=;
        b=AGogf/DHafdnSOgRaUZZ2C2zOyBPmINS7I+zuod0VM/RjYr5hctItxhzjvY0IwY7LY
         1lnkHfQ4wj0WqHhRkkF0w/O5iM90KP0Wl5OUb981tA3a/3tcaT7q1xCymUnC9PBu6ZsG
         cxaawRad79wnfv6a82aLcQAmrLvhq++tH5u+jb05V/9vGoBRRqr+vfRfHRFtdBt+Thi/
         qyoYc6yAcRoWAL2kvDDOCy6BfqYSMvghWgZAIl5ceqPJHlBBOD+ktfmLgRtVqldIw5Y6
         T3j/gPjslVTZyMQnSy+GS3NdjAAHR3Ku4J/z2lL7w8MmPVFiX4TkeN+Bhd7LGHT11XMC
         93FA==
X-Gm-Message-State: AOJu0YwXInuVF9vqM/tOQ9jg0g3VhNbiAxyT+KSSKzSIwO6h9ciefRj7
	8yrbPwH5z6lIl4tsxCsIeP1LfPkGcLJWf8uTEd5XTknx0Swg7leJaIgot1kO8kCBAoenhHgAHvT
	rYK8e
X-Gm-Gg: Acq92OF0smBZ1JsNMiQVkZEyNfRnoXdYXgH/CQkwtm+VkTu5YW+pgv9iLxs3uLAFGid
	TCiCHYjX5t0Rlp/5YxpaLaqUSmByJ8u1J6X+OCnVfHBrrgCKt7tz5GtP/B5iiMuhNMnqPZqWnTk
	BP15feuuIKweK4CjWZiTf+1Et+snNF+dY8+gvGBtRfFobSy7O4TaM6UukFrE2fOfyeRTMs8yGYL
	OdbNBWPmWKIn0xcL7hG2w1OO4TLPmQlHnsVqIdS4J8eHutcJqtmh3pWQxxlETin1zELBuN0J/wG
	lTEagHowrHPsVv6kW2VOh+Dq/liQxF/rSARUJwK0md96BxULS9mDkPn0oVSnscsgXfOoU9q/G9K
	GQpJ73wO4tJbJPBX2EgCzMnybF2NOp53mKLltGrZ1r/JS7FTEbA8RNDM0K+bEQzaLbehnVB8O9T
	FvoFTEHUXiOfQ5Tre0HCBDqJDIfUqPSB/jDT+yccEYITCC4nmosu8tmCHFGFevPCE=
X-Received: by 2002:a05:600d:844f:20b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-490ec4c3d2fmr86515595e9.12.1781424222988;
        Sun, 14 Jun 2026 01:03:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/56] libksba: upgrade 1.6.8 -> 1.8.0
Date: Sun, 14 Jun 2026 09:02:31 +0100
Message-ID: <20260614080307.4017177-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238704

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libksba/libksba/ksba-add-pkgconfig-support.patch            | 2 +-
 .../libksba/{libksba_1.6.8.bb => libksba_1.8.0.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.6.8.bb => libksba_1.8.0.bb} (95%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index ef9066cd1ff..94612ec0a97 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From 929f7670a6c1e9450f239ee374bb34ac13c13592 Mon Sep 17 00:00:00 2001
+From a915d694b97f3226f6776ce405e8562b568070bf Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
diff --git a/meta/recipes-support/libksba/libksba_1.6.8.bb b/meta/recipes-support/libksba/libksba_1.8.0.bb
similarity index 95%
rename from meta/recipes-support/libksba/libksba_1.6.8.bb
rename to meta/recipes-support/libksba/libksba_1.8.0.bb
index 205704917e0..938bda67f5f 100644
--- a/meta/recipes-support/libksba/libksba_1.6.8.bb
+++ b/meta/recipes-support/libksba/libksba_1.8.0.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "0f4510f1c7a679c3545990a31479f391ad45d84e039176309d42f80cf41743f5"
+SRC_URI[sha256sum] = "296b9db9095749f2aa104202d7ab7fd09ad10710e00780a709c9754b1a1d9292"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy

