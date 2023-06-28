Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E205C001DB
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:44 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.7310.1687919439474821719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vPd4GWLE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-668709767b1so3456765b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919438; x=1690511438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bF6rSfuryct1LXyx9d+KdEqlHeWemTF+/hL9HxjKGjE=;
        b=vPd4GWLEZ1eaBskwsxKqu9eoeAKJxJNX4uKB/HMOvguGRPZYJYtYmsUn9MvEUh1upt
         COl5wH7HrvOL1r3Tsgvbus2L923n6VTWDcTzxe3Xgt1D8XegURR8eT3CymolGwiYQu5D
         47l2/5iAb2IoMjUyyUZyfUpgz8/tBq23vUlJuH6HNEfNZZcm9bYGQYv7xkA1TaDaL6ZQ
         UZlO43Uq79ZjDF3eUNy1sO7sUPgWKwfHcgSp/Cpzziy+QGtS8HPOiRLpwNNVDhaWP5vH
         kV0KQ4LdXXrLNtX5N6i6RLfuoIDLTwJI9v8dOUXHLnmDZrrPvinUHL77lhIG4xJ4Zwge
         32Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919438; x=1690511438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bF6rSfuryct1LXyx9d+KdEqlHeWemTF+/hL9HxjKGjE=;
        b=LK4em9tNBM0/CecyjCCyiUAvsM2fY9hU66uuNLGCwuf2SoDRE3fCalX4ZcU/K5pcSu
         6SwgVrqb1LM20WoBcnJ/3JKXojuf98WNOg7peXYuqAOpxWSp81dqrs0a8CrxKqHvd9M+
         PD01QZz3ZGOzDyjzIMkfyLq/QjDPHRHuoeD3x751LYmO83Fdibx8zctG2Df+XC/qVpVn
         8D6vFMmsD2PaS468hIkTgJr5HQpR0VMin0U4l+cK3Z/gRzA1OT6mmd9RSGiDs66TxLA9
         l17errSxD6LpLegP+3cz3VxVbootuc1hBw3qbzTnRf3Yd/4H4JnwqBfJeoeuATBO8/Rc
         gDBw==
X-Gm-Message-State: AC+VfDziQQmkmqSSz64mNvTXmJwu79r9tHMJ4pWidZxNp4kmnCvI1RjS
	x5g7AAIJ1EoY/W7GL+pZv29xt6GodxD1IUynq1OIIA==
X-Google-Smtp-Source: ACHHUZ4n7YfQudtX/XXYwzK1RHoF/UYaEHjVvUt8fO+MLbCBqfW+HETz955apYL/54aYMWfy1aFJYQ==
X-Received: by 2002:a05:6a00:1a91:b0:66b:8d48:8e64 with SMTP id e17-20020a056a001a9100b0066b8d488e64mr13170584pfv.12.1687919438414;
        Tue, 27 Jun 2023 19:30:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 26/30] runqemu-ifupdown/get-tapdevs: Add support for ip tuntap
Date: Tue, 27 Jun 2023 16:29:42 -1000
Message-Id: <e448f9b292aba2bf344a69f32d62b107c18993e9.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183535

From: Jörg Sommer <joerg.sommer@navimatix.de>

The *ip* command supports the creation and destruction of TAP devices since
2009 and might be more likely installed on systems then *tunctl*. Therefore
it should be tried to setup or teardown the TAP interface with *ip* before
falling back to *tunctl*.

https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=580fbd88f75cc9eea0d28a48c025b090eb9419a7

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 424ede206baae1c228583aab1df6c18513ac104f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu-gen-tapdevs | 26 +++++++++++++++++---------
 scripts/runqemu-ifdown      | 14 ++++++++------
 scripts/runqemu-ifup        | 31 +++++++++++++++++++------------
 3 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index f2d6cc39c2..ffb82adce6 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -50,12 +50,6 @@ if ! [ $COUNT -ge 0 ]; then
 	exit 1
 fi
 
-TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
-if [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
-	echo "Error: $TUNCTL is not an executable"
-	usage
-fi
-
 if [ $EUID -ne 0 ]; then
 	echo "Error: This script must be run with root privileges"
 	exit
@@ -68,15 +62,29 @@ if [ ! -x "$RUNQEMU_IFUP" ]; then
 	exit 1
 fi
 
-if ! interfaces=`ip link` 2>/dev/null; then
+TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
+ip_supports_tuntap=false
+if interfaces=`ip tuntap list` 2>/dev/null; then
+	ip_supports_tuntap=true
+	interfaces=`echo "$interfaces |cut -f1 -d:`
+elif [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
+	echo "Error: $TUNCTL is not an executable"
+	usage
+elif interfaces=`ip link` 2>/dev/null; then
+	interfaces=`echo "$interfaces" | sed '/^[0-9]\+: \(docker[0-9]\+\):.*/!d; s//\1/'`
+else
 	echo "Failed to call 'ip link'" >&2
 	exit 1
 fi
 
 # Ensure we start with a clean slate
-for tap in `echo "$interfaces" | sed '/^[0-9]\+: \(docker[0-9]\+\):.*/!d; s//\1/'`; do
+for tap in $interfaces; do
 	echo "Note: Destroying pre-existing tap interface $tap..."
-	$TUNCTL -d $tap
+	if $ip_supports_tuntap; then
+		ip tuntap del $tap mode tap
+	else
+		$TUNCTL -d $tap
+	fi
 done
 rm -f /etc/runqemu-nosudo
 
diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index e0eb5344c6..f72166b32b 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -33,13 +33,15 @@ fi
 TAP=$1
 STAGING_BINDIR_NATIVE=$2
 
-TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
-if [ ! -e "$TUNCTL" ]; then
-	echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIVE', please bitbake qemu-helper-native"
-	exit 1
-fi
+if !ip tuntap del $TAP mode tap 2>/dev/null; then
+	TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
+	if [ ! -e "$TUNCTL" ]; then
+		echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIVE', please bitbake qemu-helper-native"
+		exit 1
+	fi
 
-$TUNCTL -d $TAP
+	$TUNCTL -d $TAP
+fi
 
 IFCONFIG=`which ip 2> /dev/null`
 if [ "x$IFCONFIG" = "x" ]; then
diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index bb661740c5..5fdcddeeda 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -41,22 +41,29 @@ USERID="-u $1"
 GROUP="-g $2"
 STAGING_BINDIR_NATIVE=$3
 
-TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
-if [ ! -x "$TUNCTL" ]; then
-       echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIVE', please bitbake qemu-helper-native"
-	exit 1
+if taps=$(ip tuntap list 2>/dev/null); then
+	tap_no=$(( $(echo "$taps" |sort -r |sed 's/^tap//; s/:.*//; q') + 1 ))
+	ip tuntap add tap$tap_no mode tap group $2 && TAP=tap$tap_no
 fi
 
-TAP=`$TUNCTL -b $GROUP 2>&1`
-STATUS=$?
-if [ $STATUS -ne 0 ]; then
-# If tunctl -g fails, try using tunctl -u, for older host kernels 
-# which do not support the TUNSETGROUP ioctl
-	TAP=`$TUNCTL -b $USERID 2>&1`
+if [ -z $TAP ]; then
+	TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
+	if [ ! -x "$TUNCTL" ]; then
+		echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIVE', please bitbake qemu-helper-native"
+		exit 1
+	fi
+
+	TAP=`$TUNCTL -b $GROUP 2>&1`
 	STATUS=$?
 	if [ $STATUS -ne 0 ]; then
-		echo "tunctl failed:"
-		exit 1
+	# If tunctl -g fails, try using tunctl -u, for older host kernels
+	# which do not support the TUNSETGROUP ioctl
+		TAP=`$TUNCTL -b $USERID 2>&1`
+		STATUS=$?
+		if [ $STATUS -ne 0 ]; then
+			echo "tunctl failed:"
+			exit 1
+		fi
 	fi
 fi
 
-- 
2.34.1


