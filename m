Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 96AFA75D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:08 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id yl2so4046497pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5qLdNfqhbFx3JbN8vu8Q5zDmlVDb7eexpBJnpQTA3OE=;
	b=sjudqz5WjAU29DLIj6rZ3Wmj7WMrE3d+LYt7tsWw1sA3lN7OTiJ7UMxX8M/fZsF1/B
	/VXb4mm35OoElSTNVJYI52DLo5hfaSSFzrTjEmMCJvGG4g5AaiusRw6vvBot6y1NSDx3
	1K2up7FMP28I3Dwft6u3Gg6NyLld5VkaUiehvglJTksVzxNEsp6caoO7qliuff9gQnuw
	EgAv5n9X2FvakAW3hydLXHM18y7veGf2UUvYeEvXQPh2zevdq0eAoxltvzK5Sts843kh
	kiTAYIHVqNvYbLjlqvUIum43DvDauBEl8Oxz/D03YPRHyKbPXdpM0QdOCuNUkKTlJuil
	Mjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=5qLdNfqhbFx3JbN8vu8Q5zDmlVDb7eexpBJnpQTA3OE=;
	b=Ow3qgx/ljR8Cw0/d3gV641E04PVPmu5oLQpTUSTLAxBh5TkhoBP6C9oFhMeovvxP0h
	Q1Y+Y9+6+jD8hxFJYW1ATqyHpGYD2hDvkFWgfIacJuzfa+9pX1L/JQR6C6LycMWRCuUF
	m0uCfDS6JjtzUenZlhDMM40tcGPycGgdjqg4kEGK8rUxnh1yUzwf6s1Bcnm1f6vQWJqb
	erAmof8BeVQeN76uOYopGEsviBuWp4KJ2vmZI7c7YNNyfwPGGxcH62kilP19zo6tCSw8
	3y8KtrZM2WrWAA0nLFW5yNK/8G54pC/BiVr6UUsJw4XEIExPg8TV2pb8IAMZVPbR3e9O
	+MCA==
X-Gm-Message-State: AOPr4FU10Kl+tJ2ILbbPrfdepoxLXrCNZyy4hfF+gevatGJbIcGnvRXntF+O62JJnbUXiQ==
X-Received: by 10.66.186.238 with SMTP id fn14mr6682786pac.6.1462988169670;
	Wed, 11 May 2016 10:36:09 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:19 -0700
Message-Id: <8119a147b7f487ed489f90ad444ee15856cb35a7.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 16/42] busybox/mdev: Ensure /sys is mounted before using it
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
X-List-Received-Date: Wed, 11 May 2016 17:36:09 -0000

echo would fail if /sys is not mounted and boot would abort

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/files/mdev | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
index 9625247..8c9c06e 100755
--- a/meta/recipes-core/busybox/files/mdev
+++ b/meta/recipes-core/busybox/files/mdev
@@ -1,10 +1,12 @@
 #!/bin/sh
-
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
 mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
 mkdir /dev/pts /dev/shm
 chmod 777 /dev/shm
 mount -t devpts devpts /dev/pts
 touch /dev/mdev.seq
+#sysctl -w kernel.hotplug=/sbin/mdev
 echo "/sbin/mdev" > /proc/sys/kernel/hotplug
 mdev -s
 
-- 
2.8.2


