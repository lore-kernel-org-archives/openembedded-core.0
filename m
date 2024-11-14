Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDF6D68B3C
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 17:04:59 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.42.1731603890601694396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 09:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SD+IOYt/;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb3110b964so7887961fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 09:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731603888; x=1732208688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9MaJQvw7OVjbczmw9dKZTTXdHYWr/ZTcGzXgUy0kVis=;
        b=SD+IOYt/Nh3LNZPuW0qPbNMEt8eja1xMY9cE1fUABE8m+Kmcd1WPsqKWk2HO1sedhD
         KmTaBFMIihyGApYzszl34JKsKpa/bfYY6QTXPPNW3T2tc/Iq5Dc+sGk0ctjVUhs8KZG3
         ra3N9/uO9VWGZKVQYNvO/rZwsHSMa0ie1WIBhqVKbU+uJHfILtR5mJNV5hD/TZSePmWB
         lqV74/hcXyfHN1ZVdN89/05YSkm0twZJvq5mUzqdD5/zInptwogQSqebzrCbldBJEs5r
         PCl8NN5NqkoncrAaz46rskt0eVnN9ioW1Op4g3RmayoscLW4X8+vwLC8gFQTMEPOgqAC
         5PeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731603888; x=1732208688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MaJQvw7OVjbczmw9dKZTTXdHYWr/ZTcGzXgUy0kVis=;
        b=Hd7+me5WxdB6cFEuDrICsRi1Y5lsNTjAlJMWi0bTW9tbp03DGxlBNDdHpgviNQI8OP
         Oex5bwBp88btTWzObbE4aEAOjWluqpEX/I8JyX5Q8GC8pIL0LOtL5nre8b801puZ9OVk
         /mq52PUGyKKbh76hApW83W3aoSAq/MbIW+K3TlCuO/gT+Hxb4ptCFdIpJ262UwgmEzxZ
         dyQ5k8ubjRQcETF7kIj7omk6st1B7DFHt6I4yM3+qPJpiv0gzwL8sTOMPfLUKgvSctmW
         xtGVq91A54bT4SVi+nAUm6Z9hdfIdj6Qqu54ePai/oQ+UU0rim4EW6aHhXMtF5pfOUAQ
         eSLw==
X-Gm-Message-State: AOJu0YxJzGQXxbdlvSjUdi6XoNWAVpNfubCQK/bD3q3tB9uj19CkpuXP
	iLf2ZavYfxEEY+d1uH5ghG+jOuzUyr2wE6uyXlVZHXS+Lyy53lMkMOlACJKHcfkruaMRYDTIZvO
	N
X-Google-Smtp-Source: AGHT+IGYQWUl5o3R4tXpskAsRc+GFMlaSzmWLQksKN1KQJ+liWdeqQ3YUBnxuLkhV+QUsqCXvEI9Nw==
X-Received: by 2002:a2e:a906:0:b0:2ff:54c2:baa1 with SMTP id 38308e7fff4ca-2ff5902f3f0mr15637531fa.20.1731603887773;
        Thu, 14 Nov 2024 09:04:47 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff5977e038sm2336891fa.47.2024.11.14.09.04.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 09:04:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-firmware: upgrade 20241017 -> 20241110
Date: Thu, 14 Nov 2024 19:04:43 +0200
Message-Id: <20241114170445.3092435-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 17:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207173

License-Update: additional files

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...om-Add-link-for-QCS6490-GPU-firmware.patch | 31 -------------------
 ...20241017.bb => linux-firmware_20241110.bb} |  5 ++-
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20241017.bb => linux-firmware_20241110.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
deleted file mode 100644
index 7a07ef97f114..000000000000
--- a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 62fa39d0b4384be8f14d837ea79183ad93d0996c Mon Sep 17 00:00:00 2001
-From: Akhil P Oommen <quic_akhilpo@quicinc.com>
-Date: Fri, 1 Nov 2024 21:52:24 +0530
-Subject: [PATCH] qcom: Add link for QCS6490 GPU firmware
-
-Create a symlink between qcom/qcm6490/a660_zap.mbn and
-qcom/qcs6490/a660_zap.mbn.
-
-Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
-Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Upstream-Status: Submitted [https://lore.kernel.org/linux-firmware/ctvtlkh4t54wdtwcw3jnbyi7xwks534k5ksvjtv6pt2zrr72wn@h5k6vfk7bzqe]
----
- WHENCE | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/WHENCE b/WHENCE
-index bdee94fe33fc..b7ef9bdd5b59 100644
---- a/WHENCE
-+++ b/WHENCE
-@@ -6145,6 +6145,7 @@ File: qcom/sm8250/a650_zap.mbn
- File: qcom/a660_gmu.bin
- File: qcom/a660_sqe.fw
- File: qcom/qcm6490/a660_zap.mbn
-+Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
- File: qcom/a702_sqe.fw
- File: qcom/leia_pfp_470.fw
- File: qcom/leia_pm4_470.fw
--- 
-2.39.5
-
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
index 708c28b63205..6475277a079a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "7dde9aa13fc4707189ecd7d35ee94d92"
+WHENCE_CHKSUM  = "cc90b04cb170ac983b67b00f4ec8f73d"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -240,7 +240,6 @@ PE = "1"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
-  file://0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch \
 "
 
 BBCLASSEXTEND = "devupstream:target"
@@ -248,7 +247,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "a26c38ef5a83272f2b98ce8bf8ca1865a852a3deea49ce5a8dd804b914351273"
+SRC_URI[sha256sum] = "32e6d3eb5c7fcb69fe5d58976c6deafa0d6552719c6e74835064aff049d25bd7"
 
 inherit allarch
 
-- 
2.39.5


