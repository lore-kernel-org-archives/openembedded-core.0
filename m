Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938FDC001B0
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:44 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.7398.1687919437798112028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ux+Fbe9s;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-666ecf9a081so4828308b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919437; x=1690511437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+fDxXb5SoCqwGOXmf0oGe7+kcB14k0CsjrdHN5Zd30=;
        b=ux+Fbe9s2CnQSxK5yT1jh8jda42PvI43M7d4f3gtbWW+/5HHKCLtU6os3gElkukQjU
         a4/o7CZz+GHf5z1+mHVIf5dvDuqSEBi+DF9v++ESgVbUVAZrMWwy2ITyI/u5lpeXcxx0
         zFFV3E+ETOubpaHXs2GNw+BGPPTSK0Dm4i+IwFcm+KjJ7h4AnZwsvYwgPJSTrgN2dlYk
         hb28GiS/aMkk7YqcjcBmXKI3abIAUrDE7VGzASnwiF0jNQiwmVupYMfp+XP6oalQoR9j
         LVGa4ou2PXS3XEABPQLxfI5fQVqSJjhPgY6oONqY9wmSsFslVrNCPx9H/+u/d7+fB/HW
         nRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919437; x=1690511437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+fDxXb5SoCqwGOXmf0oGe7+kcB14k0CsjrdHN5Zd30=;
        b=EHcOcDnFtBSZ/ygy6f9vabeEYcp7Vf9lFJIGHRYD+KOyPwc5j3t1JWAq91vFWvlivg
         MHiO6RvnAWn8lPcmy6ZHdh8I3aoswFT/HK+SNfvCLEAOE8IvQWFUqEj1r/Z/KrFq40Sg
         zbuqM3mw57Sztg6Q9LFg5ACmkOL5Bgl/Fbx0kAw0WlmKR0yahN9K3U8K5p1F92I+F9LU
         XR23dyOVTHT6OTNvua5tlDRDfjtpZWSeJ/7sIyKNHMb4Uqf2XDKC8wbaL2kNhMWRIVBJ
         90mca3B5S7LlpeVCN6APRfYRkernDW27SZ/JThDE2Gp4tvo30HQW59acmW7pThX+FTRG
         Z2mA==
X-Gm-Message-State: AC+VfDxJmMsDiDV6wHEBKsj+lqVBdrL/yAn8Mr/qawW51IFe/15sSkhb
	MMMlDWwKqlUGOJWRcjvAncgWrVsPeLzyRb2b4lPmvw==
X-Google-Smtp-Source: ACHHUZ4Niw9rtUVx1Nn3UKYA9d/dZ1xdkVT7UIXK3vUE4kUrZh4p5pFzdLBKW1lNxoqJeNCWMAgzCQ==
X-Received: by 2002:a05:6a00:10d5:b0:666:e42c:d5fb with SMTP id d21-20020a056a0010d500b00666e42cd5fbmr37833596pfu.32.1687919436843;
        Tue, 27 Jun 2023 19:30:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 25/30] runqemu-gen-tapdevs: Refactoring
Date: Tue, 27 Jun 2023 16:29:41 -1000
Message-Id: <3f6dacac5f8fb3c4b6b61b3fa125372c8f044795.1687919241.git.steve@sakoman.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183534

From: Jörg Sommer <joerg.sommer@navimatix.de>

The changes are mostly about early exit which causes indentation changes;
check with `git diff -w`. Another change is the check for ip by simply
calling it and deciding upon the exit code, if it's fine or not.

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 351577761d0712a005eda9dde9215558ca9a1fe9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu-gen-tapdevs | 75 ++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 39 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index a6ee4517da..f2d6cc39c2 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -44,6 +44,12 @@ GID=$2
 COUNT=$3
 STAGING_BINDIR_NATIVE=$4
 
+# check if COUNT is a number and >= 0
+if ! [ $COUNT -ge 0 ]; then
+	echo "Error: Incorrect count: $COUNT"
+	exit 1
+fi
+
 TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
 if [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
 	echo "Error: $TUNCTL is not an executable"
@@ -62,48 +68,39 @@ if [ ! -x "$RUNQEMU_IFUP" ]; then
 	exit 1
 fi
 
-IFCONFIG=`which ip 2> /dev/null`
-if [ -z "$IFCONFIG" ]; then
-	# Is it ever anywhere else?
-	IFCONFIG=/sbin/ip
-fi
-if [ ! -x "$IFCONFIG" ]; then
-       echo "$IFCONFIG cannot be executed"
-       exit 1
+if ! interfaces=`ip link` 2>/dev/null; then
+	echo "Failed to call 'ip link'" >&2
+	exit 1
 fi
 
-if [ $COUNT -ge 0 ]; then
-	# Ensure we start with a clean slate
-	for tap in `$IFCONFIG link | grep tap | awk '{ print \$2 }' | sed s/://`; do
-		echo "Note: Destroying pre-existing tap interface $tap..."
-		$TUNCTL -d $tap
-	done
-	rm -f /etc/runqemu-nosudo
-else
-	echo "Error: Incorrect count: $COUNT"
-	exit 1
+# Ensure we start with a clean slate
+for tap in `echo "$interfaces" | sed '/^[0-9]\+: \(docker[0-9]\+\):.*/!d; s//\1/'`; do
+	echo "Note: Destroying pre-existing tap interface $tap..."
+	$TUNCTL -d $tap
+done
+rm -f /etc/runqemu-nosudo
+
+if [ $COUNT -eq 0 ]; then
+	exit 0
 fi
 
-if [ $COUNT -gt 0 ]; then
-	echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
-	for ((index=0; index < $COUNT; index++)); do
-		echo "Creating tap$index"
-		ifup=`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATIVE 2>&1`
-		if [ $? -ne 0 ]; then
-			echo "Error running tunctl: $ifup"
-			exit 1
-		fi
-	done
+echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
+for ((index=0; index < $COUNT; index++)); do
+	echo "Creating tap$index"
+	if ! ifup=`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATIVE 2>&1`; then
+		echo "Error running tunctl: $ifup"
+		exit 1
+	fi
+done
 
-	echo "Note: For systems running NetworkManager, it's recommended"
-	echo "Note: that the tap devices be set as unmanaged in the"
-	echo "Note: NetworkManager.conf file. Add the following lines to"
-	echo "Note: /etc/NetworkManager/NetworkManager.conf"
-	echo "[keyfile]"
-	echo "unmanaged-devices=interface-name:tap*"
+echo "Note: For systems running NetworkManager, it's recommended"
+echo "Note: that the tap devices be set as unmanaged in the"
+echo "Note: NetworkManager.conf file. Add the following lines to"
+echo "Note: /etc/NetworkManager/NetworkManager.conf"
+echo "[keyfile]"
+echo "unmanaged-devices=interface-name:tap*"
 
-	# The runqemu script will check for this file, and if it exists,
-	# will use the existing bank of tap devices without creating
-	# additional ones via sudo.
-	touch /etc/runqemu-nosudo
-fi
+# The runqemu script will check for this file, and if it exists,
+# will use the existing bank of tap devices without creating
+# additional ones via sudo.
+touch /etc/runqemu-nosudo
-- 
2.34.1


