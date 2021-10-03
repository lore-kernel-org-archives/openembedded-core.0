Return-Path: <vivien.didelot@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EDCC433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 17:55:29 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.25414.1633283727731150624
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 10:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AInADNSr;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id q81so14366089qke.5
        for <Openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 10:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tXjYtPOC6FbNsphLb+Rh9CpM8jRoer6fCs8WC4x2HuA=;
        b=AInADNSrlpIZtdFAkSmE+ZIQ0OUHzAtL6xI6sJmfgyn7TQ2lLXPAyM3gXnTa9Qxj8C
         kZFfw1SRMVKT/rz22qgH/Sxphamel0H2LqIdyUreb0VH2U7HWeP3dEU/RdGpLEzd4eNZ
         Rog/eKd50L9+VdEvAWf40C/JYEFc38CuVvnweNHVVb/wL4DWGOraXZeTV2bAZMTMJS/T
         CRxK0H4yf7PTbfzaW7Z217IhNbCFlSnzh60i9BQ6etGSy7j/FqlwHGgsBVMsSpJroQTk
         8gMXEEsG+F4grqwWZTeotn+v5wsDNh/QbrL86BeJklvIDW9SibQ6NtGUkEaIt1SHlwDk
         tCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tXjYtPOC6FbNsphLb+Rh9CpM8jRoer6fCs8WC4x2HuA=;
        b=Ai1Yl/ksRTTwOT5KkPBqwa6fI4BdpsQMFT3zCqHkE0MXoHJqkitslsEUM+PM0TCnWa
         qWvpRprARUaAPAwDr29sWYRjPZ32nyBAhp7bHmaUQPiKmdFB2Fz5I6ZPs7R9VCHKri2m
         Nkvdrh6KIGZuVVjKZX9MpwYl80/tpaJTyF8QiXT4tp91f9XfQb+J89cxCVWhX1x8w2Gx
         0PH8697nuwVb3kINi4lhYZvsODkwwMFS+zf7NKD8AubkymrB+r3nPuWBq0QLIetwuDzn
         uL7nQ2FdSFXuGQPsVtWnwAlVTS1LVi5Yfn8BOom6jkFzs0q+xTCSt+Lz3qT63t5kOqVI
         e+bQ==
X-Gm-Message-State: AOAM532u0Sr4ByBUe9tsF3K8LXc7Ry0H6Saz81SgvQhY2j8ik0q3ryM5
	69QpuP2u3JzcPJOboHbSOYqtZuFsaJE=
X-Google-Smtp-Source: 
 ABdhPJx984m9/3EOYM1ra7DnFNS3eSyM3V3jrn07hER0ethmWgTkTQ0xxkrz5/4fSDtvVnkuwXHr1A==
X-Received: by 2002:a37:a647:: with SMTP id p68mr6786059qke.482.1633283726809;
        Sun, 03 Oct 2021 10:55:26 -0700 (PDT)
Received: from localhost
 (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id
 v23sm6259054qkj.76.2021.10.03.10.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 10:55:26 -0700 (PDT)
From: Vivien Didelot <vivien.didelot@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Vivien Didelot <vdidelot@pbsc.com>
Subject: [meta-oe][hardknott][PATCH] dstat: fix override syntax
Date: Sun,  3 Oct 2021 13:55:20 -0400
Message-Id: <20211003175520.1419988-1-vivien.didelot@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 17:55:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156557

From: Vivien Didelot <vdidelot@pbsc.com>

The hardknott branch doesn't use the new override syntax, fix it.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 meta-oe/recipes-support/dstat/dstat_0.7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
index a1076ccf9..0e314b8ee 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
@@ -21,4 +21,4 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
 
-RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"
+RDEPENDS_${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"
-- 
2.33.0


