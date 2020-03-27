Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.17611.1585329925995846083
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hA27IInj;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id p10so12360035wrt.6
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gaS8t/hbcQG2COKr4n57AtXUe/HGzhPpyMMKe5ddAfg=;
        b=hA27IInjM9dmOg3MaaG1lF35MJZRpWJBouG2Kt0rx7yHpnvDdlCVmmPmJQOMc9VWUK
         9MxvNV6tp/JiE0W3m2LlCyqpYeS+R4NCeCI8vdPuA2y75iz6zfIxOsn+k/vLmrs6xznm
         Bdl7Ce73+AZmGCRIwAktAGQqotBypDhx0X+rLceLKQBbwjYrUzQXPlxiEKZ7TujHDCOU
         wBLMyYiDuzQIQXqxRKseaPJd8fLTxov6lKFV3lEIu+s4P9jDUgq2qy8P9cBQ9wxUToNn
         AzC7EE28RZDrqcQWEEePwmDewAVl4BV9aJvhSP0t85ksoyV/pJYLNS+lX5ua3qm1Ci6e
         LevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gaS8t/hbcQG2COKr4n57AtXUe/HGzhPpyMMKe5ddAfg=;
        b=j3ZNHNwjR6N08lAmst/qalQcZBiS5qO+e23RGakoDR2ADSE7KCxJm4e/cK0Php4EL5
         fOh4PblAGOx5IusilJ6VKr+MuLnRUpHgI6rd5Kc/yQofxasOGa3WqTBV+HVBxSluSvy7
         dPa4mjx8yXUsnmyBWYJCESbopMK/gDb+ndNgZqXQj6cWSITXwHWB19LGFsw6yjOu8epG
         ANHDQDDvNJwzejb/7L8yWV2u1yoYVWgssj9XqPFpuSGJ6wuRgf/z+Bl7xsJaNp21yHk1
         dxHRUJcm807/1NnGO/tUisE4CtsMoi5+eij4RsRm26HoypZZRWTD64fNwDFREZ7zlJTS
         6l6g==
X-Gm-Message-State: ANhLgQ0IfNzlldUSlgp17hoigjrrVEvVVj+jss3eUi/Fqt71feaNAiXU
	21r4ncTIP7OyLXUmixl3qdW273qA
X-Google-Smtp-Source: ADFU+vv6WAMRYdRzRpVMFB9cxDL4kun8GEbwPAaKJ9J03YdDzfalhUK9nDxq7MOrZN14G4pweTFc6A==
X-Received: by 2002:adf:ef45:: with SMTP id c5mr479908wrp.112.1585329924186;
        Fri, 27 Mar 2020 10:25:24 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:23 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 00/13] Systemd 245 and related updates
Date: Fri, 27 Mar 2020 17:25:07 +0000
Message-Id: <20200327172520.62888-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Throwing these out there, so that anyone else who's looking at systemd
245 doesn't have to repeat the work, equally now is clearly not the time
to be applying these to master!

Not all of these are stricly related to systemd 245.

Changes in v3:
- sysvinit: remove binding to DISTRO_FEATURES
- update to systemd 245.3

Changes in v2:
- new (use PACKAGE_BEFORE_PN)
- new (s/nonarch_base_libdir/rootlibexecdir/)
- sysvinit: moved update-rc.d RDEPENDS to PACKAGECONFIG
- move systemd 245 upgrade to last in series
- update to systemd 245.2

Alex Kiernan (13):
  systemd: Use PACKAGE_BEFORE_PN, not =+
  systemd: Package udev rules explicitly
  systemd: Replace nonarch_base_libdir with rootlibexecdir
  systemd: Reinstate systemd-hwdb-update.service
  systemd: Add sch-fq-codel to RRECOMMENDS
  systemd: Add PACKAGECONFIG for sysvinit
  systemd: Remove X11 related files when disabled
  systemd: Enable smack based on DISTRO_FEATURES
  systemd: Enable audit based on DISTRO_FEATURES
  systemd: Enable acl based on DISTRO_FEATURES
  psplash: Set RemainAfterExit on systemd units
  oeqa/runtime/cases: Disable and stop systemd-timesyncd
  systemd: upgrade v244.3 -> v245.3

 meta/lib/oeqa/runtime/cases/date.py           |   4 +-
 .../psplash/files/psplash-start.service       |   1 +
 .../psplash/files/psplash-systemd.service     |   2 +-
 ...md-boot_244.3.bb => systemd-boot_245.3.bb} |   0
 ...md-conf_244.3.bb => systemd-conf_245.3.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   4 +-
 .../systemd/0001-Handle-missing-gshadow.patch | 171 ++++++++++++++++++
 ...tall-dependency-links-at-install-tim.patch |  14 +-
 ...-not-disable-buffer-in-writing-files.patch |  46 ++---
 ...002-don-t-use-glibc-specific-qsort_r.patch |  12 +-
 ...k-parse_printf_format-implementation.patch |  10 +-
 ...set-util.h-add-__cpu_mask-definition.patch |   8 +-
 ...missing.h-check-for-missing-strndupa.patch |  93 ++++++----
 .../0006-Include-netinet-if_ether.h.patch     |  41 +++--
 ..._register_atfork-for-non-glibc-build.patch |   6 +-
 ...11-Use-uintmax_t-for-handling-rlim_t.patch |  10 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   8 +-
 ...uffering-when-writing-to-oom_score_a.patch |   8 +-
 .../{systemd_244.3.bb => systemd_245.3.bb}    |  83 ++++++---
 scripts/postinst-intercepts/update_udev_hwdb  |  16 +-
 20 files changed, 384 insertions(+), 153 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_244.3.bb => systemd-boot_245.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_244.3.bb => systemd-conf_245.3.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
 rename meta/recipes-core/systemd/{systemd_244.3.bb => systemd_245.3.bb} (90%)

-- 
2.17.1

