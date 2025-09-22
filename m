Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D557ECAC5AC
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 23:30:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4137.1758583817556455455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 16:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T50z6ejg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1360d2c790=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58MNU2RB2102778
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 16:30:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=42if6pd5jYa25/4fTEA2
	n/XFcvK6vWLGPY68fbbA9VY=; b=T50z6ejg1vzggXt7YISxBBM8ecGdsuIcvwb8
	E/jk/+0xsml87jpM91utJsAL5nErS8SWxIqnvfbq0ZnChDuxGdssHE0uYo772Wwe
	vYKXlWbKHFtpqG90q3tKcASzzrgELkqayn5zD6j6sDe3JU9cE5LI3aJeYoaQ0Nu7
	pbm/2jzgCo5YT98eBpwlUazt/HnZ3YQrti3VrI8PzoqSypGrl4Rx4in39viYRBOs
	n5qCW7pZOjL67IpJwncJUc2vVNOyeV9sWh8yWikLNMdoS/wjX1IfvOIf5pxgES8L
	2MeGI3d+fB8Q9og5N8PEnITGM2k8W3YCgfOrX5pcktPNQ1Gs4Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499qj2ta5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 16:30:17 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 22 Sep 2025 16:30:16 -0700
Received: from pop-os.wrs.com (10.11.232.110) by ala-exchng01.corp.ad.wrs.com
 (10.11.224.121) with Microsoft SMTP Server id 15.1.2507.59 via Frontend
 Transport; Mon, 22 Sep 2025 16:30:15 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] gawk: disable persistent memory allocator due to licensing
Date: Mon, 22 Sep 2025 19:30:13 -0400
Message-ID: <20250922233013.2876529-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDIyOCBTYWx0ZWRfX58ml67ZQ9E9A
 BFmBpBJWLZOIb1Z7013WQLwpulE/bN1lvboE05oCtFNXB85zkeNEd3MjUU8ELmcW+85zTEYjxLe
 UbXhoZh4AAzqBphYo6oC8bPEOBpcTHw7kUcw6MwH9Zt3GeB3gPVqLO/2PYtyPCahWEEJJAz1szJ
 RX1x7SURID6BZL5TA3u+nLvcKqWWw3sIeI6vcP0DN+U/FB6x8dm0Csh4iA4lT0UwsZyTBpZzc/+
 incB8wZU4e4KrQx13DGh9wogeSEjqRvNUDX6DfWOi1p4U4Ckyoov4oSU2AKQuEulbLwdjdC8Mbf
 Lm6mhEOZvUMs6dKJg3qEJMhe+FMnkIWQ5w7sAuNvn8Sb+0zIwgxbzzqjg1KRNU=
X-Authority-Analysis: v=2.4 cv=btpMBFai c=1 sm=1 tr=0 ts=68d1dc09 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=CXSo00n4fx2BV2pPEcYA:9
 a=1N9iHcwoX80A:10 a=yLXxm-r16ukA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: x7XHqx6cuj_u0R3EtD_ijU90QuUB3Yb4
X-Proofpoint-ORIG-GUID: x7XHqx6cuj_u0R3EtD_ijU90QuUB3Yb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 23:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223861

From: Randy MacLeod <Randy.MacLeod@windriver.com>

In gawk-5.2, a feature that allows gawk to preserve memory between runs:
   https://www.gnu.org/software/gawk/manual/html_node/Persistent-Memory.html
was added. The files that implement this, support/pma.[ch], are licensed
under the AGPL which some entities perfer to avoid. Force people to knowingly
opt into using this feature and license using:
   PACKAGECONFIG:append:pn-gawk = " pma"
where pma is an abbreviation for persistent memory allocator. Also add AGPL
to LICENSE if using pma.

Tested requires a non-root account and following the example in the link above:
$ truncate -s <size> data.pma
$ chmod 0600 data.pma
$ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
1
$ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
2
$ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
3

This works on qemu[x86-|arm|riscv]64 but not on qemuarm where the
--enable-pma is ignored for unknown reasons.

Finally, remove an old comment about GPLv2, GPLv3 versions of gawk
since this is no longer important as the GPLv2 version is not maintained.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-extended/gawk/gawk_5.3.2.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
index 833fe78bf9..b4b7419c34 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
@@ -6,14 +6,21 @@ HOMEPAGE = "https://www.gnu.org/software/gawk/"
 BUGTRACKER  = "bug-gawk@gnu.org"
 SECTION = "console/utils"
 
-# gawk <= 3.1.5: GPL-2.0-only
-# gawk >= 3.1.6: GPL-3.0-only
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+# pma adds AGPL license
+LICENSE:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma', ' & AGPL-3.0-or-later', '', d)}"
+LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma', \
+    'file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19 \
+     file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19', '', d) \
+}"
+
 PACKAGECONFIG ??= "readline mpfr"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
+# pma: persistent memory allocator: off by default due to licensing.
+PACKAGECONFIG[pma] = "--enable-pma,--disable-pma, "
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
-- 
2.34.1


