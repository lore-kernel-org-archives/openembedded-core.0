Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7537FC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 12:45:46 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.82661.1701953145229466077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 04:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=u4/fMpE/;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40a4848c6e1so11266845e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 04:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701953143; x=1702557943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cM5yb8eebTAHLvICcl48pbrpjXEYwP+Dhi8PAM2Des0=;
        b=u4/fMpE/D2hrftMfXa/dQGnsaLBqPO7KXs5jJW6NmJP0ggnyxZmQnBXa0ExRXe1PPM
         fU3FztznGKyNHLUisSxWHHA/XL+wxKGJLH41lSkT3FWYn4DR/WvCWdpZIaPZnQnD8OJk
         BgMNy7zOBDR93o4k+1hZCb7U7EJNTRTktTwyYI/wNYdcE9iy9ZGa+ZTDE/jT3omxCLGP
         6LYI62hq6sZ0jr6hwS9hIxmG5E4bZg5OdEMyxLcLzDne2qlF0jYsx4gvNNcX80dD1o7L
         COv57HzCIxTUYIf6JhBuuDrfo87q5aYNPDovtqSvfG8dElUUVWwSoZtBsuhJW1KQJxFZ
         4KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953143; x=1702557943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cM5yb8eebTAHLvICcl48pbrpjXEYwP+Dhi8PAM2Des0=;
        b=XGck/TO/ACj7PLMjE9O8jajKpyzvU5iURiBpBcMhih2gFrZKSFrKks6No2GtQWd28n
         gi3z9laGjhiELW76P4rD3vi6LzIQzicV3PwUztMKBE0N9aFumWlsKNR8nNF7kLegOWH2
         vddciBwH8ckIjoHLqsXKM0ZVtctgtoJGg8lpYFaY6Ham8xguJbrF/t91dLD1e+6oKoJZ
         NGNSlzkWAvJ/tZseJL8co4gi6ZEhD/P+Heuzr2gpCj8D/w22g/KegiL60pA/stONbVdE
         2m+y4BYk3gtms2L4iL0wfGUD3eGbwfUQI68dqp/fAzc2xFIt3YFryyyqNcdx7TrXG0xZ
         NN/w==
X-Gm-Message-State: AOJu0YyCbgRgbjJNKKlko5M2pGawKn6BF8TECeJ8bT/Pl6RZBov0PamH
	iR30VU49/NI01siKU5YFcVn6g4RLCfubig/exXZkLQ==
X-Google-Smtp-Source: AGHT+IG/wAipmBHAcbR+MEajQW+/DOpbhaoo34/pPw/87/dQJOx5LDpt/eiJPU/iINMIg8DKowsrYw==
X-Received: by 2002:a05:600c:ac6:b0:40c:2670:f42d with SMTP id c6-20020a05600c0ac600b0040c2670f42dmr779159wmr.225.1701953143116;
        Thu, 07 Dec 2023 04:45:43 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id jg8-20020a05600ca00800b0040b54335d57sm1901449wmb.17.2023.12.07.04.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:45:42 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 0/3] useradd fixes, tests and documentation
Date: Thu,  7 Dec 2023 12:45:31 +0000
Message-Id: <cover.1701952927.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 12:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191948

This patch series fixes and/or tests for some issues in useradd dependencies. It
adds a new variable "USERADD_DEPENDS" that is required now for recipes that have
dependencies on other recipes useradd.

Fixes/Tests:
Bug 13419 - recipes that add users to groups cannot rely on other recipes creating those groups (when population from sstate happens)
Bug 13904 - do_prepare_recipe_sysroot: postinst-useradd-* does not run in order of dependency and sometimes fails
Bug 13279 - Make sure users/groups exist for package_write_* tasks
Bug 15084 - For some reason using of same user in two recipes does not work properly

Tests:
Bug 14961 - addtask between do_populate_sysroot and do_package breaks useradd class

Documentation for useradd is also included.

Eilís 'pidge' Ní Fhlannagáin (3):
  useradd: Fix issues with useradd dependencies
  usergrouptests.py: Add test for switching between static-ids
  variables.rst: Add USERADD_DEPENDS

 documentation/ref-manual/variables.rst        | 15 +++++
 .../selftest-users/creategroup1.bb            | 32 +++++++++++
 .../selftest-users/creategroup2.bb            | 33 +++++++++++
 .../selftest-users/useraddbadtask.bb          | 20 +++++++
 meta/classes/useradd.bbclass                  |  4 +-
 .../lib/oeqa/selftest/cases/usergrouptests.py | 55 +++++++++++++++++++
 6 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/recipes-test/selftest-users/creategroup1.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/creategroup2.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/usergrouptests.py

-- 
2.34.1


