Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FAEC531C9
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5474.1784741054453270114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SehE7Lxk;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495590dde14so38695995e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741053; x=1785345853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2s5a5IVjL7D1G9uuuYTzKJ9TFO7iDt58VxEA7trDunI=;
        b=SehE7LxkLOWkwgXcHb3OJKnqTrDO22YhYoOCBUZhkwR8xBuhUQqsbEN8BdcwQ/lV0q
         HgF+k+WlkKv+1/fwcxim53gJYPsYw6NH6OuuyfkU9JonkdHvzDfDjBS9j2bXhgLkCmgo
         TvVLNfajlXe7bzfR/yIzTa8erkc4C9LzNmoxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741053; x=1785345853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2s5a5IVjL7D1G9uuuYTzKJ9TFO7iDt58VxEA7trDunI=;
        b=tFeynFXcN5ghI7tJ+QqNZpXbhtfy8B8Ou6KUVBfq+GlCh3VSzRb4IUYHUed60/64a7
         rn6iqoMOimI83RmUprSO+iuzEE6uOYxvK/Mhape6cRW2rcjWxhyc+SCTagGa4Z+fBFan
         hXq0CsMITZUxJ5RmAJIlBF6PMZ2G/unJWUCfshaiGUb1LwPuImGPpiR9D40xpBLCk/7d
         sQZ1s/XVJzu6LHnIbgV6THkjKqUJKpwh3iHxufIcKbMGLCepLGP9Inal8G+6vW3jGWUY
         7K0G3eYXYShCF160XANVr+kEjc54Y1HwEUs/cz3sKIENlTnLW6U7gojgUDX17FK1w6aM
         t+Yw==
X-Gm-Message-State: AOJu0Yz5HIe6TGJ3UTm42OL6cu87QUlm1iSCfn/u/osoYvtPy9Ommx6z
	4vnMT4R9CofwF0sv9ir5bZR/VI+EH68DffIYc6isbrlhg0Eg/78fs6lCVd76IOvDjgTfun7nsDY
	hhwgHRLw=
X-Gm-Gg: AR+sD11OVjeyE7Fbz2Q/6eTcuBDQtQnYhb8hvgWMH2lh+wb06skcHPXO5CKpiqtkRjv
	OIv39UvlQJYgmtyJn5nqXmbZo5rHXjPFvnszdXjIQdptrPdzHbbW8BoKsUGrbPsd9JRe+qeJeui
	qQUvTrSlBgF1JzwXIfI+TCFFAzxIRKm5n9BAowOruHizMhOlRasmkGGysIrWdq2OO5yywqS9hs2
	dgsStiUeq04E8zTVWzffsxUf+swvvcSUFHlJ4chxHP8tl38ebRUOxG5mGN4ca4L66pFqArZZ35k
	X7gy/oNYyllVhZWpNQgtKDrk5joxY0EFRlq1SylmX3AznZqWp8nTpOounohQ4M4XCiCCsKnWOf7
	xuC3Fc9YScgLh/jJ45Er2/q1kRf65NuLasAtKFh1bKTF24OZ6qTNvwHrCfqIX0k0BOVBMF9Jjs5
	oFZWvVp4cHtQhQslelKI0jfcPyy3oaa3LbZxAso35sHfSKV9n68jry0QFyWDJXuA0vBPoA+TbXQ
	6glEA/rTgic
X-Received: by 2002:a05:600c:c4aa:b0:495:6934:414c with SMTP id 5b1f17b1804b1-495693442b8mr71388335e9.19.1784741052585;
        Wed, 22 Jul 2026 10:24:12 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/27] openssh: Fix CVE-2026-60002
Date: Wed, 22 Jul 2026 19:23:38 +0200
Message-ID: <9350aca86f6a0252156c644370829e944cc628d8.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241735

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-60002. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/e8bdfb151a356d0171fea4194dd205fbb252be23
[2] https://www.cve.org/CVERecord?id=CVE-2026-60002

