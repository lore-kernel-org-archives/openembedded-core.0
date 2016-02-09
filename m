Return-Path: <dfldashgkv@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id ACB19607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 12:21:12 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p63so155596509wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 04:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=2Z1OndQe0zTCI3vNXfVCDafJQOlz3fkVdL/nT31eJ8U=;
	b=i8JZAghCJvz8zGLVncD2+NoCIiZuS9Qdh8+vFs5mTunTaG9i9dP0sLon3Se5ABSnHP
	myWjGKs3DQ1qUxAE2EoClfwHVU3MGaC1PCYvPXw8Psp5vX7VCHbb0bxGea5Sc9UUiukD
	7RGaHDgMD78c3eVI62hV/D9HViiGhAT+n3AtDcErYxgsxEmFQ2Ee6qgrZPO9MXVX4vWy
	ih5BrgTzZYFCiaFDwBpDIQ0EyWYr1u+khROYjik0R9Pk4YvbU5UHqxIIof3c8bzKUabI
	EoNykVNVLpBWsD8RG0E4nA2cDjsn9e+46qwTbE+N+zQXCacJWrX1d/6BHWhpI3R34peJ
	dvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=2Z1OndQe0zTCI3vNXfVCDafJQOlz3fkVdL/nT31eJ8U=;
	b=Y3o0RhjRZD6xggNyNQBYhFaGQOXQ9e9LzrQNyfTRyQFi+wP9bM8wYn+f+X6vG9Jg59
	QTfi+o/W9KRUN+dQMJmWe7S7efZALAVorSZ+cEMimbvG89KXzlbplzDf69TW5326gL+4
	2EoiaDvKbbYIf38SFhpy1cAprhKRYEk6pKBBwaEvHZ87Y2luKNSw3gWvbJcUb1WvQXS2
	NPTxG6kGVxOR0KtHX1G+wzRdlLkaq7jzkq2HPTu8A3RIN5+n/esUEaaJ/MzMoJsCHuPO
	uiJHpngE9VrUf7qoD9O0nrzkfHvtPizs8RSSklew2DSYZVni2uHxcZfC32TQN910XpqD
	ZCew==
X-Gm-Message-State: AG10YOSnEGmktgS0LML3H3yytegAEET+fiPbDKj3nQHaldScyDgw+dxx88CSWLGohS7ohA==
X-Received: by 10.194.82.68 with SMTP id g4mr33331115wjy.76.1455020472746;
	Tue, 09 Feb 2016 04:21:12 -0800 (PST)
Received: from localhost.localdomain (remote.biotector.com. [31.193.219.90])
	by smtp.gmail.com with ESMTPSA id
	w144sm17273771wmd.8.2016.02.09.04.21.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Feb 2016 04:21:11 -0800 (PST)
Sender: "Mark O'Donovan" <dfldashgkv@gmail.com>
From: "Mark O'Donovan" <shiftee@eircom.net>
X-Google-Original-From: Mark O'Donovan <modonovan@biotector.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 12:20:49 +0000
Message-Id: <1455020449-320-1-git-send-email-modonovan@biotector.com>
X-Mailer: git-send-email 1.9.1
Cc: Mark O'Donovan <modonovan@biotector.com>
Subject: [PATCH] udhcpc: specify full path for ip command calls
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
X-List-Received-Date: Tue, 09 Feb 2016 12:21:12 -0000

Running with a restricted environment (e.g. cron) was causing
issues as we check for the ip command with full path and call
without full path
---
 meta/recipes-core/busybox/files/simple.script | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 22168b0..e233c3c 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -28,8 +28,8 @@ case "$1" in
 		fi
 		if ! root_is_nfs ; then
                         if [ $have_bin_ip -eq 1 ]; then
-                                ip addr flush dev $interface
-                                ip link set dev $interface up
+                                /sbin/ip addr flush dev $interface
+                                /sbin/ip link set dev $interface up
                         else
                                 /sbin/ifconfig $interface 0.0.0.0
                         fi
@@ -38,7 +38,7 @@ case "$1" in
 
 	renew|bound)
                 if [ $have_bin_ip -eq 1 ]; then
-                        ip addr add dev $interface local $ip/$mask $BROADCAST
+                        /sbin/ip addr add dev $interface local $ip/$mask $BROADCAST
                 else
                         /sbin/ifconfig $interface $ip $BROADCAST $NETMASK
                 fi
@@ -59,7 +59,7 @@ case "$1" in
 			metric=10
 			for i in $router ; do
                                 if [ $have_bin_ip -eq 1 ]; then
-                                        ip route add default via $i metric $metric
+                                        /sbin/ip route add default via $i metric $metric
                                 else
                                         route add default gw $i dev $interface metric $metric 2>/dev/null
                                 fi
-- 
1.9.1


