Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7D5D2446B
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:10:08 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50694.1764871803760503355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 10:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=iYzuNF/R;
 spf=pass (domain: baylibre.com, ip: 209.85.219.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88245cc8c92so8110966d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764871802; x=1765476602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUd0b+gEI+UzirW4PScWFmRNjBUrtVyiYSfZXfHhGUA=;
        b=iYzuNF/RPrWIqy7nTkhVZWCrc6/+JpP2Bda8uB3daKoJUhM6pp6Eo777jGrkcmXs3r
         7ZR2Qrcq3iRe/mUQl3bjGHmk8m8ixF9wfbl7O9iPJMipeqTVhYplmTZ7H0je0RO3ZnLB
         rHEaD5943rc28+WzhRWYE5ImJssRXYBBQa/1KpH0aeFtAbnIM5w71fNvAzG8W1uRDFNF
         t+g/ZgKMgV07V2BgZLvdEang9c4nsRK6G1LC1rlQlhEBleg5qCAg4LD/pLvsYMdkHdmE
         Ey4XqEn0h6pZz8GXkvv5ql512XyeeT1J6MTmXdeh0krFQWC7fYYgXrwH/1lH+NNLBS5A
         hUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764871802; x=1765476602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gUd0b+gEI+UzirW4PScWFmRNjBUrtVyiYSfZXfHhGUA=;
        b=mc7QX6JWvzSwF6rVca1EVf4mlxE/eRM6/fr5LfIWbgKZTRA7h2ry0KMK+P8Hn4bEbI
         /krfMHnlQRUMJFgoZ69nvBgR1bDS45EjrWP3uojMhua6XBQYKkhYDLFRbkQi4XrPRUwu
         DzO885S9avmJTEpiRDiSZm2HKaBNOVde64zQ57aOJjFF+S1p3iXzXCst9qCg91kfD0pg
         49H+BM89Kjm974l50/zwaRuErr0fwrbJOPvqI20FTIg9X9cLWD6lgiSZMwFbsJlFGu5f
         aMlbHsH/4rf+ixtdQiBQqpqw0PmAz4Eg63PmCXzUI3YCdfBEWbclyvhW0J03WfiPEBzY
         y9Qg==
X-Gm-Message-State: AOJu0YwgUwjXVe/b3WfNsXA9CyLbAkQynjar1GI+4oMvU/yvC4NVocQk
	tRuOW4pWZIWSGwZmcsdT1Z/8KefoD7IF73PwjReflVm4xtuiAsHWada7AOAb7MHCJl1nBQPGUnn
	UXMfBe8I=
X-Gm-Gg: ASbGncvvsU+Y/elv2oseknunBttuGuyc2lKqYEfv2/ZFxoMtdgx6ok9E3RPvJXQqBIg
	Dta0thPsl4QfhKCawfmYphMaTp2pFSDNOPEBQTJ8Owf1hKQVQ29OQWOF/5Ijy65mVdMBXSG27wC
	9GY/OluEspHqy0mrvKsW/GDhs3UjYLV/01hdXkty5LNAzJva88NerreOBowoRXr83x4QsA+Rdk9
	vOm/VrSV8a8FsS5exkHNb06YkhsWpO88+4YYliLZsd5ff1nVU0WHEZnXtTsnyVHg1vGeaxvX68j
	JMHw9CT42niSTg3vASEge+PkvFnZJiDl8dXjqpngSvnxM3X/u7qhtpPRfC+EJHQkR2b4BJUjhJ9
	vgfWlwsu7ouGIlF2FL6azS93Nn6lh4WgxpWwSBckhxmSrwtAOnsS109n1oWkX71d7yD7ksSGDF/
	dC4TxzKKuSoex0kGSaz7m0VWNcig==
X-Google-Smtp-Source: AGHT+IEoQN8thmUGYxtu8Z/lfwQ62rpBBu/BWO9gZGFx/46xKafpRDj75qqMU34hdZEPoVIGWv11ag==
X-Received: by 2002:a05:6214:c45:b0:888:1fc7:b0b5 with SMTP id 6a1803df08f44-888248ca74amr59319736d6.58.1764871801769;
        Thu, 04 Dec 2025 10:10:01 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-888287d6c1fsm15540066d6.44.2025.12.04.10.10.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:10:01 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/6] python3-pytest: add python3-misc to RDEPENDS
Date: Thu,  4 Dec 2025 13:09:44 -0500
Message-ID: <20251204180945.3112334-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204180945.3112334-1-tgamblin@baylibre.com>
References: <20251204180945.3112334-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227320

pytest depends on the annotationlib module, which is in the python3-misc
split. Without this, many of the other packages' ptests will fail right
away when pytest tries to import the missing module.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3-pytest_8.4.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.4.2.bb b/meta/recipes-devtools/python/python3-pytest_8.4.2.bb
index d85033cd1f..baf72a31d9 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.4.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.4.2.bb
@@ -17,6 +17,7 @@ RDEPENDS:${PN} += " \
     python3-doctest \
     python3-iniconfig \
     python3-json \
+    python3-misc \
     python3-packaging \
     python3-pluggy \
     python3-pygments \
-- 
2.52.0


