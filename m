Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76D4C282E5
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:04 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.16545.1741190334896792356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kW1cIikW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223f4c06e9fso16585225ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190334; x=1741795134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kUziBxqrWPXRifdCAAxJvQrG+HZSzP9Jy27ERZ2z2vc=;
        b=kW1cIikWB/+f7WS+HSKNV4gdZCHD8mu8Qw2guHVa9fZ+zQxbxyTrCDOPMO5HJhxBEX
         3RBwPE0/noZ0irrT6Ji19h3R29vo5nzxxHCKzujgGF+qvpe+YrzvUEzNr93yfsRl7A9s
         AOhiNQtpI3nXnC+cGS0iVD8H7Hr3KgzykIU5Ovpp3EfY3ffsGuf+cSJ5HvKm4xIMCYZM
         BZsoR8hCVRLOQxnBWtLD2895eH4Kzc8eegzxPLFG/HM6DqqR6CTHP+8mnZjJfaneTRUI
         vT3LoZ+A/+sOQjbjcuJOEAtKJik9eK+1+UbGRzlD+9uu3gJvhbopnyFIRXzy8a+qPgh4
         v0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190334; x=1741795134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUziBxqrWPXRifdCAAxJvQrG+HZSzP9Jy27ERZ2z2vc=;
        b=eIT2d2/pdDKsSvyLHLUFeKfu3MFUeSyB44EDdCn0QebotURhsLFyTMZmhezsu3ZaXC
         fpndtUUJhv8eYlAGYElPiiV9YFI5n84s+gggTacsvfz/5gWjwsE+R0c/TZMWDYGkHtvv
         mYvbfBarnB+gAXIjgpDZOdSiz2inPNzEQJ44E/Xf6m+g3sGRfIw1T/gO65EhkPkNF7Lb
         EbUYp+ijFRv5Px1ERlOTR+t0cwrauGk4TUTRteN8/VD2TwveDHMDdrmDUVj3XP6JB7tN
         L4wYkw6SEUwAeuVxxkctH/xEKHlmo9bgyc5nIr4EzS3l0OQyHai2BDMJMseSqS2eNrg6
         tdMg==
X-Gm-Message-State: AOJu0YyDWSLFl15PHyjEYG6QA104X7Vq6feEnt91C0jQkqh+EZeROhrn
	vs80bZ7m8hG+6B48RxNgaolJYcINpMXosxvCjW/qV6pfT7Iz51IgrmD1rciQ2G3zBg/mM7WWA2p
	T
X-Gm-Gg: ASbGncva89R6h78G/xL82NfkNFbJbIhvPoLMZd8BsuXYJEPKfycmMpvIqPDPkLsuxOs
	AZfdl3DYLHwqUTZJy4H4WFlqanENcGAMfF3z9z07T28/IittzyKcqAJWFVKyinazKhiW/go5X4k
	6o5pJfLv+PKWR2kwj7m4iF+GheANHDSCvFEG/U5EOMsnqpBAfvqejuKGpMJq8g3PtsREExkoRJ6
	atcutgDwGd8IzF2RFceM9tIGc7D2JwN3w2XSUIeDXnyfv0pS8auaI8pZAp4O/MNMoEzNU3x/46p
	N8bEd1nAXWtUJuQXcxgz11d4BFnWbWWEc/w=
X-Google-Smtp-Source: AGHT+IFPXzBX7VnwCVf3Fx+A5USVD+/GCMbxbSWNQY9WdUFGFLrB/B7PDefbNa9ggBJqiH32Hy7ZgQ==
X-Received: by 2002:a17:903:1986:b0:220:cfb7:56eb with SMTP id d9443c01a7336-223f1e2905cmr52669725ad.26.1741190333808;
        Wed, 05 Mar 2025 07:58:53 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.58.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:58:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/16] Patch review
Date: Wed,  5 Mar 2025 07:58:29 -0800
Message-ID: <cover.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212322

Please review this set of changes for kirkstone and have comments back by
end of day Friday, March 7

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1121

The following changes since commit 8ea258ad9c83be5d9548a796f7dda4ac820fc435:

  elfutils: Fix multiple CVEs (2025-02-28 07:18:33 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Johannes Kauffmann (1):
  mesa: Fix missing GLES3 headers in SDK sysroot

Peter Marko (1):
  libxml2: mark patch as fixing CVE-2025-27113

Vijay Anusuri (14):
  xwayland: Fix CVE-2024-21885
  xwayland: Fix CVE-2024-21886
  xwayland: Fix CVE-2024-31080
  xwayland: Fix CVE-2024-31081
  xwayland: Fix CVE-2024-31083
  xwayland: Fix CVE-2024-9632
  xwayland: Fix CVE-2025-26594
  xwayland: Fix CVE-2025-26595
  xwayland: Fix CVE-2025-26596
  xwayland: Fix CVE-2025-26597
  xwayland: Fix CVE-2025-26598
  xwayland: Fix CVE-2025-26599
  xwayland: Fix CVE-2025-26600
  xwayland: Fix CVE-2025-26601

 ...-child-axis.patch => CVE-2025-27113.patch} |   1 +
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   2 +-
 meta/recipes-graphics/mesa/mesa.inc           |   5 +
 .../xwayland/xwayland/CVE-2024-21885.patch    | 113 +++++++++++++++
 .../xwayland/xwayland/CVE-2024-21886-1.patch  |  74 ++++++++++
 .../xwayland/xwayland/CVE-2024-21886-2.patch  |  57 ++++++++
 .../xwayland/xwayland/CVE-2024-31080.patch    |  49 +++++++
 .../xwayland/xwayland/CVE-2024-31081.patch    |  47 +++++++
 .../xwayland/CVE-2024-31083-0001.patch        | 118 ++++++++++++++++
 .../xwayland/CVE-2024-31083-0002.patch        |  77 ++++++++++
 .../xwayland/xwayland/CVE-2024-9632.patch     |  59 ++++++++
 .../xwayland/xwayland/CVE-2025-26594-1.patch  |  54 +++++++
 .../xwayland/xwayland/CVE-2025-26594-2.patch  |  51 +++++++
 .../xwayland/xwayland/CVE-2025-26595.patch    |  65 +++++++++
 .../xwayland/xwayland/CVE-2025-26596.patch    |  49 +++++++
 .../xwayland/xwayland/CVE-2025-26597.patch    |  46 ++++++
 .../xwayland/xwayland/CVE-2025-26598.patch    | 120 ++++++++++++++++
 .../xwayland/xwayland/CVE-2025-26599-1.patch  |  66 +++++++++
 .../xwayland/xwayland/CVE-2025-26599-2.patch  | 129 +++++++++++++++++
 .../xwayland/xwayland/CVE-2025-26600.patch    |  68 +++++++++
 .../xwayland/xwayland/CVE-2025-26601-1.patch  |  71 ++++++++++
 .../xwayland/xwayland/CVE-2025-26601-2.patch  |  85 +++++++++++
 .../xwayland/xwayland/CVE-2025-26601-3.patch  |  52 +++++++
 .../xwayland/xwayland/CVE-2025-26601-4.patch  | 132 ++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  21 +++
 25 files changed, 1610 insertions(+), 1 deletion(-)
 rename meta/recipes-core/libxml/libxml2/{0001-pattern-Fix-compilation-of-explicit-child-axis.patch => CVE-2025-27113.patch} (98%)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-21885.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-21886-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-21886-2.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-31080.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-31081.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-31083-0001.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-31083-0002.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-9632.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-2.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26596.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26598.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26599-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26599-2.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26600.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-2.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-3.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26601-4.patch

-- 
2.43.0


