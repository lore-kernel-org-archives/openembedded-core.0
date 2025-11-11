Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC22CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:59:19 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19453.1762873149830698684
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yX6E/Bdz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3439e1b6f72so2274733a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873149; x=1763477949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTg2DWy+BucWAt6jlB+hfnmidd52UA99uHyPBfvB+FI=;
        b=yX6E/Bdz1huhcGqa0OnEUEiWRnygbai/KR5Qgn6LMDakx+HvD/15fwvPE6OeyLAwWN
         chvHu6VVoYavpiR5pnqR7CIJbzVS2MN2ICddFNcpyvEzg0EfxVmMoBGosh8F8Hqf+FxI
         b+ZaBhC+fxVdEYv+nY9omU1kzZc9Xm8WT+got+bVWcFH34awN/J9lcoQoHEWs/Y/6CdV
         5ZN7NhTrZvBngnsiRuE6IBIusX28krPvO7Lb3ykcFydlkFeCJWH5+OaeK6g+OCXkyOZZ
         QKaFoYFkxQDuhZ9C5VNWR5bThk2sJAkawreY8/C3ubnox/Tkoqoy1E9SeIXLaBYGXGcQ
         Zw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873149; x=1763477949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iTg2DWy+BucWAt6jlB+hfnmidd52UA99uHyPBfvB+FI=;
        b=EP9e4iGW3Qgnx9/Qc/r3++nePHc9iVfIfr/rx2JqpEJTZxCJRcEf0jWI93EG6SWe4h
         4Zt4RXbmombBCTNXg4GXdUA2l0iDg8NlUiEJFTRk9pqpxtxXTYAZcaOtFH9kYrluwlmq
         PI9TJEF6XORtaSWXT+uUYE/ThwyHnGhjCw+TorTmNFp9RQMUpQFxzLBcyt807sT09mFU
         qcP8QxdRT5aOpwdHxF+ejAuvglxsU51YNbLu69uRDx096h2RABul1+doHdHjXr8+SITz
         lpDiWFrozHKJxupUZoskZNEyJ4d9TsmPJM2iPJROwxyf8S3eq1reYDTdxoISew5n7xHX
         xV4w==
X-Gm-Message-State: AOJu0YwDq2uvpAPEFPmwkxwLssh03zXtcsnEr5qwmXy7BON1pt7ee2N+
	qCmzX5+/g10IgXGTe+wWDakHfbp6B9s1qkfcP1DDZHt5hK5+gGNOA1oIUM5P/vIf24242J7knGO
	3iGMzGK0=
X-Gm-Gg: ASbGncvLy+cPpAWEC59wPzK/GXYlcBvjv+zu92EnUYglsQWSdXdNWeHadHsx/ZLYMhA
	7LG+bvCzeHaePfwp1KXmm7h7Hfkgwa7JvrALbue+AANOVX21EWOXM/HDY6mVTWk9l6IHfQPltiZ
	5R5fanikVXzAgLQVpCnaIEYqsbTCCxC9iIBv80P1D/RXrbEQ37m/wSX5DhhzBRVZOH4m9mTDG7f
	94aNhUkWdMRmolglTlHC/UEiEFCAZIim5eWOGz/FXryow9BRCI0lj3hcesO5PlE+KL3WFrNpTHX
	gygszsoJHOplKvp6bVWlBesK80SRNmiW4VvaRj6CMIQxovgI1zD0bKZZTPFU+9d2J/uGBJxYs+k
	0JPMJvI+kqnH0GfMbtCGjRoI4pHup5nkIXLzQmLJyC1Cq85vJevA8nPlyC1ozH5tdvV4=
X-Google-Smtp-Source: AGHT+IG/ORnCu4HluzWXeX56wKgMzDwZkBEw8mWRxvwWdaqb4O+rVMnf2ooAnYqtAxXXUhNc3pPrKA==
X-Received: by 2002:a17:90a:e7ca:b0:340:f05a:3ebd with SMTP id 98e67ed59e1d1-3436ccfe431mr12877959a91.28.1762873149084;
        Tue, 11 Nov 2025 06:59:09 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.59.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:59:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/19] ca-certificates: fix on-target postinstall script
Date: Tue, 11 Nov 2025 06:58:25 -0800
Message-ID: <9a2bd3b6e2e53071a1463d2804d0d4fb17b1814f.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226182

From: Gyorgy Sarvari <skandigraun@gmail.com>

When the package is installed directly on the machine (instead of
installing it in the rootfs directly), the postinstall script fails with
the following error:

/usr/sbin/update-ca-certificates: line 75: shift: shift count out of range

The reason is that the "update-ca-certificates" script is executed with
the "--sysroot" argument, and as the sysroot $D is passed. However on the
target system this variable doesn't exist, so the argument is passed without
this mandatory value, and the execution fails.

To avoid this error, check if the $D variable exists, and pass the --sysroot
argument only when it does.

Reported-by: WXbet <Wxbet@proton.me>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cf39461e97098a1b28693299677888ba7e8bfccf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ca-certificates/ca-certificates_20250419.bb                | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
index f06a30bd6d..01f594095e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
@@ -60,7 +60,8 @@ do_install:append:class-target () {
 }
 
 pkg_postinst:${PN}:class-target () {
-    $D${sbindir}/update-ca-certificates --sysroot $D
+    [ -n "$D" ] && sysroot_args="--sysroot $D"
+    $D${sbindir}/update-ca-certificates $sysroot_args
 }
 
 CONFFILES:${PN} += "${sysconfdir}/ca-certificates.conf"
-- 
2.43.0


