Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 01D6E71633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 20:43:13 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lj1so10900044pab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 12:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lfuFF1paWnqpqxxdDH01TbKkPMN396LyGSfbW4oBaS8=;
	b=cZurNCKk3vURcQlR84Xn1SrTe5JgMk0+KLtl0IdyBWF1lo4UeOAhsP7iknDRF7MjPH
	lgGetm+5e+hy//1fPTfCcgXJTS98INsq0oniHB8Z9reKEHuKeYvlfnHEVJWCCAQEMYIg
	rCTOiNrE+z/SDBAhu8JJ91EIIQwha8laiHG4tMZMomkChqut7n9+K+FuKtsvEsmHGNUU
	QV/r3R/HzzTxpWjbwQe/J1Jg1iTMJMbGWkh1TjBJFrin6q6QgIbS+/mxu64y+kWyY1s+
	JbSmzmUuJTzS8FkjsYxTCQqjvWFds2K9ER9IBpd9TKKcsdAMYSvGOjDziTTDE1G3ffWu
	Aprw==
X-Received: by 10.68.57.168 with SMTP id j8mr45145338pbq.160.1421872994015;
	Wed, 21 Jan 2015 12:43:14 -0800 (PST)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id jz5sm7109030pbc.0.2015.01.21.12.43.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Jan 2015 12:43:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jan 2015 12:43:11 -0800
Message-Id: <1421872991-17898-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] glibc: CVE-2014-9402 endless loop in getaddr_r
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Jan 2015 20:43:21 -0000

From: Armin Kuster <akuster@mvista.com>

The getnetbyname function in glibc 2.21 in earlier will enter an infinite loop
if the DNS backend is activated in the system Name Service Switch
configuration, and the DNS resolver receives a positive answer while processing
the network name.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../CVE-2014-9402_endless-loop-in-getaddr_r.patch  | 65 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.20.bb              |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2014-9402_endless-loop-in-getaddr_r.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2014-9402_endless-loop-in-getaddr_r.patch b/meta/recipes-core/glibc/glibc/CVE-2014-9402_endless-loop-in-getaddr_r.patch
new file mode 100644
index 0000000..ba1da67
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2014-9402_endless-loop-in-getaddr_r.patch
@@ -0,0 +1,65 @@
+CVE-2014-9402 endless loop in getaddr_r
+
+
+https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=11e3417af6e354f1942c68a271ae51e892b2814d
+
+Upstream-Status: Backport
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+From 11e3417af6e354f1942c68a271ae51e892b2814d Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 15 Dec 2014 17:41:13 +0100
+Subject: [PATCH] Avoid infinite loop in nss_dns getnetbyname [BZ #17630]
+
+---
+ ChangeLog                    | 6 ++++++
+ NEWS                         | 7 +++++--
+ resolv/nss_dns/dns-network.c | 4 ++--
+ 3 files changed, 13 insertions(+), 4 deletions(-)
+
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -24,7 +24,10 @@ Version 2.20
+   17031, 17042, 17048, 17050, 17058, 17061, 17062, 17069, 17075, 17078,
+   17079, 17084, 17086, 17088, 17092, 17097, 17125, 17135, 17137, 17150,
+   17153, 17187, 17213, 17259, 17261, 17262, 17263, 17319, 17325, 17354,
+-  17625.
++  17625, 17630.
++
++* The nss_dns implementation of getnetbyname could run into an infinite loop
++  if the DNS response contained a PTR record of an unexpected format.
+ 
+ * CVE-2104-7817 The wordexp function could ignore the WRDE_NOCMD flag
+   under certain input conditions resulting in the execution of a shell for
+Index: git/resolv/nss_dns/dns-network.c
+===================================================================
+--- git.orig/resolv/nss_dns/dns-network.c
++++ git/resolv/nss_dns/dns-network.c
+@@ -398,8 +398,8 @@ getanswer_r (const querybuf *answer, int
+ 
+ 	case BYNAME:
+ 	  {
+-	    char **ap = result->n_aliases++;
+-	    while (*ap != NULL)
++	    char **ap;
++	    for (ap = result->n_aliases; *ap != NULL; ++ap)
+ 	      {
+ 		/* Check each alias name for being of the forms:
+ 		   4.3.2.1.in-addr.arpa		= net 1.2.3.4
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,9 @@
++2014-12-16  Florian Weimer  <fweimer@redhat.com>
++
++       [BZ #17630]
++       * resolv/nss_dns/dns-network.c (getanswer_r): Iterate over alias
++       names.
++
+ 2014-12-15  Jeff Law  <law@redhat.com>
+ 
+    [BZ #16617]
diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index f67fbfd..8a8b296 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -44,6 +44,7 @@ EGLIBCPATCHES = "\
 CVEPATCHES = "\
         file://CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch \
         file://CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch \
+        file://CVE-2014-9402_endless-loop-in-getaddr_r.patch \
     "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
1.9.1


