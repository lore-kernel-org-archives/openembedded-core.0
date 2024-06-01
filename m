Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3BCC25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:24:56 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.36105.1717244695857232652
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yUJWzobF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f6342c5faaso14143475ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244695; x=1717849495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpsNJJ1vaTMj6Bab8Sc1T9LAO37T8gScAw8IneOXZtI=;
        b=yUJWzobFQFeXBlISXld6ygHz1CdZuJ/LGeG21HBvVTo3hm8fFU3gOzKE6VMV/Apdvx
         W6YBrG5dZAFvGVGMgT5rFZzoWQLVGbb/4N5snVMl1aSeD5RKoFyLMJtJEJFZNV/iinv6
         A+s2ryIRAXrDbIRYo4mAJqo2vcWri9ZDhS8vIVdQZLplu9iso4jZX9Mh7va6z2qMvYcT
         BqFRRxguCvUDSE4R1ms+dh03tSgeLwnBnDbdhCVRg+/BDExEi6q/a67D6kelsgycUHHV
         UEEyMgRPztENjKRfwolhZ7mMR5eaF7F7eUuXA8yLQd7JJxYKLJounqU2HRDZ9wruKlkP
         7kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244695; x=1717849495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpsNJJ1vaTMj6Bab8Sc1T9LAO37T8gScAw8IneOXZtI=;
        b=BdmHO0JY944C2qhNwz2/vK7mgDrqDTCJCfmzpA4ioJ8lTndCAxpkdpscJNmQV0yfm/
         Pujq8PA+XS3AYgToPCPysT6uV3catPZjQwVDmu0W502Hy0yE3B42WhmjJnFSkMMI1uYi
         msId3cgmCG333ohE1Rg76ScFAs0N9V2M92Npd8cnOTzq8MZfM3efjTs4dNwdT6JJFrkd
         uBRuRS/bcLLHS4tf0DZrNXYVaTfPejTp/D3gwK/LzfhSJIeCeUpSzRSevv343L5k7YUW
         osCXveZ1mzXxbx9jDfrpd+1YuaSsoyUMFTfICTTBQDcu0wDREEvahnD9U+1pUEcMugz5
         5IpA==
X-Gm-Message-State: AOJu0YzsDkK9UB39E/4LDuVZi+u66S9N2hWMQvIbLK88woHKMtkWJHNT
	YtC5JrP+OMEs25a/SwLyAfA1QZlkFthwVe9r5qZSRkjivGOdJGgNmJZekw/PjJ1O8IQ2yTJYJMW
	0
X-Google-Smtp-Source: AGHT+IFz/8aWJIqzj0AImfECIgxqMhTvPBbkq7u7GqDDadmdMGmluJh71Bcc3/cDxP6TaEz9g0rtyw==
X-Received: by 2002:a17:902:f7d4:b0:1f6:1f90:987c with SMTP id d9443c01a7336-1f63709be5dmr32406085ad.48.1717244694725;
        Sat, 01 Jun 2024 05:24:54 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.24.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:24:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/21] ttyrun: define CVE_PRODUCT
Date: Sat,  1 Jun 2024 05:24:27 -0700
Message-Id: <9e07ff39c1b2794d6de7f8d14cdf47707db50f5a.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200097

From: Peter Marko <peter.marko@siemens.com>

Single executable ttyrun is taken ouf of s390-tools repository
containing ton of other helper tools.
CVEs are not assigned to executables, but to whole components.
Historically there also already exists one CVE for s390-tools.

Most of the CVEs will not be for ttyrun, but this is the way
how to get notified even if most we get will have to be ignored.

(From oe-core rev: df28547387c2c122aef3e5326b216ec3f4d3caa7)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ttyrun/ttyrun_2.31.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
index 122dd9d8e7..fac11d6310 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
 SRCREV = "6f15ed326491a17d83ca60cd2bda47fb5e8a0175"
 
+CVE_PRODUCT = "s390-tools"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "\
-- 
2.34.1


