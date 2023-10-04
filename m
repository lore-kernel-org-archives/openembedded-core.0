Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898F9E7B604
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 12:58:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.17573.1696424276577345489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 05:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=HhX5qMNR;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40666aa674fso20632255e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 05:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696424274; x=1697029074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D8pzfpMnfM/KUA42obJG9gQ7ScaV5LamxuI2C8vSwCA=;
        b=HhX5qMNRUKPfOJxFrdlSmY7eV8++9/L7k9GtygKNbunzqpZOI+ymufEViqPgDMPOH6
         ZfZwRDpMwb0WrkZtlRqMHUgInDCSFUlhcVD9E8sGhOdPYZ2VLa451nNSgzcpunlDnG9A
         efjPqti2RRYZFsQ/0fQEyYYphqqzGZvpY6t5lIsagCL6SuruIR0AV3HRpFrZ/K1A41k+
         TIKY5Lglbnlk4fWmxxRoXePgTKX6ggI6C+7EytY+H9Lsrri6tu6cczCAiCNODBks3XJs
         KOBzi5CZZjPbFB8N3M9oX/pvZ7f89qi/R0y+ptUfx625IR3c2ChZMH1TYOZoThTNdrM4
         HzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424274; x=1697029074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8pzfpMnfM/KUA42obJG9gQ7ScaV5LamxuI2C8vSwCA=;
        b=S/kKtnGS+ZeySgcNpw8bHmHm3ZtPCgKLEV+Ia/QdfFKoxS/smCBzdO+fmdivusn4V1
         Ky2nvCwDfx/7ca30/V7+KZeOoXsxS2YPcL6tysjhPSUf6lfA3jXge/3V6ta7A64eruUP
         9ueB1bg74Hix55DG+OJJ95Q0knWKfNKIvfDyk9SQW49RlrDWuPN/e+Op6S9I++fu1yFA
         L5NwzDfbtkv/6go7sb8GdktXVB5MhK/9tJVEKHnWu7Ad5yS/Aq4bG1/tp8xfa2lnAGqt
         ZJY4mDWZesgbaGnGQI0peGAwMwKMmgnordS2UAIt9IKUaJJcgUmyrW8S39TF4wTGVAa2
         Qgeg==
X-Gm-Message-State: AOJu0YyTbj9Dn8dA+O4lVeHsG0Ohu+z9t0nQzlr71An0b/OSKgMeDuot
	3yk3y6FcAMV99nWW9Hn28bDBBJT+n7Mwfacxu+I=
X-Google-Smtp-Source: AGHT+IGnJFoswTazNXXBFY4RWDgjtCkEeincmll03JXYQKx7xicoACxfZJseoURC40SXAT+Jzg10gA==
X-Received: by 2002:adf:f703:0:b0:317:ddd3:1aed with SMTP id r3-20020adff703000000b00317ddd31aedmr1948286wrp.68.1696424274159;
        Wed, 04 Oct 2023 05:57:54 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id j16-20020a056000125000b00326f5d0ce0asm3958763wrx.21.2023.10.04.05.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:57:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 0/4] insane: Add unimplemented-ptest checks
Date: Wed,  4 Oct 2023 14:57:27 +0200
Message-Id: <20231004125731.1785803-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188680

To increase ptest coverage we can check if the sources of a recipe looks like
it contains unittest and warn the user that a test may be implemented there.

This series provide the check infrastructure as a package QA check and some checks for :
python pytest, perl Test::, meson, cmake, autotools-based tests... as well as
the naive check of "Is there a test/ directory in the sources?" which work
surprisingly well.

Currently, this check find:
* 309 unimplemented ptest in oe-core/meta-poky/meta-yocto-bsp
* 827 unimplemented ptest in meta-openembedded

Full list : https://gist.githubusercontent.com/ycongal-smile/0969e92aec1ca37e61b6cdbcaf1f6885/raw/b1be8a5b576e144b6563f5481d31b32de9b22368/gistfile1.txt

v1->v2:
* Corrected: shortlog tag
* Fixed infinite loop on source package containing symlink loops (e.g. md5deep)
* Added test result

Jérémy Rosen (4):
  insane: Add unimplemented-ptest infrastructure
  insane: Detect python and perl based tests
  insane: Detect build-system test harnesses
  insane: Add a naive heuristic to detect test subdirectories

 meta/classes-global/insane.bbclass | 50 ++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

-- 
2.30.2


