Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.226.1616596797582330587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nfTx9/BJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id f17so8044542plr.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l3N7ehgnfQ8ugOGB2YMa9bS1CPRReddX1c1SmFsCdyQ=;
        b=nfTx9/BJdVZWKnwO2z302HaaLrg6szWakB3eg8IgQ7luSkzxABXGz8urWsIIjo0Fsw
         8oxmIb2Ofi/sn3oJB7st3DKiSCvf5quO4xsepp+qR1yAR98FclbsdGGCLrdw5SzTELdW
         E1ryGKDbPGDEUZ+6srf2Slhc0GKk7/Z7M33uneAOifG8m9Olc997R2GhQ0HVhCIbmnjI
         2Jrf/qpcuwLxK+MyLhIZgqKukdlh2GQC3JF9ea3mR2Aif5cV0gYQftONWlhA/DFw2Pe7
         NAyM00Y1vrjMuUpjxxdUWPEb1dBgXI7FfkKiwYdza7DyW3Ty3WGwOkdqx/WNcnv88TzQ
         9Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l3N7ehgnfQ8ugOGB2YMa9bS1CPRReddX1c1SmFsCdyQ=;
        b=WSAWKFbTmRdp4lryLBlbdYvIZh25DvW+pZ8/D34ljZH9+qKP9yOTThpsbpW76S7jV1
         le1Kcls4RTac3IqJ+DrCfAq5WyGnqQVqOA+Gd/Tt1uOwPV/87vVarsvanzF0yJZeyXtE
         WabSjbU1R8kjjsG58gdB9QQaSP2i0q/tQAN1t6PFaazQfePB+VYqA3XjTUfmqi5QHgNI
         7iV96exyhE007b2asdMz4dN+o0ETOkKeA6h22loPenT5IQEvb7W4j4U/Mz5KWhLEmOXR
         RlWRI/59+gwCUnSOtuVSDvC74zkIBeAu9oBgtuwCf7BfNt5hjQGapsmNUAyzSq+szeOm
         +IGQ==
X-Gm-Message-State: AOAM533KMhj/gvxw5/+yla04hnpUcUCHmVHtoIGknMGvDS45M0eqNQMc
	cE/H+6aZfGKefKwL8ssHttG1AbkVoS3Y+Vd0
X-Google-Smtp-Source: ABdhPJz/hUYnrLIxdZl8W9cDr0q/j70ofA0IBPcOfIqeED+5Ab85S92OkXfwAq7uCfUkkwzCFUHRjw==
X-Received: by 2002:a17:90a:9f8d:: with SMTP id o13mr3761142pjp.25.1616596796322;
        Wed, 24 Mar 2021 07:39:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.39.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:39:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/21] iputils: fix various arping regressions
Date: Wed, 24 Mar 2021 04:39:04 -1000
Message-Id: <77c5792aa5e7cb7760c7042a49c2c0b02109987f.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>

arping in iputils s20190709 has several problems, this backports the
fixes from s20200821.
 - -D, duplicate address detection, always returns failure
 - -w -f does not behave correctly
 - -w option hangs arping
 - -U option returns failure

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 ...rtially-fix-sent-vs-received-package.patch | 39 ++++++++
 ...fix-f-quit-on-first-reply-regression.patch | 39 ++++++++
 ...rison-of-different-signedness-warnin.patch | 37 ++++++++
 ...ccess-when-unsolicited-ARP-mode-dest.patch | 45 +++++++++
 ...ional-timerfd-to-control-when-timeou.patch | 94 +++++++++++++++++++
 .../iputils/iputils_s20190709.bb              |  5 +
 6 files changed, 259 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-arping-revert-partially-fix-sent-vs-received-package.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0002-arping-fix-f-quit-on-first-reply-regression.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0003-arping-Fix-comparison-of-different-signedness-warnin.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0004-arping-return-success-when-unsolicited-ARP-mode-dest.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0005-arping-use-additional-timerfd-to-control-when-timeou.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-arping-revert-partially-fix-sent-vs-received-package.patch b/meta/recipes-extended/iputils/iputils/0001-arping-revert-partially-fix-sent-vs-received-package.patch
