Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7922FC433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 08:23:04 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.10995.1632817382885346629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 01:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id AE206E0017;
	Tue, 28 Sep 2021 08:22:54 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-core][kirkstone][PATCH] inetutils: drop CVE-2021-40491 patch
Date: Tue, 28 Sep 2021 10:22:52 +0200
Message-Id: <20210928082252.6070-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 08:23:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156409

This CVE is already fixed in inetutils 2.2

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../inetutils/inetutils/CVE-2021-40491.patch  | 88 -------------------
 .../inetutils/inetutils_2.2.bb                |  1 -
 2 files changed, 89 deletions(-)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
deleted file mode 100644
index 202488f75c23..000000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 98ccabf68e5b3f0a177bd1925581753d10041448 Mon Sep 17 00:00:00 2001
-From: Simon Josefsson <simon@josefsson.org>
-Date: Wed, 1 Sep 2021 09:09:50 +0200
-Subject: [PATCH] ftp: check that PASV/LSPV addresses match.
-
-* NEWS: Mention change.
-* ftp/ftp.c (initconn): Validate returned addresses.
-
-CVE: CVE-2021-40491
-
-Upstream-Status: Backport
-[https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=58cb043b190fd04effdaea7c9403416b436e50dd]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- NEWS      |  9 +++++++++
- ftp/ftp.c | 21 +++++++++++++++++++++
- 2 files changed, 30 insertions(+)
-
-diff --git a/NEWS b/NEWS
-index 7c5e62c..bd9a4da 100644
---- a/NEWS
-+++ b/NEWS
-@@ -4,6 +4,15 @@ GNU inetutils NEWS -- history of user-visible changes.
- 
- ** ftp
- 
-+The ftp client now validate addresses returned by PASV/LSPV responses,
-+to make sure they match the server address.  Reported by ZeddYu Lu in
-+<https://lists.gnu.org/archive/html/bug-inetutils/2021-06/msg00002.html>.
-+
-+Thanks to Luke Mewburn <lukem@netbsd.org> for discussion and fix to
-+NetBSD code, we used a similar solution.
-+
-+** ftp
-+
- Disable use of readline when environment variable TERM is unset or set
- to "dumb" (caused problems with Emacs AngeFTP on MacOS).  Thanks to
- Alex Bochannek for report, debugging and patch.
-diff --git a/ftp/ftp.c b/ftp/ftp.c
-index d21dbdd..7513539 100644
---- a/ftp/ftp.c
-+++ b/ftp/ftp.c
-@@ -1365,6 +1365,13 @@ initconn (void)
- 		  uint32_t *pu32 = (uint32_t *) &data_addr_sa4->sin_addr.s_addr;
- 		  pu32[0] = htonl ( (h[0] << 24) | (h[1] << 16) | (h[2] << 8) | h[3]);
- 		}
-+		if (data_addr_sa4->sin_addr.s_addr
-+		    != ((struct sockaddr_in *) &hisctladdr)->sin_addr.s_addr)
-+		  {
-+		    printf ("Passive mode address mismatch.\n");
-+		    (void) command ("ABOR");	/* Cancel any open connection.  */
-+		    goto bad;
-+		  }
- 	    } /* LPSV IPv4 */
- 	  else /* IPv6 */
- 	    {
-@@ -1395,6 +1402,13 @@ initconn (void)
- 		  pu32[2] = htonl ( (h[8] << 24) | (h[9] << 16) | (h[10] << 8) | h[11]);
- 		  pu32[3] = htonl ( (h[12] << 24) | (h[13] << 16) | (h[14] << 8) | h[15]);
- 		}
-+		if (data_addr_sa6->sin6_addr.s6_addr
-+		    != ((struct sockaddr_in6 *) &hisctladdr)->sin6_addr.s6_addr)
-+		  {
-+		    printf ("Passive mode address mismatch.\n");
-+		    (void) command ("ABOR");	/* Cancel any open connection.  */
-+		    goto bad;
-+		  }
- 	    } /* LPSV IPv6 */
- 	}
-       else /* !EPSV && !LPSV */
-@@ -1415,6 +1429,13 @@ initconn (void)
- 			 | ((a2 & 0xff) << 8) | (a3 & 0xff) );
- 	      data_addr_sa4->sin_port =
- 		  htons (((p0 & 0xff) << 8) | (p1 & 0xff));
-+	      if (data_addr_sa4->sin_addr.s_addr
-+		  != ((struct sockaddr_in *) &hisctladdr)->sin_addr.s_addr)
-+		{
-+		  printf ("Passive mode address mismatch.\n");
-+		  (void) command ("ABOR");	/* Cancel any open connection.  */
-+		  goto bad;
-+		}
- 	    } /* PASV */
- 	  else
- 	    {
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
index eaed3eabbd6a..3bab137eb4a2 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
@@ -21,7 +21,6 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
-           file://CVE-2021-40491.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.31.1


