Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF5DC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5533.1784741051628790818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NhzU7EIn;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so98841505e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741050; x=1785345850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GjhlxKXHEOqwNm8TX4wZmjSkj8BB/aAtbAQTOf4dpWc=;
        b=NhzU7EIndq7obIWZeWqRQ2LmGiVZB13PLSQwP3ArE/Ceh9ls5GSPTfEBDysyK8rBb0
         Ol5LuE51llkD4G12+jCCOifhKabNGzcWmEjsAODyW+HujoG0MpzdqRXc/I2xTFEeOjk0
         AecSXKYk3VC119ddPdT3xQ2+bT+e/DMbdubsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741050; x=1785345850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GjhlxKXHEOqwNm8TX4wZmjSkj8BB/aAtbAQTOf4dpWc=;
        b=AUPs82hoMa3H1GcZkViUeRQphtvFuEHXs4VlmYRLP0yHu17wvEGsfk420VvTyAS3AS
         jrk81Hv/izC8r/8igUZF+hbABeloMZNgBGnMWO/HuvkF9jZfeHy3BDN3TKE5G9IUeBIR
         2FvPzcLIjhKqZXCpmqGXNpt5BnDB6qhxdcrcX06z2zLxYFWsPlZYtoXipNJSojAxtpH9
         LQmwesZIeftkqm+YwqXT7p/FQ8uH7SIdTime8i+Zo1nYCWOnxNXdRm3b4FNgSyBDHyw/
         K4/hH8PcQPSLEXuFNFEqIEizdmX7SMO+mHSS82o4G4Z6fo6tkPw0dYBGv/cPqxi31Lha
         4XeQ==
X-Gm-Message-State: AOJu0Yw+lVStF3Tkbckrx0ELJnCKsi4o8VyD28cOf2+OXpbSo9jljDJh
	vqiBbgb27vHTtEeHgGOM9zCr+CrJUDXrx7lXYvZdllmJyf4kamicZLd28TLPigfCvGinskmO3Mk
	x0i5sUOw=
X-Gm-Gg: AR+sD1170OaAHBZ6ZskjwPd82MeeztW6qOsoGfO2GTtwRLRvf/e51ATR282vfANFRsM
	QFOV26AygU+5ErcbTMOvo98Wjc99quk6uWLiGpE1LYzwfn/Uk2BG7nOcioMEAQ/mVNyqh4dbQ7L
	sLk2/a2CTFTQsqvJK5BXDpI0NBXHdk6tr4mgfkdqs80q7c4tcr0NZ1ufin/mVfYJhGZoE7O7WIg
	vr9nTL3smhYSWQym9Ql/1j+0CSXITHrhWa/Ly21XvtXB2cbUV7ZRGZHCRZLpDikJBV874i6bNQd
	+eS31ZoasMPLH6PO07zYGadKenduOum2WUhhL+idNxgBKjFvQNe9Q6BmptB5sLtBc46+Dggh/Dq
	lMnRX/dkbMqiXVP8LLa2ViOB+gkHdbpXpiPlLLrqOyZuytWoUFs/mH5ii/QvS/YanwRDeHLznob
	aZbcc2C2D8/AD45kdyLvqlGPicvm+XgY4lPbx6yv8H95fMTLqMwZj4VtKcGAnQXdt8WCsz/bluj
	GB8+XtXKJ5W
X-Received: by 2002:a05:600d:9:b0:495:5e07:649b with SMTP id 5b1f17b1804b1-4955e16aca3mr165429335e9.24.1784741049798;
        Wed, 22 Jul 2026 10:24:09 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/27] openssh: Fix CVE-2026-59997
Date: Wed, 22 Jul 2026 19:23:34 +0200
Message-ID: <66bc605a9ae474b9e0f794cf1e3f4cd1294b8647.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241731

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-59997. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/e9916c44c1324ab9ab022719e4df08a390a83014
[2] https://www.cve.org/CVERecord?id=CVE-2026-59997

Signed-off-by: Devansh Patel <devanshp@cisco.com>
[YC: patch referenced at https://ubuntu.com/security/CVE-2026-59997]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-59997.patch      | 60 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
new file mode 100644
index 00000000000..7d77fbcc9eb
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
@@ -0,0 +1,60 @@
+From 91ce99061c78d0ae84dafc96409c8ea9746f70c0 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 5 Jun 2026 08:53:07 +0000
+Subject: [PATCH] upstream: pass >9 commandline arguments to the internal-sftp
+ server,
+
+previously they were silently dropped; reported by Steve Caffrey ok deraadt@
+
+OpenBSD-Commit-ID: ee6cd5430a3ca027c3223af54b58ad3cc7ccd624
+
+CVE: CVE-2026-59997
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/e9916c44c1324ab9ab022719e4df08a390a83014]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk in session.c and
+  retained the Wrynose OpenSSH 10.3p1 revision because this stable
+  backport carries only the functional security change.
+
+(cherry picked from commit e9916c44c1324ab9ab022719e4df08a390a83014)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ session.c | 19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/session.c b/session.c
+index 93de35d7c..b1f125a3c 100644
+--- a/session.c
++++ b/session.c
+@@ -1607,21 +1607,22 @@ do_child(struct ssh *ssh, Session *s, const char *command)
+ 		exit(1);
+ 	} else if (s->is_subsystem == SUBSYSTEM_INT_SFTP) {
+ 		extern int optind, optreset;
+-		int i;
+-		char *p, *args;
++		int sftp_argc;
++		char **sftp_argv;
+ 
+ 		setproctitle("%s@%s", s->pw->pw_name, INTERNAL_SFTP_NAME);
+-		args = xstrdup(command ? command : "sftp-server");
+-		for (i = 0, (p = strtok(args, " ")); p; (p = strtok(NULL, " ")))
+-			if (i < ARGV_MAX - 1)
+-				argv[i++] = p;
+-		argv[i] = NULL;
++		if (argv_split(command == NULL ? "sftp-server" : command,
++		    &sftp_argc, &sftp_argv, 1) != 0) {
++			error("internal error: can't split internal-sftp "
++			    "arguments");
++			exit(1);
++		}
+ 		optind = optreset = 1;
+-		__progname = argv[0];
++		__progname = sftp_argv[0];
+ #ifdef WITH_SELINUX
+ 		ssh_selinux_change_context("sftpd_t");
+ #endif
+-		exit(sftp_server_main(i, argv, s->pw));
++		exit(sftp_server_main(sftp_argc, sftp_argv, s->pw));
+ 	}
+ 
+ 	fflush(NULL);
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 53704a0cc7e..e611db65ff8 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://CVE-2026-59999.patch \
+           file://CVE-2026-59997.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 

