Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85DEE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 19:33:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.65279.1734377627606411500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 11:33:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=K9cyqOuY;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43618283d48so32492345e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 11:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1734377626; x=1734982426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7ZNqGAJbfX3oVIW7baUSYwGD3Ca2yCiPbt2S6GYLag=;
        b=K9cyqOuY8UHfNxaLbg7xmvtvNiL0/7enyW22A5W6lgQ7LmdyN3UMWmiELbM4GsnQx7
         xLd3U0STyWTU13JNrxnoWyKQ36Vc+CTJVIHI/dm+3RzHQWwmUiUlnlOtwjD0UK5bGgNn
         73NU7I/UbO0qMqNed/Dt77HUPejuRmmkrVBe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377626; x=1734982426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7ZNqGAJbfX3oVIW7baUSYwGD3Ca2yCiPbt2S6GYLag=;
        b=MF9lx/ff8OMbk9rsRglfdleOOCrmv6bM5PeiFx1bwPAgCB4ywOqdk2S+XxHVUy6KjA
         mDMqXCIXSKx7oHRJ6tvSg8hFHTCLSM3f6Qw0z3onD8vBDaHWu8ZY18a0z4m2r00qpkK6
         ehYJYc+JM8KFeYaVhytN/89QwGq1AYtfXSPY9gGVhGzrJDfvYl2g4y2rV6bTHMn1Q8x/
         MS/AHspbdERE3uAxRsWRWsF0rVOcECoB8i5ENAJ9tJFarHIgf/VqCqpDug4qaWqr1Lqe
         9bMy3eeDPbhaQQWYy7JwgP3RjRJZ1zMCeTWIFG8ytAuiqWSZwU31Eyo+j7wYWgVt+vdd
         zLHA==
X-Gm-Message-State: AOJu0YyJ6BT91fAlhqTV8zng5kCDOdZTG5pQWkwGlVSaeJ530s5ZT+sD
	o81OKpjf7zNDjyD3UDq98zISGMppYJ/swz0njwUKDYiC1bPy3DgtmgZmHirnpoXiAy+wTspza2J
	j
X-Gm-Gg: ASbGncvqj3aLUR3ijfeNwP1QLkGZgBDnwdPPZQAWqcEfbNlcJI9XOvxwE+pMC9UJ7PX
	w5HZV4d7+0LSciuyFDC+gHyiWgpuPbOZEfFwnORks6RDQbrQdD65Ec+3BLy7lyP8ErU1W0hu1wz
	WmrpwvsAr88C1xEn00VuyrhcpZcRqRRJJNMsyTOBcSOZM2/DfTFQzlFPWX4ZBP1Y29AdEdWC/zV
	3QAkwGgYfCQVt8ZqoQv4In3CW8I8LPmNYZwdp37kFW3+yf+rEo279YWzhN0iXUaSPRh17s=
X-Google-Smtp-Source: AGHT+IG50qy0UNIY5W5BIPjicULjH3+K8CHvhgDsIK+acmnPjPMkm5JpJV89nr3Htp2hODUSWulhVA==
X-Received: by 2002:a05:600c:198a:b0:434:fe3c:c67c with SMTP id 5b1f17b1804b1-436476cd473mr7431915e9.26.1734377625291;
        Mon, 16 Dec 2024 11:33:45 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436362c6ae8sm93245945e9.41.2024.12.16.11.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 11:33:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] perf: Fix a minor typo
Date: Mon, 16 Dec 2024 21:33:42 +0200
Message-Id: <20241216193342.826152-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 19:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208790

Fix a minor typo in a comment by replacing "nsures" with ensures.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 9cd6148a1d..c4b3257569 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -76,7 +76,7 @@ LDFLAGS="-ldl -lutil"
 # Perf's build system adds its own optimization flags for most TUs,
 # overriding the flags included here. But for some, perf does not add
 # any -O option, so ensure the distro's chosen optimization gets used
-# for those. Also include ${DEBUG_PREFIX_MAP} which nsures perf is
+# for those. Also include ${DEBUG_PREFIX_MAP} which ensures perf is
 # built with appropriate -f*-prefix-map options,
 # avoiding the 'buildpaths' QA warning.
 TARGET_CC_ARCH += "${SELECTED_OPTIMIZATION} ${DEBUG_PREFIX_MAP}"
-- 
2.39.5


