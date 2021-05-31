Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.48284.1622488321246107598
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 12:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XvfK0MNX;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso455983pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 12:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CifcwRy64X7b/wf8AuCAb1Ug4WI8N9TCO2rIKgo+050=;
        b=XvfK0MNXdh1sRknvTVYLnNJwGBrK5lf405e8pXZ/2oUoOexSftMCeO8eIJqZbZ6ZyY
         UAG0n6R2238g8cAwY74Q01cjwdG+v6ALi/JV/b0qnAhxCHJHqIPyxDRocy8wkQcxghPB
         0bHw7IFUci37Eq1cvCGZCFEe9f19Ynu7FekIW5YPT9Fxw+FMdfK6wpMvQHQZVcS9xud7
         r8WVEOQ5VJfxaLWt07EnRzUjF+jDk7Ha6evsy/5Nfqw+gG3rtol+TCDYuPgSKgJ9CcP7
         0x0HmvPP1mCVipb83V2YbdX8wAFwce8YuzkThYRXzAaIxcCHjy+gi9Hgr0FG5l41Vbti
         j7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CifcwRy64X7b/wf8AuCAb1Ug4WI8N9TCO2rIKgo+050=;
        b=ITJIFLoXkSQ0hmq3ZdX28mKWV3f7CHiu5xCCuRqIMA92bhOd0yp7c2t1gBsLtVDTeM
         ZbMO4nF+8lpvZX3+FPToFbbMurSbtmH2cVmD4H62HVrQ/IGmnt+tFBLaQRlwYFE1RR2L
         YUt+ujDbfGuXhp3rCki7i7DJu14ONuTRvhfIrZj/4S6O7lQ6pYTC31mDxKTj261NuHpM
         dIAGJvi8VHSb2p54g/X8tj+PzR8OZE5WNhRiCd6U8P7d4X8e1oRvOi0WIKyUCkl0A5j0
         /oF+RhGpguDYq4Zgw+6uX4lgv2cODYX7rjc/Tw/b00t6oI26Z1LWHLSq3FRcWEtQRhxe
         sSAw==
X-Gm-Message-State: AOAM531R2XBd9njtefnPyusULIAwBV+QooJ/LpbMGD4LSARgm1E06r7e
	cAxxvUTalLusyNSN2L8XrZv1JGlWyxApeg==
X-Google-Smtp-Source: ABdhPJy1r2wK3snGXu4LRdsWAV+rFyXMaDNPVjKfJ7IBU2E/QWnu++w1Qoub7+Lz/CDjaST4Dbd0Sg==
X-Received: by 2002:a17:902:7c81:b029:ef:b02d:f15a with SMTP id y1-20020a1709027c81b02900efb02df15amr21908628pll.34.1622488320248;
        Mon, 31 May 2021 12:12:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from kona.dnls.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id j5sm10799327pfj.185.2021.05.31.12.11.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 12:11:59 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] RFC???
Date: Mon, 31 May 2021 19:11:56 +0000
Message-Id: <20210531191158.964098-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I ran into an issue with a systemd service that had a depend.
The post init error message was a bit misleading;

ERROR: security-build-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['clamav-daemon'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget_${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.
Details of the failure are in /home/build/builds/master/tmp/work/qemux86_64-poky-linux/security-build-image/1.0-r0/temp/log.do_rootfs.

All I found was a python trace back in the logs. I have provided a version of an
error message that I hope is acceptable. The second patch is for RPM adapting
to use the 'error message' to help provide a bit more info.

The RPM solusion has been tested and before porting this to the other
package managers, I want to make sure the 'error message' was accepted.



Armin Kuster (2):
  systemctl: Stop tracebacks use formated error messages
  package_manager/rpm: decode systemctl failures

 meta/lib/oe/package_manager/rpm/__init__.py   |  3 +++
 .../systemd/systemd-systemctl/systemctl       | 24 +++++++++++++++----
 2 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.25.1

