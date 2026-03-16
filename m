Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689E7F46441
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46606.1773653412751042563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uxppGvU5;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso38113595e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653411; x=1774258211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJ6orOidTAew6EIDHd2MIpYNo7EqFlydQHSY0hRuizs=;
        b=uxppGvU5OLLtmzcMY3RyxEt376WH0U72dpmklMqQEHJEW7lrwCD7xZuJFoB34ZKwWx
         wRL42mhbDRx30fefUK5nmi9lUhwkxsYj/dKlzs2JH8+MGQ0FNdpiM5JFNNR37M++wc/L
         sGT6I0yYK848HKELtKFg2OYPKtYVmIgfH+iS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653411; x=1774258211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aJ6orOidTAew6EIDHd2MIpYNo7EqFlydQHSY0hRuizs=;
        b=Br4ko/seL0cMRGnBrAlbjsuwbcduXdfs4hxqBgeIJczu+zR1ajFi/cIk4+xF9rK63D
         SPS4FeYtcPMujdSAyAKgPFfCKQ3zUqeH2PmeiVdiyOpcBw7+R4meV+ZaBX6LCyGoF0V0
         X7WLKkf+T///hFtavxN+QI7cycUr13kCeOc9jTLSIAVwqbiS0pHSmstNCA13+vmWHE2B
         nU2YvNvR/z31M6bb6ArTqKRSCNS838HBvizzRhbtKCqn8ujZyvVfqOepmYBMdZsOQrFT
         b8MGk3VpKj6z41kGOEa//5fnHB2wDt121oU0sKyovrebL8OSFh8Q4wbAvjmnBKpRGPzr
         HP0A==
X-Gm-Message-State: AOJu0YwQWpGwQZl6rT9aiupxYJjN5mGCJ8gnv678j2LKZSy9H6J/RIYD
	sTBjzDxLBnxcsxXeujII2TVry2Aeu6sGDQCCLN7sp1Nu1zbnBejXE55BjT2i5fN4/Fvz8oXjnuA
	hbAwg
X-Gm-Gg: ATEYQzyfE1YQlg+t5jGQZN6kwK/jU3fmX0PhZ67LTZXOyAGl8pyog+8AVZem4S2dyB3
	QSmgouKSSHTtfZBUWkNRep7DkeLav8kp2oPVwnEsQ5/hrVO2/f8AaRWO+n6Ays0ZRusEDCL/j8J
	Xoep3OpApOaODdFGIP4AKkzNUZ20VThVDBlmvvGRS96fqF44kj3yA84M29ku/Nz0ucCr+A7NEJE
	jymApTtd00R/rBrhrTPqRPpYNQIHi+lODPtr6xt2bCo5a0ZIoUfWGKyBV7WU8tc1D8LfmhIfcyW
	YDG5g22kdb+wuyDPftlhi65PO8j3F6bbyUBjDZ2G5bmzpfC4kycxj9n7e6zqqN7co6RimQoHj93
	to3TT/YlaF10jhhVIAdX6THML8yD2ZhnAVubPSxuvxP1bmSrh2D3gtxovyPcK37GILP4zRJhk3N
	eFamdrI/V5dJ5zwIzC80EWmBlLMI0jZfiyleUfv1A5wJnNXLmYO79ZMP7M/Ywh1dVsET8eTFp2u
	z43FBdsWYIToaGhxEc3d6VOi7iSUwTAEg==
X-Received: by 2002:a05:600c:4583:b0:485:439b:683f with SMTP id 5b1f17b1804b1-48556700c23mr182234915e9.20.1773653408925;
        Mon, 16 Mar 2026 02:30:08 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/17] libpam: fix CVE-2024-10963
Date: Mon, 16 Mar 2026 10:28:30 +0100
Message-ID: <75786efd725b97928f0787896bc67a9465879e0b.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233235

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick up "Mitigated by" patch from Debian security tracker.
[0]: https://security-tracker.debian.org/tracker/CVE-2024-10963

patch[1] which fixes this vulnerability as mentioned in Debian report.

[1] https://github.com/linux-pam/linux-pam/commit/940747f88c16e029b69a74e80a2e94f65cb3e628

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
[YC: Debian security tracker: "The vulnerable code was introduced in
1.5.3" but the vulnerable code was backported in commit 399d4986a7
(libpam: fix CVE-2022-28321, 2022-10-28)]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../pam/libpam/CVE-2024-10963.patch           | 229 ++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 2 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10963.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch b/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch
new file mode 100644
index 00000000000..8f8e13f5e84
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
index 658212dd829..7d6546be530 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://CVE-2025-6020-01.patch \
            file://CVE-2025-6020-02.patch \
            file://CVE-2025-6020-03.patch \
+           file://CVE-2024-10963.patch \
            "
 
 SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"

