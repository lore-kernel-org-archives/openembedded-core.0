Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8542CC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:54:08 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.14596.1708613646781258977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:54:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=SPkEwd8i;
 spf=pass (domain: baylibre.com, ip: 209.85.215.176, mailfrom: pidge@baylibre.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so5998129a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708613646; x=1709218446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4mYgDw89AsCtvmBdpx5T3YwT+w17n0gS9ZJNN/MbQyo=;
        b=SPkEwd8i9Z4/APXh7He+nEdT8i3EFEtoU1PQjV7bJQ3loyIpOKdshKzNTYS/58PLMx
         OhOIY5ChHG3YEtKjsJI2B5Yi/VYmmjcfCeTm4RuHCd2YjGNIAbaLVSSuqZtek1JlqszP
         bik//XAssWxrPgGWTIQkqBTRVIl443f4iK/UyfW0lI+IK3HxT50Hs59Nt1cDOPVaCwQh
         KiZiM9Iq52XfoAD2JHu8AK4O7pfLiZNSDZCjnfKX7fzuIighijS+LUFzQcdQh4YX9E2/
         esgTIghQ5g9F8xXLpaBUhcEkt7lyz/rOzpCdNZKVVoniB9reJ1EQc2GolCX+vx7NxT9C
         hZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708613646; x=1709218446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mYgDw89AsCtvmBdpx5T3YwT+w17n0gS9ZJNN/MbQyo=;
        b=VkHOfsRq6lt+AuZhdDiq1GfpUc4Ddzyhykm1j9CmemgZKcm7W6oHm28Pq+0alOrxOy
         6BigdrJSX7wuIi68YlCtxPZLeO+WyxuobGzJ7lOCFXgUjSh66r45+IwMDspjIF0/TxRG
         PY6JXqjw3ERxoWvkJWI2ge6ACArmLSZdYHfZqZOV8ESXNPMjmqrPAgWjBTmgqhtpdYRw
         r/p6YHSwH7wm4uD5SgKSC1vy/IWP4d4e7A8wqgYw88lXIascVNQ/+0l4KyUB0p7t5Ahx
         9nLne1kqLsw/ZuNZjyXZxsKOkHC1hy9DR3rErW3CBBybQuTB4UfVIDIGnLCrcbMSxa7g
         +VwA==
X-Gm-Message-State: AOJu0YwlhTxjJRSEPp0t9P19IdovgsLWHFffF1vtSST8WiZ5dwMlutr/
	mn1LUM9jryInF6fl0zDD4yal++l43byTHW97fsoDlt13NG8gwB7YznIGvfWdDYWtKsClDJqhwSi
	NWj0=
X-Google-Smtp-Source: AGHT+IHs1yTuBe74WO9jwCVXzJxMHRM5inhO80bk+h3qICiakWJae6TFf+KsUp7600p3s9ji8K8wig==
X-Received: by 2002:a05:6a21:3184:b0:19e:cc0c:dc44 with SMTP id za4-20020a056a21318400b0019ecc0cdc44mr20091284pzb.58.1708613646122;
        Thu, 22 Feb 2024 06:54:06 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id sz5-20020a17090b2d4500b00298cc4c56cdsm4067410pjb.22.2024.02.22.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:54:05 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 0/3] Useradd postinstall fixes and tests
Date: Thu, 22 Feb 2024 14:53:53 +0000
Message-Id: <cover.1708613381.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196030

These commits fix #13904 and #15084, adds a test for it and adds a minor fix for
the creategroup tests

Eilís 'pidge' Ní Fhlannagáin (2):
  selftest-users: Convoluted selftest for USERADD_DEPENDS
  creategroup*: Remove coreutils-native as a DEPENDS

Piotr Łobacz (1):
  useradd.bbclass: Fix order of postinst-useradd-*

 .../selftest-users/acreategroup.bb            | 32 +++++++++
 .../selftest-users/bcreategroup.bb            | 37 ++++++++++
 .../selftest-users/ccreategroup.bb            | 34 +++++++++
 .../selftest-users/creategroup1.bb            |  2 -
 .../selftest-users/creategroup2.bb            |  1 -
 .../selftest-users/dcreategroup.bb            | 33 +++++++++
 meta/classes-global/staging.bbclass           |  7 +-
 meta/classes/useradd.bbclass                  | 72 ++++++++++++-------
 .../lib/oeqa/selftest/cases/usergrouptests.py |  4 ++
 9 files changed, 189 insertions(+), 33 deletions(-)
 create mode 100644 meta-selftest/recipes-test/selftest-users/acreategroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/bcreategroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/ccreategroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/dcreategroup.bb

-- 
2.34.1


