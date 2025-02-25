Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E16C021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 12:09:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.6496.1740485331215286198
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 04:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eac0AtiH;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f406e9f80so5063245f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 04:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740485329; x=1741090129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPjn1yBQngbKyZLG/HZHAA5F+o2WTF0DrG1stIS6Fjs=;
        b=Eac0AtiHunm4u3Y4XQACt/nhxEo88zJvCfj6eNqbdUQ3cDIHaQUFQ8XKO27cGwz30s
         CpF6ojlyfr5iHNLPlvHXv+o5A1DO/6UwKOa5t5Fhq23G27gTzCPcuf8WgLGzlguHtJzR
         RTXboinjsjT5uH8EOu7YDvaxlg6A1WNsAjl9+Ya6lod1Rc+JNO5j8VGoiyHbVi4yS/w0
         oiBX9L1jorSHC6tIbSbX5aKqRE2e4Euyl5lB6b1JXBTJ/Mkm2Il5I9Q8Ewc6VOWSB1LO
         VDSZbVkqyAG1SU0HiWtj6egdvam+GXk6KPCvuAXV5zjPRKo/gOaAvb+yjvUIzf+ta9Wz
         jDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740485329; x=1741090129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPjn1yBQngbKyZLG/HZHAA5F+o2WTF0DrG1stIS6Fjs=;
        b=RS68f80V0MqksphC6ahPMS7Qlk07gKHXJTdaMHVxl43NcyWzgUVDgD9dg4vvP+3OqQ
         WamS20JP/nOrdyhc256vhDo2Nxp/MfF6PkbpdJ/btKcSCg2AOmxecjkxmINk1vwlzh0p
         lTYYcorFdKcFCo6isTkUsVp9i8Wi+fLA9CAMSIyx0DwlCpAS1Ygn2NOmxsQ3yg1tKVbJ
         IowoSr5/sg3MPS+WFULQXJPmi4c1UrB2S8gBgJ+EbPWmcm2xH+K9obEIv9arR270SaFY
         4NNx/xU5tBRf4hY9BNvz42pQThEPy7nBomm50OIKFvZ87FEu771aSrwE1rJds9Bfc3mo
         aT7Q==
X-Gm-Message-State: AOJu0YzOPkD61BIr7v35O0QYwYRobUz+hxpOQduvnbWi11BPw+h5B1zx
	iXzrC/Qjj/Cw5KytG4XKACWAARJu3Y6U030APbcwLcbrYr+1QtEXGLbwRQ==
X-Gm-Gg: ASbGnctwyZfzrXoSbp5kYZSATw25Y9NswCiH4jS4lRrXti+QxD30n0GtI/oMlWHgj6Y
	784/bZFsz7Aek8KkT7OS/+H0GPkDYZDeKBUB1dFsQOIEHT01rZ+sKOPVM3phKVYGj5XNyeyvmZC
	3H13XflAKm1wC7Y5pTQyztwN1lRvWVxhAPqteoQDnNstkV62hk9aHG2uWwi0Nnn6W/AZfHFwapM
	d1tRHlZ5UrkD29z/SuPjx/JpHT/XJ8WsXunm1u9q6FFCj+WfNhasFYKq+ZM/J8bC907WtoC9LeE
	bgdaEPUYlPrXZQUfXFd0O9JbA435+Ea1oJInLbjUFFU8fSsu+UrkcMEyiFscgSc=
X-Google-Smtp-Source: AGHT+IFR/fUiIpklP4uYiZOopscUVxaNfxpnJ8diWG2f+VFGzFKmafD7Ir9MEDmG0FH42fm2GR1v/A==
X-Received: by 2002:a05:6000:2c3:b0:38d:ca55:76c3 with SMTP id ffacd0b85a97d-38f6e757386mr13207329f8f.11.1740485329565;
        Tue, 25 Feb 2025 04:08:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fc31fsm2018305f8f.87.2025.02.25.04.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 04:08:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] fragments/qemu: add support for enabling sdl in qemu
Date: Tue, 25 Feb 2025 13:08:36 +0100
Message-Id: <20250225120836.171976-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250225120836.171976-1-alex.kanavin@gmail.com>
References: <20250225120836.171976-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211876

From: Alexander Kanavin <alex@linutronix.de>

This has been the default in poky's local.conf template for
a long time, but it's not enabled directly in poky distro.
To allow better sstate reuse and a better user experience
on a typical laptop (qemu will pop up a graphical window directly),
let's add this fragment and enable it in official bitbake-setup
configurations.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/fragments/qemu/enable-native-sdl.conf | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta/conf/fragments/qemu/enable-native-sdl.conf

diff --git a/meta/conf/fragments/qemu/enable-native-sdl.conf b/meta/conf/fragments/qemu/enable-native-sdl.conf
new file mode 100644
index 00000000000..21c1298171e
--- /dev/null
+++ b/meta/conf/fragments/qemu/enable-native-sdl.conf
@@ -0,0 +1,8 @@
+BB_CONF_FRAGMENT_SUMMARY = "Enable SDL support for direct graphical output on the build host."
+BB_CONF_FRAGMENT_DESCRIPTION = "By default qemu is built with a internal VNC server \
+support. To see graphical output from the guest system, one can use a VNC client to \
+connect to it. This fragment enables Simple Directmedia Layer support, which allows \
+seeing the graphical output from guest directly in a X/Wayland session on the build host machine. \
+"
+
+PACKAGECONFIG:append:pn-qemu-system-native = " sdl"
-- 
2.39.5