Signed-off-by: Devansh Patel <devanshp@cisco.com>
[YC: Patch referenced in https://ubuntu.com/security/CVE-2026-60002]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-60002.patch      | 225 ++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch
new file mode 100644
index 00000000000..85937279a20
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch
@@ -0,0 +1,225 @@
+From b571549bc93e95f0d3d563094f825544228501de Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 6 Jul 2026 07:49:58 +0000
+Subject: [PATCH] upstream: fix ownership and lifetime of several bits of
+ client
+
+state that need to persist for the life of the connection, especially the
+cached hostkey that was being incorrectly freed early on some paths, possibly
+allowing its use after free.
+
+Reported by Zhenpeng (Leo) Lin from depthfirst.com
+
+OpenBSD-Commit-ID: faaa6ad72e7d69d41fa8b197b606265b7d9bc73f
+
+CVE: CVE-2026-60002
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/e8bdfb151a356d0171fea4194dd205fbb252be23]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunks in ssh.c,
+  sshconnect.c, sshconnect.h, and sshconnect2.c and retained the Wrynose
+  OpenSSH 10.3p1 revisions because this stable backport carries only the
+  functional security changes.
+
+(cherry picked from commit e8bdfb151a356d0171fea4194dd205fbb252be23)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ ssh.c         | 24 ++----------------------
+ sshconnect.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++--
+ sshconnect.h  |  7 +++++--
+ sshconnect2.c | 20 +++++++++++---------
+ 4 files changed, 63 insertions(+), 35 deletions(-)
+
+diff --git a/ssh.c b/ssh.c
+index 531f28eb2..efb8930f4 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -612,26 +612,6 @@ set_addrinfo_port(struct addrinfo *addrs, int port)
+ 	}
+ }
+ 
+-static void
+-ssh_conn_info_free(struct ssh_conn_info *cinfo)
+-{
+-	if (cinfo == NULL)
+-		return;
+-	free(cinfo->conn_hash_hex);
+-	free(cinfo->shorthost);
+-	free(cinfo->uidstr);
+-	free(cinfo->keyalias);
+-	free(cinfo->thishost);
+-	free(cinfo->host_arg);
+-	free(cinfo->portstr);
+-	free(cinfo->remhost);
+-	free(cinfo->remuser);
+-	free(cinfo->homedir);
+-	free(cinfo->locuser);
+-	free(cinfo->jmphost);
+-	free(cinfo);
+-}
+-
+ /*
+  * Main program for the ssh client.
+  */
+@@ -1799,8 +1779,8 @@ main(int ac, char **av)
+ 	ssh_signal(SIGCHLD, main_sigchld_handler);
+ 
+ 	/* Log into the remote system.  Never returns if the login fails. */
+-	ssh_login(ssh, &sensitive_data, host, (struct sockaddr *)&hostaddr,
+-	    options.port, pw, timeout_ms, cinfo);
++	ssh_login(ssh, &sensitive_data, host, &hostaddr, options.port,
++	    pw, timeout_ms, cinfo);
+ 
+ 	/* We no longer need the private host keys.  Clear them now. */
+ 	if (sensitive_data.nkeys != 0) {
+diff --git a/sshconnect.c b/sshconnect.c
+index 4384277a6..3d338ff23 100644
+--- a/sshconnect.c
++++ b/sshconnect.c
+@@ -70,6 +70,49 @@ extern char *__progname;
+ static int show_other_keys(struct hostkeys *, struct sshkey *);
+ static void warn_changed_key(struct sshkey *);
+ 
++void
++ssh_conn_info_free(struct ssh_conn_info *cinfo)
++{
++	if (cinfo == NULL)
++		return;
++	free(cinfo->conn_hash_hex);
++	free(cinfo->shorthost);
++	free(cinfo->uidstr);
++	free(cinfo->keyalias);
++	free(cinfo->thishost);
++	free(cinfo->host_arg);
++	free(cinfo->portstr);
++	free(cinfo->remhost);
++	free(cinfo->remuser);
++	free(cinfo->homedir);
++	free(cinfo->locuser);
++	free(cinfo->jmphost);
++	freezero(cinfo, sizeof(*cinfo));
++}
++
++struct ssh_conn_info *
++ssh_conn_info_dup(const struct ssh_conn_info *cinfo)
++{
++	struct ssh_conn_info *ret;
++
++	if (cinfo == NULL)
++		return NULL;
++	ret = xcalloc(1, sizeof(*ret));
++	ret->conn_hash_hex = xstrdup(cinfo->conn_hash_hex);
++	ret->shorthost = xstrdup(cinfo->shorthost);
++	ret->uidstr = xstrdup(cinfo->uidstr);
++	ret->keyalias = xstrdup(cinfo->keyalias);
++	ret->thishost = xstrdup(cinfo->thishost);
++	ret->host_arg = xstrdup(cinfo->host_arg);
++	ret->portstr = xstrdup(cinfo->portstr);
++	ret->remhost = xstrdup(cinfo->remhost);
++	ret->remuser = xstrdup(cinfo->remuser);
++	ret->homedir = xstrdup(cinfo->homedir);
++	ret->locuser = xstrdup(cinfo->locuser);
++	ret->jmphost = xstrdup(cinfo->jmphost);
++	return ret;
++}
++
+ /* Expand a proxy command */
+ static char *
+ expand_proxy_command(const char *proxy_command, const char *user,
+@@ -1585,8 +1628,8 @@ warn_nonpq_kex(void)
+  */
+ void
+ ssh_login(struct ssh *ssh, Sensitive *sensitive, const char *orighost,
+-    struct sockaddr *hostaddr, u_short port, struct passwd *pw, int timeout_ms,
+-    const struct ssh_conn_info *cinfo)
++    struct sockaddr_storage *hostaddr, u_short port, struct passwd *pw,
++    int timeout_ms, const struct ssh_conn_info *cinfo)
+ {
+ 	char *host;
+ 	char *server_user, *local_user;
+diff --git a/sshconnect.h b/sshconnect.h
+index 4c19490da..8da0e04b9 100644
+--- a/sshconnect.h
++++ b/sshconnect.h
+@@ -76,7 +76,7 @@ int	 ssh_connect(struct ssh *, const char *, const char *,
+ void	 ssh_kill_proxy_command(void);
+ 
+ void	 ssh_login(struct ssh *, Sensitive *, const char *,
+-    struct sockaddr *, u_short, struct passwd *, int,
++    struct sockaddr_storage *, u_short, struct passwd *, int,
+     const struct ssh_conn_info *);
+ 
+ int	 verify_host_key(char *, struct sockaddr *, struct sshkey *,
+@@ -85,7 +85,7 @@ int	 verify_host_key(char *, struct sockaddr *, struct sshkey *,
+ void	 get_hostfile_hostname_ipaddr(char *, struct sockaddr *, u_short,
+     char **, char **);
+ 
+-void	 ssh_kex2(struct ssh *ssh, char *, struct sockaddr *, u_short,
++void	 ssh_kex2(struct ssh *ssh, char *, struct sockaddr_storage *, u_short,
+     const struct ssh_conn_info *);
+ 
+ void	 ssh_userauth2(struct ssh *ssh, const char *, const char *,
+@@ -101,3 +101,6 @@ void	 load_hostkeys_command(struct hostkeys *, const char *,
+     const struct sshkey *, const char *);
+ 
+ int hostkey_accepted_by_hostkeyalgs(const struct sshkey *);
++
++void ssh_conn_info_free(struct ssh_conn_info *);
++struct ssh_conn_info *ssh_conn_info_dup(const struct ssh_conn_info *);
+diff --git a/sshconnect2.c b/sshconnect2.c
+index 478a9a52f..50ac6b89d 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -83,7 +83,7 @@ extern Options options;
+  */
+ 
+ static char *xxx_host;
+-static struct sockaddr *xxx_hostaddr;
++static struct sockaddr_storage xxx_hostaddr;
+ static const struct ssh_conn_info *xxx_conn_info;
+ static int key_type_allowed(struct sshkey *, const char *);
+ 
+@@ -99,7 +99,7 @@ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+ 		fatal("Server host key %s not in HostKeyAlgorithms",
+ 		    sshkey_ssh_name(hostkey));
+ 	}
+-	if (verify_host_key(xxx_host, xxx_hostaddr, hostkey,
++	if (verify_host_key(xxx_host, (struct sockaddr *)&xxx_hostaddr, hostkey,
+ 	    xxx_conn_info) != 0)
+ 		fatal("Host key verification failed.");
+ 	return 0;
+@@ -216,16 +216,16 @@ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port,
+ }
+ 
+ void
+-ssh_kex2(struct ssh *ssh, char *host, struct sockaddr *hostaddr, u_short port,
+-    const struct ssh_conn_info *cinfo)
++ssh_kex2(struct ssh *ssh, char *host, struct sockaddr_storage *hostaddr,
++    u_short port, const struct ssh_conn_info *cinfo)
+ {
+ 	char *myproposal[PROPOSAL_MAX];
+ 	char *all_key, *hkalgs = NULL;
+ 	int r, use_known_hosts_order = 0;
+ 
+-	xxx_host = host;
+-	xxx_hostaddr = hostaddr;
+-	xxx_conn_info = cinfo;
++	xxx_host = xstrdup(host);
++	xxx_hostaddr = *hostaddr;
++	xxx_conn_info = ssh_conn_info_dup(cinfo);
+ 
+ 	if (options.rekey_limit || options.rekey_interval)
+ 		ssh_packet_set_rekey_limits(ssh, options.rekey_limit,
+@@ -248,8 +248,10 @@ ssh_kex2(struct ssh *ssh, char *host, struct sockaddr *hostaddr, u_short port,
+ 		fatal_fr(r, "kex_assemble_namelist");
+ 	free(all_key);
+ 
+-	if (use_known_hosts_order)
+-		hkalgs = order_hostkeyalgs(host, hostaddr, port, cinfo);
++	if (use_known_hosts_order) {
++		hkalgs = order_hostkeyalgs(host, (struct sockaddr *)hostaddr,
++		    port, cinfo);
++	}
+ 
+ 	kex_proposal_populate_entries(ssh, myproposal,
+ 	    options.kex_algorithms, options.ciphers, options.macs,
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index d8d73ee5dd0..8edb1440fe0 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-59996.patch \
            file://CVE-2026-59995.patch \
            file://CVE-2026-60001.patch \
+           file://CVE-2026-60002.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 

