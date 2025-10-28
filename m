Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E79BCCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:18:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7938.1761646692269831721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 03:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RdsQXZ9y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3396045b79=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA2xTF3682449;
	Tue, 28 Oct 2025 03:18:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=EWDZMfVfUIxgrIo0LN18
	VcQt4fPFgx93j0aRpsjwVZQ=; b=RdsQXZ9y4TNxvALwTPMyKK2/shmX4GoQY6GN
	9GXQeXWF05k7mEdcxhtgxwlD5WnkoU5wjMNTf9q/C8eSqqPYFKFNx2hIdeJqL9KR
	dz5gfUZEg58gsKMoydY/cUafztC3Iu89mbiptgdEZ70yq5u3U/1ZzLHdPExIUfkO
	+tMFhiYJn33MaeS4HW84Yjt77BI6exoIfUknPTTefqxZq2EYYBvTsLugZ6C7Egg6
	0/N8ExceISP3dgKvuBKM1mbhzpNUy2C8zmiBa4EGX6ydSlMPJgqf2/qQIT//Seih
	r/QS/VY43+B0SUOOeYJlXCF0/H0oxJTAbw+5GzMWGQlTy5HQsA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0su1jw2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 28 Oct 2025 03:18:10 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 28 Oct 2025 03:18:09 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 28 Oct 2025 03:18:08 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
Subject: [PATCH v2] kernel-devsrc: fix incorrect python shebang replacement
Date: Tue, 28 Oct 2025 18:18:07 +0800
Message-ID: <20251028101807.2085945-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=SuadKfO0 c=1 sm=1 tr=0 ts=69009862 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=E3QKD7HjEgw5_gFfbC8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4NyBTYWx0ZWRfXzXo4TukklCPi
 brqtWu30AFUukz+wM0reX66+VJawDxOmtufIB5lFHaMy9vBztlOobSCdcFSG9+fZ0HAs1VwC7CA
 bLlC5cDQgCPpo0YgGkTyh97Je9o9KVVjpbYKvo8oUOXK2AnJd/kYAfrQOWTS2OX5As40ZYFFgBH
 Q42kmZnWNm0z3moeYu6K4wiHc/MrtkTvQ3QqH0Ochv1xS6wXEY6RC/yWowtfn4UZPjLg0oSQmJT
 maE9WOgWy4V5HliCiTK3PvpQG6a6yApZbzZ9QDrLKcF5FGAjGgGiBLhn+8Bp+zstXi3yMO2Bz9M
 RG2SiCHVDmcy+9iEj/cds5fwjrSOY43tAUuMIQLZP0nLdR2IaqfC3QotdBMOHsOXKGV0w7xX5ZI
 uRRs6/sEhu+maluI4H2/RavqB5fHSA==
X-Proofpoint-GUID: yEY1OIhE7S-IGs2k9O8AoWa7PEXt7SUR
X-Proofpoint-ORIG-GUID: yEY1OIhE7S-IGs2k9O8AoWa7PEXt7SUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 10:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225386

From: Jiaying Song <jiaying.song.cn@windriver.com>

Update the sed replacement rule to strictly match '/usr/bin/python'
(with no trailing characters)

The previous sed rule was too broad and could incorrectly change Python
shebangs such as in
/lib/modules/6.16.11-yocto-standard/build/scripts/macro_checker.py from
'#!/usr/bin/python3' to '#!/usr/bin/env python33'.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 04dd683dde..411c99ba30 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -400,7 +400,7 @@ do_install() {
     for ss in $(find $kerneldir/build/scripts -type f -name '*'); do
         sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "$ss"
         sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "$ss"
-        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "$ss"
+        sed -i 's,/usr/bin/python$,/usr/bin/env python3,' "$ss"
     done
 
     chown -R root:root ${D}
-- 
2.34.1


