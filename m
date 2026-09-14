Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED994C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:09:35 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18757.1789387772502073887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mwu+PaPI;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48431648f33so1823151f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387771; x=1789992571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ak4JguUkXyvmR+XOM5RCm9KLGrYKl2nEQe7oAUZd/uk=;
        b=mwu+PaPIrTaQkx+xUDtH7XDskeJ9oiEXGDXmFPN6x9+vImtX/Ujkfn+oqK38rSj0v4
         9KbjOsi5zbQJ9QgrCkEWQFyu+OLPm8arKMXLYSAY9ceF7V/jOPk2ha/ssQr8vdZiudVd
         b5C/xZTLwsV5zDEIM0+y+FjzWrEqJ7T4yOp0ZM9LKE1HtB+tl9jXNHhiABIbGx8PzNQr
         DeoxQVsrWzLuPspsJfmKvvzjnTZvCXDMv5BjucEPwMhzpzehARO94tNM8kU+DFhHS8on
         KXM0VR8M8PkFGMWAoKxsGaMAfKpWVL/sazcmMGHJzI3WqU8lMAk1BpYCi+P4RpDAdL/i
         3BPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387771; x=1789992571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ak4JguUkXyvmR+XOM5RCm9KLGrYKl2nEQe7oAUZd/uk=;
        b=ORX8g1d3ygFTDptm4a6Qh4bX9Z64MHa7eBDmRmbGOhSvkiSlfKeEQM9OkgtC4ETN2X
         X9PT9Qm4dje4XGYPdQFJtO1MygJYI/TqHxEKSiw6rrfWrhqox+SdAPthJXcKJdABX+In
         Kz5rxjrHTjiQz0066a6VbMxpl224HsZIGExIuvWN9cCF2D7aNPc2D3ly+GDmTQViI4lb
         vNrAkkUlbZ20uA7PXh5PklQA3oBejxxgsXi4acGvr+42/6vHo+OkcadMVaeeWG7fQBJ+
         3nd7n2wCT/2i5aInihCdyiB1KFIkZqklAOS00E+rV1iEiDcWcroKmGVObXQN6Cr6cKzd
         6mQw==
X-Gm-Message-State: AFuF++m9li/UH+1+gK0p5NfITzcaiDixTj3J21WXgY8XAyZ1UxcCQaS7
	zy8ilN+QEVVAURafJBuFlFfb47kLdEqg8ZPwx7C1yJ3ClkCeNhLDO6XvK6FW9w==
X-Gm-Gg: AYBFou1uBM2FAxtjFMqMIsNXJoernBxH7KXhZE/5SQV5NrCDKEwbO3LMIFN17GxacEn
	fTbXvKfdWKko8UcZoJo39fRqdubcgDJk+4Jli6P/KfJvOURuUR7Jb3iUl2Kd300zKobzf111a6k
	/lUR7U4ewbZK+jceyEE+dqcSzEDhs1xTNAQaRUosUtwTTYaFug2o/5uLw+ojjVIY3BvVJKacj3X
	s5Cb2DaOaBrk+UmJCjUbdmz5lXc2FUH2e8fZJJkduFU+P9QTqTYb/oJRofKIg1Rawwtoo2rONfj
	t1JoOlne0Yl19OHWW+IjQ7Awm0h5rJ5t1+C4CStmiJJJlpctGeU2gh9Ko1Z74EtwpLhj0iuCd5r
	5oL690FwHjShIm9H+lDNpdJ1HAGFaPV91WzZhEMKfQe85RlyUFFeEFqJIf/upVPRWwNlyx8sQtV
	2LJTGb6t1zPL8qHa4mQMiTYMeErhXC9I8QFa5foCHfdMg1/uLWQeSDXtxEoM+2J4U0GJ06UcgM/
	tKHqkh5ABORZP3SuLiJO5xUW0zrs9B2VjU=
X-Received: by 2002:a05:6000:61a:b0:487:462:d85d with SMTP id ffacd0b85a97d-4870462d8b6mr640873f8f.18.1789387770698;
        Mon, 14 Sep 2026 05:09:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm26590821f8f.20.2026.09.14.05.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:09:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] tzcode/tzdata: fix upstream version check
Date: Mon, 14 Sep 2026 14:09:23 +0200
Message-ID: <20260914120925.1153614-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914120925.1153614-1-alex.kanavin@gmail.com>
References: <20260914120925.1153614-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245771

From: Alexander Kanavin <alex@linutronix.de>

The webpage no longer lists tarballs directly, but the
actual directory with them can again be listed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/timezone/timezone.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 8939cd2cb5c..4860f00c8a8 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -14,7 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
-
 SRC_URI[tzcode.sha256sum] = "b1cffc3ace4c4c7cd0efba2f7add86ec3d0b79da48bcf03582671fd3c8feace8"
 SRC_URI[tzdata.sha256sum] = "e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4"
-- 
2.47.3


