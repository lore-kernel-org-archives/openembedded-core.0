Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15397C25B7C
	for <webhook@archiver.kernel.org>; Sun, 26 May 2024 07:32:35 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.2365.1716708745152078341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 00:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VKW/zuG6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-351da5838fcso1133657f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 00:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716708743; x=1717313543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ky0ezaZa4sP7+dmvAtMUdaH98kWgnuKlf6IPSQXPLU=;
        b=VKW/zuG6Uzx6kNtOBoF2IWWyGIW2jXDUiKa4CJ437lDG2xfzcSi2T+9x64wsOqERXa
         4qW88gs+lEG+JkM6YVx3eIeT4TXnKAsi1cInCb70FIsDaJNfSdMz4mLQR4MFRKXJpLTg
         NvFMbOZ/3jXPf7AfWudXXftWT/gbM6j77zKHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716708743; x=1717313543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ky0ezaZa4sP7+dmvAtMUdaH98kWgnuKlf6IPSQXPLU=;
        b=vJLjVRoRCqWE0Wifpcb/Wg3ZmECBWFS8PxRi3GBbcW0u8TplBIdd2kln40h36cmfjQ
         94MQp2uwB/0Wu1AKviOgNPssObZzLRB4WZrNPGm6iR1qAdkC3xMH2+IWNyJgPqrYwy35
         Ks6iBhviZK1ONlscg+XHTEApXmHUezjxe6IBCSdsChebYORkb5C0heGCINacIr8ILhdW
         5SgVExCZbTTEfOF8C7B66YE0JqzCvz59VXxLhyErbYZW8tTec60Pbf6pESJ9v+CzFwFF
         yOkbIut/C6rNJDUkQtToHGcsT2RRcwqYWN+17IDBrN+k/DUFItpx9eQX0zKVJiUn141s
         sNLg==
X-Gm-Message-State: AOJu0YxChdGK0HYr1ygJQrvT/Qs+1VzOMxQMJkTGiPkP0/I4ODw6psCK
	8p18jNw0breXi5yG1JFih/b6ihPSD4r+60qh/KEOHH5kWvhDRpmlJwWdj3vvvaXqVlr31dvS5A3
	K
X-Google-Smtp-Source: AGHT+IFvtjt4E4MAWbNmuSpk3/dUyxwCtYgq9CGp1LtYkigjtKLBi5RBMciXscT7s6zXYXhQz2z9zA==
X-Received: by 2002:adf:f247:0:b0:354:eb35:a02a with SMTP id ffacd0b85a97d-3552f9cfc56mr5023296f8f.70.1716708742958;
        Sun, 26 May 2024 00:32:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:254d:9238:6ba8:402e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a0931c9sm5786641f8f.65.2024.05.26.00.32.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 00:32:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to pull in python 3.12+ fix
Date: Sun, 26 May 2024 08:32:21 +0100
Message-Id: <20240526073221.2575435-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 07:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199879

Pull in a fix which avoids syntax warnings with python 3.12.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c70b5092332..5f32b3777ab 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "0d292df61aeb886ae8ca33d9edc3b6d0ff5c0f0f"
+SRCREV = "e11ae91da7d0711f5e33ea9dfbf1875dde3c1734"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
2.40.1


