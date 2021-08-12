Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.27547.1628798662567057063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 13:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gprD+g6Q;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id n1-20020a9d1e810000b0290514da4485e4so6474082otn.4
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Aug 2021 13:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fHFwYsMGp4noNPAtsLBeNcrRfkh7yp8p5r8f3FtF4VE=;
        b=gprD+g6QUnXt4ZbCUU089Ay0EdnRbWnvUknX//cuBkhiHHkzud0MKBYByAZrjdqRsu
         H0TBaI/MfPT4SFyWZh19mrRvP/QWmHuAf7TEUM+5ymV/i+cvv2Q+MDcLfnh+9DXsaTkt
         9rzcKd2P6enDPXkBzh5GeTrgNBEb7tWgvwHOfhmjQFmjawhZQmusjh+vt6FWBCczUxBr
         FN0fA2JWhJvVBisrus74AlEqHjTrq1vhxPQYVaFZ9Av0ItY80KBnFH/bsU8DrCev4/wT
         2g/PmEGH2uNaEwSvWaASYBYVqxh8s2zkylWcNFL85xQZue3OoP5ahOq76rgIOPFupZPB
         BeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fHFwYsMGp4noNPAtsLBeNcrRfkh7yp8p5r8f3FtF4VE=;
        b=SpxVdgvbPEG+AkPKnbdAeZjTfzvDFUYJRT7GL6LW0FdT3We3usskpRBCEyTcxZNpBK
         ul+g9NvEZO0cYiWZyz/D2QFTlEuhN6ZOKLAYUthe0sx0nJP0uscvJGZ+NLlFFkj/0Yv9
         5waqxBN+RhtxYw0byEM9ZbFLQrn7/pVtqbnXz0zV85KrVxGM4iT0pg+M7GrkwxakJZQV
         2lXbs79xgHqtmpIE4L6crbCQE2XrKiHkYeX17AzCuxTwcsM1FMojvPY0sQUbNK5ZL0eK
         DVMS00G++KrvkPmf09Q0bvqzwN71KDEh2iQwj7Ch8/5q1IQ8L2Bq9oxSfQwB5hAxivz8
         buHQ==
X-Gm-Message-State: AOAM532/h09h7K6QFIZlIkOEAlRqztQ8mYLwSQcnOo71lw9g48nb+B9h
	3RfH9ivnVeUqkxDNSxPyl3ZozwE1Pa2y4Q==
X-Google-Smtp-Source: ABdhPJzr3xVPey2vHf9y+B2Dpa2yqWpQ/PAK5LfD1cu32YNxEpC0TbQSYCXr7ay6xqzzcCUPu8lpUQ==
X-Received: by 2002:a9d:53cd:: with SMTP id i13mr4734871oth.302.1628798661305;
        Thu, 12 Aug 2021 13:04:21 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id o4sm852997oik.49.2021.08.12.13.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 13:04:20 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib/packagedata: Fix for new overrides
Date: Thu, 12 Aug 2021 15:04:12 -0500
Message-Id: <20210812200412.36121-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix read_subpkgdata_dict to account for the new override operator being
":" instead of "_"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/packagedata.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index d7914524b5..c6f96d81fd 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -45,14 +45,14 @@ def read_pkgdata(pn, d):
     return read_pkgdatafile(fn)
 
 #
-# Collapse FOO_pkg variables into FOO
+# Collapse FOO:pkg variables into FOO
 #
 def read_subpkgdata_dict(pkg, d):
     ret = {}
     subd = read_pkgdatafile(get_subpkgedata_fn(pkg, d))
     for var in subd:
-        newvar = var.replace("_" + pkg, "")
-        if newvar == var and var + "_" + pkg in subd:
+        newvar = var.replace(":" + pkg, "")
+        if newvar == var and var + ":" + pkg in subd:
             continue
         ret[newvar] = subd[var]
     return ret
-- 
2.32.0

