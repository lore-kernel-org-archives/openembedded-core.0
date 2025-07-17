Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEF0C83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 21:16:47 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.6572.1752787001843367641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 14:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lm/Q/K93;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1504781b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 14:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752787001; x=1753391801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7MalKWu771xLRzXABtqvaD6T5EpwxPGxIBgwJ6nHVuk=;
        b=lm/Q/K93au7oLeTPtU8/IkEH6Zj3LJ1NKs1bt9ZTJaP1BiEV25J7MQfuFb2Sz1c5z+
         /ruRQDR2L4VZZAKvFe17+IaZx8xdb5MRI6fgz0bIe4URu96Q1tmxyPBRHSk/MBqQvBzV
         7Vhb6qAHUGQDWwplSWpIYKqK/lr3TncorsT4YIyvjVNWGzOTHkLyM+SybUukv22/tosB
         bSIeU9kBWIaYZzRnfG2fkiKyptrsSmxprycai7+9eyFhbWmmxDUmEv1+5fVqi+rCdp7P
         h1O1OazN/3/7POTKDTUFCcxl9OwQrmlSm0/4pfs89irRV1zXGA/wn3dskArf3Qh6OPvw
         j2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752787001; x=1753391801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MalKWu771xLRzXABtqvaD6T5EpwxPGxIBgwJ6nHVuk=;
        b=tFQlWidsrCdKL54cgV1/KVmbZ0sAz2vnEOAjVLsefBtD1hxwO/JOWgS4gHg1qAbDA9
         SBttKlsL6R7TQDOsEbbWuvh667KA6MbrNS6XOXs53i3jSaHdidnCcMXv440NZQX9a9Jp
         iOWh1CKPevUIugmwrpYD5XG26mUzhS3T81Qf/07zMlhopapXA4yPkntxvPQzITvRcWI0
         KZUe+laoqWNZFs+FlnD8ZzQCfLY7NEBPUAanWw3ycdVOxiQfVLAfuNgZb3AvakOVSvUz
         PbbD5X53ajkXj6XVkdWHOeTNMWLZP0EJFRHWpjUtRDMKg2+ZTbw929rhYH//Gc+Zkz+n
         CMXw==
X-Gm-Message-State: AOJu0YyJuomTR065B5DzqI6ZDgMFX9UTkvA8j3QWphQAgmfG7KRK1sIQ
	gC+crwHvRZgAKv+tqCcup7MnzAJMU7JGjwzJUid782g52JdhUWhYBilZUjxAwKml
X-Gm-Gg: ASbGncv85I7+3jr/tn82No30+sJzxpF53J/KtobwASjjHs2UEWsmFaTJg+YzH0Lk3Hv
	9Vq6Uw/ZKQevp5fBbXVY1VvULxpaIF8pbYJGQCwMqF8unwqAtnW0PHnBdwZHAWP/D95Va6OpuPF
	lFtyb3lMSysCNjh4JFo/tGwGUMrnkVccyScBc516o5hXCBMv6nn4gfqCPLjIzwfeItq/wEIWGcv
	I3NJRsnTlDdZJhKlpmAsfSeHxhS7houHRaYg5PQPI9BxEW0RhAFmg2focLFQLHf2U8SFiWpQ1CL
	ZOmfmkwAYXq4ACZ1ZuYXSKcOJediErT53VEa7/+huTqAPteepvAF/xsXD/5PvShankbMJ0qdeII
	oUs6zQU/ufhqWfwJ85emce76wD+KNo17QV8OkPw==
X-Google-Smtp-Source: AGHT+IGAU4v/LTUscxPXCZFEingq2hTcRzLwiLV7N+Gzazcty9SgfwhdO7BvfX5i3m7J7BYWWIgfJg==
X-Received: by 2002:a05:6a21:b94:b0:224:654a:4461 with SMTP id adf61e73a8af0-237d896b51dmr12361209637.41.1752787000755;
        Thu, 17 Jul 2025 14:16:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ffb69b8sm97678a12.71.2025.07.17.14.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 14:16:40 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2 0/2] systemd: drop libmount dependency and add blkid and fdisk PACKAGECONFIGs
Date: Thu, 17 Jul 2025 18:16:19 -0300
Message-Id: <20250717211621.7122-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 21:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220563

From: Hiago De Franco <hiago.franco@toradex.com>

The libmount dependency in systemd was made optional upstream [2]. This
series backports that change, allowing us to drop util-linux as a build
dependency for systemd. This resolves a circular dependency between
util-linux and systemd when systemd PACKAGECONFIG is enabled in
util-linux. Without this fix, each recipe depends on the other,
triggering the circular dependency error.

Note that this alone does not fully resolve the circular dependency
on util-linux-fstrim/uuid. There is another one:

glib-2.0 -> util-linux -> systemd -> shared-mime-info -> glib-2.0

But the libmount PACKAGECONFIG can be removed from glib-2.0 to break its
dependency on util-linux.

In addition, according to systemd's README [2], the dependencies on
libblkid and libfdisk from util-linux are optional, so add them as new
PACKAGECONFIGs.

[1] https://github.com/systemd/systemd/commit/d1ee3889cf8e8a9edc82e41d306155fb4c531c8f
[2] https://github.com/systemd/systemd/blob/main/README#L216

v2:
- commit description updated on both patches.
- blkid set as default PACKAGECONFIG to fix an error where bootctl is
  not built anymore. See
  https://lore.kernel.org/all/DBE8J299IF7K.22KVHVSAEHE8@bootlin.com/

v1:
- https://lore.kernel.org/all/20250716232931.127811-1-hiagofranco@gmail.com/

Hiago De Franco (2):
  systemd: drop build dependency on util-linux
  systemd: add libblkid and libfdisk PACKAGECONFIG options

 .../0001-meson-Add-libmount-feature.patch     | 58 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_257.6.bb    | 10 +++-
 2 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch

-- 
2.39.5


