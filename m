Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8867E69166
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:07:54 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87768.1766434067854486122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XjCHHEC4;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79ea617f55so771148666b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434066; x=1767038866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jfLxmmFnfdQN0spA89bTFhmz8qs7qBWBHKn/TR0o4I=;
        b=XjCHHEC4UTFhpNiMiaiIiRsQFlqWbE97gNFeOKd6AIpBU+UyYsc5D01Jbi7PPDlGBP
         pJ40D27SqYcaZbIYgZzWcT6b3UxuGdmclc7wgem0LIYM2MlXB2lbIs08vRkgMRSYpn2L
         MvZB0+MvnA2xXWiQa3qotN4kN26qL6qi1eqIWcunsCfHoll3v188JXhI+7+zwHFn1Yhb
         iSF9RL3pAI0OBxW3OfpLOks83Q3+9b7VDL68boj71P6xFgmxS/bQHAAI8j3AedF/ysKN
         g6TNaEaZNA+gwNEySL/SPDtzXAdiqAqMOts1FCZ2jEpuZamopXh2bPO/PlRo1VlvpY+4
         XeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434066; x=1767038866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jfLxmmFnfdQN0spA89bTFhmz8qs7qBWBHKn/TR0o4I=;
        b=hYNo8l3v8TiXawj3o4bih+dd7qs3soMPWdnCP1j19cOQLyvyksUGH6Rs/DirSjqbnh
         FZX8Q78ZuPIqw/axkJBQERDvgduI07i1luWPYhvJk6N1P4FfUekkRzEZT1/IjJwFfE9S
         CRDW0CqxEMXHIc/Wb0I0vMvBmAkw/9ucqrpD/Q458FZx9JnfJL/08Izotb8ZH+3j72W+
         FdY9Vy6U0+tk93z+aKHj5EQPe0TqrvhpK8rTG6hpTZq1KVYpcOzc1I9eUB+cVCYQRnhX
         CUQZXfe909fDMDgBi1b5AfCxp5Tb+vpQDXVahC3+SHEDDlIZc5k2RZXpwocrTWuped7B
         ORvg==
X-Gm-Message-State: AOJu0Yxa5Fg6J0L2dr5iT4tTB9DFUikHZEzNS6cr4v3yx9ykZYTxJ8ta
	Wu4qTTWRrb6XJ4Eey2ANBOmDyFa1AW7DvSv6VmgEGJ40orbkL5N1GSFAdvCFxg==
X-Gm-Gg: AY/fxX6UvPyYmL6qItyD7gGQyeO7twlYVVc/wQHg+dHkhBaRvP1QpA7V8v5Hy4ts4R9
	aDYZR7bXnKiNL+zVnBgYO2MzxqaPcUnz+LYNCgl0DhfSU8wE9M4gCfR2jSRTfRMweqjmb64emmh
	Iio+aOLkDrPGFRot9r97ULeFI/zxOYblIJlMIp7AS1QMuEG5DU9LmsUF+piBKDd4gRqCCBBq+wI
	J1xljVvexIYfw2+9/+GxvylFq8Q8Te2IpyXXQ/90f3WcCgbYviW3YIwTEDzZ88znn1v/+zoK0k8
	IIavEIaq1NeBczgpGjnDZujCDnYpqPHRvTU4fP8DVyjlFiCeKWMeyTHy8X/U0T5d9cd2NqXGGdg
	dbloevlbhL7QUnnQE2jPq6z2BoxmdK9KgBLStjhjmzqP/Sdv8FE7uKHdof2AuuL7iWCuDl7O6kF
	F51F8x/WuV14NQ59O7Y9IaCZdt9WXi8oBAEcvxeujgkqeg5opzyWdxw1SB7w==
X-Google-Smtp-Source: AGHT+IGflCfPzf/G/ssqOXdB2WB+t7pBLSbfBz/jkc1GzgwzePGwbhxnx09nGh8+HxIMphZy1umDng==
X-Received: by 2002:a17:907:7213:b0:b76:277b:9a5b with SMTP id a640c23a62f3a-b8036f0a536mr1241207666b.6.1766434065890;
        Mon, 22 Dec 2025 12:07:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 001/114] build-appliance-image: do not inherit setuptools
Date: Mon, 22 Dec 2025 21:05:43 +0100
Message-ID: <20251222200739.2278706-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228326

From: Alexander Kanavin <alex@linutronix.de>

The recipe is using pip, and that doesn't require setuptools. I believe it
was a mix-up from https://bugzilla.yoctoproject.org/show_bug.cgi?id=11022
where the initial idea was to use easy_install from setuptools.

A particular reason to drop the setuptools inherit is that setuptools brings in
python3native class which sets PYTHONNOUSERSITE = "1" to avoid $HOME contamination.
This is causing errors with pip 25.3, which rejects --user option in presence
of that environment variable. This recipe redirects $HOME before running pip,
so contamination is avoided.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 406cd2abee..5a7db7bfb9 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -22,7 +22,7 @@ APPEND += "rootfstype=ext4 quiet"
 DEPENDS = "zip-native python3-pip-native"
 IMAGE_FSTYPES = "wic.vmdk wic.vhd wic.vhdx"
 
-inherit core-image setuptools3 features_check
+inherit core-image features_check
 
 REQUIRED_DISTRO_FEATURES += "xattr"
 
-- 
2.47.3


