Return-Path: <enoch.ng@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9EBC43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 18:55:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3272.1783968936289990682
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 11:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WMEs/ZeU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=16547ba2f9=enoch.ng@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF82v34012412
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 11:55:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=R+WUv816m
	RQL0fvUjF8FsMHIQxtevEZm6FHuwUN/+28=; b=WMEs/ZeU+Pb/Qfel+SY98AapD
	jOqUCvK2SK/J3BThL9OWgMpJGIEqL8yzTA3EgesKsPPY6tU35MsQKELO2x7g826D
	Mw+e/WvgyWImE+MEmMjPlWn0ineYVTl8G9Q4o1qmE+FJMvnwQe/igHsOv5dRSxq4
	W5vS3FMtqK6GxNfzCT7eMrrQeNOGy7j2wX8Yc+WKo337v5L0/tk8pfmOp8ukvt8f
	aKOJhhgve3u92TGGHBthwQom4FHrvRvswJXD9+oEk1rmBhsg87qV6UjWzwUn5zTa
	CLX/cjmirn/SKN2Fhihzh7EpPAXAs98V+EWM2Ghh4LXmRaZTKQf3Cl06klITQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbh40ts1h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 11:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1aAF4xtpNqnx14rpz2JYJRNQTWLqDBXPG2xtwuVtpqddVCoJ7v4zoHhGK2qDw4q+XvclabfZh14/ULjngCe3xfSfwh+k/lLVS3/GzVh96I8bgB1KK78LZSkR5IniFRJRJoJ6HWHNZHdBTSj2/N2cCu97FMDa9fn3uOuSfXaU6s0WYBqbw7RofkOhl5f2xUQRYdUx/1lp2FE2VMsYAfKt3jcdXtmwTLNj+oCC1pyDwzS0NS4U5cYXWQvznh6VxF3IFYJ/VeoTrP4N8JaW2v31ps7gSsMqK1jcJHkg2nmSLNynTrRcQ9bX4hfi8znUUSWlsaCvoTk9jZSH81Iz7diTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+WUv816mRQL0fvUjF8FsMHIQxtevEZm6FHuwUN/+28=;
 b=biRKHV2NO28t1OHpLfK4hSg2FAm3Qu0ewjQq6BOfZK1f07KpUI1euLwFgXTOJZtClyhY8XmTCN4nWDCqFU67oUsj2R0TRnJ+nTgNexqXHdR6cEIgod8eUj5GJIZ9HX+h95le7EqYOvxcTI1oS83m72mbDLqomebvxREU5NazoY9+rlxUQWVmL5jx5dDF6Uj921x3jSYBu+Bgm3bQGfxiiJbjggDVhQNs4HYMhU5SUCSukmmle+s8VR2gbaXpRiz+f5S1oK77rk8IVYxw41KwsCwRLCok5w9AZJUFh3dSA5R7kRP0DuSBXF0CBWWVg3LCG4STS8/g9EY5rpsOolyilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.19; Mon, 13 Jul
 2026 18:55:27 +0000
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e]) by DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::3dc1:8afd:aab9:763e%3]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 18:55:27 +0000
From: Enoch Ng <enoch.ng@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: enoch.ng@windriver.com
Subject: [OE-core][PATCH] libxpm: add ptest support
Date: Mon, 13 Jul 2026 13:54:31 -0500
Message-ID: <20260713185431.846849-1-enoch.ng@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To DS4PPF10012BF96.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF10012BF96:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: f34040c0-82b6-4cd8-27ed-08dee1104d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|23010399003|52116014|376014|1800799024|56012099006|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	xG3lQH5AICIEN/X2bD67W7F8vh3HgPVSvqgPXfbB8v6MwJ8nsFrXfXfk2NIwnj0oR8PXVUaCPDJMfSztZesOcInzH+aXuSgrDmZrNLJsEaLZ7GdntS2aK3LO4iapulsGT/PSMsgWe8xRAGe8JjFaoBIjKxk60KleJYlCnF8DON9wL35ODQ3HAUPmBXfcYncchI24WBFtD7ghobHdXE1m3D712P/jlygyBUHW1b4QA356narvB4WvZqxQ4UIjIUep5q3ADs0/dlNj48u3zCXYnLHoYHJ83r6D48+tFY6rgeJK0VGPqNLT6tetHGmSQE3Z2KZhu1heADawuQsQOj9oqOlvsUeUGv9HnUUChFltCThHspRZb3yBzsGON6uoTdMBtyowIePjF5xtjP/9V2Yqgan91UC58I0Q9i5R6LHw94ghgHhBQDkMi/dyVyuVmE+aumr/HOtamDumSkyK6N8spDBOwPlK0yuyzqoUPK+cW1ygLDW4FLfCVIt7gNIPJm25P5qNYBhLu9Mpux/7LJEj5QyHSA6yzR33fRlKN18otUXLNR3TJWm7lgKpQ7XbksO7EUjJ6KtFkRFZPWdT1o/4c+InEaEfvipIt13UcCn4Iu5e3o2KUZkeFeGjwYsjl17VdTtBdPyWFj7YGtEO2OX9Aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF10012BF96.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(52116014)(376014)(1800799024)(56012099006)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w9+ctgohcrZuHZWOWP8+hTll3ClkmuFVftVqLAiDT/56oiNAwqgiOFQw0ENw?=
 =?us-ascii?Q?azNkgvmy1J1iCp0SovWV0zZa6cKzQLL2EdUbM6T2LQWnskEthO7vva6E3/iZ?=
 =?us-ascii?Q?Lg4kSlwIGLagHvxnUEzoY1fCl5HdaJFmuKeOuTjy/v+PAxEwQZKzvnfdM+9y?=
 =?us-ascii?Q?bC9C4PlBXotHAX6e8YA3TeC0Egv8DRlpXe3Vec5wQLFdn2LVONzv6U8UoAQX?=
 =?us-ascii?Q?3ms3OwEs80drflMciQJHsg7QfCRorTUzpEn0uSjwwqKPG0n2vk2PJ9RhhKqb?=
 =?us-ascii?Q?er9BZRKVl5n0wEMXougje25uFW4JmHlm7C34ohxmbwfCqh/b7SMgQyMbcM2T?=
 =?us-ascii?Q?edVBGtz3luJl2Ic+6YEnPhNp0dytWdbmPvM9Wha7tbCunKxSutCE2kzPQCyb?=
 =?us-ascii?Q?H7PY+/ycCDYMVG/62+10TviNTxFJoR+qQWbg9Mre084YYhJKLJ4nVXYG2Sba?=
 =?us-ascii?Q?AKcZXwklee/OkdTCH8t4I9BZ/QEvMALJc3kFqaQcYRkM0LwK7lH3Kd55ghnw?=
 =?us-ascii?Q?TA827UVNcshM4S5gn9dRm5+cylBmSZYp/17muhEZnJRKGh4FSlNh4n2PTMJl?=
 =?us-ascii?Q?A+sLd+ZsGkn8avl23xvziv76FQ4TBKTGjja+9DjMihyJco7LEBpjCq5Vrrjd?=
 =?us-ascii?Q?7ObxTBo11jgLrmUIIMTuH7Mx3pEgEd0gPDDztmK8qAFj4iir4t60Fuqp/ReH?=
 =?us-ascii?Q?4eu6grgCtM98P7fyFmXKRh2XBFBK0fwy8VSPAdRL7nJajeII4uDUltD73+4k?=
 =?us-ascii?Q?ic3GQGpMiO09IcV2l/Tcr0UG62mHWnCVI5PU1WqiqloYfdue2/fP9j6wGbjH?=
 =?us-ascii?Q?KL+ToLCkH6oKx/v8TNaq7w5sYpQvjevABUalsNuXyp+u4VGtgi1G05nsDlhB?=
 =?us-ascii?Q?p0CQQWVklHAjTR9h+cGs/nGB9d1KKsUj2XMnQSJzubGy0W+6lBvXNfqKB3yI?=
 =?us-ascii?Q?JXfngKlqkz5E57Cl5hdUpIXXG3Pq9Nbd4TIQsXOgTVw4PMWnL2AfcRbcEl/q?=
 =?us-ascii?Q?Nc5bG5h5a6qdvhWnL6HjEi9GJb4XcHrGjHLvYhMESzmI7YIIKcDJxM/VnD96?=
 =?us-ascii?Q?wa01B5dvW/1dQnNJqeIt/tMQt8HoE9AM3E42/725bbooluSIiftGrfnx2x2Y?=
 =?us-ascii?Q?gmumrkTC1rVfD4HS2JDtyV8LEo/OSWfK+jGw5G5Wn/Z/RkEialq/VjpCaEbG?=
 =?us-ascii?Q?GBhi3x4W6qKlbssTnx0gZ5n1i4YqKjLatJWStJWAkN7TjzHNGP3P/z5z61YV?=
 =?us-ascii?Q?g4QVsNGPn3LoV2FMtvTOkbjqv+p7kU3uxEi9cP1y1B8b9daLzK37vh403pEi?=
 =?us-ascii?Q?Vu4yB2LfIOg1rgRbpL7gDvgY98NBMxv9/mFDOtIqC01wYMDMHVEP7LgC6sRI?=
 =?us-ascii?Q?65TIOXwdTbie6aFhdL1pu30M1b0NxrO9IpONjnk3Z2diKQk1N6jVzTq7Dokh?=
 =?us-ascii?Q?jzKktV8D9K901xbuyuy2VC09LawNlAP3fFPsbCS9U/xctZMIKcMl1FRHzqh/?=
 =?us-ascii?Q?lSNa0Ij/S0RCn/U1kmAfIHrf0qt8+rQ1/5lROZTybjs79MPeAOr999X1i71J?=
 =?us-ascii?Q?RBf15jG74S5/76AH2RF2Y2XNpPrGRu/2sjd1nLD9qgP1S49FPSFPSS3boO7o?=
 =?us-ascii?Q?0vchWxnnTN4xkKCJghKJX3uXNHjYUM/oNxno4DKIIiRt7rdk78AeRqXQ9SbA?=
 =?us-ascii?Q?W1xCp7Se11cYjvljT8L8NTfccbKnDKNt6KoIBhdiADk0jgFj7pPPNHLjG154?=
 =?us-ascii?Q?LOAd7r0n0O4rTVERAWdnnEWWRXUOmK3ILFcxFkVNtsHk+OP23LTqTUowbrk4?=
