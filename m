Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.12217.1631883566659887063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 05:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xy1ZkL1c;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id f62-20020a1c1f41000000b0030b42643f72so1831351wmf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Sep 2021 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7OM8MWsR8H5dnyeEK7NFTrn0XSjvlzUmllC8tLdLu4s=;
        b=Xy1ZkL1c8VQPkUzrUrK613N6Rvfsaq8yPgBDmCjJQ1ZaeQznpmbPbRkjZ8m8NCnSLu
         WoSy/h+9JenPBKuZjunJBZhjC1/pB6nAAvk1BC9ijd8o+Mmlp53yuG2/FwZowgFjWAEg
         FcTSMPuSbbcOoLdKDLfhHg2O4Uz+UDwOqiwVPYiuI4ycvjhEPtQDHIy7YPSI9r7xk67X
         Scad4b4ObCKiOi2RKvKVeK+QCgAcpMBLfq8AkJtgDx6Uh//JxxbNR2919GwfHrY67y2n
         dmjjHyqmnn4XlZ6qDVRihuVudCKsZ2wqerlAmBsaGRivCs8d1ui+WrekLVi5iMqw7Rkl
         yJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7OM8MWsR8H5dnyeEK7NFTrn0XSjvlzUmllC8tLdLu4s=;
        b=rFnFrHoRUKSd/oAaBts35Hfsv6Or5ZuvSeustXwUfU/h0F0GNlFnu/cdDwUbGHORRF
         zOIp0RvvkClBSz1WUqXMABskY2DJQX3mLG16GQEfP+Uxo+/uL/k+0T1kXZH391zormD2
         6a8N2rN1DHYEp8aAVNSMR0wikqUvXcThBoZInBtLrMqEMTSXMWK643TWaBMGm404iz3J
         lWZagHSnK+n9y02z/rlmVyYtJLBqLe1F3HvmNh/H5a3yJIX4INEmvsaIE+ykBCEwuJl1
         RVLzHWqKujl06xapANrODFnwb1ytWU02Is5njE44R+K3BnB3HqzopeCAhWB/67xGH1IM
         hVXw==
X-Gm-Message-State: AOAM530vlrmCF04ENQDHWcyJEQZTwEhasHj0sBrjpDco6Of2e+buR3cw
	Hru2g71wciX7998VTpehd9g+E5dqUds=
X-Google-Smtp-Source: ABdhPJynTC6XP8U+iR4pLJOxIIhCRgGySmK+ionvmIGKrvjNpoqXO7Qj9rnqCOVJ9YahtfF0NEX5tQ==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr15358982wmd.55.1631883564801;
        Fri, 17 Sep 2021 05:59:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id j21sm6929041wmj.40.2021.09.17.05.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:59:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] meta: correct collections vs collections.abc deprecation
Date: Fri, 17 Sep 2021 14:59:19 +0200
Message-Id: <20210917125922.2435721-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

collections.abc is available since 3.3 and doesn't need special handling.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/maketype.py          | 7 +------
 scripts/lib/build_perf/report.py | 3 ++-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/maketype.py b/meta/lib/oe/maketype.py
index d929c8b3e54..d36082c5351 100644
--- a/meta/lib/oe/maketype.py
+++ b/meta/lib/oe/maketype.py
@@ -10,12 +10,7 @@ the arguments of the type's factory for details.
 
 import inspect
 import oe.types as types
-try:
-    # Python 3.7+
-    from collections.abc import Callable
-except ImportError:
-    # Python < 3.7
-    from collections import Callable
+from collections.abc import Callable
 
 available_types = {}
 
diff --git a/scripts/lib/build_perf/report.py b/scripts/lib/build_perf/report.py
index 4e8e2a8a939..ab77424cc74 100644
--- a/scripts/lib/build_perf/report.py
+++ b/scripts/lib/build_perf/report.py
@@ -4,7 +4,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 """Handling of build perf test reports"""
-from collections import OrderedDict, Mapping, namedtuple
+from collections import OrderedDict, namedtuple
+from collections.abc import Mapping
 from datetime import datetime, timezone
 from numbers import Number
 from statistics import mean, stdev, variance
-- 
2.20.1

