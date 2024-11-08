Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67256D5C0E2
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.14260.1731077650387212973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h0TcpdvI;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so18274055e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077649; x=1731682449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsM2vWIiTxZFb5jVDbgBSFomOVAgkRyulvKLkPIPuag=;
        b=h0TcpdvIPyn5+4kWO8PEcBXmiH253RXjMv/cf0Qs8ST9NuOR2nBb/OEokHzuIkrij+
         a2IFX5qaFd+96Ui/UunOpVH0LAMXRCpoVzw+YdSbmOjZcsofiPDl1qeKW1+NjqhSz0C0
         DgPJg8preB8IyfgrRnI10Wgay550GcyxpHtGqbjzhz4EXgiqLJ9Q/TlfQj4YRxSEomPL
         5FPZYcYVn8YMQYa+kLoUm6h4u0xpPKAfboZAni3CuqIodHTZufoDnMK595JH8ZWjIEtF
         H2YrWd/ijl3zoYTgJsl6C/nHGsRr0tPS9VNLZ+PpNTHluda0ns84YNl/+PE/4MxJgMxf
         E6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077649; x=1731682449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsM2vWIiTxZFb5jVDbgBSFomOVAgkRyulvKLkPIPuag=;
        b=HMSlCbXJgCFeeb5UBUstbZJ7TFDMFCicPpczJoyhMlQeX6PUJw3YKKIIV3/kdOd07v
         hesE0hyuddM46DuyjCELWXPtRtuPxPe69q9E4op9p7bz2rHxKdNDzPBkN6t+gF9M4Zpb
         m5Lrbd3dvZkqsjSc2lGhEn5mxcdqo+1M7zSW79ebsAwRwG2WUPY57Sw9pNC06v4ckUwA
         0rZ3jZ8frGFgkuXW2iJq4bR0KaBLZfXzxEdP9JdlNZcFZ7XDyO0rYgniGZkdPqLx+rPb
         NmkGjIwmidRhR/yke6IOEbc9kd4Qz9RXy7sXszFdmZg/sap4LOi/EFLKIZKSvIbJ32ZY
         1NyQ==
X-Gm-Message-State: AOJu0YzasWXTBG/FEzCu2jpg46H3MlvaPoyXVJJwrcdrzZTfN6LxGjPW
	pctJodtLoVTAkP3pZzBfqK5oJagZ12blBS13ft1B/ZYYpargsxjPrKaiqg==
X-Google-Smtp-Source: AGHT+IGSdS4KIdIfvvy3OjiuxaB+BDgve+GmW6Uiip/6VoTEpI4q/ubTKQx55poB293F8iKDO4XA2w==
X-Received: by 2002:a05:6000:470c:b0:37d:36f2:e2cb with SMTP id ffacd0b85a97d-381f16180cdmr2794748f8f.0.1731077648714;
        Fri, 08 Nov 2024 06:54:08 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda0604bsm5064147f8f.105.2024.11.08.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 05/12] pseudo: Update to pull in fd leak fix
Date: Fri,  8 Nov 2024 15:53:29 +0100
Message-ID: <20241108145336.224466-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108145336.224466-1-martin.jansa@gmail.com>
References: <20241108145336.224466-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206879

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Pull in:
    pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak

    Use close-on-exec (O_CLOEXEC) flag when open log file to
    make sure its file descriptor is not leaked to parent
    process on fork/exec.

    Fixes [YOCTO #13311]

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d38c9d79c0..134d941609 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "9df045968d739ead0bebacce415d05269694de4e"
+SRCREV = "ec6151a2b057109b3f798f151a36690af582e166"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.47.0


