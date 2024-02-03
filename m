Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76968C4828D
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:23 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.23494.1706987717685493792
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xwxccMj5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5cdf76cde78so2912961a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987716; x=1707592516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMgWiLueD846YOkZo/ZPx1QqJDE9TShR0saqLwfvgSg=;
        b=xwxccMj5ofEpOmaGCO+RnjNNIRg/M3ybqxfwJTJmm8LbQF6B1vt9uFkT1kEQg6MGtb
         SLovJdM9OG+mLpSlgTLEKl0Qora633R9VPz5y0Y+smnLzrIzI10I7llWeVDT2FxskN8E
         CLmTLcLjhhi633q0tDzS11gfrBxGqcP0MiqojwlQdsmjsS1wfC8xjoptYZFL4aM2mxo1
         w8hA9q0VVO3itL32niZOTNgkbuUyGvUs5KPA+8m94VR7ObYuwaNJMggxIoaj5nfp7ynk
         htBmUAngMh32DrmuOy53mOKYeqkKf4UzHW6Gousjc1am52nO6vVv2K+LOqH5/AEIm4yr
         za7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987716; x=1707592516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMgWiLueD846YOkZo/ZPx1QqJDE9TShR0saqLwfvgSg=;
        b=LKylGtHwIujJlcQedS6NMDN4H4bXRk1C3zj5QbkqGrKegHWsdjSnXnIMErxtTL7Bss
         oUMSG3WBuosFB9gG8uiefR3DiEjb4xo+hIlhxKSkN8NWxUoe0r9qKKXQdYY1sqA0NelF
         1Bp2k4jgxsEwUSax/B9BrR3MDG0XYkccSt+W8z3rEMEga1Dpp2K6B+OmX1zZ4pfVN5Dz
         9ERKCqydFcfkgOcPnqU0F5zhEORZvWwK4P9YcG4be9ZJsHoAsL4aYxamFrJyWEYSEUxo
         /f7jyFwPxTrTMYWTunsSCV2X7eqWxraEL5UFmynsVqnAy0LirAQU02fweaBpnI647Jxm
         UIXg==
X-Gm-Message-State: AOJu0YyM31HuNjeLISAtZFu45Qsl+mKtyG10aXAswntDcJ2twuX1uMu3
	AZp5E+5F0AhoKpskezy70ywVRQB+JPpUl+4FssFrDhyQWWQbQjqpuKHjDwILNRw9P3WHg6At6Xa
	fk3g=
X-Google-Smtp-Source: AGHT+IGzg/VTyU3vWv4DQD+mmG0ajdIG6A/ey49r+VaW5l3E3EN/MY4hkxfudfX8Ga1v3ciru3EN/g==
X-Received: by 2002:a05:6a21:3483:b0:19c:a883:4714 with SMTP id yo3-20020a056a21348300b0019ca8834714mr4851375pzb.3.1706987716457;
        Sat, 03 Feb 2024 11:15:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.15.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:15:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 15/15] tcl: Fix prepending to run-ptest script
Date: Sat,  3 Feb 2024 09:14:42 -1000
Message-Id: <5f49d4c3f528c1e9a2884cc9cc8026b5d43517f9.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194859

From: Khem Raj <raj.khem@gmail.com>

This ensures that string is prepended properly and eclosed in ''
Fixes the ptest runs on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7bb45591f9caa7ff6b065220927a26e8261e2866)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
index b33a78e147..bb75353a5a 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
@@ -88,7 +88,7 @@ do_install_ptest() {
 
 do_install_ptest:append:libc-musl () {
 	# Assumes locales other than provided by musl-locales
-	sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="unixInit-3*"|' ${D}${PTEST_PATH}/run-ptest
+	sed -i -e "s|SKIPPED_TESTS='|SKIPPED_TESTS='unixInit-3* |" ${D}${PTEST_PATH}/run-ptest
 }
 
 # Fix some paths that might be used by Tcl extensions
-- 
2.34.1


