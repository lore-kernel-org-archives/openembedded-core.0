Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6199ECA0EE5
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 12:11:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.99180.1755087076707315381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 05:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0320ba7ade=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57DAuhoj3348346
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:11:15 GMT
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fv001tk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:11:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 13 Aug 2025 05:11:12 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 13 Aug 2025 05:11:10 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/6] elfutils: Fix CVE-2025-1352
Date: Wed, 13 Aug 2025 17:40:57 +0530
Message-ID: <20250813121102.779009-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=JKQ7s9Kb c=1 sm=1 tr=0 ts=689c80e3 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=fxJcL_dCAAAA:8 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=n9Nvxce8AAAA:8 a=20KFwNOVAAAA:8 a=IArezhZYhTUGa1GMXZEA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=V4tbcg9hxeXQX3VEsxKP:22
X-Proofpoint-ORIG-GUID: KA5v_H29LELWC4S7NHeAj17ceSU67ZPY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDExNSBTYWx0ZWRfX3Q2aQ0L/XPue
 WzHsAu97uW1cMaCmYSVHfjGzNT6Vx9MoTpoJ6b+59hZYhT+jhHKzFP2eLtrNFArTchfbwW3wLI+
 MGnjd21x4gMlwr/OTBeWjHSLP1rNYqYNLdS0o1snDa+Yz30CisVUG4ksMYKoEonyMjpNJFE6A8r
 FfypkrRyqoxHy9YQ/Sn0YtaeW60rE0VuWI/u+40aEdxs1rzxe9I5F4Tf7Vqi38LjYaiZhjKK06n
 YXh0qn7O1B43CUtkrpREmq+cCm5kQE3g0S1XkUb7oDYmj5KY7JISwbr33RXX6hNUw4GASoFkC+B
 vpOphkMBLbvzEt5NeQ9O7CHijhup3p6WGOHzj9QsGpLzxqmQl34jqjckhvc9ls=
X-Proofpoint-GUID: KA5v_H29LELWC4S7NHeAj17ceSU67ZPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221807

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability has been found in GNU elfutils 0.192 and classified as critical.
This vulnerability affects the function __libdw_thread_tail in the library
libdw_alloc.c of the component eu-readelf. The manipulation of the argument w
leads to memory corruption. The attack can be initiated remotely. The complexity
of an attack is rather high. The exploitation appears to be difficult. The exploit
has been disclosed to the public and may be used. The name of the patch is
2636426a091bd6c6f7f02e49ab20d4cdc6bfc753. It is recommended to apply a patch to
fix this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1352
https://ubuntu.com/security/CVE-2025-1352

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=2636426a091bd6c6f7f02e49ab20d4cdc6bfc753

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../elfutils/elfutils_0.192.bb                |   1 +
 .../elfutils/files/CVE-2025-1352.patch        | 154 ++++++++++++++++++
 2 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index 7bf9865555..829d9bf94f 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
            file://0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch \
