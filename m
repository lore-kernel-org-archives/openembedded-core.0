Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D273E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 20:55:40 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.91471.1734468930667743429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 12:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2/U2oVBt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-728e1799d95so6775986b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 12:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734468930; x=1735073730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajwKsg7Z3PK5lyhHbFqM8ASByw+k09tJ8aO/Qe9DlUg=;
        b=2/U2oVBtwBmecNG9LvR8dto9gcAj1EfZ3qvZLNooqEkmdVlgBDnJZ/k2HjwwMMaAlL
         imPn0mlxl1Wbea0ZxaFYbmzN1GUtts+30jjlznyMzf3yp/vbr9RnrAX/cN5TBb0zDpRR
         PSMyGUWFo5g4Etg46wmId3L9Yp01mYOp3I954VkHi9vYM9ofu2AjwxU/uNUZPYDKNeSJ
         Yo+lUZpXoPHeqUPHTWw92rAc4GFSCb1uLB31Z2ucMWvtfnHYDQmMfzU0dhUCdWJ+VXm6
         f4pCxTkc5OizzNm2uG8dvtU4QeECaRvboQfuPBmali9Vy0SacHPHwils8dA7HTKHztXY
         Qc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468930; x=1735073730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajwKsg7Z3PK5lyhHbFqM8ASByw+k09tJ8aO/Qe9DlUg=;
        b=RFp2sG81w9L2UCPQr24DevlWNsRL0fm08JJFjk9VTvQUB9TtOPgAGn1LfXI3wVj2E0
         U28vtzxDsr2pwLagVSIsax1yonQe+ZgX31ai26lB9R9jhmc1ma/rjw6YxYFizz8nSL0e
         2HapZHcMmCBpenmi+xMeO6e2EY7MntNX2FqPgDo/8L+vePI5VMGQHIspiUKBhicWdnou
         Owel71GrNXroEb7K2njDKemHFsZdx46ZRR1fgI09sSny2m9Gv+rIKMJ1V+GW+sGZtNJa
         BRwVEWA+CgMEJC9ZcRhnruRs1K907bdkvBT3u/tYb6tTwr/FEtKz+zHIeCOlRwreQ+dR
         NriQ==
X-Gm-Message-State: AOJu0YxRG3u00CklwvLDmNRvksfOxIreRJ+I15gw86m7ONHG0xAquFWu
	JlrETAfdnFkz9sA2Jy+bEABXtNpoJrQPPhNJAQABGsp0E0N+lRN2+7a6ISzAdD0xfIC69mSY4Wp
	Q
X-Gm-Gg: ASbGncvrxOEKQe5KWNbyDM6GNJssYmkQbbb7zFmfv4S+EWXyHB9oHUCvG/DyOhhTqEK
	b+rVjE2VW/jNnmtDCscT0awWZatA1cDOc0mKh/bQBf+JXmJaWsMGQdbRd26wvFFI3Ebuf3nICys
	vpOn+E5MFKW4o2iTy1R56+VM6yzbXEwSewp4sgHWQTGyegPZFlGnTDQNTO+eHsMg+2Cf+G/VL2Y
	jwKUNO0r5SZp+sATzIjJJfzopuuSVRkfonGWWuPRKfP8g==
X-Google-Smtp-Source: AGHT+IH4FmIuaMZiHxG8cU76u4DSjY0RCRFnbAfeVUVQ0DOI7QJEkfY+P/ykxbILISksRzkSYghdDg==
X-Received: by 2002:a05:6a21:9013:b0:1e1:bdae:e045 with SMTP id adf61e73a8af0-1e5b482106emr741957637.23.1734468929976;
        Tue, 17 Dec 2024 12:55:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7353294b3a.69.2024.12.17.12.55.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 12:55:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] base-passwd: fix patchreview warning
Date: Tue, 17 Dec 2024 12:54:59 -0800
Message-Id: <7fac3b8ce8f90a79d470c2ce532750039eaa0e2f.1734468756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734468756.git.steve@sakoman.com>
References: <cover.1734468756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 20:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208854

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Fix:

Malformed Upstream-Status 'Upstream status' (meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch)
Unknown Upstream-Status value 'says' (meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch)

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b62b32fe154ca40a3bf731eaa5994ec351cf507)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../base-passwd/base-passwd/0008-Add-wheel-group.patch          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch
index 00eaec38a2..d77122789d 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch
@@ -2,7 +2,7 @@
 We need to have a wheel group which has some system privileges to consult the
 systemd journal or manage printers with cups.
 
-Upstream status says the group does not exist by default.
+Upstream says the group does not exist by default.
 
 Upstream-Status: Inappropriate [enable feature]
 
-- 
2.34.1


