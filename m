Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.1669.1591998620944768623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 14:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l5wh2voy;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id ne5so4167821pjb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 14:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rSYrEV5Iqm8a0GkJD00Msp4qkAmA6d1QdwwhHSKa9GM=;
        b=l5wh2voyXgtjVNSXX9Utqv0MunwxcuaASleCyFXxeSeEksLqzj5tbsLuh9TqbUbaws
         Ny5b0ZOsf9Qdpzikcmp2dEdFBwGpkPyxmamMbl72ZdocY1UQI/ID0YwmiknmKi4ARfUW
         5MESNBgjc8pp6YAMULulFqLUSFA6fe/+T3WOGJpV+0DqGT399xOj+9+gXEHYdTGnZcyF
         pUwhrUaYhIMTysqGsACsZLRdSUSpaQLSiuCazQjR12siOAPuMUr7WMHLlZEa+ZTD3Px7
         UO66An+eGeD2ca08e8xpDa7LEsI8cRCRRZP03u8f2SyGQ4AI45mfBOjFBUl43+Ow3TmK
         BKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rSYrEV5Iqm8a0GkJD00Msp4qkAmA6d1QdwwhHSKa9GM=;
        b=NXhA5a6EsxCCd2vK7AIYxmpGgFOD/vCWHRHaMvKZBcJ2iaj4ylpG5L0STmpkDIUCYI
         xHXb4jYB9csb6U9b/st2ClJ6ZJRvRRmaza6PbktnzMx3S3sjOoTIMWh12j9KDeUK2BBE
         2pkZkSh/Gs7tqjlZ6lYq567asAqPNHyWaTvNPRJImlptLRi1157VnQJLY67sL3AA2LRQ
         s2FqVgT47TONGyu1U1ZgciApGqBprcZoDjqsRT+0Bjsi1f9kQu4L3ZciXDQPz9VPjHkE
         gIjGFsqom/Mm/COvCkbt9nIW2m1/MwrMX2liLAUNj/wYNQ6m/X9h52GAnDEA4RaeHUch
         xZyg==
X-Gm-Message-State: AOAM532qIZg6b4qrEqXRxlEx+RV0JmOrb2sg8rjW8EOhdx+4+5vhewo/
	hG3Cu6sIN+yz9L8MYOOm4dcQ0KVV
X-Google-Smtp-Source: ABdhPJyPpb3hA02mps9C6w0MaJHaUajZj3zcx+bH+F6dG7UDxnwdo4pHW03JqS1MNe8ddauyDNc58Q==
X-Received: by 2002:a17:90a:d784:: with SMTP id z4mr948425pju.30.1591998620243;
        Fri, 12 Jun 2020 14:50:20 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:35f5:8651:479a:b9eb])
        by smtp.gmail.com with ESMTPSA id h17sm5921686pgv.41.2020.06.12.14.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 14:50:19 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] wic: Fix error message when reporting invalid offset
Date: Fri, 12 Jun 2020 16:50:16 -0500
Message-Id: <20200612215016.24496-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error message was reporting the calculated offset instead of the
current offset, which made it confusing.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 1f65a7afe5..2f01999405 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -436,7 +436,7 @@ class PartitionedImage():
 
                 delta = offset - self.offset
                 if delta < 0:
-                    raise WicError("Could not place %s%s at offset %dK: next free sector is %d (delta: %d)" % (part.disk, self.numpart, part.offset, offset, delta))
+                    raise WicError("Could not place %s%s at offset %dK: next free sector is %d (delta: %d)" % (part.disk, self.numpart, part.offset, self.offset, delta))
 
                 logger.debug("Skipping %d sectors to place %s%s at offset %dK",
                              delta, part.disk, self.numpart, part.offset)
-- 
2.26.2

