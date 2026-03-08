Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F9DEF5866
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 14:04:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38904.1772978657274634321
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 07:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Arx5ZDtI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628DUo9d482562
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 07:04:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pWuUV0q4v1SpmDNgZFspcLQ276g9+tzN32fSel03SYY=; b=
	Arx5ZDtIuCqooe5m0PsksohVJsQvcgfb/TQEUxL3rupcsM6nMmNm9xcp71hQ7z6b
	At+IbqwsnB6zmGuwwt0ZVnUNvr5/+OPUyiT7S1r+Coaf0KPHCUBzqlpnuorhVCWF
	3jp3VoAYZs8qxFsotHWEvOMfIpZ9D4NasanUl13PA/+VdmY96vhVwtYbPJ8A/HiW
	rWNsAG05elVvFz88ysZPXmipAnfMgn+BPRbpV7PTU6Y1O8Uaantz7aPXvFBDEj5v
	bNzs4w42iYnvbFDWnJQxu6UpL46edyV8cAFSobFmHkXWxAjdcAmXi4qpbtKDAAsP
	1yZcBXHxVNKZpeZkH1eKOA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62gu91-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 07:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTepNd0nzqfBYAzGk3aQOJ+yq37RrrGpa3cXzbjfOWU3/wIc0bGQHhBSEcyND5zzLqwLZn8bLSuCr/JvCjDwBWO7uzm4GM9aEwwJlFypFWKtm6Ze97mWVAWiOCv6iu41TwcdH54/NN4cAq7qVynZJ3J9aKTt3k91JjtfDhl/F6cT5nfd4vlb5xSAquwVJrmaXHOXZgWdivUaOwbCI8DMA9f3XQ9isW+zf4LhVo5H4emVS4GW+NO/XqiVKdno5SHbru9T6oETPWckfttlcxPkFb7Eh8KKkPGJ+eKVTP6aIjYV0eEDlOEnNWuju9YufT5iTI//qszemiaRFgcd4CUJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWuUV0q4v1SpmDNgZFspcLQ276g9+tzN32fSel03SYY=;
 b=qhrLeVShQprdQj2rNHJf+E3vYrEZJRLlzIIBlDfdfXRNNCvPIGQJAsgVAEKZr9PV6AjUYNKx8NXzJpZiDiE3flFornVjnR0zk+TifscRNrwqbyV+Sl9PHAENkAW6jbB1H6xzvm59ZIsP8MjEE5vsCrBkqi+segwnw6t3aOvF+rqcR4TmZq+o8ZSCYZf3AHxgeOYlJ1xdVmLfR8YbobCRaJTarlB1nZBgvj6mDwo9kFD8j08KdWnNI8twU1Sb5JPgGVmB5flnTBoxoCJFsivY9309yRvZ2H6Nc6q4fCNTVJzkR7IU0bM5U14+FsgqCOy0zznI+AcL08zQUjEbpgNsaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Sun, 8 Mar
 2026 14:04:13 +0000