X-MS-Exchange-AntiSpam-MessageData-1: CmbksfDje9OFsg==
X-Exchange-RoutingPolicyChecked: 
	FCPLvImRV0hRwXcAu9kqXNVJxvLjTbjSL4tYJZdwsFlgOIyUA3NmJyY+otKuP1fF6ewE4vYvlJPQ7MOwr7+5Tc2GAEJWonVBG+7kX16X+rLDv2YQz8XndAjGiTJLDhaltLeYdFZBx1Rmw5WtNibTwgW6wG0BpBxV49VCxELg72q/pxPDxseYoA6J+HvSkoLe9oslyduYKZy08jhF8g4reU15bycdYB1Iz85YPT8uLziX2hpl3DhxZ3p8aSHDLNp3XS1d2kNVSqLq0cZOoLBFO1lHA9GHQD5MoYMCHNXhykl0lN7tv2z2fpn7iV9mbWU2KU+/rXS3AtrnMDF40QuK/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34040c0-82b6-4cd8-27ed-08dee1104d6f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF10012BF96.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:55:26.9907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTXKbj6uH9shmLHi5MtaLlmMEQInoxnESqgs2VwkZKeQzLe3bZYw0PivtJXX6PILvEjYz7Wq0hMGiAR2HsVrzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE5NiBTYWx0ZWRfX9x1SFY11FC3+
 x53d8Kf6IYIUfFECVtc2jYX/2G5xdEFMtRo8zoVciHo+IEiVmxygRu0Mv/lL1poOfMKjtCSUPBO
 oNWS2QWxCXfEuDOxS3LtuzXsilMZO5wZxVZXR2IqrErTTXo+I01A+/HRTWQjWL3v0SdTg4HI52U
 knL6d91Y5MRDD0y62lCmPbP/yJAVA2OHH9JG6LN0ZIIoDClr2nuG+l9rqQX3hekej/7NOtxFfe5
 GcYm2k7KuyviA7aZBeFJwkGDjn0NaOndUVC+3K4iZDdBKn7qqGEKXY86YGdabZkKmbpeX0Xpcp1
 KAuEYJu9BLaAmJqi2q+U2wsHckxp9/Xy/CMnjZxSL4dcSZBHRvMoJpwJKCWPK9+V1z4XEYfZsWR
 FJlSRjk0vGUUmZ9V/odykP6YvTDfmgFJT7QWevNFiWiZDLuSSgzLOZ//aImSZG2FpaMIoN/pldD
 jHKCmCiXpD0eYhNH4fg==
