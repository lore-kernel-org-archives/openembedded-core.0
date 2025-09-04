Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD83CA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:22:55 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.923.1756999370570333424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hemcwgZX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24cdd95c422so3169705ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999370; x=1757604170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edcPSLIH9kBlxWI/GMphqZAGjkCSqptRfWei3oDVtVw=;
        b=hemcwgZXdYWQepnTrFe6hG6uw6v8HxTxDAr2IWtUHEIlt9d5Bv4PC3Xfy/rGTWMzOn
         DcQsPKFZSUUqI+zalnqmyNHQkSM9v4U1/xr5gXrfw/KIb63LMDSYXrlw1gta5Ajzydl1
         Pe9l1a6ZRrXSS+C8XPCqJ8KjTSrHoPf2pPzzsQjv0cB4CZ067ZI03ouhNVLrs2mXH59v
         Cmjf5IhvDVaX3Vbv7DfvaKaVkKbobwJNpQkI87+Ijx33pXKguAel5MUfhdYun4ke+ZWt
         bO0cN2tRQ42Y1Dhv9s02/Z/EAVtRD2F4pAKbWTi2afwjSHor+9PqwGHPOh7pe5dVYc+E
         EP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999370; x=1757604170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edcPSLIH9kBlxWI/GMphqZAGjkCSqptRfWei3oDVtVw=;
        b=Gup924Aor6M99+bQc8LPwiLQFf2EMHybyP1C5Rni+2nwJvuIrmQQJNwVZNRuvdqPKk
         PZFXQF5RzaO/pVRIq7okal3qvsKBgm5A4pbU8Cd1Cgoztixpx4Up5z85eHcUY6xQoS/Z
         Jm0Ri5pIY3vc4GvGHlzo9UOuVMKJL8h2axwFoAgmOhE8ZddExbajMThry5i0wKa7e4QP
         rShb+sLj4qqoNQvG+YXxmVW5wpF2Uf4x+mzqLlnY2ntZPwGXNnR8T0OPqPpAsdeQ4IS3
         lTE4UwgNbu4PB5RDaRBMRm3gyfDYmkiEb8Jn7TQQcz4q9QHS5DTRHW8xITsIjvPKRwGV
         OIhQ==
X-Gm-Message-State: AOJu0Yz3TUnsBiz38+i7pTwB4VBAyW3qFpOD669fx2NHtdXKuNztO5xj
	I+72CSbPPdyn7EWIem6VQW2phPkpeQ5W3tqMIO3NM0fn8DMo/DcOiLATMCETraEreeW1EuST5dq
	zmPhv
X-Gm-Gg: ASbGncuwRF3ecWlbUVEYWTn4MEJgXfc3iu7KSzqNey7IRkbvKsKGo6/sCl4NweXKy5m
	vEyJrTSOvF0gSN+cC1YH7Dp8D5wcsDac7jYcFtXYX0eLXgPVrvMda8TJ1CvrqA5b4ZE3lhKft9U
	wb2PmE0lT6tldurSGdit4W+S/Wwd9MRtqYri5qJNRnqeRjH82wK4g/R1Lx1sw7xHIu+3c5pmFSt
	qQialVpk89Byorvf+FefWABP8qAH0NAMFvCUMV8/P7VPGg+626vManMhqqwOHnocoxzbLvlD8SD
	AfOHUoOROs9QeyZXNgssK/oY/Yaw1WpxQilNCUlFwNiYzlMqBp6Gg5scxcxa/sPJRJ3zu+Pxqjl
	6EQ5kjbppaFx7eGpzUQjMyyBeXjnKQEbASvA=
X-Google-Smtp-Source: AGHT+IFNEHoCxsf50FmQvCOfQW4lZZBaQSK69p9s15SO1+TnzAlY5/yWwVbrQs8mJLp9xN03O6EEhg==
X-Received: by 2002:a17:902:ef11:b0:24a:f79e:e5dd with SMTP id d9443c01a7336-24af79eea95mr154165025ad.37.1756999369563;
        Thu, 04 Sep 2025 08:22:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b11448a5asm82528085ad.54.2025.09.04.08.22.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:22:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/5] libpam: fix CVE-2024-10963
Date: Thu,  4 Sep 2025 08:22:34 -0700
Message-ID: <2be498fd0872d7ccbf0e9b2eb0a1d4879823c968.1756999195.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756999195.git.steve@sakoman.com>
References: <cover.1756999195.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222957

From: Stanislav Vovk <stanislav.vovk@est.tech>

Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/commit/940747f88c16e029b69a74e80a2e94f65cb3e628

Signed-off-by: Stanislav Vovk <stanislav.vovk@est.tech>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pam/libpam/CVE-2024-10963.patch           | 265 ++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |   1 +
 2 files changed, 266 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10963.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch b/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch
