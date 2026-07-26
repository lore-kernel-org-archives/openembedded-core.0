Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22DBC531F9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7380.1785054618201952158
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=in2JW9aK;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so18641125e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054616; x=1785659416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=apZ3VK40LjVAjHexBZKCnow9Trv/S8NpL2OrVXORVSU=;
        b=in2JW9aKWevQKmO7pcSZ+2leL1cSEGJ2/S+5B7MaO6ISpqYAknYwIhAkYSs5juoaNQ
         qhHX07FGBCH9SWKwm+NhWgH1SNvpLeLbJiCKmYr+/yzm0XyqHJFVJNGITmASdXRVCo95
         +nutZKCEWr9hM8cOAxEDOLzo3y8JeHkzCg3Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054616; x=1785659416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=apZ3VK40LjVAjHexBZKCnow9Trv/S8NpL2OrVXORVSU=;
        b=rBOePzUg8oCnxwPMG0AnSGubtU+suFt1cP2sSLonlwt+zjnwkLwvrcyVUGCMY9f4Ei
         cCXcREZEt1vbGNaYM6jn/MpJT0QAP9VvTeNfyhChPK0/UiKjbgdd98KJrzJ8I6EZkHnn
         Vldt17hEg2bY+DvBMdEQ5sVABhUnrZ5uFVfj0cyb8bYqYD2tQU/Z9cquFHdUNAOJgK2B
         pa5JKHuxJ1+IqTRXBIwFq3N5RCGbBrxbdlXAKGQB8iBU0z9hZ3QrKPWHM1HU5zRmGFNO
         POn5xxTIMm1gsGC6ZNEY0dcTOki0YMQ9IXqTNhxCyG/1QUbY/heBGHux6HLdvgZGzoPS
         VSiA==
X-Gm-Message-State: AOJu0YyqXVYNSg0SKNBDBWRgt2BMyYEmj1scIU/GaxyCVZZH3J0Jv0La
	xzVV49JNBrjPRBmwQNvPh8h7f4m3S3flMNzTCtPiLDvMak3avWjJEKS3/W0vk2P1N466amuqQhW
	OpNNu6+c=
X-Gm-Gg: AR+sD12byzNx1JToUmrUk87O0mWxUywqhTcmxqq1NgWRn4NPw37a51jizZ8AMUcnY6V
	u+WDLKFsqAzDnhwpapxPYMH17x+V95P2dOaufehkKKYKIlqGebDBGSmWSSKpMW4GlCw16lyIFhB
	BbAQthTT/3yGgjbON6UBt9gpyRtv3l/rtRIt5vYatPmyvuSMzZJ8uIbLoG8Pf2cFBa5hUVr6D1G
	VyzJPUDXrMQt4G2LMChXR+Ifq2wmrEmOn4dhkyIbbO8pMPXDY9WlE2dOT/6ppquDBXXBb3TQ8sq
	+jC6SpBfog3yPHrc32qlUtj/mnS6+bXR3Kq54g0bRZCOeJjJO8CrtdAjEL9UsyeFgs5iz0AhfxQ
	vJsYLrsTjCHoWo2qG0wPM3uo4s8u+Atyzlh6AxDEIiiNXoefH5ZeSVrWHBHixJECT2FOJ1+0CTC
	IuH3PAB3H9hYkUsZGtg7bZAttqY/Cy731pJIHpisfTj7hqXu6I+3/PttHWoMJt3eNjlomRTpiua
	xq/2vvaanO1Gi4w
X-Received: by 2002:a05:600c:8b23:b0:493:e404:3727 with SMTP id 5b1f17b1804b1-496b56f9b21mr53928495e9.23.1785054616296;
        Sun, 26 Jul 2026 01:30:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/31] openssh: Fix CVE-2026-60002
