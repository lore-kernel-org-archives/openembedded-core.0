Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AECE748EE
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:55 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.62157.1696176050890051369
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fPxlQiwa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c77449a6daso562155ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176050; x=1696780850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zk69eq3HR/Sb3r9tIFkg/CnKBksGaCKcac4NtkgnHyM=;
        b=fPxlQiwaFHkqlFk2kzL3gUCE6tDt3FmkU0Tlg8G37vqJn7nVPxoj/UdQj3kaZCIiFW
         piQsnHKrzK8uX2QorRoRsBc9U20rBwRTgEjFScGH1jBhXDhGRaGTCmr2BXb3KrGuIqaX
         9ZYJR+w/YOQ+opIz2QOM4wxRe40Gv7fz9rFr95veB2ev/gn7m7dBbuMac9IquAEv9sVs
         4ft/3gUgAdr05srTzbhGsmDbkBCEpq8/QvSMjq2qon6nJYA9PXQ0yDOliJKICpv2NoGp
         RUA6uOcC0jR6OFDpIe4BPNEFj7vPM9Pc7PnU4A43nWQQafObqIJWk6RkrCueNN43p/ig
         eItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176050; x=1696780850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zk69eq3HR/Sb3r9tIFkg/CnKBksGaCKcac4NtkgnHyM=;
        b=vfonz886QHPf3B0TCInOlxEX733qgA9RvjCUVw11kWDXa6q+EkBKc2l8ARdFc8NVl2
         NvNKCQcjJen8rCLd4/XElXicxFV8+iWTTHuj7kn0lXKXN04/swtP7UK87R+7wWvOj6j4
         A/fqPZOQZFhcClGgI90e7bfu5UMR8onT1At73aGCUvl/MJbcvJPdtT5lT/mQRsQl9XUV
         nZah5gi0Qv6kzFBDl4AtCC4UTU3+oUcudnprruKin3XiyZsw76XA91QPul9QWDNZxSAT
         G6pEz48tG8+034xqLaqIZtzgyG7GihSTnPqed4vCAb4LDoxFdufEFznrlezu/1z+XUJn
         Wozg==
X-Gm-Message-State: AOJu0YzTe7+o6zV7G7shaqKNMtk/gtNlEhvXGbGdF+ioXedwiuf5XwBt
	sTDObfRRfL9+Hu+JnyzTXbwX15aLn/hlmedqrIo7Ew==
X-Google-Smtp-Source: AGHT+IEzc5f57AJZFiCYIuup2mEi5ENwAxKbWNoNEj1tA5QWrbt6xTPRnuj97eJfz7fu5D+TnGpbSQ==
X-Received: by 2002:a17:902:da84:b0:1c1:ecff:a637 with SMTP id j4-20020a170902da8400b001c1ecffa637mr10820557plx.15.1696176049635;
        Sun, 01 Oct 2023 09:00:49 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/23] core-image-ptest: Define a fallback for SUMMARY field
Date: Sun,  1 Oct 2023 06:00:04 -1000
Message-Id: <66c2245280dd6e22fa2de230de458ce5ba267f91.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188506

From: Khem Raj <raj.khem@gmail.com>

Fixes errors like below seen with bitbake core-image-ptest-fast

WARNING: core-image-ptest-apr-util-1.0-r0 do_recipe_qa: QA Issue: Recipe core-image-ptest-apr-util in /mnt/b/yoe/master/sources/poky/meta/recipes-core/images/core-image-ptest.bb does not contain a SUMMARY. Please a
dd an entry. [missing-metadata]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 307381c9267eb3a3e687c577a0afd552d44248f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/images/core-image-ptest.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index ddc56c8f9f..21754224d2 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -5,6 +5,7 @@ require core-image-minimal.bb
 require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also including the ${MCNAME} ptest package."
+SUMMARY ?= "${MCNAME} ptest image."
 HOMEPAGE = "https://www.yoctoproject.org/"
 
 PTESTS = "${PTESTS_SLOW} ${PTESTS_FAST}"
-- 
2.34.1


