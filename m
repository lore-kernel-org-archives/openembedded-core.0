Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F907EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 08:42:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.17033.1688632954402820894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 01:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=f6PLugw9;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso3226575e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 01:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688632952; x=1691224952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CN+SsSFQoQ95+aiPcG/+xSJwlM4N8YXB2L3yJNjHhkQ=;
        b=f6PLugw9ALn/9IKFE82IW5OTH9U08VRQvatb8G4BPVMBPa5YY59S5+5aJURtSFtxth
         hFqCBhMFiu897h5zCyjZtgtUg5Swm8coC+JorehxFoyGzANmLzXBDFk4IqMIGRhhryA0
         TWdiy38okoyw7vwoDTsf7EKQJ7nVooany5Wnvn0rm85v6Wh3cXd4lm3FvcBmYcMT+CIG
         tjhS+SyF9K2Lt3BsuuVRQFnFU+KxJvqosVEK7fPHkI2ri+GY17Yld366c4NCtfyuy+ho
         2mBOsxPIRtGHsL1xDSHBEPsgvXsUctWZV2uiecyTNR56eaOJ8kvtuZJnPHylYz0yilk+
         dhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688632952; x=1691224952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CN+SsSFQoQ95+aiPcG/+xSJwlM4N8YXB2L3yJNjHhkQ=;
        b=CTN+vQ7x6eU862qfApszW8nfOjHCNnJnbpjeYKXXyklNtKE2LgET6b5bgXiAjiVtgw
         pGFMsBowXBWgv4OEwDcO9g9FnmzQiHs+QEhXANxBoVkfH0Z6b9EQUx6eu0XgRuKPBlL6
         L3mzFs0PWbTAvu7ZqgVmaQJAvMslScGTqxxLEyV6sVjW1WKqZRadBNBf1SdpN5eI7l5v
         T+qrcRAVdk4Fg4ANsHxuLrQ7od+vvGVeb4W6y2UFW0eV3bqfQ8bmWO/xPw+tYv/Nbirx
         pooDRls3pWOCQGqpxWbohbVfbueDv2sOXjeX6zoGigr2FeEYltAuH4bVWKl+yQluXD8Y
         Eiow==
X-Gm-Message-State: ABy/qLZvtjVksrYjomiAPxSnvun1XK9tsIeXdwdWDOtwL+gXO7o4rJN8
	gRAOjp+wjR/fc160ZjW55bBS8piPzV4=
X-Google-Smtp-Source: APBJJlFCb3sW9VGoqi8nqs0IVITIOqSrO/FMdOYXkOHdPr3ufnGLrDw2DDA0nJeDZPbj+dyXBcQnog==
X-Received: by 2002:a05:600c:850a:b0:3fa:8c8b:716 with SMTP id gw10-20020a05600c850a00b003fa8c8b0716mr4451172wmb.1.1688632952334;
        Thu, 06 Jul 2023 01:42:32 -0700 (PDT)
Received: from localhost.localdomain ([77.243.43.130])
        by smtp.gmail.com with ESMTPSA id y10-20020a1c4b0a000000b003f91e32b1ebsm4429645wma.17.2023.07.06.01.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 01:42:31 -0700 (PDT)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [master][kirkstone][PATCH] cups: Fix missing installation of sysvinit scripts
Date: Thu,  6 Jul 2023 10:41:40 +0200
Message-Id: <20230706084140.778241-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183916

Configuration with --without-systemd causes the SYSTEMD_DIR to have a
value of "no"

cups configure test for, if SYSTEMD_DIR is empty to decide if the init
scripts need to be installed. A value of "no" results in that no init
scripts is installed.

Removing --without-systemd and just keep it empty result in an empty
SYSTEMD_DIR variable and the sysvinit scripts is installed as expected.
Though the cups configure script could be improved to work consistent
with "--without-*" options.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index d77758fd3f..865c14851c 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -46,7 +46,7 @@ PACKAGECONFIG[avahi] = "--with-dnssd=avahi,--with-dnssd=no,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[gnutls] = "--with-tls=gnutls,--with-tls=no,gnutls"
 PACKAGECONFIG[pam] = "--enable-pam --with-pam-module=unix, --disable-pam, libpam"
-PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--without-systemd,systemd"
+PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},,systemd"
 PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
 PACKAGECONFIG[webif] = "--enable-webif,--disable-webif"
 
-- 
2.39.3


