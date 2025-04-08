Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9932C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:51:16 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.6946.1744145475150405291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Zw4lF1Ei;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227b828de00so60401895ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744145474; x=1744750274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LLBYiL5q6Sn0d7e23DnfXZqMcdHQkIDUJLuLI3r9iew=;
        b=Zw4lF1Ei9e+pjMWBO45r8IequMq6Un2vCV9WEvRBmLpdvQpsaz1PQG0qvHvdBziVhW
         /zo65ItWjfMlTGdcuUYkqCdISXj14xYGh7Z0GQ6sLEkxk/T7Bebg+1OxKyPh3q4vvaVb
         yE1KUka/+OHJzGcQeG27JuWuKyODYehqfsZAHAkZRR4EIxf3rTJLoZbmOSa/m2m7dwwE
         /94mHsh+Tq2aHV61Udb4pEn/eo1oPwvTMxNxtGfTdiB6beS2yV9P8DR7PAZlRY7XKT+P
         yjJapaNhhaUZe2y18vZUBd025V8ZisIS5bLfIlJaNBWTlO54vBsgRlOwWbgn+5vcGFhP
         k2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145474; x=1744750274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLBYiL5q6Sn0d7e23DnfXZqMcdHQkIDUJLuLI3r9iew=;
        b=DJ1t0XmZOa8rpxtICNNuMf73asIYQArwN2klesgs8tfb7+TtiO0kt9hpvx6knEyvIM
         pXidmgDWfyeeI9yLSQlsveJc6JfnSEXcQ9Q+M6MkuCXRg/3+Fpg8y2PsGGv7ZqSD91Bl
         MF5PrFxeIQpE4wLQI+NLcVd9Ce4n21voafojJD06tz4qtMW/Txae+JEv1Lf7VVs6qo6k
         wqxnpdv/oJAIsWOY392mLVa4U5X679yVDn8c+p8VjJHSzDWXeoymIV51rNr6R8vLgnWv
         oDXY396ijL5QCC4R5auLopgooRb4GfAIYhLJgNB5vdpl/wtpcj1rixeopcPWaWvRpLx1
         ArGA==
X-Gm-Message-State: AOJu0Yz/HqxtUK3m6Hk4seYZGXhXonsHFIrGyMXMSGmh+TDikQ7o7QNY
	qbojTM+6ti5G3TuoXrVDd2fi0DeM2JxamSA1LsiRufEjRLyyLfIjB4hkrLDT60VGZDLWZPuVWdl
	C
X-Gm-Gg: ASbGnct6E1D+UF5+taSfiX9VRViLAXKUXUskymRqU4t8uD61WHAY7za6a3XbGZ8fjWB
	E02Q5PA/rbNvdElld0+T1hYSfZNNYeRlO4kpkR08Gl7y1icgyzR1hDxHgy50p73Xjr0hnuNl6EK
	JbcwY4O+Z7xOXvnu2tBdFQyz0rWVS7cntDSVzkz4+N7PjmbJr2k5qcN04dTJNDcX4u6S3KzSPQ1
	Q9ib/0j00wkpJzsmnO1Yo1hsffzBwaMPemhv2YRDRGjoMhsiNF75Bh+Ll/5Ddvgqq+1ugHGsij5
	9gJvCD5zsiK2eSrhVKsWpLzXqBmvXmQ0lOKNzQfecnX8NTc=
X-Google-Smtp-Source: AGHT+IHCcRYXPjxgrYnHWiAJbnUu5RZIjBFokkEW/VvR65f3ZASscM5soFHKoSut1+gPTumFJuYdVA==
X-Received: by 2002:a17:902:f644:b0:224:c46:d167 with SMTP id d9443c01a7336-22ac29a7d25mr9601625ad.16.1744145474092;
        Tue, 08 Apr 2025 13:51:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:70d0:2b27:66e1:8cba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm105497755ad.164.2025.04.08.13.51.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:51:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] Patch review
Date: Tue,  8 Apr 2025 13:50:56 -0700
Message-ID: <cover.1744145328.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214555

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, April 10

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1367

The following changes since commit 1efbe1004bc82e7c14c1e8bd4ce644f5015c3346:

  build-appliance-image: Update to kirkstone head revision (2025-04-04 08:43:24 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Haixiao Yan (1):
  glibc: Add single-threaded fast path to rand()

Peter Marko (2):
  ofono: patch CVE-2024-7537
  qemu: ignore CVE-2023-1386

Vijay Anusuri (6):
  ghostscript: Fix CVE-2025-27830
  ghostscript: Fix CVE-2025-27831
  ghostscript: Fix CVE-2025-27832
  ghostscript: Fix CVE-2025-27834
  ghostscript: Fix CVE-2025-27835
  ghostscript: Fix CVE-2025-27836

Yogita Urade (1):
  curl: ignore CVE-2025-0725

 .../ofono/ofono/CVE-2024-7537.patch           | 59 +++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 ...dd-single-threaded-fast-path-to-rand.patch | 47 +++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 meta/recipes-devtools/qemu/qemu.inc           |  3 +
 .../ghostscript/CVE-2025-27830.patch          | 79 +++++++++++++++++
 .../ghostscript/CVE-2025-27831-pre1.patch     | 50 +++++++++++
 .../ghostscript/CVE-2025-27831.patch          | 84 +++++++++++++++++++
 .../ghostscript/CVE-2025-27832.patch          | 45 ++++++++++
 .../ghostscript/CVE-2025-27834.patch          | 57 +++++++++++++
 .../ghostscript/CVE-2025-27835.patch          | 34 ++++++++
 .../ghostscript/CVE-2025-27836-1.patch        | 64 ++++++++++++++
 .../ghostscript/CVE-2025-27836-2.patch        | 46 ++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  8 ++
 meta/recipes-support/curl/curl_7.82.0.bb      |  2 +
 15 files changed, 580 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27830.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27831-pre1.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27831.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27832.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27834.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27835.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27836-1.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27836-2.patch

-- 
2.43.0


