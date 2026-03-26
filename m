Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA6210A3D88
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:22:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46101.1774527767831032738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pKwLVxcA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=754539287c=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q84olx2323617
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QsFY58Uel9zep5Cumo4V
	fwKB0CHWfi86N7j7In04zwc=; b=pKwLVxcAnuNJNUdZi0dQQfPxcylcycvYuHT+
	4qcz2UaSal6rpiUzsPdew886bLnqDqltljCR0SDgEO1w1Go5GSprRC6HTmyok/lB
	fzvnQcnJN9s/0fy43LIXiBq1TjR75wWltcPR/H7cchLkC6yQM0gaIIsSZx2PY9ln
	oG2zYD43s788R9FNdzrPcKTezf+kVAbFRyZsFgRiba9V2Y5tsNeqRP4Syo0vDi8W
	nkmYxu+zMyoSV6DznB/6m2/NWPO1r5XSZ/lZYnq/lSeZIsvVDLzPXGxefTudydUH
	fisCfo0rRanyKXpZ4zwFZrS7ZKqankFYhrArgjRqBZpfYKiCUQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj86gn0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:22:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9ew32YfHtYdFn6umeldvIBzU7BA6nuWWinfiS59WFHrv09grPm2A3E8ilkH1C39Av0dV28v0+IA9UrL/psotpwOnQLFG3Nc82pXxDFi951uH4UwHpWkbvXVPwUG/Bzo4i0FXUNKU2GMeRso9cyFQTQ53uyaQrZf+bf9yjsaOngahfGQIxa7uHr2zewcXQDm2stQ5GYmJXoN3aQ9mJWa3H0m5A/a51rdCXeKa6/5R/2bRjeteULhxP/M+Xpp+Oh76HDK98FaUfHZ7CWrm5foBip8IF7dl25ou3vTfyzAv6lk0boeq0baBGLr4VkNi64gr7Bp640hS51jElq6r2IJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsFY58Uel9zep5Cumo4VfwKB0CHWfi86N7j7In04zwc=;
 b=BHBFlz5qJROasoIJEc3r7oKjMRMCbyXDHLyrwGQyHmMgoTfnjHUo0olvitJrXDP2nwagByUNumW3cMtjQa0vOMLdbvfmRocYlfm1lsUkXuBq1FHqiyjqzrGFDJ0w/1IusLUg6zHPkRKqr1Dts7Oimoek6thZRy7WjxE8UWKc+3jTSn4YvqqD+LjiLwsSesHXIaetH+jMnq9W+x/ZWf3iY5w+yu/Oba2OwMHl+N7QK97unwkObqVM49PsjekbmgPpsQsy+HGErps0OuxL5s9WQfXj6QGfbZUskpGJzqxWmIvcXziQmKEZBO4h/5JNAMf9R/viRtz2pn5UpdwD7LYVrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 12:22:44 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Thu, 26 Mar 2026
 12:22:44 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] texinfo: fix texindex awk path on target
