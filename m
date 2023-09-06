Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EEEEB8FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:49:02 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.7702.1694004535994086965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gKSG6HHc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-26934bc3059so658316a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004535; x=1694609335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jicwWxyf3bqilpstwrxSZf09MjrwYst3XlEo19Re/KA=;
        b=gKSG6HHcGjU32uoRTYOagV4GDZX2IcApMjyQloysyT14U+QLzlQbYkNMBSP06oeBAk
         SPWB8LE8q9T9QwYSgUPWlaFolzvMvWRKgB/94vl2t9xv7GrZ0zXoOJsdBp8RFNAHLV90
         1irSMSLiNzy/d6NkswjlKbajkwE199xMGtNHMh8pDBZBG37PfSTWGJ4uOmMrppG8dQFU
         zcWl4sP1F1lZ53qenvqK9O7hF1J1HCab2YvFKxeAiZNS7hoaQCCfIuP2aWhLwFyuZBWA
         XBjzhsahcZzafHagN6xWJzv1fRHOQuZoKTIdniHT7KJAe5YiCZLR4YrrKveXFfwcBhtT
         mKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004535; x=1694609335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jicwWxyf3bqilpstwrxSZf09MjrwYst3XlEo19Re/KA=;
        b=DV/ohnIbIMEDAmP/oji+ut4E/oOOcqHErKvOv7t+AyY1P8Qsp0M84APImc/Q79DdxZ
         gTH02khKqAkc/p5C8RG2LaVYbU/ZMkg0wqSaRXKjWrAGn/hGzwVPGIrYw8degLMurBC5
         b3JgAzdZcQLGMAAiY0DIDeRR+0bl+Ry2NZIokRVB6BLg43utTiAXkVj3uekEBnY5BQyn
         03JMD6zhqZl3GSop8GJN3zikgmOc2HNHOFCUKXs3zQKpLBvdJAuTBLi74HWH1XeGkII2
         QEwZcMUOys+sSa6zSsINoHW0zVVc84CQSqj1Bm54DCN5G1r+ak+hwi+Gu65iIsv05RoK
         qtRw==
X-Gm-Message-State: AOJu0YzQJwvKVFY4+GP9T9wtZnr7Uu6tr5c7bsNkWa0EvFoEnoDVU0PO
	udFxl9QjqsZS7DW1SSemfpRncXdXFTrHvI7sq8Q=
X-Google-Smtp-Source: AGHT+IHVamwP9TsOsV0DXBVJgtwY247ojpzSuxV2LJckltnGlOSCK1jqG8a0ilXLUUwgdGQSSRBolw==
X-Received: by 2002:a17:90b:38d0:b0:26b:2ba4:add8 with SMTP id nn16-20020a17090b38d000b0026b2ba4add8mr20478187pjb.21.1694004535072;
        Wed, 06 Sep 2023 05:48:55 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/14] sysklogd: fix integration with systemd-journald
Date: Wed,  6 Sep 2023 02:48:21 -1000
Message-Id: <47a1dd7f389e3cf4ac2dc5fc21dccc870aafab4a.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694004064.git.steve@sakoman.com>
References: <cover.1694004064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187310

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


