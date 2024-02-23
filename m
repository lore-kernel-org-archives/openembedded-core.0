Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EBFC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 11:16:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.8414.1708686970347260059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 03:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=09xhPXVW;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4128f3eea18so5152775e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 03:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708686968; x=1709291768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4mYgDw89AsCtvmBdpx5T3YwT+w17n0gS9ZJNN/MbQyo=;
        b=09xhPXVWN1pGcGyPra74mn6HMclv6dC3M0JQvVeK6/ZtjC08gFwmFL68R+U1/XhBon
         FmXWdLL7PASSDZAM4w8QCBcdRaOsrnmLn1s7CtF5QjH6/YYolX+MDQyoXPK+xYF7sN+P
         wFAHGwamV/hh6U8KVBTSfMQY4sULYkmMmkZb1sfbgkcWRwx3EWyFm1MnpHW+AL8jGm3a
         rP63IfHxj5807v+26J9afbOpAFMoqhbrHPR6f59DbmYYPTUDhpDTrZ5Z4yV29Arwbag5
         JYpUbOzPEVbYr74BDD47dBy9Qyxu3b8gzXOdpsX760doXV4fhcS6hyrbOZeDvx1yVtV5
         XFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708686968; x=1709291768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mYgDw89AsCtvmBdpx5T3YwT+w17n0gS9ZJNN/MbQyo=;
        b=OMAjNYf6s/vEXNO/o4ZlThh+AN9ljXCpZD8v7myk58FFQxSCWJAkxoebpi+xsNOKmZ
         AjJ5O4NGQLccb1hobPXiUowUuS/pUEvSNSnC0zw1nc3DVh3fw58D+38CWHjbvQrgpRzR
         LAdtu6IV/g+GuHENhXkhb6UTSsVxalcnGbsX2FPhuXgjtZDgEvZWovv4WmYHfQMY7H4y
         Ew+pVxyGwIm19ol2bdgrAxFATUo8DaDwBc4zg47knZBU6uPGq2peHCA4/hWxHNG1kGPD
         6gcX2fAMvpDLsvtVTlIjgYpXYIzFmsebK8m4bUwy5QKtdGtIeegfwkTrf+1aiXtp41t4
         u/SQ==
X-Gm-Message-State: AOJu0YxyvYII6sy41BpEi8nvsTb+B3BYZx9qHHKSdBv7FiGBSXv9OjVc
	GssWXFjXJL+0wAqr4SxS+RXu+bnNXHMwdffrPyCgCct2WzCth3H/RWnNWHdwrQZaPPR2uaLuYmV
	dw+g=
X-Google-Smtp-Source: AGHT+IHDa6yKHEc0t1qSFDMlwwu66yObyW5p4VpsEqfDjNGqM/HpdIFPAKW3++2+LA/ia0pC6IhgUQ==
X-Received: by 2002:a05:600c:6a09:b0:412:5671:ad3 with SMTP id jj9-20020a05600c6a0900b0041256710ad3mr1025286wmb.30.1708686968436;
        Fri, 23 Feb 2024 03:16:08 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id jd17-20020a05600c68d100b004129335947fsm1895094wmb.8.2024.02.23.03.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 03:16:08 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH v2 0/3] Useradd postinstall fixes and tests
Date: Fri, 23 Feb 2024 11:16:01 +0000
Message-Id: <cover.1708686845.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 11:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196056

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


