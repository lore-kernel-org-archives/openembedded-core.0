Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DB2C5DF94
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 00:29:50 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2168.1787358584145929245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 17:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LnQynWyP;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f7027ca11so950017f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 17:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787358582; x=1787963382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQPKd+2ks8/Jg0mOhEnRG/pCYu4NDJ/e9uS6vUdtawo=;
        b=LnQynWyP0iZEYAJsFLF2UjAx+gv+EDEmX1q1NNhs2ezL2I4/F4s5NlV+l+PtciJ7+U
         KvkmPRTqmVUixyQRKqIBSDTl7KiHQXLFs/zdngR5KJo5aDKtrkJiYXfx1EoV35BtupYv
         k4PtvZvTNJ84nIlZscvECvia/88pbwnycQ/kggBwqmQbYLCtYkiOL5gVbdbLtrh4Fpx3
         um/osrbNxKQ8dSZgLdwP886dI3isgUYkB4gJK7Ey84b6M01dGu6ZfEObHIXGlI/4GR74
         m6tjJoZ3/w4EDCF6Y1yYUQlCM/WuI24flDyIMVDGxB7gMf5Ty9zB9gXjZgq6bp4V8DBN
         glFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787358582; x=1787963382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQPKd+2ks8/Jg0mOhEnRG/pCYu4NDJ/e9uS6vUdtawo=;
        b=pIZAK+4A9tfpYSRuGM/i2SUBbk1RX8i7H2qmoCVx0ilcor033Lhw6OujWEMy1Lc+MY
         a2X0qI2E2IH4NNsAiw0mdZGfvSU9ucD3KQJPIckoDuusP4Bpitpztj5hR1nSRIN3U8f6
         aEKMT4zslHO9oS8vS+VcRQ3Fzo5R6dfiW3/qJ99UzBeNZsLUFvrghTvF7GJNSO56eWka
         kCIBSvNuKsaQ79YRxJBcdjR1FKEgS42YNDFc/2HCOixv/tYjTw04O16sNGsO6KTtDU+g
         nxQ3CV/aSWCYVjp4sJpqcQs3Lqh+ztyWNzTBK5mZrxafsL4aftHENxp6CRh8QiMaSxcf
         BuZQ==
X-Gm-Message-State: AFuF++mD8xG1P1WGCiqs6kUvRg/TtWIZ6xB+2k3Yb+6HTILIwTFmuVYz
	V4HkJeCmqUtHqFXFThOwFfYkYVou0OqFESRS94RLwMNmoctw4eu46GvFefda3OYrYw0=
X-Gm-Gg: AR+sD12GCbGXqJWfZDYwNIWU8Kb3cmS0zDgkehf+0EfWsIGODxIFlB0eGLHDzJwWK7L
	bAoz4BP565jszVbF/yhadArw77DMODpJDLnLEPyHlDb2S6SRXvYN1JrqsF7zxV4Eq1v/2PmPmXt
	94Xa78rGCtOvQJ5CvL0l7sEAvZJLFfoyyRNMP8Lw+pCsFE6X7bgJku7QuGREohzBpZnFyrL/T6n
	WGs47KTENb3Dz8B05osKKBz5TsDoRC7nyS16AyopErgYkUeEcVNb8KVssq+C5lrRwpjmWGcqi0q
	JwMiHz47WaljZsEYQZW9GIS495JaHjdo9FW/BtKJGs8esbWdUyb9lzMAHAeCIrSlq+/1wk7ZuAe
	8ePs7N3c/xHUDe+lM0nFBEEj5VGqef+V53bE6g29zxjGndN5uXp5JEHqNRHRAPs/kbct+DCuI+Z
	azRVQwHJ+zqBG+MYwcOir6+XxUFaCh4rk4EkulY7Pv8CHAtjXGhCxyB9MqkN4ICUpajnmgt3aTa
	OEFfrge+o4xxxjBj6muKxyOU8CZu3gGmZtPKOGRJPn20vovfFyGcircB9CjcIePQnAQXlUBPVAR
	SDZ1Cqo70t9E
X-Received: by 2002:a05:600c:4f87:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-499b830d220mr124882255e9.3.1787358582405;
        Fri, 21 Aug 2026 17:29:42 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:7910:2866:fbeb:d177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b914bfcbsm44728335e9.9.2026.08.21.17.29.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 17:29:42 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: antonin.godard@bootlin.com,
	bruce.ashfield@gmail.com,
	jose.quaresma@oss.qualcomm.com,
	richard.purdie@linuxfoundation.org,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v4 4/4] documentation.conf: add documentation for MOD_INSTALL_PREFIX variable
Date: Sat, 22 Aug 2026 02:26:01 +0200
Message-ID: <20260822002601.90667-5-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260822002601.90667-1-anis.bougrine10@gmail.com>
References: <20260822002601.90667-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 00:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243963

Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
    changes in v4:
    
    - Re-sign kernel modules after package stripping process
    - Remove package-stripping skip in package.py
    - Add MOD_INSTALL_PREFIX variable
    
    changes in v3:
    
    - Fixing rebase issue.
    
    changes in v2:
    
    - Use the conditional INSTALL_MOD_STRIP environment variable to avoid
      duplicating the oe_runmake call.
    - Use `scripts/config` script instead of grepping .config file.
---
 meta/conf/documentation.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 72513296e2..453190f024 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -282,6 +282,7 @@ MAINTAINER[doc] = "The email address of the distribution maintainer."
 MIRRORS[doc] = "Specifies additional paths from which the OpenEmbedded build system gets source code."
 MLPREFIX[doc] = "Specifies a prefix has been added to PN to create a special version of a recipe or package, such as a Multilib version."
 MODULE_TARBALL_DEPLOY[doc] = "Controls creation of the modules-*.tgz file. Set this variable to "0" to disable creation of this file, which contains all of the kernel modules resulting from a kernel build."
+MOD_INSTALL_PREFIX[doc] = "When a recipe inherits the module class, this variable specifies the directory to which kernel modules are installed on target."
 MULTIMACH_TARGET_SYS[doc] = "Separates files for different machines such that you can build for multiple target machines using the same output directories."
 
 #N
-- 
2.50.1 (Apple Git-155)


