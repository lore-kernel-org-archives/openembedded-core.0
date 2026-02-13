Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CAAEF48ED
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:40:21 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67504.1770972012181730659
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QNvw/Pd3;
 spf=pass (domain: mvista.com, ip: 209.85.215.176, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so446195a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1770972011; x=1771576811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n04XkYXrhWbOo4qMvwRQXeSgerEMG9xqWdDxuXCsLF0=;
        b=QNvw/Pd3LWPDZctauU8YTN8fBs5lbUMh2fK93knmwE0rAvoTG2rZUwT5yVwPqeJWW3
         qjY8tqIatVapr0G/V3vfNfzzHJrpLUlMRvJ5RLFSwOmKDulUv39uW/vgj5dD2RR4azd9
         JqC1zXU6Hr3jPqAqkNw2gM5SRECHhBK1g7Rb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770972011; x=1771576811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n04XkYXrhWbOo4qMvwRQXeSgerEMG9xqWdDxuXCsLF0=;
        b=KDq34ii8hOQ2C0wKJo3o0XVgFgEJkIv2xnfHZp56A+oQEzK3LWpfREzhTezSoIOTrs
         kva/EkIxQ0bdEYx/AHGOOmS1OSClfSBqKgYaKhZCdStxAwU0DkY1T1ZszOzfr+PU6KUW
         mTpZnJPj/K4+/mk6Ipwj1JFX2sA/p/5Tk62eOb3ddau7GdxotW9UiYi4S2emvKYkUuk0
         apgdIodMxEV0yGpbmvDtqeu+EmfnqBLV3LYhWna7hkDATUKl5tr/7NkQbnIbKTn9jW4B
         vDTVgKNW78jRQiN+DxaEczf7U2mVGd4wEraq8i1t7Rnv7Wwbp+bt0GbErhb/7BjNH5hA
         /tjQ==
X-Gm-Message-State: AOJu0YweTwvJHs6yEJofymt94ZxAXFSgselORSA540NQKd94TVKNhjxK
	AK29i0HmCt1huLbSpg0L0mVzSUtL0PSf7roADv5FPuDwZj8mD+XfJ3yAYsDL4INP93aU0OzOsNq
	YoJMdcLg=
X-Gm-Gg: AZuq6aKXyNqUogiwYm38+UiMptdIHfipea6EuNaumoJ9o98sPS/dyEB37rDZ7Rmarln
	hFItDQh0nehRNLsPXHEk2bZ1zNR61F7KXp5F5/ePwLrQOXRT4Ifn4Cj80kFQp2XEQ9ZNY/CusQg
	JBSLwMa8pYREvs30DF29auGqvKxJrccEiBOR9NXEVAlbW9HjNA5Qv5tZleCar76FXh/i852e3v+
	25jY561I00YfpaHApxONzcHxEFbXh0KmG2BbjOWWOgyuhVUFc02D4rZ7NgSyxU+5o5tB+MP/Gbv
	AvgW9xDmNjdRl+c4U4dHeRwpYQULRO4hAB0hRelu9Fa8X7Eb2kbtL0L9K7pHCT7sMl/vqxavXKT
	ljS6JiKX1W9JeVDTDo7hkBOB02x2Rw+sflYUMQktCWalUW8Hiq8da2zr5zCFIVwVL1fgt2Ae65i
	zOjAwPyVDFe8Cugz2Lkrj089vaKMHwZ4VtXddC
X-Received: by 2002:a17:90b:528d:b0:32e:7bbc:bf13 with SMTP id 98e67ed59e1d1-356aada9a60mr1149084a91.34.1770972011330;
        Fri, 13 Feb 2026 00:40:11 -0800 (PST)
Received: from MVIN00013.mvista.com ([150.129.170.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e531desm11406930a91.2.2026.02.13.00.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:40:10 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libpam: fix CVE-2024-10963
Date: Fri, 13 Feb 2026 14:09:49 +0530
Message-ID: <20260213083949.143020-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231103

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


