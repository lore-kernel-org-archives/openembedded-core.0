Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FE6CD3447
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:32:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1593.1778175162044508643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 10:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l00+7aSo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9587ffd4f1=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475KrIZ3269026
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 10:32:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8Zo8l49Wkz6aqvkaMDhG7uF0bEH69ZonJdFV8FcbhUU=; b=
	l00+7aSoczOKB66jhp4LUYBFZGcMGOXMLt5gOdYt14AIPdiB2/iqrKzr1G2SWbmC
	OS8KIs/0W5Fqir+M+FqI+q75/tg5iDNRqFMfcekKy2l60nL1DVu5o9CRIxRQXTks
	on7BFYm4oWGsYxo3j7AgGzcOwhPVF1KRkNv54NCiRLjdkY9nL0mdqt5zZ91kf93g
	i0sRDI6fqtpzZyKaikOFHhtP9LXWwaognUR+yXvKIWNq1PAHbc4+bcM7nR3C7gmN
	H7LIs1Q4nwcDP6bJMlr7Vad+gy1ZrVpu2CqsPbU3+0CjFS/zZEnfHHY7GKTtzOhG
	1wuGoCrBXCWql1fMX25ETw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010040.outbound.protection.outlook.com [52.101.193.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchyxpea-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 10:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XI02WrDsHZWt2oAV3/PqbdL2ktEtT19Ok1B6vMhtetAD00zAxTCCI2FQdfY7ZCBLNGGWaBZPINj3RC90YNWfziM7LyjLE/WViLV/v3LTfyL4nsBkF2+r/ql28A5tk9cN61Tsuy8fAJ+hVawZLQDEN4vCXv3SkLFqXYQYC0nUidmYTpwFCeaAzN3WUtTgiWVFxQEU69g1lVPG6LeDwYXgjg1aPctlt1L0qEaOOq4YOEgUzSlKYezq2PQ0XHUwGM7ZSzM1yJmyB3hOvsgjA4xXHOEWEQH97o8uIEmO6/D9KL9STam+17pP0gvbFK/pN+vRZcHEdvMaVrSnie39jhR0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Zo8l49Wkz6aqvkaMDhG7uF0bEH69ZonJdFV8FcbhUU=;
 b=eBj4pSEk3IxxD9H4hnOLM0uJ4M+ffZQq3iN+ZL6CRXdekv9agKlHj1gAuYEIu1/6UrMRjgFpvS8W/8xsPFzOd/m0adL//dheVJmD6t/xezRQits1Fbj6UxpdEXjntZF0cgnEKa8ix8h8sCj822slup/pROPbZYlivKhZJPy4tQPD4RAWjFFuqTJEilx8DF6wCxXiqPcHp9GnDRgjuMB5brqTUjDSVwKjjbBXabk124RVt15EhFKsFI0POSnUUq5Pzrwk9DpY/SlPnun5sTj+98OdHdwwBr1Lqw8xNxRrwsShSZKUSiww+4q3Ki52m7WnMVVIPQ6Y3Coyx2xLaoNoOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DSVPR11MB9556.namprd11.prod.outlook.com (2603:10b6:8:389::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Thu, 7 May 2026 17:32:37 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9891.019; Thu, 7 May 2026
 17:32:37 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        khem.raj@gmail.com
Subject: [PATCH 4/7] gcc: Upgrade GCC to 16.1 release
Date: Thu,  7 May 2026 10:32:08 -0700
Message-ID: <20260507173211.672855-5-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
References: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0462.namprd03.prod.outlook.com
 (2603:10b6:408:139::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DSVPR11MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad305c4-f419-456a-e707-08deac5ea1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|56012099003|18002099003|12006099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	kxBxR5ABe8/NhEJJ3FoOgQgsauXdkBA+A50n5ouElTfNJGDKj4XDFYVt0RPR+jSNzAl9lAjNmSqym9Un3KXYQul8jHmsdADPQPh7RGp2if86qUcfuAr1nMRhjmCRBCi3SXxlMVaPZvOMWA/Ty7Nni3uMCS5g+vZv6jVPEchk5Kz4V0wkdYi8fKjog5MLam4W1alvPmF0MqsD17rrJaTmhErfXcQqagFnuFomxG3BXGQ38MtaooKKRYHa0QXax+PxLol6lZ0/zqewWtzOt8LpIKrZn3YrPL02MZVRRcDaNAMCPAzjuQNV1iRaCZTPJUoGrPchH818l2FVwN3sK1KdHmUt0lrqCZ7YxgPtAenalyOnz8Qq81L+/WKDnWYgAZy0mydKsHf02y/4UZ4GmQbFZzeo3y3h3AIlLkTGn1992aPsN4cSPLanahmr3p2sLl5x45iXQHoNM9adnwFREO+KnKoMKUpAPTv7XjcB0meYhpqaNvGvZ1QR1L7lU/hfX0QSBswTsfU4ao425a66FGaESB+StWiCupKY3ioPSFDrjwfRGTHSsYo5jUGT5lB93J3ZnyrOKEWNp5Mzj3UnSj+0h9U+1y4TUBCASvLOVNygkU3hGPOkTp3xicruEtcaX1WB9MprIz+4KsUbQ+hdvCWBgUnnC/5Z3RNiN+VaPsEwCGXOnHnKnMTeW8Bq9/wnAYsiAqvd0pcGKPtu/U7VVOIwx9lVMUqodAjGO+P2ac4s+YcixhIQ8Qhw1GpoaN3+e9gZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(12006099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?teNRVK2uV96i+HH+OiwO0BqhBkZQybLpMzNA1PNSf5Ox0HUO4Xjgx4pbuoNE?=
 =?us-ascii?Q?jawj9jOVIdKsB93GuNd9bvnaMrpDd7UdFmyexyGQPiHXZbghQR4vAHPhe7Zg?=
 =?us-ascii?Q?yPvlRSsT3NA7DvIwpkEvBLCnUiLlYcQuJqlZL/JsiEXLFxb6BfV1IIG2SRYd?=
 =?us-ascii?Q?ZyDdVUBxswbpYuHWlZtVLasAGG++oyZnEPgNRRNhe6iL47j3miRCbXcE/hjW?=
 =?us-ascii?Q?hHHBbOhaZ4rIe7z4Ue6lwXdgNBB1qYEPOhivnc2CkFYdXF0wsVlmuC5krWGL?=
 =?us-ascii?Q?fn0F5TVQ+dkQlnSnrTs4YVDALQKbZp4WdJC50YwvStVKFEiP+zQQYPSwm+TE?=
 =?us-ascii?Q?W4MUpqodCmuI1+2u/G1z+FRKPlsvRZEAZy5rtxlfrnUh+xv0ZSWsKql5hZXL?=
 =?us-ascii?Q?cKPNNFJwImcKtJZr6uJqza/ADuzSLe0cl4jtlWGrhIgG2o6QbmIfC6qzAyy5?=
 =?us-ascii?Q?l1m0zN79UugeIKb5W+63CeMhz6tL7DOWRQfFjc3jwFXuZ9ePDHltKPLKp+rT?=
 =?us-ascii?Q?COoXFZ0olXo4Luuc50B5NWC8pnLgZsk1AlRfhu0rV2XXV73+Lfc31CY+AIVj?=
 =?us-ascii?Q?+yFNftF3R7XS4Nubfu7MMSEeR4KZ1+4/PQoBqiXzkfD8+pknP/jV3i+jsj0y?=
 =?us-ascii?Q?ktB2NBEvHaLVXq/D3mqDNYxr9N9cIFOOBRAUdDoTV+iEeTg4LvexiAh0TzSO?=
 =?us-ascii?Q?BIWf35snJGP7wFoOZceDxvvqw3+ky2U4kraM4Q7j834RvEMi5yq4iNUj/pu6?=
 =?us-ascii?Q?mz+ZbH8+ak8s0b8hXtEzmB6rBrl5MrzRhP/3iYoW+SwrTmpEjCMLy+TiG43w?=
 =?us-ascii?Q?OZkXQ7a/uCL2732Vt85wVJ8K70+9kuvm61nJc8Ms3IhRyQNMMg+DuWlY4t8d?=
 =?us-ascii?Q?WmRyBBke5U8lEYhgL3k3ntnde4CBObzDGxORTSeDgHlByD2s7Cx9DsLKOQyQ?=
 =?us-ascii?Q?f2F4gbeIfFc57bERvmAIUuzIb/+3yolcwx4TmT0vgbsQm1ZV8Cp5cNzgkO+U?=
 =?us-ascii?Q?PZwRulqOV85Z0x7lPVQz0K21znGHMAGPdkkvVlevEEATZ9v/9q4c84odtWd1?=
 =?us-ascii?Q?UmCdFt0XtWibLK8JJ1QV7ejvLA2krP6N0GgV/AGEnxoxXijBU9fgonIdTpvP?=
 =?us-ascii?Q?IFAExHIqRdYqCJqELzDpRCBch5K/O818sVE45ZKdWhokMM5RndAw/VeW7nn6?=
 =?us-ascii?Q?b1t///Q+jPviQrQ5NUZBzfw/1kIK+b0LCYgcYpHerwnHlAtTXRu5GlYdFjSn?=
 =?us-ascii?Q?4emmtXw7rNOLJoXw1U8i3MBU3nWxRbgWamDolmHblyz+ysQLOZmQ6uNLA0D7?=
 =?us-ascii?Q?NtoTwNHFOH5fLCRORSbrY12mzRfYpqBqjPhnNKj3ixCCTbZqCAN/6myQk08c?=
 =?us-ascii?Q?9GtpTj7luCvseidDsqEY1cCHecvahnlNhpDqxTO8zx+RfPPRloHauolxZG+Q?=
 =?us-ascii?Q?n3DNBTdz3MsdHsffZd9iKu/6EQAShBVyyj/2I1qhadW3eBV22vU2fg+3UTQP?=
 =?us-ascii?Q?H+zXxmScT9YT7bbuVb2RREc2xyEb8+Ux3PXhq51MIygQtHwpuQKXAaMFHn4P?=
 =?us-ascii?Q?MDrfHLOdX/rMuPTrWxVYNjUUlDdHvr+sRfcmbaDXCzYk7efUG2NYvtZJO0nw?=
 =?us-ascii?Q?+7wopCgxaMw9lUhyImV07hWjFMMopVf6mXAX/odbh+HkRkQc82IvDhHOIRlW?=
 =?us-ascii?Q?xfnj+EUcGpNpwwfOJpml1hqQRlksRmgmoBlNvUHY78yF88RuOqBkBzh+puOM?=
 =?us-ascii?Q?x/Eq1e8w61Lh8PZm1wzLgTCkuFwSeMQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	kKEU8A65I2Y6tObEDkeBJIr3dxmug0XG0NFSj8WWZy3ePhRK3ibLCSyNhAJMTRWVjqxAaZMpCWVR5x4Iw8LjxqCnheV1CYLDqGN9Rngiv5a9xezvHFrvCdVNmG/ZM+ZVg9y5UkDYTknDWreGq4e11aE9lQqV8sXG/dsMZgoFvawMNqLFRaf6Xb9ZwaxkkaZbLqVQmC01Z+v7KmIPwq8CfpZYGZERGjsYoujiaXy+nkYlUmOXMykjMLQhoWbr5UHNTcnK+qmjDa6pA6k+McpxPqTHNHdBZXsb92jZLh2b8rRhW9rdBMn0lp3bauwHVo4zPcuICjlRivl0ZzqN9+x5kQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad305c4-f419-456a-e707-08deac5ea1d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:32:37.6701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFp+eR9kGCCxX1NO/AaZNVzWV10VGvAZrKNNGslN3zgj4emLN1VtUaFThc1rjQgfmlOrqXxpmGbQ/MVWEuXGYlgxjps8yuk76+X4UurNnBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9556
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3NyBTYWx0ZWRfX825Etm2xVOgJ
 7eo/31gb/oIufPgQdNt0cvcncOqXZkZzRkz0FkBeDZp2Jkz00RxsCi9YSUNXCnhdbXF8aKhiy11
 ikEObALCYi0Wjfi8ljfMZjvLl8/G+aJx+AjGO3c5k1qR7PMatAxOzl47LjooJaey1N3c3D+gWOd
 KqUCp5TNLO1g+qrp1aBJpA7KW8ww7euVwnRobwImfaJJWT4Tf/yjY18KcnuwG3kjx3bl+X3tX2z
 FhBDHdB+mZQuqgrv7oapCRJhjKwfZtpIckUGvImjtTIbXXvi5MBfIBAGZbFsAKN5O1XjxHttAG5
 CaAXkyjtOPjk0JojT2kUpaHePYawFiAkyqudW7mftrqQoVHEIFAraXJx6lxoDZiQwwUILtI0sNZ
 9cyyghcGW9xEpSh3BFcr20fItTVSvoj8eyWmMKOT6jMNTluNIxBh04RcYZEUXl8+aoIGHRZQfP3
 1OInbPb/K2g4JJk4bQQ==
X-Proofpoint-ORIG-GUID: yKOoditDdpcJVFmN_vFX10-yokCoSR3J
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69fcccb9 cx=c_pps
 a=2d9FbaPwie0YXhWIRYJR4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=uCaEEmbJTeulPlxkI8cA:9 a=b05lPj1fihGE9SP1:21 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: uJRzaFvW-YWXs8hP5kjpEelwOszzDZfx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 17:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236611

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Notable changes in GCC 16 include:
- Improved C23/C++23 support and initial C++26 features
- Enhanced diagnostics and static analyzer improvements
- Optimizer and code generation enhancements
- Target-specific updates for AArch64, RISC-V, x86, and others
- Runtime library updates (libstdc++, libatomic, libgomp, libsanitizer)
- Multiple bug fixes and performance improvements

* Rebased existing OE-Core patches for GCC 16.1 and dropped
patches merged upstream.

For detailed info: https://gcc.gnu.org/gcc-16/changes.html

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../gcc/{gcc-15.2.inc => gcc-16.1.inc}        | 17 ++--
 ...ian_15.2.bb => gcc-cross-canadian_16.1.bb} |  0
 .../{gcc-cross_15.2.bb => gcc-cross_16.1.bb}  |  0
 ...-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} |  0
 ...cc-runtime_15.2.bb => gcc-runtime_16.1.bb} |  0
 ...itizers_15.2.bb => gcc-sanitizers_16.1.bb} |  0
 ...{gcc-source_15.2.bb => gcc-source_16.1.bb} |  0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  2 +-
 ...sroot-gcc-version-specific-dirs-with.patch |  4 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch | 18 ++---
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch | 78 +++++++++++--------
 .../gcc/{gcc_15.2.bb => gcc_16.1.bb}          |  0
 ...initial_15.2.bb => libgcc-initial_16.1.bb} |  0
 .../gcc/{libgcc_15.2.bb => libgcc_16.1.bb}    |  0
 ...ibgfortran_15.2.bb => libgfortran_16.1.bb} |  0
 17 files changed, 66 insertions(+), 57 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-16.1.inc} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_16.1.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f98305e930..768017eaa2 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -200,7 +200,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-15.2.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-16.1.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcompat = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d2dd5abc03..804b32c1dc 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?= "binutils-crosssdk-${SDK_
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "15.%"
+GCCVERSION ?= "16.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.43%"
 RUSTVERSION ?= "1.94.1%"
diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-16.1.inc
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-15.2.inc
rename to meta/recipes-devtools/gcc/gcc-16.1.inc
index a96f2b8411..3a96228631 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "15.2.0"
+PV = "16.1.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "15.2.0"
+BINV = "16.1.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -34,17 +34,17 @@ LIC_FILES_CHKSUM = "\
 #SRC_URI[sha256sum] = "41bf7be5dc029112a9df625266e7de030ffc36ff3638f270b180ae8c91fe6449"
 
 # from snapshot
-#RELEASE ?= "15-20250420"
-#RELEASE ?= "15.1.0-RC-20250418"
+#RELEASE ?= "16-20260502"
+#RELEASE ?= "16.1.0-RC-20260424"
 #BASEURI ?= "https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
 #SOURCEDIR ?= "gcc-${RELEASE}"
-#SRC_URI[sha256sum] = "fe18624317c6c662977eea8b5a506ec6c132fc11c7a8d53e2f6d21b139b0af3c"
+#SRC_URI[sha256sum] = "e8edc2aaf0affce7020658b0be9a3fc820aa33dc610640d3fe1ba1aee360051b"
 
 # official release
 RELEASE ?= "${PV}"
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SOURCEDIR ?= "gcc-${PV}"
-SRC_URI[sha256sum] = "438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e"
+SRC_URI[sha256sum] = "50efb4d94c3397aff3b0d61a5abd748b4dd31d9d3f2ab7be05b171d36a510f79"
 
 SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -72,11 +72,6 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-           file://0026-fix-pr90579-testcases.patch \
