Return-Path: <clopez@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D26CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 13:56:57 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71162.1781272606005257378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 06:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=Sj5varjv;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: clopez@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Sc6Yl+o0bfcSQ5EC6JoINAv9HtGrrHGHRm46nvW9jBc=; b=Sj5varjvrHZbzL3H1M8ZLUfE8D
	S78RFCmuuJ4JhbPPBv0focBmupOmcMkchJgIBROKA5vYTjPKd7j5d2AUw+RvpxVxt7JVfulGfyp4t
	V3CUlVt5Do7GCYup0Q4hgpGzIQntZTuPAAD35vnJ1SyBJ11jb54EpCpHQBACldgXQCdsQZR++XlCA
	RuZp8Xzc+xaIA5nH1y+MZkw/i1ZjTY49qlVI/Wgk2JgFhahVnV+H/HT1+Xdl2hlipKLYeCKSWpUsf
	wccaV8IkLKyoNX1TSzFN/HO4aPLj2wGDlQ4fi9PQZYnuaWkS/XPdvqKbHU0qX+lfde2ptp83si8bo
	SvmFTgfg==;
Received: from bl12-233-116.dsl.telepac.pt ([85.245.233.116] helo=trinity.bot.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wY2NH-00Gcu9-2d
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 15:56:43 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd-conf: make KillUserProcesses configurable via PACKAGECONFIG
Date: Fri, 12 Jun 2026 14:56:41 +0100
Message-ID: <20260612135641.391245-1-clopez@igalia.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 13:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238621

The logind.conf config snippet installed by this recipe unconditionally
sets KillUserProcesses=yes, so logind terminates the whole session scope
when a login session ends. Among other things this kills detached screen
or tmux sessions on logout, which is surprising on interactive development
images, and there is currently no recipe-level way to turn the policy off.

Add a 'kill-user-processes' PACKAGECONFIG option, enabled by default,
so behaviour is unchanged unless a distro or image opts out with:

  PACKAGECONFIG:remove:pn-systemd-conf = "kill-user-processes"

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-core/systemd/systemd-conf/logind.conf | 2 +-
 meta/recipes-core/systemd/systemd-conf_1.0.bb      | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-conf/logind.conf b/meta/recipes-core/systemd/systemd-conf/logind.conf
index bf7f6920fa..25f01f3fb6 100644
--- a/meta/recipes-core/systemd/systemd-conf/logind.conf
+++ b/meta/recipes-core/systemd/systemd-conf/logind.conf
@@ -1,2 +1,2 @@
 [Login]
-KillUserProcesses=yes
+KillUserProcesses=@KILL_USER_PROCESSES@
diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
index 60066cd60a..55bbeb69eb 100644
--- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
@@ -10,8 +10,9 @@ REQUIRED_DISTRO_FEATURES += "usrmerge"
 
 PE = "1"
 
-PACKAGECONFIG ??= "dhcp-ethernet"
+PACKAGECONFIG ??= "dhcp-ethernet kill-user-processes"
 PACKAGECONFIG[dhcp-ethernet] = ""
+PACKAGECONFIG[kill-user-processes] = ""
 
 SRC_URI = "\
     file://journald.conf \
@@ -28,6 +29,9 @@ do_install() {
 	install -D -m0644 ${S}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
 	install -D -m0644 ${S}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
 
+        KILL_USER_PROCESSES="${@bb.utils.contains('PACKAGECONFIG', 'kill-user-processes', 'yes', 'no', d)}"
+        sed -i "s/@KILL_USER_PROCESSES@/${KILL_USER_PROCESSES}/" ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
+
         if ${@bb.utils.contains('PACKAGECONFIG', 'dhcp-ethernet', 'true', 'false', d)}; then
 		install -D -m0644 ${S}/wired.network ${D}${systemd_unitdir}/network/80-wired.network
         fi
-- 
2.47.3


