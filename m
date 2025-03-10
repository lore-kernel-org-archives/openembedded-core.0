Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00969C28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:37:05 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.33756.1741599421574644325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LuN7RoRo;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390fdaf2897so3722646f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 02:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741599420; x=1742204220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PAhmsl5sVoYwtDF78vKHanpkYhRQXrOMJUhdEGbiOGc=;
        b=LuN7RoRoAP7fmBAm0Bbqx81PEJSAz57TG7P2XU1CbF9KH+8QdsIrHVoisB1MH3BaHp
         bcAl2NoOWe7hrRqUMqHo7TlIuueu0sU5xbaZkqmmhD9NFl1snz0PBpVSoYjhHJ06dxda
         JXnwoS3z75kRLaORuKjz3fUl9nWeipzShucSYWl+IMdd+5zaJFgFNo3VMK/FC8j9kRKT
         RhLgbUi1sA1X3QnMwCHYbXhI4XvNIgFormekfx7XRyPGgwBlKwcSe9AbP3ErE45A2SLV
         jqD26iF+HbgEkzXgc+7mB+T3WGF087Sr4BsYr1afaKyNVEADmL70vt2ozxmZrxVq1k7Q
         IJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599420; x=1742204220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAhmsl5sVoYwtDF78vKHanpkYhRQXrOMJUhdEGbiOGc=;
        b=jh8GL8dLEtXmvUs4qFMz3ZWrktFXdnuTD3vo3Lm/z82wWcZZBdPk4ZaMQAjYmmXIEB
         I6zZ6k5v/9CCsPqNWtRRYZp6Leh9ky/6XEK/IIlxwsKNC2ZH0oFjdjLajVHonvvTXY6G
         npmMpHMTVod5fyDo6eXXWvo6GHb2zN7oZdwxal3xbQnN5VSKkfUjNhuS9WlEVAWylPyX
         zU62jZxmOeHZC280b6S9e8EFowe+GviKmzagZmAFkz7ZYBcnidmBiWOiOHel6lGJbotm
         KnsorPNogXzKpSWzA/mG+b7k99pruPwm0OzeMeFiHSwC3p+tDmlle20a03+u7I9WIvRi
         pkqg==
X-Gm-Message-State: AOJu0YzWobRufBQbDtpy/r80YCAnplJtmQ2ytKEhPLgkhV1HJd1mHvaL
	/lbK4EnBQWSo+l31LpZ+cJ5L4J4DIFOokzELw+LIPc6maprV3q/3rBqeWA==
X-Gm-Gg: ASbGnctef6DKJ4vlF9A/uX4gmy53aufWq1JlAjuKzFoopLDLNZouGfRp3XrpTc2UEC+
	hBJ69IwEOZXtU6c+hTFqYdPdcyVFtwQpOVPfKWK6xmX11VT3PO1tah9SrMXKl7+qKGM5DAFyDoI
	bUuc2u3Bj24aAeu2gPw7Nh9e45FXmUTEcV21Vhfu6PWA/si2uEkvLTsPgc8+RnVFRjwLYTKtG5o
	LRpQCUGYmbHJoD7uC0sieo44yvpTxizqHClEOtLVHEPzoEaJhhupjTrh914hvECFiKK6HdNwvMj
	X+a1lZtoYdRhN0cUGeQDusYHNhxl+0JazAdd/liJ9twBb7mXYSBQt46KafXln4Qx00E=
X-Google-Smtp-Source: AGHT+IHYOYeww/IXFxX6OHQ8ddvBdn0GRKqUSn6lVEcM+UJQ5vfv/4Shy4JrvB7RdMOL+bokrvJZOw==
X-Received: by 2002:a05:6000:1842:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39132d74df0mr10249780f8f.33.1741599419508;
        Mon, 10 Mar 2025 02:36:59 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79fbsm14554454f8f.13.2025.03.10.02.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:36:59 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/7] oe-selftest FIT image cleanup
Date: Mon, 10 Mar 2025 10:35:42 +0100
Message-ID: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212496

This is a major cleanup of the fitimage oe-selftests. The tests are very hard
to maintain. There are now 10 tests, each of which has been copy & pasted in a
slightly modified version. The tests consist of a simple parser for its files
and a parser for the stdout of the dumpimage utility. There are now 10 variants
of these two parsers in the code.

This patch series restructures the code into reusable functions. Instead of
implementing several independent, self-contained but copy & pasted test
functions, there are now a few generic functions that implement the counterpart
of the bbclasses uboot-sign and kernel-fitimage. These functions are then used
by very small test functions. A test function now essentially only generates a
local.conf file. Checking the functionality is done by the generic functions.
The generic functions therefore take the bitbake variables into account.
This means that adding another test now consists primarily of generating
another local.conf file instead of copying a large test function. In practice,
adding a new test probably means a few more extensions to the generic
functions.

This is part of solving https://bugzilla.yoctoproject.org/show_bug.cgi?id=12912.
The next step is to add more test coverage before the fitImage related code is
reworked and probably moved to a separate recipe. Moving the code to a separate
recipe is necessary to fix the sstate cache for fitImage.

Adrian Freihofer (7):
  oe-selftest: drop redundant imports
  linux-fitimage: sign setup sections
  uboot, kernel: use hex address for UBOOT_ENTRYPOINT
  oe-selftest: adapt u-boot tests to latest changes
  oe-selftest: fitimage sort tests
  oe-selftest: fitimage cleanup
  oe-selftest: fitimage add more kernel tests

 meta/classes-recipe/kernel-fitimage.bbclass |   13 +
 meta/classes-recipe/kernel.bbclass          |    2 +-
 meta/classes-recipe/uboot-config.bbclass    |    2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py    | 1934 ++++++++++---------
 scripts/oe-selftest                         |    2 -
 5 files changed, 1069 insertions(+), 884 deletions(-)

-- 
2.47.1


