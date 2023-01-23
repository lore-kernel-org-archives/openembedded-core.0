Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB2BC27C76
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:36 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.33752.1674440555583711746
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kfYkFaRy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id d10so7932892pgm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtOH529eEk0fYUEtHR4Ys2UFST+V2Q7WvVoY8Sr9B8Q=;
        b=kfYkFaRy2X9G+XQiig3BnvKhzgg/IBsNF4CMq3vkAZg8pbYTztWNwaH3rd+Ey2UhI/
         R9mCsVkR515DbSUI6Vhmkn9+u49n8GUFdXbfBmgPeZ7DX842EPBwAGStHTOGY7zjkU/X
         7sZRhYHfsF1l1ofis/i6uYzJz5tpp33elBS+hJ9oPs7vDzCw4Cdxi7wjNxQ/oyBymMId
         aQ2kPQ49qzx3TmMYElK65DYXRMgjRYGaNwMbRfzukhlENTzt7KBvepqb0w4cMs2O15vp
         aOkOCF/se58uYZarttO37GNmMzCvI5mH2WYGUw4kCm/cmBHqcAGKLM10LGQUNt7L9xsy
         bRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtOH529eEk0fYUEtHR4Ys2UFST+V2Q7WvVoY8Sr9B8Q=;
        b=N+Qb98CNhctFy9b/XXosRBCxMnubK18NkG6ODOnSgJm0Rg/faF3MCxng4UiUJYCOLn
         nKT8yGJ5winBp6pS5iV9IGyUVplMxA1uwkNBxW01A6/j3xrNPyENetHAN94mR9+2tnmY
         9RVeaLMamnAwjs/Xb/VCIG8K10ZSnC1Nt3vGiNfFy8kAWzPWhAe1JmOi4bRjHX3VHXLy
         Z/9Iuj8X4Z0HNPQOXqzeT7JRbK+U2vYZ+MWxWFYmNudp88n/loQ7t9lAMTuw+LebMZqz
         xV8oniQYu8DrJHC94HK2c0ngom9GH5xhF5YrW7SGyPuOkn4bUu2m07au92og7eMNdpeq
         iPiw==
X-Gm-Message-State: AFqh2kruYBXwA4CRgsgkb/iR7vGUKMQEawYARx7JJ4KIrxAhGby3XmRt
	mAsf2/kko5fixuP+x3j9zXEMkyvH+Ih3kyhL/s4=
X-Google-Smtp-Source: AMrXdXuwtdU/K0jI+Ng8b0DeJJbec/sdu0FQBXqyD7lD5KLBqhK9+nRewBnXVKXl3Lws3Kfd1ySTMg==
X-Received: by 2002:a05:6a00:f07:b0:58d:a930:e230 with SMTP id cr7-20020a056a000f0700b0058da930e230mr24723504pfb.18.1674440554632;
        Sun, 22 Jan 2023 18:22:34 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/32] harfbuzz: remove bindir only if it exists
Date: Sun, 22 Jan 2023 16:21:20 -1000
Message-Id: <b342790a37c891cf83f24d4f96060e2d0bd79c07.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176290

From: Petr Kubizňák <kubiznak@2n.com>

In some scenarios (e.g. when "glib" removed from PACKAGECONFIG),
"${D}${bindir}" might not exist which caused `rmdir` to fail.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21261072cbe0056e85550a0710de142fab8943e4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
index b639c276db..bdbb322e42 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
@@ -35,9 +35,9 @@ PACKAGES =+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
 LEAD_SONAME = "libharfbuzz.so"
 
 do_install:append() {
-    # If no tools are installed due to PACKAGECONFIG then this directory is
-    #still installed, so remove it to stop packaging wanings.
-    rmdir --ignore-fail-on-non-empty ${D}${bindir}
+    # If no tools are installed due to PACKAGECONFIG then this directory might
+    # still be installed, so remove it to stop packaging warnings.
+    [ ! -d ${D}${bindir} ] || rmdir --ignore-fail-on-non-empty ${D}${bindir}
 }
 
 FILES:${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
-- 
2.25.1


