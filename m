Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 3982D7403A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 21:57:13 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t4FLvBba004939 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 16:57:14 -0500
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015051516571361-1561740 ;
	Fri, 15 May 2015 16:57:13 -0500 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 May 2015 16:57:11 -0500
Message-Id: <1431727031-19182-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.2.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/15/2015 04:57:13 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/15/2015 04:57:14 PM,
	Serialize complete at 05/15/2015 04:57:14 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-15_05:, , signatures=0
Subject: [master/glibc 2.21] [PATCH] glibc: CVE-2015-1781: resolv/nss_dns/dns-host.c buffer overflow
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
X-List-Received-Date: Fri, 15 May 2015 21:57:14 -0000

Backport Arjun Shankar's patch for CVE-2015-1781:

A buffer overflow flaw was found in the way glibc's gethostbyname_r() and
other related functions computed the size of a buffer when passed a
misaligned buffer as input. An attacker able to make an application call
any of these functions with a misaligned buffer could use this flaw to
crash the application or, potentially, execute arbitrary code with the
permissions of the user running the application.

https://sourceware.org/bugzilla/show_bug.cgi?id=18287

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Reviewed-by: Ben Shelton <ben.shelton@ni.com>
---

NOTE: This is an updated version of the CVE-2015-1781 patch
for master (glibc 2.21). The original patch still applies to
other branches that use glibc 2.20. E.g. Dizzy.

---
 ...81-resolv-nss_dns-dns-host.c-buffer-overf.patch | 43 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb              |  4 ++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch b/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch
new file mode 100644
index 0000000..c02fa12
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch
@@ -0,0 +1,43 @@
+From 2959eda9272a033863c271aff62095abd01bd4e3 Mon Sep 17 00:00:00 2001
+From: Arjun Shankar <arjun.is@lostca.se>
+Date: Tue, 21 Apr 2015 14:06:31 +0200
+Subject: [PATCH] CVE-2015-1781: resolv/nss_dns/dns-host.c buffer overflow
+ [BZ#18287]
+
+Upstream-Status: Backport
+https://sourceware.org/bugzilla/show_bug.cgi?id=18287
+---
+ resolv/nss_dns/dns-host.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
+index b16b0ddf110907a0086b86612e544d3dc75182b8..d8c55791591750567f00e616e5d7b378dec934a0 100644
+--- a/resolv/nss_dns/dns-host.c
++++ b/resolv/nss_dns/dns-host.c
+@@ -608,21 +608,22 @@ getanswer_r (const querybuf *answer, int anslen, const char *qname, int qtype,
+   int n, ancount, qdcount;
+   int haveanswer, had_error;
+   char *bp, **ap, **hap;
+   char tbuf[MAXDNAME];
+   const char *tname;
+   int (*name_ok) (const char *);
+   u_char packtmp[NS_MAXCDNAME];
+   int have_to_map = 0;
+   uintptr_t pad = -(uintptr_t) buffer % __alignof__ (struct host_data);
+   buffer += pad;
+-  if (__glibc_unlikely (buflen < sizeof (struct host_data) + pad))
++  buflen = buflen > pad ? buflen - pad : 0;
++  if (__glibc_unlikely (buflen < sizeof (struct host_data)))
+     {
+       /* The buffer is too small.  */
+     too_small:
+       *errnop = ERANGE;
+       *h_errnop = NETDB_INTERNAL;
+       return NSS_STATUS_TRYAGAIN;
+     }
+   host_data = (struct host_data *) buffer;
+   linebuflen = buflen - sizeof (struct host_data);
+   if (buflen - sizeof (struct host_data) != linebuflen)
+-- 
+2.2.2
+
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index ac8e8f8..0c28814 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
            file://elf-Makefile-fix-a-typo.patch \
            file://makesyscall.patch \
            ${EGLIBCPATCHES} \
+           ${CVEPATCHES} \
           "
 EGLIBCPATCHES = "\
            file://timezone-re-written-tzselect-as-posix-sh.patch \
@@ -43,6 +44,9 @@ EGLIBCPATCHES = "\
 #           file://eglibc-install-pic-archives.patch \
 #	    file://initgroups_keys.patch \
 #
+CVEPATCHES = "\
+        file://CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch \
+"
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
2.2.2


