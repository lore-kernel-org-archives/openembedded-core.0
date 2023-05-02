Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0A3C7EE29
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:35:05 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.290.1683048904580504960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 10:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bXg515Al;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: ernstp@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f00d41df22so29745248e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683048903; x=1685640903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdQnnnlxDc0kLybvwXoadSQ2HALR54ih0FinpFVPtMY=;
        b=bXg515AlJv3+byvBn70v9VVFFW3lz1ubu0NOO/HVkxR/9JTz79M8qABoMVTR7KeWkQ
         to/1TFNPrdsAfGHQxI+F6SAZfEtoCig7Rmc0f/HR1eBKGB/6Bzots4PdRvE4z7TjkLy9
         Vgbs2mSJXUSO5x7IOD0nilj01Gf2kjs1SGqRr3p3YZvPgRgdFvuuOzZal8IjqcsRJm4O
         WRcL4mUX14ttNPuf3fdHZt0SkwfCVVZ53r9NbzgvUFRH3BN4EHkZrRkx1uPYWEN14ZDk
         1LtDab7IiAa+avo0p0OkYxT1kedoorl/ks0cdCH6cNAbk1nEwlungxM1WcZOdZIuuKnJ
         DvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683048903; x=1685640903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdQnnnlxDc0kLybvwXoadSQ2HALR54ih0FinpFVPtMY=;
        b=MwghkIVvTo36mXjpOIEdkEnkGlBV+ufs5XQ0PD0OMqYAyLe1YaIeaDDS15KM/7i3Vb
         OqGVURd5ZkAOoGD0fk2cmHC3UF7RmDou9GhOXtuMhBF2A3BHvaUyjO2PQUs+BgT2zDRW
         kLEcpgmvOleP6C4KtvYZCLJ4OGvv3Fac0xf37xvRKyiLTubYHxCN8mhhoaEEUTVTL+uF
         M1l2M4nod2huu2xVwfCkL9JlHNggeMrqH6r9AZIh2tvRWs/6Ek0x3QisRXimD+Sv2uuK
         DC1WDxDmLSfnyy/h4F7iXhqQWjfDbjnxxv5DxhC/OTkKuElNc31ausZEklKxFeT78ym9
         8kWQ==
X-Gm-Message-State: AC+VfDww0r/6AcrkaVGOIt31wnqSZQIrgWMbuaiXdK0BE63jb3JI0uTr
	j4fWJHzio/QbUVjYpY9DyBbrf6sY4MWaAg==
X-Google-Smtp-Source: ACHHUZ702i/Wd3JwcilRsZMzsIfOWAeBKnru7Lgzj4W440/eSmjwhUwDeNNgxuO5YIR6ufitDzYVdw==
X-Received: by 2002:a05:6512:2308:b0:4eb:2b62:134f with SMTP id o8-20020a056512230800b004eb2b62134fmr215328lfu.16.1683048902984;
        Tue, 02 May 2023 10:35:02 -0700 (PDT)
Received: from localhost.localdomain (c83-254-134-100.bredband.tele2.se. [83.254.134.100])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24297000000b004edc3bd7fa4sm5507879lfh.287.2023.05.02.10.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:35:02 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
Subject: [PATCH 6/6] python3-subunit: fix rdepends
Date: Tue,  2 May 2023 19:34:22 +0200
Message-Id: <20230502173422.1439794-6-ernstp@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502173422.1439794-1-ernstp@gmail.com>
References: <20230502173422.1439794-1-ernstp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 17:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180761

Signed-off-by: Ernst Sjöstrand <ernstp@gmail.com>
---
 meta/recipes-devtools/python/python3-subunit_1.4.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb b/meta/recipes-devtools/python/python3-subunit_1.4.2.bb
index a018ef1dc84..3bb8526dfbc 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.2.bb
@@ -10,6 +10,9 @@ SRC_URI[sha256sum] = "2988d324d55ec35dd037e502e3f74ac38f4e457bd44ee0edf5e898f7ee
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = " python3-testtools"
+RDEPENDS:${PN} = " \
+    ${PYTHON_PN}-extras \
+    ${PYTHON_PN}-testtools \
+"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.39.2


