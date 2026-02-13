Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1873EDF156
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 11:54:52 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69972.1770983682859158237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 03:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jQsfmhfE;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso281845a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 03:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1770983682; x=1771588482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oh5avY9rWgQXqnteYqCxXWVjiZtEAdThpm28Vr3lRBM=;
        b=jQsfmhfECMgE5CiGiBXU1bzHYQyfWYwKkzUnFBufQB5WmpgTZf52dxZCbW5MKKOhMG
         nJ1jy9PYU8Ujk2ZtXgY+uFLmtMrkXl5DJS+ydnt9mZFUV/A5z8pbpeMVkE+F6ixNCvfr
         /uY9Fun50/Oq7+mP8B5mF/9+Lm507btK+0q5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770983682; x=1771588482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oh5avY9rWgQXqnteYqCxXWVjiZtEAdThpm28Vr3lRBM=;
        b=oijhkE1ElGvOek/G82NSQiHjJHWwhoLSB+J+N895sDp2ZjPwaNWYMTEsAVYOYPEB5q
         WjGn+3vlRBd+oiGlHOXSkxFc0ei29WZbSXSk73Nhm6YnhGCKA26OGkT5dzeK3+583ddn
         JNwpOxMak43XZrf3iAM/4rro92Yh5RDswUcQp3aKwhaIvOMn3SvsZWW68S7NmSWcVbs+
         wQmBmzqkhOjJTviUjCondcy0mrVorhMq5Kzu0+GZXKTVunwgCYztzhC8WvBD+uoQ7Sco
         vm0c6G1O86eUSKTWQloj30kgvITUjFtslsmoECkOLslbpKaLUlHe5IODQNjG13vwKyDv
         OsQA==
X-Gm-Message-State: AOJu0Yxlo+DMspr/AR6l6gvGplwWyP/zEhUfeoLhDLgn7sISwWB23oxf
	qWiD3NnrG7W4HQpPA/zf19Nz3WD4qtaJQlTACT8i/HJU6nqYHGq9ZA727zV7vxkYZO39JjHJbtg
	biVeksOU=
X-Gm-Gg: AZuq6aIVZN9tmE43w+p8NpPqmqoUA3yWkos1XvH5cWcDfkrcSQ5xlEXlKKvxSzZcrst
	J1mSFQbFsDngmIgj0vCjOmKsZzWnGLEbmg1VtRcMMr10nw8ua/jtn+2OvYoEFNxKg/jwOU2yFU2
	VQwNsAMCANnSvtLVJvoiV6XWgalwLcWNKsBGB6WE8hwoZFSvcBAJGawTWATT5ysK28uvIaaYeZm
	1QeDfQm/5PiCxrjG7MOVyvm9SapIniOW+TRto49fpv7Zwrf11jbC+977yAo+PlJHc6vWe5x/ALI
	YHxPoznh1NpKcKZZ7fKFgV65zk+Pw2WKib0OfeJvMiEm7V5nSm+J99K8Uol/vP3i6xGU3fN1Sw7
	hjug9YV4/j4gn1gGQTyK5cHaWzCL10ZSGdbz5oim+eWLfK6P3M5yFoXBp/sSIxs8KFC+oYdSzy4
	mYCVVlJOEIJusd2xUeKwJpF2eULn8dEyGXw7kl
X-Received: by 2002:a17:90b:388e:b0:343:eb40:8dca with SMTP id 98e67ed59e1d1-356aad5f533mr1610247a91.19.1770983681812;
        Fri, 13 Feb 2026 03:54:41 -0800 (PST)
