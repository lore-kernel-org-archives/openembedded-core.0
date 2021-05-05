Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.9859.1620227990755515367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Np9IHUj/;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id u21so3418217ejo.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=894pxrVwHLcGAdDlYzfjfDc/S1ZBl5DvmdcPuZbbAhg=;
        b=Np9IHUj/3E/+OsFKw9YlhERZtxXG+XUEIlVdVHKiT6GmBpufBLBpNFDSf8kXPsINXe
         +ZBYR5QjCux5ocQFghW2w0eTE/0xAPZFnraLX7eBj4OufWaME+3py+D9hKgBHqkSebKY
         F/NYqeE3LidK/8UvRmlbhK8JX1nhFeJ12iQ/lcbjL5cgTbJCJcyKET38vYTmS6N1mjCF
         w46uyjKs5TY4urCfyL0omdR1ehSb4BRfP4EFeRK+tg7HpINU54PN75ERivxQCYIoKBmc
         glUo4bQKF9madXRpAkRq26+C93VJ8REi3+W0W3pkLWkvLCtae29QPanN114cOb+qkCNN
         3xkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=894pxrVwHLcGAdDlYzfjfDc/S1ZBl5DvmdcPuZbbAhg=;
        b=artgjFE4wAU3i/9KDlDihIyJ6I+qp1qzj55kr4yMCby33kYWR/lxitro12ruAY/0FD
         zW87to80Vx/xOy7rMG39k4JJR84Ioyl2BhwbI9gi54Knq8fTQAcwNTZqUhsf5zOAD4gw
         r8egLox/dru+IZDw42WFVQvAfvXfCNMdyD1d2gkAJFjP6gu+DElAVG9Upu3FphhBnJBe
         GxPzV5Ma/onqhi/r8d9sBObKc4nRYHvXq0yNO37WehgR4bYYBbLKB1bY9rNsyYVjjxMs
         SV2odf2pB63hf+FldfBVl2rKORPNOsMjj1SZ8y6ZCHuvhcqc2t+QUKI8KSoP2ojEKyqQ
         +NqQ==
X-Gm-Message-State: AOAM532uZ/0Bg2U5mdGTjfpDUe2wRmr2SQoucADuMDULtM62LjR0s3pc
	Cp/R/iB3Mxr6Q9/xaXJvn/2vzOogbs6aqw==
X-Google-Smtp-Source: ABdhPJylDqBNz5+qE8I/jHnys18tdwEIII67ULbgU4IsRxGK05kVYDlrhp/2FgrbA3TzSehZwxl7Wg==
X-Received: by 2002:a17:906:e281:: with SMTP id gg1mr21748825ejb.463.1620227989416;
        Wed, 05 May 2021 08:19:49 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:49 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 61/61] diffoscope: add native libraries to LD_LIBRARY_PATH
Date: Wed,  5 May 2021 17:18:50 +0200
Message-Id: <20210505151850.660512-61-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reversal of global setting in previous commit necessitates
a local fix, otherwise, this happens:

  File "/home/pokybuild/yocto-worker/reproducible-debian/build/build-st-52142/tmp/work/x86_64-linux/diffoscope-native/172-r0/recipe-sysroot-native/usr/lib/python3.9/ctypes/__init__.py", line 392, in __getitem__
    func = self._FuncPtr((name_or_ordinal, self))
AttributeError: nativepython3: undefined symbol: archive_errno

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/diffoscope/diffoscope_172.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/diffoscope/diffoscope_172.bb b/meta/recipes-support/diffoscope/diffoscope_172.bb
index bf4726e778..86dd5d8d70 100644
--- a/meta/recipes-support/diffoscope/diffoscope_172.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_172.bb
@@ -23,6 +23,7 @@ do_install_append_class-native() {
 	create_wrapper ${D}${bindir}/diffoscope \
 		MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
 		RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+		LD_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE} \
 		RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE}
 }
 
-- 
2.31.1

