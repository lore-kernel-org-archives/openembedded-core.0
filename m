Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7639C35FF3
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:37 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.4770.1741809394220825772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VSjBRVsp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so2522586a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809393; x=1742414193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7uGmV81eLBKCxePPBXK7iojRz9BU4UStlYEf5THvtg=;
        b=VSjBRVspSFk0cvqN+3dkXnPnc5i9d//PkJoAmrN2bLeNkg+3SrIPDqeJ4UNqPM6lFE
         FltSZnrBHqWz3JNZ6kU8y70jDwxHYxmlLWvzagMmnbFTotF9OKwNTOsBcq4zD8OVZ+fi
         CMJ3DZNRvaVCR0kQ/3F8WbdKDIF4wwlAj8ETtag4HLk37Lnp78uC+d0M4Y2uqyiZvVfm
         5J+vfBujM36rScgjY8II88yyIQXVxkK3w4JtVfuhVlpvWluseR/YuDLn/ZptQzIygVNK
         HkHiYaaAaTD0WcLGmHpCcTGOyEi5qxw//6gjf+eEjcrhovUoD86cVk86WJrj2ffnj51n
         O5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809393; x=1742414193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7uGmV81eLBKCxePPBXK7iojRz9BU4UStlYEf5THvtg=;
        b=Z1uBXEItGEZLPHU8bhl/VwvTwFaPdIcx3+R9jizQGgXzY+EloBfm7Y2LS8WpOdZsZz
         UWc9MACqve9SAq5ZVJo3GwSbvtFzSrmC9ReYan07UE4E4ycQcYnPQkmyLWskjzDtTtgZ
         VXBuQOK/20PIoJZnxp2+xRbMMzR+15zJbsXNlo2ioM+OpWrRPWYFKUBMrO0+rraWYEK0
         LwXDkE5UAzZV9zDQEWsnVzSyOSZ1WQ7xIpcS15envgOo6mm26JM8wOXGkdjaOOd7bVtK
         YwL+7wdXmCubflJHiY2LJAJ3zJ+g41xDiaWdLBFKQbUTFqrcwR6sJzrA5umAOBUXU0Xi
         SOUQ==
X-Gm-Message-State: AOJu0Yz4IWZqDsiRWTaj5E9YOUOKKTNW+XriBB1dli7tH7YHlhEEVB17
	m3KlYw1TNNV/0/qACnN83h/C6ocENXAcVH7JMJsSNY+INfxg9F5E5yAWgjbvZK2OB4soYkzMv/e
	w
X-Gm-Gg: ASbGnctWMbxFqEXaWVn29LfCJOboQIA0Qjg1CBP1RONyPAuX6sbjCp8m9sESZ6n6XFS
	8R6EyaTQttWFiPMw0ABgXvQ0uD6r/oMRsFEMVVFrg6bENjQViuza2z9Q2no7KYy7ZjTgyinwpJq
	ZmbDvhQ+Icr8hgbu4zSVcpDTZNVeYbZNSIa7JROkGfjwrCUZL8AY6wO7kpDh+NUzCU7wmS58mGJ
	8RvLvpd6ZhuwgUMtGTSjrEGSgIXZpc1tuDzl5UzLGijszPvYUdCDDkuOiAGwCGJApmyrbrv2oFz
	pdAFVyv6ayh7cTQQ+USA6e5mBmsQtpATQ58=
X-Google-Smtp-Source: AGHT+IHK/ijXVkE7DANorBP+Ay47qutG2m360uwD04H08BQT7G69Vd3WscxfFezRt5vHP0N5opStPg==
X-Received: by 2002:a05:6a21:483:b0:1db:822f:36d8 with SMTP id adf61e73a8af0-1f5ad77d725mr1427690637.3.1741809393431;
        Wed, 12 Mar 2025 12:56:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/28] xserver-xf86-config: add a configuration fragment to disable screen blanking
Date: Wed, 12 Mar 2025 12:55:45 -0700
Message-ID: <bb16526a4a0c39b6c156edbf68c7377bfdfa0bd1.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212718

From: Ross Burton <ross.burton@arm.com>

Add a configuration fragment that disables screen blanking, and add it
to all qemu machines.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 780a5ccaa51d5aed18200883a686387e70847e4b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-xserver/xserver-xf86-config/qemuall/noblank.conf  | 7 +++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bb                | 6 ++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuall/noblank.conf

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuall/noblank.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuall/noblank.conf
new file mode 100644
index 0000000000..9d40a9599a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuall/noblank.conf
@@ -0,0 +1,7 @@
+# Disable screen blanking
+Section "ServerFlags"
+    Option        "BlankTime" "0"
+    Option        "StandbyTime" "0"
+    Option        "SuspendTime" "0"
+    Option        "OffTime" "0"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 03f14cef2b..841d931e82 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "file://xorg.conf"
+SRC_URI:append:qemuall = " file://noblank.conf"
 
 S = "${WORKDIR}"
 
@@ -18,4 +19,9 @@ do_install () {
 		install -d ${D}/${sysconfdir}/X11
 		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
 	fi
+
+	if test -s ${S}/noblank.conf; then
+		install -d ${D}/${sysconfdir}/X11/xorg.conf.d
+		install -m 0644 ${S}/noblank.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
+	fi
 }
-- 
2.43.0


