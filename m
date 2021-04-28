Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.9639.1619603499287960699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 02:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AiDMn23w;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so4314399wmb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 02:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i7gaHnJ056lu2Rl8MerFavn4eogNeinLkrj4eWw5Lfk=;
        b=AiDMn23wAE8dqMC9dkVmZK+RIKFlo+D+zTu9//3662HYJP7vblSna4aNTWUlzmKk7s
         KCSlu6dYrRVuFDhvQYWjNx6vJcQkBz6yJBlkhVTWksBLvOehO/sRXJsz8bKI/DHvS6Ss
         p7PgpqW52/61zV4foWAcMTUoGTpji1dFiYfKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i7gaHnJ056lu2Rl8MerFavn4eogNeinLkrj4eWw5Lfk=;
        b=TO2DEculxcv0Ex/aky4nvWp2LzW/cVjkwipfiaAWANJoGSxRj8U/QsbQuIFTu13B2+
         /HpktxDMn5od5f5fhnGq4fGysBfsMR4b69mvjXTdoGFfbUgtWyoppsfdYG57tgSOOCKQ
         rLBgElh3XgnU1dy1UenrioQT+XfH+3UV0JhpQXsFrmh0ttPOf8BeOiZ/iHkjfDtNYwG0
         QtvoAJ3zyL18/OrMc7ycKfLGKOeLCZPaoOBYw4L2tCe6jHn5OOfOGtkngyHGueUVCnEm
         gvYV7cNsnjtYEtMaHx18UPFzKEZRSa+Iu/OEL+KqLx90q0JE35zloRANAMrXc7rTjSzc
         keEw==
X-Gm-Message-State: AOAM533WnSdQZf/grOzbgy24bV7AoipxMdMy/ZFZaC+uaCMa1Hjxj6Uo
	2RL9SiunpxeFC4PbcdEaONnbZ8OVmT7frg==
X-Google-Smtp-Source: ABdhPJydQObkv062RSEy0mC3YzGMs0fSuBV4Hv9mL1PVelyOxfYg+ka/kLQiBAivM0lq9KEnk+zMaA==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr30648177wmb.45.1619603497444;
        Wed, 28 Apr 2021 02:51:37 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net. [80.7.160.81])
        by smtp.gmail.com with ESMTPSA id o17sm2840976wmq.47.2021.04.28.02.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 02:51:37 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH] prservice: Use new connect API
Date: Wed, 28 Apr 2021 10:51:32 +0100
Message-Id: <20210428095132.7213-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new prserv connect() function decouples the code in oe-core from the
exact classes and implementation details used within bitbake. This
allows us to more easily switch over to a new asyncrpc based prservice.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/lib/oe/prservice.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index fcdbe66c19..15ce060ff6 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -7,7 +7,7 @@ def prserv_make_conn(d, check = False):
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
     try:
         conn = None
-        conn = prserv.serv.PRServerConnection(host_params[0], int(host_params[1]))
+        conn = prserv.serv.connect(host_params[0], int(host_params[1]))
         if check:
             if not conn.ping():
                 raise Exception('service not available')
-- 
2.26.2

