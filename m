Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771D8C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 12:32:10 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.6409.1637152329876956629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iSLvJh01;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id w1so10412502edc.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=azvspvYATK6ncAIlQWTLx4WZ8K19M+cFunPAjOyruAg=;
        b=iSLvJh013rj3TTccLhiGrSlfYrJWcmh1qeAhzn8ugzNLP0BJvW5vUKOEJivDNws3qP
         1LZzPwuGIw/ZBSg/T9WHoVti9vUpJY8WN4Wrm5ZrE+lp4RkYPYrvwjFx0zrjsbyYcCcs
         AuFQtev+Nplb3gOvoHcc5quHCEAD4FeuR7hgscyeg2/FxrKqrm33+nO1dcEsmeT4p67M
         G+iVN+GcOAboVdhfA8u12JHTJb/AFCmGs68+xPNxlpqZkNGqL20iguPWreIMb1/53p+P
         lSKCZSROyT51ROxAKnPGYOrz6Z1mn8tqFIqz9aIFDyMSypElbmh8zPBNTB6qHGJ8jwJf
         9keA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=azvspvYATK6ncAIlQWTLx4WZ8K19M+cFunPAjOyruAg=;
        b=HsDz5HNkyGx8LFkZ+jlf8w2/7qgXvgt0DrEhe/q4avBIM4cjEyE9FZvVesgg1dgcKz
         zuBJNsrnkVOsP9qpWbPWdkpckswaK4k1b6GiqyjItTYLc/VcEgkvZx5lYwHsasZgK6Lh
         nVtSBSVhHjDWf8qfNJTs9iQKVw6Yrv9z7O4YnjF2x71+motT4sYI6LDWdvRB2UZr5QlJ
         XAinX3INUw6RhJTkdM4bSjOTSIWFhXQ9fq5jFB2brzVvK1x730Zl4toftYyjVYfXIa0T
         VAALRDr/3rM4OEVW2JVb2ilYX57rfVR/bfyfaHniZWNtX+XNleCDkP3DZ5BD8sdrIvIf
         mEnQ==
X-Gm-Message-State: AOAM533oYinj8rRKmHyYST9jAEcHjWIehtlr2HS1CGzuEOVEzF8x7Jvt
	p+E1hadHUN+jOgK8CI/8KI6XLc+kUmitCQ==
X-Google-Smtp-Source: 
 ABdhPJxc/gJ1jHrRFq7pZtG7q2SOhuAcNhYWJjFZ2nvjVdOQVJJhNicdE0gQ4WFk/VvlWJHIv+pWAA==
X-Received: by 2002:a17:907:6e9e:: with SMTP id
 sh30mr21474647ejc.156.1637152327902;
        Wed, 17 Nov 2021 04:32:07 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 nb4sm10345059ejc.21.2021.11.17.04.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 04:32:07 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH 0/8] systemd: allow building for nativesdk
Date: Wed, 17 Nov 2021 12:31:53 +0000
Message-Id: <20211117123201.111905-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 12:32:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158384

From: Luca Boccassi <luca.boccassi@microsoft.com>

systemd-analyze in the next release will gain the ability to
run the 'security' and 'verify' verbs offline, on local units.
This is very useful at build time and/or in CI systems to detect
errors and issues before changes are deployed, as a static
analyzer tool.
This series enables building the systemd recipe for the nativesdk
targets, so that systemd-analyze can be included in the SDK and
called by users/build systems/CI systems.

Luca Boccassi (8):
  systemd: skip chown when building for nativesdk
  systemd: skip postinst in nativesdk builds
  systemd: remove /var in nativesdk builds
  volatile-binds: remove /var in nativesdk builds
  volatile-binds: add nativesdk
  kbd: add nativesdk
  os-release: add nativesdk
  systemd: add nativesdk

 meta/recipes-core/kbd/kbd_2.4.0.bb            |  2 +-
 meta/recipes-core/os-release/os-release.bb    |  2 ++
 meta/recipes-core/systemd/systemd-conf_1.0.bb |  2 ++
 .../systemd/systemd-serialgetty.bb            |  2 ++
 meta/recipes-core/systemd/systemd_249.5.bb    | 29 +++++++++++++++++--
 .../volatile-binds/volatile-binds.bb          |  7 +++++
 6 files changed, 41 insertions(+), 3 deletions(-)

-- 
2.30.2