new file mode 100644
index 0000000000..b79831f0e5
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch
@@ -0,0 +1,265 @@
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
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/940747f88c16e029b69a74e80a2e94f65cb3e628]
+CVE: CVE-2024-10963
+Signed-off-by: Stanislav Vovk <stanislav.vovk@est.tech>
+---
+ modules/pam_access/access.conf.5.xml |  4 ++
+ modules/pam_access/pam_access.8.xml  | 46 ++++++++++++------
+ modules/pam_access/pam_access.c      | 72 +++++++++++++++++++++++++++-
+ 3 files changed, 105 insertions(+), 17 deletions(-)
+
+diff --git a/modules/pam_access/access.conf.5.xml b/modules/pam_access/access.conf.5.xml
+index ff1cb223..158fc7df 100644
+--- a/modules/pam_access/access.conf.5.xml
++++ b/modules/pam_access/access.conf.5.xml
+@@ -220,10 +220,14 @@
+       the fields they are ignored. However if the list separator is changed with the
+       <emphasis>listsep</emphasis> option, the spaces will become part of the actual
+       item and the line will be most probably ignored. For this reason, it is not
+       recommended to put spaces around the ':' characters.
+     </para>
++    <para>
++      Hostnames should be written as Fully-Qualified Host Name (FQHN) to avoid
++      confusion with device names or PAM service names.
++    </para>
+   </refsect1>
+ 
+   <refsect1 xml:id="access.conf-see_also">
+     <title>SEE ALSO</title>
+     <para>
+diff --git a/modules/pam_access/pam_access.8.xml b/modules/pam_access/pam_access.8.xml
+index 010e749e..1182c907 100644
+--- a/modules/pam_access/pam_access.8.xml
++++ b/modules/pam_access/pam_access.8.xml
+@@ -20,15 +20,18 @@
+     <cmdsynopsis xml:id="pam_access-cmdsynopsis" sepchar=" ">
+       <command>pam_access.so</command>
+       <arg choice="opt" rep="norepeat">
+         debug
+       </arg>
++      <arg choice="opt" rep="norepeat">
++        noaudit
++      </arg>
+       <arg choice="opt" rep="norepeat">
+         nodefgroup
+       </arg>
+       <arg choice="opt" rep="norepeat">
+-        noaudit
++        nodns
+       </arg>
+       <arg choice="opt" rep="norepeat">
+         accessfile=<replaceable>file</replaceable>
+       </arg>
+       <arg choice="opt" rep="norepeat">
+@@ -127,10 +130,37 @@
+             Do not report logins from disallowed hosts and ttys to the audit subsystem.
+           </para>
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
+           fieldsep=separators
+         </term>
+         <listitem>
+@@ -168,24 +198,10 @@
+             "Domain Admins" contain a space.
+           </para>
+         </listitem>
+       </varlistentry>
+ 
+-      <varlistentry>
+-        <term>
+-          nodefgroup
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
+   <refsect1 xml:id="pam_access-types">
+     <title>MODULE TYPES PROVIDED</title>
+diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_access.c
+index f70b7e49..d06496c3 100644
+--- a/modules/pam_access/pam_access.c
++++ b/modules/pam_access/pam_access.c
+@@ -97,10 +97,11 @@ struct login_info {
+     const char *config_file;
+     const char *hostname;
+     int debug;				/* Print debugging messages. */
+     int only_new_group_syntax;		/* Only allow group entries of the form "(xyz)" */
+     int noaudit;			/* Do not audit denials */
++    int nodns;                          /* Do not try to resolve tokens as hostnames */
+     const char *fs;			/* field separator */
+     const char *sep;			/* list-element separator */
+     int from_remote_host;               /* If PAM_RHOST was used for from */
+     struct addrinfo *res;		/* Cached DNS resolution of from */
+     int gai_rv;				/* Cached retval of getaddrinfo */
+@@ -148,10 +149,12 @@ parse_args(pam_handle_t *pamh, struct login_info *loginfo,
+ 	    loginfo->debug = YES;
+ 	} else if (strcmp (argv[i], "nodefgroup") == 0) {
+ 	    loginfo->only_new_group_syntax = YES;
+ 	} else if (strcmp (argv[i], "noaudit") == 0) {
+ 	    loginfo->noaudit = YES;
++	} else if (strcmp (argv[i], "nodns") == 0) {
++	    loginfo->nodns = YES;
+ 	} else {
+ 	    pam_syslog(pamh, LOG_ERR, "unrecognized option [%s]", argv[i]);
+ 	}
+     }
+ 
+@@ -730,11 +733,11 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
+ 
+     if (tok[0] == '.') {			/* domain: match last fields */
+       if ((str_len = strlen(string)) > tok_len
+ 	  && strcasecmp(tok, string + str_len - tok_len) == 0)
+ 	return YES;
+-    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers (end with ".") */
++    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers/subnet (end with ".") */
+       struct addrinfo hint;
+ 
+       memset (&hint, '\0', sizeof (hint));
+       hint.ai_flags = AI_CANONNAME;
+       hint.ai_family = AF_INET;
+@@ -805,10 +808,43 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
+     }
+     return (NO);
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
+  * or a network/netmask
+  */
+@@ -866,14 +902,46 @@ network_netmask_match (pam_handle_t *pamh,
+ 	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
+ 	  {
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
+ 	  {
+ 	    pam_syslog(pamh, LOG_ERR, "cannot resolve hostname \"%s\"", tok);
+-- 
+2.43.5
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index 815085cc82..4c27767ab1 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://CVE-2025-6020-01.patch \
            file://CVE-2025-6020-02.patch \
            file://CVE-2025-6020-03.patch \
+           file://CVE-2024-10963.patch \
            "
 
 SRC_URI[sha256sum] = "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283"
-- 
2.43.0


