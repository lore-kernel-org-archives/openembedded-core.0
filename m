Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962F9C5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 21:22:16 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.444.1748640134693015954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 14:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cTWjECxl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e331215dbso25695325ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 14:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748640134; x=1749244934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FRB2RCfW1Ag2TZey/Q3pGs2pfyuvggnuf4q/ZS+fjK4=;
        b=cTWjECxl35ezWB6s9/O3sbZfMEa8qB6dou1FillsDybyyIIK7AEDLQ47dMsZl/o9kQ
         qNeKbQJPb9M/tvh+LtLJegF12sS69lGE8aK6MWPqJhe6LXr9gZihI7UMhxTJWvAsMhQ+
         /oJKiMl0ElFiM4pRmKlGDNob90kPUmzuslMuwYAY59INgWXj7oDgjGpP+KuNg4ZLluEv
         o2xZswiXuQ5H1Bi2/nbGF7kWHKfkYJniek7YfebjeU05zGAkbWl9DuBAlIYvk3y2ORUf
         5cC9oLg1TU7Wk9ElfapFLeeJJrJkcel3xVZhUmn45p4LeyA8uCfbaswq8g/xe2+1pDsq
         qNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748640134; x=1749244934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRB2RCfW1Ag2TZey/Q3pGs2pfyuvggnuf4q/ZS+fjK4=;
        b=xQdkVPylf+KK8h1MhE9lGfiHMYc/eSX4glzj3oauNSFg4RKYEeElmpwFd9CYB9GjEW
         nVZ2lG5G2UQUrCYbdcGpNuIuItgjpV2d/iTZMAavDmFKSpxSZZSbe3oyA7Yfke/koqg/
         XpHahyKVKpCxkDMW/Dc02/mu30fP22cXWj9iWymucNrYtqYZIwuskWfcbTcubTUOeTrB
         XvGexhAy6O4RBdjJTd6uoi1zzHmGwrbtQXJY39H7LghZjX06eadVrO487WItrH0iOYQN
         diUhzH2IYhiWeAR8perH2gzFPT5iSU3vf0GFnPLKjf9NaLZWsfLukvlkScNWJTmIw06P
         F5pw==
X-Gm-Message-State: AOJu0YyBSjEcfBn/EjTtCiWyiRTxyqzgH1JQaSisaU5wBvEm/eiIMoj3
	8D2MRMej0h+JyvoHgAGtBJFRsXN2kORaWqgN3sf5CXyWfjNXXg5tOdGmi4gMvGXhrSVcOdtO21S
	u1ktc
X-Gm-Gg: ASbGncvPMEBUjMG6SrPagaDYOZBQchx9upzglzW/fjqAnWGAjfnFkfEAfvP+f0+NHb6
	lHDALv6jkZ0/vckPV4favo0D7aLdO+HTUv31SCEJFX90BM4craPH+nwZFrOiJEs1/M6ys2P1sB8
	3kSvY3NdANoz0kBBz4NY0/uyh9MXu6BFJSNhnUitb/M8/AVDeptv0iJxwq7BetXZjwqxBYapSgU
	p7sCxLwQlWti0Wxf5ha6a1ErI45+9BCB9CTqWVb9Q71+n9l00w1UeoNRV2zi0quxFQw/psqd1KF
	hJ73AZoXZ0QeH1Ji7D+pHz/RdjdjVot8U/UuhDFmEnjxzoi7Qje93g==
X-Google-Smtp-Source: AGHT+IGxuTo7sINncSGYIdNgaAWuCKewZi/ZVH6QBF/gYSWvs8maeChrXGl3b9Z3lN4cIlE6jzP7uQ==
X-Received: by 2002:a17:903:2f81:b0:235:278c:7d06 with SMTP id d9443c01a7336-2352b02548bmr68906995ad.8.1748640133524;
        Fri, 30 May 2025 14:22:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be2622sm32621815ad.102.2025.05.30.14.22.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:22:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/14] Patch review
Date: Fri, 30 May 2025 14:21:50 -0700
Message-ID: <cover.1748639952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 21:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217538

Please review this set of changes for scarthgap and have comments back by
end of day Wednesday, June 4

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1695

The following changes since commit 56431a98ac661eaa42803e83a9ede6eae0b72b67:

  u-boot: ensure keys are generated before assembling U-Boot FIT image (2025-05-27 09:47:09 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Ashish Sharma (1):
  screen: patch CVE-2025-46805

Bruce Ashfield (8):
  linux-yocto/6.6: update to v6.6.85
  linux-yocto/6.6: fix beaglebone ethernet
  linux-yocto/6.6: update to v6.6.86
  linux-yocto/6.6: update to v6.6.87
  linux-yocto/6.6: update to v6.6.88
  linux-yocto/6.6: update to v6.6.89
  linux-yocto/6.6: update to v6.6.91
  linux-yocto/6.6: update to v6.6.92

Hitendra Prajapati (2):
  libsoup-3.4.4: Fix CVE-2025-4969
  libsoup-2.4: Fix CVE-2025-4969

NeilBrown (1):
  nfs-utils: don't use signals to shut down nfs server.

Richard Purdie (1):
  sstatetests: Switch to new CDN

Wang Mingyu (1):
  ghostscript: upgrade 10.05.0 -> 10.05.1

 meta/lib/oeqa/selftest/cases/sstatetests.py   |   2 +-
 .../nfs-utils/nfs-utils/nfsserver             |  28 +----
 ...ript_10.05.0.bb => ghostscript_10.05.1.bb} |   2 +-
 .../screen/screen/CVE-2025-46805.patch        | 101 ++++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.1.bb  |   1 +
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 ++---
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  76 +++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 .../libsoup/libsoup-3.4.4/CVE-2025-4969.patch |  76 +++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 12 files changed, 282 insertions(+), 46 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.05.0.bb => ghostscript_10.05.1.bb} (97%)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46805.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch

-- 
2.43.0


