Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A22C021AF
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:15:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.7315.1739913333506180621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:15:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n6ytzMeh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220c92c857aso3810665ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913333; x=1740518133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=plCPEj2b+BmuPIvbwLjFYaMDWdXKlWIPlU3jFTEHLRw=;
        b=n6ytzMeheMP+VbFSry+c/9hG+XFdDwJKFmQhRviiRcOgBum1pTFiQv0s4Eb8N08CEK
         OpFfzemApuGUHfuhyBQfxv0J9QerNRI2FD1MXTMGOi2sKpZfehjx7Z6Ihi15oSI72zFm
         z6W2ZGgjMhDSDqsH/3G8IHkO3sdIHjPuGzM/6BSMEhvVENzPRDSE/iFPDVJb2Hr56yit
         oYLhKJxg5VZxqtmt3l+3mk/LyyPdbK05DOFttIyAOXvyT5OtTDXcZwn8Wnny3l0MNArH
         +1BTO54BZS4DfZdZWiUD1shwLiqCK8SoWOtzg+mzMgETGm9NwW/osYZe0Y+ludc33zmY
         UQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913333; x=1740518133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plCPEj2b+BmuPIvbwLjFYaMDWdXKlWIPlU3jFTEHLRw=;
        b=mW2npLAed++aLBueSBfGcZHVR6hyq9lN7uinERxwKvdgy7VKsojuvxK+ALJP2hxHph
         fLCQKqYt06bG9RaUIaF4QfoZXHqwJSJut+lOpGLgTuu3gvdeWcSy15tr7FuRbsLJ4GOt
         Vxg+Ud0pZTMfWXAA68lMW9TCoRAl4edoiZFs0FHDlu5tyIc2kipGrmFyA+W/qEYwk4jD
         D5DeX8U3rLm1fKiMIj2WnssYoxi5jhUdbhgN/K4Km28a5r6osxGQeBMADhCENqzaF1Sc
         I/XBYl3jUrbQxSnrKS9Or0d7AeOu+mkUah6jRe5rKzwwivtsa+Jyfc3yffOIDw3BoQ2m
         xFOA==
X-Gm-Message-State: AOJu0Yyy11EZeQa/CqV8NT1q2agB4W0GzTKPNO8ERTNd1fpCKqmq+SBh
	jX/eZUO3TYqHa8aPeiEVkOnj6uza4zp8kBla1LYNnj8nhgFOrtweSg4SpfmHlpk2/+UXeTFRQdD
	H
X-Gm-Gg: ASbGncsYqYvXiu4BxNZc/j0GDDhydQ3lfDWjmyX6iCe8XNFggix7FeuB5uRSSjypYXu
	KRyS5w71eoHUJeg5PCrjcJP9hn8Wu0yUYdrR/GBr6ONZKXb2ilZnSQH8CdO2A0MTSvvJatZl9fF
	MXRYUNJsVHuLExHbTNj1RcqMSozSH4x9jhTRI2P1Tfv4WNgdzDwZ4a6Wr3mScyan3HYpzu2dlG/
	Z2pZGyGac6Dn2sXyB9VBCsBoQBxGCNHtEABlmRAi3HZ3oRzRg9ACQJuQcuvzQo5W5Fxz6OfYThv
	56rWZww=
X-Google-Smtp-Source: AGHT+IFY7pkj3r6u4DNk3odo0Zu5krHuChB7BD5cGQZ3Wd97Ct5X7vUaNJyHj1mVNsxiQAuGh7/vDg==
X-Received: by 2002:a17:902:ce0f:b0:220:fe36:650c with SMTP id d9443c01a7336-2216f11a1eemr22006665ad.23.1739913332824;
        Tue, 18 Feb 2025 13:15:32 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349056sm93720055ad.22.2025.02.18.13.15.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:15:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/7] Patch review
Date: Tue, 18 Feb 2025 13:15:18 -0800
Message-ID: <cover.1739913090.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211652

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, February 20

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1037

The following changes since commit 61880aac34ff408a8bc5060c6140bfd086b27524:

  base-files: Drop /bin/sh dependency (2025-02-11 05:51:35 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.0.7

Divya Chellam (1):
  vim: Upgrade 9.1.0764 -> 9.1.1043

Johannes Schneider (1):
  ppp: Revert lock path to /var/lock

Oleksandr Hnatiuk (1):
  icu: remove host references in nativesdk to fix reproducibility

Peter Marko (3):
  subversion: ignore CVE-2024-45720
  gnutls: patch CVE-2024-12243
  openssl: upgrade 3.2.3 -> 3.2.4

 ...ke-history-reporting-when-test-fails.patch |   40 +-
 ...1-Configure-do-not-tweak-mips-cflags.patch |    2 +-
 ...sysroot-and-debug-prefix-map-from-co.patch |    4 +-
 .../openssl/openssl/CVE-2024-13176.patch      |  126 --
 .../openssl/openssl/CVE-2024-9143.patch       |  202 ---
 .../{openssl_3.2.3.bb => openssl_3.2.4.bb}    |    4 +-
 ...001-Revert-lock-path-to-var-lock-435.patch |   63 +
 meta/recipes-connectivity/ppp/ppp_2.5.0.bb    |    1 +
 .../subversion/subversion_1.14.3.bb           |    2 +
 .../gnutls/gnutls/CVE-2024-12243.patch        | 1149 +++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |    1 +
 meta/recipes-support/icu/icu_74-2.bb          |   33 +-
 meta/recipes-support/vim/vim.inc              |    4 +-
 scripts/install-buildtools                    |    4 +-
 14 files changed, 1268 insertions(+), 367 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
 delete mode 100755 meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.3.bb => openssl_3.2.4.bb} (98%)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path-to-var-lock-435.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-12243.patch

-- 
2.43.0