+           file://CVE-2025-1352.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch
new file mode 100644
index 0000000000..b5e8dff980
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch
@@ -0,0 +1,154 @@
+From 2636426a091bd6c6f7f02e49ab20d4cdc6bfc753 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sat, 8 Feb 2025 20:00:12 +0100
+Subject: [PATCH] libdw: Simplify __libdw_getabbrev and fix dwarf_offabbrev
+ issue
+
+__libdw_getabbrev could crash on reading a bad abbrev by trying to
+deallocate memory it didn't allocate itself. This could happen because
+dwarf_offabbrev would supply its own memory when calling
+__libdw_getabbrev. No other caller did this.
+
+Simplify the __libdw_getabbrev common code by not taking external
+memory to put the abbrev result in (this would also not work correctly
+if the abbrev was already cached). And make dwarf_offabbrev explicitly
+copy the result (if there was no error or end of abbrev).
+
+     * libdw/dwarf_getabbrev.c (__libdw_getabbrev): Don't take
+     Dwarf_Abbrev result argument. Always just allocate abb when
+     abbrev not found in cache.
+     (dwarf_getabbrev): Don't pass NULL as last argument to
+     __libdw_getabbrev.
+    * libdw/dwarf_tag.c (__libdw_findabbrev): Likewise.
+    * libdw/dwarf_offabbrev.c (dwarf_offabbrev): Likewise. And copy
+    abbrev into abbrevp on success.
+    * libdw/libdw.h (dwarf_offabbrev): Document return values.
+    * libdw/libdwP.h (__libdw_getabbrev): Don't take Dwarf_Abbrev
+    result argument.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32650
+
+CVE: CVE-2025-1352
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=2636426a091bd6c6f7f02e49ab20d4cdc6bfc753]
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ libdw/dwarf_getabbrev.c | 12 ++++--------
+ libdw/dwarf_offabbrev.c | 10 +++++++---
+ libdw/dwarf_tag.c       |  3 +--
+ libdw/libdw.h           |  4 +++-
+ libdw/libdwP.h          |  3 +--
+ 5 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/libdw/dwarf_getabbrev.c b/libdw/dwarf_getabbrev.c
+index 5b02333..d9a6c02 100644
+--- a/libdw/dwarf_getabbrev.c
++++ b/libdw/dwarf_getabbrev.c
+@@ -1,5 +1,6 @@
+ /* Get abbreviation at given offset.
+    Copyright (C) 2003, 2004, 2005, 2006, 2014, 2017 Red Hat, Inc.
++   Copyright (C) 2025 Mark J. Wielaard <mark@klomp.org>
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2003.
+ 
+@@ -38,7 +39,7 @@
+ Dwarf_Abbrev *
+ internal_function
+ __libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu, Dwarf_Off offset,
+-		   size_t *lengthp, Dwarf_Abbrev *result)
++		   size_t *lengthp)
+ {
+   /* Don't fail if there is not .debug_abbrev section.  */
+   if (dbg->sectiondata[IDX_debug_abbrev] == NULL)
+@@ -85,12 +86,7 @@ __libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu, Dwarf_Off offset,
+   Dwarf_Abbrev *abb = NULL;
+   if (cu == NULL
+       || (abb = Dwarf_Abbrev_Hash_find (&cu->abbrev_hash, code)) == NULL)
+-    {
+-      if (result == NULL)
+-	abb = libdw_typed_alloc (dbg, Dwarf_Abbrev);
+-      else
+-	abb = result;
+-    }
++    abb = libdw_typed_alloc (dbg, Dwarf_Abbrev);
+   else
+     {
+       foundit = true;
+@@ -183,5 +179,5 @@ dwarf_getabbrev (Dwarf_Die *die, Dwarf_Off offset, size_t *lengthp)
+       return NULL;
+     }
+ 
+-  return __libdw_getabbrev (dbg, cu, abbrev_offset + offset, lengthp, NULL);
++  return __libdw_getabbrev (dbg, cu, abbrev_offset + offset, lengthp);
+ }
+diff --git a/libdw/dwarf_offabbrev.c b/libdw/dwarf_offabbrev.c
+index 27cdad6..41df69b 100644
+--- a/libdw/dwarf_offabbrev.c
++++ b/libdw/dwarf_offabbrev.c
+@@ -41,11 +41,15 @@ dwarf_offabbrev (Dwarf *dbg, Dwarf_Off offset, size_t *lengthp,
+   if (dbg == NULL)
+     return -1;
+ 
+-  Dwarf_Abbrev *abbrev = __libdw_getabbrev (dbg, NULL, offset, lengthp,
+-					    abbrevp);
++  Dwarf_Abbrev *abbrev = __libdw_getabbrev (dbg, NULL, offset, lengthp);
+ 
+   if (abbrev == NULL)
+     return -1;
+ 
+-  return abbrev == DWARF_END_ABBREV ? 1 : 0;
++  if (abbrev == DWARF_END_ABBREV)
++    return 1;
++
++  *abbrevp = *abbrev;
++
++  return 0;
+ }
+diff --git a/libdw/dwarf_tag.c b/libdw/dwarf_tag.c
+index d784970..218382a 100644
+--- a/libdw/dwarf_tag.c
++++ b/libdw/dwarf_tag.c
+@@ -53,8 +53,7 @@ __libdw_findabbrev (struct Dwarf_CU *cu, unsigned int code)
+ 
+ 	/* Find the next entry.  It gets automatically added to the
+ 	   hash table.  */
+-	abb = __libdw_getabbrev (cu->dbg, cu, cu->last_abbrev_offset, &length,
+-				 NULL);
++	abb = __libdw_getabbrev (cu->dbg, cu, cu->last_abbrev_offset, &length);
+ 	if (abb == NULL || abb == DWARF_END_ABBREV)
+ 	  {
+ 	    /* Make sure we do not try to search for it again.  */
+diff --git a/libdw/libdw.h b/libdw/libdw.h
+index d53dc78..ec4713a 100644
+--- a/libdw/libdw.h
++++ b/libdw/libdw.h
+@@ -587,7 +587,9 @@ extern int dwarf_srclang (Dwarf_Die *die);
+ extern Dwarf_Abbrev *dwarf_getabbrev (Dwarf_Die *die, Dwarf_Off offset,
+ 				      size_t *lengthp);
+ 
+-/* Get abbreviation at given offset in .debug_abbrev section.  */
++/* Get abbreviation at given offset in .debug_abbrev section.  On
++   success return zero and fills in ABBREVP.  When there is no (more)
++   abbrev at offset returns one.  On error returns a negative value.  */
+ extern int dwarf_offabbrev (Dwarf *dbg, Dwarf_Off offset, size_t *lengthp,
+ 			    Dwarf_Abbrev *abbrevp)
+      __nonnull_attribute__ (4);
+diff --git a/libdw/libdwP.h b/libdw/libdwP.h
+index d6bab60..0cff5c2 100644
+--- a/libdw/libdwP.h
++++ b/libdw/libdwP.h
+@@ -795,8 +795,7 @@ extern Dwarf_Abbrev *__libdw_findabbrev (struct Dwarf_CU *cu,
+ 
+ /* Get abbreviation at given offset.  */
+ extern Dwarf_Abbrev *__libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu,
+-					Dwarf_Off offset, size_t *lengthp,
+-					Dwarf_Abbrev *result)
++					Dwarf_Off offset, size_t *lengthp)
+      __nonnull_attribute__ (1) internal_function;
+ 
+ /* Get abbreviation of given DIE, and optionally set *READP to the DIE memory
+-- 
+2.43.2
+
-- 
2.40.0


