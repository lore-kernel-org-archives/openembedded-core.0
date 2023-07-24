Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9E0C001DE
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 13:49:21 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.47390.1690206556803706408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 06:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Uqm+2zEz;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so6225459a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 06:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690206555; x=1690811355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fvp1su99kBcstYyQnZu+iM4vEzMTsaOrlITAAOW+udQ=;
        b=Uqm+2zEzMXGcxO3gNFiV7W/dbl8EG6VXfBbOP76GPsn3EkQyVQlHA/p+eb75fcKtP4
         NMlwhuIGWCTIzsMNH6ohtAYxgD7mWxODo5i6vpZ584nqm8KyTLgiwWnkZekWksqO23mA
         qt7OJ0Fwk+zvQOzFDUIhGoCYF6hU9XTxjVCw1szmeEkwt75yHTBO7F2/rAX0v+Hq91xv
         XyRLpjlYrumfhJkWQ8NTpBszru87fb/qr0E/3mECuLVFJezzksQsP1lWBqpJoPNyqgZY
         EJcJmV+sw1va/VtA/IGGGQgrXiBfftOWbdQFENei96mUpNwxoUyzI0W+mUQ56DDSVERy
         rncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690206555; x=1690811355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fvp1su99kBcstYyQnZu+iM4vEzMTsaOrlITAAOW+udQ=;
        b=cybn1xTk5wkw4vnQlWiAH1LDU/XNgOLh/nPl7UTtesrA55aBz56Uw5ZcLCK8MlSdqS
         qduGLcxRrGplYX/k/t1pCSjKVneJcaBwowPiFN1HcqtJ7SRJVLpfhSDzx6mHx5T3sM9x
         MdvV9kcUHfcAVOXztiSm5rN1qpEFqabXMZaf/XP8HNsQqv5kjXCQ30I+O3gkibcefqCy
         pO51VvpaRPs7g+ozPQLpUUTttKd19B1qGpOvP2F4RtLAUeUXmKnjTadkqO6Fq7WIl6su
         dqHkKCEcCFgauworz4xFZ38ZZuVxWZOw+uvViNZiGFqGbxSYkqnTOWI9rHu28C2BiArj
         r0+A==
X-Gm-Message-State: ABy/qLbxfaj/Wvt4opFMMj252G77T+rx0gSi1sA1FxYvhEm0gFgtE9aK
	6J4uT6oT7ZDmjG0lqNrbtTgVMEms3xJnlA==
X-Google-Smtp-Source: APBJJlF7q3cF7jKXOX2mhX94U7aEoOlnvUKfNH6T8Uf6L7OnNyv1YPdqCUn8+7h5V0OK/KvkK6ZSjw==
X-Received: by 2002:a05:6402:120b:b0:51d:acda:2f4a with SMTP id c11-20020a056402120b00b0051dacda2f4amr9087169edw.37.1690202137930;
        Mon, 24 Jul 2023 05:35:37 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id e6-20020a056402088600b005223d76a3e3sm149625edy.85.2023.07.24.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 05:35:37 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] rpm: Install and/or tweak rpm macros file to make rpmbuild work
Date: Mon, 24 Jul 2023 14:35:29 +0200
Message-ID: <20230724123529.288581-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 13:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184786

Some BSP architecture builds (e.g. genericx86-64 or anything from
meta-intel) don't have their /usr/lib/rpm/platform/<arch>-linux
directories. This causes rpmbuild fail on the target machine.

Use ${SDK_ARCH}-linux as the base arch which likely exists in
/usr/lib/rpm/platform and clone it as ${MACHINE_ARCH}-linux.

Also, fix %_lib and %_libdir in the new cloned platform directory
to use ${baselib} and ${libdir} so the RPM package contents will
be correct for library packages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.18.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
index 95a9e92f96..21f0127561 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
@@ -131,7 +131,20 @@ do_install:append:class-nativesdk() {
 # Rpm's make install creates var/tmp which clashes with base-files packaging
 do_install:append:class-target() {
     rm -rf ${D}/var
+
+    if [ -d "${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux" ]; then
+        if [ ! -d ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux ]; then
+            cp -r ${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux
+        fi
+    fi
+    if [ -d ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux ]; then
+        sed -i \
+            -e "s:^%_lib\t.*$:%_lib\t${baselib}:" \
+            -e "s:^%_libdir\t.*$:%_libdir\t${libdir}:" \
+            ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux/macros
+    fi
 }
+
 do_install:append:class-nativesdk() {
     rm -rf ${D}${SDKPATHNATIVE}/var
     # Ensure find-debuginfo is located correctly inside SDK
-- 
2.41.0


