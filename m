Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5322CA5FEF
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 16:47:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1835.1791130934603604312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 09:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KYX7bPlE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: pohuchiu@qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694EdxMA1997439
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Oct 2026 15:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J6m2vX5PW74
	4OWIfkwaN7OpKzIl1AZbQANKflv+Maos=; b=KYX7bPlEdSvffIsHxuFi7H/BzBB
	TtSHpJrqILcg509kTLINXC3yOVKENKh1vpDAhhXjXby3CIZPwnyxCt+1Fz65fpBR
	8GbK0MPQ44QeeNatNekDB8UNWlZfeRhKTwRZyzUcisIbkP8U3NHKH4aJF7MpVPjF
	qLtfpMKMG5QfhDZg0xJclGfT4ExDS8YexBpoywvUSlmMifp53OqdH7EVgVckQEmW
	bs5H5sWGCCymZLIwFunelEl0crYBZBznWdMnhr4x3ByV1YaqXhtN3Z/DicEZHVMY
	Y4uGn7lEZbSueLYcOlr3PrlXWiXYi0r5lpho1rYdfls2ikZmVHSBhZHHrWw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tveu4j9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 15:29:38 +0000 (GMT)
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-pohuchiu-lv.qualcomm.com [10.81.89.102])
	by NALASPPMTA04.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTPS id 694FTb5a2317952
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Oct 2026 15:29:37 GMT
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4703090)
	id B73AF106D; Sun,  4 Oct 2026 08:29:37 -0700 (PDT)
From: Paddy Chiu <paddy.chiu@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/1] externalsrc: preserve source revision in PKGV
Date: Sun,  4 Oct 2026 08:29:36 -0700
Message-Id: <20261004152937.2437098-1-paddy.chiu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922092015.2428562-1-paddy.chiu@oss.qualcomm.com>
References: <20260922092015.2428562-1-paddy.chiu@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: hwA5zDQoSybleXjlSR9HBebULwXzR5xY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA2MSBTYWx0ZWRfX4jyOOozRIhWl
 xoEa7clflYZcP++GH5ru8YQJi6X88ehxQdrm/PrxvupB/I5EMfSRUzSAwIA0H72j1USsgIKQq1d
 +LZ9yMyxSKiipdzgFXAeEg7rijZ0y+M=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac270e2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=fdRUI-1tV_NyuyI2nScA:9 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA2MSBTYWx0ZWRfX7mtVKJBBGazF
 0dEazrxnlA/uaoBskX6FLGXMlq6F4E2j7Qonw1ePd3O/vChKzKlsqjNAEjYMxlotNK/dr/L8pVp
 dgmSt8X3JcPYR7ty6ID/ooWjbh99vym3Hu0YBzfEfij9U/vp71A7FnGoTaSZVIeBjAsdCXcjw4A
 FANEoVApfZsuX+hRoNh+8TJuF1f29pdVdPQ4xck3sjhSOUej9ihl6PaTbku0qyc05z/I2ymN46M
 6E1LQXxYHwkRqyeCeSN0c8+51CFCEffm54zp4sG/5bsSjOka0tQcR9I2UHp7y6WpJX7jdYO9wxV
 Qg5xj1N/xXt3rq6geH4njZ2HrrdkfUEGSmeJiUanHYll/KxSrFMhn7hQH3R8w5gONajiJSPlMK8
 Cu7bBQzI4MpEhE8l8IGAKCEkOmxU6S8gchPxrfY8Wcf0mdzW1l8B6cmuk/iFJVj7e+qcTbsswUq
 234s29Bifn8If0Fh0Fw==
X-Proofpoint-GUID: hwA5zDQoSybleXjlSR9HBebULwXzR5xY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040061
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 16:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247201

Hi Richard,

Patch v2 (Proposed fix) addresses the concern with the previous approach:
it no longer copies the datastore or rewrites SRC_URI during package
version calculation.

Instead, externalsrc saves the formatted source-version suffix in
EXTERNALSRC_PKGV_SUFFIX before filtering SCM URLs. The package and
PR-service paths reuse it, while the normal fetcher path remains unchanged
for non-externalsrc builds.

Validation used git-submodule-test for both requested transitions:

  BitBake to devtool: both builds produce the same hash-bearing PKGV and no
  version-going-backwards QA error.

  devtool to BitBake: both builds produce the same PKGV with no regression
  in the reverse transition.

Changes since v1:

  - replace the copied datastore/SRC_URI override with a saved suffix;
  - use the suffix for both PKGV and AUTOINC PR-service handling.

-- 
2.34.1

