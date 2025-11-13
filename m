Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E6CCD98CC
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 18:42:02 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91.1763059317156727712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 10:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fljeFjOh;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: stondo@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b71397df721so139468066b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763059315; x=1763664115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCeUlkz7nECEUAyvteZKSfT+gbzcIh6IhXTR+HZXs6E=;
        b=fljeFjOhL+S//8W9+Go54WKZ+FDriOav0PaVIS7eGyFi84lbKxOvfuBJ6wghu6aPNQ
         Fob5+tND0hL1rDPZw+XjErdtVqvwH79yVvFHAvbwMKI3F6qACkF2cWf85vCU1ujMzmJK
         hhG4GIAGtF8IjTEbPENjFStYxmvy2lyL4S0okerHmw9928Ue37TfFhD25QdMjQm1wkMv
         fJVka3YlBsgW9UG8INa6tneVrQLg4+EZNO8yROHHIAN1yhqXUG4xmYSSHPasRe92+RQS
         h5Ez/Kx8ERlhhi0LKcKcknGOi1LPUfU7sBtOCAlzemhjCg1TWWPr/zC+mbOupsikZJnJ
         /r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763059315; x=1763664115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCeUlkz7nECEUAyvteZKSfT+gbzcIh6IhXTR+HZXs6E=;
        b=Sz/p8I5C9VClXmw6n/P1eWfMtqn1kwlq8cFUkS5SbBngE8SYgyfzIMlSjynzniAnOk
         i11V7x3uIftLC599xvwHmlLS9G64d7yCcG9r/P4KE865Q7jCoUs43ZLMoxszonrmUM//
         1AiqhyW9DZheFF0lJmgYMZ8skLNEUfUARNhOOeJyup/J+VRuwJ+D0BN6vYV6AdyE8cbv
         ++IUee5hDSqETVqkc1McAjYfTqXsBKXzdXYJuRM8aSyb3AQD7JLFqqoJyPDdByZ1l4y1
         CmVB+DefsiFJbM9ddJ47oHHTaAkhncuJG2+w2Re1l+35HzaJWGghGqd5anXMD4HFk0uQ
         v23A==
X-Gm-Message-State: AOJu0YwHIxQgaeShHF6T6Iw/FUfaSdj9PNcB6rlVo5JAYWuiolgJa0eW
	h6ai7eYG8ZbSS1gvjDasS1kLI3TCwWbVW4xwUK1Db08mw5XQtdg/uwHs8wLmUw==
X-Gm-Gg: ASbGnctK9iI2oXnSwOXTu43VbJiszA+CJGn98pvDYe0W9nS0UT5leS1+jW7feafCuN7
	LQ0vBDb7p1ra2tC97SDQsP17WqEHBw5uGSmTizvmtfSCpXoh5Jlm0IiP8Kmuzhnl8/W29HMwNw6
	8Vjt14oGAXyBhv+qbxZxcY8lpOw8HVX+4IcJuXWuZYNVYyPUpPBHXKZwyavieUQF8sKao3PPKOx
	KyL6PEusfxqcT0bKRaS3K01LVSNJ1QctL3zdlMWXf9i8SWN5sI5ZJcXqDImbOl9Gg6AoRxBA20t
	CwllCZW8i0aw6PCKrFe0F/yHvgcJLwQN73gtNvqf8NPzaoWrMJB0E8x7uWyo44XBOMehUkYagOn
	PPjgLpPjefrfj8RLnIv+2CSFbwjzwizS5GstRsSihIdLSgTBg4eJ95i5sIIT6Y22bgac19mcJru
	zixZfPtQjjy44cCCA8wRNoFgM=
X-Google-Smtp-Source: AGHT+IGfPogZwyVoweZ9lOALPXmmGe1rUsLUl5YApVDbFShqoHD8LF2ghk0/zgoL1g2ttzKavx4mUw==
X-Received: by 2002:a17:906:fe09:b0:b6f:9db1:f831 with SMTP id a640c23a62f3a-b736780c256mr23796866b.23.1763059315122;
        Thu, 13 Nov 2025 10:41:55 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b734fad48dcsm215301766b.25.2025.11.13.10.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:41:54 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Tondo <stefano.tondo.ext@siemens.com>,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core 0/2] SPDX 3.0.1 documentation and bugfix
Date: Thu, 13 Nov 2025 19:41:45 +0100
Message-ID: <20251113184151.511039-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 18:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226258

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This series adds documentation for undocumented SPDX variables and
fixes a critical bug in the custom annotations feature.

Patch 1/2: Fixes NameError in SPDX_CUSTOM_ANNOTATION_VARS feature by
           correcting method call syntax. Adds regression test to prevent
           future occurrences.

Patch 2/2: Adds [doc] strings for 8 SPDX variables in spdx-common.bbclass.
           Makes variables discoverable via bitbake-getvar and IDE completion.

Note: A companion patch for yocto-docs will add three of these variables
to the reference manual (SPDX_UUID_NAMESPACE, SPDX_LICENSES, and
SPDX_MULTILIB_SSTATE_ARCHS).

Both patches have been tested with core-image-minimal builds.

Stefano Tondo (2):
  spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation
  spdx-common: Add documentation for undocumented SPDX variables

 meta/classes/spdx-common.bbclass     | 26 ++++++++++
 meta/lib/oe/spdx30_tasks.py          |  4 +-
 meta/lib/oeqa/selftest/cases/spdx.py | 74 ++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+), 3 deletions(-)

-- 
2.51.1


