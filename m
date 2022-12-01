Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4A4C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:27:52 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.44764.1669904847658381290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lPCr8pvl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id a9so1782524pld.7
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vP+P1nKc3MWMQRtenzlrV9DDomg5C/ZV61hZo0fELb0=;
        b=lPCr8pvleTSukjkAdGSjbd6IoHcCocX3Rou+SnA9UZ1qI8t40WsVu3ABEvrMbWMKE+
         GLoaA9KH7ZkEVO77CwQfI87eYe7eyWrD+s2jb5NxgxAsLZGyZZ9fbLm5Bh09zV2q0UAO
         geRX1LtZ7Wi8iD8Lbuuj40tHc6KO722nIMgy9vLiDsn+WQy8UARIjI5694YRi4fVzj+f
         LqTXdxSbvKG5PtKhESURXtGnkcnNQCtmPHy09fbvrnGzTi6waQ2ED4HZbZa0W/u+Ce8p
         AFuTv7J9wVoeGKfTEAvaaqW9rnI1eXNd0z02mEfOb0VFSjqMDuipeZGJy/fs6a12otsn
         FxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vP+P1nKc3MWMQRtenzlrV9DDomg5C/ZV61hZo0fELb0=;
        b=f0In60DcG3MrWtSebYUbx9ZA3GEMx+C+UQlJkDZ4ZMv/ANRQO1z+0jgV/7HfNX+BeT
         7tn7iqU8dlgGqt1Dfb2PGE31y5OuA0vymdBu7owp15PBT9N9/tirqQ4Dsr1m2CCQ8FE/
         8X5w2myN/o3IoRdj2PxoFo40bH0C5u60KRBsMN6bgSRbJYfN7sMyB6aOvtaWu9q9nunB
         cRc3k3cIxovLGbkqimpmGlghtNiBg5Rj6kenRY2z2TvUTvHolxp2ZhD+8DyV+jkmnVy9
         t/1jUUsjAk+foqQLm2cZmDxR2mgfxtW9YRW0YXaIM4MKPP1m2PP3XjBxpMpwC/+JIIeQ
         F3bQ==
X-Gm-Message-State: ANoB5plJb9ucl1K4nFOaWy5oOwjxx+e23Lq+L280SdEACq7mRjBP/0Ng
	dX/DfDjWwUBEQDBFngSxCcs27WA2EbjwOTuWnWY=
X-Google-Smtp-Source: AA0mqf5c8iTD7nLlUf/j996VgFo5bP+Ezqgt1xV7XDAzFxsZlZtQfnn7MNEnRZZTAAryooSqH+77Ug==
X-Received: by 2002:a17:902:8c8e:b0:188:d588:34f2 with SMTP id t14-20020a1709028c8e00b00188d58834f2mr61613907plo.15.1669904867899;
        Thu, 01 Dec 2022 06:27:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.27.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:27:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/23] libpam: fix CVE-2022-28321
Date: Thu,  1 Dec 2022 04:27:04 -1000
Message-Id: <399d4986a7707c081dd5da1991647cb02cbea69c.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174096

From: "Polampalli, Archana" <archana.polampalli@windriver.com>

The Linux-PAM package before 1.5.2-6.1 for openSUSE Tumbleweed allows
authentication bypass for SSH logins. The pam_access.so module doesn't
correctly restrict login if a user tries to connect from an IP address
that is not resolvable via DNS. In such conditions, a user with denied
access to a machine can still get access. NOTE: the relevance of this
issue is largely limited to openSUSE Tumbleweed and openSUSE Factory;
it does not affect Linux-PAM upstream.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-28321

