Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C00D66BBD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:12:17 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.64670.1732680727666560224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=veoXhggl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7f71f2b136eso5118218a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680727; x=1733285527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TT9ht49fM0Sh0yxYc/tnLG5X7KPDLQ4Hq8o0IGhc318=;
        b=veoXhgglAg6Hz6/U3Gpi6VR7byfscXlnH3rQHMhxz/alYJj6xwZrA8RO5KX6kk6uyC
         RZGTBZGvjmUlNrC+pUyf83hmSR+3lakb9n3jQPvLo1aJR25MrKUV3i6RX2Cp4KmI7ZLD
         +96V2Agc66jbGLmiDP4e3cmDoI/uku4e326hyTgoEAM099Cv5W2WkyHGZRIO4a5sgBND
         zJsW0StNG/4EGR9s8dYmgA3rOw/NbstOq8tUDL8H31Sx0os3ugfLhA/QJeoxfpekUdOK
         ibm8s66ItNSU/9fRCaZ+56ECUgZPffM3fz9SnL22HlQyht9cx3rbMJBR5dxaG43nm9JQ
         dWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680727; x=1733285527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TT9ht49fM0Sh0yxYc/tnLG5X7KPDLQ4Hq8o0IGhc318=;
        b=FNgU2goEmKvxVqO6obahxOC90WxlHZF1IyaLvEDhuL1Ck+w6ZEfyGNBX0wlD9Phd2T
         zxb+rrPQotqK4/fszle4pJI57EYdl2MVXqCA7n2O4103lno8hKNFT+ETcTEbKRzUNDJG
         R5mtaiB8z9z4BVj0qAr7OB5jtcE3RA8k6BvRmTBGjhtwub2lPBGthNPoDctY3w188ryM
         lVQqMTIa/wIxd21Y6H7FEXz+5sj5X62SL1LnILzvk9YIw0AEMJEYv4Udtwbc3fiXaZiA
         gt3cr4Ceb6Kfd7aVrf+iROwLYZ550Vu2v9rqVBQ6MZgFkeeM6Hlu9f6NOEXKxDJIhExI
         U00A==
X-Gm-Message-State: AOJu0Yz6KZc6yuizPDfu+Wo2oxaSYUiFHxLyQYGWoM8A+foxFXjyy32I
	QaDDLGMwoKT7aGL4UCf3kpwFgIhoFC/hyXZKb99HXOEI6Ojt7W50l+8/bKqHBGLWSYo/QXjiMF8
	m
X-Gm-Gg: ASbGnct1jJp9TsHQU36gcpISXFZBFyMjZzSpcTNx8oUeGClDtSI999oPZY3Hg5T6r7o
	WLRWAQAQEUUcY0azH0u+UyfMHf0/HiJ8JOkJEEtVIuM5vEncAmq2ZAW05BkC4FESbNjB15h71NC
	vjMlh9Ii7ge9wdqZpqyGI6Di1zqhNoHVU1EgVJbh7Nf5imAQgw5verHl8TSc9VX3+JIb3FkVkNe
	1juAspIkuO5dwj3RYeasvezQfcpcOxCKi1kiDk=
X-Google-Smtp-Source: AGHT+IHJtrH89g9qt7pz442k8cBMFdtD13KzmdpaucEMayP5O76Dlc6lqySYs+HQf2oQfxA9EAkQYA==
X-Received: by 2002:a05:6a20:6f0a:b0:1e0:d766:8da1 with SMTP id adf61e73a8af0-1e0e0c033c3mr2622435637.39.1732680726912;
        Tue, 26 Nov 2024 20:12:06 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.12.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:12:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 10/18] systemd: fix broken links for sysvinit-compatible commands
Date: Tue, 26 Nov 2024 20:11:30 -0800
Message-Id: <681e3d20c2ac16778e302b468ec278aed9562639.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207904

From: Yi Zhao <yi.zhao@windriver.com>

Since commit[1], PACKAGECONFIG[sysvinit] is not enabled by default when
sysvinit is not in DISTRO_FEATURES, which causes the following
sysvinit-compatible commands/services to not be built and installed:

  runlevel
  telinit
  rc-local.service
  systemd-initctl
  systemd-initctl.service
  systemd-rc-local-generator
  systemd-sysv-generator
  systemd-update-utmp-runlevel.service

Therefore, links to these commands/services should only be created when
PACKAGECONFIG[sysvinit] is enabled.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3668235fd60a9027608f37251c4b453ed21b3687

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a20b698f1acdee972cf1ff570b09a2e2c36bef1a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_256.5.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core/systemd/systemd_256.5.bb
index 68f15ab065..af810c0fcd 100644
--- a/meta/recipes-core/systemd/systemd_256.5.bb
+++ b/meta/recipes-core/systemd/systemd_256.5.bb
@@ -339,7 +339,7 @@ do_install() {
 	install -d ${D}${systemd_system_unitdir}/rescue.target.wants
 
 	# Create symlinks for systemd-update-utmp-runlevel.service
-	if ${@bb.utils.contains('PACKAGECONFIG', 'utmp', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'utmp', 'true', 'false', d)} && ${@bb.utils.contains('PACKAGECONFIG', 'sysvinit', 'true', 'false', d)}; then
 		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/graphical.target.wants/systemd-update-utmp-runlevel.service
 		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/multi-user.target.wants/systemd-update-utmp-runlevel.service
 		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/poweroff.target.wants/systemd-update-utmp-runlevel.service
@@ -841,7 +841,9 @@ python do_warn_musl() {
 }
 addtask warn_musl before do_configure
 
-ALTERNATIVE:${PN} = "halt reboot shutdown poweroff runlevel ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
+ALTERNATIVE:${PN} = "halt reboot shutdown poweroff \
+                     ${@bb.utils.contains('PACKAGECONFIG', 'sysvinit', 'runlevel', '', d)} \
+                     ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
 
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
-- 
2.34.1


