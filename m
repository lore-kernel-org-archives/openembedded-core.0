Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904ECCD37B1
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:26:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7592.1778221606614020633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 23:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=altNu1JY;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so19222835e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778221605; x=1778826405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liURZfgWxdeLevXBuLNSsUTGaxJEmbmU8974nCYJyg4=;
        b=altNu1JY3gamED9xuzAUJSZWJwq+z43GtPGAMlh66IfJCIEXoLlf97+HALdPeN9FX8
         xt2DvDc0ybtg3+XqdkzBc0liKy8T6fsDMjN5NYLgQwR/wYK8/FtkS9qxDbqC07/xYjmB
         S21JG+06LmWPqbmuN92EqihMj8+Ihcc8TVwME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221605; x=1778826405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=liURZfgWxdeLevXBuLNSsUTGaxJEmbmU8974nCYJyg4=;
        b=XODpPt4L8sOmWtJAcKxnyrwDKsvjzENUSmdan9zIwEnQd8KF7hBTtP4la0SIGEXkKN
         ZsRp8fe3FzHSc5qf3Jk90g4Wpbu6aCtc3AEmrLLh93H85hpKxwIH0ShvoQw8qOVQzBfZ
         OoiwDVgmSBtH+1a6hk3gUEDQX3D54VNjEiM2oBRfozzP430d+z7GkyKKlSjI+LPg9F/R
         KJGXm3r/lKlj8eu9ZDCAe6KuPQNMiM8tD1+YVWjNkEmFLfjP1OEMEiQG95onokIT187n
         a1YvT1agN7wlluznfIulzbbHsHQdyLO2QTZq9ipZ1uU0SLaEgqWeosbP6ovGPTPu+eB7
         9pwA==
X-Gm-Message-State: AOJu0YzZDwNcHPMPlznq0rcACa2YcnDT4by+Pba05nQqe3DF/Z9dbrSq
	eqgCuYWnC1CyCsvqNTdgEECHcJuLnubSgHRJAwLhQkkzba9huk+At/lhH7eIhUDgJs+7QCQ/sBr
	JNFY5OJE=
X-Gm-Gg: AeBDiestnlnS7+/iOcTbBWutpVqdHEbfL3KAv6XKf0Ocs9LNz9vQS12dgOb5ovoFFyd
	kVznf3YGole6SPIYICRgq1NtvJCrYoGFv4+/+/+IatlQsyLbIVSC1cwAMl3JJs5eCIz3amg21Lx
	czmwMVC6+cgg7J8AFUEookoqeslJtYiG8aj7ICgQf2RbTEY3IbnIPgdYILK3cBTMfwr3Jo1A9US
	0J5FP03YOeKrnXTXfuzCL3+qckCFWlLLIo9tFdfnq67tNY8Z8VqFvzVqePOP+I37dtB+y8P7x/t
	ffZcmk+fVLdY0yW6imwrwsLVzeRd56P+oc9sjlzmk5997Qk67gDAMVkyCAIMdIC6mRLs5lJEDFd
	C9dmB8E0U2ovdfgkIn0gqq4YZdbJmikBYAfdcpnWFmeDsx0yB7f82XXohWPsFfuVd4VPKb4HW7n
	5/t5l7+raD7pMNvZtJaq4kVVBvsweEfTG1D8yPv5orsg2eYNIGpaEyRAvL4CDprihqR0GgLj8VA
	e3wT0iXDVI/5UhwayufCr5knbk=
X-Received: by 2002:a05:600c:3ba8:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48e52bd5035mr196923395e9.14.1778221604560;
        Thu, 07 May 2026 23:26:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ec5c49sm15202695e9.11.2026.05.07.23.26.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:26:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/8] sudo: fix for CVE-2026-35535
Date: Fri,  8 May 2026 08:25:56 +0200
Message-ID: <ddf8325a5b791dfcb0fdf129274deea8ad7eb90a.1778198884.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198884.git.yoann.congal@smile.fr>
References: <cover.1778198884.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236636

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/sudo-project/sudo/commit/3e474c2f201484be83d994ae10a4e20e8c81bb69
[2] https://security-tracker.debian.org/tracker/CVE-2026-35535
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-35535

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sudo/files/CVE-2026-35535.patch           | 150 ++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-35535.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2026-35535.patch b/meta/recipes-extended/sudo/files/CVE-2026-35535.patch
new file mode 100644
index 00000000000..8c27d2772bb
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2026-35535.patch
@@ -0,0 +1,150 @@
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
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ include/sudo_eventlog.h      |  3 ++-
+ lib/eventlog/eventlog.c      | 21 +++++++++++++++++----
+ lib/eventlog/eventlog_conf.c |  4 +++-
+ plugins/sudoers/logging.c    |  2 +-
+ plugins/sudoers/policy.c     |  2 +-
+ 5 files changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/include/sudo_eventlog.h b/include/sudo_eventlog.h
+index eb9f4f4..485d259 100644
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
+index 5a32824..d56c4e4 100644
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
+index 0663a38..ec3b569 100644
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
+index bd4de92..9535289 100644
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
+index f3adfb0..27f6e58 100644
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
+-- 
+2.50.1
+
diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index d715bc2075f..c934dfdce27 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -3,6 +3,7 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
+           file://CVE-2026-35535.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"