Upstream patches:
https://github.com/linux-pam/linux-pam/commit/08992030c56c940c0707ccbc442b1c325aa01e6d
https://github.com/linux-pam/linux-pam/commit/23393bef92c1e768eda329813d7af55481c6ca9f

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b1fd799af0086347de1ec4b72d562b1fb490def1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pam/libpam/CVE-2022-28321-0002.patch      | 205 ++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 2 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch b/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
new file mode 100644
index 0000000000..e7bf03f9f7
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
@@ -0,0 +1,205 @@
+From 23393bef92c1e768eda329813d7af55481c6ca9f Mon Sep 17 00:00:00 2001
+From: Thorsten Kukuk <kukuk@suse.com>
+Date: Thu, 24 Feb 2022 10:37:32 +0100
+Subject: [PATCH 2/2] pam_access: handle hostnames in access.conf
+
+According to the manual page, the following entry is valid but does not
+work:
+-:root:ALL EXCEPT localhost
+
+See https://bugzilla.suse.com/show_bug.cgi?id=1019866
+
+Patched is based on PR#226 from Josef Moellers
+
+Upstream-Status: Backport
+CVE: CVE-2022-28321
+
+Reference to upstream patch:
+[https://github.com/linux-pam/linux-pam/commit/23393bef92c1e768eda329813d7af55481c6ca9f]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ modules/pam_access/pam_access.c | 95 ++++++++++++++++++++++++++-------
+ 1 file changed, 76 insertions(+), 19 deletions(-)
+
+diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_access.c
+index 277192b..bca424f 100644
+--- a/modules/pam_access/pam_access.c
++++ b/modules/pam_access/pam_access.c
+@@ -637,7 +637,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
+       if ((str_len = strlen(string)) > tok_len
+ 	  && strcasecmp(tok, string + str_len - tok_len) == 0)
+ 	return YES;
+-    } else if (tok[tok_len - 1] == '.') {
++    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers (end with ".") */
+       struct addrinfo hint;
+ 
+       memset (&hint, '\0', sizeof (hint));
+@@ -678,7 +678,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
+       return NO;
+     }
+ 
+-    /* Assume network/netmask with an IP of a host.  */
++    /* Assume network/netmask, IP address or hostname.  */
+     return network_netmask_match(pamh, tok, string, item);
+ }
+ 
+@@ -696,7 +696,7 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
+     /*
+      * If the token has the magic value "ALL" the match always succeeds.
+      * Otherwise, return YES if the token fully matches the string.
+-	 * "NONE" token matches NULL string.
++     * "NONE" token matches NULL string.
+      */
+ 
+     if (strcasecmp(tok, "ALL") == 0) {		/* all: always matches */
+@@ -714,7 +714,8 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
+ 
+ /* network_netmask_match - match a string against one token
+  * where string is a hostname or ip (v4,v6) address and tok
+- * represents either a single ip (v4,v6) address or a network/netmask
++ * represents either a hostname, a single ip (v4,v6) address
++ * or a network/netmask
+  */
+ static int
+ network_netmask_match (pam_handle_t *pamh,
+@@ -723,10 +724,12 @@ network_netmask_match (pam_handle_t *pamh,
+     char *netmask_ptr;
+     char netmask_string[MAXHOSTNAMELEN + 1];
+     int addr_type;
++    struct addrinfo *ai = NULL;
+ 
+     if (item->debug)
+-    pam_syslog (pamh, LOG_DEBUG,
++      pam_syslog (pamh, LOG_DEBUG,
+ 		"network_netmask_match: tok=%s, item=%s", tok, string);
++
+     /* OK, check if tok is of type addr/mask */
+     if ((netmask_ptr = strchr(tok, '/')) != NULL)
+       {
+@@ -760,54 +763,108 @@ network_netmask_match (pam_handle_t *pamh,
+ 	    netmask_ptr = number_to_netmask(netmask, addr_type,
+ 		netmask_string, MAXHOSTNAMELEN);
+ 	  }
+-	}
++
++        /*
++         * Construct an addrinfo list from the IP address.
++         * This should not fail as the input is a correct IP address...
++         */
++	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
++	  {
++	    return NO;
++	  }
++      }
+     else
+-	/* NO, then check if it is only an addr */
+-	if (isipaddr(tok, NULL, NULL) != YES)
++      {
++        /*
++	 * It is either an IP address or a hostname.
++	 * Let getaddrinfo sort everything out
++	 */
++	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
+ 	  {
++	    pam_syslog(pamh, LOG_ERR, "cannot resolve hostname \"%s\"", tok);
++
+ 	    return NO;
+ 	  }
++	netmask_ptr = NULL;
++      }
+ 
+     if (isipaddr(string, NULL, NULL) != YES)
+       {
+-	/* Assume network/netmask with a name of a host.  */
+ 	struct addrinfo hint;
+ 
++	/* Assume network/netmask with a name of a host.  */
+ 	memset (&hint, '\0', sizeof (hint));
+ 	hint.ai_flags = AI_CANONNAME;
+ 	hint.ai_family = AF_UNSPEC;
+ 
+ 	if (item->gai_rv != 0)
++	  {
++	    freeaddrinfo(ai);
+ 	    return NO;
++	  }
+ 	else if (!item->res &&
+ 		(item->gai_rv = getaddrinfo (string, NULL, &hint, &item->res)) != 0)
++	  {
++	    freeaddrinfo(ai);
+ 	    return NO;
++	  }
+         else
+ 	  {
+ 	    struct addrinfo *runp = item->res;
++	    struct addrinfo *runp1;
+ 
+ 	    while (runp != NULL)
+ 	      {
+ 		char buf[INET6_ADDRSTRLEN];
+ 
+-		DIAG_PUSH_IGNORE_CAST_ALIGN;
+-		inet_ntop (runp->ai_family,
+-			runp->ai_family == AF_INET
+-			? (void *) &((struct sockaddr_in *) runp->ai_addr)->sin_addr
+-			: (void *) &((struct sockaddr_in6 *) runp->ai_addr)->sin6_addr,
+-			buf, sizeof (buf));
+-		DIAG_POP_IGNORE_CAST_ALIGN;
++		if (getnameinfo (runp->ai_addr, runp->ai_addrlen, buf, sizeof (buf), NULL, 0, NI_NUMERICHOST) != 0)
++		  {
++		    freeaddrinfo(ai);
++		    return NO;
++		  }
+ 
+-		if (are_addresses_equal(buf, tok, netmask_ptr))
++		for (runp1 = ai; runp1 != NULL; runp1 = runp1->ai_next)
+ 		  {
+-		    return YES;
++                    char buf1[INET6_ADDRSTRLEN];
++
++                    if (runp->ai_family != runp1->ai_family)
++                      continue;
++
++                    if (getnameinfo (runp1->ai_addr, runp1->ai_addrlen, buf1, sizeof (buf1), NULL, 0, NI_NUMERICHOST) != 0)
++		      {
++			freeaddrinfo(ai);
++			return NO;
++		      }
++
++                    if (are_addresses_equal (buf, buf1, netmask_ptr))
++                      {
++                        freeaddrinfo(ai);
++                        return YES;
++                      }
+ 		  }
+ 		runp = runp->ai_next;
+ 	      }
+ 	  }
+       }
+     else
+-      return (are_addresses_equal(string, tok, netmask_ptr));
++      {
++       struct addrinfo *runp1;
++
++       for (runp1 = ai; runp1 != NULL; runp1 = runp1->ai_next)
++         {
++           char buf1[INET6_ADDRSTRLEN];
++
++           (void) getnameinfo (runp1->ai_addr, runp1->ai_addrlen, buf1, sizeof (buf1), NULL, 0, NI_NUMERICHOST);
++
++           if (are_addresses_equal(string, buf1, netmask_ptr))
++             {
++               freeaddrinfo(ai);
++               return YES;
++             }
++         }
++      }
++
++  freeaddrinfo(ai);
+ 
+   return NO;
+ }
+-- 
+2.37.3
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index 081986ef43..dabd3256c8 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://0001-run-xtests.sh-check-whether-files-exist.patch \
            file://run-ptest \
            file://pam-volatiles.conf \
+           file://CVE-2022-28321-0002.patch \
            "
 
 SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"
-- 
2.25.1


