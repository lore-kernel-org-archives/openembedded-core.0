Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D2BC46CA3
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:56:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.102642.1701788206703145054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Ru/Ujb/T;
 spf=pass (domain: baylibre.com, ip: 209.85.221.45, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33334480eb4so4055105f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788204; x=1702393004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Q86ID95nuONZyKXI0DA5RP9lbazog72TRgz7ft/LFQ=;
        b=Ru/Ujb/TG5z4+/DZ2OMIzYPgGuS5v1MOGH5zUqpqaHJ+qSyaxnXAmizb4rNKVn2JXB
         q8/7Lu0Koi9UazjR4MqGHKq5vhEN4ri82mzZpSz9Ihxne7NPlfdhZdbsrxmXtss8N59C
         6xJznxFz6qwnOahhXSLZ4qQVWpOsaZhcsZ6o1Q6ecSSC9JVvmHfcCzAiGbczGmCKr+zY
         kK6B8hAQSeyI9cprxl/Gc0NfVmpr/6t30I+1E7KuPzp0IfKa9dy3qDsBTu1Tv8cff7Jv
         EgCCoYKAOmkFy0e/wy2OUjUmTKEb7EnulHerQZC4dDKh4iV5maBP3viTqUtLoKOfEEno
         AK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788204; x=1702393004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Q86ID95nuONZyKXI0DA5RP9lbazog72TRgz7ft/LFQ=;
        b=TCCCPn6i7j5kbnMdgvubc1OOeJXWNwXd3bt68ZqVY93i8FD0nC0f3sj+RueYiW8j7Q
         s6O+mbjPU4tHA85VpkJuyfKyXNDmEE9afb0uvNPbDFywEUG3Uf3DIJiFFfDVlpSGhUXa
         PmGlF0TBgHrLOjKrwlVj9xU4PwVyBFDZqJQPrdEAPTHdCLpg7f11wntD0m8J5QpQvcam
         P9Vv/j47wpCB2mrQLxqeGBGzriWlahOzsmhpESeU3GVwVVl9Yyy6c/FcbcgSKWwSQJ8q
         uC/vmf/0dZv7bBnWu3piU+3qmX/W2Lb61rw/7kKIsoxYMSHyqXPQUOZ46q00hastWJjf
         EPmw==
X-Gm-Message-State: AOJu0YwshGAJJw83emNr4Ke2cBL1xyehMc6SvNhR/h4W2zEtxx36AN3B
	AwkIyt4VbvtWtikJ4NNt9yx/osQG5TYu4yddOrkFYA==
X-Google-Smtp-Source: AGHT+IF5CJqVquklJy/zIDFb9Q8hkEmPFH3H+W6qn7cLzlZopThIaaSgeuZoa7/tUPSazMu/4JykVg==
X-Received: by 2002:adf:9d86:0:b0:333:53fa:707e with SMTP id p6-20020adf9d86000000b0033353fa707emr1168227wre.30.1701788204038;
        Tue, 05 Dec 2023 06:56:44 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm6750082wrb.53.2023.12.05.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:56:43 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 00/10] Several fixes around recipetool appendsrcfile(s) and oe.recipeutils.bbappend_recipe
Date: Tue,  5 Dec 2023 15:56:26 +0100
Message-ID: <20231205145636.960819-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191831

Hi all,

I was trying to use recipetool appendsrcfile to add a file to a recipe and I noticed several issues:
* -m is not correctly supported
* recipetool appendsrfile(s) are missing a usefull dry-run mode
* appendsrc function relies on oe.recipeutils.bbappend_recipe but
  duplicates some code: it constructs itself the new src_uri entry
  although oe.recipeutils.bbappend_recipe is already doing it
* we are lacking a mode to patch the recipe itself

So this series tries to fix the issues above, fix the selftest
accordingly and add new test for -m and for "patch mode" (update recipe)
and also add a way to specify the name of the file to add
(in oe.recipeutils.bbappend_recipe)

Improvements from v2:
- rebase on latest master fix conflict and update the way to add newname in bbappend_recipe()

Improvements from v1:
- in bbappend_recipe function remove old entry if an entry with different parameters already exists 
to avoid duplicate entries with different parameters

Link to v1: https://lists.openembedded.org/g/openembedded-core/message/191544
Link to v2: https://lists.openembedded.org/g/openembedded-core/message/191744

Julien Stephan (10):
  recipetool: appendsrcfile(s): add dry-run mode
  recipeutils: bbappend_recipe: fix undefined variable
  recipeutils: bbappend_recipe: fix docstring
  recipeutils: bbappend_recipe: add a way to specify the name of the
    file to add
  recipeutils: bbappend_recipe: remove old srcuri entry if parameters
    are different
  recipetool: appendsrcfile(s): use params instead of extraline
  recipeutils: bbappend_recipe: allow to patch the recipe itself
  recipetool: appendsrcfile(s): add a mode to update the recipe itself
  oeqa/selftest/recipetool: appendsrfile: add test for machine
  oeqa/selftest/recipetool: appendsrc: add test for update mode

 meta/lib/oe/recipeutils.py                 | 57 +++++++++++----
 meta/lib/oeqa/selftest/cases/recipetool.py | 83 +++++++++++++++++++---
 scripts/lib/recipetool/append.py           | 63 +++++++++++-----
 3 files changed, 164 insertions(+), 39 deletions(-)

-- 
2.42.0


