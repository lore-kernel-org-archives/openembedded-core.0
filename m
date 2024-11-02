Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA98BE6F097
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 00:22:55 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.8381.1730506974131279012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 17:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IZqiyT2+;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f72c913aso4126213e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 17:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730506972; x=1731111772; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3h5DPT+govoPeSN8a0WgchPTHGgViSNv8Q/vnlYufFI=;
        b=IZqiyT2+eyoFEIPUnD4UMprZiVOrNYMLJm0GMWcEbu83kskigKNqgbh+n588nnQDj2
         1OnaWJEzWz9NVGSe5ZLh0jq2YpOIgdFzOiUi4ghyRox7CKv0/EVe0T9s/SU2JwE6zmVk
         n0BDtedR6g8HTKl731Gk72qXLht3WUH6y7XONy1V6GZ3y72QZeNLrMHm73cFezQdoDJT
         eox9RrfNyDYZunBW738vtFjjCa11eXjWD/rZqRsni9S3rX1OGim/QPvd4nS4csQXSO1F
         wsuT8sb2mQrcRnAW7Vl05Tr3TCWdwDzY5jEWZx6xDH+Kk/YIFLGX9I9CZ1PTgnD24UeS
         kFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506972; x=1731111772;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3h5DPT+govoPeSN8a0WgchPTHGgViSNv8Q/vnlYufFI=;
        b=TXzwhzHZcb3qNc+i53Anx1Q8V34BMPc0D4pXjMD5fNsXry7J1XnSF6bIQp3HikFoal
         3ZveimBpnKLuqlM4shoNMuTnNQ7KvG0OH3Yoz5I6XmdfdCgTA7huZssJOwk5Y5t7lgsR
         eg/Y/Xe/SmmgFAMJD9QqLS2UAyXzJwE9f5gnXDwF1t8fVjSpg103x7NqyJIoYWd5XSJ9
         BfrGUuQ4hi2Cp+vw46PvvbgX0sqDWRETXQIFtoeEafM58tZABG+jwrE4VpzXXUaJvRkC
         hls29FfULUaDP5q+KQ4R56mInG6fGVzNDlNM51/heemYJie0RIC8q1bwUcsvZzpTwA3+
         DqHQ==
X-Gm-Message-State: AOJu0YyfS56wIArAz2eaIsabhmxX/nKL9GfBstEzFCcR4bajhpEFr9T0
	LYixCjgmWmO+FdhiQR8Nov6NZdHfOZz3YQ4vWdE4I/UevU+8JxNVkC2+qZzayGg=
X-Google-Smtp-Source: AGHT+IEZKdnE4V73IzfrZQhuYVLmfxnfCPeWq72/aPRz+YLeq/q1JHyxqKkA+2h7kqtCtquOklRCvA==
X-Received: by 2002:a05:6512:308a:b0:539:fd20:c41f with SMTP id 2adb3069b0e04-53b348c3741mr14785281e87.3.1730506971863;
        Fri, 01 Nov 2024 17:22:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc3b9sm720385e87.223.2024.11.01.17.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:22:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/6] linux-firmware: fix and improve Qualcomm QCM6490 /
 QCS6490 firmware
Date: Sat, 02 Nov 2024 02:22:46 +0200
Message-Id: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANZwJWcC/x2MOwqAQAwFryKpXUhUFL2KWLhr1BT+sqCCeHeD3
 QzMew9EVuEITfKA8ilRttWE0gTC3K8TOxnMIcOsIEJyo9zuCEtZ1Gisy9UrO4/BV54px5HApru
 ydf9t273vB+ti9StmAAAA
X-Change-ID: 20241101-fix-qcm6490-firmware-b0cb7be130f1
To: openembedded-core@lists.openembedded.org
Cc: Vivek Puar <quic_vpuar@quicinc.com>, rsalveti@quicinc.com, 
 ndechesn@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PN0DtpbXKWNv80vztmehMhIPuBKRWCt//anvKNQFigc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJXDZd7QMQs/SWoxLE5EAB9iqTzKRdk/O2XmBW
 hJcZyVvyBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyVw2QAKCRCLPIo+Aiko
 1YroB/9dDfnTZMIH7wi1Dhgqr+XRMUmM+9vQBeSX32KhAqgcSVIrHjPPRsfzaB6APvNLV5OWbi0
 e/M8X+xp5mXql7J+HZvTL/+mCNmB1ZFIKtK9H+MSsfoRxJu3AOZiJAAuz0h0x8Y0wefXInNVuFy
 W+Cgpbyl/60PbhX6tnf8f4KNDFQ9ifr1RvMiUHOBt11e9lPXhDz5XpNCVdG0HMJZmXXeKf+gXMF
 1G+DF9gt/8OE1iJKbhlhups7tk9jEyfWeGc6SuxvF2FBjKP4+s/xIcOwvNnF6QPSe0zb3vxdlVK
 ROUz5WigyaObY1T5mX6N5lQSAZ/98Dbh9LrQFjcrvCMyzqla
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 00:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206642

Fix several issues arising from the previously merged linux-firmware
patches packaging firmware for the Qualcom QCM6490 platform. While we
are at it, also install missing IPA firmware and install symlinks,
making these packages compatible with the QCS6490 platforms / RB3 Gen2
device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      linux-firmware: add battmgr.jsn to ${PN}-qcom-qcm6490-audio
      linux-firmware: split qcm6490 ZAP shader to separate package
      linux-firmware: split sa8775p ZAP shader to separate package
      linux-firmware: make ${PN}-qcom-adreno-a663 depend on -a660
      linux-firmware: package IPA firmware for Qualcomm QCM6490 platforms
      linux-firmware: RPROVIDE qcs6490 firmware packages by qcm6490 ones

 ...01-qcom-Add-link-for-QCS6490-GPU-firmware.patch | 31 ++++++++++++++++++++++
 .../linux-firmware/linux-firmware_20241017.bb      | 30 ++++++++++++++++-----
 2 files changed, 54 insertions(+), 7 deletions(-)
---
base-commit: a39e6e6854b60fd10f21c6c3f1e7d676e12ba9ee
change-id: 20241101-fix-qcm6490-firmware-b0cb7be130f1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