-           file://0027-gcc15-pr122394.patch \
-           file://0028-fix-gcc-libitm-false-postives-01.patch \
-           file://0028-fix-gcc-libitm-false-postives-02.patch \
-           file://0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_15.2.bb b/meta/recipes-devtools/gcc/gcc-source_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_16.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 621f8bc41f..07e9e23f3d 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -172,7 +172,7 @@ index fbc75a90ad5..38c239940bd 100644
 +  SYSTEMLIBS_DIR "ld-linux-loongarch-" ABI_SPEC ".so.1"
  
  #define MUSL_ABI_SPEC \
-   "%{mabi=lp64d:}" \
+   "%{mabi=ilp32d:}" \
 @@ -40,7 +40,7 @@ along with GCC; see the file COPYING3.  If not see
  
  #undef MUSL_DYNAMIC_LINKER
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index a087ba17d9..678457bbc9 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -89,12 +89,12 @@ index 007c91780f6..22eb17bc099 100644
 +	            {
 +		      memcpy (path + len, this_multi, this_multi_len + 1);
 +	              memcpy (path + len + this_multi_len, multi_suffix, suffix_len + 1);
-+	              ret = callback (path, callback_info);
++	              ret = callback (path);
 +	                if (ret)
 +		          break;
 +	            }
 +	        }
 +
  	      memcpy (path + len, multi_suffix, suffix_len + 1);
