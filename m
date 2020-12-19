Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.3537.1608344628460814509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 18:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b2uM/p1P;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id c22so2445469pgg.13
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 18:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OCc+rs5hIxh8TGRoum7HW0HjSSqrBQIUkIvcUJ0Fw1c=;
        b=b2uM/p1P1OoTnt8Q2zV/45u0xN9WnuVaxINeIivRiWSRD0pL42ArAnhAhFvZ2DdVNx
         O3UFkcQ6dIHd46w6368zUDoHM53Xpz+Dfrx0tl33OmBfvMvZMFh0YkYcatJQUxEyiJ5p
         nOG5gqw2E2QffseZjWQL4UWKgYj71+9m/sFk0MrOAH0QuWGTI3Ea7gYOsHyK36LFeJtD
         FkZ3jjV69ehtQkCie7mM2XwMqEpO9UEiTNyW4/RUeMXYkNARgnkCPJy3/WknL0hXbmHE
         PbQBwFzQxVvIeYmBDVzoUVvcSwrZbVyBhokjTqg4FzHu79FkAnJsdmddu7y/YVixrNJt
         Y6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OCc+rs5hIxh8TGRoum7HW0HjSSqrBQIUkIvcUJ0Fw1c=;
        b=Noq+aQUwAPHmwTZOY6LTUuWVRUZAfX2zYarn3U/gCQvYHbVAI1GFF2NVx2gxBQAwEk
         WpIpOBc3A0gDYV62hpY9meyG1oeS+w63J7MKUjYWswESNifZMeRYCWGLmnzXzn6ZNs0b
         tY6fr9+MFrnT0jg1FbYADfMX/HCwVx3YBSO/QvJFVS98GMgC30TrEILNWGSyMCxWplqv
         OqMlEZoIChSm3cUHiIcVqFgFp9IsCmlROM4int59RBBibzLH7kzZBbH0vSpDRxJECE9V
         ViPC9UlOdKrDU1oKCl1D9zuc9kb4rW6wQblunLYdauXeifk398gGgsTbb8jHQekUe+3E
         PbqA==
X-Gm-Message-State: AOAM53164+zy9buzD8cYRpxfHst6k+1yqId6dYMFYOG0VNcPShbQx7qp
	kZT/+KGSG/PdkpP5+NqZjZVAadfx8USydg==
X-Google-Smtp-Source: ABdhPJy2eMj+aZJw+lM91AN0x77yuCRpL/jDP9MVOAnhJccxlyIi0dlkq/CPRah29w7k0bXUeyZRlQ==
X-Received: by 2002:a63:4f4c:: with SMTP id p12mr6538599pgl.432.1608344627825;
        Fri, 18 Dec 2020 18:23:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id s7sm9936514pfh.207.2020.12.18.18.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 18:23:47 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Sinan Kaya <okaya@kernel.org>
Subject: [PATCH v2 2/3] initscripts: Use initctl on sysvinit only
Date: Fri, 18 Dec 2020 18:23:42 -0800
Message-Id: <20201219022343.3362531-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201219022343.3362531-1-raj.khem@gmail.com>
References: <20201219022343.3362531-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check if init system is sysvinit to recreate initctl, this ensures that
it can be used with busybox init system as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Sinan Kaya <okaya@kernel.org>
---
v2: Use INIT_SYSTEM to identify init system

 .../initscripts/initscripts-1.0/mountall.sh   | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
index c719be5d9a..2839d57cbe 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
@@ -19,15 +19,21 @@
 test "$VERBOSE" != no && echo "Mounting local filesystems..."
 mount -at nonfs,nosmbfs,noncpfs 2>/dev/null
 
-#
-# We might have mounted something over /dev, see if /dev/initctl is there.
-#
-if test ! -p /dev/initctl
-then
-	rm -f /dev/initctl
-	mknod -m 600 /dev/initctl p
+
+# We might have mounted something over /run; see if
+# /dev/initctl is present.  Look for
+# /sbin/init.sysvinit to verify that sysvinit (and
+# not busybox or systemd) is installed as default init).
+INITCTL="/dev/initctl"
+if [ ! -p "$INITCTL" ] && [ "${INIT_SYSTEM}" = "sysvinit" ]; then
+    # Create new control channel
+		rm -f "$INITCTL"
+		mknod -m 600 "$INITCTL" p
+
+		# Reopen control channel.
+		PID="$(pidof -s /sbin/init || echo 1)"
+		[ -n "$PID" ] && kill -s USR1 "$PID"
 fi
-kill -USR1 1
 
 #
 # Execute swapon command again, in case we want to swap to
-- 
2.29.2