X-Proofpoint-ORIG-GUID: acGgMMDvIAN0G5PUpt5GJKQSnh3e2UxF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE5NiBTYWx0ZWRfXzuQiy7Ql7pPF
 hFNIUiQeX4cCxxTISUr3j85OyUSw1uPDkdOUHmBgTjAZ03uCohGeQxaUIBa3SD6x8CcETlaeIy/
 eRtYcXAJXi0hCPAjiN/k62F/AeVJM+rzuOZeW1pmUlL0vHAL7yVR
X-Authority-Analysis: v=2.4 cv=JbGMa0KV c=1 sm=1 tr=0 ts=6a5534a7 cx=c_pps
 a=PQms4psfS+nBHIg3Mxsk7g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=_xIB2HhVOpyfK1cshtgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: acGgMMDvIAN0G5PUpt5GJKQSnh3e2UxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130196
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 18:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240853

Add ptest support by wrapping existing tests for libxpm.

The tests use GLib for various checks:
* Read and parse input files
* Write images, read them back, and compare the results
* Parse RGB color names and check for the correct values

As such, add glib-2.0 as a build dependency (only if ptest is
enabled).

Also add libxpm to ptest-packagelists.inc. Test execution takes
<3s on my machine, so add it to PTESTS_FAST.

[YOCTO #16330]

Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../xorg-lib/libxpm/run-ptest                 | 48 +++++++++++++++++++
 .../xorg-lib/libxpm_3.5.19.bb                 | 22 ++++++++-
 3 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxpm/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 2badb56c48..08bf8e48ee 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -58,6 +58,7 @@ PTESTS_FAST = "\
     libxml-simple-perl \
     libxml2 \
     libxmlb \
+    libxpm \
     libxslt \
     libyaml \
     logrotate \
diff --git a/meta/recipes-graphics/xorg-lib/libxpm/run-ptest b/meta/recipes-graphics/xorg-lib/libxpm/run-ptest
new file mode 100644
index 0000000000..0ba4e788d3
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxpm/run-ptest
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+TESTS="XpmCreate XpmMisc XpmRead XpmWrite rgb"
+
+for test in $TESTS; do
+    if [ ! -x "./$test" ]; then
+        echo "SKIP: $test"
+        continue
+    fi
+
+    ./"$test" | \
+    while IFS= read -r line; do
+        case "$line" in
+            "ok "*)
+                # output: "ok <num> <path>" or "ok <num> # SKIP <reason>"
+                tmp="${line#ok }"
+                testname="${tmp#* }"
+                case "$line" in
+                    *"# SKIP"*)
+                        testname="${testname%% \# SKIP*}"
+                        echo "SKIP: ${test}/${testname}"
+                        ;;
+                    *)
+                        echo "PASS: ${test}/${testname}"
+                        ;;
+                esac
+                ;;
+            "not ok "*)
+                # output: "not ok <num> <testpath>"
+                tmp="${line#not ok }"
+                testname="${tmp#* }"
+                case "$line" in
+                    *"# SKIP"*)
+                        testname="${testname%% \# SKIP*}"
+                        echo "SKIP: ${test}/${testname}"
+                        ;;
+                    *"# TODO"*)
+                        testname="${testname%% \# TODO*}"
+                        echo "FAIL: ${test}/${testname}"
+                        ;;
+                    *)
+                        echo "FAIL: ${test}/${testname}"
+                        ;;
+                esac
+                ;;
+        esac
+    done
+done
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
index 32e052fd42..9ba96b39a0 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
@@ -1,7 +1,7 @@
 require xorg-lib-common.inc
 
 # libxpm requires xgettext to build
