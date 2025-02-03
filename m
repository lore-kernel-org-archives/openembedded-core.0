Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340ECC3DA4A
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:01 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.92663.1738600915705551677
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=icwSCoE3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862a921123so3208435f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600914; x=1739205714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWjOWx5/nrK/ITx7sIPuXGKHf5NIaW0HZTk3WSteC4c=;
        b=icwSCoE3DYlZkFyROQVdLRiQl/czuccgMiBRobSd0M5Lc96lrFeUJWu9tDHs3ZMa4z
         Vx5VhpYzqQO4McnqeiqzHOoQJ1Kt4ZmVAtm0+xoj2W5aehTgHoKUxdlKVObwqOg3sHL1
         Wesxy8OO+AfFv2NQ/l6KCPqfhbVPWE2CMUSPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600914; x=1739205714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWjOWx5/nrK/ITx7sIPuXGKHf5NIaW0HZTk3WSteC4c=;
        b=Vf4RvcetMvwu3IIVK6lfUmNuM8NUxu5dDQYupK2Oy1o1/Wh/UhWfcWQOKig+KxYMJR
         GjBiKm0n2y5yxmNLWvlQ+Ll1ide8b/IxtAwqYJEs1c5Ulbn9kf+ikQeem2/bRShod289
         w8iqowY9x7oaGXM2M1eq+azSWFjDvkNyf9zICV0WI06bvJAXoMKL0V7RHyLOGkVz8Giq
         E9NultLFdR0w8E0AWl7sHh7I2hi5Cs22WLhg3VpoM2bkwwVvNdYeTHCW9XDmLgsJ9OZb
         d39FiRKkVRgBmLN4ZuY/bx2Kzrb7TsnRsVkGEd1U4fyxQPYwzu/vrzRPipssM48fsvLE
         Ps5g==
X-Gm-Message-State: AOJu0YzqUSg4DVdM09EKFvBVIjWOGbS+b4aWOSzhB5AF4/dWCOUwJqSe
	3QHFWXznwRK+En8DGtEXdxosjtG/t1us9lpB7qGLWuzOnBp+kuHk+ITAWhjL118PH+JX/E9xwAL
	l
X-Gm-Gg: ASbGncuSl33/QmSXbn2cUsWLB+xBuASzAQ2xvZz7rDCPGXXe6jhD2v8DfRewUGhJam0
	YNTscX+/vLbkEArTl+/KcYvDIMAz24V79DBT9WqQuOCDZ0/UckT5JFiLN2bak/Tj93c/Q9En6qC
	3Kw8wDzdL5J9YpNzLexKtmHVH/t9qk8YOdUvr0s42O2WHHtcr0ZTnCeD3nuf+ReeS8H6kpBUlJ4
	oFmgNVuWzeRlzyc7velK6hvFAwWZjvxNR7Nx8yG8TlpyhXZPH7YbFSvbCqA5/Auq9KAgW/KSlC6
	scxHtI/jzDLodc9Fqi5ysX93LzRDQgHDXrT6ilBGVkw5
X-Google-Smtp-Source: AGHT+IHlEDNgk0wPM2VQZOjomu65DIZOabLy0qbLz4Pwf0XaS4TLKKWykH7QYbGCzgikTUw9U1TeZw==
X-Received: by 2002:a5d:6503:0:b0:38b:da34:5915 with SMTP id ffacd0b85a97d-38c5195fd72mr15265078f8f.23.1738600913652;
        Mon, 03 Feb 2025 08:41:53 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/46] mc: upgrade 4.8.32 -> 4.8.33
Date: Mon,  3 Feb 2025 16:41:06 +0000
Message-ID: <20250203164130.3403325-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210695

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/mc/files/nomandate.patch          | 4 ++--
 meta/recipes-extended/mc/{mc_4.8.32.bb => mc_4.8.33.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.32.bb => mc_4.8.33.bb} (97%)

diff --git a/meta/recipes-extended/mc/files/nomandate.patch b/meta/recipes-extended/mc/files/nomandate.patch
index 92fa443865d..297d2c7bd15 100644
--- a/meta/recipes-extended/mc/files/nomandate.patch
+++ b/meta/recipes-extended/mc/files/nomandate.patch
@@ -1,4 +1,4 @@
-From 78c5fd90a052f95157b3914c708a08b2eeab0154 Mon Sep 17 00:00:00 2001
+From 75b0c46bce7438fd4d4cf3d18c2d83f874793111 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 4 Feb 2020 18:12:15 +0000
 Subject: [PATCH] mc: Fix manpage date indeterminism
@@ -20,7 +20,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/doc/man/date-of-man-include.am b/doc/man/date-of-man-include.am
-index 96f9f10..d734c5d 100644
+index ede02e4..19300eb 100644
 --- a/doc/man/date-of-man-include.am
 +++ b/doc/man/date-of-man-include.am
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-extended/mc/mc_4.8.32.bb b/meta/recipes-extended/mc/mc_4.8.33.bb
similarity index 97%
rename from meta/recipes-extended/mc/mc_4.8.32.bb
rename to meta/recipes-extended/mc/mc_4.8.33.bb
index 97d4cc0b010..ec50cfc7ce1 100644
--- a/meta/recipes-extended/mc/mc_4.8.32.bb
+++ b/meta/recipes-extended/mc/mc_4.8.33.bb
@@ -11,7 +11,7 @@ RRECOMMENDS:${PN} = "ncurses-terminfo"
 SRC_URI = "http://ftp.midnight-commander.org/${BPN}-${PV}.tar.bz2 \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] = "51a039ebd15d5e442312a7053a4ca28276b7f241050b7714d5bae5362ecd3319"
+SRC_URI[sha256sum] = "a3ceb0af84226fedfe5f339464ff2849c3f6bf0321b72027c47b2c10e66a6dba"
 
 inherit autotools gettext pkgconfig
 

