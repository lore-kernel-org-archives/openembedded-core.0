Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1712C88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 17:48:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45480.1789148888622159681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 10:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qA/ZWwaF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3714c97fd3=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHXFbZ2440750
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 10:48:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=BndqkBl4S
	8iXs3FvoSVLIXSAQ1zb3VQ6dHrv5vPwNhA=; b=qA/ZWwaF1rl7lWnvFbHS+fJUN
	II3h467VmqC/GjytBrnLSPXyMXwGNHqrzmOUxRLv1CQANgyYtoUGjtHQKgP4FjAL
	o2TlX2rx5/RH1/W5eTlVXNxA1SLLfNpayofsaBNzSvM/toVZr3ZX1pT9e7jX38rM
	ohXNWlIlqJPm2h+jTTnxfnuN6soqvA1sMsbef+XVre7zNKi5K2yKIyzmglmjm9a1
	yXhzzKf+VGHl8gg1S6SZLOYHCpRjZkMvlU88/FxrhpvAis5kgBazl8/dFgPgc9fm
	tokH1asL8bIWd50qxMolg6i0pZ0rTK8PtfEMus0fK9/g+Z10fIWoXa7SYk1Ug==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022120.outbound.protection.outlook.com [52.101.43.120])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gkcyq3rya-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 10:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPkEq2I8EGGdzr49XVRxTGzXjAPlrZdCttvF0iJj52Pj2nKP4ABNsfrnAOPDkdUYR9UG4NdF2uDPvaeNL4ocSfmRb3YOJsZfGAIzq+NY/KWVSKsfQuxqB6TX8pG2GJ1tnDoGnO2prYs/oFQg80QUUgYGvp0d1/L6Qz3yCZCpQ5OlrPtKWwUfj8zUPopy8EhkNSnVHobscrouyAHMXVaQVT4vgRHcBwPgCzYqx4F2KUWa9kcenlVuG78hnf+74mHMODxgyJndmQllehNj4BcB6yKK2LpEz2/9s4MOHPEfyqk6jvpX8cTL1WyODLrRu5c6BW9b0Kp0OI06GMM4HUZHLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BndqkBl4S8iXs3FvoSVLIXSAQ1zb3VQ6dHrv5vPwNhA=;
 b=PR+BYxc5N2P98wvbiJqJoU8gVdNm/2zRxBeeRuZtjcT65bh1xe5VBOajpHXW1UEApdKG7fSJ+XhkIlbVRDVEYoNZaODlTLLZwksWljN66EM2yfqK8jMM8XrCpTcOTouihZs2DfAIjFE6ZlQ0AUTM7Vb32xtPtJR3YqJu1Rp6skgFc2f5v5RyYdiYES7pjzKwTykEp4siNmfHvChnRYeC0zgCYgYNUxNscpEqUlTlkb8uIfXCEj1U6TwpkkVcPckyVxE+jDfWd45SPOXB2rOuAK+3THqWFRc6/n0QqR3+9//b602gu+sB0EK+iWNsBfseuVm6A3ybfTfmBtqML4IG6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 17:48:03 +0000
