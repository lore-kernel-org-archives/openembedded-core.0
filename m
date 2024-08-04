Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEBFC3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:08:31 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.30085.1722791302260051836
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lZhVSxEg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7afd1aeac83so3715013a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791301; x=1723396101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SheZUJZJRtaNbRNiaCf2ZX0BlNpoRgMme0emzu8sF4=;
        b=lZhVSxEgnTv3R/XIRpHq4ZeU24722kk7hY+TE8Z4adtrrnHHNb7fcnr5kerUztXy0h
         L8Ds/WqCMLGpKuNR69alWyvHlOQyadgKWNWK0jlzkMsIuXKT+QgK1zwUYDeAvJCyrHIh
         nB8asofPKpSLED6GC3hcsLycNm7gOsGZ2PzvHJ5lH7iqHTlAefyNlcME3IoBsp9g9+2p
         8KSsZQad0io7ELZ9nTC5cBAI8wfu7PuvH2ALvR9yRf2VPZuWKWWht0sUvZeG9SRrYqen
         XzY6zvaIKrcc5yRpyO5cUV202E/DQuAT0UzVueV+zbB17CPvsF2JepAhDvOZAGv1E2eu
         nxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791301; x=1723396101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SheZUJZJRtaNbRNiaCf2ZX0BlNpoRgMme0emzu8sF4=;
        b=THNxlWJy/apFrHGTGKYZGosdERfbxRwt5x+srVgUPXyQvn0WR7nudWzTY71z7GUUvj
         pXIfnoCEGliY+YzcjOFU8UURPwJgFUxwtuDjOlka9LTA/sqY+nKETppoU59R1K4LcglM
         Gaj42eQ9V/3X90pu2o6etj57cjw7tH6DjjNTA4sg9E2BQWSQ42nXGCXwP6n4ChlKikMX
         MM1NLwTkpMW8YCi2WYNLxe4/NIOh4ycP7txHi7oTLs2I38zTn28sfje8pBWiy9ZiKeaF
         pZ4+OQ2rW5prqjUDJEwh0q8k4kx5khkIof/GkZ/M2kRJmWS3ozLZ/Pke1dN8lE6mc5p8
         jzEA==
X-Gm-Message-State: AOJu0YxXkKYgseph+xUZlYA0SPK/mEbkuqEnmrCQfr13Z6zl0IFt5L/T
	9kFAAFakNIaoevSvPttDgofKr0t/GVNSaHd6mKit3F7yFBsXtNMfNHjr2ASohP4HW0oSDiMjQcV
	XQNPxLg==
X-Google-Smtp-Source: AGHT+IErbYsSd+XI+UlJWI/TPoiV+kHQ0sj8ZIDaqn+U7evbon1RFxQpYpDxIa6QjrYpplUXncoPyw==
X-Received: by 2002:a17:90a:5405:b0:2cf:dd3c:9b0d with SMTP id 98e67ed59e1d1-2cff0903c6emr16811154a91.2.1722791301191;
        Sun, 04 Aug 2024 10:08:21 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4e3c41sm8714415a91.48.2024.08.04.10.08.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:08:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Sun,  4 Aug 2024 10:08:06 -0700
Message-Id: <cover.1722791084.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202950

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, August 6

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7206

The following changes since commit c6cafd2aa50357c80fbab79741d575ff567c5766:

  gcc-runtime: remove bashism (2024-07-31 04:59:21 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Ashish Sharma (1):
  gtk+3 : backport fix for CVE-2024-6655

Bruce Ashfield (5):
  linux-yocto/5.15: update to v5.15.158
  linux-yocto/5.15: update to v5.15.160
  linux-yocto/5.15: update to v5.15.161
  linux-yocto/5.15: update to v5.15.162
  linux-yocto/5.15: update to v5.15.164

Siddharth Doshi (1):
  lttng-modules: Upgrade 2.13.9 -> 2.13.14

Soumya Sambu (1):
  go: Fix CVE-2024-24789

 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2024-24789.patch           | 78 +++++++++++++++++++
 .../gtk+/gtk+3/CVE-2024-6655.patch            | 39 ++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb      |  1 +
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++----
 .../0009-Rename-genhd-wrapper-to-blkdev.patch | 19 +++--
 ...les_2.13.9.bb => lttng-modules_2.13.14.bb} |  4 +-
 9 files changed, 151 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-24789.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/CVE-2024-6655.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.9.bb => lttng-modules_2.13.14.bb} (89%)

-- 
2.34.1


