Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58935CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 20:10:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.28696.1759867802572500195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 13:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E/IqKzIa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2375dc7ba9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 597JodP6119957;
	Tue, 7 Oct 2025 13:09:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=BULlFYlQI
	SYjfyMtQ9gBvD6PaxQouoF8g7AasT3wpvY=; b=E/IqKzIai5TYOaE2UiTzyX3fi
	/HPdPmYXChxnkzZVw5gDEnAClvaOUkeTTOBd7SjsBIKszh+wHaT6+fHZzdpMjePn
	kJPXHEjIekKj0AEZtp9mK6RsX+UT+i+E4Jm2HyIS7ipyqbz66uKAVt4qcOo3w6bJ
	2jQePliytg1tTHzbTQHFzeRdPzqsGKQ7Xet4bqbFSH+yTXVEWqHRk5hRuD2mhjTq
	Dfjd1Wbbty2uQJTJT/7iQXWP1GTmR9TyaKy3fZldKv+RmTSD+SMDTG7vDeONM4We
	zocHqom554uAP41EHBmBv76UJM+PXLTbBtu7tuF4l7LVRwSa1BVHiQlfB8pjA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jxuwkb05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 07 Oct 2025 13:09:48 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 7 Oct 2025 13:09:47 -0700
Received: from pop-os.wrs.com (10.11.232.110) by ala-exchng01.corp.ad.wrs.com
 (10.11.224.121) with Microsoft SMTP Server id 15.1.2507.59 via Frontend
 Transport; Tue, 7 Oct 2025 13:09:46 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <Liezhi.Yang@windriver.com>,
        <peter.kjellerstedt@axis.com>, <ross.burton@arm.com>,
        <skandigraun@gmail.com>
Subject: [PATCH v5] gawk: disable persistent memory allocator due to licensing
Date: Tue, 7 Oct 2025 16:09:44 -0400
Message-ID: <20251007200944.323467-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=UMLQ3Sfy c=1 sm=1 tr=0 ts=68e5738d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=StdTn5e6Zk6IdE3NEv4A:9
 a=1N9iHcwoX80A:10 a=yLXxm-r16ukA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: kkaMLImyPFsEZmIYjO2a6ulwv5ER6QN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE1OCBTYWx0ZWRfX+kmW4itRR1Fj
 uYlOzgvRLAK0GD8u/VoaJGKEcmhxbCEjcSTwq3eoP+1a7/uryjwD+nDBc3JcYuqfZuMMj6sXAWs
 9uwjcQm2hGTwjb/QLLxl2r4uHviCgip6VA0HlevfI3srLtb4Vo0HdTFeh6APaTf2xWh+Ii7PDrV
 rtnY0TvEdkBB9aMrQAPe4AcT71X9n02nZ7nmh2I7qhHHtnFj8omsJ3rbXHy8n51TKyzyyVuPCFx
 Q2ZyX3B5f147B+WMklB8bN6iU6aQqUSouyzvumJ/VKBdsF00/CLsznW3F6R0Ai0DNRNFlb4abDE
 LGoOjADCEKyE8P018WgizR15p2at7w5L17Cs6cTbR5VOB/iXFqatt+m6x1SuM8a2AVwsZA+BUHm
 bQPnCqPBE1FgZPQrGBy8iFZg2bU2GQ==
X-Proofpoint-GUID: kkaMLImyPFsEZmIYjO2a6ulwv5ER6QN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2510070158
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 20:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224555

From: Randy MacLeod <Randy.MacLeod@windriver.com>

In gawk-5.2, a feature that allows gawk to preserve memory between runs:
   https://www.gnu.org/software/gawk/manual/html_node/Persistent-Memory.html
was added. The files that implement this, support/pma.[ch], are licensed
under the AGPL3 which some entities perfer to avoid. Force people to knowingly
opt into using this feature and license using:
   PACKAGECONFIG:append:pn-gawk = " pma-if-64bit"
where pma is an abbreviation for persistent memory allocator and the
"-if-64bit" suffix is a indicator to users that the feature only works
for 64 bit targets. Also add AGPL to LICENSE and LICENSE:${PN}, when using pma.

Correct the license to be AGPL-3.0-or-later. There hasn't been a change in
the license terms, at least for main.c, haven't changed significantly in
the last 15 years:

License-Update: Reflects conditional AGPL use and more as described above.

Testing requires a non-root account and following the example in the link above:
  $ truncate -s <size> data.pma
  $ chmod 0600 data.pma
  $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
  1
  $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
  2
  $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
  3

This works on qemu[x86-|arm|riscv]64 but not on qemu[arm|x86] where the
--enable-pma is ignored because there is a requirement and build-time test
for 8 byte void pointers in m4/pma.m4:
  if test "$SKIP_PERSIST_MALLOC" = no && test $ac_cv_sizeof_void_p -eq 8

Finally, remove an old comment about GPLv2, GPLv3 versions of gawk
since this is no longer important as the GPLv2 version is not maintained.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-extended/gawk/gawk_5.3.2.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
index 833fe78bf9..ffaef93e8a 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
@@ -6,14 +6,21 @@ HOMEPAGE = "https://www.gnu.org/software/gawk/"
 BUGTRACKER  = "bug-gawk@gnu.org"
 SECTION = "console/utils"
 
-# gawk <= 3.1.5: GPL-2.0-only
-# gawk >= 3.1.6: GPL-3.0-only
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE = "GPL-3.0-or-later & AGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19 \
+                    file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19"
+
+LICENSE:${PN} = "GPL-3.0-or-later"
+LICENSE${PN}:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma-if-64bit', ' & AGPL-3.0-or-later', '', d)}"
 
 PACKAGECONFIG ??= "readline mpfr"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
+# pma: persistent memory allocator:
+# Disabled by default due to AGPL license.
+# Note that PMA works only for 64-bit targets and is automatically disabled at configure time otherwise.
+PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
-- 
2.34.1


