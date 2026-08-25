Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E33C61CE2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11731.1787618784348930181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DcCqsXaj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ONLqZi3842598
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=62IHnpQNRbx2sB4LCjcUhQw3CCtY6UzT63yjHpoCrD4=; b=
	DcCqsXajwcgCJBlf9GiNwTul2iej2LfGtlPqkiDJzRQkX5eRTX2WNhLjMo5a54BQ
	yZthPbklzENO07SWUrTimwFBDmVPDHuvnP3JPVKJkCnQAlc+6YNfhDnP3XiLbEje
	YfRV3GDAyBttqxGSE+MGIcBMc1Z/qJyRqiURfNQqrJNlGXK5/ciW2Jf7VZHMKYK3
	d5id3krrA9USpxHV8yXJy66s53hdMAzMjbLsO2LdZHYOkv7nt1Y3Yt/SOp/QozOX
	J7l5FB9s8B9UND4YzxLqAg+On5XVdjpeT5vmUiW9FkWDnAqCc/8nQFXJWVrsi80B
	8hmtbzRWJfstBxOQjCSUkA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020085.outbound.protection.outlook.com [52.101.46.85])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g72r6unmx-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 00:46:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnTOmohvkHJfiAVp8Mrf3D7n64A/OuTnkcx65+EbYrg9gHilc6zHj4yvka4jRORcb9E4e1/4GoUed+naOoujhYIBTCpC3SyfA7V0XLvru1xuXQuNhxYyQfFD4KIW+xbZiZKpkJcgqj5MZLwpZ5Gk+2hdaw/Zn9Lp09iihOwkMj/YX1Yg3+7zetDc6UjYJtwSbWppWHyK5kEQti7ycTJc7CvS3F7VI94JX577Lm1sePWmLBiDPBUKjwFNhZLhVfIXxIvsaRRCn/NtW5Q9yQ7XRJY4tQrOBhsUx1xLHhw3PRAQTN1s1GhwRqE+LfNDUAMHJwhngVKeyTMQpe5fA3P/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62IHnpQNRbx2sB4LCjcUhQw3CCtY6UzT63yjHpoCrD4=;
 b=FU7NEcRO0FUnG9RnkHxSKoCorkGCc57TlCkpB1+7z3Dde7fyT5y5m1X6pMaJyyh2KgU3dxgbGdOBixaisaNT1JnmZQEbXdP35ebnVJtbngFwGS5FxcjVYHqbHS0cmeRS0OTG3RLTXffko+bcYMPDEF4vwjTLa0+YRTeg/zzKyc+OCJvCMtOWhypqFn1DDawhc1Ia/bnMqqUx6Rx7W+hNOlpVkVm399GT5RvJd361sBtDfEj9Uo1FBaTxqry1FvFwQzIJ9OBvjSZGVP9wwPbKVL0Eg39oUzsNdUB/ZbuCpkUnr4CbDb8rqtR3JAdWiK+G9Yw7CvBTeEaRb5KVFnXgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DSSPR11MB9642.namprd11.prod.outlook.com (2603:10b6:8:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:21 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:21 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 13/14] package_rpm.bbclass: suppress RPM 6 fileattr dependency generators
