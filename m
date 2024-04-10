Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A39CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 23:12:52 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4702.1712790766748717313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 16:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YyoLuNu3;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ecee5c08e6so6875181b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 16:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712790766; x=1713395566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYFvBgz/JBFgwnlYGWMgd32HKLWQpoWRtdo+MXzChV8=;
        b=YyoLuNu3LHwtyDd5iKyho6YL1VCAsp5BAgLl2fTIUcbi29lZe5YltI8mmtKAm6VJbp
         AFoqmAD2rOaQznf2VK3IQ7J5kUOXaaDueN2oioD1rsmYG5unWLGHEE80CQqFYvVAL7YG
         h6+Y+mS6T63LX4r8leh3YzDBysx7fKkkUQ8Dsv80qLNhhMn6kLPkKEKyGzJGzVIS8/GY
         P2WTfpSBAV7hQX+eiZE1+oTEA6cOhL0OioNtrS6Gmz33RIZqwTjv46eeprtpUye5CoTr
         kJvMmmhdmAR/G2Sc20xgHTWZ65y8WLyvMwuY/aDB5eT+lsqXiJ3Su580hrVYsQfEX9LE
         5crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712790766; x=1713395566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYFvBgz/JBFgwnlYGWMgd32HKLWQpoWRtdo+MXzChV8=;
        b=nTfWMKlScwmmmNttCkPhlpI/orgwDM7f/dnwZ/IGko32xqKhvBsga49+S5FbeOlCcN
         GeUwjaGVy2gbiVhrd6CXpFxDhn4wkHmBNKiugBW9kDjDK39oXBoPxsQ0kNv5Q2BdV3uu
         /cn0cNaePb8WnEalRvhvo9cnm93GU6oVyoVNb6XBIz0FNqC74vE1mUCyqNRYtVCH2dLd
         TkjppUB6HHvrp2IF1qBA4ua4SJzAjLXtzyWHyQSuXQ/Y20DycBHBD2elXxM3Ari+pbKY
         71GimonjPW62zxipkSzMYqM9gE2ccJfLyZPmSylvHUnUpYtyiBkjCIuwhw9PefK34nxI
         HecQ==
X-Gm-Message-State: AOJu0YzIff1kCKm91/WA0pq9c6y9EDgd9/m4ja6BnYurLvu8QZ+EJYJI
	WBV++Cz46/8m5bJNbJ+err+68EgRw2KVbovkc2Fx9D4ccKMX9xiVs/CWORiL
X-Google-Smtp-Source: AGHT+IGGijfpMxZL1ngN3aV2wLgGaiUHbJIxnJlFIGA6lmhDoSgoK4e4pMXN7inHbmvaxEbLQVN84g==
X-Received: by 2002:a05:6300:8086:b0:1a7:3365:d8ed with SMTP id ap6-20020a056300808600b001a73365d8edmr2987781pzc.29.1712790765766;
        Wed, 10 Apr 2024 16:12:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id x17-20020a056a00271100b006ed3509ecd0sm182644pfv.56.2024.04.10.16.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 16:12:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] linux-yocto: Enable nft modules for ptest images
Date: Wed, 10 Apr 2024 16:12:43 -0700
Message-ID: <20240410231243.2363935-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 23:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198109

nftables ptests need it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 1c03e22c3cb..e8e84f8f788 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -64,7 +64,7 @@ KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
-- 
2.44.0


