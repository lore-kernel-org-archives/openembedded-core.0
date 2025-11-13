Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9D8CD98E3
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:40:53 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.901.1763058276647856646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 10:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cFUTzeOf;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: stondo@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b73161849e1so190438366b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763058275; x=1763663075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCeUlkz7nECEUAyvteZKSfT+gbzcIh6IhXTR+HZXs6E=;
        b=cFUTzeOfxwsWIU7hvZCRGCAB4zp3CbHNOvgcr7n2A5Q/xlnNK+hYKOVMYAK/p7/8eq
         B0J+TCTCZRykW6RMTiSIQGPg1SOS4vmOfgZle9VqQDlnIl1eOh6zjbiUQrFVXOhuNAZx
         mXURh/28jU1etwWYMQjZsC8opAYXy4u9PFvsxaLq0GWbQGpQXoCAhDZpg2VPn7Ctcrfq
         EMarwqtu3aqDLJ7YGyoXPnGqJsjlyMLwDyDsK916ZOYcH+74V1qOPocHog2VOAadZpg6
         swzJQckvL29u3qhOSBghTBD9vF7cjAAs5gtnIqNBuJWlW8NQdFg0boSD4jkw/tiMp6p4
         O/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763058275; x=1763663075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCeUlkz7nECEUAyvteZKSfT+gbzcIh6IhXTR+HZXs6E=;
        b=wDOg8i7r4WESrH7dLRdsWFcZsH6BeCBB/AwfC9FaIuYnxXIoFjEdHV1BkK/BQhVbFn
         jQdGEZqjBpYpjVlWDOzxg1mMb5j/6zaNcSJXDrMASesMIvwKKjFTZ8d+7Y77N+BEffJg
         K/ZC6WBs5dKGh8dHbMe85iS4l9EyscixFW6ZbKTebh0GYo9jSw1L978SedS27tieliCo
         ZltHXTSdzUOql3XNGzqnKA7ecSZLPleWTpkXQd77c4i6InL9ZpkD/Ja7EDNayZi9SLju
         VobaC0PPvK/9zLtjMMX6VnT6BrbeDPLB0/pLyTcxRLpV3fS7593F8ect56SLPahFuanZ
         AT8Q==
X-Gm-Message-State: AOJu0YwKFrAiUInRjATQNJh4GiyEmgLfb4MdWMIxC1JMG8ps5bipQEFK
	udWWwG9HBl3ybitcRBB45YRg+PqHggDTJ7YMURTCExXkkqcPJLHWUXXaXzJEdQ==
X-Gm-Gg: ASbGncsdOXbaIUk2aiN7Aa5lWN156kN0fKNdmYJgEG3NlRopuqriUffzvqf1n/w1sDK
	4FXoQDsGmMpo5VfPNsCOBCREeDh9E8gNp3EFgUcan1D56DnCENq5rWYO52XNUZ4dNhZ2nLZNr0x
	H9GY9F2n4FQ/q0l6civynX03Pr3ZPibPpTWEQV76SianFIEeeVZNCqOlPZJkar9PW+LOd1AsxrM
	nrA1P0a8Pa01FAa11d9c7YhnuKyOAtSH9OAHgjQWyXmykvH8c0uAHGLFyp7256C1zK1cVvYnP6j
	Gx0FfywNKEDAl3J96RaLq6ogdWXuG8ZiLEkTxxyATI9Ic3c2KRKkzar8eeD7uW6DGNH8ut5gpST
	hkymAqFSWaKpXeuA4PomDGKX7+htRfllHKf6XVgFKr2KMYQ6Dvxio1MlBMS8iAGNZxQoJxGiP+b
	WRaOcOpMp7LKgrFRzGx1JT/0A=
X-Google-Smtp-Source: AGHT+IE9o7HmOf5ObC/9W+95raGS8ohsqe3ORaS2TYoCUxKKUlMGeQaie8UScWBpVlTa9OdCKWaEtg==
X-Received: by 2002:a17:906:478c:b0:b72:1ced:f213 with SMTP id a640c23a62f3a-b73678f4e72mr21156466b.37.1763057912770;
        Thu, 13 Nov 2025 10:18:32 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b7359bfb238sm118784966b.14.2025.11.13.10.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:18:32 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Tondo <stefano.tondo.ext@siemens.com>,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core 0/2] SPDX 3.0.1 documentation and bugfix
Date: Thu, 13 Nov 2025 19:18:21 +0100
Message-ID: <20251113181828.508075-1-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226269

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


