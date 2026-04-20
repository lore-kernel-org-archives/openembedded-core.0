Return-Path: <bin.cao.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469ADEA71B7
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 02:42:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11852.1776652962288731158
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2026 19:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SdpahwBz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8570fe2704=bin.cao.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K1QC4J1728826
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 02:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=n06VMuFRs
	l34nVaBcs22NH9peZvsntItxBOtsk1lvCo=; b=SdpahwBzEu1iL695koAgfCy6z
	2EnXYx7Q3FvGjgv/x6fUc06Uar1PrSFT0SGOXnrDE807AxDU/u6hJsbmmT3+wosW
	BHTNy1Ls74UGJBYdZb3+Ed1jWLRTdQUdUaeXIVy/tMlUcwo5OiN5zTkB2d0BG98Y
	+e4bde1IqzmMjSpoY4RYPzuRTeIRZ9YhfFG60asZokFnHZgA1NpwWW1hYBqYBhCt
	Pe0r5Pw6bCyWQ/jyT4LgraTmLM6XbkZ9h/aAOiGJasomLKC3BmucZKgpHXLrvdH6
	ZVD/CeD905BaU3VQMRC2FdLhBzmBD+BQ9mAdtmLZ5APIZHpL2R7sScjkoaMFw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dky5y9dyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 02:42:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 19 Apr 2026 19:42:39 -0700
Received: from pek-lpggp2.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 19 Apr 2026 19:42:38 -0700
From: Bin Cao <bin.cao.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <bin.cao.cn@windriver.com>
Subject: [PATCH] scripts/cve-json-to-text.py: simplify getopt argument parsing
Date: Mon, 20 Apr 2026 10:42:37 +0800
Message-ID: <20260420024237.2218341-1-bin.cao.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyNCBTYWx0ZWRfX/09JjVFVPfG2
 6L5maRDMB+3S06G1Be7Ynq+ivOZUl/UuywDN5ELNjawXKaGjpM54Kq53SvZnZ4Oe2qWr0t1PRom
 qHo+iwyWa+6NnCW3Z57IIX11NLvnl7aenlPc5VZzcsNOIQ2Eqjpheva6TceuFXz9D31iVx6gOBE
 zOTarVHNAwENKyFt0B6xrlKO5qoiaiMN69tHCB6kDNNJu8ua/PVf6X3LnhlUQixJwHuUlOZggAE
 Uf1GQLw9DS76g7ixaKiL0XnBJEhkDBd0rjolNXi8vVReu52nypDYFlR7XWl+symvGphJqlEhKYx
 MPAydQ7GiFsB9cUF+HP0iaNaK4ISQ652KXuC9t/4zxn+2ypFS/tks9jXoQP4yyOXtMwIxdTpqSq
 5Up7qkXALNjHjYsAxnW53nTzfyulyQdScw8o+e9jcqDIGzU8dVWda+pvw6QqCr8pobY7a9hZ7jX
 IByRjt/WfYEqsNGSXVw==
X-Proofpoint-GUID: gSQOIn9z18rdGRXmWnRzMldXdSvjbmfR
X-Proofpoint-ORIG-GUID: gSQOIn9z18rdGRXmWnRzMldXdSvjbmfR
X-Authority-Analysis: v=2.4 cv=Bp+tB4X5 c=1 sm=1 tr=0 ts=69e592a0 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=lohBfNUtZP8jjYJ4hXIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 02:42:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235530

Remove unused long options from getopt.getopt() call. The long options
"help", "input", and "output" were never handled in the option parsing
logic, so they are dead code.

Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
---
 scripts/cve-json-to-text.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/cve-json-to-text.py b/scripts/cve-json-to-text.py
index 8d309b37e5..f338672269 100755
--- a/scripts/cve-json-to-text.py
+++ b/scripts/cve-json-to-text.py
@@ -42,9 +42,7 @@ def parse_args(argv):
     """
     global infile, outfile
     try:
-        opts, args = getopt.getopt(
-            argv, "hi:o:", ["help", "input", "output"]
-        )
+        opts, args = getopt.getopt(argv, "hi:o:")
     except getopt.GetoptError:
         show_syntax_and_exit(1)
     for opt, arg in opts:
-- 
2.43.0


