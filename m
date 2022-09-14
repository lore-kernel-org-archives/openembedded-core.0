Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC7FC6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 19:11:06 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.1215.1663182656684649417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EqnldVft;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id o23so14238468pji.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=wLTcUPV99ak5fcHCe3y0Nl+akjK88iNScgO+M/8qSL8=;
        b=EqnldVftJ7u7UhFKame8LtAnfOJ6vwsKF8+HQV+R1vvMxaY/oyObRIsEohFIlalIsn
         Ae4ZDsOSmCRtVKYsLkcriPfc1eNGc25MlVAcK3/tBT45htQ+JInxazN2P2tYJWcwQVcv
         evxGj+OXQ63Tlsz9tXT11DJSCUI8E7g5FY19xNSTgLOcTkCTwZQa8hR6xqdp03PJFj9N
         +mhMmlvX+WBY/+nojAMcodtG2TjXIWOK1gnxXlcnA1PUjyKx7wEesh1T3z/QuWYVz8ta
         C7VIyy6QRiUJmeVCgCLeA3TigD1GfUdKOdCFpNYjRv9HUra41l75EQruEFl2x07SpCZN
         OEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wLTcUPV99ak5fcHCe3y0Nl+akjK88iNScgO+M/8qSL8=;
        b=K6RMUyPaZRsFf1iZ8ssiYxFSLKPRQtVEgG+v/tKnStra493QjHCXbb56Ooapm7MN/4
         gaI6o2S5CavMDQEKOVc7+bcsurtlaTFBZxjSWs9S+KO8xS+/hZSVzQXdZx/PpnwiKcPU
         6sRhLlg7S2MT0TBdfh/Z10HWnd1T1bPJuC2Hg9roWfafC0l43hgmGazbHjYBXSg6MjK7
         +yMPvAHBDcdqcC08uvfswWsKPfU8b4cLp0AGdpvuMZjmY4gpW3NAEmY0GYNBAMke+5D3
         Hg3uBxEZCI/WStYNLoRIstFsI9tWsoZmVZwikh3nZpoyR7JjO7q6hHlIvdapyig2w9GG
         TLUQ==
X-Gm-Message-State: ACrzQf3SDCwBEwBXbMjYijtlWmsrkHF0vc3HWlhmCuXgUGk5A94Z8Q7U
	WERi7htVYZ1QYbYZi0AqxluKnTWZTYaVjhXM
X-Google-Smtp-Source: 
 AMsMyM5gS1mr7wSE3fkwf7BmyerMYWLo147rcOt9WICD7tSdvHpK5hSgSCFtFZEG6rDM46n3QpGUXQ==
X-Received: by 2002:a17:902:7586:b0:172:d0de:7a3c with SMTP id
 j6-20020a170902758600b00172d0de7a3cmr484777pll.38.1663182655533;
        Wed, 14 Sep 2022 12:10:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w14-20020aa7954e000000b00535e950aa28sm10551156pfq.131.2022.09.14.12.10.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 12:10:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/5] systemd: Fix unwritable /var/lock when no
 sysvinit handling
Date: Wed, 14 Sep 2022 09:10:29 -1000
Message-Id: 
 <d8ade58dc21d8f852c3253c8af02e00489e8802c.1663182524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663182524.git.steve@sakoman.com>
References: <cover.1663182524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 19:11:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170669

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

Commit 8089cefed8e83c0348037768c292058f1bcbbbe5 ("systemd: Add
PACKAGECONFIG for sysvinit") decoupled enabling of systemd's sysvinit
handling behavior behind a distinct PACKAGECONFIG feature.

This new option affects among other things the installing of
tmpfiles.d/legacy.conf, which is responsible for creating /run/lock
directory, which is pointed to by /var/lock symlink provided by
base-files package.

In case the option is not enabled, then base-files provided /var/lock
is a dangling symlink on resulting rootfs, causing problems with
certain Linux userspace components that rely on existence of writable
/var/lock directory. As an example:

  # fw_printenv
  Error opening lock file /var/lock/fw_printenv.lock

Since Filesystem Hierarchy Standard Version 3.0 states in
https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s09.html that

  Lock files should be stored within the /var/lock directory structure.

Ensure the /run/lock directory is always created, so that lock files
can be stored under /var/lock also when 'sysvinit' handling is
disabled.

(From OE-Core rev: 85e5ee2c35cf5778c3aefda45f526e8f6a511131)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd/00-create-volatile.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index 87cbe1e7d3..c4277221a2 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -3,5 +3,6 @@
 # inside /var/log.
 
 
+d		/run/lock		1777	-	-	-
 d		/var/volatile/log		-	-	-	-
 d		/var/volatile/tmp		1777	-	-
-- 
2.25.1


