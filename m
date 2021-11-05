Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0359C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 08:48:22 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.2835.1636102101818448819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LD/O/c9t;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id w29so1005535wra.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RZfC3HX5wVf6J5SARgL7LqwS35lemKymX4ptwOpDAYo=;
        b=LD/O/c9tQVmdUgYTFV074Nve60rost6j+EOX1l4JHw7Koa4FHV99Rco0xN43pYRVmC
         DuZxpk4/E/ffekBFFoYuFtsb0v/kvgiY9BzajfQjCOlQbnLM4KaUTc3GTpA7v6DfMLiv
         m42e5F3RnY+sr36JNt5t4fztEsaJR/j7eCLX77ibNqtNqBKmMrMpnxI0rBf25NWfIo/W
         sJzMzNTSTWhHeAzwsS3x0sHE619Owssgk6wNv48DPUT2FN2nAEI5fwYgvAayWycEVs3P
         U7vtmRQvisd/YCrYhGUjN7DIcH1+EJgpcnvdwk/bC5D+I6c1JTbZwYZZeb1JInH4gqXg
         REQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RZfC3HX5wVf6J5SARgL7LqwS35lemKymX4ptwOpDAYo=;
        b=TL5k6cT463TIT1PLahkmOe+8bu+aPPlQO/FpfLock74hfu70ry6Hdw/pOLbTYF+jiR
         isUqx4MY7LJlqpqFYuKhj7hojGkS9Wzr7tdUNgXA7/a+9ghz5njwhopMTAIP8AHka7g6
         myo2QOUipOi8EpPE4xsfnULAEyYSKU7ofe5HqeZ2nMI9J3Q+NY1HfaiBvISrto1zg0Ot
         lzNMo4VhgdqtLajrw2XInlXQMSLtqc8A1ckk3jlVXe50ZCF47dZfugs6AX/Qoia8WQVv
         Fh8/+aWPz2gJrycPAiXKU+0paVLbHtEgz0Vrs8Eu1dPiPHc4VbO7KgR/ekjEhOpd5VT9
         Kweg==
X-Gm-Message-State: AOAM533sEcNWsbU16xSs/gc2pNh0hPDBRfKE6oCSYYdvXNLE0zsjqHgm
	e1F8MnelFZBegd2Ga1nxwcJBENELAng=
X-Google-Smtp-Source: 
 ABdhPJzuRNwJ7dzA6KuSecV2KLTRabOAypvusNA9MxzRC6l8B2nv+zvc5Kzq3weH2IH8tj1rXoX8BA==
X-Received: by 2002:a5d:6091:: with SMTP id w17mr40277669wrt.65.1636102100259;
        Fri, 05 Nov 2021 01:48:20 -0700 (PDT)
Received: from nereus.lab.linutronix.de. ([109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 d7sm7230432wrw.87.2021.11.05.01.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 01:48:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/7] valgrind: mark ptest-specific patch as inappropriate
Date: Fri,  5 Nov 2021 09:48:08 +0100
Message-Id: <20211105084812.1828227-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211105084812.1828227-1-alex@linutronix.de>
References: <20211105084812.1828227-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 08:48:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157884

I do not think upstream is going to accept this; if you disagree
please do the submission.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
index 0c399ef52c..a3637ea846 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
@@ -14,7 +14,7 @@ option, --yocto-ptest, the valgrind regression test output is unchanged.
 Enforce 30 seconds limit for the test.
 This resume execution of the remaining tests when valgrind hangs.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-- 
2.20.1


