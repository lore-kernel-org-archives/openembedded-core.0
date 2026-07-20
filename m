Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08820C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 18:58:00 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4970.1784573873907972697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 11:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DSec3PRR;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9714; q=dns/txt;
  s=iport01; t=1784573873; x=1785783473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lrCYyRxrB/jLwLvjp23EpnajJ2UinR/1YC8vN8xjpnA=;
  b=DSec3PRRjXBFuiGb/nd7uYt+eGQDz+gz5YRQEF/29O2HOA4gB+BmJOYV
   77FAdNeSMF5vRVMl8hTV+CDF+2KQQH3ki6ewybf73jX4xhQCOAoBJ0vJ0
   ZT/JroQKpK+JIrykFeAVuk10qXmUrNlYcqhPDsjuCQUxC6r2astrHtIb+
   dIxI6/YIJisuONpCFP5NkuO/doYAGCg3yDLgALV9sQoj4N0FY8a38ZQUc
   Rws2JqZUg/jOnmJVIARtwPH1un9/9xTZZAowMyn8ZuvQuwDVo9Uqtacen
   4TAo3yxT0N7SZHyDQMzrffW/3CfH65o1Fs7tK6x8gQUkcpr8yyrEpRNVa
   Q==;
X-CSE-ConnectionGUID: e0DGomuOT5KZWoRBQKWi4g==
X-CSE-MsgGUID: kjqcWq19Sp2RCEf4vPRwCA==
X-IPAS-Result: =?us-ascii?q?A0BJAgCabl5q/4r/Ja1aglmCV3ReQ0mWSgOBE50IgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo1VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDJwsBGAEtEBwDAQIXARcrIwgZGYJpAYJ0AxG8AYF5M?=
 =?us-ascii?q?4EBgygBPwJDUNsuAQsUAQWBM4U/iCBcGAGEfCcbG4FygRWCc3aBBYFcAQEDg?=
 =?us-ascii?q?UVgAoV7BIIiehKBWh6BWIIGjBtIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQwbBwWBHYE6gQKEdCMfAzl/gS91SnctaQESF4EmghICgTsCEwMLGA1IE?=
 =?us-ascii?q?Sw3FBkEPm4HjUEjgkB/DwETFwGBGoEukxIRkjeBNZ9aCiiDdYwhjg2HLRozh?=
 =?us-ascii?q?VulEQuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD44tCwuDYIF/gxTJRycyCzIBA?=
 =?us-ascii?q?QcCBw4DC4FokAKBfAEB?=
IronPort-Data: A9a23:18HzeaxQt/LZcWJpYap6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVVy
 GQeWWuDPK6NYWLyf9Ala4ni8h8H6JGGxtFrSgE4rlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraDpMtcpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJExuEaIf//tQPTxtx
 8MfEho0TS+C2+3jldpXSsE07igiBNPgMIVavjRryivUSK5/B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bM3WjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZCwaIaLJ4XTGpo9ckCwp
 WDf9FvgW0AhLIal4heLrmyUvPDktHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:zoIkgK2TcBH3+gh+PPM86gqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WByB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:8X4XP2FHW7nyTaK0qmJqrGI7HcU4VUGA70XvJHWSMEVWSeGaHAo=
X-Talos-MUID: 9a23:WWiGZwg+PbfJiFFMduiPYMMpN8Vx6Ju3URE2ic88kOSKaTJIASi2pWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="504651177"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 18:57:53 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id DDB6F180001C7;
	Mon, 20 Jul 2026 18:57:52 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 404BECC124D; Mon, 20 Jul 2026 11:57:52 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][scarthgap][PATCH 7/8] openssh: Fix CVE-2026-60002
Date: Mon, 20 Jul 2026 11:57:48 -0700
Message-ID: <20260720185749.4098075-8-devanshp@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260720185749.4098075-1-devanshp@cisco.com>
References: <20260720185749.4098075-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 18:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241484

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-60002. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/e8bdfb151a356d0171fea4194dd205fbb252be23
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-60002

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-60002.patch      | 226 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch
new file mode 100644
index 0000000000..9e94e77261
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
index b15b909f60..a6bf37d8a6 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-59996.patch \
            file://CVE-2026-59995.patch \
            file://CVE-2026-60001.patch \
+           file://CVE-2026-60002.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.44.4


