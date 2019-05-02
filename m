Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id ED0817D787
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 21:10:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y5so4406385wma.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 14:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BYcmCXDP8zA7aY5Ydf6exGUj2uHDlyC8/pj13HYpl2o=;
	b=q5sdtVIBlvgrc83alY30GHilQRUZ9LnnZ6cW8uymwBc5L7gL+bl72v4RaH2unYv919
	aGVORD3sOEmLo2UuyzzP9zQFdSpvpydzjfKQtPnmtJwJn9gLyGLXBDG7ef+zfZ4+AMxk
	F3kyKMAa3szm4VA26t6+I1zDM8uOGZyO6hTqTXJ3fzjlELp063EJGIASkCAV/n6dYJxe
	0sbyHJvYRTPmHMkZlL0fCCfgrv6jExt6LRA5AjaKhjkzY/2jIJQnA2OonIG3Qvw/0lxg
	wGcGWCHXH1Gbr0KX8O37Tgvh6u+hy9A1qHg2ugChXr5qvXLOxE5lsq+WFjknvo5TQA8A
	BEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BYcmCXDP8zA7aY5Ydf6exGUj2uHDlyC8/pj13HYpl2o=;
	b=lXyBhKm8WBX7XqMfIL1Vi2DaKyMx8ns37rPTVfhAsXILYnCWpvGp8YQRGZSv+SVoyT
	NgNom16tADgv/xQSYPyKi2LcoSV/KZ0b2DyecONszY+2gd3YqF5vc9Z7uk/ERoJyBT8Y
	mXG7mBbJ9xnP+MOyxmZjxYXrMcXtTamabZDwF27ZhE05hOUuBAw+ndVq7LCv0gHpX5I5
	49xkK2gD5p0slXH+HU3h+BvoQwESwmxHJcwmPAB5TLnKxFEh3U/gzIStaW8YMOq4Yfb0
	drVHFYQvDrGIl4Jc1vCIeZeunIWrP9KaVWt6zpEnZKn2XGk1pdqLfHtg7AMXGqM/JV0O
	F3nw==
X-Gm-Message-State: APjAAAUSiPob1M0kVN7OQKfVN2BNnoMbiKrcetn0f8+0bT/HpbudBWe3
	tC84VArzwzw1zxfOdIvwFKdua6Vw
X-Google-Smtp-Source: APXvYqwWvtXvYYfLoI3lQoIqlq/uTREqzieYKhOWa0jYIqfiZ4buVIld32vZntGr+QGkHAg+fylOng==
X-Received: by 2002:a1c:6304:: with SMTP id x4mr3688228wmb.34.1556831405435;
	Thu, 02 May 2019 14:10:05 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id y184sm523486wmg.7.2019.05.02.14.10.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 14:10:04 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 22:09:39 +0100
Message-Id: <20190502210944.62696-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502210944.62696-1-alex.kiernan@gmail.com>
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
Subject: [PATCH v6 1/6] systemd: don't build firstboot by default
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
X-List-Received-Date: Thu, 02 May 2019 21:10:05 -0000

From: Jonas Bonn <jonas@norrbonn.se>

The firstboot service prompts the user for information about the host at
first boot.  Systemd determines whether or not a boot is a "first boot"
by the existence of the file /etc/machine-id.  Since oe-core always
includes this file (it is part of the systemd package), the firstboot
service never runs so this service is being built but never run.

A follow-up patch to this one will remove the machine-id from the
systemd build and allow it to be created automatically by systemd at
"first boot".  With that patch, we don't want the firstboot service to
suddenly start being invoked and presenting a prompt to the user.

With this patch, the firstboot service becomes a PACKAGECONFIG option
that the user must actively select.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v6: None
Changes in v5:
- rebased for systemd 242

 meta/recipes-core/systemd/systemd_242.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 33d3e0b000d9..9f194f2b6ca1 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -66,7 +66,6 @@ PACKAGECONFIG ??= " \
     acl \
     backlight \
     binfmt \
-    firstboot \
     gshadow \
     hibernate \
     hostnamed \
-- 
2.17.1


