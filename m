Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DEFCD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:50 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8182.1778224369781557373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=K8FCHAlV;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so18594955e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224368; x=1778829168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Idupehwjothl+m+cXeHk5tDonC/heb6x92p1B+xXG4=;
        b=K8FCHAlVquQMHROOe6dlSMbb7MvEQsz0culhlEKG52JAo950doQ9px54daul48dEJ4
         mzURr8AZYzpz+CfX/2Rt/vE1cx7gtgLuvNSNVTH0WOE25PHmvKALEfkb8AJiOilImHNi
         m04+dw1Fzlr0eXAWB6obtSwu/hlbo7h7U5Zn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224368; x=1778829168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Idupehwjothl+m+cXeHk5tDonC/heb6x92p1B+xXG4=;
        b=oEAaL9/VI+NnydxHkSFPL82OE1UY6qZ12jhe3nIN2beEdqMPmbkIZ3rqr1OpJcA7Pm
         M9mNg5+/TlWBYSKljo1TGFEBg/cjzLjsf2/OA5J7KCiNKN+tMTkOyO5jEdqJK7VoDUWO
         S5ILA06ziDYuNy42YxU4pGglou9Mh/h1f60DcWE5B0WgpQ42qLraML+6p23bBLvf4jcs
         xrBkeP7OCAZmh+3kIBcgW1QoXmdHLqzATdxRKjL+mAN9DYX6x9ly90fQBjmYw1X7sT+n
         QUIkqgPrX4f13nEAm01WmFjRcMESQSsZGASY/q+ODC6AHCASmDMCcTZdtFB/4X9Kt8sJ
         xNcg==
X-Gm-Message-State: AOJu0YxphPJBRAeewr63t/1qE73PFeDKDRabIg5DNOMCCkE39Nbe72gZ
	gaAF7kkRK05fDYz3uOxIyaRrrfg0gNPZUo21kbIuB3HtzaVk4Ke/Wt8lQUfn+/lO9PVIlch40qG
	hqxBdf24=
X-Gm-Gg: AeBDiev5F+ZKVxXwR3WnEgZPwckNa7YcFp7A8++dmyiEtCFVO3dvdyvj4VQRkmMLEWD
	/GURSUwuxE/GtZwrnysTDLGziwzD12iP0eAXr4Z5JaeofalkmFDRv+f14HMxv9v5cVOF1v9UUaX
	REFKwNqtHU/dpQyD0mFqHaNKPFdha9dIp3bciaCXKDG7Uar4aDu9WbK8nA1HqTwDjo80gMJUot7
	KYNPszRLClIbWueDuw0HAcMTq2mIfYQu3CTHEPDS3ArLHM1w/cp5novZocHR//jkHgzsHYHD7ml
	91/hMRx1h7XP6S1b3mMs0g2BbwzNYcTTfu7cBJ4G/q/Gb+8VbF8HohtmiBTKNLx+Y7WVH32SoX+
	ArnsvkFnv3Me6kzPyebxlAloORjL1qoIMgS+jtASumf60PyD/ptC/sNJkf2BDS3X8hbwHS0eryk
	giNAqCFWmNgveAVlg3cs2kZ3hlFAZ9+U5bKxkxojp2EVAqDYbImg5g45c3eh302GDTQi1XK+e0I
	m5ZU1QzRs5cK42Nf1Tt/GDCcLzQBfEGwO1jlw==
X-Received: by 2002:a05:600d:6:b0:48a:52ee:5776 with SMTP id 5b1f17b1804b1-48e51f28ef2mr134901765e9.11.1778224367658;
        Fri, 08 May 2026 00:12:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 49/52] sudo: patch CVE-2026-35535
Date: Fri,  8 May 2026 09:11:42 +0200
Message-ID: <6d6ce512f1e98ef294b59b798e60659c13fd0d3c.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236691

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in both NVD and Debian report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4cef4ef8d002bb035b19a8f8b36057d8d4cf8f0d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sudo/files/CVE-2026-35535.patch           | 147 ++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-35535.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2026-35535.patch b/meta/recipes-extended/sudo/files/CVE-2026-35535.patch
new file mode 100644
index 00000000000..c90e4b3b0d3
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
index 6be2a7c678a..7dfa0cef6c2 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -4,6 +4,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
+		   file://CVE-2026-35535.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"

