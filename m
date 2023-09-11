Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D97EE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 07:27:37 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.53379.1694417255962243448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 00:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NuRmvVVM;
 spf=pass (domain: mvista.com, ip: 209.85.161.49, mailfrom: sdoshi@mvista.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5734f54dc44so2693506eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 00:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1694417255; x=1695022055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jicwWxyf3bqilpstwrxSZf09MjrwYst3XlEo19Re/KA=;
        b=NuRmvVVMCWMiyWT6a3Oa8AOnmXe8DvllriEW5KlBvItHu4IbBhOXhWx8dpitDBxvtN
         GEb3aLKGCm2AwUBJYVKVtkqNyNHJo/4zKTMZNMvIYrKdhJfPFTvj2xDqrg+U3igyNxbp
         udNIQhCZvXf7sAyEQn8amk7VWXf2rKjQLhVts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694417255; x=1695022055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jicwWxyf3bqilpstwrxSZf09MjrwYst3XlEo19Re/KA=;
        b=P1yyNB2nrsoo5qxN1TWmq9BVmzr7bBM/pKOtAD8oCDvpbsVY7shj2BYUIn7nD0FINi
         YO3R4a12ZbUvBw2nh3EF7b5aZi2bH+uFar+IFbri3v7xBQpF8GQtlmAAtrUTsGRDcTMg
         /lpOo4VL++ogDFfut51XWkhNTA9C9amIqeiMgI0X+dPXFryjnae3uidoYWCV5MGt+0BH
         miEDqkp2wM5Jdp3zlcB9L3ml7QXKsCz4JaedgfEPACHNHmAVOvJt33gU0+ZziF0MFesL
         3iT9WS16/vvnwH2QMEd4rnRq5l738B97/I1a8ztCuss8gXMpAwiYt1pXhHPS2yxnWdxh
         L3ww==
X-Gm-Message-State: AOJu0YyNDHLl/3CYj6m2DlXdlwxL+gbvQPqvsQ4G17/aqU6al1IMVICp
	EhGJTFrvC71KO5c5Ihw1H4Dzgeli0sdfBa0kXV4=
X-Google-Smtp-Source: AGHT+IE6WKBN1+oFiPzNOeK6WRFtimaNxADmgUe72cAKjIxxCGZ8P/UDYp3noDnfSvcbAmkOwucvaQ==
X-Received: by 2002:a05:6358:1101:b0:130:ebb9:4283 with SMTP id f1-20020a056358110100b00130ebb94283mr7138499rwi.22.1694417254708;
        Mon, 11 Sep 2023 00:27:34 -0700 (PDT)
Received: from localhost.localdomain ([157.32.70.97])
        by smtp.gmail.com with ESMTPSA id j26-20020aa7801a000000b0066a4e561beesm5146999pfi.173.2023.09.11.00.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 00:27:34 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [OE-core][kirkstone][PATCH] sysklogd: fix integration with systemd-journald
Date: Mon, 11 Sep 2023 12:57:26 +0530
Message-Id: <20230911072726.8936-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 07:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187480

From: Changqing Li <changqing.li@windriver.com>

Fix an issue with early log messages being lost when running in systemd.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...KillMode-process-is-not-recommended-.patch | 33 ++++++++
 ...-messages-lost-when-running-in-syste.patch | 75 +++++++++++++++++++
 .../sysklogd/sysklogd_2.3.0.bb                |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-syslogd.service-KillMode-process-is-not-recommended-.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/0002-Fix-62-early-log-messages-lost-when-running-in-syste.patch

diff --git a/meta/recipes-extended/sysklogd/files/0001-syslogd.service-KillMode-process-is-not-recommended-.patch b/meta/recipes-extended/sysklogd/files/0001-syslogd.service-KillMode-process-is-not-recommended-.patch
new file mode 100644
index 0000000000..6c7e7cea44
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0001-syslogd.service-KillMode-process-is-not-recommended-.patch
@@ -0,0 +1,33 @@
+From b732dd0001c66f3ff1e0aef919c84ca9f0f81252 Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Sat, 22 Apr 2023 07:40:24 +0200
+Subject: [PATCH 1/2] syslogd.service: KillMode=process is not recommended,
+ drop
+
+The default 'control-group' ensures all processes started by sysklogd
+are stopped when the service is stopped, this is what we want.
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+
+Upstream-Status: Backport [https://github.com/troglobit/sysklogd/commit/c82c004de7e25e770039cba5d6a34c30dd548533]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ syslogd.service.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/syslogd.service.in b/syslogd.service.in
+index 91e080a..d614c5f 100644
+--- a/syslogd.service.in
++++ b/syslogd.service.in
+@@ -9,7 +9,6 @@ EnvironmentFile=-@SYSCONFDIR@/default/syslogd
+ ExecStart=@SBINDIR@/syslogd -F -p /run/systemd/journal/syslog $SYSLOGD_OPTS
+ StandardOutput=null
+ Restart=on-failure
+-KillMode=process
+ 
+ [Install]
+ WantedBy=multi-user.target
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/sysklogd/files/0002-Fix-62-early-log-messages-lost-when-running-in-syste.patch b/meta/recipes-extended/sysklogd/files/0002-Fix-62-early-log-messages-lost-when-running-in-syste.patch
new file mode 100644
index 0000000000..78ae57eeeb
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0002-Fix-62-early-log-messages-lost-when-running-in-syste.patch
@@ -0,0 +1,75 @@
+From ba8156eab79784ef816958327e701923890e98f7 Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Sat, 22 Apr 2023 08:27:57 +0200
+Subject: [PATCH 2/2] Fix #62: early log messages lost when running in systemd
+
+This is a follow-up to d7576c7 which initially added support for running
+in systemd based systems.  Since the unit file sources the syslog.socket
+we have /run/systemd/journal/syslog open already on descriptor 3.  All
+we need to do is verify that's the mode syslogd runs in.
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+
+Upstream-Status: Backport [https://github.com/troglobit/sysklogd/commit/7ec64e5f9c1bc284792d028647fb36ef3e64dff7]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/syslogd.c      | 21 +++++++++++++++------
+ syslogd.service.in |  2 +-
+ 2 files changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/src/syslogd.c b/src/syslogd.c
+index fa4303f..e96ca9a 100644
+--- a/src/syslogd.c
++++ b/src/syslogd.c
+@@ -162,6 +162,7 @@ void        untty(void);
+ static void parsemsg(const char *from, char *msg);
+ static int  opensys(const char *file);
+ static void printsys(char *msg);
++static void unix_cb(int sd, void *arg);
+ static void logmsg(struct buf_msg *buffer);
+ static void fprintlog_first(struct filed *f, struct buf_msg *buffer);
+ static void fprintlog_successive(struct filed *f, int flags);
+@@ -436,12 +437,20 @@ int main(int argc, char *argv[])
+ 				.pe_serv = "syslog",
+ 			});
+ 
+-	/* Default to _PATH_LOG for the UNIX domain socket */
+-	if (!pflag)
+-		addpeer(&(struct peer) {
+-				.pe_name = _PATH_LOG,
+-				.pe_mode = 0666,
+-			});
++	/* Figure out where to read system log messages from */
++	if (!pflag) {
++		/* Do we run under systemd-journald (Requires=syslog.socket)? */
++		if (fcntl(3, F_GETFD) != -1) {
++			if (socket_register(3, NULL, unix_cb, NULL) == -1)
++				err(1, "failed registering syslog.socket (3)");
++		} else {
++			/* Default to _PATH_LOG for the UNIX domain socket */
++			addpeer(&(struct peer) {
++					.pe_name = _PATH_LOG,
++					.pe_mode = 0666,
++				});
++		}
++	}
+ 
+ 	if (!Foreground && !Debug) {
+ 		ppid = waitdaemon(30);
+diff --git a/syslogd.service.in b/syslogd.service.in
+index d614c5f..bc82af9 100644
+--- a/syslogd.service.in
++++ b/syslogd.service.in
+@@ -6,7 +6,7 @@ Requires=syslog.socket
+ 
+ [Service]
+ EnvironmentFile=-@SYSCONFDIR@/default/syslogd
+-ExecStart=@SBINDIR@/syslogd -F -p /run/systemd/journal/syslog $SYSLOGD_OPTS
++ExecStart=@SBINDIR@/syslogd -F $SYSLOGD_OPTS
+ StandardOutput=null
+ Restart=on-failure
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
index 7043f3d391..0dc5ef93e2 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
@@ -12,6 +12,8 @@ inherit update-rc.d update-alternatives systemd autotools
 
 SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https \
            file://sysklogd \
+           file://0001-syslogd.service-KillMode-process-is-not-recommended-.patch \
+           file://0002-Fix-62-early-log-messages-lost-when-running-in-syste.patch \
            "
 
 SRCREV = "03c2c9c68d5d02675326527774e7e9cba3490ba0"
-- 
2.34.1