Date: Mon, 24 Aug 2026 17:45:50 -0700
Message-ID: <20260825004555.4111831-14-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
References: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DSSPR11MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 290d2ff4-b26c-4d76-18c9-08df02424841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|11063799006|10067099003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ENjHa+LdKf1s/sEyqXUJqhd4HhaTYBIx55rrjvKgWDcBDOa6E0Vw7523tHptJojVqYqdjLlxMPKHEAA9vtukYzA8F7N4GsduhHY8jD/t3wIfE+XYy5lQiZdazvamX8Ycfz2FY6xKxFu9Qk+v72MrXaUGpOqP7PP0ovGCh3HPyNO3FT6YuXdxcWiMrZXPbzrkK5getCppj57Vz1pIuUqGWmxbc50xgCLv8I6CLjZAoS0i0pAju4eUWMl4jyeJz38haEG8r4AYpvFrAIpMZkX5YAgpFADgUVcMRsfnP7OlcmtXkHcSRNDqQhJdio/PCthE42CDbcF57RPWbjQg9Dc2sPjfLR+M8BGHUQ03lOW4t4O4Hk2YzNP4uJ6Z9o6IBgScyPNI9ODsO0XEs+kzE8lD57Q4138HW//xVf/XBJVdsP/tum0DLkwu3UaKW2SS+LOWy33D7peFOoZ0G/Gza3YjJ6GMj1Zo3jBD6QuYMqENtoAKPPz8TPElUfc9Su08MgdmDAm6RcKvp3vPc9OnmDe/VcmuB8aOsmF1Uhl/xEOX6moaOCs8X/3QY6y2HbY21zmLAsm1DQhtKnnRjP4R6NoCi/EOp1owWalY+DFQb9DQ8qq9ZUuleNBZXCBjTSl0Bi1L5bI7lXAExF3ba88FNyP8hHig7GqZspfk2wERqstFr/JRF4I314nXlzF64T30Xw9Je9PcWcm/lF6upYrxSvYj8H+3xcRsaFhiD9yHmlHarqM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F32rE2H/5nJ6p6VLNdwUbEMHrTwyApqQLDqZOH/e5qkYnOJxXPMcasJeKG4a?=
 =?us-ascii?Q?ymA/+r2O2nX3ou82mGXbplveAbV3hDsX/Obp2hRIscFiV31Tu9OtaQV6aefB?=
 =?us-ascii?Q?0hXtFVwU7P5agrT1uOtkzBcU1fzeQftULne0MtyiQ1SeEw//ULXvCBOYDdyp?=
 =?us-ascii?Q?WEgTuCXHvdyY5mcKaESmfEbD6cYGL3kpTrlii1zW26m+BxEaHockDIj6ZsAo?=
 =?us-ascii?Q?yqA5VJr/Or1MOiLe5iZwYCeMCsEbBsXWwTzT3HdZLiKzHvWLErP05thLR2OF?=
 =?us-ascii?Q?8wbejFrGhYOM0BwyOSM9uir6Tx3wTGyGGcHwqAzLG8TUUHg5XdDF980veV5J?=
 =?us-ascii?Q?xugqx1OJ/Pfs1AbB1FAGqd/vWXtCg4C28i/30L2Rg19tAWoE13fv3WYT0v4S?=
 =?us-ascii?Q?3a1dYNFhrExvghfyuHycFGTzKnDcLeMiBJPZQSsmVrBAOcW5uqLv6Yoak/uU?=
 =?us-ascii?Q?xFpEeKqycyJ/DpaSZPgQRJxkGxpVWmj3PpCQVoybFK4yeMyOIO6I5HgWC8JU?=
 =?us-ascii?Q?1ovxb7/cbUNUnNtDXJTMAt6/27HAyE36PyBLFBLzW8sSPGridcrXbxxo/fH8?=
 =?us-ascii?Q?kvFmInTnmrWqdyO+Fn+RcNOgZVA9Bz4rn9vHBcmc8b1CVNvuluqVRoSr6Q2v?=
 =?us-ascii?Q?nm1OIRM6ONqeIzAVIQRWu49LccRcu/t91fT6kWswlXwuvFKbVMZpjRLa0mWM?=
 =?us-ascii?Q?pabBSHCLnTOb+ErPr4Ubv/wKvJj2V59fnvWFm0NQRCj0deIMtG4B1rcAq+OO?=
 =?us-ascii?Q?Lz/QQdJl0lW5ViWytwciRtP3GhTNkp0esHwT301v2rNcL3dH75euxaWrYVOB?=
 =?us-ascii?Q?/jAkKvII7noxDhoT/1zlctAGbuUBU/tQWX7Hban4FjkZqILP3Lvg/DOR9lmC?=
 =?us-ascii?Q?SDXhLhorzn8pb1yuZkcDFfEJYvVQYWPz2t1Va8x0/hGca5oYXGxMtQylH6AT?=
 =?us-ascii?Q?FIHK3jiBvFaUt/adL2EgxcC8W5oN4KzDXoJsq+WSpEXTRP6FcwzC5OALyQOC?=
 =?us-ascii?Q?OMBZeIcntRYGdcarhP/BWJVvHT2elI8eKLJB0woPrHYbjfYtaAalFobrDk2q?=
 =?us-ascii?Q?MzApKzbeKoLWY4olrhiHd+/XbgcnwoknBWN4p4Y2nJlqYDSsghUs916BmSN0?=
 =?us-ascii?Q?8PAoFpjp6Lg2YokI2xjDBDKWRT+kXMUhSU11eiN7lP809hWAAXF94KKjyNYQ?=
 =?us-ascii?Q?akzxbodccsUfqpIfEDtJ7R7jQx30bQ9vvX9nrAIzB7vyVqsVIaUQ+VuI0jPe?=
 =?us-ascii?Q?SlEiMdpMgencLCbFVYEucFb+NA3in2UHl04IV2yPeATZk7TtuLYNgBksy9rf?=
 =?us-ascii?Q?kFdvlTeIJY11GHaxmLuY3Bsi+S3A7tbOuFjHiz6hhx0SxSbhiHnP6jfJC5e9?=
 =?us-ascii?Q?/a1ckYNICjd5cFW5oADtmtHKjLmHmojq0HHmlGNhMLPU3icfVHEV3sAPUoze?=
 =?us-ascii?Q?aTWhBDoyzjBmtq/L2/3RbyIUHRzrwfyxJI14EU337HziR2Nl1abiE35e+7KJ?=
 =?us-ascii?Q?2CVO49Nq3GP1thF+Q/+iSWC1YU6LupNxuNpVIF8h8LF4WKWQgaFCbhVfQTRZ?=
 =?us-ascii?Q?wHekKfqEHZkiLM+j6pJThW+8wzF49c1KhqG4MFbaB39LM+DINLPTHIz6bono?=
 =?us-ascii?Q?WpuRo4WoarGE4tOsQdIN6GfHzBBgzuYibyWJiuvUe62KZmu375cecKTeSB3+?=
 =?us-ascii?Q?wlcDMEW+RA/3y4K45lBfgW7J7KEKu7sYG3qVpM/up+f9vIsxQS5j58QvjZEG?=
 =?us-ascii?Q?LAHN0QHDVRP5gqNiuJZ0ZQ0mVXq6bc4=3D?=
