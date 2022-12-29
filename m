Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E82C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:01:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.206919.1672329681867131080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:01:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OgHgxcoa;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso13498728wmb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1wOyVB7s11MYUhJcrU1gyp4st78TAJcj6/PFUxwXj0=;
        b=OgHgxcoarZzgFnvQ17zvFFRuFvhrg1Lh4ku+QjEKT+0IkVaA9Ed5egv3bo/mMGwatK
         DGjFPWK3OERhnN70lX3R1Yx675xjxruDBSDNtVkZl+23Qkviu6hw6RDgLAE6yRyV4B/5
         Fn9wmbseNpaDE8Js+Mg0cCKXKe5uMjJdwv20VYaiN25atdvd87quVijc8ZqBHqW9wHGL
         A/bTaOuQ5xmDc+JWcealtmnDjpJUi5lMe5aj5l7+VD0YtBKbKvXu4ltTaIIzvNyLGYve
         52K4Bf3pISO08CHg+PIt7K10g7hJYrvZjsUTiTpBJMHTka39JCXAp82DhoPUofZ8FRha
         OWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1wOyVB7s11MYUhJcrU1gyp4st78TAJcj6/PFUxwXj0=;
        b=s253kkf0lNplOw4kHWPz5U2Jc58AnHf+32M2+/T47Qy1vysNF15qcmFqQtdF0b9UKh
         kY+HR3ASFDUCtESRkn9EGafLNmlY2mCJJPgQwhgqGjBLeUUS/ic6zk64BH0xQUKBHg/8
         +uq2IhlwKApnERCeTDwk8CfRLzqWyU8/ArnAlg+QeoLOwW2o4k5frXCpDEyQmdfWUzMK
         WGLXzM5gbBO3P7gRlYw64Ed/lXtv1I7c8OcIofrE5J8+a6OCBurUKHyAsMx+T0vQ53To
         8xZK2sKb+lTjftjEzZB7hBy4KLSzvpihoZaALKh4l2U0Wz6OJghYqbAsRxL2ywmcmGOu
         t5ig==
X-Gm-Message-State: AFqh2krIWjm9oNg8m0WU7iU5TLDuW4iCDZ1geHzteJ7rAHVpGytrZiGu
	QGXUGupGzoeMjqFv5aZIrjId+aQBXO0=
X-Google-Smtp-Source: AMrXdXu1wvYOYXJWgT1V1P58E9+kTrXwuCYoKalrI5zp48Y9hNrd5+DgWxTxW5ltcX/jHx2JvqufXw==
X-Received: by 2002:a05:600c:358e:b0:3d9:9755:d659 with SMTP id p14-20020a05600c358e00b003d99755d659mr3221584wmq.22.1672329680234;
        Thu, 29 Dec 2022 08:01:20 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05600c3c8c00b003d1e34bcbb2sm28161735wmb.13.2022.12.29.08.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:01:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/10] valgrind: disable tests that started failing after switching to x86-64-v3 target
Date: Thu, 29 Dec 2022 17:01:04 +0100
Message-Id: <20221229160110.255775-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221229160110.255775-1-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175110

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


