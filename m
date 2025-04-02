Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23FFC3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:37 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.2259.1743577896801747274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LTezP3fe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so45924815e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577894; x=1744182694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCyiv92k3KTyi/57X6LGs+5zaFP8HnzxqLf7q9pgfWs=;
        b=LTezP3fe1yesR4OhCi+k4n4ZRzjTbSPqa+ZJyv+EI5r06VpqJo2gJ9crjEz0v6xcge
         31jmcZzz11lhg4jM79NSvyFE10GjJ0JwLHuMGztrkXrcYmD0F0q9u+zwOq9ccunmAHIJ
         C5u2Or2gDLBbWtvkU0jnYT9FE/QeKUacVMI2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577894; x=1744182694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCyiv92k3KTyi/57X6LGs+5zaFP8HnzxqLf7q9pgfWs=;
        b=I2ZYuqYBRehXfu7zZrYF5rlPvhXWzobZzXDncCKtHj3BWE8oTdeRm3Qgn4DxDD6URq
         OssH7hQm70xg3iBVeOrZ5/1IxF9A4edGied7rKZM0hswpM2m4kHgwGrmaMpFhcbtHtjk
         Ni/PkH9VQQGjFdHKjf/WNim/dd1qD6KD+yJJH4Si3VWpYT8idUYzeEgilPBhAV0gTxHY
         QXRtClq9ihgIlzyxrdZ7hkZFa/gGwxtjxCeKnY86VfNzlSMZ1IPVt6W3FKKdDgjOj9Qt
         rtHLM9FJawih4cVtJuA4OH+WFwCjGRFEaAo1p9osxFT8r9eJyS/BXaK8eM9+g3wDnfCL
         Q7DA==
X-Gm-Message-State: AOJu0Yzs1i8I5/n+ivEIIrbUgU4KBZwboyhl0Hn4486DcZzXZ/qa18Aa
	stX9sQ6a7ZE9NKaurA4yBKT7Ttp8R19AuflGHB96TG5ERf+v/raX4y2AvAQRhH1vGY2xhraZia2
	c
X-Gm-Gg: ASbGncteK/1Tf3EZYWvjM3NV+s0/gYDnAIDqF5DL0DHGT44QqXUVwc/hw5Wsx+Ac6U1
	IJ+YSgwPr1c88sFaPPBmGxhnm/YP5UlDjlWyhm5pd0yXXJ+kUvkFgbBlsyBhclXn+5xe+Yz0NM0
	MF1n248Jc7dN8/eRH+2r/gqR3uhH4slMOXr6ozseV4ng5A83gK5/tcEcff+jHGz5ixDWrx8hHYW
	ZOGB3CpFSfipatRAJbE04UGEj/lB4OmCmnJVC3BpP4qoNPJLNLR3FQ1YWo6fUHXoqaAJBQyv23c
	DR+kUGFsHoRrwmG8Rse+iF6ilagjN7NGPo1TtIVdQ+y2Co+lz7dwrNez8Gp9AxdlGNhLUnrRhw=
	=
X-Google-Smtp-Source: AGHT+IFUqqQSbjaNetJi8C1TWspp8XLfID4ZXY8RxLXenbS0i+88WIJp/x7Nflvx7e4+KPhsC87vQw==
X-Received: by 2002:a05:600c:1c1c:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43db62b5d7emr127917755e9.29.1743577894523;
        Wed, 02 Apr 2025 00:11:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 29/48] python3-calver: upgrade 2022.6.26 -> 2025.04.01
Date: Wed,  2 Apr 2025 08:09:58 +0100
Message-ID: <20250402071017.2157620-29-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214202

Add tag to SRC_URI to verify SRCREV.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python3-calver/0001-setup.py-hard-code-version.patch | 9 +++------
 ...-calver_2022.6.26.bb => python3-calver_2025.04.01.bb} | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-calver_2022.6.26.bb => python3-calver_2025.04.01.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch b/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
index 43f8a78ef03..2f6627c339f 100644
--- a/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
+++ b/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
@@ -1,10 +1,10 @@
-From 390a233ed969f82b2ef209b23bfb523e785603f9 Mon Sep 17 00:00:00 2001
+From 4330fe9874ce72026860f96f35faf796e7ea8384 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Tue, 9 May 2023 10:19:41 -0400
 Subject: [PATCH] setup.py: hard-code version
 
 setup.py is pulling the build version from the current date rather than
-a release tag or other predictable method, causing reproducibility 
+a release tag or other predictable method, causing reproducibility
 issues in builds. Patch this to make reproducible builds work while
 discussing this with upstream maintainer (or developing a patch that can
 make calver rely on a more standard pyproject.toml solution).
@@ -17,7 +17,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 73f6b10..2e27cf1 100644
+index cff2eaf..79c883d 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -42,5 +42,5 @@ setup(
@@ -27,6 +27,3 @@ index 73f6b10..2e27cf1 100644
 -    version=calver_version(True),
 +    version=calver_version("2022.6.26"),
  )
--- 
-2.40.0
-
diff --git a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb b/meta/recipes-devtools/python/python3-calver_2025.04.01.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-calver_2022.6.26.bb
rename to meta/recipes-devtools/python/python3-calver_2025.04.01.bb
index b2e7e0769df..39081812c59 100644
--- a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
+++ b/meta/recipes-devtools/python/python3-calver_2025.04.01.bb
@@ -4,10 +4,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = " \
-    git://github.com/di/calver;branch=master;protocol=https \
+    git://github.com/di/calver;branch=master;protocol=https;tag=${PV} \
     file://0001-setup.py-hard-code-version.patch \
 "
-SRCREV = "3268d8acf2c345f32a1c5f08ba25dc67f76cca81"
+SRCREV = "5b62e5127f9ad5bb56bd09ccd8c44283a23ddb60"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 

