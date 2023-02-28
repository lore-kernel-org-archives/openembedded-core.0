Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4666EC64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 15:01:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.25578.1677596471811125237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 07:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=UWQJ9Mkz;
 spf=pass (domain: inovex.de, ip: 209.85.128.50, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-wm1-f50.google.com with SMTP id az36so6645709wmb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 07:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pUY+l1jgL+KSzh9ZPPAmJqoEGlQCy014eCXU7I4OJ9k=;
        b=UWQJ9MkzM07jaatIEGM3wtLTDdboDp3I7BCFV65o92FxlmsN4wcu2hkquftmfv0GAd
         dmfzkLKX6guQMKDB1oZ9Gl6jdEn6/t+qWTPqnZ2cOV7+RW0v66CCAGGyZuuD1N/+C/GG
         PSpV+YijY5HcZoT4u+DRk11GSzmFQtnkz311J9tp9dsXSl4VJ/DKF+J1r7ZMkvc7QeAI
         sR1UeQrwSxYSTQVQ2INUhklz0bV5yWRViHNssXPdfzVHiSFOh5TjUX+1lwAmFlqDq92j
         jBm/qm+hjRjo4kWL3tlwufpkZhQFvoU4g39rdTJyH1cNmZqwhroIUIVikuDS1YGA2UZX
         UFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUY+l1jgL+KSzh9ZPPAmJqoEGlQCy014eCXU7I4OJ9k=;
        b=FWnZfdakIgWZn66sDCkDQOsL4yVBJ9A0dP6ogqS4zYW/AL/wx1TPeusuyPyVMYzY0p
         kYKFeXwco9VIfh4zg8uodk55JHWYMGaZmYc208XeNeb8Rf1crOAUH+cYMQSftc0hbyFZ
         yEZnZM4XRaOzIlb7Y8JTHm7nuy5PfJORg5xMBqL/WgsCWKiAAV4dPXneNETu8O/c0fZN
         jp24bwzCbh7EkH2zoB1moWHXVbSAgj7AGCynXF+hnJAYhSQl1Hn6CCBF0/sW077777r+
         wYHCAwQ6wL21w70WrVumYlbi+orGIIGdBiUpUgdiDXya8H1CoCqLNHo9RhmGbjsDE1Rj
         3ukg==
X-Gm-Message-State: AO0yUKWJVsdjpDpA8RUGDCMueTXsHWdZGZZCg7dwUFX5JUhWPr7axruk
	scSY8tVh7YUOfQzQ8DhYEkFK0VPbkNq4Lv5k+8wFn0xwbnCSKv+EO7OxCJsiEu2nL5kInFXBkx+
	JNNhen+phIJzkiQkjgPHtvvHpkIFiz70E/I+kEeSPcMQTx3E8VNIVsdY1LxW9qC2cXHJqV/vsWq
	44kBC5TsYP3Lc7MLRP2A6dD6QB6Jc=
X-Google-Smtp-Source: AK7set+EhT9MFc7KwRoBEmEHYaob/Kevnh1ycqgFL9rekLLFkn/dXnNccwqBePgjr3rGQnDWy5/vXA==
X-Received: by 2002:a05:600c:45cb:b0:3e1:374:8b66 with SMTP id s11-20020a05600c45cb00b003e103748b66mr2162069wmo.40.1677596469962;
        Tue, 28 Feb 2023 07:01:09 -0800 (PST)
Received: from Dell.fritz.box ([2001:9e8:3860:6700:ca25:e36:4786:4ec8])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c1d0800b003de2fc8214esm13846688wms.20.2023.02.28.07.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:01:09 -0800 (PST)
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
To: openembedded-core@lists.openembedded.org
Cc: Anna-Lena Marx <anna-lena.marx@inovex.de>
Subject: [oe-core][PATCH 0/1] wic: Add support for F2FS in WIC rootfs plugin
Date: Tue, 28 Feb 2023 16:00:57 +0100
Message-Id: <cover.1677593618.git.anna-lena.marx@inovex.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 15:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177838

Hi there,

Yocto/OpenEmbedded supports generating F2FS rootfs in general 
for years but WIC does not, yet.
The patch adds support to do so in the "rootfs" WIC plugin.

Generating the F2FS rootfs follows mostly the way it is implemented
in meta/classes-recipe/image_types.bbclass.
Thereby, F2FS needs a minimum size in order to work correctly 
as it uses an overprovision functionality.

-- Anna

Anna-Lena Marx (1):
  wic: Add support for F2FS in WIC rootfs plugin

 meta/classes-recipe/image_types_wic.bbclass |  2 +-
 meta/lib/oeqa/selftest/cases/wic.py         |  2 ++
 meta/recipes-core/meta/wic-tools.bb         |  2 +-
 scripts/lib/wic/help.py                     |  1 +
 scripts/lib/wic/ksparser.py                 |  2 +-
 scripts/lib/wic/misc.py                     |  1 +
 scripts/lib/wic/partition.py                | 32 ++++++++++++++++++++-
 7 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.39.2


