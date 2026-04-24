Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FE3FF8846
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:25 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32617.1777064235050255591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tyTBhemk;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so68180485e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064233; x=1777669033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDMA4Gn+wCmKzSGRQCK9y5XfaAOR/Kz0Q72NWXHRzz8=;
        b=tyTBhemkr0My+Z3Bmc7dsodzfiH5lu1haJNYBvsXeJPG5pGBWT/m6yhPPpdIU3DYeK
         o/fcd5znjq3dlUQ3lnDmxdpYTmivL2qXt9QQA+mlKlJI8jxZlpa7SPyS6qIQuH3iDKkp
         M0luqTxirfQg/t9b4fdq6lF0VXVbV1mFK9dNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064233; x=1777669033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDMA4Gn+wCmKzSGRQCK9y5XfaAOR/Kz0Q72NWXHRzz8=;
        b=LUFcG+zitt4qGJdH/BG/WrmsLDwEFzpuehdcm5FnaPp/4GcjEeer9cV/M8+XLqslow
         Tu0mvTTcnfEtvvtlURst8RTCBG5RcMc8ODuKImUr5BIjZHVKfDNOR0UVsJtwaIU9RKWB
         LCrYPTij9lrFdm+HC8UnF8SJwYNFUFS0PKZFu1ij/u+FaVcngehSBn/UjOarjswgDKLj
         YoZBspznQ5S+H5V6lGVWbIm/J57PqtzlX9wxOg/aLmeK/h4msdsn1ZT/R/BP1Z3TVTin
         to1l/fUD5g08H6L07tZcwA0X5Qa9/gyTYdy+o4dYz1Bt0LtZziBFkW/5saj16sdUBTkD
         CDng==
X-Gm-Message-State: AOJu0YxtFug+xMHEYOLLekVP/tc1K6uIMO+mvDfeHv6EsS+NmNJIoLAN
	5IDOeJZGDTW5JQR5Js5+ozdwd5e4NdotOOjKi1qdo8iw7YTe6jq7KnS+znMbSVZt6ewamyjserO
	o+K6JM2s7KYWI
X-Gm-Gg: AeBDieuhRr5N3LrEZMGnLRH1g2mY+h2ETIMC3tY2EShsQ4BiogdYAYtEalvMh1aHg87
	hn6s+vUQ4M1XbkP7d4A6QL8kpCaxkLfsMgyZsIQLG3oGgXp4rbkhXL/vyvuzTZkjb8ttcuIMMXe
	FdvaSkZdKSORpZiKOxVlHKaF5+OLCqdLJQ025WYIG1cRv/BZ7xIiymn/89mw1e0sUvT3cO+Y1MG
	x9fZcqXlXYcR8sisvd0gSbnZGjH4yhdI7L5+vcyX5tPqDmVdkM2fxMSt7rLZauWvUT3oniV9O/0
	3dpUztSHs6gPL5O8otKs7kkQZPnsSyGbMRV0uEmTqUdrmaw7otyRSVMiN6woHbGCRam/t0DcZx3
	5UKzv4sruqeKwIzdoob9Lj/7cyn4nH13SRU3XkR44Q0DvKy515b3kobnPZV8IzVHIDyVWa/aj5w
	P+JuxInx6nB0Z6bJ9U6XFQAjGk/1UCztaLb+6hDssvGx7i0PyUoA6l8faaD3lUx+Xlbuuk13ivT
	bkZk0i+o9UQMfzWo83PmftGlMG85tg2mpo50A==
X-Received: by 2002:a05:600c:1da1:b0:488:d376:42cd with SMTP id 5b1f17b1804b1-488fb785901mr519006155e9.22.1777064233095;
        Fri, 24 Apr 2026 13:57:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 63/66] sudo: upgrade 1.9.17p1 -> 1.9.17p2
