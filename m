Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.33060.1585212880081482582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AE3XqBLC;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id a81so6027499wmf.5
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QdMZSAQyfiDEvHG2lyjf5/NddTVf77XT+cBgahEAGCA=;
        b=AE3XqBLCt0pQIh2c4wW4x0aaqDbXribV/gJtP/NSw5lB0tmQAj00Q+nHXZtWyX8mZT
         6BxX1byBUPXuxQ7bi868ucbxtiXXs4Yvx+FiiU28jy+MCUOzVw82SAMHi6CoCOJXBoLc
         1ufQyiM80sVJtTxe+27XaBWFNOXV7iWvlnnG/Zlg4ePV+zoT3tZo2lpCFdCrQnI9Csup
         kLPwIBNZiE0SN5cLUU5clRSaybLhhBMobXkHLAiALj9S6X94CCMEssTiAFvtnKrD+kYK
         VpB45izGtuB977zvqRBZPuiwB7yn8aN+AzBLNBlXndpM2DXYoP0hqjn/7MpKIgTjan93
         h5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QdMZSAQyfiDEvHG2lyjf5/NddTVf77XT+cBgahEAGCA=;
        b=AeTR7EplZWd8GVBlsPB2xXdtpdH80WDIB0LMcjA5I5qpt0T8792f2xn9TrfYrg6rUB
         /CGsaMuP7j4xlHcYKbsruyS91Qx7PrCtApgP6KOsKd8REwy9fNPKUCdeOciq3KlmVFkq
         Of78aZD0/QRR0Py52J+zIS3UMlyYn+6jPV0Lc364E9ryNCCv9WSqvovk3Zjy7ZozrqAl
         qDZwYQdt9mRgU/sl0OT8YCSmBCG1vIknaZs+qP68OC96SBPXYaq/0GJoc3s42ejjEpZb
         i6tTIOeU9CTLBlGtjt6+FzaisdpEPp40tqkMSZARdvobPKRAu/j5pTIDugkdLXHCa0yc
         S4Eg==
X-Gm-Message-State: ANhLgQ1hCt5EHIVQ7V/ezclq4Mcj4VCbQkaSo+MQD6k0/VGVFW975q44
	uauiEfaooCoEC7R1i6j8/e/gEdJ1
X-Google-Smtp-Source: ADFU+vt+M3H9hFal9FnwRNUrBypwIs0AZtpC0vi2deAUQ+NMFnrojugQyZ9KYZg8Msi2etSsf4V+JQ==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr1985615wmk.48.1585212878485;
        Thu, 26 Mar 2020 01:54:38 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:37 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 09/13] systemd: Enable audit based on DISTRO_FEATURES
Date: Thu, 26 Mar 2020 08:54:22 +0000
Message-Id: <20200326085426.117209-10-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index d398cdef18a4..2031f5d592df 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -56,7 +56,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux smack sysvinit usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'audit efi ldconfig pam selinux smack sysvinit usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     acl \
-- 
2.17.1

