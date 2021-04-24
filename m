Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.333.1619279802507528040
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 08:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LBIGzd6a;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso2759548pjg.2
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 08:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdHOP8yKdC0k0/mR7+oEMw1r59j8sdG17V5lFddBmUw=;
        b=LBIGzd6apTbUm3fJaP8w6vD9/oZc4IDNBDfY8B+OeoQPsb6IZiNvueaL7vpSpaPWR3
         3HXVirbDQmFFSmJtU8i0/KFMLW5WnYPWjl03FjFguy5UbTyNVA0gBYwHiczuAyzjhON2
         EAt8EpG4RmDacO1q6j+cw32xegLNTiiPlc7k4VCri6dm/hdh/OUbhg0aMdQQ/fRiQsne
         ZkRU4GxgBcREm9dj9U7kb/rfXj3hBCs0lYqdXWYDUn+9NIJVE5yeZOVUtkAUWnxkLqqM
         gS9e4rkbR5F0AkXkLbYHyqu5bqvgGnnh0PCqAMGpVDR7yVRqp6ffLxgasPTavTe+1s4N
         SbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdHOP8yKdC0k0/mR7+oEMw1r59j8sdG17V5lFddBmUw=;
        b=S8WSj5AsyFfAYxl0G28f0gG9JENt9QL28cAborH4sqMbJMJkXc0UHFTIxmv2f6/qLP
         DZ1QF1NRzpyXgtsl1qvqwWm2sJwj5hh2OSqsI9I9lhzv9/7oydiM2qOeE24a+s5LNfQb
         78co12Hed8aUmKgHBxrAZmM6qR2LY+WE1kg3UjnUFIOM+f+irmi5WOaeR5/KzPPk9YSO
         AerEo4on0betzHOYHB9MZM4inM3S3MPiIrn2zdXYlu6Ga+bfabNRMjxsDfBVptAE7VyT
         l0X8O3pnGvcp11NoAydcUbjx0BWvrNc1T1mt6ZudQk7+XGHZyFSluU29iA8amXJVhQhO
         hxig==
X-Gm-Message-State: AOAM533Q8gQvpbqv1julKFvJEMwHx5RIVY1BTvjoV51NndvL1btYew0Z
	z46k1MxtUhv071Gm3k6VEBLJLEwBir5DXg==
X-Google-Smtp-Source: ABdhPJwTs3XVt72adJFM3NBwm3gBIyKfYWamxWV/5ehg15yvTfDMGQS4PxNv5+eUWVgQlSQVhYe1Ew==
X-Received: by 2002:a17:902:9a84:b029:ec:7fd5:193e with SMTP id w4-20020a1709029a84b02900ec7fd5193emr9373248plp.62.1619279801784;
        Sat, 24 Apr 2021 08:56:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id a20sm7198299pfi.138.2021.04.24.08.56.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 08:56:41 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] Add libseccomp
Date: Sat, 24 Apr 2021 15:56:33 +0000
Message-Id: <20210424155639.1131482-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ports over the libseccomp pkg from meta-security.

Use DISTRO_FEATURE check to enable recipe
Add PACKAGECONFIG tweaking for a few core pkgs if 
DISTRO_FEATURE (seccomp) is set for a few core pkgs.

Skipped updating "file" as I don't recall the issues file enabled with
seccomp had on pseudo

Added pkg grp for adding libseccomp to base pkg grp
Add "seccomp" to DEFUALT_FEATURES as its on the same level as xattr.

I relealize some changes may be controversial and don't need to be
taken.

enjoy.

Armin Kuster (6):
  libseccomp: move recipe from meta-security to core
  qemu: Enable seccomp if FEATURE is set
  gnutls: Enable seccomp if FEATURE is set
  systemd: Enable seccomp if FEATURE is set
  packagegroups/packagegroup-base: add seccomp grp
  default-distrovars.inc: Add seccomp to DISTRO_FEATURES_DEFAULT

 .../distro/include/default-distrovars.inc     |  2 +-
 .../packagegroups/packagegroup-base.bb        |  6 +++
 meta/recipes-core/systemd/systemd_247.6.bb    |  3 +-
 meta/recipes-devtools/qemu/qemu_5.2.0.bb      |  1 +
 meta/recipes-support/gnutls/gnutls_3.7.1.bb   |  2 +-
 .../libseccomp/files/run-ptest                |  4 ++
 .../libseccomp/libseccomp_2.5.1.bb            | 49 +++++++++++++++++++
 7 files changed, 63 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/libseccomp/files/run-ptest
 create mode 100644 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb

-- 
2.25.1