Received: from IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53]) by IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 17:48:03 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, sundeep.kokkonda@windriver.com,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v2] clang/llvm: Upgrade to 23.1.1 release
Date: Fri, 11 Sep 2026 23:17:41 +0530
Message-ID: <20260911174741.2834324-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::18) To IA0PR11MB7910.namprd11.prod.outlook.com
 (2603:10b6:208:40d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7910:EE_|CH3PR11MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: afe85253-e3e8-4412-2703-08df102cd3ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|18002099003|38350700014|3023799007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	/VVKY2OAJujrs9iyO3I44FVzZfcV4jPcyyy107TOGDvkg/pMo6R/HkDXNRdkeAECtBKQM6yHH2TbX2/C92UXpeyNHoWeqCiGklSH0Q0ncNZRO6c4ob2ZfSX2U6uZi0ySluURfVBzmVsLjB+oO1arZqU6dL8FC61b+VDYjKXkSREs7LIOyNxeeuiF9EMFGC+qBEPfp3MSWRBOySmhcq9kb0sTTUHzZ3nXg9yR/wwgdbKgqP9ZaLzP6qfhGm2UZUtQusZrPV8eQyxf+H9iFQUJvU6zgiwrbX5a+VWW9QeazbENqUQNdwpnZ+fpM1Q+c41Xiy2pf0iSztDUO5dxya8dZDQFSy7Tvaq7gR9MeOR5lr0Cgx9oNytEW1r8RaoZ/LQ8a+RBIZOSx2I50gpO84zqWgPx/PjBf0IUdF9vgtA1f6KuXg7GSXK4R1XZj04wNQRzAYcG2sDa4ouIZw8n36ahiw8SKsPKeVd/NwTfNZvq219wTAZtjemdzVCSIAgT18Qk99eiYq6SYtonxfvPJscDQlX7Om/J1K3zRtpxjkdgFr+e3R7xHWwtzEcFglT0hEhcfQCQJ0CQWDAuopeHNLBVR8Zu9iKLEVOwvXnsT1yS6eD065vfMQShm3IinKr7Qo1CkKjowgFb1h7Z8z0MLGVTOYAW3lctpyKoiK1scbMQt5g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7910.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(18002099003)(38350700014)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OCgNEgUTgDeph5U5NkTvqsqSOssZOgwpwoWo3xDn2IqzL/htgpmUlaU9Mw49?=
 =?us-ascii?Q?3Nok+1+RwjsSgKodaPFIyoaCjJiUtb/2+h7Ai5uy+XdZh8aMBaF6NrjTF0qc?=
 =?us-ascii?Q?ujDa3LDqHCm0kX+/Ue9zL/1OY5+vDC7B8UJgZCq+0eX608RA7Hjc3AxrfXR5?=
 =?us-ascii?Q?TdiiYuYvqJPts+fgb/n5+i8XPkHnV6H1HL/1dVIMtJ59QMUxe7CYZli2dRdS?=
 =?us-ascii?Q?ZdYPbMIEfPocEDbBpl1EoCxeczky6by6gT/D8DC2WezpHbzxdpb9FSCP9WC5?=
 =?us-ascii?Q?Rs3KuHJjR9V2zxjJ5Qk8yyXPe/k2JEa37p8TQdMRYS3QE/ACtBPtZl437FoM?=
 =?us-ascii?Q?HThpJy5x2/IJDom+II3rPm5cSIiYM1KBwCDo1v01nWSFSBdwGvLJ3bttXpWF?=
 =?us-ascii?Q?iKxJZMODswjXYzWK/FU5K89vVASD5UqfL4eH+FhRBTM8Btze33o11HLZLEMD?=
 =?us-ascii?Q?yk115zL00e6VDgZrRsGEYV/3dUSXv7SJBOIsZ7KYkaHAQmTAx06f7GRroo1T?=
 =?us-ascii?Q?xVA5BXngcJ5PC7gIFJekvIq3ozeobE8a8Kl/DdoCNXXtWpBnKwtrLqgeGYgO?=
 =?us-ascii?Q?JYDf0S76ZWanAZwWZeReZSQU28pkI+8MMyJcNcW7tuJ///8LjcVSBZEKgf6I?=
 =?us-ascii?Q?411v7tqO0wLOsNbQ3z9nZJ0GLvFirytrhRkI4KZchWgEF2WlGa2tRxbKDI6d?=
 =?us-ascii?Q?ecWntvzN9z+aTKbbIEnrzG5z++NEelXPISIDNOgvl5y5w9Pc+qGBF2vcQVz5?=
 =?us-ascii?Q?0GMxc1jUMsMaN3CqZRM4YDr3ozqdXoXpOsptsLV9vNX0gqPzCbE0I7bM5Ois?=
 =?us-ascii?Q?LxMLnYBHyZx2KucQ28m2OuBCQLxj/FPv0alRuqvplZEMxff5qrM7lGL3c/ju?=
 =?us-ascii?Q?KAPi0C/DkElKGgQmTLMVZXvMxbBsAKQVNPywmfK65IXZe3zr3kJloYb8usw1?=
 =?us-ascii?Q?8XvxZMWGWPFW7fwpnd3cem2/sKHHHBCgBK5Obwp1ZY+33v1qM4SEPq2+09EY?=
 =?us-ascii?Q?Njy978sT+wYW31lgX1Z+n9NZkLdUccq4glWgU66XaUaw8CsgWeIZWMJSly0n?=
 =?us-ascii?Q?2QbSuwocZmNv1PFXY17hp9T9DGrKEypt3fTWLodj//Qpi6kCtj8DuJLfEgNb?=
 =?us-ascii?Q?TJ2/rxJt6W4tHzPYL+LFctLEs0fR/wEVUMu8krPAbL2VPhGlgFcjJWfz++nT?=
 =?us-ascii?Q?5Vx4+L+cUGzgGIN8OqcHeghS0UonLW1KQOVbfJq2xXKA3O79SbsLFcl7zrQw?=
 =?us-ascii?Q?b4hSfl0bcuJkaqKXdEeZzfoM321exLaZWfaQEnHeWccawMS8EK88PD5k2yBb?=
 =?us-ascii?Q?orUQOmnUuCLAbS52EAnhziRhQ3dIVEGwlZQoBuIWN3CgLt+i2/Tkz3SMsVsC?=
 =?us-ascii?Q?rmDClvHN7XHXAm5/BCqmxTMv/ULQZOs1MGLAD1P73oYItjYMfxPin8J5suWO?=
 =?us-ascii?Q?aT8S3vTkIfsWGUtSLAcG5eDfXz7WKDs3ZyXma4viKCfl75KEA5EspKVt1W0v?=
 =?us-ascii?Q?LcugAqLrIoAsIGhWIs/BZz8dXvn4v5CXii2TgyZLhcv2iDenoIXcX1qnvVgF?=
 =?us-ascii?Q?rcO6V18FYLjinCP6EvmU+/I5IEJ3WQ6pjzcwH6TAtdd3F83Kh90F/Mjoojsv?=
 =?us-ascii?Q?a81fr94HZNu5sVPTmiLeFfutKPcvt8w/hVhIv+dcN2dk25Gq//yvLzBXtcwX?=
 =?us-ascii?Q?MTDTs2NMoCROdgBPhwc5OpYEKRf9X3/w27z0WZy5jPFOiHqLB1uYTlgJLXc6?=
 =?us-ascii?Q?GrlNfX51bMuZda7mOzw2wjPb5sgesM0=3D?=
X-Exchange-RoutingPolicyChecked: 
	vx7jog5zX6BMW0cG9zoZ1lI39ShiCQYXqy2Ev5LX/5XMywOS2W4mC8l1wv7oE+mMsMpzco2HzetJn6TtlvUzshVwB9Y+a2yX9E5ILPg1Ytb9dZBVUVRPW++b3/Ap4u4zmcumzoNyPl2LtfiimowA1a7ANrAKsRhoCOLrUvPJ/pHo5x9W2IjPXfhkfGFKhHyQLOmA8Y+4px/rxO0alD5UXE5/GVCRF1odnbjoXxSVzzs30wpYGjm4XsOjckQZGFwGIzgO13LR40xyEDt9GzAemd1DbfMNdHI12NZhr/R3k8uZVMmD9c+v5VGb2bG3fDoJuBFdCRdT+1+QtnmPoGctXw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe85253-e3e8-4412-2703-08df102cd3ee
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 17:48:03.1999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJhv3BGLvbjsUEHCRujovNpN0eilv4113uPV84PbeAaWOm8KFLfThpAGUjNmnW+Chv5awQ76+2E+6w3YHsoKN4SmUflEAnKVTxmlrFb3TK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: vz898IkvA9zqmspJ5fJj-B-RXPkZvTGW
X-Proofpoint-GUID: zFtWBP5GjRTMPAJl9rueoMvgarIUoVJh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0OSBTYWx0ZWRfXznkT7fiE7u3k
 p6cwNm1k39PXxLzPrOMNmXTqqPNs6yQKEEvoxnSF6eFNO42krX9xfOe152Fjph2rb1ZsOgwGTv9
 NoO17vtdzxm3O9l8UIyuLgORa7m1AZfe7YHycMKZvVMFl94D8ODw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0OSBTYWx0ZWRfXzkhDSQ7s9iZL
 xksyVgfHLFOO2+VxTe4phhQQnWkUFLShN8kmJQmvxg7a13brsNKIctp0LYOhfEFItXT9nsN4DWy
 ga6yElar1xtBhAQb5UAbe6J8dzDpRiZ5hV9RgkawwZCtv97xarwsx/KOQxmx6Z/SG5rmT0SBuNk
 L6SZ6geAuABCaaeY+0amUaDA67v+dPhCNr+hvdOQpqWQGPsKXojhMWnRyliJCNf8U/UCbfuveYO
 iUvFLh93boMvEQ+rSyUItFExQJmboW1woZKPpy228igL4PITpWiqam0TdPycwcyhQTxik8YcwCL
 aFr7/m1oiWtSkeQ8jIqPjtLWWtXW3T45WDm0oOYiC0AgLp0M2V1vO9AdAL+SBxASrYQGK7/NQK8
 PTw20W0QinQcCffYQt/LAUWp1hQ22Xx+eBQLKWSPh+J1pNmN7njL6go1sVm+liduDx4YkwaoVZT
 ZKI6X1HsQSXxhiM1CYA==
X-Authority-Analysis: v=2.4 cv=UaDE26SN c=1 sm=1 tr=0 ts=6aa43ed7 cx=c_pps
 a=lYPjzR6fd3Dugfv94BBcLQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Twlkf-z8AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8
 a=tLUKF7yEiS2AIT_HPBQA:9 a=qS89K1LUDJCxP0DO:21 a=-74SuR6ZdpOK_LpdRCUo:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110249
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 17:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245663

From: Sunil Dora <sunilkumar.dora@windriver.com>

https://discourse.llvm.org/t/llvm-23-1-1-released/91760

Drop 0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch and
0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch: both fixes
are included in this release.

Brings following fixes:
81e03602463b [lldb] Fix SBStructuredData::GetStringValue method (#216875)
f1cdfbeb84e9 [X86] Fix NaN handling in minimumnum/maximumnum zero fixup (#217420)
b8028f7bf85d Revert "Reland "[Clang] Enable -Wunused-template under -Wall" (#208001)" (#218638)
2c7b58a3bbb1 Use static_pointer_cast to do SyntheticChildrenSP -> ScriptedSyntheticChildrenSP (#216181)
024b86e93451 If the address of the isa_pointer is returned as an error don't ask if it is a tagged pointer (#213163)
2bda8f5daeab [AArch64] Use SDValue to pass to vectorToScalarBitmask. (#218717)
ad389cbb46c8 workflows/release-binaries.yml: Only dump the wix logs on failure (#218810)
8956179fa43c [WebAssembly] Avoid same-block dominance walks in RegStackify (NFCI) (#218369)
21cd7726af6f Bump version to 23.1.1
910bfcd7324d [VectorCombine] Fix foldBitcastOfVPLoad reordering loads (#218336)
f54a7b77711f [LoongArch] Fix selection of BRCOND with constant conditions (#216027)
490d4ed19d16 [GlobalISel] Fix inverted libcall status check in createFCMPLibcall (#219242)
d81f5d210b38 [SLP]Fix narrow-tree gate width and extract miscount
4dea21e892d7 [SLP]Extend GEP pointer-chain cost to casts and non-root external uses
aedf7d6749aa [X86] LowerAVXCONCAT_VECTORS - fix some clang-format messiness. NFC. (#218504)
55a6a0bcd3d3 [X86] LowerAVXCONCAT_VECTORS - collect all subvector operands before ReplaceAllUsesWith call (#218381)
b085518fcd06 Revert "Revert "workflows/release-binaries: Disable flang on Darwin (#164667)"" (#218978)
e86c19d77c9d [Clang] Fix -Wunused-parameter for implicit coroutine uses (#217518)
fce01560cee8 [SelectionDAG] Preserve CTTZ_ELTS lane count during expansion (#217982)
b201342bdc31 [clang-format] Harden star and amp annotation (#212856)
5f58ba54af5e [lldb][API] Fix SBEnvironment crash when Set is called with a nullptr. (#218906)
cefac32eb6ab [DWARFLinker] Walk each shared subtree's dependencies once (#218072)
fdf0409c656c [WebAssembly] Avoid scanning unrelated debug values (NFCI) (#218378)
01efbea98550 [sanitizer] Skip hanging tests on FreeBSD (#216703)
03cbe93e71fc [fuzzer] Restrict merge-sigusr.test to Linux (#216702)
f39930bce62d [libc] Fix sockatmark test (#210655)
99cfc877e40b [C++20] [Modules] Handling merging predefined decls from std (#219151)
ab544f643b09 workflows/release-binaries: Smaller WiX installer on Windows (#219858)
687ecdc1254c Add option to format a whole file using git-clang-format (#204336)
5340f7cc8814 [git-clang-format] Don't format the line preceding a deletion (#215946)
8e1810950d0a [LoongArch] Add omitted LASX patterns for vector extend (#219351)
91d740bac953 release/23.x: Backport '[Clang] Fix C++26 fold expression normalization of PackIndexingExpr'
47bafb752202 [SPARC] Preserve inline asm relocation modifiers (#219971)
2244faf2c16c [WebAssembly] Add funclet bundle to thread local wrapper calls (#213826)
4a09f2722a56 [SCCP] Fix missing worklist push for recursive calls that update lattice values (#219826)
6b358fb914ee [win/asan] GetInstructionSize: Add some more instructions. (#214707)
1943eaf4faa3 [clang][Sema] Check exported default constructors in nested classes (#214275)
bf9e7e8d773b [clang][Driver] Link libssp_nonshared.a on musl with stack protector (#219828)
5089f145193d [SPARC] Parse unary complement immediates (#219970)
ce68f2870320 [OpenMP][libomp] Fix dist barrier arrival synchronization (#213845)
7d23f0d618e1 [ORC] Fix malformed Mach-O `__unwind_info` tables (#217781)
8820e75cdd42 [clang-repl] Stop interpreter init on action failure (#217147)
99b7b38c1b98 [clang-tidy] Fix false positives in readability-trailing-comma for designated initializers (#215934)
9beff35f67c1 [AArch64] Use NoSchedPred for SME instructions in C1 scheduling models.
f603629d9ec7 [lldb] Fix SBAPI breakage in SBFrame::GetValueForVariablePath (#218565)
5f27b704b2fc [SelectionDAG] Avoid irregular INSERT_SUBVECTOR when widening CTTZ_ELTS (#218019)
9f658ca5d2ff [libc] Disable float16 on 32-bit x86 without SSE2 (#219675)
13259bad3b48   [clang-format] Keep empty Java interface/record body on one line (#219910)
4f7718b2d0f8 [flang-rt][test] Fix Exceptions.cpp compilation on FreeBSD (#219709)
d1e3b265a499 [Mips] Select GPR register class based on requested type size (#220012)
a53c3e52ed56 [MIPS] Fix GP-relative selection after select/add combine (#215414)
d27393c2493c [flang-rt] Fix runtime/environment.cpp compilation on FreeBSD (#219705)
80062a22dc03 [Mips] Use ELF binding when expanding PIC la (#217566)
6dfe1677ab8d [SLP]Fix crash in canBuildSplitNode on struct-typed scalars

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
v2: drop 0004 as well, its fix is in 23.1.1

 meta/conf/distro/include/maintainers.inc      |  2 +-
 ...tools.cpp-Add-lssp_nonshared-on-musl.patch | 32 -----------------
 ...e-float16-on-32-bit-x86-without-SSE2.patch | 36 -------------------
 meta/recipes-devtools/clang/common-clang.inc  |  2 +-
 meta/recipes-devtools/clang/common.inc        |  4 +--
 5 files changed, 3 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 40d62042bd..9b24d79a31 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-23.1.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-23.1.1 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
deleted file mode 100644
index 1ba19bb4cd..0000000000
--- a/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 64a5c3e2680fb2a04ecba015af8eb5049c4840e1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 May 2016 21:11:06 -0700
-Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl
-
-musl driver will need to add ssp_nonshared for stack_check_local
-on the linker cmdline when using stack protector commands on
-compiler cmdline
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- clang/lib/Driver/ToolChains/Gnu.cpp | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
-index 24076d8..a7a64fc 100644
---- a/clang/lib/Driver/ToolChains/Gnu.cpp
-+++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -537,6 +537,12 @@ void tools::gnutools::Linker::ConstructJob(Compilation &C, const JobAction &JA,
-       if (IsIAMCU)
-         CmdArgs.push_back("-lgloss");
- 
-+      if (ToolChain.getTriple().isMusl() &&
-+          (Args.hasArg(options::OPT_fstack_protector) ||
-+          Args.hasArg(options::OPT_fstack_protector_strong) ||
-+          Args.hasArg(options::OPT_fstack_protector_all))) {
-+        CmdArgs.push_back("-lssp_nonshared");
-+      }
-       if (IsStatic || IsStaticPIE)
-         CmdArgs.push_back("--end-group");
-       else
diff --git a/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch b/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch
deleted file mode 100644
index df35636055..0000000000
--- a/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Fri, 29 Aug 2026 13:55:00 +0530
-Subject: [PATCH] libc: Disable float16 on 32-bit x86 without SSE2
-
-GCC 16 defines __FLT16_MANT_DIG__ when targeting i686 even though
-_Float16 is only usable on x86-32 with SSE2 enabled. The float16
-detection in float16-macros.h keys on that macro, so the shared f16
-math headers are compiled on plain i686 and every use of _Float16
-fails:
-
-  libc/src/__support/FPUtil/BasicOperations.h:63:67:
-      error: SSE register return with SSE2 disabled
-  libc/src/__support/math/acosf16.h:73:14:
-      error: invalid conversion from type '_Float16' without option '-msse2'
-
-Since llvm/lib/Support/APFloat.cpp started including shared/math.h,
-this breaks the LLVM build itself for 32-bit x86 baselines older than
-SSE2 (e.g. -march=pentiumpro), as used by Yocto/OpenEmbedded multilib.
-
-Require SSE2 on 32-bit x86 in the guard, matching the existing
-exclusions for 32-bit Arm and RISC-V. Targets with SSE2 are unaffected.
-
-Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/05da143c63d333420b99eab198e1a89c97480929]
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
---- a/libc/include/llvm-libc-macros/float16-macros.h	2026-08-29 13:55:04.771442947 +0530
-+++ b/libc/include/llvm-libc-macros/float16-macros.h	2026-08-29 13:55:04.773991812 +0530
-@@ -15,7 +15,7 @@
-     (!defined(__GNUC__) || __GNUC__ >= 13 ||                                   \
-      (defined(__clang__) && __clang_major__ >= 12)) &&                         \
-     !defined(__arm__) && !defined(_M_ARM) && !defined(__riscv) &&              \
--    !defined(_WIN32)
-+    !defined(_WIN32) && (!defined(__i386__) || defined(__SSE2__))
- #define LIBC_TYPES_HAS_FLOAT16
- 
- // TODO: This would no longer be required if HdrGen let us guard function
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 5d571e5fce..912fb80277 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "23"
 MINOR_VER = "1"
-PATCH_VER = "0"
+PATCH_VER = "1"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 0ca6951ff4..5b358f7284 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,14 +17,13 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "ab1f0e3ec52448c33e8782eaf0422504b87c7b016b22514653ee0d8fcee479ff"
+SRC_URI[sha256sum] = "ebe9be46fe8756d58c5b198ffad0fa2a766257add81a4dc52179bfacc7888ee6"
 
 SRC_URI = "\
     ${BASEURI} \
     file://0001-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch \
     file://0002-llvm-allow-env-override-of-exe-and-libdir-path.patch \
     file://0003-clang-driver-Check-sysroot-for-ldso-path.patch \
-    file://0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch \
     file://0005-clang-Prepend-trailing-to-sysroot.patch \
     file://0006-clang-Define-releative-gcc-installation-dir.patch \
     file://0007-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch \
@@ -55,7 +54,6 @@ SRC_URI = "\
     file://0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
     file://0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
     file://0034-guard-clang-tools-extra-test.patch \
-    file://0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
-- 
2.43.0


