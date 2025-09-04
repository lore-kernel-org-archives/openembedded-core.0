Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215A7CA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:22:45 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.918.1756999363015149848
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0+/tqhMP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24af8cd99ddso15605045ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999362; x=1757604162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=z46PpTtfpD8rBuMiCoyYwMSbDHM9q38MqvdmXkW91Zk=;
        b=0+/tqhMPhciecHjotQTFF0ZZ2o34yv6nngYJy1akB0Kenjty99VQEeV3TTiIbZEU05
         aODBqZc7ME/rOayMB5k9mAgdqQ081ZOgnuoP0So+cwyS3x4Eij9EtccGO7qq40BN5cf+
         53KrgUytGdO9v071J8x8V0qhiPvxHsz6873qW1IJGI4YYLjBwKPUZl2cl3q/QpZfEtrC
         +dACXC0N/kyqU8N6G1vNKk4q3ogMWENQrSWoUTW4XMiCcgwhqau5rFaBF3Hra+jl6onb
         ZYXbAo75y6hxTG4Peh2QWF+nw8yQuCCgYeekWWBlJ9xIqn9NOPmPhr0LX8fIgxOgQOGG
         x3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999362; x=1757604162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z46PpTtfpD8rBuMiCoyYwMSbDHM9q38MqvdmXkW91Zk=;
        b=GbAZANGteryeH+VZwHt86FzSLSxyIN/XU7umD/ZnhtDFxHPXhKhfjYQJhpxYiUzp6V
         v5pHYeGDhxkXvNS0hGfdR2F07z6kLLvyPCam0ZFK56D4lGFdO2VVY/qGfcFJvUAfj7h7
         eZsGv7mGmMCRvHQZvr0VELrr789VHlDFwuEhtnGYe8rxZg86h1svNRoOyApNfOMnNY7o
         mSnyhO9GZgF1dBugEnTRfYpf9vEFi17AKMUh+LejtD6XgXlGM7MBppuMQUXw+jCqb2zX
         6Pj6GpD279VXa0IXMI4m5BW+7JWJxrT/ieVKvn1lqTKKZm2XYI6nZYojaL5UVkJ6vAbJ
         5LVQ==
X-Gm-Message-State: AOJu0YzehB5iuJSebCA1OCkMUKrt68zrdFtCaai+RJVt3tq5868AmbbP
	Va/WtuBQPWhl1C02SrTMMAtdnFSm4LlrKg6XHXF9wmp4yTYxxVPrjXhNGJfEgpZawuSH7kuofDS
	T16v9
X-Gm-Gg: ASbGncubPt9fE4XixPBnYsqwoo0obV4xTjSgcmbGyIxmTRnYa6oVbCGR6WwyQu/wCmi
	gixXhZOcuSnGj8eb3VyR16eA2tSS7k9i/q7fyp4RnyGtybMl3H2PW7BBKkHh3aj7gxk07sMHbd7
	mDrX1TuWnjXh8s9HBA3d6MXuRdo2O4XcLAz5z5knyNI+WeTsmmEXa1GAyTE5X57NrfzaYrZMO35
	GIeFnw8GgJHvQ+7jzorRWKMbQEqtu0dvuINAhQyPLqM4f5swyuMFOIB+N9SV3KewT4uCXmVA4ya
	szhteI8huY9JVxrUwT69vW6Ws890bsGz8KaX7mL1VdU/FXokRfy9Xh9hLAgqgf7N10DslnQJEhG
	qmpAQq5mMY2GxhFnI6J1ENTU8oPeP7No+1LA=
X-Google-Smtp-Source: AGHT+IFOrRFTlShwRWP7vmAO6Ob3/vHlUZr1BxtFnbnEO+q+8iRLnE43IOZeNiUmuPI3jK5OTe3cDw==
X-Received: by 2002:a17:903:f8d:b0:246:255a:1913 with SMTP id d9443c01a7336-24944b29d4fmr251830875ad.39.1756999362110;
        Thu, 04 Sep 2025 08:22:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b11448a5asm82528085ad.54.2025.09.04.08.22.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:22:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/5] Patch review
Date: Thu,  4 Sep 2025 08:22:32 -0700
Message-ID: <cover.1756999195.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222955

Please review this set of changes for scarthgap and have comments back by
end of day Monday, September 9

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2314

The following changes since commit a19afb7db1b9995ce433f8bfeb5406c9fd1fdc19:

  sudo: remove devtool FIXME comment (2025-08-27 10:17:41 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Deepak Rathore (1):
  default-distrovars.inc: Fix CONNECTIVITY_CHECK_URIS redirect issue

Hongxu Jia (1):
  rpm: keep leading `/' from sed operation

Kyungjik Min (1):
  pulseaudio: Add audio group explicitly

Stanislav Vovk (1):
  libpam: fix CVE-2024-10963

Vrushti Dabhi (1):
  curl: update CVE_STATUS for CVE-2025-5025

 meta-selftest/files/static-group              |   1 +
 .../distro/include/default-distrovars.inc     |   2 +-
 meta/lib/oeqa/sdk/buildtools-cases/https.py   |   4 +-
 meta/recipes-devtools/rpm/rpm_4.19.1.1.bb     |   6 +-
 .../pam/libpam/CVE-2024-10963.patch           | 265 ++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |   1 +
 .../pulseaudio/pulseaudio.inc                 |   2 +-
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +-
 8 files changed, 275 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10963.patch

-- 
2.43.0