X-Exchange-RoutingPolicyChecked: 
	aZgYDrRDl7hZiSKp/g961lSC6j/kohsaZJlVOWDck2Q8Yl7NENRixB87C/FfmD2tTT6ZZAL2Z2iDYgzOROANyJBwS9ybg/ClAJB936saUnVP+kPASiT6IK5jsIsXryH3XHxpYZhbCmdkA5wAMm4Knrqfl//dXNMBqFS4QzctmosVQgMr+P7Ef/S842mJc/ttUqw7f8+5TT1SDe+q4ZMui8v4akVwuCdT+d60lC1vyT707budrNLkLS71OxzaV2GMWgAN/mUTUL739JxtVBWK13oBc1DSDSN/7OBfL/DbHrnbp/g2r0dOR0NZO83Vp+fnGtofHvPxpzckRtUuxX1Rnw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 290d2ff4-b26c-4d76-18c9-08df02424841
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:21.4363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEZpe64PqRcCegQ4NpDYy7G01JCe9apRM0/T0yZHMJzr5GjrjeuCJEb7djYDpXv1ie+21J6kIjgtTjJl/FJOw0z5hlTgG1JPQDb+VtYoV+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9642
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfXyYkhmBW/NNpT
 z6n/TfBCMwPdtHmry/k0e9OUsUwgFhgX0QL+BHkKQE0+4FjVt6/4tZs6xrvUcGR6pzCSwDzJnY1
 jO1R5Lpx+zIk+1aB1wT7x/+a8TCaZ5uJIpAKw73NbrzYs9d2AX3t