Received: from MVIN00013.mvista.com ([150.129.170.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-356a69b38ddsm1680761a91.0.2026.02.13.03.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 03:54:41 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCHv2] libpam: fix CVE-2024-10963
Date: Fri, 13 Feb 2026 17:24:07 +0530
Message-ID: <20260213115407.146405-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 11:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231114

Add "nodns" option to disallow resolving of tokens as hostname.

Pick up "Mitigated by" patch from Debian security tracker.
[0]: https://security-tracker.debian.org/tracker/CVE-2024-10963
Note that the commit that introduced the vulnerability is in upstream
v1.5.3 but was backported as CVE-2022-28321-0002.patch.

Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/commit/940747f88c16e029b69a74e80a2e94f65cb3e628

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../pam/libpam/CVE-2024-10963.patch           | 229 ++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 2 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10963.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch b/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch
new file mode 100644
index 0000000000..8f8e13f5e8
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch
@@ -0,0 +1,229 @@
+From f9ccee5c4c6cb0d4197b08ebeb36c1dceffe82e8 Mon Sep 17 00:00:00 2001
+From: Thorsten Kukuk <kukuk@suse.com>
+Date: Thu, 14 Nov 2024 10:27:28 +0100
+Subject: [PATCH] pam_access: rework resolving of tokens as hostname
+
+* modules/pam_access/pam_access.c: separate resolving of IP addresses
+  from hostnames. Don't resolve TTYs or display variables as hostname
+  (#834).
+  Add "nodns" option to disallow resolving of tokens as hostname.
+* modules/pam_access/pam_access.8.xml: document nodns option
+* modules/pam_access/access.conf.5.xml: document that hostnames should
+  be written as FQHN.
+
+CVE: CVE-2024-10963
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/940747f88c16e029b69a74e80a2e94f65cb3e628]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ modules/pam_access/access.conf.5.xml |  4 ++
+ modules/pam_access/pam_access.8.xml  | 46 ++++++++++++------
+ modules/pam_access/pam_access.c      | 72 +++++++++++++++++++++++++++-
+ 3 files changed, 105 insertions(+), 17 deletions(-)
+
+diff --git a/modules/pam_access/access.conf.5.xml b/modules/pam_access/access.conf.5.xml
+index 8fdbc31..dc505a6 100644
+--- a/modules/pam_access/access.conf.5.xml
++++ b/modules/pam_access/access.conf.5.xml
+@@ -226,6 +226,10 @@
+       item and the line will be most probably ignored. For this reason, it is not
+       recommended to put spaces around the ':' characters.
+     </para>
++    <para>
++      Hostnames should be written as Fully-Qualified Host Name (FQHN) to avoid
++      confusion with device names or PAM service names.
++    </para>
+   </refsect1>
+ 
+   <refsect1 id="access.conf-see_also">
+diff --git a/modules/pam_access/pam_access.8.xml b/modules/pam_access/pam_access.8.xml
+index 9a6556c..eab9d9f 100644
+--- a/modules/pam_access/pam_access.8.xml
++++ b/modules/pam_access/pam_access.8.xml
+@@ -25,11 +25,14 @@
+       <arg choice="opt">
+         debug
+       </arg>
++      <arg choice="opt" rep="norepeat">
++        noaudit
++      </arg>
+       <arg choice="opt">
+         nodefgroup
+       </arg>
+       <arg choice="opt">
+-        noaudit
++        nodns
+       </arg>
+       <arg choice="opt">
+         accessfile=<replaceable>file</replaceable>
+@@ -112,6 +115,33 @@
+         </listitem>
+       </varlistentry>
+ 
++      <varlistentry>
++        <term>
++          nodefgroup
++        </term>
++        <listitem>
++          <para>
++            User tokens which are not enclosed in parentheses will not be
++	    matched against the group database. The backwards compatible default is
++            to try the group database match even for tokens not enclosed
++            in parentheses.
++          </para>
++        </listitem>
++      </varlistentry>
++
++      <varlistentry>
++        <term>
++          nodns
++        </term>
++        <listitem>
++          <para>
++	    Do not try to resolve tokens as hostnames, only IPv4 and IPv6
++	    addresses will be resolved. Which means to allow login from a
++	    remote host, the IP addresses need to be specified in <filename>access.conf</filename>.
++          </para>
++        </listitem>
++      </varlistentry>
++
+       <varlistentry>
+         <term>
+           <option>fieldsep=<replaceable>separators</replaceable></option>
+@@ -153,20 +183,6 @@
+         </listitem>
+       </varlistentry>
+ 
+-      <varlistentry>
+-        <term>
+-          <option>nodefgroup</option>
+-        </term>
+-        <listitem>
+-          <para>
+-            User tokens which are not enclosed in parentheses will not be
+-	    matched against the group database. The backwards compatible default is
+-            to try the group database match even for tokens not enclosed
+-            in parentheses.
+-          </para>
+-        </listitem>
+-      </varlistentry>
+-
+     </variablelist>
+   </refsect1>
+ 
+diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_access.c
+index bca424f..00a0a77 100644
+--- a/modules/pam_access/pam_access.c
++++ b/modules/pam_access/pam_access.c
+@@ -92,6 +92,7 @@ struct login_info {
+     int debug;				/* Print debugging messages. */
+     int only_new_group_syntax;		/* Only allow group entries of the form "(xyz)" */
+     int noaudit;			/* Do not audit denials */
++    int nodns;                          /* Do not try to resolve tokens as hostnames */
+     const char *fs;			/* field separator */
+     const char *sep;			/* list-element separator */
+     int from_remote_host;               /* If PAM_RHOST was used for from */
+@@ -143,6 +144,8 @@ parse_args(pam_handle_t *pamh, struct login_info *loginfo,
+ 	    loginfo->only_new_group_syntax = YES;
+ 	} else if (strcmp (argv[i], "noaudit") == 0) {
+ 	    loginfo->noaudit = YES;
++	} else if (strcmp (argv[i], "nodns") == 0) {
++	    loginfo->nodns = YES;
+ 	} else {
+ 	    pam_syslog(pamh, LOG_ERR, "unrecognized option [%s]", argv[i]);
+ 	}
+@@ -637,7 +640,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
+       if ((str_len = strlen(string)) > tok_len
+ 	  && strcasecmp(tok, string + str_len - tok_len) == 0)
+ 	return YES;
+-    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers (end with ".") */
++    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers/subnet (end with ".") */
+       struct addrinfo hint;
+ 
+       memset (&hint, '\0', sizeof (hint));
+@@ -712,6 +715,39 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
+ }
+ 
+ 
++static int
++is_device (pam_handle_t *pamh, const char *tok)
++{
++  struct stat st;
++  const char *dev = "/dev/";
++  char *devname;
++
++  devname = malloc (strlen(dev) + strlen (tok) + 1);
++  if (devname == NULL) {
++      pam_syslog(pamh, LOG_ERR, "Cannot allocate memory for device name: %m");
++      /*
++       * We should return an error and abort, but pam_access has no good
++       * error handling.
++       */
++      return NO;
++  }
++
++  char *cp = stpcpy (devname, dev);
++  strcpy (cp, tok);
++
++  if (lstat(devname, &st) != 0)
++    {
++      free (devname);
++      return NO;
++    }
++  free (devname);
++
++  if (S_ISCHR(st.st_mode))
++    return YES;
++
++  return NO;
++}
++
+ /* network_netmask_match - match a string against one token
+  * where string is a hostname or ip (v4,v6) address and tok
+  * represents either a hostname, a single ip (v4,v6) address
+@@ -773,10 +809,42 @@ network_netmask_match (pam_handle_t *pamh,
+ 	    return NO;
+ 	  }
+       }
++    else if (isipaddr(tok, NULL, NULL) == YES)
++      {
++	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
++	  {
++	    if (item->debug)
++	      pam_syslog(pamh, LOG_DEBUG, "cannot resolve IP address \"%s\"", tok);
++
++	    return NO;
++	  }
++	netmask_ptr = NULL;
++      }
++    else if (item->nodns)
++      {
++	/* Only hostnames are left, which we would need to resolve via DNS */
++	return NO;
++      }
+     else
+       {
++	/* Bail out on X11 Display entries and ttys. */
++	if (tok[0] == ':')
++	  {
++	    if (item->debug)
++	      pam_syslog (pamh, LOG_DEBUG,
++			  "network_netmask_match: tok=%s is X11 display", tok);
++	    return NO;
++	  }
++	if (is_device (pamh, tok))
++	  {
++	    if (item->debug)
++	      pam_syslog (pamh, LOG_DEBUG,
++			  "network_netmask_match: tok=%s is a TTY", tok);
++	    return NO;
++	  }
++
+         /*
+-	 * It is either an IP address or a hostname.
++	 * It is most likely a hostname.
+ 	 * Let getaddrinfo sort everything out
+ 	 */
+ 	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
+-- 
+2.50.1
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index 658212dd82..7d6546be53 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://CVE-2025-6020-01.patch \
            file://CVE-2025-6020-02.patch \
            file://CVE-2025-6020-03.patch \
+           file://CVE-2024-10963.patch \
            "
 
 SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"
-- 
2.50.1


