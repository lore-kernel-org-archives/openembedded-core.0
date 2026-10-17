Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79225CCF2C4
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 16:02:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8833.1792252915171002099
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 09:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VAv4x0HO;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4649b35bso619652f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 09:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792252913; x=1792857713; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZIazYfoCc0OKc9h2dcDtJ/3zw2ZV5JzBEFD4JftLi4o=;
        b=VAv4x0HOsu2lLf1whhWb07TrjoW4BcZCX0GrxEI5UIk17hbqbJHmLItbnBQy2385I7
         wqTbwB00jEGMlgFJFtqREgSUSMU1Nh4wdJw/x38o2DBNsa4HWCjraQjxKhag0tqlQ3J9
         mk/Q3gYJd2RKfNetI1Jhl4LysC4166ZRQk7E77ksPu8qaJCikA5lOAL3FyMWYXremJ6f
         QwcpG1PsvpQPmHxkIr4gNRIJKrIAfSyIOdNUmmejQvzH4nyYk9W1N7YWGNpk4aX122wh
         a0PVPmUeA8PkeJUcDvh3tc2coEPTK7/qhnNvsxuo6WYy5bonhsCCS5m2ykOoWaJC/hLh
         fG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792252913; x=1792857713;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZIazYfoCc0OKc9h2dcDtJ/3zw2ZV5JzBEFD4JftLi4o=;
        b=Zxn8yUSDyE58ZnvRj8jCV4oM6T71SHSJ+krPpNTMqmv4OdHMOv/zPVB2cnoUd1geBu
         O4nVk4i0fXBUej6EMdswBp36Z4tPduuTDiBCmPtih/r6RW8bmJaF9HZq8cVJITBgicKn
         a66VvksSHhyzrl9GjaovvZRbZRgPO3IeO5mj/0c+RdMFUMD4ZrFaEyWIFpT1BKXHhQ+t
         snQkVDEsH/0p/gX5tvBteCxMpoqTah24kU0Mjjkw44vLkq7zeRr8WG3whR/AwtF6Vhxx
         14fpieIyZbv8YRW3npf/JTNpTGTAUjpdWjz1t75720/Dq6tXXFX4UeEY7RPJfQYD9+km
         wJQg==
X-Gm-Message-State: AFq9FYKix25JriYi7mUefvLF6JRDw1cXtmtLg3HKb2L6LZVZh+pA8On1
	sEOBhFSzPaWOUITWB/m72Tg0/eleG/tWvQ5in2PALUdG6bqx1gZlmdvOCVsJwg==
X-Gm-Gg: AYBFou2BU8zV6P+bzTAPTLK5cMfVz2Qcshp9Zg70nG+Q8R7vlPC55OGC0I/7g6EynIp
	j33Nubu8/sUkSpa2Xm/coyBoW+13hQD5xh8JXM3J2sOzHtYh6EvsT60fY/vG78THpyraPwdMKKO
	wmv9naeNnzXubdPo8edg1OTn8R8PX0dtNUBt1tjfaSg3mEm59GBpQ6nDwmZPzDJFGMF4G1X0kPn
	XAAIvUAFd1nKlERpQ8Ls93J1Ak5ZFifgzMgW5nw7omb5udykkQaYFAPjEl2xq80qhuE9Zl2PDAO
	K7jvwuMOBp13Y03H4SuedO7Xdp+cFplBMX2wxDb27E7ZOvsJ6rJvGCxXuIsTZsv3X02pPh6pFqb
	k9ZTQH/J/KqhUotWOHCMSFc80/eYXG6vWWv1MhsfUCZdN2PKoDhatbb26YqcwVoGypupG0XXerp
	AkLCOHzbDeQ21hVIGeDsCtV1bIwS2jldoUxd/HDD1OfXqIZ6TzA/22TzGebTA9rp6h348g40LZc
	8hvXY+nl5MgLrGswybNbAq577QSvckzAbVcXNZixdjG5GoFeoQKj4YOwT2X
X-Received: by 2002:a05:6000:260f:b0:48d:f14a:9176 with SMTP id ffacd0b85a97d-48e07bc1033mr5435087f8f.22.1792252913081;
        Sat, 17 Oct 2026 09:01:53 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm11773542f8f.29.2026.10.17.09.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:01:51 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH v2 0/2] eudev: upgrade 3.2.14 -> 3.2.15
Date: Sat, 17 Oct 2026 17:01:48 +0100
Message-Id: <20261017-eudev-3-2-15-v2-0-489cff4613f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOyb02oC/3WNQQ6CMBBFr0Jm7Zi2IFVW3sOwKO0IYwRMC42Gc
 Hcprl2+5P33FwjkmQJU2QKeIgcehw3UIQPbmaElZLcxKKFKKeQJaXYUMUeFCQpRGqXN2WoF2+T
 l6c7vPXerfxzm5kF2So1kdBym0X/2vyiT9ycdJQoshG6MNJecXHNte8PPox17qNd1/QK3ij5tu
 gAAAA==
X-Change-ID: 20261015-eudev-3-2-15-e406a27a8c72
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 16:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248089

eudev 3.2.15 adds a render group for DRM render nodes, so we add that to
base-passwd first, then upgrade eudev.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Changes in v2:
- add a fix, submitted upstream, for a use-after-free new in 3.2.15
- eudev: link the upstream release notes instead of the shortlog
- Link to v1: https://patch.msgid.link/20261015-eudev-3-2-15-v1-0-407ba1a93edb@gmail.com

---
Alex Kiernan (2):
      base-passwd: add the render group for eudev-3.2.15
      eudev: upgrade 3.2.14 -> 3.2.15

 .../0001-base-passwd-add-the-render-group.patch    |  29 +++++
 meta/recipes-core/base-passwd/base-passwd_3.6.8.bb |  16 +++
 ....c-sync-dev_urandom-implementation-to-sys.patch | 138 ---------------------
 ...01-udevd-keep-a-copy-of-the-event-devnode.patch | 101 +++++++++++++++
 meta/recipes-core/udev/eudev/netifnames.patch      |  17 ---
 .../udev/{eudev_3.2.14.bb => eudev_3.2.15.bb}      |   5 +-
 6 files changed, 148 insertions(+), 158 deletions(-)
---
base-commit: 7803450fd5ecc1bb714abadfbe3ec340e930139a
change-id: 20261015-eudev-3-2-15-e406a27a8c72

Best regards,
--  
Alex Kiernan <alex.kiernan@gmail.com>