Date: Thu, 26 Mar 2026 20:22:30 +0800
Message-ID: <20260326122230.2202510-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::13)
 To CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MN6PR11MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: ee119c6e-febe-4e37-6bc1-08de8b3261be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	4ZMZXWRn2oXqMO0IBP8u8Ikq0QRuguomGj1YAX3l9btqIqZktFoxLZDVrYQY0HN7TVUw1nXlrFuj4wrzrB+0QoIy50LoIbhSJZNx9Hzskk/ThX8N3GUO+cYlmtc+e3MpRMZgB4g5Eklil4X5tCggMVjq//csqM3rIKADUN3xbbddNGvzIiWPgo4bo3ozm+hRtQldGBngIqaHBvjBGkr7S0CKI0wTYo05bNcXuDqNH++fa4nxLHHzUxXboVFkIacEtcAQ3txOWSIuKVa4ieKAnZAQcqHek188mWs6etAvdhOW9cFLfEt/uDzHKpBSzKgHFQYZtu3+dCrBR34YwVmhq9bshjT/T/yvO+g1jf09f5jSDDqoxO+5NYBTpp4jU9ecTgXEoYyDYNRYmU8PwRGDmteGwj9BaFtLNAIh1MPVKcQk7r6xOKm2hwjr/pznnvAMp2jyU0swrptSxQ0ocnIDYb/lDZ3ZBWoLFRgUj0ioNnhOEsgbFB/zXkWEU6U3yBuTkGim+YSdnvUNtu79rFU1ib7CpdblCaQ0Tc1o3aTACgsCOb6FnyCY2Yt1y7MHMpYPXGR0OmuYACxn6x/Tl1/emD44qTB/2quDQZqgt6L27sxgSFSfOSFHtOPMW0beTs9uZ9OZ/r9s8hg0dSwap6x5hC59s1zN5MVfXQ1TEoGm7E0QIuttS8FXRgGBe9ZH/S6yXRVYzOi2d+aheyrYu23VzUOURaoyufalSbkCLq2KqcTlM+YIICzNnSTbl8WYdS8AhFmqLdEkwyVQ7lhuMsF16pOzu5Zg+/LUfKYM0flP6vQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6VL1H75qEhdRNaujg14hjcu48+nGM0hIOP4RErPlZxSJJueTwrHIe+Byccsn?=
 =?us-ascii?Q?6M8Cepj6j/oF6svTVmiQlUG0g5sV94fl7QHe37LOr/VUVQZ6tldxS8hd7dS4?=
 =?us-ascii?Q?8aQHWhvhtDhjtutOO+OSmww243QVw7Qgv7T/BW8rISJ6NCOmkBSIfyF7N33+?=
 =?us-ascii?Q?/NP0Zh9dBv06lGqd8O1LNokr2DDxea8+KPUdBSc+fyc8PZIxwOhqdSOzomUl?=
 =?us-ascii?Q?u+xX6VdKF1CgpO+edpxrrq9K8E+9IFBT4cGmBqTDsQFZQTAUyzFqbbOEYkzx?=
 =?us-ascii?Q?nZQSec8YDy0mIWJRkG+6H4/zvH3lVyjphvk6VUaTlV5zw2GFN4JwSVvitHMe?=
 =?us-ascii?Q?4HEAtSsu4oav22bJbjNvMn+STYrs7iWRuft142Hkr2Rwl+gzrq3o6gPfEYqK?=
 =?us-ascii?Q?kACnIFeHCx9gWzdkrZjcUNU4m9M14AtRNV0vKJJqIWUvVzadSPE84uTT8hdT?=
 =?us-ascii?Q?fXXXxV8fwHJjcS0E1YH8WlG2pNsNwx+ZiErDluOPJVU9nu4BQpWsXsGiqvzY?=
 =?us-ascii?Q?eLSHGjiEnhsp810t8aeQTzoAynyXCDzLLk9/QDnCaGfAAqnGMx2hSEt+1JEM?=
 =?us-ascii?Q?Y1QtEbgZfo9DPz5+LyBXsr37tFwIjGIKLoZ6CRNTxAPm/uv7Z+rbiQQpXSYZ?=
 =?us-ascii?Q?UD5PqsZDUQPk0AxzTWpDNaGclM+PeQ4PhMRc3MExkjbprWozObAOdNQVwz+P?=
 =?us-ascii?Q?wmWzqAV6LVtxIUMD5/NnZ3Vqq1MiYli/Kp3OdTg0MBQ2bvgMw7OuKNyvo1tb?=
 =?us-ascii?Q?qzSoI3Pd6+Uiip8VsjJ4Fkz4QwKfOMMD+ayQ3fe02uHGNplQ1o/8MMZHgzOh?=
 =?us-ascii?Q?j45+JH43yQsJqKa2Gf7o2ilqrO8RqAHKRPpnsEb0MvQHRJ8TWllAqbus7Zy8?=
 =?us-ascii?Q?OHuG6+yEXF4QOFGRjknQBd4CtwpQof2F2aGaCCBZDP3Zw+deliblcpEDYroY?=
 =?us-ascii?Q?i+4wECBIr/wotWs7IvbyxQvGsE/UXBn14SNLZ+fdOyCghyV1QXToIxqpraA6?=
 =?us-ascii?Q?EiAytrBN7z3Gx95iTUIFk3tkZlDcKPSkgKp/0RtZDyfIl49vMhNHUZPW9s7Z?=
 =?us-ascii?Q?mf4m/rpxKniYA6WpxtGNj1RuRI5kjMlSAFknr9Q3Bn2uLKOQGkYqfQMP1vEK?=
 =?us-ascii?Q?h/koioNJSJfuuy2KU7HmcpZtairqhvHx6U2jlKLK5w6gd9yL/oly8ovFHXy9?=
 =?us-ascii?Q?BVBZ0Y2AVw5kme+2RwOzmT0kjsMQmI/7oj4RjW0JdzWUylIfP264UXdJQrWl?=
 =?us-ascii?Q?c5+gxiR/Zbh9MnniQVEQYhWxEG8fmQrjChSbJL1YOq00Z0MS3YZ0a/CPO+sl?=
 =?us-ascii?Q?3EQnHoy3AeiLVqAHufjGnbcnMlmSicjj8ZnulW/VpQBhaa8Lgn6yr6MTQEO9?=
 =?us-ascii?Q?m2aQCuxiDLKIdcKYq/B9pWHLqxUA5ZXn7qOLLQDB8oMYgCdaG5YnTuitkMqQ?=
 =?us-ascii?Q?jC70GM5XB6V73f2UzZrAd0U5Re2fycqT1syK98dxjrEcGrMhixeJLTP07w/6?=
 =?us-ascii?Q?1y5RIiD8fXlRPGFxCUqbVNfebPpQoYf5xhN9xKR46wFRBZf95K781JML5PQb?=
 =?us-ascii?Q?N+7Ghyf+Dz7lXMydl1O0RL7le0Abs7CmqHGiQhNc1vZdmeJ8voFVRAQ4/Az7?=
 =?us-ascii?Q?BSYDMYXl5ToiW4S3kicjft9XkD3NgjbR/IVA0kPq5CJKzRFDoBLM9ihddxak?=
 =?us-ascii?Q?9dlORrIMIISNY5883ZOcUfAw37rKIgh6OgNdvc3VMlUJ6WywnswlmBko0lju?=
 =?us-ascii?Q?5ai2SMc7QVPRUbhm0yQeQW4Xh0ncw8k=3D?=