- 	      ret = callback (path, callback_info);
+ 	      ret = callback (path);
  	      if (ret)
diff --git a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
index 0f2a9d8c1f..5a8a79c0d2 100644
--- a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -29,14 +29,14 @@ index 0f1a7156084..255fe448e63 100644
  
  endif
 diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index 9798e7c09e9..3b3027eb77d 100644
+index 887ae41..b3d5e6f 100644
 --- a/libatomic/Makefile.in
 +++ b/libatomic/Makefile.in
-@@ -452,7 +452,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
- libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
- 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
- 	$(am__append_3) $(am__append_4)
--@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv8-a+lse
- @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
- @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
- @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16 -mcx16
+@@ -470,7 +470,6 @@ libatomic_la_LDFLAGS = $(libatomic_version_info) $(libatomic_version_script) \
+ @PARTIAL_VXWORKS_FALSE@	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) \
+ @PARTIAL_VXWORKS_FALSE@	$(am__append_2) $(am__append_3) \
+ @PARTIAL_VXWORKS_FALSE@	$(am__append_4) $(am__append_5)
+-@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -march=armv8-a+lse
+ @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
+ @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -march=i586
+ @ARCH_LOONGARCH_TRUE@@HAVE_IFUNC_TRUE@@PARTIAL_VXWORKS_FALSE@IFUNC_OPTIONS = -mlsx|-mscq
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
index fcdd79a840..dc708942b4 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
@@ -92,10 +92,10 @@ index 6dd8fa3fce9..95672008219 100644
  	"preprocess" {
  	    set compile_type "preprocess"
 diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
-index c0376b04551..5d053dfe726 100644
+index 55775d0..df161a9 100644
 --- a/gcc/testsuite/lib/target-supports.exp
 +++ b/gcc/testsuite/lib/target-supports.exp
-@@ -2949,14 +2949,7 @@ proc check_mips_loongson_mmi_hw_available { } {
+@@ -3113,14 +3113,7 @@ proc check_mips_loongson_mmi_hw_available { } {
  	if { !([istarget mips*-*-*]) } {
  	    expr 0
  	} else {
@@ -107,11 +107,11 @@ index c0376b04551..5d053dfe726 100644
 -		return 0;
 -	      }
 -	    } "-mloongson-mmi"
-+	    expr 0
++            expr 0
  	}
      }]
  }
