Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959CFCDDE66
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 10:50:30 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6009.1729680628533465421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 03:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ISkj0tXe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43163667f0eso51442315e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 03:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729680627; x=1730285427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAT/rr/XpQmWvNMYWdm5FklqUT84ehzOwq03F71RuD8=;
        b=ISkj0tXei4gwNL84MlVy4Rpz3NeSZbjJCQYbJeH5ASM5KEH6YUuRO/hYEy0RB2kuiT
         WA+Pw8NMSP8ON9pyGnWYS538WRbNRUylRIl+UQFcJeGQVx6Hljs8ju9CHc2LImn/Rw09
         IQzfnrVWApE55Ug58iZKOD7RmyVRtFBLDW5BA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729680627; x=1730285427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAT/rr/XpQmWvNMYWdm5FklqUT84ehzOwq03F71RuD8=;
        b=dBR/UXddgCRpteKDq5qcF4T0MbJYdwk45ggRCEU5pJ61vsnKgGv5tM5WGbWrT6HTnH
         4hm7OXrOzZ1eG6YFmluy4HeGjV7NmWIKMhD2LDcjDw8IaXtilVGyIJQbdbVMVIcdF9Hx
         5mAoUSagLpLejues5C/GukvVi0vahPwubZFQ+zH3ct/MZDdPaFp9AZECH7Wd6UIIlzvq
         kR5GzLy9/JwGTSc6glK6eI0MNXb5ereCW6SxTtqlA0BnrMkMek/TyVFOm3RZYsOHoPkk
         g531eZVphCWhyF5g9zX3pf6Ds6ec+G9g6je36pB3XZYU5hCtYxIgd8tZ/AzEapay+ExQ
         E42w==
X-Gm-Message-State: AOJu0YwCIwYz8Wfggcqtzhnb48SLYeCm5XOP1eYufClO7HSRonI0Hp47
	mSNIruFd3GMepQSc2guq141sfeEig1gqBHH/GL1Wil68pDbs+JdmUKJ+3ri896hvjZm7XoIjqj+
	X
X-Google-Smtp-Source: AGHT+IFJYgJfS2ECzPGLnZUdnJLDR0ffK6xkofWeBZPFmwbFwfiePTIgb+ZFTCkXaxaImOUpF9BRDQ==
X-Received: by 2002:a05:600c:1d06:b0:430:563a:b20a with SMTP id 5b1f17b1804b1-431841fd955mr16062815e9.11.1729680626731;
        Wed, 23 Oct 2024 03:50:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186befc85sm12780435e9.27.2024.10.23.03.50.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 03:50:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] insane: Ensure package_qa tasks run in builds when expected
Date: Wed, 23 Oct 2024 11:50:25 +0100
Message-ID: <20241023105025.3376089-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023105025.3376089-1-richard.purdie@linuxfoundation.org>
References: <20241023105025.3376089-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 10:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206195

Currently, if you "bitbake XXX" and XXX depends on something else,
the do_package_qa teask for that something may not run. Users would
generally expect it to have though.

Add in the missing dependency to ensure that do_build does trigger
the right package_qa tasks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index d97f21f8fdd..47c8b9be10a 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1192,6 +1192,8 @@ do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
 do_package_qa[rdeptask] = "do_packagedata"
 addtask do_package_qa after do_packagedata do_package before do_build
 
+do_build[rdeptask] += "do_package_qa"
+
 # Add the package specific INSANE_SKIPs to the sstate dependencies
 python() {
     pkgs = (d.getVar('PACKAGES') or '').split()

