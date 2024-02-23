Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA79C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 13:25:47 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.10421.1708694738872609884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 05:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=gbyXR7Bq;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3392b12dd21so642490f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 05:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708694737; x=1709299537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmoqTVgzbOAE3jnLAJKEwfhKed1bxTtvrWbPxr1Ud7U=;
        b=gbyXR7Bq5aSD7RemV68Zi1toVMTrRdsAv9qX45iPN/eIgt5X7CvHCnAl/q2OW/NgsW
         bySTbiEL0hHkRBEeABaW10c/Ri8DVme85p0vrbtl/qYMohciMaQBafYD4VdNLpR26DYy
         1sg7tz1jOU4aKvK5i47aQej5KQNm33Pggx1JmPjNUQGF5f/n/b6C+Vwb9mO66twNdN5t
         /uNkIqyAWH9fJ1J4oo1STXdvcAtpwV8t17eIae/hYrZ1FhahdNxGxnHSLIBVw89N5oTl
         3fYeyDzI+Ipe+SWrOYUSkudUWx9Q0DW4CU8ifTcRVUeVkft6e5bZfxjwK1fMteMJolH8
         O7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708694737; x=1709299537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmoqTVgzbOAE3jnLAJKEwfhKed1bxTtvrWbPxr1Ud7U=;
        b=MsfOWuI2iSV0RpUi/B8CkhJMpixxg86pw6iqFuidIzJ5j0nU47+phTStWDK2wUNv4W
         hgt71EJnczRg4Ia4bMFiFIW2ZQftP/l0o8PQzz11FVQRhuGIovBrFAFY74+XGZkjzS3+
         Xr/lWxD7vaor9T4WFc0AY8KJphwlO/pQRboPlF/U/7br5DtsonQAaeNvjLCneyKPPPV4
         0kcADZe/lFs2y1L1i/k4ubNTnkuP3hIqgulEuWGbBlbOLVPi7hjaEf3+obvJ2AV5dG9M
         aFk1Yu3K5RgCeNA7HUuLeGz9Xu668ppWAgU8vjLm3w3tkcxhecGFVIm0Fc3ARIQ2kLZF
         u+eA==
X-Gm-Message-State: AOJu0YyfCa45kgr6cHxMEINdJctWnDAET4HYRR3mL85UVmMr5d2lG3gK
	oX/T+CAw4u0jqVa0hKPYL5VFlzSDAyybm2Ao/MU0G3CabkvAQYkp3NnjlDbJloFPWy5uGLxyuFe
	YA+4=
X-Google-Smtp-Source: AGHT+IHUO6N4CXx1xIqUka9q1u7Yz6xsh4HUCiw76zYQRrEQtAU4dM8hJZgTJgbZsAW+crS9bz34Hw==
X-Received: by 2002:a5d:6690:0:b0:33d:1d57:6eb1 with SMTP id l16-20020a5d6690000000b0033d1d576eb1mr1327684wru.32.1708694737253;
        Fri, 23 Feb 2024 05:25:37 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b0033d3b8820f8sm2793450wrb.109.2024.02.23.05.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 05:25:36 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH v3 0/3] Useradd postinstall fixes and tests
Date: Fri, 23 Feb 2024 13:25:19 +0000
Message-Id: <cover.1708694024.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196075

These commits fix #13904 and #15084, adds a test for it and adds a minor fix for
the creategroup tests

Eilís 'pidge' Ní Fhlannagáin (2):
  selftest-users: Convoluted selftest for USERADD_DEPENDS
  creategroup*: Remove coreutils-native as a DEPENDS

Piotr Łobacz (1):
  useradd.bbclass: Fix order of postinst-useradd-*

 .../selftest-users/acreategroup.bb            | 32 +++++++++
 .../selftest-users/bcreategroup.bb            | 37 ++++++++++
 .../selftest-users/ccreategroup.bb            | 34 ++++++++++
 .../selftest-users/creategroup1.bb            |  2 -
 .../selftest-users/creategroup2.bb            |  1 -
 .../selftest-users/dcreategroup.bb            | 33 +++++++++
 meta/classes-global/staging.bbclass           |  4 +-
 meta/classes/useradd.bbclass                  | 67 ++++++++++++-------
 .../lib/oeqa/selftest/cases/usergrouptests.py |  4 ++
 9 files changed, 183 insertions(+), 31 deletions(-)
 create mode 100644 meta-selftest/recipes-test/selftest-users/acreategroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/bcreategroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/ccreategroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/dcreategroup.bb

-- 
2.34.1


