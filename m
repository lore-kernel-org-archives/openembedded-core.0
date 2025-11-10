Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E64CCFA1E
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:24:23 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45224.1762770257313030274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RxI5Ftxi;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7ae4656d6e4so3438518b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 02:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770256; x=1763375056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWA90UVrgbHkFQ7o+LvZAxjia8OhZXib3Eb6tHO/zkk=;
        b=RxI5Ftxio//es+5yDW+YSBVqGQgy54C36oJFBrh1rQ8Swrz0yH7wTWx/ZuLS4Dm2wy
         o41fHKvLIMwyfVfkV1ReFm4VhpfjvAPQ9ZbNQ8KAceRgryV9llMGrPXlSIUAOhVwKqqP
         OxuTmq32PxMuREXP7E3190RNjLGBaKnHJrfZ2eL/CDD/X51hpMLjG2DLuZzECvU2lh2Q
         eO3SHvVJue4ZdIluX0nkm0PD6+tXm3SZlpdSx3D08LIxuw1+ZgGWnJafqRdatHPAyv/n
         Prv2/8rub+ChqxdWqueIGCnEN+ojtNFVUpmQzndq8Byaa20KTW5RiyvuGao+z1aBHjwq
         Tj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770256; x=1763375056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mWA90UVrgbHkFQ7o+LvZAxjia8OhZXib3Eb6tHO/zkk=;
        b=u/JVJZnM89Kvqlx4H2aXslANMWuEs3ZEMosbiXb3Os726RP4UGdMXIU/GkrG0QArFD
         AqrdOWPau2TCc5f5IuXmXhnskuzwzLbGe4EpEnhX/P2gZzWQh1V7rU5y2bMOKVnXFQJX
         bUitPsw3lxFw6hPyWcFf284tinFJZcbNYk2EeuIRqBR70knfcjS2FBSPo6+esfSu6JqJ
         TR+tn3htmaHDGeHgZTgvo7KmBw2drz4UMxnXOosxAhCj1Q54YJLb5/fxeBsBbZjcmouK
         sS75dGPtkG7BYLRyBxirLT8jtC8fx4bNwnN6jAjSR2NBJVuciliuIgiztqXokP3ofArk
         fRVg==
X-Gm-Message-State: AOJu0YzpwySYT/j2ek2hnKkraECAgq+bvCu1Ag1s1b8UV+hk+pBXygBZ
	/XQjc74o03rA4fZTsOWhKwdEljfB+fnZB/Sf/fJK7jWMIjgjRUVJ2UociXCPXA==
X-Gm-Gg: ASbGncv27OBWo862ZYp/qOFF7HAZmDHsMCxxm8v1poEjIu4H9IePoNypCllTo4cTT88
	oZ9+/gFwE3J1mEBvgBRHppendlvaD6ylq2z1lUq82IoJkYl8jPMPluxOyzS7hnDFG7lQUTEwcPP
	c0QWxrB3GeODo23abC1G6fam+ljmABhh+2ubntF07mg76IPCvFQE8rBm5X73caIFDH++BI4TC8N
	O7VUk6jDXTPbDl51at9WA5BxMPlKZBEjwbOmSxYM37xlhGUH5AR7unFOSlMt9rB1zT2AJOD6g99
	LNbLZsBDq01G+hbuHiucC7L4qY8Y814zIvoXFgzssjR0rOgGqC5SPixkIkoGTKUWFizZNAJti0i
	zbM29bNndJ04+tXZbVM6YVwNORhapXGFH+jMS6BAs+SGh27p9jyYpqAHmozj0STJx9OA8OWxnVm
	THc0yLrEjCu8V3s5zGPd0yWXRb
X-Google-Smtp-Source: AGHT+IHJmAvF6uqfOx27c6RRNYZc9yC0EKVjnOhK4/k8XA8luFTMxkl92G7SsY8o8A/c5uBhkYNDnA==
X-Received: by 2002:a05:6a20:394c:b0:351:1cf3:7f20 with SMTP id adf61e73a8af0-353a2a19e18mr9489144637.59.1762770256597;
        Mon, 10 Nov 2025 02:24:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed21desm12753677a12.11.2025.11.10.02.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:24:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	WXbet <Wxbet@proton.me>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][walnascar][PATCH 5/5] ca-certificates: fix on-target postinstall script
Date: Mon, 10 Nov 2025 23:23:51 +1300
Message-ID: <20251110102359.2917153-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110102359.2917153-1-ankur.tyagi85@gmail.com>
References: <20251110102359.2917153-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226117

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
---
 .../ca-certificates/ca-certificates_20250419.bb                | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
index fd30b602ae..9b0757f3fa 100644
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

