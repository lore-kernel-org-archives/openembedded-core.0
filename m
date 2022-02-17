Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97585C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 23:00:29 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.4009.1645138828330406928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 15:00:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ctfVwPVZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id u1so11465634wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 15:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3glsKvwb/Lw6JxycgusP+2NN53NasYxudgOLBvbSVS4=;
        b=ctfVwPVZ90wTLky4zFbFPzqX7sJEG5KcNZDLxzzj7dQozgigTfEQ4Xo+Y/GzWT4DQ1
         wSlo25tvxZtGqmgVTU7QUdmLJxnocR+23AJdmz8nyN3nRREH7dIGtKjmwytiplhnzu2t
         enavT/vJf/ltEUk3hbGU8G5VC9FOdaJc5wucOFLLMHab53Q9cj28EmXzMo98+3wVBIqv
         JBstT9cwvkELYQfl8SsjaloXCLB87p7xQ8pw4hPRPOQRacbdtbynCo1nhB3qekapbmkI
         i6lnw0K3wgwt79ugrEUNGNsq8+18XU3vUPG8UvtocXTHFajjoF1/vMK9sfbjUXWusF3x
         +L4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3glsKvwb/Lw6JxycgusP+2NN53NasYxudgOLBvbSVS4=;
        b=d5qlh+RyL24CHVw7BRudec7i/35jDbjL0Cc2zMo3VDQrDlhKWz+jqTJ2aMpoK8rRtE
         MzjwfZXyO5HFrwx/GMetT6EeImQDej6CPat2VOtaTOcGFXZtPaFcmK3RMa1a6eEYHU6P
         mt4ZdhLRJ1e0YX6xP+gAKlVsB5+TQLNVEXBRnlEVX35+9Q3xB0c9+FkYwW9QJzDxRSHL
         wBfVi6Jnu9a20a9mUh+WQeuC4mbpvsDRvy+q1LhgBErVH4xpis4PlHWe2qp6NmrAR+/R
         UVKu70ne7bgnTc+9gqcwNohLwNlutStIax+sDf038ACVFB2WE1xxV/Q0Rto6mOGrRVF0
         j6Zw==
X-Gm-Message-State: AOAM530gAhV9rlK+la3RY/yYurIhFDEcjm1SmtyN4T6a+78icM8drmuv
	HQCLdEq9SUBZrH98sH7fC4nSkHMnMjydPA==
X-Google-Smtp-Source: 
 ABdhPJzzvuXhWKMOiDrq2J7O4CgKHSFYx5qbApChnvzoQScf7Bujt6BsNQPJ/AbMQYJpFpLOtQlYyA==
X-Received: by 2002:a5d:61d2:0:b0:1e3:c0b7:c3e7 with SMTP id
 q18-20020a5d61d2000000b001e3c0b7c3e7mr3833916wrv.682.1645138826660;
        Thu, 17 Feb 2022 15:00:26 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 a18sm36760746wrg.13.2022.02.17.15.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 15:00:26 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [RFC 1/2] meson.bbclass: add native meson test
Date: Thu, 17 Feb 2022 23:00:22 +0000
Message-Id: <20220217230023.727460-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 23:00:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161868

This patch add a task on the meson bbclass to add the
possibility to run the native test of the project using
the exe_wrapper.

This can be useful in some the integration processes
and add the possibility to run the test in an interactive
way using the devtool build for example.

There are two variable for that:
MESON_QEMU_WRAPPER_TEST_ENABLED: this enables the test when "1"
EXTRA_OEMESON_TEST: this is used to add extra args

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/meson.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 0bfe945811..2df7794f1d 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -179,3 +179,10 @@ meson_do_install() {
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
+
+EXTRA_OEMESON_TEST ?= ""
+MESON_QEMU_WRAPPER_RUNTEST = "${@d.getVar('MESON_QEMU_WRAPPER_TEST_ENABLED') == '1' and d.getVar('EXEWRAPPER_ENABLED') == 'True'}"
+meson_do_test() {
+    meson test -C ${B} --print-errorlogs ${EXTRA_OEMESON_TEST}
+}
+do_install[prefuncs] += "${@"meson_do_test" if d.getVar('MESON_QEMU_WRAPPER_RUNTEST') == 'True' else ""}"
-- 
2.35.1


