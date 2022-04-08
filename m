Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1A0C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.1119.1649445923182318366
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=if8wVGIM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id p8so8261799qvv.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0DpEw6TNGFAES+CxgvQk7GqvACZpnbIwCGCGDMWQ814=;
        b=if8wVGIMQ6G3deQoJRMgj+xOzGjAEuHRCmchHk39Wz1fdAbrowOZffm/N3uQVQqCSU
         96DwPUD84WE2IguVHvKd5KedoZolPx2Xw8krNMODJpSJVSUKmxUI6jh9PVW28aAK+Bib
         KveEbGdTuY5xR0B/Fp4F24MtPsVKqHYpS4sd0ul/4u3qS9t/YvMbRPTDvkulj/e/K8Ho
         H9AkUGgAJo37azaK3JAYeb8iEcb/QOdRFFcMSkR5eRhYAEGJdi4Rihh5DEcFpGsgYc/u
         1gyDxMUlX7lSLeBIYPDSzc3pLqsRkiNn2+T+avWnfT/nNeCRCyGrsSkJiLWOYSlSfohA
         DSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0DpEw6TNGFAES+CxgvQk7GqvACZpnbIwCGCGDMWQ814=;
        b=LacOGRJdJg4LpwLry8wSVYPMYQjyJ0I4iACnVaiQC32aJxQQjInHA7EruOu0vloGbA
         T8ghtvZ7NyDM4EOJvK/Rx6YZs3A9kJS5nZvtWLL4M5uWohWKCoMdyQ39OwQc5FY1pJ4l
         1h98e2MUdiI/1PtmOF3smaUUabIdScopxGfneMtArpXY+a8v5ekRPcabA9CF83rEF6r6
         ezYfF4n0mQl3HE9sDhovhsNqyNf1xqUqZCr1xGzlKYPvtZSG/3zrbXDoCfW99Kj6WmkR
         DDNxKNAkLNs3bHg0ha1sxf4ywK8pNU4Ix52DTo2do4Qm/fvyCXrQjE1hUAXo2bOlFRQO
         y7dA==
X-Gm-Message-State: AOAM5325pMUddRO5euTmhK5jR0OzcMZG4uBGpxZmdxoYTjAdVmEzrPcB
	lk9Fa6tGliXzbKKcimZajs6Z4vSztsCRDw==
X-Google-Smtp-Source: 
 ABdhPJw4gfal+3RlhBikLiPDB8CNt25DJuKWCqJvT1zTGi7tBXe0EE2nhwxoaXA6bP/lhfMYVtHu1g==
X-Received: by 2002:a05:6214:c62:b0:441:3ec2:c99f with SMTP id
 t2-20020a0562140c6200b004413ec2c99fmr17815618qvj.121.1649445922032;
        Fri, 08 Apr 2022 12:25:22 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 t19-20020ac85893000000b002e1afa26591sm20886799qta.52.2022.04.08.12.25.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 12:25:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/6] poky-tiny clean-ups and qemuarm fixes
Date: Fri,  8 Apr 2022 15:25:15 -0400
Message-Id: <20220408192521.1608764-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164162

Changes in v2:
* Addressed Khem's comments
* Rebased to the latest version
* Added distro description for poky-tiny, as this makes it more obvious
  which distro is being booted when there are multiple

The yocto-kernel-cache changes were sent, accepted, and should be
uploaded shortly.

Thanks,
Jon

Jon Mason (6):
  linux-yocto: Remove unnecessary, commented out qemuarm entry
  qemuarm: use virtio device interface for graphics
  qemuarm64: use virtio pci interfaces
  qemuarmv5: use arm-versatile-926ejs KMACHINE and add more virtio
    devices
  poky-tiny: add a distro description
  poky-tiny: enable qemuarmv5/qemuarm64 and cleanups

 meta-poky/conf/distro/poky-tiny.conf               |  1 +
 meta/conf/machine/qemuarm.conf                     |  3 +--
 meta/conf/machine/qemuarm64.conf                   |  8 ++++----
 meta/conf/machine/qemuarmv5.conf                   | 12 ++++++++++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb |  4 +---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      |  3 ---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      |  3 ---
 7 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.30.2


