Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50720D75BAF
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:13:30 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.3530.1732162404010718404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 20:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PKo2R+Hv;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b18da94ba9so39239285a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 20:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732162403; x=1732767203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GzE+Urse4p32vuJLkBXWCiDvAaB8d0PofJWq6+Bl8/A=;
        b=PKo2R+Hv4rGUa01bIBot2p0ixoIWXFhZnqUbSGdQVulCKAsi64NTnGpz0uKmv/8y6F
         MaJaCSctim3g/gSzaMvGw3MG9epOvhU6/AoU/B2LN+6TM55Ix/WPCx3dsClIuCI10ZTz
         gR7JXyqwZVUrbsDdzy4gngNYmyA8Nm8891SJazxOoJ1PtEJ+ycSVAKDbrRSy0NO7+ddE
         lFR5S6MgJLlFsLuGh6BX0dZZIwFj2HR1Cgm5dI1aatUzGbkqbG6qooseLXqDaH9is1ah
         KZfgIq5zGYAmu20ewZ0H1myR4q14LfS3DPW+G2JrUhtKbWM8SHuuFb2e8DVjpSpPopEj
         QBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732162403; x=1732767203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzE+Urse4p32vuJLkBXWCiDvAaB8d0PofJWq6+Bl8/A=;
        b=VRyZ9/vfYi40/VMDUdOrWEoDegnyK6cRO7lPj8jjMTDRKjm3EB0IE5ijR6z5kbnOiI
         HYlBmwcXtR+cGMzxm/ytxDYOCAiKeNN4ev0ua947X0mDcYP6cDUq3ihZVfUJcPWVoGDg
         L3q6JymEDlFvInZziijP9DVv7fHadVL1HNE5MHuwGcdSwSC0YX7jUGXtFsQs6bBmoy4L
         GjCqtJtp5BCB08HtCiGN01vftY0qUB3TqyBgd0tnDEPpYcLaUh2UF66qnQPMN6hVAhRP
         3EjE6AAchUUIPFQDJMhlwKM8BD1QjuTrEZQ10/pPhUyo9dj1OGO6QULxVFujWjbxYj+9
         yxuw==
X-Gm-Message-State: AOJu0YzTms/FeSaMjGrwHwUBAosUAw94rsU/E3A3oaklMY47kNXbKLkI
	ExjSqNW6BOZeM6McymJM/kBTbN/7PXWyjdUdBAphqsnZjChKxNSW
X-Google-Smtp-Source: AGHT+IEgl+KzkxXEk9RZJB3iRt7y/cl090kCfSqxYZ7srOLBSkSigs7G2+U6wBY8qoAEPHw1AVfzrw==
X-Received: by 2002:a05:620a:2b81:b0:7ac:b95b:7107 with SMTP id af79cd13be357-7b50c12e365mr331591285a.12.1732162402998;
        Wed, 20 Nov 2024 20:13:22 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d4380d8b06sm18238846d6.37.2024.11.20.20.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:13:22 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: consolidated pull request
Date: Wed, 20 Nov 2024 23:13:14 -0500
Message-Id: <cover.1732162137.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207502

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here are the -stable bumps that I've gathered. The 6.6 updates will
help the CVEs in master, but 6.10 will continue to drag for another
couple of weeks until I'm ready to fully send v6.12 as the new
reference kernel and I remove it from master.

I've also included a couple of devsrc changes that I previously
sent (at least I think I previously sent them).

Finally, the biggest change in this pull is the libc-headers update.
I've tested it against glibc and musl, and didn't find any issues.
I do expect that something will break, but it needs some extended
AB testing to weed out any remaining issues.

Getting the libc-headers in early will ease the introduction of
the 6.12 reference kernel.

Bruce

The following changes since commit 626031da74b31d0a8c5ca9d5a1acac9a2d55e998:

  local.conf.sample: update IMAGE_FEATURES comments to remove debug-tweaks (2024-11-07 22:18:07 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  kernel-devsrc: update for 6.12+
  kernel-devsrc: fix powerpc for 6.12+
  linux-yocto/6.6: update to v6.6.60
  linux-yocto/6.10: cfg:  gpio: allow to re-enable the deprecated GPIO
    sysfs interface
  linux-libc-headers: update to v6.12
  linux-yocto/6.6: update to v6.6.62

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...ers_6.10.bb => linux-libc-headers_6.12.bb} |  3 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    | 13 +++++++++
 .../linux/linux-yocto-rt_6.10.bb              |  2 +-
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 9 files changed, 38 insertions(+), 26 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.10.bb => linux-libc-headers_6.12.bb} (80%)

-- 
2.39.2


