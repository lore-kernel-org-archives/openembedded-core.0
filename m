Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE402C3DA7F
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:31 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.43720.1721740403735843644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0ob3ltQM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cb674b48ccso2741098a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740403; x=1722345203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMYnp642FPyxNrzHu1Bcz3kUoAmjvEmYRkfBAcBLfqE=;
        b=0ob3ltQMXkfFGZAkSf+hVDa4LNkl/lDPebHQ1Qt6mygnVNGK264ezsp8/PuCHbgo3Z
         mDSIkLN6Isu5KGSvQVI2fWpwsFW/Q8LdOpCT7DA3hycBsMrVk5E6UTRGsfAZfBvbjxFN
         tiFvBxvYSNe98AdfFDJXvFDKuUVPywUCv5kU8IJ6FBGuW7Dczjsv3+FhAW6EzWS/JT5J
         jOSISOu7hUlTEsf39Ld3U4AX7h9p/4L/jVrmaRlo0wq5cLOB4lfjY0ZusvyYcB/V+vXh
         rKsJQ0lybewAFM1EH8wSVHsjvGq2yHS0vT0k0wYda7U7nHVfltE5wpxCqusoiBd14QnA
         eVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740403; x=1722345203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMYnp642FPyxNrzHu1Bcz3kUoAmjvEmYRkfBAcBLfqE=;
        b=c+OKasDC5e1bk10+hFFBpBEe7YWNbwNR7UX3q18+d/u2bCxB8xavcnMsORVBkf9CoM
         oOZV7NJ/ly8oerLQWP6uOQic3phiDA7tWIFd2ukrG80uuCDgUsCxzcy6PIUqDk4Y43Yf
         kLQqeQE/COTHLxnE3sGxwEpxkwADoKhLsQ9Zf+lWLFXNKd9G49jM9kmFVvuV90wiJRnO
         08UBaGI7Q6X+GHkNa+miR4x8S0uzWnyz1LDGdcQl/TeykL3GRUALQTfmAgtBlFIQMQzu
         qSylZM0CUsgy+0AX83SQAMisY7uwEANuejSCCccYvwKdrxExgw0fnP2IvT1kEP4l7h+H
         T78A==
X-Gm-Message-State: AOJu0YzgF5h/YI4GxOdHWSvfPigZUIemhWkID5Y9daOtp8wBSJGq6EH4
	Z92gWwEejnXBsVTL1o2oWHiZl7SHso9mUNsfWft9Pt0tfMdPOa0HrS7VQ8LSSlgVF70sCPjCkkY
	3yUA=
X-Google-Smtp-Source: AGHT+IHjhGsjB+E5TTZuSpZEn7iXfLxr8iDNcmxvo4rqQYWc1gT2OnHuqVMCQaJL2PmNQEV8tB0Kdw==
X-Received: by 2002:a17:90b:3e87:b0:2c4:dfa6:df00 with SMTP id 98e67ed59e1d1-2cd15e8e0a3mr7461466a91.8.1721740402671;
        Tue, 23 Jul 2024 06:13:22 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/17] Patch review
Date: Tue, 23 Jul 2024 06:12:59 -0700
Message-Id: <cover.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202345

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, July 25

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7169

The following changes since commit 6cd503c5e84bf8090b840c69c7569ae1a46528d0:

  pixman: fixing inline failure with -Og (2024-07-17 07:20:02 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (2):
  xserver-xorg: upgrade 21.1.12 -> 21.1.13
  mobile-broadband-provider-info: upgrade 20230416 -> 20240407

Chen Qi (1):
  libnl: change HOMEPAGE

Deepthi Hemraj (1):
  glibc: stable 2.39 branch updates

Emil Kronborg (3):
  insane.bbclass: remove skipping of cross-compiled packages
  insane.bbclass: fix HOST_ variable names
  insane.bbclass: remove leftover variables and comment

Etienne Cordonnier (1):
  oeqa/runtime: fix regression in minidebuginfo test

Khem Raj (1):
  systemd.bbclass: Clarify error message

Markus Volk (1):
  libadwaita: update 1.5.0 -> 1.5.1

Quentin Schulz (1):
  mmc-utils: fix URL

Richard Purdie (2):
  pseudo: Update to pull in python 3.12+ fix
  layer.conf: Add os-release to SIGGEN_EXCLUDERECIPES_ABISAFE

Simone Weiß (2):
  tzdata: Add tzdata.zi to tzdata-core package
  sanity: Check if tar is gnutar

Wang Mingyu (2):
  mesa: upgrade 24.0.5 -> 24.0.7
  wireless-regdb: upgrade 2024.01.23 -> 2024.05.08

 meta/classes-global/insane.bbclass            | 21 ++++++-------------
 meta/classes-global/sanity.bbclass            |  3 +++
 meta/classes-recipe/systemd.bbclass           |  2 +-
 meta/conf/layer.conf                          |  1 +
 meta/lib/oeqa/runtime/cases/systemd.py        |  3 ++-
 .../mobile-broadband-provider-info_git.bb     |  6 +++---
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |  4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
 meta/recipes-extended/timezone/tzdata.bb      |  3 +++
 ...ibadwaita_1.5.0.bb => libadwaita_1.5.1.bb} |  3 +--
 .../{mesa-gl_24.0.5.bb => mesa-gl_24.0.7.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  2 +-
 .../mesa/{mesa_24.0.5.bb => mesa_24.0.7.bb}   |  0
 ...-duplicate-definitions-of-IOPortBase.patch |  3 +--
 ...-Intel-ddx-only-for-pre-gen4-hardwar.patch |  9 +++-----
 ...org_21.1.12.bb => xserver-xorg_21.1.13.bb} |  2 +-
 ....01.23.bb => wireless-regdb_2024.05.08.bb} |  2 +-
 meta/recipes-support/libnl/libnl_3.9.0.bb     |  2 +-
 19 files changed, 32 insertions(+), 38 deletions(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.5.0.bb => libadwaita_1.5.1.bb} (88%)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.5.bb => mesa-gl_24.0.7.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.5.bb => mesa_24.0.7.bb} (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.12.bb => xserver-xorg_21.1.13.bb} (92%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.01.23.bb => wireless-regdb_2024.05.08.bb} (94%)

-- 
2.34.1