X-Proofpoint-ORIG-GUID: qWNw0Axk7jbjzrH8xJwA8ZAyDOtjSe4Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX9VkRk/babwHT
 LN+O5PHFMN+auz1UuQDSldz1DHiWDKu5unlkZ1QEhNi83QZPY3nj2ikmAqVAuMfuSSpVigmfy55
 a32C/tFGOQ/A7BVt7jBYDFoKJ3C4ojq2Asg8MrLliham1ryrJxCKr+nEzGR/hTMwGkRZTlUeO+i
 IcqcItNNkaDi814sIFQDoZR96FsjFlf2Cnt0T6qHupSc20NnA10KU0uWuHwtOixAWwbhV648EzH
 DCwYprjioinxOoWWcSC3nvKu/a31mkf4fQn/lq1PUu0DPGHPYU9/Iv+e66M+xjXXNmRH8v+J2rA
 AoIFnxoKZ777Eu5cwRY9dWp3O3tb7H2zqc85EhDgUKsEG3fKsSiH+6T1wXAGfHwzhXewcJFtcGk
 tED8czgLi2AczbryGwB/rmDK6HIklIWOKYwq0hTZNmCUquNqQVkD0yF2kURv9EuzZYTPU3sGnjk
 DrikUDHvkTe2j9xF7Rw==
X-Proofpoint-GUID: 5JL2DSQq-3UFDRNemZP3SPwRVrsJ76LL
X-Authority-Analysis: v=2.4 cv=RLiD2Yi+ c=1 sm=1 tr=0 ts=6a8ce5df cx=c_pps
 a=NH0nRcagBPXjbvxaFUBjlA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=bFbyjWf9jMRZ4lLZV1MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244170

RPM 6 replaced the monolithic __find_requires/__find_provides scripts
(RPM 4) with per-filetype fileattr dependency generators. Each file type
now has its own macro pair:

  __elf_requires / __elf_provides     (ELF binaries)
  __script_requires                   (shell scripts)
  __pkgconfig_provides                (pkg-config .pc files)
  __desktop_provides                  (freedesktop .desktop files)
  __debuginfo_provides                (debuginfo packages)
  __metainfo_provides                 (AppStream metainfo)
  __ocaml_requires / __ocaml_provides (OCaml modules)
  __rpm_lua_provides                  (Lua RPM macros)
  __rpm_macro_provides                (RPM macro files)
  __usergroup_provides                (user/group entries)

None of these are appropriate for cross-compiled embedded packages:
- ELF deps are target-arch specific and would resolve against wrong
  sysroot libraries
- pkg-config, OCaml, Lua and macro provides are host tooling concepts
  not applicable in an embedded rootfs
- OE already handles its own dependency tracking via perfiledeps scripts

Suppress all of them with %{nil} to restore the RPM 4 behaviour where
OE's perfiledeps scripts have full control over what gets generated.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 1e016971f5..71d5c5dee3 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -600,6 +600,18 @@ python do_package_rpm () {
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
     cmd = cmd + " --define '__pkgconfig_requires %{nil}'"
+    cmd = cmd + " --define '__elf_requires %{nil}'"
+    cmd = cmd + " --define '__elf_provides %{nil}'"
+    cmd = cmd + " --define '__script_requires %{nil}'"
+    cmd = cmd + " --define '__pkgconfig_provides %{nil}'"
+    cmd = cmd + " --define '__desktop_provides %{nil}'"
+    cmd = cmd + " --define '__debuginfo_provides %{nil}'"
+    cmd = cmd + " --define '__metainfo_provides %{nil}'"
+    cmd = cmd + " --define '__ocaml_requires %{nil}'"
+    cmd = cmd + " --define '__ocaml_provides %{nil}'"
+    cmd = cmd + " --define '__rpm_lua_provides %{nil}'"
+    cmd = cmd + " --define '__rpm_macro_provides %{nil}'"
+    cmd = cmd + " --define '__usergroup_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

