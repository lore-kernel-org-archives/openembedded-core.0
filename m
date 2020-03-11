Return-Path: <domarys.correa@ossystems.com.br>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id C5EEB61B97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 16:52:46 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id r15so1192540qve.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 09:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=GOdS3PN2KPOM8VU26IaspqjB8G+KGLtJSTUqmqXLUFw=;
	b=izklLfZqnG0Ow6xtA7S+fNbgGJNpeBo5HyjMCTIfGwiUYa6PzWDBawdAl+0ihDdZVl
	WgeCn0kzs7GqX2rsm4SPMbx9WVoyhkr+JSF4ez7na3yw1zaxkAPi+xW/nDIc8gX3otZh
	2DfXeWTCwWrZ6cZR9cAijgpG/k0eJzDpAtmqmPnnx9EnP29BqV3ENh3QgMt12YdiCmYj
	cN0Ze8cYR1M5tI5B523+vQIBjzuUpHLnN3VvtlYubhe+9J4kAIXLmjSgiKCifDNLIl9g
	TLychsWeTOrA9o2PoBrGRzxeWynGCVXOQa2n/jJYe+qvjISX9PC5Pxo5EcnRQy8pXrPF
	asng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GOdS3PN2KPOM8VU26IaspqjB8G+KGLtJSTUqmqXLUFw=;
	b=Jfb2dkRUjFKog0m5VV5hPVoq0C3Lzj5D131bJPhqpQwEF5DOBEu0V23NOYRzn9Y4oi
	IJHXc9VdiPgTjAZBU0RD2QAQqu4oW/wIAh1p6F+4yvUmo5Ka0UwCB/1WgecEcBSHWIwr
	lOJJAsXydu3uT3lAZvt5Z0hm76wrUReEkaJ7v4OFZRQqCplRY4TrTMLDgce9JhBEezzD
	R2bOP+ojqlXadu3zS0Hvw3fkjm6A7pf1NorJIaS9ta9qyeuMigQhu85Y0apzgv1N5M1g
	hMw7fmfsMldmUwChlxFx6nPCS8GSgasY+4NsNqPJ6WL2RcvzgX25UIOfANebmmCMDk7W
	FnFg==
X-Gm-Message-State: ANhLgQ0P95mOYVKz+zCcJUZ1wjYgRJdBzcnxU/cYy3sOwpTs290Y9i+Z
	Uij1Flw3TCeUJgsL5UYQk5pGpSrrXVk=
X-Google-Smtp-Source: ADFU+vsM1LD9HTDqcoXt82f8ww8Fq+m+4ef/3djdFAGJb4SnF+kR4AZdJXQQtEXfksEztem5dep+9Q==
X-Received: by 2002:a0c:e450:: with SMTP id d16mr3726725qvm.195.1583945567174; 
	Wed, 11 Mar 2020 09:52:47 -0700 (PDT)
Received: from Monster.lab.ossystems ([177.194.198.25])
	by smtp.gmail.com with ESMTPSA id
	z11sm8159004qti.23.2020.03.11.09.52.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 09:52:46 -0700 (PDT)
From: Domarys Correa <domarys.correa@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 13:52:21 -0300
Message-Id: <20200311165221.23475-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] weston-init: Allow use of weston without input devices
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
X-List-Received-Date: Wed, 11 Mar 2020 16:52:47 -0000

Don't force users to have input device in your targets. As the default
option require-input is set to true, Weston only starts if we have a
device in /dev/input/event* and this not a requirement for all applications,
e.g. kiosk browser.

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 meta/recipes-graphics/wayland/weston-init/weston.ini | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
index 1eecf48bc1..1e6dff68fd 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
@@ -1,9 +1,10 @@
 # configuration file for Weston
 
-#[core]
+[core]
 #modules=xwayland.so,cms-colord.so
 #shell=desktop-shell.so
 #gbm-format=xrgb2101010
+require-input=false
 
 #[shell]
 #background-image=/usr/share/backgrounds/gnome/Aqua.jpg
-- 
2.17.1


