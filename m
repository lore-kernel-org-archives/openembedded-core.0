Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E18FC433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 02:54:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.3768.1666148093552109266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 19:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OUIkuF9o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7291a5c760=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29J2ltwT001478
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 19:54:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=esSB6BBo1kiO8mmEiH/DrUR+WerMAw6Hq25Bt3X7BRo=;
 b=OUIkuF9oqSs93CpTkOFswOr5oPIpKP/+oXNUm2reMLVOZLgATzefWW/NqdyGVAVNUNld
 ldo1GX4HNeFTRrMTz0k7M/jc0XoS5T6P/SuJjRboWxfktnXx0G11OBnov6dOM+IlWZur
 5SJoQrfmo88OOiGQBIWUffTT83penoGGVWAAQfU2kOplKir4oau9CsX9+7Pqb1HoDj80
 lpazE88zw7mVsry/oXrmVNEwP62fqwHL46KEI9wvJmmn2TPWfTYTW+5ak8X66zGeF3ll
 ePzjDgL4fgx1FwuBmDF7tt5LO45jm9/tToj8m4fexCwtIYoYqIZ6JgDAkbh+MaHyfSZS rw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7vckkd31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 19:54:53 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 18 Oct 2022 19:54:52 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 18 Oct 2022 19:54:51 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] grub: disable build on armv7ve/a with hardfp
Date: Wed, 19 Oct 2022 10:54:50 +0800
Message-ID: <20221019025450.1626994-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <171ECBAF5E33994B.19418@lists.openembedded.org>
References: <171ECBAF5E33994B.19418@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Efothk2HHgiWxS6ByPs60qbfISayqNfi
X-Proofpoint-GUID: Efothk2HHgiWxS6ByPs60qbfISayqNfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_10,2022-10-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210190014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 02:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171949

From: Mingli Yu <mingli.yu@windriver.com>

The commit(75dbdea940 grub: Allow build on armv7ve/a with softfp)
enable build on armv7ve/a with softfp, but it acutally enable
build on armv7ve/a with hardfp altogether and result in below build
failure:
 | checking for compile options to get strict alignment... -mno-unaligned-access
 | checking if compiler generates unaligned accesses... no
 | checking if C symbols get an underscore after compilation... no
 | checking whether target compiler is working... no
 | configure: error: cannot compile for the target

So update the check to disable build on armv7ve/a with hardfp.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-bsp/grub/grub2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2545b99b6a..7161c4560b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -50,8 +50,8 @@ COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
 # Grub doesn't support hard float toolchain and won't be able to forcefully
 # disable it on some of the target CPUs. See 'configure.ac' for
 # supported/unsupported CPUs in hardfp.
-COMPATIBLE_HOST:armv7a = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
-COMPATIBLE_HOST:armv7ve = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
+COMPATIBLE_HOST:armv7a = "${@'null' if bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', True, False, d) else d.getVar('GRUB_COMPATIBLE_HOST')}"
+COMPATIBLE_HOST:armv7ve = "${@'null' if bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', True, False, d) else d.getVar('GRUB_COMPATIBLE_HOST')}"
 
 # configure.ac has code to set this automagically from the target tuple
 # but the OE freeform one (core2-foo-bar-linux) don't work with that.
-- 
2.25.1


