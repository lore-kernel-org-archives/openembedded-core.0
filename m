Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83666C54ED0
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:59:32 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.1097.1747839567229288478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LDAnr64Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af523f4511fso5322761a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747839566; x=1748444366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nP/g801ItYSzwGvFfmamO2zOIVsfCFDawfxV6l7jgE8=;
        b=LDAnr64QrwRzaIhIFwnTbS+VJ8F2GwuNAPcImsJb7AXPzYILY8v8EUGstncnGmV4m0
         wL0BT05Vv9HMtbcNKjJe9yL18TKrZtENuJkgsZ4wJ8VbthUSF0u74RvPQDnTy+LTAlsj
         /AWD9A7n5z8NG5b5Ei+u/CEeWF8VbAHFkaAOwp0TOJJk6X/uMkHIGfvs3uSy4KylNc42
         7smtB7pgctbV/PwAxEArusx5GfQa9dVe0nompfHanY8gl/pipmWQubJAS/sOfxcMCULC
         sIzhdwaxB/j9gkJD/9cpn4D5n1rzEHzSDDCZYcOnb/M2YMMVCoI5hhKUeQnCNB7yH0Kb
         0AlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839566; x=1748444366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nP/g801ItYSzwGvFfmamO2zOIVsfCFDawfxV6l7jgE8=;
        b=iirJ4ckNdjvXsuX5tS5CCb7qaRBs9jfIMnwGWYnc60SltWxYVzAWG1xgCr48c1+rld
         BWbphkzIAWWGYlfzLIWhvmFEUlTTOVrFIT7wSjjZbBjM0XH8JwcO895Rbt/GCGtpaK0y
         8xz9Ikh+9eKvS/R4aCD13EU1exMk0Q5K+box4EfuWRj5DPUiAO8lMZWN+k6YvlhoHUwb
         2aLnXNmWpZwXLOt5JBP4+O9soGLYtUP50U+nlIzL4eDKcOzz8oZa37ItfPwr4auD26OF
         nMgJA+4T1oAFDIbx3N7vphi+pQxXv5j7/GU0/7bysZ1oSQmZ2OyrSBP4F2axmKm8aqbH
         PUqg==
X-Gm-Message-State: AOJu0Yxa6L8vrPyskjigwPUDFlOYDz28pNyRhq13jBH8ZjMAul9y43zL
	mAcVfLfgJ1mADNKyhtSl3KU2z7tXT2Fq4TvuTsGEQcdkyHj/KWByNlqMRqo1jRqGdHpNaguKaX8
	ETy3r
X-Gm-Gg: ASbGncsJS3yyclLfJsPJ9do4mthSSGunW7bWNdo0dpcAWp7tWfCbnLT5sQhYQ9/hUQH
	jwTgDYq+/XX70klnSqDpk/3HU1htekL5qrl5Kwgl/G3B5NKJbMhkVhWnXl8YJCPpS4fQOnVYH+h
	TBn+C8D2qLXgMz7ZC2WhoZ8rOo1UQIJgipy0ne3aoGMUC6T8+ACGPlZLGA97M3iuWh0j6yyq8Ua
	6j3lOyKPpWBAsc13uBatVp15O89n+RwwWRx+oXt7pm9HG7HBfr1SEeF2iUF8sVK/0fCVazpiSyB
	s0YNisXQUevaV53vdF4aRTZTd+FNrJ7cJqm7dNP7x2E=
X-Google-Smtp-Source: AGHT+IG0J4TF9Q9sS48p2LwiAphddQuTKc+1f9ySH1aNAp8uVdH4zSLDq6jMr92r/Zv2wzkmE2yZDQ==
X-Received: by 2002:a17:903:acb:b0:21d:dfae:300c with SMTP id d9443c01a7336-231d438b4cfmr257961245ad.3.1747839566323;
        Wed, 21 May 2025 07:59:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89d4:3586:e576:3ce4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm94189645ad.53.2025.05.21.07.59.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:59:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/7] Patch review
Date: Wed, 21 May 2025 07:59:13 -0700
Message-ID: <cover.1747839445.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217036

Please review this set of changes for scarthgap and have comments back by
end of day Friday, May 23

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1625

The following changes since commit b214cc84a922f7a3fb7ebbc501189ce25e8bd2bd:

  glibc-y2038-tests: remove glibc-y2038-tests_2.39.bb recipe (2025-05-15 09:42:55 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Ashish Sharma (1):
  libsoup-2.4: Fix CVE-2025-46420

Nguyen Dat Tho (1):
  libatomic-ops: Update GITHUB_BASE_URI

Praveen Kumar (2):
  connman :fix CVE-2025-32366
  glib-2.0: fix CVE-2025-4373

Sunil Dora (1):
  binutils: Fix CVE-2025-1153

Vijay Anusuri (1):
  openssh: Fix for CVE-2025-32728

Vyacheslav Yurkov (1):
  systemd: Password agents shouldn't be optional

 .../connman/connman/CVE-2025-32366.patch      |   41 +
 .../connman/connman_1.42.bb                   |    1 +
 .../openssh/openssh/CVE-2025-32728.patch      |   44 +
 .../openssh/openssh_9.6p1.bb                  |    1 +
 .../glib-2.0/glib-2.0/CVE-2025-4373-01.patch  |  120 +
 .../glib-2.0/glib-2.0/CVE-2025-4373-02.patch  |   29 +
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |    2 +
 meta/recipes-core/systemd/systemd_255.18.bb   |   10 -
 .../binutils/binutils-2.42.inc                |    3 +
 .../binutils/0019-CVE-2025-1153-1.patch       | 3207 ++++++++++++++
 .../binutils/0020-CVE-2025-1153-2.patch       |  840 ++++
 .../binutils/0021-CVE-2025-1153-3.patch       | 3756 +++++++++++++++++
 .../libatomic-ops/libatomic-ops_7.8.2.bb      |    4 +-
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |   60 +
 .../libsoup/libsoup-2.4_2.74.3.bb             |    1 +
 15 files changed, 8107 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-1153-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-1153-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-CVE-2025-1153-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch

-- 
2.43.0