-@@ -2970,29 +2963,7 @@ proc check_mips_msa_hw_available { } {
+@@ -3134,29 +3127,7 @@ proc check_mips_msa_hw_available { } {
      if { !([istarget mips*-*-*]) } {
        expr 0
      } else {
@@ -138,38 +138,41 @@ index c0376b04551..5d053dfe726 100644
 -	}
 -	#endif
 -      } "-mmsa"
-+      expr 0
++    expr 0
      }
    }]
  }
-@@ -10371,6 +10342,7 @@ proc is-effective-target-keyword { arg } {
+@@ -10740,6 +10711,7 @@ proc is-effective-target-keyword { arg } {
  
  proc et-dg-runtest { runtest testcases flags default-extra-flags } {
      global dg-do-what-default
-+    global do-what-limit
++    global do-what-limit 
      global EFFECTIVE_TARGETS
      global et_index
  
-@@ -10378,6 +10350,7 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+@@ -10747,16 +10719,19 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
  	foreach target $EFFECTIVE_TARGETS {
  	    set target_flags $flags
  	    set dg-do-what-default compile
-+            set do-what-limit link
- 	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
+-	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
++	    set do-what-limit link
++            set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
  	    if { [info procs add_options_for_${target}] != [list] } {
  		set target_flags [add_options_for_${target} "$flags"]
-@@ -10385,8 +10358,10 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+ 	    }
  	    if { [info procs check_effective_target_${target}_runtime]
  		 != [list] && [check_effective_target_${target}_runtime] } {
  		set dg-do-what-default run
-+		set do-what-limit run
++                set do-what-limit run
  	    }
  	    $runtest $testcases $target_flags ${default-extra-flags}
+-	    unset et_index
 +	    unset do-what-limit
++            unset et_index
  	}
      } else {
- 	set et_index 0
-@@ -12172,6 +12147,7 @@ proc check_effective_target_sigsetjmp {} {
+ 	$runtest $testcases $flags ${default-extra-flags}
+@@ -12539,6 +12514,7 @@ proc check_effective_target_sigsetjmp {} {
  proc check_vect_support_and_set_flags { } {
      global DEFAULT_VECTCFLAGS
      global dg-do-what-default
@@ -177,51 +180,62 @@ index c0376b04551..5d053dfe726 100644
      global EFFECTIVE_TARGETS
  
      if [istarget powerpc*-*-*] {
-@@ -12203,6 +12179,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -12570,14 +12546,16 @@ proc check_vect_support_and_set_flags { } {
  		set DEFAULT_VECTCFLAGS [linsert $DEFAULT_VECTCFLAGS 0 "-mcpu=970"]
  	    }
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif { [check_effective_target_x86] } {
  	lappend DEFAULT_VECTCFLAGS "-msse2"
-@@ -12210,6 +12187,7 @@ proc check_vect_support_and_set_flags { } {
+ 	if { [check_effective_target_sse2_runtime] } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++         set do-what-limit link	
++        }
      } elseif { [istarget mips*-*-*]
  	       && [check_effective_target_nomips16] } {
-@@ -12229,6 +12207,7 @@ proc check_vect_support_and_set_flags { } {
+ 	if { [check_effective_target_mpaired_single "-mpaired-single"] } {
+@@ -12596,7 +12574,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget alpha*-*-*] {
  	# Alpha's vectorization capabilities are extremely limited.
-@@ -12242,6 +12221,7 @@ proc check_vect_support_and_set_flags { } {
+ 	# It's more effort than its worth disabling all of the tests
+@@ -12609,7 +12588,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget ia64-*-*] {
  	set dg-do-what-default run
-@@ -12255,6 +12235,7 @@ proc check_vect_support_and_set_flags { } {
+     } elseif [is-effective-target arm_neon_ok] {
+@@ -12622,7 +12602,8 @@ proc check_vect_support_and_set_flags { } {
  	    set dg-do-what-default run
  	} else {
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget aarch64*-*-*] {
  	set dg-do-what-default run
-@@ -12279,6 +12260,7 @@ proc check_vect_support_and_set_flags { } {
+     } elseif [istarget s390*-*-*] {
+@@ -12646,7 +12627,8 @@ proc check_vect_support_and_set_flags { } {
  	} else {
  	    lappend DEFAULT_VECTCFLAGS "-march=z14" "-mzarch"
  	    set dg-do-what-default compile
-+        set do-what-limit link
- 	}
+-	}
++	 set do-what-limit link
++        }
      } elseif [istarget amdgcn-*-*] {
  	set dg-do-what-default run
+     } elseif [istarget riscv*-*-*] {
diff --git a/meta/recipes-devtools/gcc/gcc_15.2.bb b/meta/recipes-devtools/gcc/gcc_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_15.2.bb
rename to meta/recipes-devtools/gcc/gcc_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_15.2.bb b/meta/recipes-devtools/gcc/libgcc_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc_16.1.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_15.2.bb b/meta/recipes-devtools/gcc/libgfortran_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_15.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_16.1.bb
-- 
2.49.0


