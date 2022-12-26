Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24770C4332F
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 08:45:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.132424.1672044311585695113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 00:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NOX3043T;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so4616544wms.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 00:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1wOyVB7s11MYUhJcrU1gyp4st78TAJcj6/PFUxwXj0=;
        b=NOX3043TKyBFapQA7NnSh7OwJ8KUX0fA87L3rvEYA+6hewohO7ZuqYS/Y0PfB6Osnz
         Aat0Onxu7GpEtALterM64wbHrFc/WnVg7+vGDUx3kfSqiFj5FhNJkpu3m7OE9dw3HRqF
         Z1vdl6cgF+FRyYPy9MKUGlpVJuqDVTJloW43Vpt474tG2BxhIFxcg9khjxIZoRWewXjB
         6h0shluHuOIRPiJTB5uO3LhOMYufuD0xafB+7RjucOH+9bEtbPeOQrYTEznevEe7OVz8
         Rz23vxwGyqXVvc9YXnDaOWkyQJRqaqV1mO+FTIxp5noYcJCCsDNe9aY/IFtePxqkb/4M
         i06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1wOyVB7s11MYUhJcrU1gyp4st78TAJcj6/PFUxwXj0=;
        b=BeDilHByZYimqJYcG5aMFku3INYcJzgHTWDTwQvpHRwvdqmt1rwLRJsIvuyWdHE9Vp
         UkwR1/VWsQx902/oa9RNMkLt1kycyy9CuE5ns2hzTiqWILUYoK1G5ITHLGiarGbZzmkE
         f7XUnhej8+CgZSemwNs6KQjRPd7wEyX7SJdA2UiBiIg/wILr7BCZO9ZDhf5kZb/16eRx
         tAnQYYiGODgp/9T5kydCdUl172hCLZuOQiq4Ob5opmfw5XhpASlds0Bwa4S1sMou1R5S
         9AsLyBpTT4Vt/FqP6wUgS1O+/EK30TjIqXfwwYiilNFJwJ/X8R+2+wi6Q5/zO+Q6GLUb
         pKzg==
X-Gm-Message-State: AFqh2krHJNTLQ9rWSUOdQbSg1TUXps70q0Cg3HNBzBNwafqzoeHAH33N
	G/k4GDP8SjwO4eq1zw1Af7ns9RyEknQ=
X-Google-Smtp-Source: AMrXdXshPcwwH/VeT0qIIldXj4lrrYS4dPCMlyydRx4T03Fdi+3jRFchYU31pkc6hpi/RMTYS4y/cw==
X-Received: by 2002:a05:600c:1c12:b0:3d3:5841:e8af with SMTP id j18-20020a05600c1c1200b003d35841e8afmr12519670wms.25.1672044309891;
        Mon, 26 Dec 2022 00:45:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n64-20020a1ca443000000b003d21759db42sm18203942wme.5.2022.12.26.00.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 00:45:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 3/3] valgrind: disable tests that started failing after switching to x86-64-v3 target
Date: Mon, 26 Dec 2022 09:44:55 +0100
Message-Id: <20221226084455.2835751-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221226084455.2835751-1-alex@linutronix.de>
References: <20221226084455.2835751-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 08:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175015

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


