Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.32975.1585212871791633585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CmYdIdaR;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id a81so6027102wmf.5
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PnHxH9rQdPd5dhjgDYF/HGalOk2+RugphfY77gQZd0U=;
        b=CmYdIdaRfM5J7hNotrUS2bjYmmNK5kpNqQ+eQm0Ij1K1xpqHt3r6mgHEFoyfW/+P8z
         ZUO77t/1Pf82Icqz18o72TQoNEjg/79WjXNb3asbCc89BeL76k0H+jPlSATbcJ5L1dHh
         6s19lF+EQTOZqZtt/GIkAhe9QLdbk/jtLf6EZ5U0JJDmETYhPBEbI8pI1dVNTXxZVW+E
         M6WtdiP/gRBaHuIa03innvAqzQMA3AHHmbcT8sbNJHV8r2bk6QrrSgHg629fjLBAUDjp
         cuWdD4pzr4B4tIda4/WMJjkKgMpCn/d33OVdmmbEu41eCGKemi5DY4WkBoaCpMz7dhYU
         zVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PnHxH9rQdPd5dhjgDYF/HGalOk2+RugphfY77gQZd0U=;
        b=OOqPBprtJiO3IfVotg9o4LW4bM7iAIjbwcz5YgDAAAHqrRGjmFFGThMiUeukQ0S/Q4
         WuJbqNAGoHWHn488jjl6ML9l1XaGF7/oXh+ErOSoEm/6LYYFPBP0m63QbgwB5LHbs5UQ
         aEG/YDySa4+SmcU4V50W2Yu6/y/LNouKMnaITxQU50nLdMo5jz7RXKtR452G1jtQNVpk
         TKs11qFfYNOVSBSKay8hd96nNJvnjenYvxNJRrQ/ADe1MX5zzpOmhKA8p5ZVV/6JZwzv
         VGB7Q1/ENF0+7MfoqhZkpP6ZlNQLn40oT1uH+wJIF/UIavjWELn6GySEM63pi1Yit+Hq
         eNCw==
X-Gm-Message-State: ANhLgQ0O3cN5fvvHEJuC3/CIJcveRSFEALSkp027/83HqyM67giyes95
	xik5OajKVhBc8VMZkrWtwdFFSxjz
X-Google-Smtp-Source: ADFU+vtpv8IEqkHnWukFaJM57HMoI/zviIBIXUJx9cZLN9sW4G6y0ZON9RjPYbZBQNMoFRozM5i6yA==
X-Received: by 2002:a1c:7504:: with SMTP id o4mr1944317wmc.111.1585212869839;
        Thu, 26 Mar 2020 01:54:29 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:29 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 00/13] Systemd 245 and related updates
Date: Thu, 26 Mar 2020 08:54:13 +0000
Message-Id: <20200326085426.117209-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Throwing these out there, so that anyone else who's looking at systemd
245 doesn't have to repeat the work, equally now is clearly not the time
to be applying these to master!

Not all of these are stricly related to systemd 245.

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
  systemd: upgrade v244.3 -> v245.2

 meta/lib/oeqa/runtime/cases/date.py           |   4 +-
 .../psplash/files/psplash-start.service       |   1 +
 .../psplash/files/psplash-systemd.service     |   2 +-
 ...md-boot_244.3.bb => systemd-boot_245.2.bb} |   0
 ...md-conf_244.3.bb => systemd-conf_245.2.bb} |   0
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
 .../{systemd_244.3.bb => systemd_245.2.bb}    |  82 ++++++---
 scripts/postinst-intercepts/update_udev_hwdb  |  16 +-
 20 files changed, 383 insertions(+), 153 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_244.3.bb => systemd-boot_245.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_244.3.bb => systemd-conf_245.2.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
 rename meta/recipes-core/systemd/{systemd_244.3.bb => systemd_245.2.bb} (90%)

-- 
2.17.1

