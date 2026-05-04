Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9DCFF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 19:53:27 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23661.1777924397984722795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 12:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=DGCT10p8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260504195315e98a172fac0002078b-c5gkmt@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260504195315e98a172fac0002078b
        for <openembedded-core@lists.openembedded.org>;
        Mon, 04 May 2026 21:53:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2aTT36VfPhi+GnsRTtby26kb2T9vhxe0TCV5JvHh61g=;
 b=DGCT10p87omXuY2t+GxXhitiLGx5JCT1cfpdP28W4XxClfFDHCyzJJ9HkgE7AMFI8JZipy
 qj6tTG+HMcUY6d2nIfHnM10zM6lXSxyx47qu+esuqaY67E9X++mK9aCBSDaARduCZ5IW3XdZ
 GBnM5pUZ2aQYkB1pNRfvBiYxBvBG7hIEX4onHilo75FkhKQvPxBev7X9VV2n0wpw5pFkh4MI
 m/ArZmAluCmQPeWchYwPbCUECql3N7nyDyhRcmY2/LVkcJdXMvsDtbZvscW4+214joA95oQv
 t0aWKsb89WC6Sxg8CtfjwvAeQ/T0rugF8eYp2pwjjqKN+FHjkt+8T+7g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/5] sudo: patch CVE-2026-35535
