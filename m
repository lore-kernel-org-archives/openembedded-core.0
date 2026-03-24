Return-Path: <khalifa@missingno.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546ACFEC118
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 20:49:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7578.1774385369394970320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 13:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@missingno.tech header.s=google header.b=lp6OiFg0;
 spf=pass (domain: missingno.tech, ip: 209.85.128.48, mailfrom: khalifa@missingno.tech)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb112c09so39264195e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 13:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=missingno.tech; s=google; t=1774385367; x=1774990167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RwS+lzI63K/Tv4FN81Cnue5pqWaT7ns/I2JWzU+vdnc=;
        b=lp6OiFg0N240HOFsc89Te4YVW/B4hVMUZo+j2mSID1/mL/JEfUWAQIIYDY9Gm0sEKv
         eGiO7iJxwvPqz8EdgtWC6EfZ8QsEH1g+ZF9B93Qs8oP1VdAMsVVDhhIBtWEW9yFbVAAQ
         Sfcbx1vIiAYgnXaB8pAlF80Ywa05BiQ8tNjWcqfiTyktCumItX9vgNYkClj3UKgdsOV/
         EvxwxmhlQBpIXRfnKFNRS053OlkRD1k1g9REYoZ5fggRD0tf0yM+sQgcis/oHrwco5Q8
         kB4OK1AXMDxsgSlDHmhF8mTY0wjV7PME3/5YHz2SnBBJRmXneMa9CYc/6EhAJ3I2k3K8
         JOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385367; x=1774990167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwS+lzI63K/Tv4FN81Cnue5pqWaT7ns/I2JWzU+vdnc=;
        b=cbZcf0A+S4BDrPDpyOlWt7tR2rBO697hctA8sPe00Us4w1FUQsDJuxjyIFcqF4TvuC
         Yye5BOBZSge+k7oxOG4sIYIC/qO0i5bo+u/izyiKsgmC0RnycEc+IZ2IEkLhkcx+V2qL
         JBgmwnunA8BrzZDUgfSKmca5OqIoiGugOdfREfR5+EEtprg9Ti+zK4128isiv8z8512O
         PZCbFsX9Kc3F8+7gecBCM+VaTqB6Bdl98+Y//9ieebDSmmmlDgzyC/KUTcvjo2IDtpA1
         IlCa/6GEomOCadPQPkDx5RAkYF0PtFWubmCWhMwUKPTeQ8P2oiSdhKtRPC5E8zgOLgeV
         HaFg==
X-Gm-Message-State: AOJu0YzBUJ/L6WNDI0Fd8yYDmyuIDkjZAYX87biD1mIsxUYnJl7EldTm
	2jltlc7hYfcfsCA70SG3VORkPGmqT70uVHdoM1Okkz85uSD07nwzAJyqnE33t/nwqmWzKBaPrss
	6ChqK
X-Gm-Gg: ATEYQzznPFQq56d57jZrHybv5KL2LqQB6qPW8h9XpvHawXd0DguuVRSdqoM+l0mI7XK
	7+QyHAL94EPCkQqkqLYxRh9mh3fTKLr+uGi/CTpSf+fsYPETwKWVUiA25oCcr4mUibzs6gmp6mp
	dgxFA+3qzgxaZga4f7S2yMT1bu4sfY6UBJkEBTsxAl6CKPjOX6PIU8gSGdDZZxy+jnPXkoiwQZa
	jjhnwCdeVEcmH2C8mqioJ72hoFDcEA+pwnzLKhYFG9jwqEaHYOHyIhzrfmBWtzALxOY1zrej3v9
	OxEcOvuAm7PVMzgLiZjIPCMdZZkqJEqQ/Ncby/uZbn54PH88EfdRI2f+1j4tM/ZGmUqL49uESEi
	GZGp6z8wx1QuEi9YVKN4beiYX6Cph4cD04TgNoHkjrmEc7hVfJOg/pbEWk/9HLXxKfuPuV1HnQE
	4KoeRGMWwz7gY8ogWWU6g7zhFbmvXdInuOAmIel16CiomzNvgV
X-Received: by 2002:a05:600c:1394:b0:486:fe46:b647 with SMTP id 5b1f17b1804b1-48715fd6193mr16725855e9.10.1774385367289;
        Tue, 24 Mar 2026 13:49:27 -0700 (PDT)
Received: from carthago.tail425053.ts.net ([2a01:e0a:3cc:6e40:ab6e:d948:b16d:ab9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48716547649sm9643245e9.0.2026.03.24.13.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:49:26 -0700 (PDT)
From: Khalifa Rouis <khalifa@missingno.tech>
To: openembedded-core@lists.openembedded.org
Cc: Khalifa Rouis <khalifa@missingno.tech>
Subject: [PATCH] weston-init: fix variable expansion typo in weston-start
Date: Tue, 24 Mar 2026 21:49:19 +0100
Message-ID: <20260324204919.787216-1-khalifa@missingno.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 20:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233826

The variable weston_modules was incorrectly enclosed as {$weston_modules}
instead of ${weston_modules}.
This typo prevents proper bash variable expansion when checking for and
appending Weston module arguments.

This commit corrects the syntax to ensure the modules are properly
evaluated.

Fixes: c8aa0222ce2b ("weston: wrapper for weston modules argument")
Signed-off-by: Khalifa Rouis <khalifa@missingno.tech>
---
 meta/recipes-graphics/wayland/weston-init/weston-start | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 3b13a0047a..38aa0c6e27 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -50,7 +50,7 @@ if [ -d "$modules_dir" ]; then
 
 		# process module
 		. $m
-		if [[ x"{$weston_modules}" != "x" ]]; then
+		if [[ x"${weston_modules}" != "x" ]]; then
 			add_weston_argument "${weston_modules}"
 		fi;
 	done
-- 
2.43.0


