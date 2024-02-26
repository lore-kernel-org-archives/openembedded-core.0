Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9718C54E49
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 13:32:09 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.20285.1708954320472246826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 05:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C6tusvw4;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso392973666b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 05:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708954319; x=1709559119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rD25fYdWZ5PBQ6+4sgGXozNUHlkn3qITh0G/plFTaBY=;
        b=C6tusvw4m4VUtAAqpjJqH7mye3j+yqWIJwYpCDFscD09Wtg/cYoe00NBhfPEkLOtay
         xR9YeTwlvZMbZ2pTRzYmPoMeSZFb7WBorx+g82cxFcWUs5XXWMNbvqL4hk0/mUStHnXf
         dJgvh1T3R2D3z4OZVQlPiK6NsT+iv5Y6ws02M5VMaMQf7cbcVgZte9qtaVca/NzsV0EN
         j6pqModH7A+FPFsSUJt/V7apfFF1sNgLTRRrItP2YUIY1otPRVvknFc8lBmXY8b92hMq
         YgHP7Md/g2hN1dtUZc6+d/NU3iHkx0iMb7CniIDzZ7uj4bQR5cw9XWdENSsX3FnIQNjQ
         ajDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708954319; x=1709559119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rD25fYdWZ5PBQ6+4sgGXozNUHlkn3qITh0G/plFTaBY=;
        b=GpN+r1pQFpKW+chcZvBFzrTbn/vILaMi0MxZ1V3vQHESC+EqYJ83ppO+Wh7fYDSsbf
         CkhvTB/0orQ94+lwFt12f0w6VsreKMbzwxx7G8kH/S0aztWGzKCiDAmri/Ew0gCpmXKz
         wA+//Tx5s3eImDVll0HKIcPhubsqb8oaImhNwr2UYkF+evj2FTShVDreCVjXeiQgNHxm
         AWgCbYc70UeeKBX+0CyctPMAj2OVqkNw8+xDIeuHCRzLrsZCNA4KTfQpj3RQIiX2pfaf
         vreZrfAweIRKd5S34VdZhkEtVouWRYuZU1hEbBLo0XTAIzV2ehaDP9kBwSwKzT39r3k0
         7Isw==
X-Gm-Message-State: AOJu0YxBfElFV7H6C7gSEeNYaa4B/caQLMYuUFMbbXxM8v9dUDmChtQw
	1kfx/dZlm/hR6PHI56PZL1x8tce1Se3LK5s1TIsNOh+utyWKo/HbDImZaURf
X-Google-Smtp-Source: AGHT+IFt/glOic8WgTR+mS6ODeOpYt6OVZW4zYeeuycB+20DRziPJW6xibgJMHRvq6LHGKA7JsmGKQ==
X-Received: by 2002:a17:907:20ee:b0:a3f:b3e0:a986 with SMTP id rh14-20020a17090720ee00b00a3fb3e0a986mr4848264ejb.72.1708954318683;
        Mon, 26 Feb 2024 05:31:58 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cu4-20020a170906ba8400b00a42ebdfda56sm2381079ejd.100.2024.02.26.05.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 05:31:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] pixman: explicitly disable openmp in native builds
Date: Mon, 26 Feb 2024 14:31:51 +0100
Message-ID: <20240226133151.2107307-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 13:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196201

* on some hosts (e.g. on my gentoo after recent update) it detects OpenMP in do_configure:
  Run-time dependency OpenMP found: YES 4.5
  but then fails in do_compile as shown in:
  http://errors.yoctoproject.org/Errors/Details/754632/

  gcc  -o test/fetch-test test/fetch-test.p/fetch-test.c.o -LTOPDIR/tmp-glibc/work/x86_64-linux/pixman-native/0.42.2/recipe-sysroot-native/usr/lib -LTOPDIR/tmp-glibc/work/x86_64-linux/pixman-native/0.42.2/recipe-sysroot-native/lib -Wl,--as-needed -Wl,--no-undefined -Wl,--enable-new-dtags -Wl,-rpath-link,TOPDIR/tmp-glibc/work/x86_64-linux/pixman-native/0.42.2/recipe-sysroot-native/usr/lib -Wl,-rpath-link,TOPDIR/tmp-glibc/work/x86_64-linux/pixman-native/0.42.2/recipe-sysroot-native/lib -Wl,-rpath,TOPDIR/tmp-glibc/work/x86_64-linux/pixman-native/0.42.2/recipe-sysroot-native/usr/lib -Wl,-rpath,TOPDIR/tmp-glibc/work/x86_64-linux/pixman-native/0.42.2/recipe-sysroot-native/lib -Wl,-O1 '-Wl,-rpath,$ORIGIN/../pixman' -Wl,-rpath-link,TOPDIR/tmp-glibc/work/x86_64-linux/pixman-native/0.42.2/build/pixman -Wl,--start-group test/libtestutils.a pixman/libpixman-1.so.0.42.2 -pthread -fopenmp -fopenmp -lm -Wl,--end-group
  gcc: fatal error: cannot read spec file ‘libgomp.spec’: No such file or directory
  compilation terminated.

  it's only used in tests, so should be safe to disable for native builds

* the check in meson uses /usr/include/omp.h which is provided by libomp
  even when openmp support is disabled in native gcc in gentoo this happned
  after switching from 17.1 profile to 23.0 which doesn't include openmp
  USE flag by default, if you later run depclean it will uninstall libomp
  as well which will fix this conflict in meson's OpenMP autodetection

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
index 8a93f8c0fe..23ae0cbb27 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -40,6 +40,8 @@ EXTRA_OEMESON:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEA
 EXTRA_OEMESON:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=disabled",d)}"
 EXTRA_OEMESON:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=disabled",d)}"
 
+EXTRA_OEMESON:append:class-native = " -Dopenmp=disabled"
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2023-37769] = "not-applicable-config: stress-test is an uninstalled test"
-- 
2.44.0


