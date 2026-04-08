Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D96FD5F91
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 07:43:46 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.101260.1775634225013826631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 00:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZIeya6pe;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ce7d6fd2c5so303435eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775634224; x=1776239024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yz2jNQ3h6GPyfVNXEoCotFZ+NFUO7eRq9dfIOUfOaB4=;
        b=ZIeya6peIsLz9ZmyTSApHY34m+ig2iMfKiXCGxKUmpXChiPZx6TQLjY59xPxb7BDNQ
         X1oSloIkuOaS3dUaQveCKCPlZa7WK7m9U4SqiM+hFrv3X9CIoOEZVr8X8OKbI/0RzdKR
         dKkmlm37MXBhYetHoINLIFNhUo8Y+N6vp2w3pkE0qTWqQSe/EneUQjSgO6MibmVFbdVe
         V+OOuhjUBKPININ7MlzqVFnrZCuHS4r3s/P+1A1zBKSlEW0YL6AsThOU9HoKw7Y9pWtu
         NtNs6UXHPWyae/ODTKRoGUKuppeAmNtv8LUbxpcnXdTftLc7R8/no8Tm2ynEG33LPh6D
         0ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775634224; x=1776239024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yz2jNQ3h6GPyfVNXEoCotFZ+NFUO7eRq9dfIOUfOaB4=;
        b=JjffnMhg4hR5Jpglx4ZoTsF1PBtIgFIafzpP2AaKuJCwJAy0Tmk5Hq1r8iRnELwGNq
         bs4bt78J3gl4zx8bKDAQG1shebJVNucseVPfH1jlF8ei1Stscn3Aht07YwuHNAGt4BIv
         vpHfCjRopp1ZifkdmZbMptBd+mJhGHb2+iIdgfGA5q/ifKk9ALPNe8Kq3WkQ33TpHMQH
         oukdFENKD48EVDPJrZqe/Jc/YbHGGtUNrhB85mqKlYLQOM/7wkqCn7a4s5avqMYktQW0
         /WQeDaeKkdUsgr01gaAIztwfG279c+ZIeYZsl/6dIhT0egnRAlfi7H/jc2WdlK2s4Ux+
         B5Rw==
X-Gm-Message-State: AOJu0Yy8ms7R+AjVTxk2DHxoT5qVJKmcdRAG5gHvP7VVesBXOs7vf+sP
	vtfv0xmCno9G4RFJxNIX4nxYUdW7orlQKbPpCcLNBAKvRMfXzK5MZ+CP3ajGUlpX
X-Gm-Gg: AeBDiet0XYe2B64M0L0dvTEJS3fNLs4W1kBgeRG86B4bHmTxdO4X32W2prdgl5N7znh
	AeYicG9Ddr+DgYasCfh2M52Kw3b+A0xPYdwbXS5oPTGRL/qOstw7DB/sU2vjPEHF2xsrLlHRggl
	249NCzdi8KvRRVAuXlVvqCM0DopDJtT7/VJLmWsW1SxjR0xJjv6zjVyisRou6T2m5fZoup0U6k4
	u/csXhMI1mrQGZuZVJmKCnHW/qYj3JjX/UFvno+IKQfi9n0f6u3qnjiAjO6YA/4dFxI1uclVo3Y
	+vhFEmkkGVCt7PrvW3KdLPuYvOx4QZi/tgTFlkWWrgl8xVisoMoQ7JNc5SClmry6UyEFc6wpPfv
	jgNAIGJqVJZFrDu4hduZLjXU9hAvOdEAU2oH6L15GOElDa3K8aQbgdYvF+C1TyjjqmS1o/GeACJ
	hCY25Kb+q9s7kmFszXaOMhFYIoGXLphjUinIPXEYix7GVQjhbYFb8a1iwntfEZ3KqIK75QtTmNn
	+Dd6JK/lIzY0h+2XFrWTrjeDhQBNXrA+uTvFdpDJe6f/WxCQDqlFQhsIBaI
X-Received: by 2002:a05:7301:2b06:b0:2c6:1b92:1cee with SMTP id 5a478bee46e88-2cad9064912mr9759635eec.21.1775634224057;
        Wed, 08 Apr 2026 00:43:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm25349905eec.2.2026.04.08.00.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:43:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] rsync: Add packageconfig to use system zlib
Date: Wed,  8 Apr 2026 00:43:41 -0700
Message-ID: <20260408074341.1412637-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 07:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234816

Enable using system zlib by default, avoid copies
and duplicate builds

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/rsync/rsync_3.4.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 6de30d337d..2e4f9af311 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65f
 # Doesn't use automake
 inherit autotools-brokensep
 
-PACKAGECONFIG ??= "acl attr \
+PACKAGECONFIG ??= "acl attr system-zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 
@@ -33,6 +33,7 @@ PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[xxhash] = "--enable-xxhash,--disable-xxhash,xxhash"
 PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
+PACKAGECONFIG[system-zlib] = "--with-included-zlib=no,--with-included-zlib=yes,zlib"
 
 # By default, if crosscompiling, rsync disables a number of
 # capabilities, hardlinking symlinks and special files (i.e. devices)

