Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC5BC87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 12:11:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.99650.1755087081432565812
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 05:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0320ba7ade=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57DBJvrr3831838
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 05:11:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fvk21q41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 05:11:20 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 13 Aug 2025 05:11:18 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 13 Aug 2025 05:11:16 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 4/6] elfutils: Fix CVE-2025-1372
Date: Wed, 13 Aug 2025 17:41:00 +0530
Message-ID: <20250813121102.779009-4-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250813121102.779009-1-soumya.sambu@windriver.com>
References: <20250813121102.779009-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDExNSBTYWx0ZWRfX6GEYPVig2ZCn
 8WFIEiLpxMwWlz/YhhxqCBpwf8xmYPyXlAG3ZSmIi3xzxAVxOYUsFSSHFdI6JgWvjZIVAt8ObzT
 ZzybOMYprx/Ty3WfVwfDDxParMdBnK9aMkJoh0T/w0yKDsUrPFrCXLrY4gPOyUG0KfLHJaU7qXy
 xf0Ij5bEsDD1Gi46nuxeDL4vLz1JHyZ3YZnOcApgvaInR5AhvRK2qZuEUNwERYjJpZYku1C5vIo
 aSt7gOMkje4HaAuPI97uq7nhGWqO7WqsI5EiKT8WGiOTgKF8/qDFM/uC9Y6KsiRffMfuym0hu0O
 gUKsqo58AJXLEypRMJ77IW4Yde/is3Md3jJGe9oBTVmk64fM8Vjs9/BrcySp/4=
X-Proofpoint-ORIG-GUID: ncdFjeuURIEBvFvtJvSPFGJH8Ig_htnB
X-Proofpoint-GUID: ncdFjeuURIEBvFvtJvSPFGJH8Ig_htnB
X-Authority-Analysis: v=2.4 cv=PsOTbxM3 c=1 sm=1 tr=0 ts=689c80e9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=fxJcL_dCAAAA:8 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=n9Nvxce8AAAA:8 a=u3vmu-HN0Zf1HdXin3oA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=V4tbcg9hxeXQX3VEsxKP:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221810

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability was found in GNU elfutils 0.192. It has been declared as critical.
Affected by this vulnerability is the function dump_data_section/print_string_section
of the file readelf.c of the component eu-readelf. The manipulation of the argument
z/x leads to buffer overflow. An attack has to be approached locally. The exploit
has been disclosed to the public and may be used. The identifier of the patch is
73db9d2021cab9e23fd734b0a76a612d52a6f1db. It is recommended to apply a patch to fix
this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1372
https://ubuntu.com/security/CVE-2025-1372

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=commit;h=73db9d2021cab9e23fd734b0a76a612d52a6f1db

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../elfutils/elfutils_0.192.bb                |  1 +
 .../elfutils/files/CVE-2025-1372.patch        | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index 2f34bfeebb..4dcc774bb9 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1365.patch \
            file://CVE-2025-1371.patch \
+           file://CVE-2025-1372.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch
new file mode 100644
index 0000000000..c202d8359c
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch
@@ -0,0 +1,51 @@
+From 73db9d2021cab9e23fd734b0a76a612d52a6f1db Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sun, 9 Feb 2025 00:07:39 +0100
+Subject: [PATCH] readelf: Skip trying to uncompress sections without a name
+
+When combining eu-readelf -z with -x or -p to dump the data or strings
+in an (corrupted ELF) unnamed numbered section eu-readelf could crash
+trying to check whether the section name starts with .zdebug. Fix this
+by skipping sections without a name.
+
+   * src/readelf.c (dump_data_section): Don't try to gnu decompress a
+   section without a name.
+   (print_string_section): Likewise.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32656
+
+CVE: CVE-2025-1372
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=73db9d2021cab9e23fd734b0a76a612d52a6f1db]
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/readelf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/readelf.c b/src/readelf.c
+index a526fa8..89ee80a 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -13321,7 +13321,7 @@ dump_data_section (Elf_Scn *scn, const GElf_Shdr *shdr, const char *name)
+ 			_("Couldn't uncompress section"),
+ 			elf_ndxscn (scn));
+ 	    }
+-	  else if (startswith (name, ".zdebug"))
++	  else if (name && startswith (name, ".zdebug"))
+ 	    {
+ 	      if (elf_compress_gnu (scn, 0, 0) < 0)
+ 		printf ("WARNING: %s [%zd]\n",
+@@ -13372,7 +13372,7 @@ print_string_section (Elf_Scn *scn, const GElf_Shdr *shdr, const char *name)
+ 			_("Couldn't uncompress section"),
+ 			elf_ndxscn (scn));
+ 	    }
+-	  else if (startswith (name, ".zdebug"))
++	  else if (name && startswith (name, ".zdebug"))
+ 	    {
+ 	      if (elf_compress_gnu (scn, 0, 0) < 0)
+ 		printf ("WARNING: %s [%zd]\n",
+-- 
+2.43.2
+
-- 
2.40.0


