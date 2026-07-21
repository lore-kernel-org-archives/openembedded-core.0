Return-Path: <enoch.ng@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D78C4452D
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 23:04:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36470.1784675092504831801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 16:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eqqe4h/G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=16621aaded=enoch.ng@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKmONq3406377
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 16:04:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2TnzpgT2rAAK39V4Ah0s
	MzDyRbmLr+itoyUNlg4qWxA=; b=eqqe4h/GoidzIjJ2cqbHziK/abjdUHrj7HNn
	j8SmJyy/UbQSedOrIBu3Y+X1/9qAzxEUpC4HwkTrqWv8KgZbU3Q4W4N6+/5oLLxd
	Taczn47aofXPehvh35SQfFff8KsbLwGVZObYbtcSXQJuUxl1mcT8hmIhd1rYGzg5
	7I3yE3CejXGIhhwIRorlCPb/s0FSwpqKpBW6WEXEbv1lRGL5pY+QHtPoFe6TeifZ
	LiZodF87h+x0y2tU/RS0aLxlpokbN82q0L3wIpADriYX3Okc/AKHWTVxJboUCReB
	HtPhqNIRqwD+Ur4ElKZpXESI4gtgd2dnn1NRA2p16r6Qp8yKvQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010047.outbound.protection.outlook.com [40.93.198.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg90cxerf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 16:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWwmOFjKp4wVgvv8jYM9yEX5iD58XlHRGySpIcDmR4YNkaW418kBSQVwls5+7J9373+Gp+GMDEqlpl7SUUN/9dWcWzhmheiBEkdmEKtSrbds70cNYTu7HclT3/KPxIvUVBsNuL6FYyaD2R/p0v78oOkIRo9WWHliUggAVB9awTpwEvZMxSFFm1IYPkx/BNXzsACyEordrgwrRSzawPFB7CTHd7YJLfLJuavmxuSxg0rQcDf9Fddjqnm0Pu/E4u4j7oNRp27wsaIIfIPbCTZv+8tKSz8limaT2p4ny5qPDS+VIROYU3OOAFi8H93Pg6b+za7iYJt60GdjPhPW9G3Dmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TnzpgT2rAAK39V4Ah0sMzDyRbmLr+itoyUNlg4qWxA=;
 b=qkjgk1iG1GgZpOj/AOTPO03H2Jvh/jqFL0B50E3RnTqieeMRVqWatuQmW7FGAhcOfjOcR29vQY0EUcnNyaJx9MtWSzEA1BriwVNP9aD1xVfB+S1Cl/m4zf0nujykrTgkEKVFrNsO/NTbe2KshXaYZZRjvQ6rHrMLj3kMrNVsQABFUBe7BWamjXdHc8rVfSqGWexTswClpBby9EUMrWx6/ETKNN1L3NIaRv38pHv/ULJIOFtF+sVrRfXecj3B4Vf/VLC9iD/EIpuD7lARN+jGufTteb7xn2sAn/U/zbpzqlMTDT6GXNePcjRMfmFkO7eHxRsaQKNy66VibHA8aFhhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a)
 by DSWPR11MB9582.namprd11.prod.outlook.com (2603:10b6:8:36e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 23:04:49 +0000
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e]) by DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e%3]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 23:04:49 +0000
From: Enoch Ng <enoch.ng@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] libxpm: fix CVE-2026-4367
Date: Tue, 21 Jul 2026 18:02:48 -0500
Message-ID: <20260721230248.1874697-1-enoch.ng@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:408:f7::10) To DS4PPF10012BF96.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF10012BF96:EE_|DSWPR11MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e3a3bf-45ba-4c35-3949-08dee77c7713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|10070799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ROD+LgrmSdp1E5eQebIvC6aLMD5JkFp2ouW8IzF+/ua4uNxHJrNKwWOKhH/0XgyI4VX/t5vgQr3mGeNhyBOpxUPvbbBz+DlYQg+3FZcrgR06DZ/PrFkSb4poVBJvV24jTiOgk1NqTz5nmUVok667dl9uQY99CuQtRuWzgFjnW7sehTHP1XEaRi4rhw8/3l3YRZ9GIM9xQt5f2RO5vHz7PyrESAL+WU+6ewgwySXlPKwdVT/imsovHzc8HR3XZ3Jm7gNn+GLKVPe5TAZ9E3sJXfKlxAB5TxgnNeFhMdBxWM9X9dBBm7QsGJcSKIfNzKSchcozRsn2sZ0dLUXrlQm9U6MOic6Gj/2IMzq16HmvZV/7lyeY52YqPBLft7vI0w/UY8jqckx5cyPOAzM4ieoBqyqc6FS41Yk+KZTWE5wfWDDeoHvBqCnAIYBR98Ws/FXAmDH47Y6KJa4VRrW+oLS8/etGw0X3fU9/koCiBi32haCpf3YJuIBqkW/IlvnRiX2b3A7fpHbBPkTLyFHdHcNqpm1xPutijBkL3s8bGqQRuLHRIcMUvCeYZg1yd8JA3j3ikvOC1DTs7WUCjBZ7s2N586GdjX1NMLLY/dow1LKDgu8t4gabS5pGApBFM7rPXqH+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF10012BF96.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(10070799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7iK63PvxhKGpv49oesFlzg+ndnBp5U4AwZaGu5BQVgbApGi6b48PWOT8dhRp?=
 =?us-ascii?Q?QYWSZ0V/QPlvvfdFBrPjDXgPUzIfyBGTYGfNBJ+lgyrCYeZddginyvfyIn7r?=
 =?us-ascii?Q?0o2SsLZDofcOZMibG7v8oVOx0nnH0czbh+SVile/0fdL64/tmXscBIjXoQlV?=
 =?us-ascii?Q?t7n9ZBtTAXKo+rTTCk4x8SX3dswJvUEe5JPaw4pfkFcU7s/lmX6dQ9Lp0N1n?=
 =?us-ascii?Q?8FGp4BFx/csGr3ZKwOznIFeOnB2RQuwoApO8ymDCiVTbTFTUKNY2Hu1scFI/?=
 =?us-ascii?Q?FNBD2RTssKF03yYARPKWiLZp3TiO+uZHNO9luCr2Gg+hJhP+Ot04XFbySOjy?=
 =?us-ascii?Q?8X5gtBDBFBb6c48vrH/eWU/RtSGR12NTwFc+AcHvF/YX7D2siMeNPg6JkYsP?=
 =?us-ascii?Q?EijGeY3FeReiYLlGii6ZFo9btlP08RLXoq5EoN+ghzK45QxVnOMH3oLg5SFB?=
 =?us-ascii?Q?tPGBiNmvShxS2WHuyHST+spLyrKgWB2AmTmtHuwDEgtEYOeaWD1ERK9KS2cF?=
 =?us-ascii?Q?RVlyYdFR8Z6O6OMddxxz+cNvij08nncaicb7sjbaga9cJPbK83U3We5MWlJI?=
 =?us-ascii?Q?QKfCKXG2uV8OM9groupkkXk+/qfuExfmSKdBCc/Bi+VgbYiQjAQm1xs/7jZs?=
 =?us-ascii?Q?T7wVtwYxH70IogJiq6ggLWnC5GS82oqALVNKh0ti1U2M2OY+K4KLDvVJucWr?=
 =?us-ascii?Q?6CEV9g/wJRNhAYV5X0gAT8B4j2Pv5DNUhHwrv0q4f4Z++6JpvimfzZR4UuY5?=
 =?us-ascii?Q?U5YJ7KzpC98GXW4GI9kFubYjBaPBydC0Sd+AsMadcdHbw8Z6o85bwl6fA55e?=
 =?us-ascii?Q?1dIaJ206lk2YKu9VInYa3pn/HFbUipH0y+TFwzh7KpujOrGKLG/FBsBTtb+x?=
 =?us-ascii?Q?5rk55CIZNrkof1cqLMWPta8Jn+yaV4i4Ob9IMw6H5kF9GIHyBDUihTLChReD?=
 =?us-ascii?Q?f5g9sNVwrIFpTbLVMCFGRWVRdh8AIiGaAPRd4/uBpzXKSCPv3dDtlQ8hPB9f?=
 =?us-ascii?Q?veJPLuTXCrEd1K1ANeJ4NZ6l0rlDbd09S2wPfVTR6NNB72PjvbFpAq+Nrfpr?=
 =?us-ascii?Q?BDrAFbOiSKW1WlQuJrjxxxOH0//NKBoQc5h08aQkozxhbo17zcNWnswd/4bf?=
 =?us-ascii?Q?f7ESMkd3OVnyzG5sP61wY8IoP3T+XVWZ5vqLWRUD0sVrmD+tGgpPmUblH9Jo?=
 =?us-ascii?Q?v5GW1rXcNxoyWj6oOLMt2jq3uqu27L+Magb6sgHUP8qBlhKOFOog0OtvnuJj?=
 =?us-ascii?Q?+OKlwAq6rzND6jU49zrbr31W+iHFJShWByEyVXzO01zVyP9hvmG753ICSLEt?=
 =?us-ascii?Q?8dfQFdu311gqQnJAxndIM/sfIO5lhNdppWer0xTOsTzmIDyQLXSIcG+9xcmO?=
 =?us-ascii?Q?Qx58JJwblOlS9lStmyzCEtqjkL3RARk1rEjHeZK0qWolax/0V2ta/w4st1HC?=
 =?us-ascii?Q?4fVOOqVLIZ4O7SoWYcM6TTQ2JRC8/v/VCXKXD37lqVmj7FOtP3MEcwgmbD4K?=
 =?us-ascii?Q?4Z4Ds8wghu/SGz7Vzxt86UdQmQ894kHurc9s5gXt5L0zlPY9NgTpYZbUaf73?=
 =?us-ascii?Q?vef6i6j+OaUllb4yQuAT1I24N9bQzR0Z62dxuG4/4P6dK0s4lJfLeXisSs35?=
 =?us-ascii?Q?9wlndKGGWi1NDSDPAn0b2COiYZblU0kODv62iNHrK/U4GXDInWFPFMQWQeil?=
 =?us-ascii?Q?GkSaVqLwaLjioJAYG2pwFVCAWvEucK6ptKMuastQyliYsu1Kgb6LVwQDcUhd?=
 =?us-ascii?Q?eb0W43ZP20CxykmejHqFABt+0d6A2VWFRAHGNhR/Z/9pLQgz6zjEtoDjq3ww?=
X-MS-Exchange-AntiSpam-MessageData-1: UEz1+sutfBbUUw==
X-Exchange-RoutingPolicyChecked: 
	AjtDjN0OMs3G07mig5X3/rvqdbiqBwjbVl2U3VL2tQDf7MlIqEcFEvffllTwJkXQvlfAY7V/TRWN9YKcQGdOjnclG+PGCrRoAv90iZ9vy5hvcmHmPfPeuwpGENVD6BoR5lHTubePRB/MQtZywejUKuVlInVdMcsmy8KUgiGysxtCFUfiX5sOAC7T6KJ2EO2UWBQyGpH4qIP06vdmLcSyk7NTs/a2ph1riR46LDPYE33+R7o0UTAEogtSyviFSFVTIaq5ds6sw/Vxf9EoxW9Yr0wHjAJ1d93p3ne9DGa1fec9Q5qzpL1yaDfgPEbRa4JjoshhRLdUVCaU7aQtLw4ouA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e3a3bf-45ba-4c35-3949-08dee77c7713
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF10012BF96.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 23:04:49.4787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeYMu+Nh1l8lxrP4uRokRLLT7sIOlovaZer4VyqVZP4p7K1JIdEfK8keD/89NMc8Wjd0HXyfm/cb+0jxIjWULA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9582
X-Proofpoint-ORIG-GUID: ktNCWjufkoMF_UhaA-cbMziWUZ_xKnQs
X-Proofpoint-GUID: ktNCWjufkoMF_UhaA-cbMziWUZ_xKnQs
X-Authority-Analysis: v=2.4 cv=AOkSgtoa c=1 sm=1 tr=0 ts=6a5ffb13 cx=c_pps
 a=NlF6qXdsITzFGNsd7EO88Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=QYPZNIIk9UGFkgUltgkA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOCBTYWx0ZWRfX4pb930Z2iqmt
 KC1KAt5Uw/suh9ESHi3LF2bFxxApinpTvyrVr2+CTxj3NQW7I6JfWJxjhZ4LtbxoqQLA6jceKih
 L5K04uiHO02LL69ta5gSsYJdhgSAjPL9GTHnOTcXo5ReWzXR4nMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOCBTYWx0ZWRfX/p4e6zYGfgdV
 Gjh+z2P118HkEUowjfGS7Y52iL1Lqya+lRBDWfCPm9cWwQd42YamE6BiOebPIF9Utm8O1A7a3ih
 VCq74QCPRg/hpsi7buXxudBzBGqWa8Aw3g+Hv+2bOu9AlG2HV6gBemXVq1h0Y6+0Ho7exTnsG09
 Cn4NyAtRhHn+TQoIG2q7OLoubZB/FAXONm6YnOor8rswrJ/SPyukTsvUQSS87ZKcuTVOLjpzUOf
 /YgaVJ6eKujsXHKO8geNtRjNx/THkm7epdiAYaP0qG9fzsnaC+hOjJRmTV8L02Y5eo9FEAF02IB
 Zivq7INP6V+DZjZ1GTh3HGgugTZTsXjQxtfvlGZi9tTmSwSOHHEPPidgmYN5rjQoc1mAOx/I5eU
 SIOiewPkcqlddyyjzbndN+h6M0H7ejT9inG+sGortxu1ftlemTJ9kxtFOhtd/uAVvhtBf4t26Er
 xNTIpgi6NFhzgb+1gLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210238
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 23:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241579

Backport the upstream fix fpr CVE-2026-4367, in which the
`xpmNextWord()` function could attempt to read beyond the file's
end due to improper validation of file boundaries.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-4367

Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
---
 ...67-Out-of-bounds-read-in-xpmNextWord.patch | 139 ++++++++++++++++++
 .../xorg-lib/libxpm_3.5.17.bb                 |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch b/meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch
new file mode 100644
index 0000000000..e1320b597d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch
@@ -0,0 +1,139 @@
+From 5448e1bd7252780b16db869c2253d24e0fe0ae18 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Tue, 17 Feb 2026 11:59:56 +0100
+Subject: [PATCH libXpm] Fix CVE-2026-4367: Out-of-bounds read in xpmNextWord()
+
+xpmNextWord() checks for the terminator character to detect the end of
+the file, but a very small malformed XPM file may cause the function to
+read past the end of the buffer, causing out-of-bound reads:
+
+  == Invalid read of size 1
+  ==    at 0x48AD3A4: xpmParseColors (parse.c:239)
+  ==    by 0x48AF9D8: xpmParseData (parse.c:783)
+  ==    by 0x48B1C18: XpmCreateXpmImageFromBuffer (CrIFrBuf.c:101)
+  ==    by 0x4005A6: main ()
+  ==  Address 0x4c413bf is 0 bytes after a block of size 15 alloc'd
+  ==    at 0x4841B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x48B2809: XpmReadFileToBuffer (RdFToBuf.c:96)
+  ==    by 0x400554: main ()
+  ==
+  == Invalid read of size 1
+  ==    at 0x48AC8D5: xpmNextWord.constprop.0 (data.c:262)
+  ==    by 0x48AD492: xpmParseColors (parse.c:266)
+  ==    by 0x48AF9D8: xpmParseData (parse.c:783)
+  ==    by 0x48B1C18: XpmCreateXpmImageFromBuffer (CrIFrBuf.c:101)
+  ==    by 0x4005A6: main ()
+  ==  Address 0x4c413c0 is 1 bytes after a block of size 15 alloc'd
+  ==    at 0x4841B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x48B2809: XpmReadFileToBuffer (RdFToBuf.c:96)
+  ==    by 0x400554: main ()
+  ==
+  == Invalid read of size 1
+  ==    at 0x48AC965: xpmNextWord.constprop.0 (data.c:265)
+  ==    by 0x48AD492: xpmParseColors (parse.c:266)
+  ==    by 0x48AF9D8: xpmParseData (parse.c:783)
+  ==    by 0x48B1C18: XpmCreateXpmImageFromBuffer (CrIFrBuf.c:101)
+  ==    by 0x4005A6: main ()
+  ==  Address 0x4c413c0 is 1 bytes after a block of size 15 alloc'd
+  ==    at 0x4841B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x48B2809: XpmReadFileToBuffer (RdFToBuf.c:96)
+  ==    by 0x400554: main ()
+
+The problem actually comes from xpmNextString() and xpmParseColors():
+
+1) xpmNextString() checks for the NULL terminator when looking for the
+   end of the string (Eos) but not when looking for the beginning of the
+   next string (Bos).
+
+2) xpmParseColors() does not check the return value from xpmNextString()
+   and continues even when xpmNextString() raised an invalid XPM file.
+
+To avoid the issue, fix xpmNextString() to check for the NULL string
+terminator when looking for the beginning of the next string and fix
+xpmParseColors() to stop when xpmNextString() reported an invalid XPM
+error.
+
+CVE-2026-4367
+
+This vulnerability was discovered by:
+Naoki Wakamatsu
+
+v2: Fix the XPM 1 code path the same.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxpm/-/merge_requests/31>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxpm/-/commit/5448e1bd7252780b16db869c2253d24e0fe0ae18]
+Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
+
+---
+
+ src/data.c  |  3 +++
+ src/parse.c | 19 ++++++++++++++-----
+ 2 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/src/data.c b/src/data.c
+index 6e87455..a2b4acc 100644
+--- a/src/data.c
++++ b/src/data.c
+@@ -210,6 +210,9 @@ xpmNextString(xpmData *data)
+ 	    while ((c = *data->cptr++) && c != data->Bos && c != '\0')
+ 		if (data->Bcmt && c == data->Bcmt[0])
+ 		    ParseComment(data);
++
++	    if (c == '\0')
++		return XpmFileInvalid;
+ 	} else if (data->Bcmt) {	/* XPM2 natural */
+ 	    while (((c = *data->cptr++) == data->Bcmt[0]) && c != '\0')
+ 		ParseComment(data);
+diff --git a/src/parse.c b/src/parse.c
+index cd923f9..268954d 100644
+--- a/src/parse.c
++++ b/src/parse.c
+@@ -216,7 +216,9 @@ xpmParseColors(
+ 
+     if (!data->format) {		/* XPM 2 or 3 */
+ 	for (a = 0, color = colorTable; a < ncolors; a++, color++) {
+-	    xpmNextString(data);	/* skip the line */
++	    ErrorStatus = xpmNextString(data);         /* skip the line */
++	    if (ErrorStatus != XpmSuccess)
++		goto error;
+ 
+ 	    /*
+ 	     * read pixel value
+@@ -314,7 +316,9 @@ xpmParseColors(
+ 	/* get to the beginning of the first string */
+ 	data->Bos = '"';
+ 	data->Eos = '\0';
+-	xpmNextString(data);
++	ErrorStatus = xpmNextString(data);
++	if (ErrorStatus != XpmSuccess)
++	    goto error;
+ 	data->Eos = '"';
+ 	for (a = 0, color = colorTable; a < ncolors; a++, color++) {
+ 
+@@ -354,7 +358,9 @@ xpmParseColors(
+ 	    /*
+ 	     * read color values
+ 	     */
+-	    xpmNextString(data);	/* get to the next string */
++	    ErrorStatus = xpmNextString(data);	/* get to the next string */
++	    if (ErrorStatus != XpmSuccess)
++		goto error;
+ 	    *curbuf = '\0';		/* init curbuf */
+ 	    while ((l = xpmNextWord(data, buf, BUFSIZ))) {
+ 		if (*curbuf != '\0') {
+@@ -378,8 +384,11 @@ xpmParseColors(
+ 	    memcpy(s, curbuf, len);
+ 	    color->c_color = s;
+ 	    *curbuf = '\0';		/* reset curbuf */
+-	    if (a < ncolors - 1)	/* can we trust ncolors -> leave data's bounds */
+-		xpmNextString(data);	/* get to the next string */
++	    if (a < ncolors - 1) {	/* can we trust ncolors -> leave data's bounds */
++		ErrorStatus = xpmNextString(data);	/* get to the next string */
++		if (ErrorStatus != XpmSuccess)
++		    goto error;
++	    }
+ 	}
+     }
+     *colorTablePtr = colorTable;
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
index 8e15ecc0d4..9d1dd47742 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
@@ -22,6 +22,7 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
+SRC_URI += " file://0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch"
 SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
 
 BBCLASSEXTEND = "native"

