Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id E60166013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 18:42:29 +0000 (UTC)
Received: by wibbs8 with SMTP id bs8so8248578wib.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 11:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HHhsYB2lbIIPRLx62Fme8UWJYfztnqBZE78h+S8Ai38=;
	b=tqM3V6eQr8tHrpvtJxXvHAnSKxTlAyNop8tBY+h81X7++gSEueiy0GL5Mg0+aqEhpC
	CMcm12cYOXRFLfBYiQZWo6aKE8bf5hQyo7PoKQk409wwcQ7MRW/oULZhPV5YsMdeAcWr
	VQL9UkXVI0Rb4Ft5sfVpaeYRhQkzYOqPIDmf9UnTVZpFzWf13a6rg/bR9LdrF72mDQDe
	vxoIsxZl8C+oSrbWU4imZC3Ha7AhjlrULLsvMPlBQKlbvmDCq4mQczzNgVn6TCoDSkDk
	FVy+NBeuW3PrNqaSGqhEVQ1at1C6PmYrg9cixMRuDZV7X7gxyrJG4cS425WhOM+3cBvY
	tktg==
X-Received: by 10.180.96.197 with SMTP id du5mr74273625wib.68.1426272150466;
	Fri, 13 Mar 2015 11:42:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj5sm3925674wjb.28.2015.03.13.11.42.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 11:42:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 19:43:23 +0100
Message-Id: <1426272203-25312-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] rpcbind: don't try to enable rpcbind.socket twice
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
X-List-Received-Date: Fri, 13 Mar 2015 18:42:30 -0000

* rpcbind.service requires rpcbind.socket and systemctl tries to add it twice
* see log.do_rootfs:
  Started /OE/build/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/systemctl --root=/OE/build/shr-core/tmp-glibc/work/nokia900-oe-linux-gnueabi/shr-image/2.0-r20/rootfs enable rpcbind.service rpcbind.socket
  Try to find location of rpcbind.service...
  Found rpcbind.service in /lib/systemd/system/rpcbind.service
  Also=rpcbind.socket found in rpcbind.service
  Started /OE/build/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/systemctl --root=/OE/build/shr-core/tmp-glibc/work/nokia900-oe-linux-gnueabi/shr-image/2.0-r20/rootfs enable rpcbind.socket
  Try to find location of rpcbind.socket...
  Found rpcbind.socket in /lib/systemd/system/rpcbind.socket
  WantedBy=sockets.target found in rpcbind.socket
  Enabled rpcbind.socket for sockets.target.
  Try to find location of rpcbind.socket...
  Found rpcbind.socket in /lib/systemd/system/rpcbind.socket
  WantedBy=sockets.target found in rpcbind.socket
  ln: failed to create symbolic link '/OE/build/shr-core/tmp-glibc/work/nokia900-oe-linux-gnueabi/shr-image/2.0-r20/rootfs/etc/systemd/system/sockets.target.wants/rpcbind.socket': File exists
  Enabled rpcbind.socket for sockets.target.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
index fd4b2b5..1952b2a 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
@@ -34,7 +34,7 @@ PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 INITSCRIPT_NAME = "rpcbind"
 INITSCRIPT_PARAMS = "start 12 2 3 4 5 . stop 60 0 1 6 ."
 
-SYSTEMD_SERVICE_${PN} = "rpcbind.service rpcbind.socket"
+SYSTEMD_SERVICE_${PN} = "rpcbind.service"
 
 inherit useradd
 
-- 
2.3.1


