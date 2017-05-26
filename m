Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 09DE77823F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 02:40:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4Q2ejvL002648
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 19:40:46 -0700 (PDT)
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Thu, 25 May 2017 19:40:42 -0700
From: Yuanjie Huang <yuanjie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 May 2017 19:40:41 -0700
Message-ID: <20170526024041.285848-2-yuanjie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170526024041.285848-1-yuanjie.huang@windriver.com>
References: <20170526024041.285848-1-yuanjie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] binutils: fix CVE-2017-7210
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
X-List-Received-Date: Fri, 26 May 2017 02:40:45 -0000
Content-Type: text/plain

CVE: CVE-2017-7210

[BZ 21157] -- https://sourceware.org/bugzilla/show_bug.cgi?id=21157

PR binutils/21157: Fix handling of corrupt STABS enum type strings.

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-7210.patch          | 71 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index ed571b39e8..40b518bf7a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -42,6 +42,7 @@ SRC_URI = "\
      file://CVE-2017-6969.patch \
      file://CVE-2017-6969_2.patch \
      file://CVE-2017-7209.patch \
+     file://CVE-2017-7210.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch
new file mode 100644
index 0000000000..8791792c7c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch
@@ -0,0 +1,71 @@
+From 4da598a472e1d298825035e452e3bc68f714311c Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 14 Feb 2017 14:07:29 +0000
+Subject: Fix handling of corrupt STABS enum type strings.
+
+	PR binutils/21157
+	* stabs.c (parse_stab_enum_type): Check for corrupt NAME:VALUE
+	pairs.
+	(parse_number): Exit early if passed an empty string.
+
+CVE: CVE-2017-7210
+Upstream-Status: Backport [master]
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ binutils/ChangeLog |  7 +++++++
+ binutils/stabs.c   | 14 +++++++++++++-
+ 2 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/binutils/ChangeLog b/binutils/ChangeLog
+index cf92744c12..0045fbaaa6 100644
+--- a/binutils/ChangeLog
++++ b/binutils/ChangeLog
+@@ -1,3 +1,10 @@
++2017-02-14  Nick Clifton  <nickc@redhat.com>
++
++	PR binutils/21157
++	* stabs.c (parse_stab_enum_type): Check for corrupt NAME:VALUE
++	pairs.
++	(parse_number): Exit early if passed an empty string.
++
+ 2017-02-13  Nick Clifton  <nickc@redhat.com>
+ 
+ 	PR binutils/21135
+diff --git a/binutils/stabs.c b/binutils/stabs.c
+index f5c5d2d8e0..5d013cc361 100644
+--- a/binutils/stabs.c
++++ b/binutils/stabs.c
+@@ -232,6 +232,10 @@ parse_number (const char **pp, bfd_boolean *poverflow)
+ 
+   orig = *pp;
+ 
++  /* Stop early if we are passed an empty string.  */
++  if (*orig == 0)
++    return (bfd_vma) 0;
++
+   errno = 0;
+   ul = strtoul (*pp, (char **) pp, 0);
+   if (ul + 1 != 0 || errno == 0)
+@@ -1975,9 +1979,17 @@ parse_stab_enum_type (void *dhandle, const char **pp)
+       bfd_signed_vma val;
+ 
+       p = *pp;
+-      while (*p != ':')
++      while (*p != ':' && *p != 0)
+ 	++p;
+ 
++      if (*p == 0)
++	{
++	  bad_stab (orig);
++	  free (names);
++	  free (values);
++	  return DEBUG_TYPE_NULL;
++	}
++
+       name = savestring (*pp, p - *pp);
+ 
+       *pp = p + 1;
+-- 
+2.11.0
+
-- 
2.11.0


