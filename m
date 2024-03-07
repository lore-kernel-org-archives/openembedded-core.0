Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9A5C54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 18:38:31 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.1161.1709836702539513589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 10:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n4djkbqA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e55731af5cso31934b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 10:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709836702; x=1710441502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/lvNDkGqDWeVXPd0OmrzEL2Tb69+rLE+0DE5eS92GY=;
        b=n4djkbqAIxANtlHjgwqbBj338xvMlBuUBhcy8USP77nupMVqmtovtM3AuKT7WrkB+I
         YWceib4pxDH9+PRtDEqnVxkOgN2JsiqfmLNqpcBO5q5XrU7XphOgylotGcPz89VgvbjO
         JSf+d2OyCAhFmYfwED53v36+GxBZ4Ub+UGhJ1dJpJ/vms2aPTNXNxehQOWkgxVMhhOxR
         ABTog8HT/Jldm2BHb1OIdDd68fHNjyHlkJlpPvEZ1lRO1JNk0TiRRbvdKMmQP0gEY2l0
         B/+junFB0n5Pet42KNFbjmSK7/FQZLTJOwINh7DFX5bcytE2bzparGr95XyvWJlKKmc9
         aZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709836702; x=1710441502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/lvNDkGqDWeVXPd0OmrzEL2Tb69+rLE+0DE5eS92GY=;
        b=tacTkenjSW1FLKzyq4gjL8C5X6cDTP3BKONkVa+dKmCEG++Dg7yGv/Z28w/qnZGoeB
         K+oN9iJU8Hi43d1XgD4Q9vHhHEEhxAqXKtWjqyeAXY96l0xNp85qczzuv4aBOtoGwfKv
         UXsQkdNjICP5ldkQZQXSGXocKYJeZtkl+HowoWF0j4wdGgvddKOnmr5ZQFxMG7Um02iC
         U9MLeJx5pqxqDX0s7LoG3smlZz2Ix+m3nY7q3F54soGoum+DOeem7D8dOp0B/7+g23tP
         HFd6DEFrxV+g5pL2aQelDCt1/x30EHa7bMbhcAnGAeBUR7VOWuSHns+91l18h2sZvlwO
         Gg7g==
X-Gm-Message-State: AOJu0Yxq+ik9obEehLzkMAxdA+Cct+0em9pZlptcNbA6x3I97ZOURBmg
	IhWvJMXFATtdMFsRcZ0SOjj9JxSvDgkRb7xUIjriDa+F63DcL8tnvHiw3TCMUvOZKPjGL2DjP8o
	JZEk=
X-Google-Smtp-Source: AGHT+IHskXo+LcTYWHLaDc2lvPUoTtgvYEdBN9mml5ixnnMdoqagq4msUdjmDRxcCPWgVFi3+a1uzg==
X-Received: by 2002:a05:6a20:3956:b0:1a0:e86d:ee6a with SMTP id r22-20020a056a20395600b001a0e86dee6amr10691907pzg.20.1709836701715;
        Thu, 07 Mar 2024 10:38:21 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s5-20020a170902ea0500b001d7057c2fbasm14959026plg.100.2024.03.07.10.38.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:38:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/4] selftest: skip virgl gtk/sdl test on ubuntu 18.04
Date: Thu,  7 Mar 2024 08:38:10 -1000
Message-Id: <20c70400ea7739a20bec174ac5df6841cbf0b4de.1709836581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709836581.git.steve@sakoman.com>
References: <cover.1709836581.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 18:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196814

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d06d480c2b..7dcdfd0ab2 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -221,6 +221,8 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Centos 7')
         if distro and distro == 'opensuseleap-15.0':
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
+        if distro and distro == 'ubuntu-18.04':
+            self.skipTest('virgl isn\'t working with Ubuntu 18.04')
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
-- 
2.34.1


