Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86497E77348
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 22:05:59 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.30366.1696025156033053673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 15:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=NudxzbPQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so112981125e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 15:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696025154; x=1696629954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3r5yodj4daAJD1RoB817EoPPb8nFGz1GO7UoIlPYS8=;
        b=NudxzbPQu/P6mUpFRtycXxNvZjQRKMHqAU7j3xOZQLKYWr+jPy/KJ+Xb06kefgQ2Yu
         I6GBoZ0xqoCX+NDlvSQB6blFX0/hiaEomEhScVpEVMyU7Ng0jK1eUVDx2v5/2GKqtJCm
         EEKJ4LaDiuMLvy8HnHUtczvvDXQ8GqM0sUd8tLqAqWSCBJ7y/dmFJIizGqo/j3AqBbgF
         1x/6sZwIRX6N2ewOWR+EXspsPDSPhGJD2ICuBLwTWKAVn7PoSx3cQqVmR0sPSxO1gWaW
         OhF/on5h3Y+aHeBKh3pGwMRa4Y0b3N7zJ5w4NhFAWDzmVSADiGzqznm1KNev9in+vFJG
         khUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696025154; x=1696629954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3r5yodj4daAJD1RoB817EoPPb8nFGz1GO7UoIlPYS8=;
        b=F/x/1mRpZ38FM3UzDMVET3p1B1uTU3ENF/dE3kY6EukGEqyS7Z5i6X/w+cY3RmdALr
         78VcBbn/rAuLHnXkvLR9+9S/Wa4gjNn7RcqCvcNN/DO8VYI2ObCsOMBhsHcz/78RIBF/
         y/Nk1KDwWaK8j0yruQQpSpVve4KIEBLYwGUtF4E4Q3e0fPIFnWMsZsKR+ChPlRQMkvGt
         DOcujDxRcZyeZKt6mKVxrW1qcUtTWc8/XhjSixpBh3NKx8sq0e9yWZie0kLJV4qS6Kry
         YRBWsxc6k0FsLQQMNXRJ+d2S5btcUgVU9OU7OJLa/X1nUSKQ2eMo6X7hjAm6LHx4cem3
         oj0Q==
X-Gm-Message-State: AOJu0YwIdQn7RYagElDNn6svcHQdoZQhouClLA2ht0TmLQkDdot6ATnC
	pPeKtWWa0jr03F+i3s0x57ai+bjvcfV8OjaBx6I=
X-Google-Smtp-Source: AGHT+IHapKP+sLJCClxt0wJfnsKtAAIi+7BI3cy1SRgBOboMZH/PDVv38pxOhrwnAB1/yW6jVUI3vg==
X-Received: by 2002:a05:600c:4750:b0:406:54e4:359c with SMTP id w16-20020a05600c475000b0040654e4359cmr5118630wmo.19.1696025154375;
        Fri, 29 Sep 2023 15:05:54 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id t15-20020a1c770f000000b00406408dc788sm2210046wmi.44.2023.09.29.15.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 15:05:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 4/4] QA, ptest: Add a naive heuristic to detect test subdirectories
Date: Sat, 30 Sep 2023 00:05:03 +0200
Message-Id: <20230929220503.3169745-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230929220503.3169745-1-yoann.congal@smile.fr>
References: <20230929220503.3169745-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 22:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188452

From: Jérémy Rosen <jeremy.rosen@smile.fr>

If there is a "test" or "tests" subdirectory at toplevel, this usually
means we have some unit tests available.

This test is very good at detecting handcrafted tests and I was not able
to find any false positive.

False positive can be dealt with the usual INSANE_SKIP mechanism

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index a5d3793265..ba12f3ea16 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1398,6 +1398,10 @@ python do_qa_patch() {
     elif os.path.exists(os.path.join(srcdir, "Makefile.in")) and (match_line_in_files(srcdir, "**/Makefile.in", r'\s*TESTS\s*\+?=') or match_line_in_files(srcdir,"**/*.at",r'.*AT_INIT')):
         oe.qa.handle_error("unimplemented-ptest", "%s: autotools-based tests detected" % d.getVar('PN'), d)
 
+    # Last resort, detect a test directory in sources
+    elif any(filename.lower() in ["test", "tests"] for filename in os.listdir(srcdir)):
+        oe.qa.handle_error("unimplemented-ptest", "%s: test subdirectory detected" % d.getVar('PN'), d)
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


