Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C2FCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 02:18:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2854.1761617914051352069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 19:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YJe5xvbn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2396ccb6ff=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S26idd2085945
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 19:18:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=lQWVfCz0E0eI0qzMlr/c
	hYXJbuPA0MU0UM7J1iNQe1s=; b=YJe5xvbnL+2V3Jeu7lMSOklAJJho+wiLUJcb
	/Nm1t86j0OFd07+5ucr9Eggsx2i2a9B19fdzlob34N8AOMFeX9RikBeNWZx3FxAt
	QJy51ImuBQv3P1UoIaviMtFkykckkjbaGx+mEGqqBJyJZ+KI6JscmjPjgmEOWbzI
	8RScrVzD1hSYDUtsojvuxtsNp8RQsEQR+I7pkzH2fxqmIqaqrEQtEOpXH15VkuSS
	xKZG3NHvxCIxhB9/vSqXIbuE86A1hTVze/3qvfpR4kAXBolaqFy2x6IbClLVM5p+
	4Lr8gBDyIYxIbSlOglyjry15C1TfXSXN8hXRAgBL7Z58o4nimw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0x2e2cqq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 19:18:33 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Oct 2025 19:18:31 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Oct 2025 19:18:31 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] kernel-devsrc: fix incorrect python shebang replacement
Date: Tue, 28 Oct 2025 10:18:30 +0800
Message-ID: <20251028021830.3937223-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vtP1sQE3sXZ1unGukN8uoUO0krP9pG1B
X-Proofpoint-GUID: vtP1sQE3sXZ1unGukN8uoUO0krP9pG1B
X-Authority-Analysis: v=2.4 cv=F6Zat6hN c=1 sm=1 tr=0 ts=690027f9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=E3QKD7HjEgw5_gFfbC8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAxOSBTYWx0ZWRfX++9sY4L2Gz2F
 1QuitzkYD2TeCHN4YK5U+7rX0E+X8BHUQ2/ui4phlDYzhpGdG4fTa0nMxQpEZwbL7PS1wIGRrO0
 Zt0qXFsG8HfFoGNMygieLttIXlQJuaq2yegBFl8PEXs1rkg+gvW/heFpQ5xvVbJQeXuTPH3wImC
 c/MikW1Y4W6CZcWpHaI1ZSw8DpuqYEpSMyy1+39zbFYG2/dv+w1bkFrAbZsXLjNq6iz4AKIHkDR
 sDajLhQ9av58hLzXAORWFu2KiP/Ma+rQPNqKw3hVPI6mmpfb4Uh1DSRyrYyayoF3KfpgPfBeAL8
 oo+k4rBsfTkWWaF//w4y2cXkek4wSKdw6ColgO3bkIzcS8p5jYo3HmKgBEYajW83WKjIW8bb2uO
 cgIqx+vk47YD06i9HfOkvQPdNZDA1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 02:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225372

From: Jiaying Song <jiaying.song.cn@windriver.com>

Update the replacement strategy to use a stricter pattern that matches
all versioned python paths and correctly replaces them with
'/usr/bin/env python3'.

The previous sed rule would incorrectly change the Python shebang in
/lib/modules/6.16.11-yocto-standard/build/scripts/macro_checker.py from
'#!/usr/bin/python3' to '#!/usr/bin/env python33'.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 04dd683dde..aaed0cd127 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -400,7 +400,7 @@ do_install() {
     for ss in $(find $kerneldir/build/scripts -type f -name '*'); do
         sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "$ss"
         sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "$ss"
-        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "$ss"
+        sed -i 's,/usr/bin/python[0-9.]*,/usr/bin/env python3,' "$ss"
     done
 
     chown -R root:root ${D}
-- 
2.34.1