new file mode 100644
index 0000000000..8495178879
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-arping-revert-partially-fix-sent-vs-received-package.patch
@@ -0,0 +1,39 @@
+From 18f14be80466ddc8fb17a400be82764a779c8dcd Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Wed, 31 Jul 2019 21:28:12 +0100
+Subject: [PATCH] arping: revert partially - fix sent vs received packages
+ return value
+
+Commit 84ca65ca980315c73f929fed8b6f16bbd698c3a0 caused regression.  The
+arping -D needs return value evaluation that was the earlier default, in
+other cases the new return value should be correct.
+
+Addresses: https://github.com/iputils/iputils/issues/209
+See-also: https://github.com/void-linux/void-packages/issues/13304
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/18f14be80466ddc8fb17a400be82764a779c8dcd]
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ arping.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/arping.c b/arping.c
+index 77c9c56..2c87c15 100644
+--- a/arping.c
++++ b/arping.c
+@@ -792,7 +792,11 @@ static int event_loop(struct run_state *ctl)
+ 	close(tfd);
+ 	freeifaddrs(ctl->ifa0);
+ 	rc |= finish(ctl);
+-	rc |= (ctl->sent != ctl->received);
++	if (ctl->dad && ctl->quit_on_reply)
++		/* Duplicate address detection mode return value */
++		rc |= !(ctl->brd_sent != ctl->received);
++	else
++		rc |= (ctl->sent != ctl->received);
+ 	return rc;
+ }
+ 
+-- 
+2.18.4
+
diff --git a/meta/recipes-extended/iputils/iputils/0002-arping-fix-f-quit-on-first-reply-regression.patch b/meta/recipes-extended/iputils/iputils/0002-arping-fix-f-quit-on-first-reply-regression.patch
new file mode 100644
index 0000000000..a5f40860dc
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0002-arping-fix-f-quit-on-first-reply-regression.patch
@@ -0,0 +1,39 @@
+From 1df5350bdc952b14901fde356b17b78c2bcd4cff Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Wed, 28 Aug 2019 20:05:22 +0100
+Subject: [PATCH] arping: fix -f quit on first reply regression
+
+When arping runs together with -f 'quit on first reply' and -w <timeout>
+'how long to wait for a reply' the command needs to exit if replies are not
+received after wait period.  Notice that the exit in case of lost packages
+will be 1 signifying failure.  Getting a reply results to 0 exit value.
+
+Addresses: https://bugs.debian.org/935946
+Reported-by: Lucas Nussbaum <lucas@debian.org>
+Addresses: https://github.com/iputils/iputils/issues/211
+Reported-by: Noah Meyerhans <noahm@debian.org>
+Broken-since: 67e070d08dcbec990e1178360f82b3e2ca4f6d5f
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/1df5350bdc952b14901fde356b17b78c2bcd4cff]
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ arping.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/arping.c b/arping.c
+index 2c87c15..30884f6 100644
+--- a/arping.c
++++ b/arping.c
+@@ -764,7 +764,8 @@ static int event_loop(struct run_state *ctl)
+ 					continue;
+ 				}
+ 				total_expires += exp;
+-				if (0 < ctl->count && (uint64_t)ctl->count < total_expires) {
++				if ((0 < ctl->count && (uint64_t)ctl->count < total_expires) ||
++				    (ctl->quit_on_reply && ctl->timeout < total_expires)) {
+ 					exit_loop = 1;
+ 					continue;
+ 				}
+-- 
+2.18.4
+
diff --git a/meta/recipes-extended/iputils/iputils/0003-arping-Fix-comparison-of-different-signedness-warnin.patch b/meta/recipes-extended/iputils/iputils/0003-arping-Fix-comparison-of-different-signedness-warnin.patch
new file mode 100644
index 0000000000..ebd122c157
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0003-arping-Fix-comparison-of-different-signedness-warnin.patch
@@ -0,0 +1,37 @@
+From ec821e572a640bd79aecc3922cb9001f4b6b26f2 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Sat, 7 Sep 2019 06:07:19 +0200
+Subject: [PATCH] arping: Fix comparison of different signedness warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+../arping.c:768:45: warning: comparison of integer expressions of different signedness: ‘int’ and ‘uint64_t’ {aka ‘long unsigned int’} [-Wsign-compare]
+  768 |         (ctl->quit_on_reply && ctl->timeout < total_expires)) {
+
+Fixes: 1df5350 ("arping: fix -f quit on first reply regression")
+Reference: https://github.com/iputils/iputils/pull/212
+Acked-by: Sami Kerola <kerolasa@iki.fi>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/ec821e572a640bd79aecc3922cb9001f4b6b26f2]
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ arping.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arping.c b/arping.c
+index 2d05728..88319cd 100644
+--- a/arping.c
++++ b/arping.c
+@@ -765,7 +765,7 @@ static int event_loop(struct run_state *ctl)
+ 				}
+ 				total_expires += exp;
+ 				if ((0 < ctl->count && (uint64_t)ctl->count < total_expires) ||
+-				    (ctl->quit_on_reply && ctl->timeout < total_expires)) {
++				    (ctl->quit_on_reply && ctl->timeout < (long)total_expires)) {
+ 					exit_loop = 1;
+ 					continue;
+ 				}
+-- 
+2.18.4
+
diff --git a/meta/recipes-extended/iputils/iputils/0004-arping-return-success-when-unsolicited-ARP-mode-dest.patch b/meta/recipes-extended/iputils/iputils/0004-arping-return-success-when-unsolicited-ARP-mode-dest.patch
new file mode 100644
index 0000000000..923e06e30b
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0004-arping-return-success-when-unsolicited-ARP-mode-dest.patch
@@ -0,0 +1,45 @@
+From 68f12fc4a0dbef4ae4c404da24040d22c5a14339 Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Sat, 8 Feb 2020 14:12:18 +0000
+Subject: [PATCH] arping: return success when unsolicited ARP mode destination
+ does not answer
+
+Manual page is making promise answers are not expected when -U (or -A)
+option is in use.  Either I am looking wrong or this has been broken since
+at the beginning of git history.
+
+Addresses: https://github.com/iputils/iputils/issues/247
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/68f12fc4a0dbef4ae4c404da24040d22c5a14339]
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ arping.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/arping.c b/arping.c
+index 996cf2b..5180ae0 100644
+--- a/arping.c
++++ b/arping.c
+@@ -794,7 +794,9 @@ static int event_loop(struct run_state *ctl)
+ 	close(tfd);
+ 	freeifaddrs(ctl->ifa0);
+ 	rc |= finish(ctl);
+-	if (ctl->dad && ctl->quit_on_reply)
++	if (ctl->unsolicited)
++		/* nothing */;
++	else if (ctl->dad && ctl->quit_on_reply)
+ 		/* Duplicate address detection mode return value */
+ 		rc |= !(ctl->brd_sent != ctl->received);
+ 	else
+@@ -943,7 +945,7 @@ int main(int argc, char **argv)
+ 		}
+ 		memset(&saddr, 0, sizeof(saddr));
+ 		saddr.sin_family = AF_INET;
+-		if (ctl.source || ctl.gsrc.s_addr) {
++		if (!ctl.unsolicited && (ctl.source || ctl.gsrc.s_addr)) {
+ 			saddr.sin_addr = ctl.gsrc;
+ 			if (bind(probe_fd, (struct sockaddr *)&saddr, sizeof(saddr)) == -1)
+ 				error(2, errno, "bind");
+-- 
+2.18.4
+
diff --git a/meta/recipes-extended/iputils/iputils/0005-arping-use-additional-timerfd-to-control-when-timeou.patch b/meta/recipes-extended/iputils/iputils/0005-arping-use-additional-timerfd-to-control-when-timeou.patch
new file mode 100644
index 0000000000..3b8a8244da
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0005-arping-use-additional-timerfd-to-control-when-timeou.patch
@@ -0,0 +1,94 @@
+From 60a27c76174c0ae23bdafde2bad4fdd18a44a7ea Mon Sep 17 00:00:00 2001
+From: Sami Kerola <kerolasa@iki.fi>
+Date: Sat, 7 Mar 2020 22:03:21 +0000
+Subject: [PATCH] arping: use additional timerfd to control when timeout
+ happens
+
+Trying to determine timeout by adding up interval values is pointlessly
+complicating.  With separate timer everything just works.
+
+Addresses: https://github.com/iputils/iputils/issues/259
+Fixes: 1df5350bdc952b14901fde356b17b78c2bcd4cff
+Signed-off-by: Sami Kerola <kerolasa@iki.fi>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/e594ca52afde89746b7d79c875fe9d6aea1850ac]
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ arping.c | 29 ++++++++++++++++++++++++++---
+ 1 file changed, 26 insertions(+), 3 deletions(-)
+
+diff --git a/arping.c b/arping.c
+index 61db3a6..7284351 100644
+--- a/arping.c
++++ b/arping.c
+@@ -670,6 +670,7 @@ static int event_loop(struct run_state *ctl)
+ 	enum {
+ 		POLLFD_SIGNAL = 0,
+ 		POLLFD_TIMER,
++		POLLFD_TIMEOUT,
+ 		POLLFD_SOCKET,
+ 		POLLFD_COUNT
+ 	};
+@@ -686,6 +687,13 @@ static int event_loop(struct run_state *ctl)
+ 		.it_value.tv_sec = ctl->interval,
+ 		.it_value.tv_nsec = 0
+ 	};
++	int timeoutfd;
++	struct itimerspec timeoutfd_vals = {
++		.it_interval.tv_sec = ctl->timeout,
++		.it_interval.tv_nsec = 0,
++		.it_value.tv_sec = ctl->timeout,
++		.it_value.tv_nsec = 0
++	};
+ 	uint64_t exp, total_expires = 1;
+ 
+ 	unsigned char packet[4096];
+@@ -709,7 +717,7 @@ static int event_loop(struct run_state *ctl)
+ 	pfds[POLLFD_SIGNAL].fd = sfd;
+ 	pfds[POLLFD_SIGNAL].events = POLLIN | POLLERR | POLLHUP;
+ 
+-	/* timerfd */
++	/* interval timerfd */
+ 	tfd = timerfd_create(CLOCK_MONOTONIC, 0);
+ 	if (tfd == -1) {
+ 		error(0, errno, "timerfd_create failed");
+@@ -722,6 +730,19 @@ static int event_loop(struct run_state *ctl)
+ 	pfds[POLLFD_TIMER].fd = tfd;
+ 	pfds[POLLFD_TIMER].events = POLLIN | POLLERR | POLLHUP;
+ 
++	/* timeout timerfd */
++	timeoutfd = timerfd_create(CLOCK_MONOTONIC, 0);
++	if (tfd == -1) {
++		error(0, errno, "timerfd_create failed");
++		return 1;
++	}
++	if (timerfd_settime(timeoutfd, 0, &timeoutfd_vals, NULL)) {
++		error(0, errno, "timerfd_settime failed");
++		return 1;
++	}
++	pfds[POLLFD_TIMEOUT].fd = timeoutfd;
++	pfds[POLLFD_TIMEOUT].events = POLLIN | POLLERR | POLLHUP;
++
+ 	/* socket */
+ 	pfds[POLLFD_SOCKET].fd = ctl->socketfd;
+ 	pfds[POLLFD_SOCKET].events = POLLIN | POLLERR | POLLHUP;
+@@ -764,13 +785,15 @@ static int event_loop(struct run_state *ctl)
+ 					continue;
+ 				}
+ 				total_expires += exp;
+-				if ((0 < ctl->count && (uint64_t)ctl->count < total_expires) ||
+-				    (ctl->quit_on_reply && ctl->timeout < (long)total_expires)) {
++				if (0 < ctl->count && (uint64_t)ctl->count < total_expires) {
+ 					exit_loop = 1;
+ 					continue;
+ 				}
+ 				send_pack(ctl);
+ 				break;
++			case POLLFD_TIMEOUT:
++				exit_loop = 1;
++				break;
+ 			case POLLFD_SOCKET:
+ 				if ((s =
+ 				     recvfrom(ctl->socketfd, packet, sizeof(packet), 0,
+-- 
+2.18.4
+
diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index 545f3d5e87..d652bfcaad 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -15,6 +15,11 @@ SRC_URI = "git://github.com/iputils/iputils \
            file://0001-ninfod-fix-systemd-Documentation-url-error.patch \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
            file://0001-iputils-Initialize-libgcrypt.patch \
+           file://0001-arping-revert-partially-fix-sent-vs-received-package.patch \
+           file://0002-arping-fix-f-quit-on-first-reply-regression.patch \
+           file://0003-arping-Fix-comparison-of-different-signedness-warnin.patch \
+           file://0004-arping-return-success-when-unsolicited-ARP-mode-dest.patch \
+           file://0005-arping-use-additional-timerfd-to-control-when-timeou.patch \
            "
 SRCREV = "13e00847176aa23683d68fce1d17ffb523510946"
 
-- 
2.25.1

