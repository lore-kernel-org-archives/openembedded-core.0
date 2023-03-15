Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A515FC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 13:55:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8621.1678888543376350263
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 06:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UlvAhF87;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24387987c5=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FAeIkE009791
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 13:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=Zpbv7jP9sf958pqt1Hxx24s+hkcsccoob7R5RnxBr9U=;
 b=UlvAhF871ylwR+cfkbD96bg9Z1qn38dn7WAxmEGWxrJM6r8RXBFLC5fGXVAPU9nwhzSq
 I/7pve88xOcorbEl5d1KM66rFPVnlZoZUJtf38LRB3fifA/HdC/6U0hva6k31AP+FoSr
 U3dJhqOcVdFLyPXtuoEZLnzUjIU/kN2qLF8ji9Sb1GFcOrGfrDstpmFisH6CKvWzgDcg
 5J6dVKaCl30TuQ0WTnA1sicw/lBu8Jfi7KEpQgVypXFH3dsXxqE2XdKCK1ey6jEvisA8
 M5ISux0EJ8QFf+QWdbM1oXQC4AtWHYzbj8DMAgYP3DC5kZk8OUnbgcvjUdnBs2FSsilI lA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2as0k98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 13:55:42 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Wed, 15 Mar 2023 06:55:41 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 15 Mar 2023 06:55:40 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] python3-git: fix indent error
Date: Wed, 15 Mar 2023 21:55:36 +0800
Message-ID: <20230315135536.9384-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: E5Z_a01FDTRwIv5wPLOV0mWAw76eWRCh
X-Proofpoint-ORIG-GUID: E5Z_a01FDTRwIv5wPLOV0mWAw76eWRCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_06,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=922 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2302240000
 definitions=main-2303150116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 13:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178549

From: Kai Kang <kai.kang@windriver.com>

It fails to import anything from git/remote.py:

  File "/path_to/python3-git-native/3.1.27-r0/GitPython-3.1.27/git/remote.py", line 700
    url = Git.polish_url(url)
    ^
IndentationError: unexpected indent

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch b/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
index e3e66ec450..a017369f37 100644
--- a/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
+++ b/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
@@ -291,7 +291,7 @@ index 59681bc..cea6b99 100644
          scmd = 'add'
          kwargs['insert_kwargs_after'] = scmd
 -        repo.git.remote(scmd, name, Git.polish_url(url), **kwargs)
-+         url = Git.polish_url(url)
++        url = Git.polish_url(url)
 +        if not allow_unsafe_protocols:
 +            Git.check_unsafe_protocols(url)
 +        repo.git.remote(scmd, "--", name, url, **kwargs)
-- 
2.17.1


