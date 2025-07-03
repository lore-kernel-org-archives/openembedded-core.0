Return-Path: <louis.rannou@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18003C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 12:14:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.web11.20983.1751544881359308967
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 05:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fkpVNfwv;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+louis.rannou.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39E5561142;
	Thu,  3 Jul 2025 12:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D586AC4CEF5;
	Thu,  3 Jul 2025 12:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751544879;
	bh=mtAoTDeEKpjes3ZqDLojD/oiAQJmDUJqfOQHOZvaEew=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fkpVNfwv8jYYi0OYyacO250px/udHTvnT8qQf1g3c0v+ufxJ+kmBkem4v+p20zyLj
	 deV98vQ91j0nmdXLdsEQiX6VcTYT2b2wdZn5sLOT0nEhUZr4ZTAndr8pDBgHXhsv4Q
	 v/Fzq3dFM0m9QlCYrQU3Awm0tnDk6o+Q3CrS0sm3hG2zyrRiq50byUVsX/XsUXYJSD
	 ozfCMrR4NtYTOskWGvWstBk9+xKLtNIYvCX/wu+cLQV8iWgHCppv0eUDrsjuap+YOg
	 IcUFtqtRVEw0YSgxX0+d8IgRVYi4tikeS/UtR36KAy0mSb4FgfzrcQxqIv/emRrPWm
	 lBrlPMZjXl/Jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A31C83F03;
	Thu,  3 Jul 2025 12:14:39 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Date: Thu, 03 Jul 2025 14:14:36 +0200
Subject: [PATCH] openssh: limit read access to sshd_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-sshd_perm-v1-1-f92e5fbb18c7@non.se.com>
X-B4-Tracking: v=1; b=H4sIACt0ZmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNj3eLijJT4gtSiXF0z42QLEwPzNEszozQloPqCotS0zAqwWdGxtbU
 ATVsoOFsAAAA=
To: openembedded-core@lists.openembedded.org
Cc: pascal.eberhard@se.com, Louis Rannou <louis.rannou@non.se.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751544878; l=1954;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=MWC55oMq0pjTiIOMWdI0f51vNbs/kU196thLmSduxzk=;
 b=moAZvwR50+72UCDA3DbXm/eCJbbdO4jxGYDNA29Ok6ql7i0mHM4a/9xvWktnwhbQWcwc6t1zO
 9kKSvR6Ls03CCCr8vwVKcLrKzKZWL9Ev167Xmkaah2FxNP8n0r9+J+0
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 12:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219877

From: Louis Rannou <louis.rannou@non.se.com>

Enhance security by limiting read access for /etc/sshd_config to user root as it
may reveal unsecure configurations.

Reading access is limited in the install append as the default value 0644 is
hardcoded in the openssh makefile and is not configurable. Therefore the
permissions are modified in the install append.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 meta/recipes-connectivity/openssh/openssh_10.0p1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.0p1.bb b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
index a044aec063..2f446b5540 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
@@ -102,7 +102,7 @@ CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
 
 do_configure:prepend () {
 	export LD="${CC}"
-	install -m 0644 ${UNPACKDIR}/sshd_config ${B}/
+	install -m 0600 ${UNPACKDIR}/sshd_config ${B}/
 	install -m 0644 ${UNPACKDIR}/ssh_config ${B}/
 }
 
@@ -153,9 +153,12 @@ do_install:append () {
 	install -m 644 ${UNPACKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
 	install -m 0755 ${S}/contrib/ssh-copy-id ${D}${bindir}
 
+	# Limit sshd_config access to the owner (default is 0644)
+	chmod 0600 ${D}${sysconfdir}/ssh/sshd_config
+
 	# Create config files for read-only rootfs
 	install -d ${D}${sysconfdir}/ssh
-	install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
+	install -m 0600 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
 
 	install -d ${D}${systemd_system_unitdir}
 	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','true','false',d)}; then

---
base-commit: 77a93e8cf1da4231341c56f64f9d4d474f9f2bb7
change-id: 20250703-sshd_perm-63c8407f962f

Best regards,
-- 
Louis Rannou <louis.rannou@non.se.com>



