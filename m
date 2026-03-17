Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998D5FF6E6B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:35 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86399.1773779365361260040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d1d2Gl48;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6611d20c026so8979170a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779364; x=1774384164; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXgtcdM6sQcrcTtvm+pxNx7KOyDb+lv7c+H0GA8LGZg=;
        b=d1d2Gl48Gioe5KyprDEAJxmBHP9hlStQfX6g3iQwimf9e/baNKGkD0MjSS9uS+pF5k
         4sUKuNUr92tr6Ww0pf3V/Mb4z/MjNSUTjmUNoRQ1TBKu89llNAq1i4lsl6yDHRvms4WG
         hPS3s5b0KUoi3vIYH6MgUvoyoY3Lq7/QLch0u8oWqVENW0V8lh5sRVZJK8o1s7GyhEPe
         v0j7LLE6HOK5sfhcvHg6LHFWsqnB51JkSjE6owwU4i/tnJg8VLev2+/OBqIlu40TghpI
         PU1tfcPxiQ0Hy0RIhMLN5BFLVbk2L5U1mgLyN6Le9GLHOOCas3H2cMjxtJ5YYpd2b8DK
         /7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779364; x=1774384164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jXgtcdM6sQcrcTtvm+pxNx7KOyDb+lv7c+H0GA8LGZg=;
        b=BgETrBMvxlaU2mAfHkzU9gjT9s9vn5UFRuKg8/yfJUhXSLQCkDPUz8MWbkBhP9cWJP
         gyuYLOrnGlbUtfIKvbieQw5wOrPb95BpbJJg51jPz6xDv9mi9c53pUQKYJyprkfcp8HU
         lNxiwtex7MMoj/VZSZHQrs7G1yZlOjx4PxYQPhfOpQR/Kut+19r6H0Mr98TgoXCvDTnY
         /HzMsYOhO27mRaO1Z1/H0Gy3SShiyg7u+ZjLNmtnwY4NbedQwzb5gB0PMXUTmXDm1NF6
         9U4/gzXfuBlR/49AueOQx9aTTAP0DcoktLQWFJR2rY5frfyQ9PhGWNF3X7VMNVd2Kagu
         saQw==
X-Gm-Message-State: AOJu0YyVsHT2oW1q5fJWwh6CWM6pn+BiZC8CSmdLJv2ggFe6vdcVAfyP
	UsmrVFtlFIJN8OhrwzYddiz3cgLhvb1JuwIvm8YVGwlX/VSTucSp2MrK
X-Gm-Gg: ATEYQzzpLsV8O74kURJDOKe7+wp+A4x+whsXuyh7OC7giygIFEUD1nJLvv1ukwbgaT0
	P8cCOrM+7JzMaY7zsPa7sPBHKtAi1JkjbNbSRyd7xwlTasViKDMPQ89yBS3HVajZK82WMjGo0s8
	3BmC6mxygJB4fOGvU2y8oUmLK40YHmMnXGBHDByBAg3ZIf+GBhEmJTCMMiYXqjP9X+b+txnzZRi
	BOzMFXed9SXouEdtYTvtLLNaixyNM6qIvmZ6GaynWQmQzsgHCMb7q6IWLxQs0xaslOH/OIa42Gn
	vx68GhoAafVsf401Je2t2GaJsXT3HtGnk8rG8eMSe8jnTZ/Vs2om1iyZdRVhLJFFlkNiW7JoKYz
	e/e1d0HKohdJ4EkbCQcWmNk3kGdvQ0SnHHlz7YvUwj3oCMhlshzJzhXjeudEUFbZihJKXWZ24WH
	82UcnBATK5hTmqQ95EKxUxYw0KquH5TqSmd3MA9LeR25OhJ7lpRCTMpndLb8/g59r/OIw5tAp74
	Q==
X-Received: by 2002:a05:6402:3484:b0:667:7213:b039 with SMTP id 4fb4d7f45d1cf-667b30033damr687823a12.20.1773779363622;
        Tue, 17 Mar 2026 13:29:23 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:23 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:08 +0100
Subject: [PATCH v3 09/13] ovmf: Convert confusing append to override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-9-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233344

The only reason why this append wasn't overriding qemu-system-native
entry from the line above is because that one was also defined with
:class-target override. To avoid any surprises in the future let's use
`:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index ec6c3b516c..6f9390e6d4 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -247,7 +247,7 @@ FILES:ovmf-shell-efi = " \
 
 DEPLOYDEP = ""
 DEPLOYDEP:class-target = "qemu-system-native:do_populate_sysroot"
-DEPLOYDEP:class-target += " ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'openssl-native:do_populate_sysroot', '', d)}"
+DEPLOYDEP:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'openssl-native:do_populate_sysroot', '', d)}"
 do_deploy[depends] += "${DEPLOYDEP}"
 
 do_deploy() {

-- 
2.53.0


