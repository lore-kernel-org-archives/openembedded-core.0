Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0D976294
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 07:02:48 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id f52so55916888qga.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 00:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FsFjW3m0Y6iYL0wcf7cmnCc14bEKMU/CYWe6j1B9rEc=;
	b=Z6zPdwN5BUpCXwUqzP6yHqFpdflRxoTJRue/+lhTW+QfClsn3qTcSsu6rPlgfnKyfZ
	Z+UQ5FYAPoVHMbzwQb8HiKLereGiS+SzFE3z7jk6oe8j2h7S4S+d8a+KAwsEUMf13M1q
	IPUAWohiW9z1pX8l1swyYJfybW1xjUngELOHwAjZ2sT6OoS0k7sujrlAydi6fU77ummf
	yq/0nS2rPjO73+FjXdja7F9Z3CwjK7W/PUDMCKm0VdLPMsqIBDnktIhDXqG2dqbbnOIp
	IhuYN1+OJILTyk+aUB6FSu6QJWFzazyqRK7hw6ISP3i4brCp5uIg3WksDM1/gwOGmGK0
	1sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FsFjW3m0Y6iYL0wcf7cmnCc14bEKMU/CYWe6j1B9rEc=;
	b=hlvqU1HTNVI1f4vX02VLa94KiNvsOtapH1yO9ZYisVVoPvrdMk1qYc6KlQCeMPPeb3
	UfO4ZuTxEMZx6UodaRHJv0oq1sY6EnN+ET8iredPXhtI23MJqxdfxAoy4T/iRnOMFvj6
	DQM+nVm7NbXVh4UewS9CiSCIiOKou+G1ZY7sRIN0l1/y4pRlFFBkB7jYvaLUjlxOO8b7
	Vvm/TGoQKTbvcgjtJ1CnY3WGDHUM1GJYVImlZ5dTuokYJVQZZ7j82DSTQCTErmYCIlxI
	tKYvWmcOQnQ/dfmqMyiUZ8e2YdRP4p/UxfUq2y8aD82Qwf4IJOd1OZd3QIh4c4Swqsc6
	sGHg==
X-Gm-Message-State: AD7BkJIb87K1egJlxgXyoRqDDdFFnt3osZdU/MPrZvLgT0anZxjY4EnRCSntBqs5r0EGdQ==
X-Received: by 10.140.39.138 with SMTP id v10mr1582154qgv.82.1460012569398;
	Thu, 07 Apr 2016 00:02:49 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	v66sm2840212qhb.26.2016.04.07.00.02.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Apr 2016 00:02:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Apr 2016 07:02:43 +0000
Message-Id: <1460012563-18898-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] busybox/mdev: Ensure /sys is mounted before using it
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
X-List-Received-Date: Thu, 07 Apr 2016 07:02:49 -0000

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
1.9.1


