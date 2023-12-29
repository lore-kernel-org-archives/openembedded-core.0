Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C05C47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 16:08:08 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.151595.1703866079685948860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 08:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Y2LzEu3F;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6d9bbf71bc8so1430389b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703866079; x=1704470879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWUlHFMacaKVsYIFfIMK6XqQUNJKQAbWIDxf7eI/1Ys=;
        b=Y2LzEu3F6QJpkNnu/Cu0GtOGdBtxoaU95oCSqqQRCj19YhbJNgDfGd2YzzsIvQXVhA
         jtMNH7Ngwq3fGR16c/z5VT8z9yj7fPgwMbrIFMh3dnjWOdIOf6ar07zc8ak5UIonWH8Q
         qepn3Ji5KHeSfxNajqhuEZsDklW7UewgcY4kTldgQIHTSqoSdrK59YZY4fH2apApx0OU
         JJykhs8qst+NiX5xUMhBHRk8dDTCh0BctTWGtYBWM+Sh6Tiel2vGEpIidSk5NsuMLMmh
         NdvC17MWfkvtwSFEUaB+qv3evUvXhUC/Cc8DcxyLGokx+BZ544qn2L6RlfZZDtOymYQA
         5KuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703866079; x=1704470879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWUlHFMacaKVsYIFfIMK6XqQUNJKQAbWIDxf7eI/1Ys=;
        b=KU/smrV3YXLFktGb1EFDS7fyOOYN5VGX+MwW43/gPSRQ9+cwk1nbCqxFn+IXc7yqQ7
         F5Bcft1/nLSfztgAK6MfiG0FNjFxa1RkMJGyUrj58oJNFF0BMOybjZiZDfS4B+H+u2m0
         xwr0PccLcgZB/G0R0mN0Jfwm17qldA5RLqmupanHRNy8rVDhOkR0pxfoZ5ts3zP7EnMB
         ZNPwOAZmsYsnCxLdzSvtHYJb7cqu7D7yrSO+/caEnPbi5jY80dki2EqY2vpvM17bqusu
         0VvHTXymp+rqYu8chv+Tkwj7/PDxgdRuaGZoN/On4doNavUlGX3Glv61AdybiSp5b3fi
         oeIg==
X-Gm-Message-State: AOJu0Yy1sQK/xymbDhKrS1VVWU8X0Zk8Oj57IMk7+s04Zq6/kSgNoC1Y
	vtvql1keoayy3WcvSeJcJQXHa9v9zY3SAZthK9rk9sxdFPutgw==
X-Google-Smtp-Source: AGHT+IGdVhUKmj+98EPLHheybiDmMUbTVpLb3a5NKrfWgnn6XKXPWbGa12nfQu0CXwZVtbvqAtRtQQ==
X-Received: by 2002:a05:6a20:914f:b0:195:5257:5040 with SMTP id x15-20020a056a20914f00b0019552575040mr3964709pzc.30.1703866078662;
        Fri, 29 Dec 2023 08:07:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u25-20020aa78499000000b006d9b2682c91sm10028691pfn.113.2023.12.29.08.07.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 08:07:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/4] openssh: fix CVE-2023-51385
Date: Fri, 29 Dec 2023 06:07:46 -1000
Message-Id: <617640bd045f07b0870dc9f3bc838b3a9fbc3de7.1703865952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703865952.git.steve@sakoman.com>
References: <cover.1703865952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 16:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193061

From: Archana Polampalli <archana.polampalli@windriver.com>

In ssh in OpenSSH before 9.6, OS command injection might occur if a user name or
host name has shell metacharacters, and this name is referenced by an expansion
token in certain situations. For example, an untrusted Git repository can have a
submodule with shell metacharacters in a user name or host name.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-51385

Upstream patches:
https://github.com/openssh/openssh-portable/commit/7ef3787c84b6b524501211b11a26c742f829af1a

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2023-51385.patch      | 97 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch
new file mode 100644
index 0000000000..b8e6813857
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch
@@ -0,0 +1,97 @@
+From 7ef3787c84b6b524501211b11a26c742f829af1a Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 18 Dec 2023 14:47:44 +0000
+Subject: [PATCH] upstream: ban user/hostnames with most shell metacharacters
+ This makes ssh(1) refuse user or host names provided on the commandline that
+ contain most shell metacharacters.
+
+Some programs that invoke ssh(1) using untrusted data do not filter
+metacharacters in arguments they supply. This could create
+interactions with user-specified ProxyCommand and other directives
+that allow shell injection attacks to occur.
+
+It's a mistake to invoke ssh(1) with arbitrary untrusted arguments,
+but getting this stuff right can be tricky, so this should prevent
+most obvious ways of creating risky situations. It however is not
+and cannot be perfect: ssh(1) has no practical way of interpreting
+what shell quoting rules are in use and how they interact with the
+user's specified ProxyCommand.
+
+To allow configurations that use strange user or hostnames to
+continue to work, this strictness is applied only to names coming
+from the commandline. Names specified using User or Hostname
+directives in ssh_config(5) are not affected.
+
+feedback/ok millert@ markus@ dtucker@ deraadt@
+
+OpenBSD-Commit-ID: 3b487348b5964f3e77b6b4d3da4c3b439e94b2d9
+
+CVE: CVE-2023-51385
+
+Upstream-Status: Backport
+[https://github.com/openssh/openssh-portable/commit/7ef3787c84b6b524501211b11a26c742f829af1a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ ssh.c | 39 +++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 39 insertions(+)
+
+diff --git a/ssh.c b/ssh.c
+index 8ff9788..82ed15f 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -611,6 +611,41 @@ ssh_conn_info_free(struct ssh_conn_info *cinfo)
+	free(cinfo);
+ }
+
++static int
++valid_hostname(const char *s)
++{
++	size_t i;
++
++	if (*s == '-')
++		return 0;
++	for (i = 0; s[i] != 0; i++) {
++		if (strchr("'`\"$\\;&<>|(){}", s[i]) != NULL ||
++		    isspace((u_char)s[i]) || iscntrl((u_char)s[i]))
++			return 0;
++	}
++	return 1;
++}
++
++static int
++valid_ruser(const char *s)
++{
++	size_t i;
++
++	if (*s == '-')
++		return 0;
++	for (i = 0; s[i] != 0; i++) {
++		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
++			return 0;
++		/* Disallow '-' after whitespace */
++		if (isspace((u_char)s[i]) && s[i + 1] == '-')
++			return 0;
++		/* Disallow \ in last position */
++		if (s[i] == '\\' && s[i + 1] == '\0')
++			return 0;
++	}
++	return 1;
++}
++
+ /*
+  * Main program for the ssh client.
+  */
+@@ -1097,6 +1132,10 @@ main(int ac, char **av)
+	if (!host)
+		usage();
+
++	if (!valid_hostname(host))
++		fatal("hostname contains invalid characters");
++	if (options.user != NULL && !valid_ruser(options.user))
++		fatal("remote username contains invalid characters");
+	host_arg = xstrdup(host);
+
+	/* Initialize the command to execute on remote host. */
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 3860899540..bc8e2d81b8 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-authorized-principals-command.patch \
            file://CVE-2023-48795.patch \
            file://CVE-2023-51384.patch \
+           file://CVE-2023-51385.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.34.1


