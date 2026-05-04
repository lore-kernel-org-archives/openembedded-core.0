Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF90FF886F
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 13:13:58 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14316.1777900436645405375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 06:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RrQx2cWN;
 spf=pass (domain: mvista.com, ip: 74.125.82.52, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12dfee30612so6057520c88.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777900436; x=1778505236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A6bFSLmgj95wIk/CxEzJNvCmhifMaZMgWIIAmm8Cwrs=;
        b=RrQx2cWNJvaqb++7NvkHSdrSodS9LiMWKGXFWraq3V4zhgP3tjy3W1cwehgwK1syF3
         DRl77kA8twKMSMlEacmE9wBowHi+G+d47nFnwwMcKezgVJsgONHQ1E7KAXeYJUlRLPGw
         bayhEnGaEv6mpNbW47uc54nhBkh3kfWNQ6Uio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900436; x=1778505236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6bFSLmgj95wIk/CxEzJNvCmhifMaZMgWIIAmm8Cwrs=;
        b=RahrXjFQ/yoQm3wtJUwTOWOKWQ13e+XrlXiwMJNeEW0qLoMduhSze+nrIz7bi+ZQFm
         tKwpA/b+J6PtVrTmvdbzQ4un1slCbI5lTTrYx3FULuKDGdCHYPvRAA/d6d1TC2305rFG
         6qZ70XxlkWzZcIFrVwJe0gDPDEn91Ly1s/hxnJ+KpVo7RJcg2PBQwO2LJhJH7zbHFObU
         62yFvJp1V22EZLbb6zfGptGEio6UEYk49DUspyujgrlGej9d860vqv+AIGOGdE31RnsE
         Gc1S573fZrg7G1D8z3tT7MxL9MCvrvMdzUht7Mj/iUFO+J71JczyK7un2JYwjHcbEiul
         Cmow==
X-Gm-Message-State: AOJu0Yx6f6aI3oedLQZ8hrR4EzeTEaDln/hhgHiZFbiaAMnl+cwsOiUM
	5R2xyfbiIBa5J6NOI4HBoFRzihe+96/4TJFK4DmxKNSYBmElzOA6SVfvRDA3KYvlQRV6FCqySf/
	LZHMrpfo=
X-Gm-Gg: AeBDieu37x2vbe0wWPrzmlzER2jdVFFAavdAGsAAI0bc4JHqdAB+lDCEtgNmruCNyxs
	AL7d0AUgTVKIn0N0tX5V6ZGG4eOnRAwgZyfvSf2QUACPyqI7GuCmW1IRCaqhfDBb09Z9YWeqRch
	emj0n2mvy4I29Oe61NW6k5fgbzGXv9aQP/on4cjh7DBNS2/vglblETiY3/kSGWyGs+vCrgNinRc
	iBLizcs0gU2tyrs9e091Qqi5nz/IlG83Ea5C2jCFIU5o4M7zjtFtZdnnC+CFx0i5i621+KZgEWl
	fe9mK1GTCOd93fKdo3NvFUuITrOfwsQzkobTin3EJ1RJsTvWTKgiTYm9ouHt2X4nuwN53080MlB
	cN+AY9OJvU8mQmgNUBrYv+0lt9UMirTizT02hfzjm7MJR5U2O3E7IYwZ2zaa9vuZNuD55qT9rYh
	ffkRMoM15bWejmmXwk4v7D88ClyCihEvf/W/0rrGG0vp/IAmY=
X-Received: by 2002:a05:7022:523:b0:12d:ca31:f1b5 with SMTP id a92af1059eb24-12dfd81a74cmr4378965c88.26.1777900435085;
        Mon, 04 May 2026 06:13:55 -0700 (PDT)
Received: from MVIN00013.mvista.com ([152.59.1.122])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8295552sm13937144c88.7.2026.05.04.06.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 06:13:54 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] sudo: fix for CVE-2026-35535
Date: Mon,  4 May 2026 18:41:45 +0530
Message-ID: <20260504131145.136504-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 13:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236450

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/sudo-project/sudo/commit/3e474c2f201484be83d994ae10a4e20e8c81bb69
[2] https://security-tracker.debian.org/tracker/CVE-2026-35535
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-35535

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../sudo/files/CVE-2026-35535.patch           | 150 ++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-35535.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2026-35535.patch b/meta/recipes-extended/sudo/files/CVE-2026-35535.patch
new file mode 100644
index 0000000000..8c27d2772b
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
index d715bc2075..c934dfdce2 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -3,6 +3,7 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
+           file://CVE-2026-35535.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.50.1


