Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15ADEFB3CF7
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 09:58:59 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47736.1774864735446470235
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 02:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=clG9hYHL;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.67, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-66a87f29614so548114a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774864734; x=1775469534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGYMVbEIhnuJjJVuSmNRQUgoGIvMC7JNxFZyLzomPfA=;
        b=clG9hYHLWdTZYe1Aj7xfwdZmGly5IOn1HKnaVR3R39btH/35gmQRsf7htyqsqZNQua
         fyHTp3lFXZuQY0DlQVL/1ZJUhYpSdUFUML2jU8mteJky/1T9YbH3pMMU25QZV1A/xCGt
         6JRmBcEAgBtrjWeQ6k9gRK84OoSs/7XIg7XAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864734; x=1775469534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZGYMVbEIhnuJjJVuSmNRQUgoGIvMC7JNxFZyLzomPfA=;
        b=YXGD0wIsG8VmhrzOdXPDm7PoHEFvC7YbD/2/X8zrgLOY5Z6pMp8gWW9a9cxtn1TbB7
         yBxOxYblm1cHuFpA9MC/Hg+3hP4Ds9z6k06mnTDY4zn0xywCC+oOz0pAhheMMQQqTT5P
         njqGcJsC6L1zZtC5DO/vGcV+mvGGVEBSDpgk786+Y3j4pRXxny/0b0kxwFjxssW8sAW7
         q9XbPqn9BhpTYKYdk8r0mOD4SOKG19C0hb+pbrxmU75jzKUmiUmCbm20R/ut0EgD2Gqo
         /izquryrt35GNDDYsp8UssXuJmT/vwGtIRYd7w3++ISYI3CEckHbf3Em00kZedDMnQ1p
         6y6w==
X-Gm-Message-State: AOJu0YybGDlMw8XrYFuwMe8B/zrk+3Aeoy+3fDMfk7lUmTT/07yeNNgt
	bf6gxqeIWFoIuZJlRebG37zS8jjawgsX9LOrnfpuX2XDWmDAVAj8JQwiUg3oR43bg/pPLu6rWjp
	RLIzk7rTYtg==
X-Gm-Gg: ATEYQzzQCR8iILF03RduNihOOEfpsl4VjtB28lEMWqXuHQB0iCYKmJkwz+Vkj3+wl59
	f+rQcxkaYkgxOL5bYpQrkw38lQHbxILZDQQIFIUuPLEiQrNNvv2Z09v/jdfk9cGDHLcgubswXk5
	yCZLpZqgvIbNUVh7fC/f6SabVEkXJlcYZAkuESTrX4oiT7kyN9a7apj6iiEDhKe8DuU/NGLl/XO
	7xmkwxSJOQIR1DyjkEjIvRQUGSKLy1GQy591RtiTmyJ99XmF9AdMLzJLEmfjvpeixT8a5xpHraZ
	3/4sAqJ+b1fCii7JWJxi5KTaPi/RCCz+vZsRsQY2Aok6it8fxKVXisBs+sM2sdaHlfOnXWvZ6YC
	7uHNeOpMwixHS2SR87dPxA/H+PVsbUNjeulaOFqJ6kKzhA4pVleryJfMcyF6WOdMOZtECp652fE
	ZkkcPj9HHDegl/MXJZMlj+Wzf5nWh05b5WBIYTclnAaxdtd+7QkBsTK8Qu8UqslJXYfaRIv7QYX
	u4YAtDwRz+KG0+ICF0QNvbWaJFnu1TfbJcUIscvXiBV2B4RZ3vjkHmxJT3zA2NRKA==
X-Received: by 2002:a05:6402:1ec8:b0:66b:f79f:b860 with SMTP id 4fb4d7f45d1cf-66bf79fba6emr378072a12.6.1774864733747;
        Mon, 30 Mar 2026 02:58:53 -0700 (PDT)
Received: from adam.arnhem.chello.nl (2001-1c00-8183-9900-1333-c39e-a751-6a95.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:1333:c39e:a751:6a95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23f0dsm272839366b.11.2026.03.30.02.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:58:53 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v7 4/6] librepo: add PACKAGECONFIG[sequoia]
Date: Mon, 30 Mar 2026 11:58:47 +0200
Message-ID: <20260330095849.119621-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330095849.119621-1-adam.duskett@amarulasolutions.com>
References: <20260330095849.119621-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 09:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234217

Currently, librepo compiled with -DUSE_GPGME=ON (the default setting)
causes dnf5 to fail importing repository keys. A very long writeup
of the issue is linked below. [1]

Add a new PACKAGECONFIG[sequoia] option which sets -DUSE_GPGME=OFF
and adds rpm and rpm-sequoia to the dependency list which ensures
dnf5 works with repository signing.

1: https://github.com/rpm-software-management/dnf5/issues/2539

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v6 -> v7: Removed librepo: upgrade 1.20.0 -> 1.21.0 patch as it is invalid.

 meta/recipes-devtools/librepo/librepo_1.20.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/librepo/librepo_1.20.0.bb b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
index 6557dda43a..7a2e9e6b9b 100644
--- a/meta/recipes-devtools/librepo/librepo_1.20.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
@@ -15,6 +15,8 @@ DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake setuptools3-base pkgconfig
 
+PACKAGECONFIG[sequoia] = "-DUSE_GPGME=OFF,-DUSE_GPGME=ON,rpm rpm-sequoia"
+
 EXTRA_OECMAKE = " \
     -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} \
     -DPYTHON_DESIRED=3 \
-- 
2.53.0