X-Exchange-RoutingPolicyChecked: 
	MjTX6bFLGg31ubfDBcOlausdEJBpJKWSNNgkdZTFf73v8zlpcex1ftmG7XzuwkjHie9WYMjO1gPjgIlvGnxfnXHgguiCuKJ4Er3J265qT6PtCPoPvjoT3RzGtmlQM67KcNAMEtM5FI2SZhc5GqnNQAeomBYugVV3yCVIOt7jgbno40Nsehzy+oEqWbW8J1mpVmu1U6Nge6EeNNMOjTekyzJrqa59B0g7C1psF+RCZ65fmRQTajEasICxHm1+Cyr8WQdifTOrVLV8K33rO4jr4p99dkGfjgzZW1WM1gA6WrobXuIVM75t6LYCS45ZY49SKEvwE8xcec5YEXI2fADnoA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee119c6e-febe-4e37-6bc1-08de8b3261be
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 12:22:44.1447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKjYOHW5aLB2DDJ0jxYFl8qJZ9C9Q8g+UbqaqF3JA45gsxVCLzGIsNh9NDWZ7GW+wiNuxh1e9dxnAu+rm+h9ZneVx6jmL2XS5VcuCfQsxBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8102
X-Proofpoint-ORIG-GUID: NzxsjKIfVCy7p5VZ43n6gO4DtbOjCLFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4NiBTYWx0ZWRfXx8QW414+PxwA
 HXXVwGA6E9dTJWqg4BaYMF4lY1zoHAWM6GJYkYobN1K7C7e4VuHw4SDSDMiE1fZI5+NkiEx1ADx
 1fPPRrethb+eUlg78Lt0rMMLxnZ0BfsLwDfJHC6kt62+NdD0oz3uGNapCp+de/pFTfbxRa5heYf
 5PE9iVQILNV5WRK7g5BC3ZCohgsDwYYVzncZwPlQQxofpwVLqyTbkEQvwd0iZ1dB5z5YPwaVsR0
 tIK8BVTsS3+Qi8AEouNVjJtCWX7c+3sdofYuZp0os0CMzLCVZgoMomr0bLxiSnGRQoce1hjoqta
 c7Ahoq0NW+ixMYIEVEMGw+6M6C+OjikAuDgBHyytOtnH66X4w5JNviL0BYIxPIgu52Vgtt5LbgZ
 Idl7Vxp8wBzBGplEIBUi/zBSIOrKxaADad4Q2ua8IGbPPW2FsGdA6PRjG6elF9xbQuCrXUDfgOE
 ZuOBXwt8TQhXmO6WLVA==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c52516 cx=c_pps
 a=W+em2WlbpAENNNrDSTAr1Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=7Ll3Aeybf7yQeSqn8ZEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NzxsjKIfVCy7p5VZ43n6gO4DtbOjCLFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233981

From: Zhang Peng <peng.zhang1.cn@windriver.com>

The sed command in do_install strips ${HOSTTOOLS_DIR} from the awk
path in texindex, but misses the trailing slash, turning
"${HOSTTOOLS_DIR}/awk" into "/awk" instead of "awk".

This causes a runtime error on target:
  /bin/texindex: line 116: /awk: No such file or directory

Add the trailing slash to the sed pattern so the result is the bare
"awk" command, resolved via $PATH at runtime.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 meta/recipes-extended/texinfo/texinfo_7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_7.3.bb b/meta/recipes-extended/texinfo/texinfo_7.3.bb
index dbf47a79ca..fae4e510b4 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.3.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.3.bb
@@ -61,7 +61,7 @@ do_install:append() {
 	install -p -m644 ${S}/doc/texinfo.tex ${S}/doc/txi-??.tex ${D}${datadir}/${tex_texinfo}
 	sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/texi2any ${D}${bindir}/pod2texi
 	sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${datadir}/texi2any/load_txi_modules
-	sed -i -e 's,${HOSTTOOLS_DIR},,' ${D}${bindir}/texindex
+	sed -i -e 's,${HOSTTOOLS_DIR}/,,' ${D}${bindir}/texindex
 }
 
 do_install:append:class-native() {
-- 
2.50.0


