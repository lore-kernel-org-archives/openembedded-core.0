Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.2711.1624779760905522021
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 00:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C6tGLW0b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id m41-20020a05600c3b29b02901dcd3733f24so11375380wms.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/KCIOB5TJDHhlM8lnhMtJYUiK8XWEao06b9Hw4YDS90=;
        b=C6tGLW0bpwyr+rYypNJi2qB2KODBl61N3LOguUnSJsod2TuSe0tGQN1psTUcDD3LXQ
         y9U3bhRI6xaNnMEE1CZRPaRltpIBZFFpaiP3Oh3/S+yNqUySX3Tfiw24tsZecOkK6u8o
         NgJzmHGo/FZVjCzWn/ba35F3EV+OSh84jgdF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/KCIOB5TJDHhlM8lnhMtJYUiK8XWEao06b9Hw4YDS90=;
        b=N4qT5GhOsiJMVv+uakIAefPR+dqIWvs7I0eyITSDITjQ/rfmSjtQJfCXy9XS0Ph/6e
         8dpR69CZnlbuGeGPZo8GDv3mgRbgThNEAhlfi7tzS90kLOII92onR6sE5tR4ZepJJHNp
         jYIU8BnAf4n9XBC9Sedgh6xWmHoE3f/lVL3ZVt6SWGOS+7SO5MMabLdO55XSQbdRTzPk
         Qh4IgOi7zznESpP5Fguh3WqiWXgnJlvAoelOMlhvz+fn0bI4j5/f31zucjrdjm/6SNUT
         FQwk8MHJMGp1Dy9sKXUlXyIh0kA2blZMO3vpSqPsZDDnvs5QGKukGaJBCTCQKXNV+STA
         PJCQ==
X-Gm-Message-State: AOAM532rM+xHLz2qQaaEzfbQOH8VjUnKUXz7UKAxnR0RqssQrqGwnBtl
	Dix663IduTyoMiDW3V3TUn074vrn4kEQeQ==
X-Google-Smtp-Source: ABdhPJyHQq5QPqcp7hUkGaVsL4b7e3hJCst/iFCYjh2VAdHYTzHc7NPBrq3VFcU44qA42xuj8PqUiA==
X-Received: by 2002:a1c:4cd:: with SMTP id 196mr326259wme.145.1624779758979;
        Sun, 27 Jun 2021 00:42:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:acb1:d8ce:3f1e:5404])
        by smtp.gmail.com with ESMTPSA id c12sm17172672wmr.27.2021.06.27.00.42.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 00:42:38 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kernel: Fix interaction when packaging disabled
Date: Sun, 27 Jun 2021 08:42:37 +0100
Message-Id: <20210627074238.3669890-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When packaging is disabled using the nopackages class, ensure we don't
add to PACKAGES. This fixes builds where we have an unpackaged kernel
alongside a packaged kernel.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 379bed44f24..846b19663bb 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -92,6 +92,8 @@ python __anonymous () {
     imagedest = d.getVar('KERNEL_IMAGEDEST')
 
     for type in types.split():
+        if bb.data.inherits_class('nopackages', d):
+            continue
         typelower = type.lower()
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
         d.setVar('FILES_' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
-- 
2.30.2

