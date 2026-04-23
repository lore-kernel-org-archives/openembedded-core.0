Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9992DFC0347
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:32:30 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.392.1776958345633637376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ViMhNjnP;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-464bc03efd8so4060495b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958345; x=1777563145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJuqKCaKf5O5llUti5goy7xq9BAyw8LRnr38Bymr0l4=;
        b=ViMhNjnPSSCjJ1R9a3ufG6bhfWXsJ93Qh/4H30MSDuzDQaU1ZR6xPBjpmDxCS3heho
         sDpvQpRUUEeT0f5ApQXFa4+lktNd6Z/q+Mdzv8GuLsOiJTM0/bzdMc3AMfsN3ENGdOUM
         boVQotQNFqVX8G9aflEeYEElek7fcCs4BGkosjOGoEDafeAlC0d+Ou/t8y3n/W7yylpS
         LZ2bekYVdJkiasVXqI4KpeoSxibZOyWUHtah/x9lrXu/X6qiNkBPsKCvE5iVCfgpeKgO
         0NBS993NytusVmyaV2/wJaixbbtm3v5gmuz3kOnJZfmm36svUOG7Q4YQSG2kXWz5YssK
         rvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958345; x=1777563145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJuqKCaKf5O5llUti5goy7xq9BAyw8LRnr38Bymr0l4=;
        b=TN33p0kr36kq6QsIJZNSx+r3OTj1NOgJBTwqRQmlKepMZ57/l2iz/xFuASmb6qhlPY
         OL2eeHHR0u3iFLNBxiL6K7vohW0eIymf+TPNqzpa2EPcurbvE7ldWnWc/t65X9XGFmfO
         kTxvCpmVF287RQSeg1YkDEkDXEfEaUvy9xc0XTqblMk9BvU70kHJnO/y34JiURV+cX9O
         +vp2rEKq2YuQIc0zQRa2DATk0UN/t9FFXFgWxCJTN9XnjMa+HvG7zS6scvNxzqr194DQ
         eFaeX7QZrn4ii9uzd03Ibu0Z96kzLgE8LvUf8Hq2cVItTfhuWWkxu9uvI6NIfhbjtofA
         KKsg==
X-Gm-Message-State: AOJu0YxpEVzWegBgEHNGR6afsKuEfzMEcF3pUMNnh/SnE2u58mj/yBFg
	DknfVlte+oHbESHWsagh7wMiGJxWiKPiiTZOw7XjfgbS+775cWGULTkM
X-Gm-Gg: AeBDiesQTJJAm2Xq2D4Ciq7Hwb4n7ebXyJnK3vckHawShGGjGhp7PR2ZdnRz277ENX2
	rjHg5ht8S8PaqwMtNa/54YtMBaxvb6JRfbhtWb3xH8lLNd+jrZbJ8o+kdOpRIj/9l0wK2PBga/V
	M5nm6HdkhQROyNVtWNdZCdmBNZVhhiQko/+hbCwakTvRpkrlEbk0wcjSwa7yxXggm7O9ydm49hz
	JgLFb6gC2oybJ27IL0uLC22LY/lX3pWFlwadu96w8D3z5xDOBGJlCClgaR1/lOVoApkQ1FPpKrr
	yrGyiGP3Gpft5gMn+Bht+8XsR9iNpb9s2+flWJfMh6Y7k5i9baP2W31qFF9qOLGSkPomxOhBdck
	liPUTaJB4rl8BLMKycFXOtKfNJgGTnO4zU8TfEoWjyolgF1vCInJMkshi/3zFpT1OtaKl1EZ5lf
	daKbinvjxIRqpei/33ZNOSZE8piJujsP1KymCn35NqzD7pqectq+W40AaKRYoYVR0a3rqtwD+3O
	ACjaUMNgwIWJbBgdqZoMB6qBPoSja9QIMBcmeztaxGtHdOWg1jBE0R9S8yn8IwoDflAdQ==
X-Received: by 2002:a05:6808:e3d8:b0:479:e9d2:26cf with SMTP id 5614622812f47-479e9d23f49mr6780051b6e.15.1776958344643;
        Thu, 23 Apr 2026 08:32:24 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm160765996d6.2.2026.04.23.08.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:32:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/15] linux-yocto: -stable updates
Date: Thu, 23 Apr 2026 11:32:07 -0400
Message-ID: <20260423153222.1932256-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235775

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

These aren't intended to sneak into the release build, but I wanted
to send them in case others are looking to pick them up while we
finalize the release.

Again, this is a single series, globally numbered across oe-core
and yocto-bsps. If it causes a hassle, let me know and I'll do
a seperate send.

Cheers,

Bruce

openembedded-core (10):
  linux-yocto/6.18: update to v6.18.20
  linux-yocto/6.18: update CVE exclusions (6.18.20)
  linux-yocto/6.18: update to v6.18.21
  linux-yocto/6.18: update CVE exclusions (6.18.21)
  linux-yocto/6.18: update to v6.18.22
  linux-yocto/6.18: update CVE exclusions (6.18.22)
  linux-yocto/6.18: update to v6.18.23
  linux-yocto/6.18: update CVE exclusions (6.18.23)
  linux-yocto/6.18: update to v6.18.24
  linux-yocto/6.18: update CVE exclusions (6.18.24)

meta-yocto (5):
  yocto-bsps: update to v6.18.20
  yocto-bsps: update to v6.18.21
  yocto-bsps: update to v6.18.22
  yocto-bsps: update to v6.18.23
  yocto-bsps: update to v6.18.24

 openembedded-core:
 meta/recipes-kernel/linux/cve-exclusion_6.18.inc   | 692 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      |  24 ++++----
 4 files changed, 700 insertions(+), 28 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

