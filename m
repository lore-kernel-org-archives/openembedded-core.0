Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D1AC021A0
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 15:06:06 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.10479.1739631964508637839
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 07:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G0VPVsiX;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f3ac22948so63014f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 07:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739631962; x=1740236762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9B8djhcjdREWtvByCoOqlG5OIFNiFnEqsMvMp410qFQ=;
        b=G0VPVsiXPKTLD8LyxCweEKeyd1Mbw0Qx4uHzeLKUPXNTxbwdwVXhIeM2XYHaeI940n
         AQTATiCkQhtr4NfY4DzTL1D9pXMEeUTik+hFeLgY5csWTYgk6nlpnauZZAYI5ujqCkUo
         ecAeyvNdz3wDx95WBlpZsO7wA5IKHSERoFN/VWMv+pcAOkfAO5WrswzR4QPwMRZYEFrQ
         0YNhGtF0AqRbvpRy086u0Qp8ZQJ2t8eyf1vH9sspL/GlrcNmKV+Oqlo0iNp39si8fZ8e
         IGRmW+UbsObt3G6SgF7lFKoFGeBdSCNI/OWDgkDbZR16xlCsSSlP9OfjeaftKqWKkKZ/
         xsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739631962; x=1740236762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9B8djhcjdREWtvByCoOqlG5OIFNiFnEqsMvMp410qFQ=;
        b=wi4lwIipsKJvesDQUn2fgcOgEhtluz+39PvRo+Jun5Zy+vfX3nTUnXyYIiFGU6wTzz
         dY8I/U7jpj2rkpQ4gVMXOVhOEDtyhwsJ4Qr0iGYtlgWYy6AXtH6nwKRz47mTtmO54XBJ
         S0QFwsMV7JOqibl/p08iLBwjhIGB7FgPH9OkOnDgQK5Io3mzg7jHW/4Exd+/HWr6nDLo
         Ts9u+NpZHgxnfrcyR+GBjY0QjVGsWDz/KAIbzf9kXacPEFp5fUQfE6ECZx8SJlh79+Bh
         EBhRse+XurqUpR1+sD+LwLerqkCe1BzZZyBYA8SaUkwNKE8PzCePQ0vbbIxNiYeAHIJE
         eRdg==
X-Gm-Message-State: AOJu0YwRbAgnHiMNAlqo8IDSUpfKzQM5OQIxLFSpH1jLRBxWfcA2Jaxe
	8zuW8HslD6lQIPoZQsqgIffaysyfgSHScglmJaR4JseV9nFtTqlwWrsmXai9
X-Gm-Gg: ASbGnctwRwDqC0S6OpUhRsJNUlHzL7TpfxeHNO9dkWH/lKp1J4Mxa/c0pNB7pqkBkf1
	tYzeKfGrMUn1RHNfXDTsudcpsFOFs0W5n6uoVtbSS45C5tOjYkJEK2Le5hiYk6eHrGRx2cw5vzD
	G8nHN69v7TDv61vQMMm34FoWT6rkpWcZjaV44Bp3QhWfEgYzWJLSUrJ2b1k3ymKP3HttP1vrHGo
	cwxjA+A8Ib7bKEJ4sn1cu+Ib9oH7TwOpCID+yJ/aGflgnf/YgcA6LuYUPKzs9ugySMFFupyGnET
	z83hMCkiias2Hb6vI1yCsiRQug/hI3JmLb0tCeAcrwCqLYuDinJoTLNGSQ==
X-Google-Smtp-Source: AGHT+IGwl7nHL1/p8p4Q9l8mCKYnxEljadJN1NFW5o8jY/IgDNnw+Ey7uuKjwqgDNUamLyL4xXhjPw==
X-Received: by 2002:a05:6000:1561:b0:38a:888c:679c with SMTP id ffacd0b85a97d-38f33f52fd8mr4340716f8f.42.1739631962386;
        Sat, 15 Feb 2025 07:06:02 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccda0sm7450038f8f.27.2025.02.15.07.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 07:06:01 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core] packagegroup-base: Add option to set zeroconf provider
Date: Sat, 15 Feb 2025 15:05:17 +0000
Message-Id: <20250215150516.1168-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 15:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211488

avahi, systemd-resolved and mDNSResponder (in meta-networking) can all
provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
which of these will provide service via packagegroup-base-zeroconf.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index cb9d1f07af51..c172250a4322 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -312,11 +312,14 @@ RDEPENDS:packagegroup-base-nfs = "\
 RRECOMMENDS:packagegroup-base-nfs = "\
     kernel-module-nfs "
 
+# Choose 'avahi-daemon', 'mdns' or 'systemd-resolved' as zeroconf-daemon
+ZEROCONF_DAEMON ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd-resolved', 'systemd-resolved', 'avahi-daemon', d)}"
 SUMMARY:packagegroup-base-zeroconf = "Zeroconf support"
 RDEPENDS:packagegroup-base-zeroconf = "\
-    avahi-daemon"
+    ${@ '' if d.getVar('ZEROCONF_DAEMON') == 'systemd-resolved' else d.getVar('ZEROCONF_DAEMON')} \
+    "
 RDEPENDS:packagegroup-base-zeroconf:append:libc-glibc = "\
-    libnss-mdns \
+    ${@bb.utils.contains('ZEROCONF_DAEMON', 'systemd-resolved', '', 'libnss-mdns', d)} \
     "
 
 SUMMARY:packagegroup-base-ipv6 = "IPv6 support"