Date: Mon,  4 May 2026 21:52:43 +0200
Message-ID: <20260504195246.1190112-2-peter.marko@siemens.com>
In-Reply-To: <20260504195246.1190112-1-peter.marko@siemens.com>
References: <20260504195246.1190112-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 19:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236454

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in both NVD and Debian report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sudo/files/CVE-2026-35535.patch           | 147 ++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-35535.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2026-35535.patch b/meta/recipes-extended/sudo/files/CVE-2026-35535.patch
new file mode 100644
index 0000000000..c90e4b3b0d
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2026-35535.patch
@@ -0,0 +1,147 @@
+From 3e474c2f201484be83d994ae10a4e20e8c81bb69 Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Sat, 8 Nov 2025 15:34:02 -0700
+Subject: [PATCH] exec_mailer: Set group as well as uid when running the mailer
+
+Also make a setuid(), setgid() or setgroups() failure fatal.
+
+Found by the ZeroPath AI Security Engineer <https://zeropath.com>
+
+CVE: CVE-2026-35535
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/3e474c2f201484be83d994ae10a4e20e8c81bb69]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/sudo_eventlog.h      |  3 ++-
+ lib/eventlog/eventlog.c      | 21 +++++++++++++++++----
+ lib/eventlog/eventlog_conf.c |  4 +++-
+ plugins/sudoers/logging.c    |  2 +-
+ plugins/sudoers/policy.c     |  2 +-
+ 5 files changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/include/sudo_eventlog.h b/include/sudo_eventlog.h
+index eb9f4f4a8..485d2593e 100644
+--- a/include/sudo_eventlog.h
++++ b/include/sudo_eventlog.h
+@@ -80,6 +80,7 @@ struct eventlog_config {
+     int syslog_rejectpri;
+     int syslog_alertpri;
+     uid_t mailuid;
++    gid_t mailgid;
+     bool omit_hostname;
+     const char *logpath;
+     const char *time_fmt;
+@@ -151,7 +152,7 @@ void eventlog_set_syslog_rejectpri(int pri);
+ void eventlog_set_syslog_alertpri(int pri);
+ void eventlog_set_syslog_maxlen(size_t len);
+ void eventlog_set_file_maxlen(size_t len);
+-void eventlog_set_mailuid(uid_t uid);
++void eventlog_set_mailuser(uid_t uid, gid_t gid);
+ void eventlog_set_omit_hostname(bool omit_hostname);
+ void eventlog_set_logpath(const char *path);
+ void eventlog_set_time_fmt(const char *fmt);
+diff --git a/lib/eventlog/eventlog.c b/lib/eventlog/eventlog.c
+index f4a9f330d..2db2f251c 100644
+--- a/lib/eventlog/eventlog.c
++++ b/lib/eventlog/eventlog.c
+@@ -304,15 +304,13 @@ exec_mailer(int pipein)
+ 	syslog(LOG_ERR, _("unable to dup stdin: %m")); // -V618
+ 	sudo_debug_printf(SUDO_DEBUG_ERROR,
+ 	    "unable to dup stdin: %s", strerror(errno));
+-	sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
+-	_exit(127);
++	goto bad;
+     }
+ 
+     /* Build up an argv based on the mailer path and flags */
+     if ((mflags = strdup(evl_conf->mailerflags)) == NULL) {
+ 	syslog(LOG_ERR, _("unable to allocate memory")); // -V618
+-	sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
+-	_exit(127);
++	goto bad;
+     }
+     argv[0] = sudo_basename(mpath);
+ 
+@@ -331,11 +329,23 @@ exec_mailer(int pipein)
+     if (setuid(ROOT_UID) != 0) {
+ 	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change uid to %u",
+ 	    ROOT_UID);
++	goto bad;
++    }
++    if (setgid(evl_conf->mailgid) != 0) {
++	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change gid to %u",
++	    (unsigned int)evl_conf->mailgid);
++	goto bad;
++    }
++    if (setgroups(1, &evl_conf->mailgid) != 0) {
++	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to set groups to %u",
++	    (unsigned int)evl_conf->mailgid);
++	goto bad;
+     }
+     if (evl_conf->mailuid != ROOT_UID) {
+ 	if (setuid(evl_conf->mailuid) != 0) {
+ 	    sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change uid to %u",
+ 		(unsigned int)evl_conf->mailuid);
++	    goto bad;
+ 	}
+     }
+     sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
+@@ -347,6 +357,9 @@ exec_mailer(int pipein)
+     sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to execute %s: %s",
+ 	mpath, strerror(errno));
+     _exit(127);
++bad:
++    sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
++    _exit(127);
+ }
+ 
+ /* Send a message to the mailto user */
+diff --git a/lib/eventlog/eventlog_conf.c b/lib/eventlog/eventlog_conf.c
+index bbc3daaac..3d37b632c 100644
+--- a/lib/eventlog/eventlog_conf.c
++++ b/lib/eventlog/eventlog_conf.c
+@@ -70,6 +70,7 @@ static struct eventlog_config evl_conf = {
+     MAXSYSLOGLEN,		/* syslog_maxlen */
+     0,				/* file_maxlen */
+     ROOT_UID,			/* mailuid */
++    ROOT_GID,			/* mailgid */
+     false,			/* omit_hostname */
+     _PATH_SUDO_LOGFILE,		/* logpath */
+     "%h %e %T",			/* time_fmt */
+@@ -151,9 +152,10 @@ eventlog_set_file_maxlen(size_t len)
+ }
+ 
+ void
+-eventlog_set_mailuid(uid_t uid)
++eventlog_set_mailuser(uid_t uid, gid_t gid)
+ {
+     evl_conf.mailuid = uid;
++    evl_conf.mailgid = gid;
+ }
+ 
+ void
+diff --git a/plugins/sudoers/logging.c b/plugins/sudoers/logging.c
+index ec092d14e..1626a28cb 100644
+--- a/plugins/sudoers/logging.c
++++ b/plugins/sudoers/logging.c
+@@ -1157,7 +1157,7 @@ init_eventlog_config(void)
+     eventlog_set_syslog_alertpri(def_syslog_badpri);
+     eventlog_set_syslog_maxlen(def_syslog_maxlen);
+     eventlog_set_file_maxlen(def_loglinelen);
+-    eventlog_set_mailuid(ROOT_UID);
++    eventlog_set_mailuser(ROOT_UID, ROOT_GID);
+     eventlog_set_omit_hostname(!def_log_host);
+     eventlog_set_logpath(def_logfile);
+     eventlog_set_time_fmt(def_log_year ? "%h %e %T %Y" : "%h %e %T");
+diff --git a/plugins/sudoers/policy.c b/plugins/sudoers/policy.c
+index af3210dda..706c492b7 100644
+--- a/plugins/sudoers/policy.c
++++ b/plugins/sudoers/policy.c
+@@ -639,7 +639,7 @@ sudoers_policy_deserialize_info(struct sudoers_context *ctx, void *v,
+     }
+ 
+ #ifdef NO_ROOT_MAILER
+-    eventlog_set_mailuid(ctx->user.uid);
++    eventlog_set_mailuser(ctx->user.uid, ctx->user.gid);
+ #endif
+ 
+     /* Dump settings and user info (XXX - plugin args) */
diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 6be2a7c678..7dfa0cef6c 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -4,6 +4,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
+		   file://CVE-2026-35535.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"

