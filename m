Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251B0D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 08:52:33 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2444.1768899151083051160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 00:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UmTY9DwP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso47525175e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 00:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768899149; x=1769503949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7lNrqQhjV310xSwEksJSaneqBvqajQZeLqzaKBIYqR0=;
        b=UmTY9DwPfzaa00QV+VxOPsM9EA4tcic9mmRRRqcXc9gaDFt+cpyatyZj3sI7IMeqUf
         1oagrUlrWx9LrY+xxf8gMs3Q4eoQZdgn4id5sv6rHmXr/sopB3gUZpeFtVhcRlRM6ybd
         tto2XTk4yRCVz68P7t4jrwBCIddqYD9qQhnbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768899149; x=1769503949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lNrqQhjV310xSwEksJSaneqBvqajQZeLqzaKBIYqR0=;
        b=W+/wpxCKuZPiroYqub593MgvZycgCu/kqU68HT7dhdFFdkkEEvlmtVJwyDUusbxkd3
         R0NaHw+i/EC3PEbZt49Z0W1Yaxr0RGOgRAEvYa7cq0zZeMiflXhbfmou9h9h334+QGtB
         B56nije4yVjHqGI6wam89bl/O/fInvRIHyQDX60B/DmCOEHIC01bp8n/fRUpxKNx3FCN
         RGfHgIDSpqt+RwDcFH5Q9ybhTIjlWLKrwCHvKctB8AZd8Wmcr1oMOh/lF6mdXgi9y4QD
         eyCFz2sWonVdu7EySqM3gp6HUtKAmIdu6uNl3vnlDhhI3oBlVBcjRdwHkKGamGHMOrN1
         ny7g==
X-Gm-Message-State: AOJu0Yw0sDv3rKIXevbxhYCSI++IkodEWr3jXn9eMq13QhehUVM2zUtm
	jqvGtizvksm1SC2pkKs2BqsFfFVEGY//uvLZvB95A4wvR/KWkhQYvkBqR47ybs3zXez2o6gkfWo
	t/83ZGo0=
X-Gm-Gg: AY/fxX4N+WwV272Cvmx3oCurcH3kkCY3le1tzdSwTj90c6twCZcNuUSxw8ltmtWog+2
	n5m0oO0H9jQo3MTtezAaP4ZNgQ9AVPcHkz0sapez8yPYe4jNO3wkqb5vP27iXM4K7UogmEZYZ+y
	noCYcJD18tTiMBMEQnHJayehg6f4e+0WNdvRBSp+6Q9jZHNLgNwJEGr0ZQyvjTnZ/WM5wp8KAko
	nRyyE+VTqH8jI4TPn3HiO+JrSgeSWsxA19qD9LP0DJKQHNLOD5FejxYhE5XOrBOemPiRAoz92EZ
	sV10RX9s2ee8tR2IYrfiViQSCPh2d6HxvX/B57U5yVKA056x1GDGhNlfwXbmg1gEfBseU4rFMzZ
	z2mW5/J7HPJeXrDXtCEXXALFzaSgU42UJiX7L8GyBOdY1xqfQyiQNegFyzlQQkHjzaRRvuZD21z
	6b+oHBp2rbdYzgDcQL50lRcY2iTURuJMgvfPQi0g==
X-Received: by 2002:a05:600d:6450:10b0:477:58af:a91d with SMTP id 5b1f17b1804b1-480215e1ad9mr125569385e9.5.1768899149084;
        Tue, 20 Jan 2026 00:52:29 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:62c:c694:1cc8:4ee1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428b954esm291625545e9.7.2026.01.20.00.52.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:52:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] pseudo: Update to 1.9.3 release
Date: Tue, 20 Jan 2026 08:52:27 +0000
Message-ID: <20260120085227.3719998-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 08:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229653

Pulls in the following changes:

  Makefile.in: Bump version to 1.9.3
  configure: Minor code quality changes
  pseudo: code quality scan - resolved various potential issues
  makewrappers: improve error handling and robustness
  Update COPYRIGHT files
  ports/linux/pseudo_wrappers.c: Call the wrappers where possible
  ports/linux/pseudo_wrappers.c: Workaround compile error on Debian 11
  ports/linux/pseudo_wrappers.c: Reorder the syscall operations
  ports/unix/guts/realpath.c: Fix indents
  pseudo_util.c: Skip realpath like expansion for /proc on Linux
  test/test-proc-pipe.sh: Add test case for proc pipes
  ports/unix/guts/realpath.c: realpath fails if the resolved path doesn't exist

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 19b0d29b718..ed1e8fb3e01 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "125b020dd2bc46baa37a80784704e382732357b4"
-PV = "1.9.2+git"
+SRCREV = "750362cc7b9fa58dffccd95d919b435c6d8ac614"
+PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

