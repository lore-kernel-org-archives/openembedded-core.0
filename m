Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768ABC28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 11:22:34 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.11925.1741951352768989207
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 04:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dSKTZPg4;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549644ae382so2238287e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 04:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741951351; x=1742556151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AK8nMh0RFc9VWODTCuiY5Wm+0L8cBbjVb7Duc6PWdzc=;
        b=dSKTZPg4SusKy6bq0kDUjOpiF/YD4AsrZ8mdhbiZ/Ie70NNEhmCaZXsGT419p4g2wI
         JhfhCPpa3DgYPeuCRGXFgYKwwYCxrkO5YjTXQllsZmEwbtbv82R1k8OJP2Mc07lwbErB
         r0miYPHL0TR131lP8JSyVKfZsBv9iyW7Wl9B/A/1l2hM9xxRFkChn9VXxiOO2EyRcBM0
         wrmVXX43uXcOpVeunS7TkDwRzm3Uc1VfPT19RqdXcfa6AZTaOYNqb1zKnJB7Rfv5KtBA
         HiGYSkkbqoEr9bY+L/uLfO9NMlND3yY+N/4zk0oEqcp2NkBoJjsFIjrme1rstkZDa2hp
         MwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951351; x=1742556151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AK8nMh0RFc9VWODTCuiY5Wm+0L8cBbjVb7Duc6PWdzc=;
        b=n39j8doejiiKqFH+6wzjWenIi6lkAHBSD6RWOK1+FP5Ymt5ZlQ8PZErCNOzZE/gBfv
         1ic/HiN2S21eX3ZLkocqQabskWPpwgwwWe5a5UH5IWd9A1u+LonhcCXFhiNbrmdArLzL
         JLervCVQ7S98WiZ+WwM2JpsgbD8ExIv5HxNtbjKgXn0GZLV9J4oACSa3K0xyIL0+H+QX
         Uh7i9F04hp/HAGdGOlK42ag4NWMRgwHmJpF4TkAYZv8sWItek87vpgFm1Et+5Y7qukab
         +FZNAqBgACqByICOipzVSZ4KyLmkWiDLivVaUlh1NRqPy+0cdu+uOQtORWNWYDsW9K6m
         Tsrw==
X-Gm-Message-State: AOJu0YwhPpixgpxXUhOb7sYvCY3waXClID+SdZRLMXQkBnbYL0J8BYef
	6aEWCW2UASZiFS7tgvaJjM0WavUrkMAibzTcTDCH3gVEMY+S64AtpAB1iVFV/Rk=
X-Gm-Gg: ASbGncu6dxgK3dAuwD5Eet/bRk4Gz6Z77f2a8Qs1pgX7X+BeLP5d0uLyX7BqlvzRfkf
	wnztwEoKgtSUJYwS1E7TZbCysKDT8eN/npLyMYbtlhLBxNPUKcQ+qQ7AmtjBxsiY4CKmkLCVits
	fW59/zixqlXuRXeQjrhzFJtIk+TXUCYg1annZ4vjpt6yn537f2UDNMnKIfFF+88rgXjCtz2w1SF
	0WCJVjhLGR7Hnz2hNYv0NYJp8GQobCurQAquHwijqvu+x3zt7RDoNzTBv8ouc++DHNuoH1LI11u
	O4dCaxmcPqsnSJeA/j+8wWYP6rEV/Q+KaOO39RYQSRvFSdDLGk1tU7emus0tAOhO6JjZedlsPrz
	QzmiqqP1gqsOYFg==
X-Google-Smtp-Source: AGHT+IFe5WWg0LBBMd+uw2J3U5j3+DZi2wUnJ6o2AG8ysZ68XviVgmgH01eG1qZdAoiuNVlkR+ZepQ==
X-Received: by 2002:a05:6512:1392:b0:549:4d73:641a with SMTP id 2adb3069b0e04-549c39af674mr675149e87.45.1741951350688;
        Fri, 14 Mar 2025 04:22:30 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8821f6sm484702e87.176.2025.03.14.04.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:22:29 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: poky@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 1/6] systemd: use serial-getty-generator on genericarm64
Date: Fri, 14 Mar 2025 13:21:57 +0200
Message-ID: <20250314112158.305010-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250314111942.304800-1-mikko.rapeli@linaro.org>
References: <20250314111942.304800-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 11:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212838

systemd-serialgetty recipe sets serial consoles based
on SERIAL_CONSOLES build time variable. These fail to
be detected on multiple devices including qemu and the
resulting failures delay boot to systemd "running" state
by one minute on an example aarch64 build machine and qemu.
Serial console login works with both since udev will
trigger agetty on correct devices. Using systemd side
serial-getty-generator disables systemd-serialgetty.

qemu-system-aarch64 core-image-base boot time with
systemd-serialgetty before this patch:

$ systemd-analyze
Startup finished in 8.314s (firmware) + 9.805s (loader) + 14.338s (kernel) + 1min 34.392s (userspace) = 2min 6.851s
multi-user.target reached after 1min 34.387s in userspace.

with this patch:

Startup finished in 8.312s (firmware) + 9.804s (loader) + 14.295s (kernel) + 29.808s (userspace) = 1min 2.220s
multi-user.target reached after 29.802s in userspace.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend

v1: https://lists.yoctoproject.org/g/poky/message/13522

diff --git a/meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend b/meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend
new file mode 100644
index 0000000000..f23852a351
--- /dev/null
+++ b/meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend
@@ -0,0 +1,3 @@
+# auto detection instead of build time configured via SERIAL_CONSOLES
+# to support multiple devices
+PACKAGECONFIG:append:genericarm64 = " serial-getty-generator"
-- 
2.43.0


