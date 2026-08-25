Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F25C61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 20:50:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32356.1787691000516914880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 13:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YtFeLpMa;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4998e0916faso592705e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787690999; x=1788295799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/X7R6StMj7+V6+wRmGTvPPntpAJUw4h5kDGIE74bZ/8=;
        b=YtFeLpMapGvfcbv3ZUa6GgZ/CTCH01eezKwb7Riby35Jfmyh5iPoxCzla8+gm+G+Fu
         w/bhCYfeZKCuDWOhSPzQgOVepx3znS3I1LLzCmslas2rQe6ZgVEtHQMFo8NdO66wcoEb
         fRCUueryUEyTPjbIJe0oARrIxccYIzjHPZv3aOIFkmLtLLRNzT0Wo/1eVtGNySlClyqO
         nN57KFrWEVkKNNKBsPnbu9OxZGHGr+bEFgOBP9/TBI5xOtfLna1pw8m71H+jhbIUruU6
         N9hvGKIF6GHb0xvQj7aJibAn7CyViSnAUuUN17Jy2L2kK2f1v2XPQZYu7gYu2zZ6zFBx
         6PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787690999; x=1788295799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/X7R6StMj7+V6+wRmGTvPPntpAJUw4h5kDGIE74bZ/8=;
        b=qMhPdH8fTsusSA3UZUVtPbnteS67sDZoLVDlF/rGtzj4S29O59Dd34v0GMRJxRTgUw
         /lwl33sSY5PCxjtKN4t3bYrnQE+W/THbJJR1g2DBEv0d1QnZUjDgbeAqHazLRsOvPXUq
         Ix5L+d1D5pcyxs/QRGsbfx1Bmj7psd05KJjYyGNLS1FKpWPrCmfnSLBM3Xi9EyQXEadT
         x+Gbc75646cAJT6b566N9AfP5kLAnDc+Bv7q96+COHAU9xHWi4qVHyWQt9xQ8BYoZtf7
         8QtwpgP2D4LZ4zS4WgDBprz/K17vXXLwpIn4oCtGc0JHJ5YOfA9lIgDYUgyXuXYQlYj+
         Diiw==
X-Gm-Message-State: AFuF++kzGbItULBXjxNPk+RDAHyqlMXBbOz+ZGkWiBd5HJKtSr99/rYZ
	4dxTK3k1CTU0JSmAVhuX5yoQ29JnNtJhoOhUpYTsJlkQbH30omEPOjr+7rpMEd/ZTII=
X-Gm-Gg: AR+sD10UuontL6AdVfhRBniTz/RJ9/7jBDOdEyvUKTtv1miSfJ99aSLW8NP8UQR2LQ5
	WetWouj9ypfQC6yqPotZnEz/0ulM0RlIWSfQ6plNXzI2KjGbLQ7heBlB4fgfJqx8vvOUnXwJoQB
	DMyMcnMi9EDbMLXm5ometJWtkRBJWmDGaqCSbK3tSdLE1nmBkKjvamxdHEtzWynxM5mxicVn8kg
	hhoRXnOhalXL9PjfYg03AC5Zn8uPTMBq/nBsQRKGenAMGNNZZ2sFEf0inbspR7zfICPTAW4HPyK
	n41meQGjrz4UrB2idWdJKA2ad9mi211adg3zfugV7XuPgmG8ipv7/CCMH98rICoyyVt3d+ZyBA0
	5FJGjy2fKP+AxhHJ2HgI1ShAb3P0kd4bVFs7kIOAtRiOEWye9Iv98oG14zyOg3anCUmHw+5FIhJ
	h0Q87FKMJYgiSFZCEPC0h3KeYuWffRhtfAU590BUkuLJoAZituQy5EmLBvJmw1m22U0QrS3l40m
	lJMaa7QYmGRy5UAh0xmfuhIYkhA0+Sofv39mAs7ZzWIsp/TBfwkXHc8p/nLKzn7Fh1rxAON1mrU
	RIGOLnp64Gtz
X-Received: by 2002:a05:600c:138a:b0:499:d63b:a6da with SMTP id 5b1f17b1804b1-499dc6e002emr12605685e9.2.1787690998519;
        Tue, 25 Aug 2026 13:49:58 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca98095sm4507845e9.5.2026.08.25.13.49.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Aug 2026 13:49:58 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v5 0/5] Make signed kernel modules stripped
Date: Tue, 25 Aug 2026 22:49:25 +0200
Message-ID: <20260825204931.17628-1-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244274

- Re-sign kernel modules after the package stripping process.
- Remove the package-stripping skip for signed kernel modules from package.py.
- Add KERNEL_MODULE_INSTALL_PREFIX variable

Note that tests have been made on core-minimal-image for in-tree modules
and on crypto-dev and lttng-modules for out-of-tree modules.

changes in V5:

    - Adapt signing function for out-of-tree modules.

changes in v4:

    - Re-sign kernel modules after package stripping process
    - Remove package-stripping skip in package.py
    - Add MOD_INSTALL_PREFIX variable

changes in v3:

    - Fixing rebase issue.

changes in v2:

    - Use the conditional INSTALL_MOD_STRIP environment variable to avoid
      duplicating the oe_runmake call.
    - Use `scripts/config` script instead of grepping .config file.# Please edit the description for the branch

Anis Bougrine (5):
  kernel-module-split.bbclass: add get_ext_mod function for module
    signing
  kernel: re-sign kernel modules after package stripping process
  package.py: remove stripping and splitting skip for signed kernel
    modules
  kernel: centralize kernel module installation path in one variable
  documentation.conf: add documentation for KERNEL_MODULE_INSTALL_PREFIX
    variable

 meta/classes-recipe/kernel-arch.bbclass       |  1 +
 .../kernel-module-split.bbclass               | 46 +++++++++++++++++++
 meta/classes-recipe/kernel.bbclass            | 12 ++---
 meta/classes-recipe/module.bbclass            |  2 +-
 meta/conf/documentation.conf                  |  1 +
 meta/lib/oe/package.py                        | 26 ++---------
 6 files changed, 58 insertions(+), 30 deletions(-)

-- 
2.50.1 (Apple Git-155)


