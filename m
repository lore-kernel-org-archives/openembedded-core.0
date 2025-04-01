Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC0CC36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 22:36:30 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.68.1743546984817844685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 15:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B2luktPN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2255003f4c6so110884255ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 15:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743546984; x=1744151784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/I+APaQ+HNFbqL/8ZSDmUIF5jX8UWmxWs0ORAtJK0Q0=;
        b=B2luktPNunz+lOQ4gVY0wm/GO5ZQCHtveypDE6Snn36F+GZIgf0F00d9q5me/RHFGL
         QBFIpaE/N5RrDr3a5TehKTz3rIUVRNNMYZT/yscRox9mKmCaMWSWFaYAGWMUTwLJpmad
         pQzke6BlYZpiHBcLP64zmXsmJymoM/m6R4FFR80dGcDyVxYAUW2ujJRGyac2l7PTL3rc
         PlQAE5TaBPunF8qWsc66cMbwHZnhPk8c6x5sXk/LwTiSRaVRA0LcZE99E7eN+GqRlJAE
         HYIQNJt0xYdyoysEp1pKXEjNGrPX/VqE4QqMI35Ys+dOzaHS03osVSJ0ZembDXpRRxTG
         jJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743546984; x=1744151784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/I+APaQ+HNFbqL/8ZSDmUIF5jX8UWmxWs0ORAtJK0Q0=;
        b=iY+ZX3+CNKnPdScoNaSKSbwcbUKf82qWq4LQR4jHd6DNIbE3uyTtcN8W/fi3jR9GCE
         VIOD4WYx7M37pCzNHL1rNR0vZW4oVDXEghDxJy+rMe6juoRH/RB+rW50aJ8A2xgAYAZR
         uXOVWNp+9AAtJCAWn7ccotQ0C88A2Kt+as2KW3RGfPHfwSeswmUH2I+FH6ZGVGr8jFGw
         9XhE16k42Z2oEh08P/+OIen3XkqdfPBlY4bZC8AHqnQNtdqi5ybwuQMzXYQbejKZzYu8
         16cCrWogYaniPAdCfdxHVRiXxT3wCJ7baEuxdhVYInlXImNcwYrbFy01D73R/XxZStzW
         2v7Q==
X-Gm-Message-State: AOJu0YwDTpbQal2g+SPWyt5q2ipUClxVZrIT6ZSadEhQfplc73EMSTxy
	du+2YZ6p1NjBqiUSzptnryh5nHgZvZyXR3D8A8CooIxE6ED/QAtdtj9odKAgH7EhTw7R0dQux9P
	z
X-Gm-Gg: ASbGncvquzJLftKj2hHVz0S+xY3Fr6e8pqqKVdQt8OuGyhC+iGhrsvS8kq4fqBr0lzV
	FZ9TO3eS15AmJNGnk8oqR8ukZyYbh7B5xM6U7gSJWcpfiBpmP32qWZhbFX4vrJgUIV94pFHyoa+
	8cfadUKwrJrsGvhDQ5TScXWduQnu87jF48BJ9zW+LHvgdlcNUdE3ifIedQas810U2T9xKqM1i1T
	Q9l///9CGf102qVJEzplOc2dN/B3f6X8NaSQq28zjM9V9XAKNKWIKQZmjEPSrzedZh1F2IZ4bDI
	hzlB8kqodL+vgk9W2biVK6suy5iHFPPFkS/b
X-Google-Smtp-Source: AGHT+IHiRpy2JgpgHT+nJHlwXhDw24ErV3wPv9IgD4rVpy+lX/byccq5FNsDA/sjah4cLNGN0wpgRg==
X-Received: by 2002:a17:902:f606:b0:224:18b0:86a0 with SMTP id d9443c01a7336-2295c0ec37dmr66950885ad.37.1743546983781;
        Tue, 01 Apr 2025 15:36:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e226a7sm9534241b3a.48.2025.04.01.15.36.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:36:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Tue,  1 Apr 2025 15:36:07 -0700
Message-ID: <cover.1743546795.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 22:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214152

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, April 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1311

The following changes since commit 453c5c8d9031be2b3a25e2a04e0f5f6325ef7298:

  cve-update-nvd2-native: handle missing vulnStatus (2025-03-31 09:13:54 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Deepesh Varatharajan (1):
  llvm : Fix CVE-2024-0151

Divya Chellam (1):
  zlib: fix CVE-2014-9485

Guocai He (1):
  mesa: Update SRC_URI

Haixiao Yan (1):
  glibc: Add single-threaded fast path to rand()

Michael Halstead (1):
  yocto-uninative: Update to 4.7 for glibc 2.41

Peter Marko (3):
  libarchive: ignore CVE-2025-1632
  perl: ignore CVE-2023-47038
  freetype: patch CVE-2025-27363

 meta/conf/distro/include/yocto-uninative.inc  |   10 +-
 ...dd-single-threaded-fast-path-to-rand.patch |   47 +
 meta/recipes-core/glibc/glibc_2.35.bb         |    1 +
 .../zlib/zlib/CVE-2014-9485.patch             |   64 +
 meta/recipes-core/zlib/zlib_1.2.11.bb         |    1 +
 .../llvm/llvm/CVE-2024-0151.patch             | 1087 +++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |    1 +
 meta/recipes-devtools/perl/perl_5.34.3.bb     |    2 +
 .../libarchive/libarchive_3.6.2.bb            |    2 +
 .../freetype/freetype/CVE-2025-27363.patch    |   44 +
 .../freetype/freetype_2.11.1.bb               |    1 +
 .../recipes-graphics/mesa/mesa-demos_8.4.0.bb |    2 +-
 meta/recipes-graphics/mesa/mesa.inc           |    2 +-
 13 files changed, 1257 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2014-9485.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/CVE-2024-0151.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch

-- 
2.43.0