Date: Fri, 24 Apr 2026 22:56:02 +0200
Message-ID: <76b98657e3dc9da01a746deb7b9d08cb84ba44b6.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235936

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for sudo: 1.9.17p1 -> 1.9.17p2
============================================================

	Merge sudo 1.9.17p2 from branch 'main' into sudo-1.9
	[d1b48c651]

	* configure, configure.ac:
	Fix check for which man page type to use with nroff

	Fixes a bug where configure would use *.man instead of *.mdoc on
	systems without mandoc. Bug #1077.
	[aa2498e46]

	* plugins/sudoers/log_client.c:
	client_msg_cb: make warning match the function that failed
	[f73162df3]

2025-07-23  Todd C. Miller  <Todd.Miller@sudo.ws>

	* NEWS, configure, configure.ac:
	Sudo 1.9.17p2
	[f0e1a5ca3]

	* plugins/sudoers/match_command.c, plugins/sudoers/match_digest.c:
	digest_matches: plug fd leak on snprinf() failure
	[26a1a7529]

2025-07-21  Todd C. Miller  <Todd.Miller@sudo.ws>

	* etc/sudo-logsrvd.pp, etc/sudo-python.pp, etc/sudo.pp,
	scripts/mkpkg:
	Add a way to override pp_rpm_arch when building rpms

	This will be used to build x86_64_v2 packages for Alma Linux.
	[55d3c99c4]

	* configure, configure.ac:
	Fix check for which man page type to use with nroff

	Fixes a bug where configure would use *.man instead of *.mdoc on
	systems without mandoc.
	[2dc10cfbd]

	* plugins/sudoers/timestamp.c:
	ts_write: call lseek after fruncate on short write

	We need to make sure the file position is reset to the old EOF on
	error.
	[8e7e0e23f]

2025-07-20  Todd C. Miller  <Todd.Miller@sudo.ws>

	* src/exec_ptrace.c:
	ptrace_readv_string: quiet sign-compare warning
	[fac2a49e7]

	* src/exec_ptrace.c:
	ptrace_readv_string: properly handle reads of more than one page

	When the intercept and intercept_verify options are enabled and
	either argv[] or envp[] contains a string larger than the page size
	(usually 4096), ptrace_readv_string() would fill the buffer with
	mutiple copies of the same string. Fixes GitHub issue #453.
	[2e93eabed]

2025-07-14  Todd C. Miller  <Todd.Miller@sudo.ws>

	* src/exec_pty.c:
	revoke_pty: use killpg() not kill() to send HUP to the process group

	Also make sure we never call killpg(-1, SIGHUP), which would send
	SIGHUP to process 1 (init). It is possible for cmnd_pid to be -1 in
	certain error conditions where sudo killed the command itself. This
	may explain GitHub issue #458.
	[fb208d383]

2025-07-08  Todd C. Miller  <Todd.Miller@sudo.ws>

	* etc/sudo-logsrvd.pp, etc/sudo-python.pp, etc/sudo.pp, scripts/pp:
	Don't assume RHEL major version is only a single digit

	Fixes handling of RHEL 10 and higher.
	[e5d953f33]

	* plugins/sudoers/visudo.c:
	visudo: create temporary file as mod 0600 not 0700

	This was due to a typo in the mode field when the temporary file was
	created. Noticed by Bjorn Baron of the sudo-rs project.
	[1c254b330]

2025-06-30  Todd C. Miller  <Todd.Miller@sudo.ws>

	* Makefile.in:
	We now build sudo releases from git, not mercurial
	[cb4e26734]

2025-06-28  Todd C. Miller  <Todd.Miller@sudo.ws>

	* NEWS, configure, configure.ac:

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
(cherry picked from commit 12e9ba655153a9cb7c2b79cf52a2300e19634dcf)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../files/0001-sudo.conf.in-fix-conflict-with-multilib.patch    | 2 +-
 .../sudo/{sudo_1.9.17p1.bb => sudo_1.9.17p2.bb}                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.17p1.bb => sudo_1.9.17p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index 1989c5abd7c..f96ab4b1f6d 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 8c69192754ba73dd6e3273728a21aa73988f4bfb Mon Sep 17 00:00:00 2001
+From 3b9ed5e1ae1e217158af7d9128e35ef3463bc107 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.17p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 5b9d73b33b1..d715bc2075f 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32"
+SRC_URI[sha256sum] = "4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"

