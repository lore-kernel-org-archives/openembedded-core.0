Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A5FC44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:57:09 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3656.1784570226468789114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Qkdc7T9V;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9482; q=dns/txt;
  s=iport01; t=1784570226; x=1785779826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IKREtDyPRtOVdKXPGohaXyWPdxwV9gsljGCBxGUzwn4=;
  b=Qkdc7T9Vdz647J1MZS9dl+Ttn/rfMOkuY+86++Y63Bb5pDQasNARU7qG
   4AyZKV9JP6SOuNlLmKltGo48NxsYY+BY0f1C6237I0mG7XcaRwNoFNiZJ
   7f4qxtJ+ewipXDC7NKz4I3MB8tMfxNQYwLw4BtdR7cy3MLyRT7Hfs9GQt
   29ErmgsIrSragPrTiCtLyddzr4uQDYbzwYUhsWUb0kriIffZRhNYeFzil
   VLLktr6CeZBzjzAZp+WfYe7JfmDOttBQchR4ketzu2NVGiD7VWQfx7tS/
   v6pSjmsC5Y6a3mGpJx+JlWJknhHZFIEWlm5fkqjAF/sQtxFYjxCmR6GUY
   A==;
X-CSE-ConnectionGUID: s933WEbzQYq3gD/ruvYMQA==
X-CSE-MsgGUID: K2/zQmU6QwW7wbuqcSu4NQ==
X-IPAS-Result: =?us-ascii?q?A0BKAgCzYF5q/4z/Ja1aglmCV3RfQkmWSgOBE50IgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDJwsBGAEbEhAcAwECFwEXKyMIGRmCaQGCdAIBEbt8g?=
 =?us-ascii?q?XkzgQGDKAE/AkNQ2y4BCxQBBYEzhT+IIFwYAYR8JxsbgXKBFYJzdoEFgVwCA?=
 =?us-ascii?q?gEXgS5gAoV7BIIiehKBWh6DXowWSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EMGwcFgR2BOoEChHQjHwM5f4EvdUp3LWkBEheBJoISAoE7Ag4DCxgNS?=
 =?us-ascii?q?BEsNxQZBD5uB41AI4JAfw8BExiBGjdbHJMSEZI3gTWfWgoog3WMIY4Nhy0aM?=
 =?us-ascii?q?4VbpRELmH2OCpZQhGmBaDyBWXAVgyIJShkPji0LC4NghRPJRyQ1CzIBAQcCB?=
 =?us-ascii?q?w4DC4FokAKBfAEB?=
IronPort-Data: A9a23:BM0Si6A5+wrBCRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApGt0gmcBy
 mEeUG3Ubq2PNmf3KN13YInlpBtXvcTQzoQ1OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/g2YqWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2KQ1V34bN58hy/8sDk0J7
 +EGGRU0R0XW7w626OrTpuhEnM8vKozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY3BPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5FEoiuCybYaIIbRmQ+12xAGKn
 2f7oV3mPU4FPsGGwgGYrlSV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KPpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOb9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:0s02+6HlPSxRThlwpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:FukfyW2Ab/TdiScE2GlL+rxfAZF+KULwxmXpElbjBkouUqCLeHqp0fYx
X-Talos-MUID: 9a23:o/hOVQvRXpQJBULvv82np2slJv5t3vqXF39Sjp8bosK/KHBWAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512075453"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:57:05 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id BFCDE180001C7;
	Mon, 20 Jul 2026 17:57:05 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 1E2EECEC318; Mon, 20 Jul 2026 10:57:05 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][wrynose][PATCH 7/8] openssh: Fix CVE-2026-60002
Date: Mon, 20 Jul 2026 10:55:17 -0700
Message-Id: <20260720175518.3546447-7-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720175518.3546447-1-devanshp@cisco.com>
References: <20260720175518.3546447-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241473

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-60002. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/e8bdfb151a356d0171fea4194dd205fbb252be23
[2] https://www.cve.org/CVERecord?id=CVE-2026-60002

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-60002.patch      | 225 ++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch
new file mode 100644
index 0000000000..85937279a2
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
index dba0dcaa8a..d3d00b994d 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-59996.patch \
            file://CVE-2026-59995.patch \
            file://CVE-2026-60001.patch \
+           file://CVE-2026-60002.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


