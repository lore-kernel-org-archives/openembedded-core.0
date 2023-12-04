Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E47C10F14
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.71448.1701703573379005214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=cGpGJUr0;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33338c47134so1925431f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701703571; x=1702308371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xiSkY5+SxoaDP6o3REx5sDZJK9DoMvueq7Fz1WULP9w=;
        b=cGpGJUr0weL7ZXvhkiRoVeE5Teg6bpzBUNsmMZUm76d7CgqSIu+wOMN2ec2OWzZEuH
         +s4GVh5U4NnSpJWvrmbQ+efvknqn8acYeC9WZrbJgT+fHex+eApKFqgU777AD2P1u1HC
         SJVUje+EF6WWvTIgL6usrigdKfSTtMTgjrGVCg+tsjp9LGAxu5YZ/UldvZqhn0or5qok
         fEDzzfgP+IrYHJUA0RgrQ6GurWBwbX55/cK5sOw0iKGa7r+4mUo0Bx029rwXcoS8k3SP
         7LRa89zp1GKvUh+1wEpArvZ+1rzy3ug8uKJm6nySoQoNRcsp+BXA0YAKaDjor+p7WVe2
         bpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703571; x=1702308371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiSkY5+SxoaDP6o3REx5sDZJK9DoMvueq7Fz1WULP9w=;
        b=Lf+kzcQBu+6f30o6MpjxViC7feZxbYNa2FyheDx0NsfjJwQZk9F8MJOLNRkR2P7DLf
         ivyGXOfhe++ckYLk2FhmP97M0FAT6E0OK6lhrrJsaU4zUwgXZIsuFJi7X1i0mf4ObuWZ
         y/sykmUESnR2NULUma/iGDeIpR2Av3nKgX9Wz6pt9SC59il2xiINgMNyZuCGTDR4LY7f
         4PwPTeroLgWhakFg48/vWCwhKPkYt4zq8NSXdsIpF0+DBK6L/8I/xCi2Zegjl7juvLZt
         y7ZuJ/bgWwAbAOcgYHuW6TOxTW2vNngXFxwffN3uXlR+RLYaCR729j/YiS2isQq4mkLt
         sr3g==
X-Gm-Message-State: AOJu0YzcVutrSG7u5+0Fl7cN2wfUAVADTZGeX8Z2Y3EzlXcpqIlidiST
	AhcPKq2st95oDzd6ImNscleWw9U720IuwKj4t9CkDQ==
X-Google-Smtp-Source: AGHT+IHF83Y927RSk3KSG77nwwUXe9/EetjPeVmKOPBqwP8yHdNtOOEtVRwIh5FwLEHqaU67uV1Y/Q==
X-Received: by 2002:adf:fa92:0:b0:332:ef1e:bb89 with SMTP id h18-20020adffa92000000b00332ef1ebb89mr3684671wrr.57.1701703571554;
        Mon, 04 Dec 2023 07:26:11 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b0033340937da6sm5257341wrt.95.2023.12.04.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:26:11 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 0/9] Several fixes around recipetool appendsrcfile(s) and oe.recipeutils.bbappend_recipe
Date: Mon,  4 Dec 2023 16:25:54 +0100
Message-ID: <20231204152603.831495-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191744

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

Improvements from v1:
- in bbappend_recipe function remove old entry if an entry with different parameters already exists 
to avoid duplicate entries with different parameters

Link to v1: https://lists.openembedded.org/g/openembedded-core/message/191544


Julien Stephan (9):
  recipetool: appendsrcfile(s): add dry-run mode
  recipeutils: bbappend_recipe: fix undefined variable
  recipeutils: bbappend_recipe: add a way to specify the name of the
    file to add
  recipeutils: bbappend_recipe: remove old srcuri entry if parameters
    are different
  recipetool: appendsrcfile(s): use params instead of extraline
  recipeutils: bbappend_recipe: allow to patch the recipe itself
  recipetool: appendsrcfile(s): add a mode to update the recipe itself
  oeqa/selftest/recipetool: appendsrfile: add test for machine
  oeqa/selftest/recipetool: appendsrc: add test for update mode

 meta/lib/oe/recipeutils.py                 | 62 +++++++++++-----
 meta/lib/oeqa/selftest/cases/recipetool.py | 83 +++++++++++++++++++---
 scripts/lib/devtool/standard.py            |  6 +-
 scripts/lib/recipetool/append.py           | 63 +++++++++++-----
 4 files changed, 168 insertions(+), 46 deletions(-)

-- 
2.42.0


