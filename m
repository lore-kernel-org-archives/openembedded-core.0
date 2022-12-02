Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAB5C4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 16:37:52 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.80463.1669999070959144169
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 08:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g5iBrTnG;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id r26so7151169edc.10
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 08:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sL0/vfZVLKch0n0apybPe/VV1PrfDa75V4f5YVbdLRA=;
        b=g5iBrTnGTOu6maubag0z204+qmzI3W/4u+oW3Fh+QWAW9ecwdH12JYGwQ30HMENTgm
         e5hfnuxe37lIDk6e54/qgvT+F+nxVNli9MFhVnlPlmUOTlI2QjwLKfyk+XoHCPlok92F
         nkz0yfoAeEdmZtmbOjXe6kTgK40FA8ziEgkTKbKj1XcyErThIx/fYRx0nsQqlA10ZzPd
         4w3MfSbH7yy/vb5yBZFI9qaRXXFlXvla+nDoHK40QSqhuRRjkePkct58R8gkaaS6f0t0
         FWcNUsMZj97RVL3HrdYJ9KBBJISGp2ihNW6WdR+T0s4v1QmL75SUTVSYfII/oVXsui/1
         y68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sL0/vfZVLKch0n0apybPe/VV1PrfDa75V4f5YVbdLRA=;
        b=hSGa//RhllO3du0y/qz8MZO+sJJTy5E+2ktOro14KKGnfe7g5cy/ore6vAb9F05k9V
         9gY+Tuj/y3l7TK3myQwM277Ddk46Laug+gYSy6PPfdyi8hDNce9KMueAVWB77QRMFAcy
         TYBGhkjv8sBDA9LmhezhVLfRw4z3+JAjlYDL/ETdbvOu+fv8X/8V5//UEejgeFVRJ0pG
         Sj20nmA2ndVEtNzszrf78H+7pVy1Rflr+MKIkffXyzdbqI+Hx+oes5KrAxU7m9R3Sl7d
         8/ussxjJVkWzL+Sa/nhXvbiGqp6JqXo81o2xrcQwhkHTkrzAzKuDiY7+9FYat3M/Wl6I
         lKUw==
X-Gm-Message-State: ANoB5pmQU33VH9YQ3J48B0y45IRSgpCa0Y8lYFs16n4fXKkemZxLtEXS
	PieerHfhDm2uGK9J1d0VQAWWaLxP2E4=
X-Google-Smtp-Source: AA0mqf5pDxapqs8eiDTywWovZUiqpJuGnf/Y3frZI6uEXYBCynpGoWUimG+/J59AMtYN2S3LVY3MkA==
X-Received: by 2002:a05:6402:530c:b0:462:df63:5ec5 with SMTP id eo12-20020a056402530c00b00462df635ec5mr64686341edb.147.1669999069535;
        Fri, 02 Dec 2022 08:37:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id kj22-20020a170907765600b007c090da9eb4sm3244340ejc.82.2022.12.02.08.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:37:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] ptest-packagelists.inc: do not run valgrind ptests on 32 bit x86
Date: Fri,  2 Dec 2022 17:37:39 +0100
Message-Id: <20221202163739.1194505-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202163739.1194505-1-alex@linutronix.de>
References: <20221202163739.1194505-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 16:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174243

Valgrind build itself with -mpreferred-stack-boundary=2 on that
target (and the tests expect that). On the other hand, we enable
SSE instructions, which expect things to be aligned on 16 byte
boundary (e.g. -mpreferred-stack-boundary=4). This won't be
reported at compile time and results in crashes at runtime, e.g.
vgdb simply does not work at all and crashes out immediately.
I am not sure how to resolve that, or whether we even should,
but the issue is reported here:
https://bugs.kde.org/show_bug.cgi?id=462553

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 66b1fcbe3f..48dec07577 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -108,6 +108,8 @@ PTESTS_SLOW = "\
 PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
 PTESTS_PROBLEMS:append:riscv64 = "valgrind-ptest"
 PTESTS_SLOW:append:libc-musl = " libc-test-ptest"
+PTESTS_SLOW:remove:x86 = "valgrind-ptest"
+PTESTS_PROBLEMS:append:x86 = "valgrind-ptest"
 
 #    ruby-ptest \ # Timeout
 #    lz4-ptest \ # Needs a rewrite
-- 
2.30.2


