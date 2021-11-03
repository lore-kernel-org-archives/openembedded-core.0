Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6BFC433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 10:14:25 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.5540.1635934463557766992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 03:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="294917575"
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800";
   d="scan'208";a="294917575"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 03:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800";
   d="scan'208";a="541643916"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 03 Nov 2021 03:14:21 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH] inetutils: fix CVE-2021-40491
Date: Wed,  3 Nov 2021 18:14:20 +0800
Message-Id: <20211103101420.46886-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 10:14:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157826

From: Yi Zhao <yi.zhao@windriver.com>

CVE-2021-40491:
The ftp client in GNU Inetutils before 2.2 does not validate addresses
returned by PASV/LSPV responses to make sure they match the server
address. This is similar to CVE-2020-8284 for curl.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-40491

Patch from:
https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=58cb043b190fd04effdaea7c9403416b436e50dd

(From OE-Core rev: 1b857807f1cf8fee3175f8479a0c7cb1850bd9a9)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../inetutils/inetutils/CVE-2021-40491.patch  | 88 +++++++++++++++++++
 .../inetutils/inetutils_2.0.bb                |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
new file mode 100644
index 0000000000..202488f75c
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
@@ -0,0 +1,88 @@
+From 98ccabf68e5b3f0a177bd1925581753d10041448 Mon Sep 17 00:00:00 2001
+From: Simon Josefsson <simon@josefsson.org>
+Date: Wed, 1 Sep 2021 09:09:50 +0200
+Subject: [PATCH] ftp: check that PASV/LSPV addresses match.
+
+* NEWS: Mention change.
+* ftp/ftp.c (initconn): Validate returned addresses.
+
+CVE: CVE-2021-40491
+
+Upstream-Status: Backport
+[https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=58cb043b190fd04effdaea7c9403416b436e50dd]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ NEWS      |  9 +++++++++
+ ftp/ftp.c | 21 +++++++++++++++++++++
+ 2 files changed, 30 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index 7c5e62c..bd9a4da 100644
+--- a/NEWS
++++ b/NEWS
+@@ -4,6 +4,15 @@ GNU inetutils NEWS -- history of user-visible changes.
+ 
+ ** ftp
+ 
++The ftp client now validate addresses returned by PASV/LSPV responses,
++to make sure they match the server address.  Reported by ZeddYu Lu in
++<https://lists.gnu.org/archive/html/bug-inetutils/2021-06/msg00002.html>.
++
++Thanks to Luke Mewburn <lukem@netbsd.org> for discussion and fix to
++NetBSD code, we used a similar solution.
++
++** ftp
++
+ Disable use of readline when environment variable TERM is unset or set
+ to "dumb" (caused problems with Emacs AngeFTP on MacOS).  Thanks to
+ Alex Bochannek for report, debugging and patch.
+diff --git a/ftp/ftp.c b/ftp/ftp.c
+index d21dbdd..7513539 100644
+--- a/ftp/ftp.c
++++ b/ftp/ftp.c
+@@ -1365,6 +1365,13 @@ initconn (void)
+ 		  uint32_t *pu32 = (uint32_t *) &data_addr_sa4->sin_addr.s_addr;
+ 		  pu32[0] = htonl ( (h[0] << 24) | (h[1] << 16) | (h[2] << 8) | h[3]);
+ 		}
++		if (data_addr_sa4->sin_addr.s_addr
++		    != ((struct sockaddr_in *) &hisctladdr)->sin_addr.s_addr)
++		  {
++		    printf ("Passive mode address mismatch.\n");
++		    (void) command ("ABOR");	/* Cancel any open connection.  */
++		    goto bad;
++		  }
+ 	    } /* LPSV IPv4 */
+ 	  else /* IPv6 */
+ 	    {
+@@ -1395,6 +1402,13 @@ initconn (void)
+ 		  pu32[2] = htonl ( (h[8] << 24) | (h[9] << 16) | (h[10] << 8) | h[11]);
+ 		  pu32[3] = htonl ( (h[12] << 24) | (h[13] << 16) | (h[14] << 8) | h[15]);
+ 		}
++		if (data_addr_sa6->sin6_addr.s6_addr
++		    != ((struct sockaddr_in6 *) &hisctladdr)->sin6_addr.s6_addr)
++		  {
++		    printf ("Passive mode address mismatch.\n");
++		    (void) command ("ABOR");	/* Cancel any open connection.  */
++		    goto bad;
++		  }
+ 	    } /* LPSV IPv6 */
+ 	}
+       else /* !EPSV && !LPSV */
+@@ -1415,6 +1429,13 @@ initconn (void)
+ 			 | ((a2 & 0xff) << 8) | (a3 & 0xff) );
+ 	      data_addr_sa4->sin_port =
+ 		  htons (((p0 & 0xff) << 8) | (p1 & 0xff));
++	      if (data_addr_sa4->sin_addr.s_addr
++		  != ((struct sockaddr_in *) &hisctladdr)->sin_addr.s_addr)
++		{
++		  printf ("Passive mode address mismatch.\n");
++		  (void) command ("ABOR");	/* Cancel any open connection.  */
++		  goto bad;
++		}
+ 	    } /* PASV */
+ 	  else
+ 	    {
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.0.bb b/meta/recipes-connectivity/inetutils/inetutils_2.0.bb
index a4d05b0542..d299bc359e 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.0.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
+           file://CVE-2021-40491.patch \
 "
 
 SRC_URI[md5sum] = "5e1018502cd131ed8e42339f6b5c98aa"
-- 
2.33.1


