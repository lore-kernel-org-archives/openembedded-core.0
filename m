Return-Path: <ramon.fried@linaro.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 231A374A21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 11:20:48 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 66so19058307wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=k1NZRiUYpf0ERu22y1xAPlLZHpBfarsvjZPy5VaoCS4=;
	b=XyFVr4ubMTCRERhjU8CkOR9BH92advSaV1QGFbgs0AqhGlLiop1A1QEjW5Gq9CsR73
	qjpEg4LxmAiWvDlZkoRm7oN/s062+JhgpcDQgNc0uVOf07MrO1NIrXgIYk576Ivt6bPv
	HgyPkRKHuZj+XdCQ0Fo4JNCQfPCYcD1ctQsqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k1NZRiUYpf0ERu22y1xAPlLZHpBfarsvjZPy5VaoCS4=;
	b=kIgEJf0qtZf0qee4iYoPnq4EOVlSqyjj6oEneiVPcCm7UOP79SFyjEGgIxhiTrOjoR
	cFTbyXA2gclQ4wNz4pZcCitZBMMRZoi2nAu/Mvz6m+3Shz4r/vwWtBYCepD9ThCAw+Kt
	8uI3A0SuqlKvOJSDDJoqIe80dK45+WdKos0/mSNLhf7l0dnKX5VwOL1Zb8BxF1NHL1dF
	j3VljIKZJol3zwKZ6BJfpUVXqdlEsbvS5hc0u3fCntAQiY7grx8IZrgNHQsTM2OhE37R
	HvtME+T4Zbh3ZnnAx1UB3rnJIBgaNEC1xQVt2yOeV933QPvbBPKODuzxFEYvRatvdww1
	dCyg==
X-Gm-Message-State: ALQs6tBgJCuc+CM+32qZ7y5Oyrg2XEmsUIeVqCgM0BIgzrH+xoz46Cbh
	r4KhM0Cc2rGOUCf2cSVrbrDGhc5zmck=
X-Google-Smtp-Source: AIpwx4/rxh3McgnbROcEXqoHoIaMtUEYnil0HzAR/2ma3N4vn9PLnp5qQfXi6og1f5sftCi+i7REQQ==
X-Received: by 10.80.230.9 with SMTP id y9mr2547411edm.26.1523359249255;
	Tue, 10 Apr 2018 04:20:49 -0700 (PDT)
Received: from lx-rfried.mea.qualcomm.com ([185.23.60.4])
	by smtp.gmail.com with ESMTPSA id
	l91sm1669157ede.50.2018.04.10.04.20.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Apr 2018 04:20:48 -0700 (PDT)
From: Ramon Fried <ramon.fried@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 14:20:40 +0300
Message-Id: <20180410112040.13506-1-ramon.fried@linaro.org>
X-Mailer: git-send-email 2.15.1
Cc: Ramon Fried <rfried@codeaurora.org>
Subject: [PATCH] xserver-nodm-init: Respawn service in case of failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2018 11:20:49 -0000

From: Ramon Fried <rfried@codeaurora.org>

It appears that sometimes xserver-nodm.service is starting before
display driver finished loading causing the following failure in
Xorg log:
(EE) open /dev/dri/card0: No such file or directory

The introduced by this patch is to restart the service,
hopefully the display driver will finish loading.

Signed-off-by: Ramon Fried <rfried@codeaurora.org>
---
 .../x11-common/xserver-nodm-init/xserver-nodm.service.in                 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
index 324a26f549..87dc4f8fcd 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
@@ -5,6 +5,7 @@ Description=Xserver startup without a display manager
 EnvironmentFile=/etc/default/xserver-nodm
 User=@USER@
 ExecStart=/etc/xserver-nodm/Xserver
+Restart=always
 
 [Install]
 Alias=display-manager.service
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


