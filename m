Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FABBC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:26 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.6411.1741212684758728202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jcifvG5t;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223fb0f619dso21669595ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212684; x=1741817484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oGjDUJC+vMpE427vSuinqGc4vVQzz33+nvsVcVlpVGQ=;
        b=jcifvG5tGegphvJwiEdKS7WfQboTLP1SY09Zlz2wG2Uh10CisKcBm4pXZdQnSkBRmM
         7kIzuIKO2YKeY0eWkC7qD2p0NNGs66quQAxlKD+7SWbALYs27vKkdE6YiX93v6dxAWyK
         9HPaFRaB0kAxUHNN9C151NhpNp8o4WrYzAktp/9ZOfoV52mNKYrxX3mWa2loerfQIfQb
         aFcQU7pyDeBAvY+PcUNtwEBcbzCJEav4jbDcwZZpCSFzHUmYvNFGhrwZ5t7EX543B808
         e2Cs8Z+p9XR94u6+P2i3DBkjy6aDhfTKOpPZGY3URkbqfo0NQNDROQX487GV1YLedrQM
         8QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212684; x=1741817484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGjDUJC+vMpE427vSuinqGc4vVQzz33+nvsVcVlpVGQ=;
        b=Ymyx/Kdb1umKm3Ff/2mAvSVlwfCqrJnRzk9AqnyO0d8ZgLxpKPfCgkcaCgadapJKmx
         XHw1p+h8ETrBGQTE6/w76zepynxB4j5cSPPkbR+i9BwiNnFaxMDcTBF0yU68m24VujfH
         hm+jhjg5QnsQaguBhu4Y5S4DM4iarvBtfv0jjOGnTWKgwlPmU2gaGeO4103A8qvQ4S4N
         na9HW/YKnQBaJO0lLZq6wMTffKdveG/W0fIA/g/jXMK0CJ0kaPtgIh37Lafrtz+2efSu
         jfsAExYh3uE1F56mMcocf0MdMeyz29Wk0lGdmREhfTt+nhWAF1oBk/1BcJnrmSfznYyA
         nRVQ==
X-Gm-Message-State: AOJu0YzyWov93JpDM501yfMQKyfzjZMZNsURZYw86JU2qXYQbYGT3Xxg
	ABx9zsEn1uazWdyDbfSEe/Cz960nz5ST6T3pa/mm2Zp9CIY7igoR+TZcMo7bTPkpeHhkJ97UEiy
	c
X-Gm-Gg: ASbGncv+o+Co4OXuUcIBBDHJ+jq5+jXjGlGeTlv4WGctu8E6MU+v4beJb7zCYshCqeL
	oIw2I7HHSHU8kxBEGdChUYEeNxbPWH261f1WJQJvWHuOHABay2TxPx5OlS6kHarT7CrVB9mDfND
	vWBAtN8a/6OteLUjABwK2OW7tlblvH9nxU6IRz9xuA6YohBTtLFqlcKyFx57cl82+4uPA5ypxb7
	WF9RTVorqOAjpKBWGiDNet67QRJ7m3BOlX9EX03s52zSuyauskbxsTAJ7bcYAEi2Q7l+i1nr/ov
	hWVMmzXThSaxXPhqgEf/VOkNiSUKaJ40vXA=
X-Google-Smtp-Source: AGHT+IEWQRJznw18vhYjIJ3JxdfI6eRE2vK+hPDlTbiuDTPaLUiCmJoDFpkV8ssxUmQ+PFjphIH50Q==
X-Received: by 2002:a05:6a00:2301:b0:736:5da1:d344 with SMTP id d2e1a72fcca58-73682ce3b31mr6677657b3a.24.1741212683731;
        Wed, 05 Mar 2025 14:11:23 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/16] Patch review
Date: Wed,  5 Mar 2025 14:10:59 -0800
Message-ID: <cover.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212350

Please review this set of changes for scarthgap and have comments back by
end of day Friday, March 7

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1127

The following changes since commit c74a6d6afc52606825e583cae1162e13a5369498:

  ccache.conf: Add include_file_ctime to sloppiness (2025-02-27 12:19:58 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexis Cellier (1):
  systemd: add libpcre2 as RRECOMMENDS if pcre2 is enabled

Archana Polampalli (4):
  ffmpeg: fix CVE-2025-25473
  ffmpeg: fix CVE-2025-25471
  ffmpeg: fix CVE-2025-22921
  ffmpeg: fix CVE-2025-0518

Poonam Jadhav (1):
  curl: ignore CVE-2025-0725

Vijay Anusuri (10):
  openssh: Fix CVE-2025-26466
  xwayland: Fix CVE-2024-9632
  xwayland: Fix CVE-2025-26594
  xwayland: Fix CVE-2025-26595
  xwayland: Fix CVE-2025-26596
  xwayland: Fix CVE-2025-26597
  xwayland: Fix CVE-2025-26598
  xwayland: Fix CVE-2025-26599
  xwayland: Fix CVE-2025-26600
  xwayland: Fix CVE-2025-26601

 .../openssh/openssh/CVE-2025-26466.patch      |  38 +++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 meta/recipes-core/systemd/systemd_255.17.bb   |   2 +-
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
 .../xwayland/xwayland_23.2.5.bb               |  17 ++-
 .../ffmpeg/ffmpeg/CVE-2025-0518.patch         |  34 +++++
 .../ffmpeg/ffmpeg/CVE-2025-22921.patch        |  34 +++++
 .../ffmpeg/ffmpeg/CVE-2025-25471.patch        |  39 ++++++
 .../ffmpeg/ffmpeg/CVE-2025-25473.patch        |  36 +++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |   4 +
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 24 files changed, 1252 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch
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
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch

-- 
2.43.0


