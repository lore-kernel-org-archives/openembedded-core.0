Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDE9EB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 20:59:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.29851.1686862735067114657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 13:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=StBbe/Ge;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f8d0d684f3so22716235e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686862733; x=1689454733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv9fGKcfv8laldyDDY7a1g0Y/M7wMsxlDvckQHOZpD8=;
        b=StBbe/GeQ+0ylgoJcwUWWKOPL2FH9ys9L5oOtP0Gq0cAEU2O41hgqhq1CI23ipg5pt
         c0ldHeXWQRWbqGtYLPVTDkeouUtC5q8ogTaalyYHToeViyYm5YmqKmuXZDzCsPe0YUyz
         71tuzK6nF8/LfF6/bfXxBaHuwPFD+v1YM08tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686862733; x=1689454733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bv9fGKcfv8laldyDDY7a1g0Y/M7wMsxlDvckQHOZpD8=;
        b=fGl3n2hgHD4MBL8HFbwwg1rLvd0/spRGDE6bDJH/Buen2D6mNiLQFU07/EemRS72Jr
         79OogR34ofxLoE2BEkKGJxBzvtIzfgidkMfoS2xdFStIWYszm1F36wKGr1Od2IoyuOyJ
         s4DivPRr+7BLW1MAJXXbSdRwfirRbNfaYGt8AXnMFFsLpA9Z++9ceE0buH1Yi/XrEavc
         rzBvbzPYlXDlSR9J5JPDwKbQU9xAPZbju4XuVfwCnlzCgfpaR/JXwh/EE95J9p2BG1vG
         efDtQ/2aAWiDe8xFm+BX+cYMf6sl3PWhPT7SdNzzGQYjfzfsTmqE+ggmsAFDqcslqRCF
         xQkQ==
X-Gm-Message-State: AC+VfDzvyH/yW7IRCCp/CANL69Qg6W4ConvFe831MLp6910CSh35+XxG
	F3IGRA3qx7A8YP9jmUuRjlLiNEETXUrKB8js98c=
X-Google-Smtp-Source: ACHHUZ4DLVbXPgMWnCZYmRD3l41eS+F3F6PSCWdqq/cQ3dMzGP1OO9lShBe7bC2+asuOguqemKpCgg==
X-Received: by 2002:a05:600c:3783:b0:3f4:28db:f5ff with SMTP id o3-20020a05600c378300b003f428dbf5ffmr203339wmr.35.1686862733168;
        Thu, 15 Jun 2023 13:58:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b814:609:2b03:c353])
        by smtp.gmail.com with ESMTPSA id f19-20020a7bcc13000000b003f8d0308616sm186125wmh.32.2023.06.15.13.58.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 13:58:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] runqemu-if*: Rename confusing variable name
Date: Thu, 15 Jun 2023 21:58:51 +0100
Message-Id: <20230615205851.1476699-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615205851.1476699-1-richard.purdie@linuxfoundation.org>
References: <20230615205851.1476699-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 20:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182875

The IFCONFIG variable is really the path to ip and hasn't been
ifconfig for a long time. Rename the variable to something less
confusing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu-ifdown | 12 ++++++------
 scripts/runqemu-ifup   | 16 ++++++++--------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index 98ac7f07b34..78be28812d4 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -37,14 +37,14 @@ if !ip tuntap del $TAP mode tap 2>/dev/null; then
 	exit 1
 fi
 
-IFCONFIG=`which ip 2> /dev/null`
-if [ "x$IFCONFIG" = "x" ]; then
+IPTOOL=`which ip 2> /dev/null`
+if [ "x$IPTOOL" = "x" ]; then
 	# better than nothing...
-	IFCONFIG=/sbin/ip
+	IPTOOL=/sbin/ip
 fi
-if [ -x "$IFCONFIG" ]; then
-	if `$IFCONFIG link show $TAP > /dev/null 2>&1`; then
-		$IFCONFIG link del $TAP
+if [ -x "$IPTOOL" ]; then
+	if `$IPTOOL link show $TAP > /dev/null 2>&1`; then
+		$IPTOOL link del $TAP
 	fi
 fi
 # cleanup the remaining iptables rules
diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 237bf2a07b8..bbd624596ed 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -47,13 +47,13 @@ if [ -z $TAP ]; then
 	exit 1
 fi
 
-IFCONFIG=`which ip 2> /dev/null`
-if [ "x$IFCONFIG" = "x" ]; then
+IPTOOL=`which ip 2> /dev/null`
+if [ "x$IPTOOL" = "x" ]; then
 	# better than nothing...
-	IFCONFIG=/sbin/ip
+	IPTOOL=/sbin/ip
 fi
-if [ ! -x "$IFCONFIG" ]; then
-	echo "$IFCONFIG cannot be executed"
+if [ ! -x "$IPTOOL" ]; then
+	echo "$IPTOOL cannot be executed"
 	exit 1
 fi
 
@@ -67,13 +67,13 @@ if [ ! -x "$IPTABLES" ]; then
 fi
 
 n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
-$IFCONFIG addr add 192.168.7.$n/32 broadcast 192.168.7.255 dev $TAP
+$IPTOOL addr add 192.168.7.$n/32 broadcast 192.168.7.255 dev $TAP
 STATUS=$?
 if [ $STATUS -ne 0 ]; then
     echo "Failed to set up IP addressing on $TAP"
     exit 1
 fi
-$IFCONFIG link set dev $TAP up
+$IPTOOL link set dev $TAP up
 STATUS=$?
 if [ $STATUS -ne 0 ]; then
     echo "Failed to bring up $TAP"
@@ -81,7 +81,7 @@ if [ $STATUS -ne 0 ]; then
 fi
 
 dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
-$IFCONFIG route add to 192.168.7.$dest dev $TAP
+$IPTOOL route add to 192.168.7.$dest dev $TAP
 STATUS=$?
 if [ $STATUS -ne 0 ]; then
     echo "Failed to add route to 192.168.7.$dest using $TAP"
-- 
2.39.2


