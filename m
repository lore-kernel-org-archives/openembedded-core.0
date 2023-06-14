Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E67BC04E69
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.7350.1686734975737701323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=m6R5essH;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso11030041a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734974; x=1689326974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvkMy4/9E7YL83/3p5ynJnVF/hYWtsyuh0hPMsDiOJ0=;
        b=m6R5essHZWauDd7iP8mvOgPKftxmVCO1X+LxiymzkQpBl0yZZ90RSQcZvb/+d1W825
         kv4Fszl9BRDKIU/B5ITJtxpvI877cn/Z644MHUeCzFkXbPd49g9s6RezGXxVKIWGsu3o
         1oFH/aZSGFRARgvwqsA4TU9DdqWJJAIQNhuHtAQDAVGZ5tNzzYSeiKB9J2n+FTwZM/C+
         EKgHCctoxKf/GVu3EYEkH4RsyXBly4oWtpAMHvxUIcOJHn8jXzvjOg3x3Lh29tOVegLa
         Fy8mboZT/2cZsdyRsaNYfNQqxQAL68UMqKT3F7umY2FJ6p+A0vRxloVKqNw9WwNjknTc
         eAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734974; x=1689326974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvkMy4/9E7YL83/3p5ynJnVF/hYWtsyuh0hPMsDiOJ0=;
        b=IlcvtUWNJDNcBqEfcRLt8IGCJpaNAL3eirnAB/GTitmbQGya9HR6bN38xVmaA7i2M2
         yZBAZkQsBQ0qY/75TBAMfPNp26PN6D0MJqEMdj9NtEl98oTIrWyIkRwl9b5AtlVSd+2y
         1NbYv3ZINNSHuE61TNHGHdXGU21hq4IUeNB/3pH4r+X5P/TYSKzsEGuhSiQGhNDqe1ni
         samXmDBvR9F+UylvyYNG3Ba9ea1aBtvipsuNZ011hBRY2woTObGHWG3yyPQz76CrtSQy
         xZYBT22evIUfAMk6BB71tMSOWL3+90h3noHPAtsLEG3WSW1v86CUGivT1ucsyEvqOdzU
         fZGQ==
X-Gm-Message-State: AC+VfDy5SvF3L36AffErgzz5EyqlzxoHN+/2eTuT9ItE+zrsWMuKYGSW
	w5MymgpEonXqAaB1OcQoxgaK3YkKs8g=
X-Google-Smtp-Source: ACHHUZ4+GHXgNzVfufmAN6+vWK6sGgMvxYqdIo4KYzEtS8LFwX2kakIDABFAUr9D1gb06Eb4HSdESA==
X-Received: by 2002:a17:907:9710:b0:96a:ff7f:692 with SMTP id jg16-20020a170907971000b0096aff7f0692mr16860554ejc.68.1686734974157;
        Wed, 14 Jun 2023 02:29:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/55] coreutils: upgrade 9.1 -> 9.3
Date: Wed, 14 Jun 2023 11:28:37 +0200
Message-Id: <20230614092918.4065570-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182759

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../coreutils/{coreutils_9.1.bb => coreutils_9.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils_9.1.bb => coreutils_9.3.bb} (98%)

diff --git a/meta/recipes-core/coreutils/coreutils_9.1.bb b/meta/recipes-core/coreutils/coreutils_9.3.bb
similarity index 98%
rename from meta/recipes-core/coreutils/coreutils_9.1.bb
rename to meta/recipes-core/coreutils/coreutils_9.3.bb
index e12a6d67971..4ec953c575b 100644
--- a/meta/recipes-core/coreutils/coreutils_9.1.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://src/ls.c;beginline=1;endline=15;md5=1fe89f62614b5e1f5475ec04d5899bc1 \
+                    file://src/ls.c;beginline=1;endline=15;md5=b720a8b317035d66c555fc6d89e3674c \
                     "
 DEPENDS = "gmp libcap"
 DEPENDS:class-native = ""
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "61a1f410d78ba7e7f37a5a4f50e6d1320aca33375484a3255eddf17a38580423"
+SRC_URI[sha256sum] = "adbcfcfe899235b71e8768dcf07cd532520b7f54f9a8064843f8d199a904bbaa"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 # runcon is not really a sandbox command, use `runcon ... setsid ...` to avoid this particular issue.
-- 
2.30.2