Received: from SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486]) by SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486%6]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 14:04:13 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH 3/7] pseudo: fix for build with glibc-2.43
Date: Sun,  8 Mar 2026 07:03:10 -0700
Message-ID: <20260308140337.2503858-3-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
References: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
Content-Type: text/plain; charset=UTF-*
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To SA0PR11MB4574.namprd11.prod.outlook.com
 (2603:10b6:806:71::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: c923a4b0-fe91-4b1f-fe76-08de7d1b9422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	OgRDSqHDEoB6LbUhi0+CNPM0GVr9qzeKwvMbzUNpTSO+BBkpx2aPpRQQ+SP3tvhW14DhPJ4UKv/j3uTioUaFUMUBrGXCLowWUKoI9sR/Hn0EBgN3ofPZRUrJuViyN0oPkiFEsmJ91JtmXK55xzG5t0DgM5ZOWO3meDJ5EH5jrDSOE0xkPfUvJIr1GsGaP+cBV+qtog4nkGBbQLzK4osv1wQskOJpkoFLXlkTqfGAr0x2TpP8XrVrKo72HfTKri62FmPiaLDnHw2cBNIucn+JIwj5E/QrPHq1oWTQrubz8oMezMSOI1EBZ0fwFSCoxIE/7CK/zb+1TZsxmTQgs0rD0yFz2sn8Psg5Hch8NTRKgisKBkiuy7ntKhkcbSb43ZH4Du7w/OMOLGH9BhXqFdFa6KKRdi051V+L3Bav8aKdFYC8SHOKFPsX8hWqmz+3Zjhj8gqkBePip1R44dwWU0yPrTPBQiwdba12XP1tiE4w+gVBgxtt/1CJMzNa8Q6JYTPOT5tYg8IW85ljOdAW+Yr1Q7Dq3hNYj83BbJscnc42AkXfRk572R2zvqPQ6dLPqHE9VwJU43w51Ud5RR8n165Y6/BwTAOC6JnL87QE2YLqfnkleFy7SVV/zUiKihSk+N3QCkmyzDmVPvCEq9ous3MBF1apwYFWs3aEgfoB/W/QDS3SQRHeSQZFOoExbzaJKoGDFZM5jZlyJv/0ckmIoL/J4MRzGdJ/AWtWumA5x2o6EEYm/29L1w0+m3NlD5ARcmo/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4574.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HgmPJf9tASXotCtPnAib7k/PQ+M1XBePsfOB6r+BYv8etODr18JwNv9yEp3D?=
 =?us-ascii?Q?BK0G3NkYvYLAj8QDlT9zp1zoFtkeRtzpFwQsE5P+zZtbduZJFCwpF3G/cHBL?=
 =?us-ascii?Q?vWxNkL8W5Rp+wthlBTJDY+iNOB6qhD+uwvc0VuAsW7ooiGxRCJEx+yCp+JiX?=
 =?us-ascii?Q?PVSF/lN/O4GuMiSPgkvjdZYO9rH7iHl74+9dRwSNjFVGl+Izi7Jsnl586trM?=
 =?us-ascii?Q?Z8en87QkwtO6HBG1/Mu4L89fPH7+wEnHgD4Q/i/31rNloKIE18in5RtVMMcl?=
 =?us-ascii?Q?/jtweYZd8jQleoYSzO/cgRE1mk0msAVqAXyJex0dxvp4bQcO1yv1jw45g48y?=
 =?us-ascii?Q?3NHaDufJO8WJnDaF04lj201p3vADgSGY8XZMKqJUvv2Q5/mrHwTwcfphQSoR?=
 =?us-ascii?Q?tCezd7fQjm2hsyVNZBxybsntklTMIE87ZKrDalwCamRdWM/CLSyBBpiOHifa?=
 =?us-ascii?Q?Q2ZVUCN8WiNmrDBuNdIa/BW2KuJdE5ER7d3q183woxb9k8iJEPSmx49hZzOw?=
 =?us-ascii?Q?b8THqWL3bPC3Q7N+4zSWZMFblnrYMArPEVSYxc/Wry7OTOhm+u601NHmfVLU?=
 =?us-ascii?Q?oXkJDbUUCk2u83bSwzeTIWROl4MF0yaMrLgQiZj2+7JpkUC+HKTol6EEaIc3?=
 =?us-ascii?Q?b0g5axAdKCgwWzg4BkaSCezd6MjiComUrouomXwpWQgAYGn1QR3TPheDy6wI?=
 =?us-ascii?Q?M6pAPfbraimu1X4WPr/6ds8bWFQF+cvIb5aEUPTT/hKdncx3pvZqjmdYm8oD?=
 =?us-ascii?Q?vqR8xTGTDDRMSeAXLOQd6KyA6jfzZ26DaXBcOKQUhrU4Wom5uWZIJDQ+qHlE?=
 =?us-ascii?Q?2hkYabeMMEIKBK/q5QbfmsisQ2W4SyUqmCZnIBEbqwIhnb7WztzO4haVEQSM?=
 =?us-ascii?Q?cyVSwLwF2lWmvITzEWBcEetlVb4bwJEORh0LOEQANJ1YXvbLbtC5XhTYIff/?=
 =?us-ascii?Q?Il7KJy78OjIO8CW8zVL6cwkjcliyNDqzUSmpjXkPCEuG/VEb4Hc+UOb5XQl1?=
 =?us-ascii?Q?Dq8cVObTFMiba9mHwL0NrFqjD1tMBlu5On7Hd9xSeo02+ALFn7AlnoNQ1IiS?=
 =?us-ascii?Q?CJOPwGWiCdBBl9r2g+naNoMx7JvV0q/5N2MHKftUVo8M+oR8mtKxaSk+qCrK?=
 =?us-ascii?Q?RnTAREQGBt2erqohqOUg14D1pN9OUvFM2eF/orboUHfm5d4VH8Kaz4xR75b0?=
 =?us-ascii?Q?Cs9NYwZm0JTu3uHd4/QVRx/JjFZdmlAqMtZW8T2DqsSc+isL7FcEV35JENcm?=
 =?us-ascii?Q?a3bISzecjFN+OjuXXvjNqM8cJDga0djHlEg2a+NZulb/tZLqjxwD3oauHUvs?=
 =?us-ascii?Q?toWYx2E69zU2JkbStroQP+mwXyTPlEneOhQftTNdIif3Rkm6+Gprw8gDeMsI?=
 =?us-ascii?Q?syU+swXygM+FuXUnwcmz9rGrItx3+eZhbEsbKdPZA/MzMA0ukJBntjaLVFW1?=
 =?us-ascii?Q?eiXe6XpHuVefvisI+FeZDLqqdZ7WVojDqRgl/50Fiyk8RpE2oL8Fh/A+0RQA?=
 =?us-ascii?Q?L6Nx5SahsEC80YfS+yL1mvlLDK7E/bzGS4p8kogD3+UHfvkJdePvgLhNOWjs?=
 =?us-ascii?Q?51s9QHpPKX8bG+tMm3BW/2ShFlD59r00b54tmhl9VIlUywFKGZReJUz3Zm5B?=
 =?us-ascii?Q?ELkVAq31gdWlU2nfH6GOo/SuK5ZOsK16Ni6rtsBCFJegLNI6Mc7sesKz6FYI?=
 =?us-ascii?Q?i4aFmXqFh09ecGHGaML5UlzLSUUWeB89BgXk52nLCgUKQT/B1taEG4ACADvX?=
 =?us-ascii?Q?fpvpPkUOFq1CSba8F1tHGR5wJSEkvsQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c923a4b0-fe91-4b1f-fe76-08de7d1b9422
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 14:04:13.6872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfExaFJXc/YP+Ms99R/qJBzArDreUrjbCgPnjlZQDJKJuJ+yXG8xoS3DH96eL72XNmoPEVNB72H/tsNUdm9xCgd7w7+wIYum+WzZO0WSkqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69ad81e0 cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=pz8aXWdJbrsA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=CCpqsmhAAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8 a=r4SbuPoWkWBK_eV5rGcA:9
 a=3ZKOabzyN94A:10 a=vKeM8a-JkloA:10 a=ul9cdbp4aOFLsgKbc677:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEyOSBTYWx0ZWRfX/XnWZk0iwtnA
 +KrvV/gG+RcA0JBWLHzx+og4eE57E25u6d/U9YZ5E/Urj3iCp2+7vs/Ei8qpxqnAUwo+JI66luE
 dqgel2hdPGtOxo6+t1mDcuxonfr4HKqeAlEPZpAR3HHkSactGp/7HW/f6dQclrRoyjdJQ0nG9Mk
 uP8ZN9oRZTgfbPOPEoT7gsEH7/ucCy+Ohp+qx14DqIVLQI+IxA5+KoiR0+lvue/EcYI37wV4Svl
 c4A2daK5gFVESFCLIFvOJIsdzZ8OIrVzZ3UEeVeILFig/lDZ/L+auDDqXT1H8eNad3yzJS5pQiB
 wrK/qxbjnRqGII5ajLtDCo8IPtgz221AdWpRXK2lxOgngpJWrSUoZ7SJABRbWposAqae0dFtajh
 Mu65OPUQZAIq9zCJIsI0YTNECO9ha/dvBQsSKhreQrGDe/5rKUugnbywhus2bc2wnSDF726Lxcw
 ldnXXo3tjARMrAkqraQ==
X-Proofpoint-ORIG-GUID: gUtLVjWRefUoT4khcLOv--BjVsl_Q8px
X-Proofpoint-GUID: gUtLVjWRefUoT4khcLOv--BjVsl_Q8px
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080129
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 628DUo9d482562
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 14:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232646

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...01-openat2-use-const-struct-open_how.patch | 54 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-openat2-use-c=
onst-struct-open_how.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-st=
ruct-open_how.patch b/meta/recipes-devtools/pseudo/files/0001-openat2-use=
-const-struct-open_how.patch
new file mode 100644
index 0000000000..eda2593bdf
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-op=
en_how.patch
@@ -0,0 +1,54 @@
+From d17159194e94b5150600c333a5e2ad46fda6291e Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Thu, 5 Mar 2026 17:53:34 +0100
+Subject: [PATCH] openat2: use const struct open_how
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+To match
+https://sourceware.org/cgit/glibc/commit/?id=3D0f0a5cd338998f4b603f52f3c=
e2163df0db7b814
+
+Otherwise it fails to build with glibc-2.43:
+
+In file included from pseudo_wrappers.c:300:
+pseudo_wrapfuncs.c: At top level:
+pseudo_wrapfuncs.c:11537:1: error: conflicting types for =E2=80=98openat=
2=E2=80=99; have =E2=80=98int(int,  const char *, struct open_how *, size=
_t)=E2=80=99 {aka =E2=80=98int(int,  const char *, struct open_how *, lon=
g unsigned int)=E2=80=99}
+11537 | openat2(int dirfd, const char *path, struct open_how *how, size_=
t size) {
+      | ^~~~~~~
+In file included from /usr/include/bits/fcntl-linux.h:492,
+                 from /usr/include/bits/fcntl.h:61,
+                 from /usr/include/fcntl.h:35,
+                 from pseudo_wrappers.c:23:
+/usr/include/bits/fcntl-linux-fortify.h:36:1: note: previous definition =
of =E2=80=98openat2=E2=80=99 with type =E2=80=98int(int,  const char *, c=
onst struct open_how *, long unsigned int)=E2=80=99
+   36 | openat2 (int __dfd, const char *__filename, const struct open_ho=
w *__how,
+      | ^~~~~~~
+make: *** [Makefile:162: pseudo_wrappers.o] Error 1
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Pending
+---
+ ports/linux/openat2/guts/openat2.c | 2 +-
+ ports/linux/openat2/wrapfuncs.in   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ports/linux/openat2/guts/openat2.c b/ports/linux/openat2/gu=
ts/openat2.c
+index da01b31..366fb95 100644
+--- a/ports/linux/openat2/guts/openat2.c
++++ b/ports/linux/openat2/guts/openat2.c
+@@ -4,7 +4,7 @@
+  *
+  * SPDX-License-Identifier: LGPL-2.1-only
+  *
+- * int openat2(int dirfd, const char *path, struct open_how *how, size_=
t size)
++ * int openat2(int dirfd, const char *path, const struct open_how *how,=
 size_t size)
+  *	int rc =3D -1;
+  */
+=20
+diff --git a/ports/linux/openat2/wrapfuncs.in b/ports/linux/openat2/wrap=
funcs.in
+index 96ae8a7..2f1e716 100644
+--- a/ports/linux/openat2/wrapfuncs.in
++++ b/ports/linux/openat2/wrapfuncs.in
+@@ -1 +1 @@
+-int openat2(int dirfd, const char *path, struct open_how *how, size_t s=
ize);
++int openat2(int dirfd, const char *path, const struct open_how *how, si=
ze_t size);
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
index a26a205a16..b34525055d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,7 @@
 require pseudo.inc
=20
 SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=3Dmaster;protocol=3D=
https \
+           file://0001-openat2-use-const-struct-open_how.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
--=20
2.49.0


