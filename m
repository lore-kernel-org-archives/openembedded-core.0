Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F56CD13D3
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.27409.1694943550253294106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HrO3si5o;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9ad8a33fd0dso441889366b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943549; x=1695548349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoGeMiYOyEqobtZXLa7zXXm0VI37q+toHZTXkfwmOfg=;
        b=HrO3si5oVogfa5wpJZp6LLmtiK3PWmKF6mCvqQHx8iqFiZ0lnwlODatcaS6573NtJE
         K7saooVinLoMZzlDXrQjrV8+espG5CbYoxkTs7/p21kvCWQu1UuwD13hJOXSpDNBm/oN
         OuS7r4Ca41dH+BDj7qkueBr5hl0RXBRIYf4sUdMmkkwJx1taF9YOz+/+4ZeradfASC1A
         G0NNMy0ZpHeaVw6Mmx/5PCR+3Qp5Fb+WLrJZw/uZ2AYZ4yeBTASbPRN3qOlLvNE6PRbR
         P1t9wuN2Sx4O1/bjWIe4RJJHe3gyHGclQHhdII33F9jsQkiXHDAkLHNggwWjthUgzpH4
         6QFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943549; x=1695548349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoGeMiYOyEqobtZXLa7zXXm0VI37q+toHZTXkfwmOfg=;
        b=Sg9L7qZ2cV/1vPi81Kx/+JqBZjo/NLYeT5a2No+YCFq5b9AwOBUm6He3AefnXgBO25
         fOmYpqQCvuRR2D+xYru665gy1n6o/rGMEOkvRkycAw0kPZmeFYMIyuTaeWj9+rQ9PuYH
         m50rRHL7CWxfdhqDC4/dXDdNtO3nY2PHuakZ7OIVuMHsgw/xNQj+gnyyCLe9DQJwyX4j
         bibNrJ2az9clWtUiFgVsw+kfF4abpzwjHCaEy7aNAtf3WS90/zfy1/eEDHyi3uigv3n0
         E9wRqXR2VuTBZdeCdM4VkejcOxcx0amyLmw4MxvCy5MItEpMpH5NLwJ2gAglA724uoOz
         ImCw==
X-Gm-Message-State: AOJu0Yw9MTa5B+2utG7mSYArL/Uo3pIebqX4FHi4OkOjds21nXEu9cTI
	rYcm0LM2F52SS8WQM+lZIVGOD+KJKKQ=
X-Google-Smtp-Source: AGHT+IHh/xBY6CHMtRHRnG1Q4XVpb57SzZIMtclViSFqaJW+ukptxh6p+tRqDZVbL3vI+ZDqAIehjw==
X-Received: by 2002:a17:906:76c2:b0:9a6:1560:42da with SMTP id q2-20020a17090676c200b009a6156042damr5397459ejn.15.1694943548728;
        Sun, 17 Sep 2023 02:39:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/29] perl: use 64 bit integers across all targets
Date: Sun, 17 Sep 2023 11:38:38 +0200
Message-Id: <20230917093901.428214-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187779

Otherwise perl would use 32 bit integers on 32 bit targets,
causing loss of bits when copying 64 bit time_t into an
internal representation.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/perl/perl_5.38.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.38.0.bb b/meta/recipes-devtools/perl/perl_5.38.0.bb
index a8623b6e84b..956e4d64d70 100644
--- a/meta/recipes-devtools/perl/perl_5.38.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.0.bb
@@ -58,6 +58,7 @@ do_configure:prepend() {
 do_configure:class-target() {
     ./configure --prefix=${prefix} --libdir=${libdir} \
     --target=${TARGET_SYS} \
+    -Duse64bitint \
     -Duseshrplib \
     -Dusethreads \
     -Dsoname=libperl.so.5 \
-- 
2.30.2