Date: Sun, 26 Jul 2026 10:29:35 +0200
Message-ID: <c46f65e3f938efa983b24c53206972972d51da24.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241993

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-60002. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/e8bdfb151a356d0171fea4194dd205fbb252be23
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-60002

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-60002.patch      | 226 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch
new file mode 100644
index 00000000000..9e94e772618
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch
@@ -0,0 +1,226 @@
+From 767104acedd68c317b9d8fb603561e1a8be9e76a Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-60002
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/e8bdfb151a356d0171fea4194dd205fbb252be23]
+
+Backport Changes:
+- Retained Scarthgap's valid_hostname() and valid_ruser() helpers when
+  relocating ssh_conn_info_free() from ssh.c to sshconnect.c.
+- Retained Scarthgap's ext-info-c proposal handling while applying the
+  upstream connection-state ownership and lifetime changes.
+- Retained the Scarthgap OpenBSD revision identifiers in ssh.c,
+  sshconnect.c, sshconnect.h, and sshconnect2.c.
+
+OpenBSD-Commit-ID: faaa6ad72e7d69d41fa8b197b606265b7d9bc73f
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
+index 9c49f98a8..aecdb79ea 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -606,26 +606,6 @@ set_addrinfo_port(struct addrinfo *addrs, int port)
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
+ static int
+ valid_hostname(const char *s)
+ {
+@@ -1771,8 +1751,8 @@ main(int ac, char **av)
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
+index bd077c75c..7823b6782 100644
+--- a/sshconnect.c
++++ b/sshconnect.c
+@@ -83,6 +83,49 @@ extern char *__progname;
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
+@@ -1559,8 +1602,8 @@ out:
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
+index 79d35cc19..da2a73f5a 100644
+--- a/sshconnect.h
++++ b/sshconnect.h
+@@ -71,7 +71,7 @@ int	 ssh_connect(struct ssh *, const char *, const char *,
+ void	 ssh_kill_proxy_command(void);
+ 
+ void	 ssh_login(struct ssh *, Sensitive *, const char *,
+-    struct sockaddr *, u_short, struct passwd *, int,
++    struct sockaddr_storage *, u_short, struct passwd *, int,
+     const struct ssh_conn_info *);
+ 
+ int	 verify_host_key(char *, struct sockaddr *, struct sshkey *,
+@@ -80,7 +80,7 @@ int	 verify_host_key(char *, struct sockaddr *, struct sshkey *,
+ void	 get_hostfile_hostname_ipaddr(char *, struct sockaddr *, u_short,
+     char **, char **);
+ 
+-void	 ssh_kex2(struct ssh *ssh, char *, struct sockaddr *, u_short,
++void	 ssh_kex2(struct ssh *ssh, char *, struct sockaddr_storage *, u_short,
+     const struct ssh_conn_info *);
+ 
+ void	 ssh_userauth2(struct ssh *ssh, const char *, const char *,
+@@ -94,3 +94,6 @@ void	 maybe_add_key_to_agent(const char *, struct sshkey *,
+ void	 load_hostkeys_command(struct hostkeys *, const char *,
+     const char *, const struct ssh_conn_info *,
+     const struct sshkey *, const char *);
++
++void ssh_conn_info_free(struct ssh_conn_info *);
++struct ssh_conn_info *ssh_conn_info_dup(const struct ssh_conn_info *);
+diff --git a/sshconnect2.c b/sshconnect2.c
+index a296c9b8c..9efb3da8a 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -89,7 +89,7 @@ extern Options options;
+  */
+ 
+ static char *xxx_host;
+-static struct sockaddr *xxx_hostaddr;
++static struct sockaddr_storage xxx_hostaddr;
+ static const struct ssh_conn_info *xxx_conn_info;
+ static int key_type_allowed(struct sshkey *, const char *);
+ 
+@@ -105,7 +105,7 @@ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+ 		fatal("Server host key %s not in HostKeyAlgorithms",
+ 		    sshkey_ssh_name(hostkey));
+ 	}
+-	if (verify_host_key(xxx_host, xxx_hostaddr, hostkey,
++	if (verify_host_key(xxx_host, (struct sockaddr *)&xxx_hostaddr, hostkey,
+ 	    xxx_conn_info) != 0)
+ 		fatal("Host key verification failed.");
+ 	return 0;
+@@ -222,16 +222,16 @@ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port,
+ }
+ 
+ void
+-ssh_kex2(struct ssh *ssh, char *host, struct sockaddr *hostaddr, u_short port,
+-    const struct ssh_conn_info *cinfo)
++ssh_kex2(struct ssh *ssh, char *host, struct sockaddr_storage *hostaddr,
++    u_short port, const struct ssh_conn_info *cinfo)
+ {
+ 	char *myproposal[PROPOSAL_MAX];
+ 	char *s, *all_key, *hkalgs = NULL;
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
+@@ -257,8 +257,10 @@ ssh_kex2(struct ssh *ssh, char *host, struct sockaddr *hostaddr, u_short port,
+ 	if ((s = kex_names_cat(options.kex_algorithms, "ext-info-c")) == NULL)
+ 		fatal_f("kex_names_cat");
+ 
+-	if (use_known_hosts_order)
+-		hkalgs = order_hostkeyalgs(host, hostaddr, port, cinfo);
++	if (use_known_hosts_order) {
++		hkalgs = order_hostkeyalgs(host, (struct sockaddr *)hostaddr,
++		    port, cinfo);
++	}
+ 
+ 	kex_proposal_populate_entries(ssh, myproposal, s, options.ciphers,
+ 	    options.macs, compression_alg_list(options.compression),
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 0d9d33c4597..708399e8022 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -42,6 +42,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-59996.patch \
            file://CVE-2026-59995.patch \
            file://CVE-2026-60001.patch \
+           file://CVE-2026-60002.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

