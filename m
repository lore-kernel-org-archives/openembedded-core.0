Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5F6EDF142
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 08:47:00 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15852.1771231616731260643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 00:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bUEuRSbg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso20678645e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 00:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771231615; x=1771836415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxJK2gTObAi5O8oMoY6UAl8jDcxVfuZkNDX5k1zA5sU=;
        b=bUEuRSbgWzYMMD9p+gcPQhuoa4tjAXY1eILGh5rPKz7iWUf6CCfrkgBUdO9Sfp9ihD
         mar/NTljHjIlV5tcOPrzgaJkpv2TFf36GVjf66BDYNYrf+XHVPM8sKSaXrtX02yDB4xm
         nDJYaYWLLnB5ZNsl5i35mTblInNmGN9SAlahs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771231615; x=1771836415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dxJK2gTObAi5O8oMoY6UAl8jDcxVfuZkNDX5k1zA5sU=;
        b=Ss0zyY4PZWIY2DO9Dt505C3ZJS/wNi29KRo25SfRhF18UbPqaXiXUTMXROc8Wdsh4Z
         gS76IKbPRIEZMBfOUhaOgeS9eN1YcOZ3l2y39/cVAUgnK4QMZY+7DQEZ1aloeohOpNjH
         ahsMbPhgZ1C+84fBtNaI4dRhi4DXOOW7ZmqKVAcnWx+YMQTSNoh3oCM2uoamJf/vg67w
         dMwrDxcZJnnLHG+Tm6sbywjs9269Mxy8KbuJ/IS9mHJUEGOxf5suboEh5C+vp4ufAbM6
         ogmQDgBJVZdyQ1nti/noqfRNxKVuF/5aMKf+vqq3VfC9Okrlov8N+I2ViQ5zgjbKp96v
         VXbw==
X-Gm-Message-State: AOJu0YxqNmot1+YZo92C2JMTGSyQswBKJ2Z9ZYjjqUO5FI2+XAMO6zHT
	6chQy89tbYonFG4p3qmetz/pOyQLLBvzB7AATOrXg92bmXgP43tVC5ckdtiKy7VN296gKKX7RA4
	zOtpnTU4=
X-Gm-Gg: AZuq6aJ2roUWTcTWY/lrqH3NO8kUL7h1BftozXGesGQb7U3ANxmskpHkcUq4CBdGUe8
	RWhq0tyhsp/VlWIpopoRfr3F91BaiZY3X4LvD/T2pYFe/87vSzh71BHBg82YX76hLjE9zVjDdu3
	jUXSSAmXzXRUKtYFtgbT/N4L409RSHxXDPvj7ibD683kTfPLhMBn6VtNeDdstDB4o/jBxDt4JOY
	tx7XE84hj9Q8fMd8fEXEXrZD2UeZQkFAzwuc7MTnJUCIEgaeFyQvdmgnlmm++dPZoOeup56hFe5
	m7c421yqj7fOgStotSMpTA0AKncG47y/djgiRMWxZeKiZXgiET5lJcV8c5secf/hE6QkCygrXUw
	6lBybuGlj78Yu9C1GH01BgE8P5aEeDdNFExOzkP7h8wYdgh0D1SSyOxsTm2c3cGksF+9H0bVub3
	QChdfYErYkFH1CTR+IQL3zZfw31slpvzhwDIJpuk+QUr+TshXT6uNt7XTEQ3lD/w==
X-Received: by 2002:a05:600c:548c:b0:483:2c98:435e with SMTP id 5b1f17b1804b1-48373a782c2mr157107895e9.34.1771231614637;
        Mon, 16 Feb 2026 00:46:54 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c30e:78c8:ded9:8375])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd34sm473648485e9.7.2026.02.16.00.46.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:46:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/selftest/overlayfs: Improve systemd test configuration
Date: Mon, 16 Feb 2026 08:46:49 +0000
Message-ID: <20260216084649.2127586-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260216084649.2127586-1-richard.purdie@linuxfoundation.org>
References: <20260216084649.2127586-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 08:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231187

We need to ensure that sysvinit and systemd are not enabled together. Tweak
the tests to use INIT_MANAGER to correctly achieve this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 580fbdcb9c3..d0a3bfdd3c7 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -58,7 +58,8 @@ inherit overlayfs
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
+INIT_MANAGER = "systemd"
+DISTRO_FEATURES:append = " overlayfs"
 """
 
         self.write_config(config)
@@ -79,7 +80,8 @@ DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
+INIT_MANAGER = "systemd"
+DISTRO_FEATURES:append = " overlayfs"
 OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
 """
 
@@ -97,7 +99,8 @@ OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
+INIT_MANAGER = "systemd"
+DISTRO_FEATURES:append = " overlayfs"
 """
 
         self.write_config(config)
@@ -115,7 +118,8 @@ DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
+INIT_MANAGER = "systemd"
+DISTRO_FEATURES:append = " overlayfs"
 """
 
         wrong_machine_config = """

