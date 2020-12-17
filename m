Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.1112.1608245686957079449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 14:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JjhatLe7;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id j13so243192pjz.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W58WUanDTOWD2WwDqzcPH79ucIqgAJ3HHqHE3j56ogA=;
        b=JjhatLe7C386ORp62YdPuOVwPflOxgjbH27c+j6254zGx5YOpQFtLkeJ5Vp2T+wATj
         mKlKZhWabBmtA8iIHkInQrpTl93zAWc0K/0keE8w+/KBZl+4A9cBcbp3pVMYxfVhXTvL
         8raGw496Y/XTI3q6zSS8vCVoN4VjhD8xej1boc5vEwEdhUlunle3z6m0vgFwpKCOZRPr
         nlyUBkx8D9zSdGxWnybYuYJDbp7bUmRBWtPiCEzGwAwFbDq/aYJr/OQXskphWVvRhIjz
         RcN/hQ+0/yE6U6ayikx8b6cfqE+iUwWqxpE/lor5+7jGcYPW1bl5TFqLZ0/V/kqRfOVC
         xC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W58WUanDTOWD2WwDqzcPH79ucIqgAJ3HHqHE3j56ogA=;
        b=S3IbYtkiBCQEyQNn9dvF1A0kIof6H/r6ah1NIn0Mlm1/KzW511LhekhBmXOJ/2Wuos
         tfqOtrTpEa9TgztlmD1XLi4DHnf4dEoYZUU+mWf7B/yDdLixefdzRMS7MTWnK2gVuGIC
         KSof4w6GxjA2FjmjznKzzv4O6Qxu7h/EE/SoRP14IRQ5yEH0cCANEje6otbTdGYLYGcI
         9ism4Y7SvT0m0r17OPVKS9OCsiKWz2dDKFC+d5eojT4e0PMpMloyJIT4AT5oGZqjUnRO
         5mWhesf1KEHumFS+rzY21DXZFOlU6YDy3VWTIUJ0vWJEm8Lf8OlHsDKNrWtVKdOpDxIl
         xyEA==
X-Gm-Message-State: AOAM531lRvYbt8Vfnc9jXBpanl1UxzGdN6mqd+C+B48OHOTHMl8NF6UZ
	jCC2eCGPtUkIQNmsTXi4TsGtTHuttFO8qAta
X-Google-Smtp-Source: ABdhPJzHS0AAufd82iVY5etML9+OOGqAjP5fDYRt0Sb6RLvGQlX9yi9rgThRxD6e9AIgGRpltsGK/g==
X-Received: by 2002:a17:902:8343:b029:dc:231e:110a with SMTP id z3-20020a1709028343b02900dc231e110amr1295808pln.67.1608245686150;
        Thu, 17 Dec 2020 14:54:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id u25sm6620428pfn.170.2020.12.17.14.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 14:54:45 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] busybox: Run mdev as daemon
Date: Thu, 17 Dec 2020 14:54:39 -0800
Message-Id: <20201217225440.2633474-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217225440.2633474-1-raj.khem@gmail.com>
References: <20201217225440.2633474-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When busybox is used for device management, kernel needs to support
older/obsolete mechanism via CONFIG_UEVENT_HELPER and
CONFIG_UEVENT_HELPER_PATH to enable /proc/sys/kernel/hotplug but this
would require kernel defconfig change and will always be needed when
mdev is used, intead run it in daemon mode

Update mdev init script to run mdev in daemon mode

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox/mdev.cfg |  2 +
 meta/recipes-core/busybox/files/mdev       | 56 +++++++++++++++-------
 2 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-core/busybox/busybox/mdev.cfg
index 6aefe90e43..143e6097cb 100644
--- a/meta/recipes-core/busybox/busybox/mdev.cfg
+++ b/meta/recipes-core/busybox/busybox/mdev.cfg
@@ -9,3 +9,5 @@ CONFIG_SETSID=y
 CONFIG_CTTYHACK=y
 
 CONFIG_FEATURE_SHADOWPASSWDS=y
+CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
+CONFIG_FEATURE_MDEV_DAEMON=y
diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
index 8c9c06e96c..2fbdfb073e 100755
--- a/meta/recipes-core/busybox/files/mdev
+++ b/meta/recipes-core/busybox/files/mdev
@@ -1,21 +1,43 @@
 #!/bin/sh
-mount -t proc proc /proc
-mount -t sysfs sysfs /sys
-mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
-mkdir /dev/pts /dev/shm
-chmod 777 /dev/shm
-mount -t devpts devpts /dev/pts
-touch /dev/mdev.seq
-#sysctl -w kernel.hotplug=/sbin/mdev
-echo "/sbin/mdev" > /proc/sys/kernel/hotplug
-mdev -s
-
 #
-# We might have mounted something over /dev, see if /dev/initctl is there.
+# Run the mdev daemon
 #
-if test ! -p /dev/initctl
-then
-        rm -f /dev/initctl
-        mknod -m 600 /dev/initctl p
-fi
+
+DAEMON="mdev"
+PIDFILE="/var/run/$DAEMON.pid"
+
+
+start() {
+  echo -n "Starting $DAEMON... "
+  start-stop-daemon -S -b -m -p $PIDFILE -x /sbin/mdev -- -df
+  [ $? -eq 0 ] && echo "OK" || echo "ERROR"
+
+  # coldplug modules
+  find /sys/ -name modalias -print0 | \
+    xargs -0 sort -u | \
+    tr '\n' '\0' | \
+    xargs -0 modprobe -abq
+}
+
+stop() {
+  echo -n "Stopping $DAEMON... "
+  start-stop-daemon -K -p $PIDFILE
+  [ $? -eq 0 ] && echo "OK" || echo "ERROR"
+}
+
+restart() {
+  stop
+  start
+}
+
+case "$1" in
+  start|stop|restart)
+  "$1"
+  ;;
+  *)
+  echo "Usage: $0 {start|stop|restart}"
+  exit 1
+esac
+
+exit $?
 
-- 
2.29.2

