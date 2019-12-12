Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 79F3C7CECE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 21:52:16 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id b11so4039322wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 13:52:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LpoHZNgHwzkNlUPe8e1B5tFAFsq54eqcNoLVZFCYIVk=;
	b=Ml09Zp/BX9Xp3FArTmzpENAowVbPZeQDLX223Zg/f4GjqULWkf+JRcOkrXH98imn1A
	oVOSaXRIZpzMTZYM41xYRvIQy01HXpOgKT+I7yOQ9Sc001BodRTbQ9oLu/yqnP7odQjR
	mXsNPXCHAFuYRTfvkyianiaQZDSiaGtcuW8cMMds2JBy18AQVgN3idOUVBmyqJ0QcVDS
	0KByHC7+YLJ1PhvdF48Iq0D3JYtjM5QE0RphItD/yaf76TfIk31Fy2eqCgH8N+shnQzu
	NSj0H2MMFm/91qWXYy5dejkcvPx+XabzlxLgR0nUi0jJ54b7GMBRKfiqG/VXuA/gtiiE
	dgdw==
X-Gm-Message-State: APjAAAUslE62DW7z34ipKZf5cwfLka+g50/aOGoxbUe3aXbluRqZ8h99
	egH4B5bBo4hnVRhcdGei4/56kd4U
X-Google-Smtp-Source: APXvYqymeLPAP1ELefx0/wpCQrWkkLqoiyvxoAoNouNbMnLRdDlj1JlZlaOnFz+/s8SUw01UshyYdg==
X-Received: by 2002:a1c:f303:: with SMTP id q3mr8537849wmq.98.1576187537058;
	Thu, 12 Dec 2019 13:52:17 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	v188sm7723704wma.10.2019.12.12.13.52.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 13:52:16 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 21:52:11 +0000
Message-Id: <20191212215212.27089-4-git@andred.net>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212215212.27089-1-git@andred.net>
References: <20191212215212.27089-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 3/4] oeqa/target/ssh oeqa/target/qemu: expose server listening port to tests
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
X-List-Received-Date: Thu, 12 Dec 2019 21:52:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow tests to access the listening port as just introduced.
Note that when using qemu this infrastructure shouldn't be
needed, but we still need to set the port to 0 so that
a listening port is determined automatically (e.g. by the
python http server).

Signed-off-by: André Draszik <git@andred.net>
---
 meta/lib/oeqa/core/target/qemu.py | 1 +
 meta/lib/oeqa/core/target/ssh.py  | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 081c627b01..758703c0d1 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -24,6 +24,7 @@ class OEQemuTarget(OESSHTarget):
                 user, port)
 
         self.server_ip = server_ip
+        self.server_port = 0
         self.machine = machine
         self.rootfs = rootfs
         self.kernel = kernel
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 51032ef1a9..63fc9468b3 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -15,7 +15,7 @@ from . import OETarget
 
 class OESSHTarget(OETarget):
     def __init__(self, logger, ip, server_ip, timeout=300, user='root',
-                 port=None, **kwargs):
+                 port=None, server_port=0, **kwargs):
         if not logger:
             logger = logging.getLogger('target')
             logger.setLevel(logging.INFO)
@@ -30,6 +30,7 @@ class OESSHTarget(OETarget):
         super(OESSHTarget, self).__init__(logger)
         self.ip = ip
         self.server_ip = server_ip
+        self.server_port = server_port
         self.timeout = timeout
         self.user = user
         ssh_options = [
-- 
2.24.0


