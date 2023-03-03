Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B00DC7EE2F
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 09:02:05 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.19225.1677834116447240088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 01:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=1S0CZ7cb;
 spf=pass (domain: baylibre.com, ip: 209.85.128.41, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f41.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so823489wmq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 01:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1677834115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mznRH/j4CTRUrHgSZjJIXKaZq8bQqim+zU0+BzhsMZA=;
        b=1S0CZ7cb9rCA+ayBIFBOcGouLp/zLiFOS4pj6iAfGtPF0aNksqILcRBXaHcGOrY3wR
         LNjN8FV4Ve0Ih4kAyCAtTPw/MuW8pzlczHkk+XML/Jbiu9Z4oEEhqc4lkphmb6h8qefj
         KGP1jwE9g3yqNSEjlnq8yPZgDRDo4lvhgNsShyOvKTPaf1JVAumAUR+WM2wKuPwSra5E
         HWKuwLugMaW+lXCoR7XyVvHejh9ji/rkudgACY+PxVHJae/fSWN9AY8iOjof1zAIKnbu
         scoeSezDyqbE8wjBpQVl5YeBiK3/D4u+MMY/MWUUIs4px2SQhEmZeRGAUCoEo0WU5CBn
         5yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677834115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mznRH/j4CTRUrHgSZjJIXKaZq8bQqim+zU0+BzhsMZA=;
        b=qt28PyXDNynQ6W0EHVH2+DKvJ6b6TrfXLS45H0iHn+0YdWMrO1oWGDpLzyHnSToIfi
         OPxl3xog8nF7RRdrNYTAyDY+L8HQIrdR6ODRBDAYddJD6zCHUsOjWODZRtIbYuTplI0r
         u2j6MqirfpG0mrl3QJZ+pHduk6X9QyUFQLNGfG91zLRpypuS0kY3xWdtu2qxeeZNQv9m
         GOCBzlMOzyHlmqZIQQpEYT6l5Eba4r4sRiiiQe1auTI9uTKpqMjkMa9FQDevOy8C+ADP
         p8VhZZFmqK4HfE58dw47xNWfhldH3/+Gyv4trVM/aUgFhV7phY2JXrBJb9/pAsbR2GXn
         pOmQ==
X-Gm-Message-State: AO0yUKUYwZhYQQN0CDkHzuUwzW7ulGI/xvIqspPNPR4GKCIMQVEyeI9V
	gB/e4Kl3KW3tica2fhSygsLsbeYAE4WkFAeu
X-Google-Smtp-Source: AK7set8KRAwEwGAAjO3ChfLzJ6d/+blgp1lEoidCrULpHPeLhhVN/RvCpjVJ5bb+Tae4W14lJzcOUw==
X-Received: by 2002:a05:600c:1c1b:b0:3dc:557f:6123 with SMTP id j27-20020a05600c1c1b00b003dc557f6123mr914063wms.1.1677834114936;
        Fri, 03 Mar 2023 01:01:54 -0800 (PST)
Received: from midgar.. ([2001:912:1480:1c0::1])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c47d500b003e11ad0750csm1698950wmo.47.2023.03.03.01.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 01:01:54 -0800 (PST)
From: Louis Rannou <lrannou@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH v2 0/1] Change the serial runner usage
Date: Fri,  3 Mar 2023 10:01:36 +0100
Message-Id: <20230303090139.207454-1-lrannou@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 09:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177980

The actual serial runner has a different usage compare to the ssh runner. The
return status is different and failure are not raised as exceptions.

Initially, I wanted to create a new run_serial_socket and modify the old
run_serial to use the former. And there was a second patch that changed every
call to run_serial to run_serial_socket. But that is not easy as each test
can have a different manner to handle the exception.

Therefore, this patch only suggest a new runner and add a comment to deprecate
the former runner.

Louis Rannou (1):
  oeqa/utils/qemurunner: change the serial runner usage

 meta/lib/oeqa/targetcontrol.py    |  3 ++
 meta/lib/oeqa/utils/qemurunner.py | 57 +++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)


base-commit: 76db0baba26a5da5382f7cc44c64eb705e24e638
-- 
2.39.2