-inherit gettext
+inherit gettext ptest
 
 SUMMARY = "Xpm: X Pixmap extension library"
 
@@ -13,15 +13,35 @@ protocol."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=903942ebc9d807dfb68540f40bae5aff"
 DEPENDS += "libxext libsm libxt gettext-native"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'glib-2.0', '', d)}"
 PE = "1"
 
 XORG_PN = "libXpm"
 EXTRA_OECONF += "--disable-open-zfile"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '--enable-unit-tests', '--disable-unit-tests', d)}"
 
 PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
+SRC_URI += " file://run-ptest"
+
 SRC_URI[sha256sum] = "ad3576d689221a39dc728f0e0dc02ca7bb6a0d724c9a77fd1bfa1e9af83be900"
 
+TEST_TARGETS = "XpmCreate XpmMisc XpmRead XpmWrite rgb"
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/test ${TEST_TARGETS}
+}
+
+do_install_ptest() {
+    for test_bin in ${TEST_TARGETS}; do
+        ${B}/libtool --mode=install install ${B}/test/${test_bin} ${D}${PTEST_PATH}/
+    done
+
+    cp -r ${S}/test/pixmaps ${D}${PTEST_PATH}/
+
+    install -m 0644 ${S}/test/rgb.txt ${D}${PTEST_PATH}/
+}
+
 BBCLASSEXTEND = "native"

