Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93988C4708E
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:05 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.25147.1672425543613027481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 10:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NRyl6/bi;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id ay40so15684199wmb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1wOyVB7s11MYUhJcrU1gyp4st78TAJcj6/PFUxwXj0=;
        b=NRyl6/biGk47Hnw2xk43aPfGjWmdjZR8HINDh0Y/tCX72tTkwRSwxtyxqn+kM7i9NG
         rCI9BYHLrMi9iPpQaJumKAUUgExr05S1yjH0Ot/UK276dwZI805M2L9WH/sO8U6OWPBH
         lONRfb+3aMVmFptOFa81cijkZrsKeNZKv56FIsXR15f181ZuhQJ1Ud0yj3KMG2/UQhtC
         EHJAOkQ+aoXtrxXMxzR87TWIFHH254sbUjgXx0k6ORj+TXkF+j+uGvEkCrz/WHxQjfCt
         HQB6c6b1f9H7+fP+04uTMTCqRrXzkHZgUP3F2jwo590ba4eNrxyCErUzKrj8pSaPyVze
         /x2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1wOyVB7s11MYUhJcrU1gyp4st78TAJcj6/PFUxwXj0=;
        b=mWkUA33FoySB6QTJnfA4IRD/Nvu2kXJS9RbgnKd8cyQxks4lNBb0Ow8l7873+LGQOU
         l7AkpA+K5EYKRkjaVAS8noYkVUZUHEoqO7sRbjFL3pPT4IJh4MmYRds2wfTmFzIqvgrF
         ss5CA5qFwFdH23wexoH7TKgJ+UTYWlN4cU5GxoNqATke1kpumO46hrgvhUs7vQGLDDSR
         TBgrwG0UlqDNzgagj8Iyaax+hQSzKZDCXndxnnpGsWaxYCA5lHz+lt7r/B0KrmgVT7pJ
         9h8hhvJO0NoDkrr3PfVDwYfhBPGbbq2+bQZHIaIi6RGsiyXk67Z+8CYAFWKZLmFi0DbY
         51yQ==
X-Gm-Message-State: AFqh2kr4ReUfVs5OqOfxAo4xQnN5I3lnvISnb47ZNQEsPvwwISKNgWIF
	QgV6ftpVI5hDtdW2u++ZPLGqTbpXjc8=
X-Google-Smtp-Source: AMrXdXvBCHRvSETlJOv39c+QXaymM/BiHnIJx/YpXUchP0GSkK/ww/Dh+65KEALm1dsqyK5yRtZBZw==
X-Received: by 2002:a05:600c:35d1:b0:3d3:58d1:2588 with SMTP id r17-20020a05600c35d100b003d358d12588mr23987221wmq.41.1672425542114;
        Fri, 30 Dec 2022 10:39:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm31426682wmq.32.2022.12.30.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 10:39:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/11] valgrind: disable tests that started failing after switching to x86-64-v3 target
Date: Fri, 30 Dec 2022 19:38:42 +0100
Message-Id: <20221230183850.3089510-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230183850.3089510-1-alex@linutronix.de>
References: <20221230183850.3089510-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175166

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/valgrind/valgrind_3.20.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
index cd9c4d9fe9..1e1f0ccdd3 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
@@ -242,6 +242,15 @@ do_install_ptest() {
     install ${S}/none/tests/tls.c ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/none/tests/
 }
 
+do_install_ptest:append:x86-64 () {
+    # https://bugs.kde.org/show_bug.cgi?id=463456
+    rm ${D}${PTEST_PATH}/memcheck/tests/origin6-fp.vgtest
+    # https://bugs.kde.org/show_bug.cgi?id=463458
+    rm ${D}${PTEST_PATH}/memcheck/tests/vcpu_fnfns.vgtest
+    # https://bugs.kde.org/show_bug.cgi?id=463463
+    rm ${D}${PTEST_PATH}/none/tests/amd64/fma.vgtest
+}
+
 # avoid stripping some generated binaries otherwise some of the tests will fail
 # run-strip-reloc.sh, run-strip-strmerge.sh and so on will fail
 INHIBIT_PACKAGE_STRIP_FILES += "\
-- 
2.30.2


