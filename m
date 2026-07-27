Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F34CC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 09:39:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27170.1785144642409662603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 02:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dpA+j1+x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=166884ae32=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7SCxV174450;
	Mon, 27 Jul 2026 02:09:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=O99hPKhxd
	AhdO+PD9LuuNStCXbIyKd6enxosSE+eRC4=; b=dpA+j1+xaZvTinTPEO1q22LCM
	GcLwSSdNooFu4zJ7RWq0O6d7udrniY2q7XG5oeM/4bYClCTpvqouHakjCRbmjEzU
	oIP+dPDIl40/Sz8LKXIz3Wxo8xypCCbgGtJwvsfRVQrtoH9fqdg1eDh1ozCPWDKk
	iRwFFnzHvw0mCFldazYES2bTbHHXZV2CR4aKfrjXP6ov6sszdUse5/2J9/PuvFRo
	BiPdeN0GbgxpiP1JI/0E3lf0AqGHxvUVOo7ptUNagPSldjIrBzFzLnbqh4vMMzVe
	RLsEWUPXdNG/62zVh0IPcKZhKzawlISBWiqlmD9hj2CxCq59nhtbAeOoBGVAw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmvnf1mnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Jul 2026 02:09:05 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Jul 2026 02:09:04 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Jul 2026 02:09:04 -0700
From: Himani Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <joaomarcos.costa@bootlin.com>,
        <Shiva.Komati@windriver.com>, Joshua Watt <JPEWhacker@gmail.com>,
        "Richard
 Purdie" <richard.purdie@linuxfoundation.org>
Subject: [PATCH] lib/oe/sbom: Improve SPDX parsing error debugging
Date: Mon, 27 Jul 2026 09:09:00 +0000
Message-ID: <20260727090900.81755-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5MCBTYWx0ZWRfXzlpghl5SYz9a
 dOBCY1sEAlwvKQoZZR14GkFvNX3QRU1RSHmbc9gs9078GPfXMGbAySXVKNeBnYzdAB/mCS5EuwQ
 uXmly49dVwcM/MT9W90LHcGt4fFrJDvmd+8RbERuIbZIdh3TSVaO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5MCBTYWx0ZWRfX+N9HzqkgG8bi
 qGm2nS7NgYm+ZbT4bmQSpgQLkftexm1A6DWxln1wg9FA5Y/qnWF4lzOH4XSHuxdJAWR1Nemmp2j
 4o1BDbpE25VLuktzOyeMxUawlQaowcaatBZhUku9ILcrrBuU2ooksu5LdawDta7FhP79oeYPzoh
 5BJnnRrVrPE/3mdDwYKQobnIPcEy5XwRASau0MhBWxGLbFgiLgSIypW+AOo4Et5EsnPw+XEQpHm
 bLTFZBQElGJu2Boce9an+uqBn4B+kfawYFYL1deV/PybA/43jdU07WHYb9slQg7WNB2+F+ZahIX
 kq7afADpwBhC4BwvoGBJfTJW1H64M5DqH69HCN1yAKILNBLdi+L1hdcxiaFN9aKkXZy+OUZWdPY
 ujcu4hwH47HGbtUANTlU3km2UAemiEHVau5TUEXOz8IuE1yHpl0Fw2z0eBDYp78tBjTXApcRV+h
 w86WMFNTOtsmKypHqfA==
X-Proofpoint-GUID: wuz0slE0H6CoYCaTHe4uGdsvio7Xq3_f
X-Authority-Analysis: v=2.4 cv=M7x97Sws c=1 sm=1 tr=0 ts=6a672031 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=pGLkceISAAAA:8 a=ag1SF4gXAAAA:8
 a=Mrz1Ee2ji01NtSlgBnsA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: wuz0slE0H6CoYCaTHe4uGdsvio7Xq3_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270090
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 09:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242077

From: Joshua Watt <JPEWhacker@gmail.com>

Improves the debugging output when parsing an SPDX file fails by
reporting the file name (since this is not normally visible from the
backtrace). Continue to raise the exception after reporting the file
name to get the full backtrace.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sbom30.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 28778651d5..e02382c3cc 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -977,6 +977,9 @@ def load_jsonld(d, path, required=False):
         if required:
             bb.fatal("No SPDX document named %s found" % path)
         return None
+    except Exception as e:
+        bb.error(f"Unable to parse SPDX document {path}: {e}")
+        raise e
 
     if not objset.doc:
         bb.fatal("SPDX Document %s has no SPDXDocument element" % path)
-- 
2.54.0


