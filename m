Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1334AC46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 22:22:46 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.7874.1673389358293468210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 14:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i9SbvUjI;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id o15so9821368wmr.4
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 14:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3o2DSw/BAJJ6kGXbT7oXmLeEzfT6i+z1y/kVdskPZwI=;
        b=i9SbvUjIOa48OiAqnPY/HneibWKYx1+vgqPHuxsrk8yCVmvqXImNxYlA3mbNuVvJOm
         kVb7ni+T5Z0cgEl8qatQhuiBa3uoytZlRJ8zsIpUj08synb7hOFc4m3dL3QcG8O8U7qn
         RELehU1CBbqx85Q5GZadSeO6trvJ0ZdaQPlELY9GR3FnuccDmNeAh5U/Sl5uwtH+uDcC
         kFT83aY77WxaKy+q8xseNOCE7UGYrwIkv0Me57gvg1+JJl8pZAcoZVl7KqTcQMpZIJhQ
         3jUysrXAKBEWxUMHxpyXgYueN7hF6ft765g3GPYLHZljhRf6UL8m9Q8OqXOQFhXf+9gX
         pWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3o2DSw/BAJJ6kGXbT7oXmLeEzfT6i+z1y/kVdskPZwI=;
        b=cKkvshqi1+KHUn5SLbc41+4ml/4DP656bKOfnimoQnIz4lZTrnNksuhgOQEgmnLWfU
         VRuSLBNEm0xPnBVMtmWwSaen30/eU02bBG1cxibedwSHWYr2uMXt1nWUnYbIz1SUpKRe
         IyAU4p6/E5JPsD/zM5wKQ9MX3L7HaZP4HaNMV4xYpDsNUFpzHVsHQr0G11ZmjFMUXbj4
         ScIgKudv1vS7nG1EhsB2U9NWWp3jPMd/DdnGvLqq7aZWyCEgoOXPlKP34JdV7iHsxrIm
         tBVdi5F3L9tXD/SHgAZqlknAk3j8ALBXHM2CKuKH8CQ+42MqLA/Ciix1JqTYPq6IpA46
         Cwbg==
X-Gm-Message-State: AFqh2kppScwrCR9e+q1rzvrWspBqwWUEs9vEGGoj8BTf9XWnN1UNiM9K
	AjEJuZqwWcjUp+vqSPEfllH58qQsHRw=
X-Google-Smtp-Source: AMrXdXujo0lOmT02je4OchwCSlZ758CRL5+zgfAM184vR0RYhYP/ZCGvW42SGABhiCZ25Qys1vb70A==
X-Received: by 2002:a05:600c:a4f:b0:3d3:5c35:8919 with SMTP id c15-20020a05600c0a4f00b003d35c358919mr50930426wmq.30.1673389356282;
        Tue, 10 Jan 2023 14:22:36 -0800 (PST)
Received: from localhost ([137.220.119.58])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c228200b003d9e00dfccfsm13655996wmf.8.2023.01.10.14.22.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 14:22:35 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] systemd: refresh patch to remove fuzz introduced by rebase on v252
Date: Tue, 10 Jan 2023 22:22:26 +0000
Message-Id: <20230110222227.314983-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 22:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175724

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 ...binfmt-Don-t-install-dependency-links-at-install-tim.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index a19a025559..2a033b134e 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -29,7 +29,7 @@ diff --git a/units/meson.build b/units/meson.build
 index a9bf28f6d9..11d3644168 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -63,8 +63,7 @@ units = [
+@@ -62,8 +62,7 @@ units = [
          ['poweroff.target',                     '',
           (with_runlevels ? 'runlevel0.target' : '')],
          ['printer.target',                      ''],
@@ -64,7 +64,7 @@ diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
 index 96f595ad72..7c010bb224 100644
 --- a/units/systemd-binfmt.service.in
 +++ b/units/systemd-binfmt.service.in
-@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
+@@ -14,6 +14,7 @@ Documentation=https://docs.kernel.org/admin-guide/binfmt-misc.html
  Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
  DefaultDependencies=no
  Conflicts=shutdown.target
-- 
2.34.1


