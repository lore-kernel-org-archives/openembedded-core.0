Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD576013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 18:40:47 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so8506683wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 11:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yLtjnJVCK9cJt8cB6QbfpX/YEPRzT9cla1J0joLgw5A=;
	b=qr1awbIaDbBl65oH/mYZnz2W/fMMskfqwJoV+JxHsMEKOETq6Ixbf+xTBkSoEPrvgH
	lhaH9LNrWvbTs1ZPsASzJX4qaAxszSa2eNOaLqYIpzHVcwS3wxgy++hIAB+F6/pcqFuu
	mCKRTglB4szHcLh6FpCSuKWaC3mw6TY90Do1iE06CNUM/SSGznseCZ4U/uhAnBzZBpYr
	HGqcrJWmCMxwwBcG2NS6daeoxOqnD7ibofEOYn8jeEiyifMTVPRHWEAppi31R4v56UJx
	S4/0GKp3y3Aut5S0myoWdNAyPERXr+UgSAKsE9ur9T36DeZMRhbaa6eWeaMjiOPIxUI4
	x2Dg==
X-Received: by 10.180.72.175 with SMTP id e15mr26819482wiv.28.1426272048238;
	Fri, 13 Mar 2015 11:40:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nb18sm3929291wic.3.2015.03.13.11.40.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 11:40:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 19:41:40 +0100
Message-Id: <1426272100-23247-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] systemctl: Don't try to remove directory which doesn't exist
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
X-List-Received-Date: Fri, 13 Mar 2015 18:40:48 -0000

Noticed in this log.do_rootfs error:
  Started /OE/build/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/systemctl --root=/OE/build/shr-core/tmp-glibc/work/nokia900-oe-linux-gnueabi/shr-image/2.0-r20/rootfs disable bluetooth.service
  Try to find location of bluetooth.service...
  Found bluetooth.service in /lib/systemd/system/bluetooth.service
  WantedBy=bluetooth.target found in bluetooth.service
  rmdir: failed to remove '/OE/build/shr-core/tmp-glibc/work/nokia900-oe-linux-gnueabi/shr-image/2.0-r20/rootfs/etc/systemd/system/bluetooth.target.wants': No such file or directory
  Disabled bluetooth.service for bluetooth.target.
  Disabled bluetooth.service for dbus-org.bluez.service.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 2e632b0..6e163bd 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -149,7 +149,7 @@ for service in $services; do
 				disable_service="$ROOT/etc/systemd/system/$r.wants/$service"
 			fi
 			rm -f $disable_service
-			rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.wants
+			[ -d $ROOT/etc/systemd/system/$r.wants ] && rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.wants
 			echo "Disabled ${disable_service##$ROOT/etc/systemd/system/$r.wants/} for $wanted_by."
 		fi
 	done
-- 
2.3.1


