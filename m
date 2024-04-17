Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C29FC04FFE
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 20:35:45 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.24866.1713386144371630188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 13:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ODLSBwGr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e4bf0b3e06so1788575ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 13:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713386144; x=1713990944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIBbInJ2rDVWaJ9gvwX3kE1dg+oShOxYEHN8JUlfsdQ=;
        b=ODLSBwGrWSIFuCUXQmdiAogrEgiW7iQGMzgZu8SiYXIW9tqweBIMF9l3e3xBHFtEcr
         0Lr/lpEMmHdp1rNJRhRLbFjXYkiLLxnUXPq3Hd61wIbE7r5lSrCDqevbFKYMBtoXBW8E
         c9bC7zKF4D/e97mDbVmxvp1kMmyKu6i4DxlSpF2B22y/bnzE3zMctQ4iIfuB2zNxt7fI
         xps2HkRmKt4FTOvKx8yAfPjMSgvkwj5GdcrxHkzY6LqEcOMyEUB4AyqXv/ntvQjxLhzo
         EQalwUpebH2esf85X0DlC78h83XQ4zDvgg3IJnCnMfXoBsiI3d/o1XddIMo8McV9pmXV
         nc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713386144; x=1713990944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIBbInJ2rDVWaJ9gvwX3kE1dg+oShOxYEHN8JUlfsdQ=;
        b=IrQ6PWfqoEZ+qFd8gGhOF2tSyQ4cGtbx46pOd/GIF1oVjcEWPK72WrWCwSm9odw9VL
         TWdJvqx7nlX/vyWfZT5L91DHfpK+KiM3gmZ8NF6UlWx4pr2+ThO/0r5PImS+Sz61wB1Z
         lDfGfASijXoxP+TsX6JGqWXxeGqdENcwXqkBAj+lgBHBrQympUUoGr2qW5Nw56enPS7G
         mdHzSRb5GTBvU+kg0N7vWG9kxZVUnnZZTnoO7+NhUnLCx0OFLu9c2DDDR3dxQ06e3kAK
         EwrpT/k4l5ev4Ph0gtMfn40bDMI9rIcq8bwoDqkWRC8y4wViXaV0xhzUiUIKWdvBJI1J
         DBMg==
X-Gm-Message-State: AOJu0Yz1iBjRhHUoz0ReJ+UE3h4n1fXc0qmwDs6anmRw5pmyzxWl3dhw
	iuzxRo9iQU3KZMlpPk5fm6B1gny2vpaaUK2ElFikF958iQ0ruINi8W89uwchlllsS+CKQJRN+cL
	Oilk=
X-Google-Smtp-Source: AGHT+IGeSqVJj987Ir7i0XbM+MHGT7UQ+bn8iccnu+guOuMJJFcNgrhPWBTtkWmHof00AKYVUK6x/g==
X-Received: by 2002:a17:90a:728b:b0:2a2:97ce:24f5 with SMTP id e11-20020a17090a728b00b002a297ce24f5mr566177pjg.35.1713386143679;
        Wed, 17 Apr 2024 13:35:43 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id s22-20020a17090aa11600b002ab664e5e17sm76876pjp.1.2024.04.17.13.35.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:35:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] rust: add CVE_CHECK_IGNORE for CVE-2024-24576
Date: Wed, 17 Apr 2024 13:35:27 -0700
Message-Id: <44e0b6b028657d32de5971d6a42a88767ef8c710.1713385733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713385733.git.steve@sakoman.com>
References: <cover.1713385733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 20:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198480

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE-2024-24576 only applies when invoking batch files (with the `bat` and `cmd` extensions) on Windows & No other platform or use is affected.
More details about CVE is here: https://nvd.nist.gov/vuln/detail/CVE-2024-24576

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index ea70ad786f..c377a680a7 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -5,3 +5,6 @@ RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
 
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
+
+#CVE-2024-24576 is specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2024-24576"
-- 
2.34.1


