Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AF0D6D224
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 13:44:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42218.1766065486113393683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 05:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=e9bqSl0/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44473d6ac5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDRxhR1442866
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=5NZQQfrmlzwNWjgNTK/JUBXypEvVZIcXWIA1i+V64Zc=; b=e9bqSl0/SeoJ
	oIJbRG3nh3NVPB9fLARRSAgq9uLt1kphN0PNbkS9KWCfBMMQmVty4PO3J3S6U2uL
	Jv66JMYPaU3/AqlwWIprTnI4k7nOeDxsDJApNIatsw+iFAKCoEMJmcxufSZOYaK7
	7Y1Py32ekHKEj2cekJQwCGR/HqlSeZx14VZv+Y+inm5fX7QBfpLFkUqTxLXM70pO
	wKsog7pNFPToqsQ2KSfJCTJbz2gdIy2XdtplwpZiwD7P20duh+eO4m+DL5nTyfH2
	SDQxd8Io68cQ3eL5TlrJgcv95LnOuBETeQj3mgY1jlkOQlEzEx0FGCL15tWJrL2R
	TvLXjymmjA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0bt132-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:44:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1C35bntRer/EF2PVQQMGKQxB8jJ8yMVi4oNetfsmrDQnzKse1Qe9t+1asKhN6MjYuy2a8ezY/0z2f/LUk4o2FNS36xpemB2JgJfReEkK1qlEXCtudtmUs+Cah8iUWNvctqNnc91eioVv+lTN8k0tEkl77+InwcLfuh8UNCP03+YGMBUS2VwB1B7I2c/k/uBEq/1CPpRze5sTPCrHAfxHwH0LXRpEC5sYG1W110r8F7cZDPHYzY9NCm/jN/hD3r55cS1JVDgObmCPH3t2eeYfDCl0UQZbZNI8BzA4tFZaK0AhPMPeEHKG+gvKZ1nPa2G4BUPBYEB7dn0+J+E+QCTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NZQQfrmlzwNWjgNTK/JUBXypEvVZIcXWIA1i+V64Zc=;
 b=VKZpUVcoW5SXGjzednnMW6qF/r1SFNWgMivL57ef5q0HuIvfZAge4Y2ZO+thNCb1oK+T4nw7a8CXL+majIzjqePKXXT8mAsKKgmtS0HAuRD42n5W8D6lR/I1rFUhxM39+EBEI5S3P2s6hrQSBJgYMbvvWE2PQcR+bOPsrNWEFRsY1MCydOlLn4wS8yte3KfbQpFhC8jru34NWvI4VWXTsxy9BeQD/+eob26pBDfhy73sJyfxzCwKay021uJTSS6qacDKIh6htOQsxoYOXDQzixW8UAptHwNj4c01Ip9RX8JWGme6+3m/uOjudTJ4hKn+5MhU12ElSKIwpgbivS4CRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB7030.namprd11.prod.outlook.com (2603:10b6:303:22f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 13:44:42 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 13:44:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3 V2] kea: remove keactrl from package
Date: Thu, 18 Dec 2025 21:44:26 +0800
Message-Id: <20251218134426.4187527-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218134426.4187527-1-yi.zhao@windriver.com>
References: <20251218134426.4187527-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0174.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d673092-668f-403a-4025-08de3e3b9924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qNdi8k/a7cdk7J7RO7bb1izJForEatK/0v4UsVShL6JywEdZXJ1CvEtHYwsL?=
 =?us-ascii?Q?4mhVv8oOYvvtxFfxhQsKhMq8gseWlCb/HIkK1Awp55GEzisnFwc+X59HduZM?=
 =?us-ascii?Q?6s5yAsCzMWU74HhT8sJNcouCA6MfknBehM6HmC4e7287zyt8kzgrvJ+vtE6T?=
 =?us-ascii?Q?MqcX2v1ClVklklmOYsaTlHfyYw9amua1glh5FnkIp7Tm8SMrJuUgGT/wAx02?=
 =?us-ascii?Q?24rNIAzJuoucRw0zLBVqK80+9M9oBtu8fAgcyXW3562xigjrpNFAQ6VTfGKi?=
 =?us-ascii?Q?anwXQa9wyugKyYsLHB0IDnTvM30AVRULbtLDnkF83AKBxouPj3/JRSulns3i?=
 =?us-ascii?Q?6W3LTP2hifuV/Amzt8L60WmnU017m0MiY8gaBWpbrHHMB54n0LgtZLe25V4A?=
 =?us-ascii?Q?ztGeIqnb7hIehbxc+BrFxYHq6OjWjxjNGuCx+M574vpuaFmP/DJeVj0p+dPl?=
 =?us-ascii?Q?DfsIyc32qyLcjL/VIB9BJ8l5pwMI94hFIH9PrKAUWYZ/Uc9A4r75IoD7PbFq?=
 =?us-ascii?Q?EDlniLTfRWFUB/M60AiFcpKrhmelMmoEnLrIUrjwQPXCddvP0uILlE9yj2I4?=
 =?us-ascii?Q?66lG8ueW4iyzLltSs8t3W/tmm5X8/4bX1K8LQwiWMd+QL8jWGEBzCLGVrGHc?=
 =?us-ascii?Q?uclwZGwqLXjWJfZ8JXqRayTpl7CC735Teu5uF4krKv0ZAeDI/WLGIcU5Rfw7?=
 =?us-ascii?Q?tmt+1UQRaDFc4/0xCe1Jq8Tfs+rIICHdnHMQOJDC4IhAK4SURSyIbnm9N52H?=
 =?us-ascii?Q?p9xzutyG+bXXktBaZ5jL+ETzWIxMotUzS4PEaJM2mq/+rb5/q5sWHUH3hgpi?=
 =?us-ascii?Q?Iiu14gZLkyqMQdWjmoQ47lQNu0AD5HNyIExDLQQe0XWfB5n1l0/ax1NNT2+L?=
 =?us-ascii?Q?pfo5msSi6b3Ydepj5Gx3ru1m9JXVerzPobSUiDuO5IHhKNK1I+H6DdoRqwXm?=
 =?us-ascii?Q?vdO1XE9LUrBx0Ws/RuUhh5SJwqp8CtYpeNpjRv3sjutOA5jpasiRyBGEo7Ex?=
 =?us-ascii?Q?N4m/BeX94G4EgHDFrSF2WtG6fcvOStMBI0BzLHfW8fJKKOjSk3lumH7lEtSc?=
 =?us-ascii?Q?4a1NfxiIdYQfXb+UYOdrfkKQIwa5Oal8GWUFNpJaddhGgFsi4Kvn0n/cDxPp?=
 =?us-ascii?Q?YsLvaOi3pFCAPGLp495WbuNfCU7IrhJatFAWnyRuvgwzOquQWZyRH1lAGvrK?=
 =?us-ascii?Q?dK6VVGu1VF7Mf6v75Up0qacb3zkvmO5uK+FNPYlNsF5Ssafk/45lFV/FzvDo?=
 =?us-ascii?Q?Q0dxajM3muyDtcqtwEbbCOdhEHVJnDzF8hShSxyppReilYY9E13MBQVRgEPQ?=
 =?us-ascii?Q?1nufLjSTA34Qmt7T1dFXWs8kerFfzF68PJydFAqCNmoFipfzelApus6HsI/s?=
 =?us-ascii?Q?eF5uGb+yoPRhZofk3iQnmOMaHCvDZRQrAursf7C/Wm3e7NGOqb8d6gxwuk2s?=
 =?us-ascii?Q?rzmys70saks8sd5qWLVUCMgkKwJaVt8MVBZbaPGUSU6FHU+FLf6K9g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BhrKfd8uo6Nyiu6r8L5WrJEP4LrcdeZei471LgCUcSYoQ77EVtGufKqltisi?=
 =?us-ascii?Q?wt5dOw1aOOrRaWsvh+iuNR3T1SgvjDSKR+DhFjUAoPXy0ml3J4j9F0v/6EEl?=
 =?us-ascii?Q?r2O+W3poazTVsXtT3Ar7mT24qVnKuyRK4UUm5Gbdq77lVQ5njKsiVO9RhfdY?=
 =?us-ascii?Q?QSaM9QjI2KuI7fmUtsdkqBxkzxgLJnheuh+J/3K2xGRagzdQJ308KN7ok6E8?=
 =?us-ascii?Q?JjzeoqZ5wGL20kwKNzlGPrwnitwdWgExDash5N78Uya5KkQS4oPxGy7y7xJc?=
 =?us-ascii?Q?4QAmKgXZS/R/qj+bn8JSUQJYVv8Os7aN7ZCc0Bf0HQBc/5FxQMj4rq+GQk98?=
 =?us-ascii?Q?70G18zJLIQhTHZsOtWdlL2vXASEyWarmQyH/EUHhs/eZYFlty3gBIHnbiMKl?=
 =?us-ascii?Q?Bv6gPV+blwZO4x+bGWShAxqaBRJ3OyIbA7uPwsXF6SWfc1oHcSUeQGM0N7F6?=
 =?us-ascii?Q?vHlMCx/dgbELg7PvzwZWAFDC5VOGkYE+J49XZXWGO1c370qzOPx5gR6558nY?=
 =?us-ascii?Q?z1RCnidtqZV0MStwN0k2AcgKpgadwTTyeySn6nBO7/BLCbt2mjV2eldUQsJk?=
 =?us-ascii?Q?3FHjRCO9xdPY/DErRLfmft9xnPf53G9rywWngzGLkTdGAPaouEyZeynRUnV4?=
 =?us-ascii?Q?I6mSOqBOniWPr6MGBPKqhZjYuHIeROaCD7b0yIG5vWi2dytA80HRnGN4wjVE?=
 =?us-ascii?Q?cQzttGk1ioz97sxswZHaPnqrfIU298KCY1Ha54lkU3MqPYQPI8zJibJw9djy?=
 =?us-ascii?Q?yjZWkT7dYtr1SJQ2GBoOY3ovJnLYLAa8TgtRWCmmvK6I1uA/qFA0ogz+j1bq?=
 =?us-ascii?Q?T/D5nL0hqmqmTNgLIEpqn991CJFtK7Jl0wi1mvOTvBX8UoPpR3XymQ6y5I44?=
 =?us-ascii?Q?iTWsYms1EiVwEbGcobi9UsDOGCxAqZ5Mh4oxd0j7p08dFaxeB9JflVmIXlVj?=
 =?us-ascii?Q?UFdIJQxKahlnO8UpPuFZ5MyBTSscL6zTWM1ful1yWVHI9y5BPp3e8OrSbMvv?=
 =?us-ascii?Q?S+PH9HG7bReCZ57dp2zdwUi6sEauNg8uLajgBDQZqPadOEm1MMvvsV2y02Pu?=
 =?us-ascii?Q?kCgGrgvJSM+9JBz29A113i0l7PxfFP9L4MYktaehdRjjMfN+t/+AJ4sZHOUc?=
 =?us-ascii?Q?j432mfWG8vWz0c8UkAuZIFauERbZTNpn1xJVZD3fGgz5r2Y5A0IbkuTrpGvI?=
 =?us-ascii?Q?w0wPTEe7guk2qYtIuf0hjZahHngM27CkwMx638bBq2s2RUPWtPCGQyqlwb2X?=
 =?us-ascii?Q?TKN2n8Mfk+OtpZlZwyl1saUteeq/pueI6YJWKt7FCUUdNmND0EDUBJcQLI5y?=
 =?us-ascii?Q?6zc8TLoQ34sXoXJ6iRTf7sG6URzi93p5qH660M91zazCjXAmos3M60xgS6Y2?=
 =?us-ascii?Q?MAqRQiFBhM6jtes1P4JZk8ydEy3KgzxhTDMQwGIHQYqe/ew5KMdm9yYuJsax?=
 =?us-ascii?Q?RmUPR8gbXtD2nHVNkrGNuYSBr7IVmhnlo3tPiB20SaCUrpy49Hdx18Rwf5ri?=
 =?us-ascii?Q?ZDWrSCCpBnWtvOX8Wav1ztSiJv1gMhp2/Fls4C9Pu9j6MCfByz9KhHp/+dlr?=
 =?us-ascii?Q?bSalwSStfjBRh0wnBzdnEUD8bZ3x5iXGBD8QQrkF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d673092-668f-403a-4025-08de3e3b9924
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 13:44:42.8060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cI5ncY3i7rpZsyczu2Hd2e4x6f2F/QpjJ3x2dn+hrQ9MZUic48krGpGUKWElK94mtq6trqyu3sNvy78pErtdvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7030
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExMyBTYWx0ZWRfX1HcUZ4gHn0NC
 6GEBlidfeFKLB5xvbSpjEr+GA9pMg60iPvb09hMKYbzJKrjM3ADcX7dh5TTUJV7RSEK2Bjr7Xrm
 TC4YIgcuwEoaJycUniWccIqAQVTFjJLN2WVNfeoFtw24VLzbBlBtd5+ZURBRcPW9eL7VQQ7J3hM
 sKm3KNkwhSWzeLDb0kCRu1jrNTgRJUxnguhK87iVG1uCN1RrZJBQwrRoDEzQ18vtZcepCBOpUk9
 AbqZp4mMWRxwj6GSh7pL+Sr4FopoYW32NoqVgt7SXOKbICjH3nTe2An0DeiCuMU4uwNW8UozOOC
 SAGxfLRsUxElFy+hQRtTtCV58ofmcH58ZOKZ86MtdQwbqgzFXyMnFlMtv5ZEDYkgI73VZYqktwZ
 gmCW29dIiAwRc6cthXQRHTo95+kSKQ==
X-Proofpoint-ORIG-GUID: JKbOV5yB163sV7Gs0d1ftcNJ4v_a9uEh
X-Proofpoint-GUID: JKbOV5yB163sV7Gs0d1ftcNJ4v_a9uEh
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=6944054d cx=c_pps
 a=+CNvbeBFiKBwJ3WcPfu9pA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SCo1hh1FAAAA:8 a=UXIAUNObAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=7CQSdrXTAAAA:8 a=IpJZQVW2AAAA:8 a=zBe4X2LmVUuRWWPHscMA:9 a=Hti1SrPgC-EA:10
 a=nwb-CePKZZm3gL-ai9HY:22 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228124

The keactrl script is used to run Kea from installation directory and is
primarily intended for developers[1][2]. It should not be shipped to kea
package. Remove it before packaging. A related patch is also removed.

[1] https://gitlab.isc.org/isc-projects/kea/-/blob/master/src/bin/keactrl/keactrl.in?ref_type=heads#L10
[2] https://kea.readthedocs.io/en/latest/arm/keactrl.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../kea/files/fix_pid_keactrl.patch           | 30 -------------------
 meta/recipes-connectivity/kea/kea_3.0.1.bb    |  7 +++--
 2 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch

diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
deleted file mode 100644
index 9cc91bdddf..0000000000
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f5125725e4e2e250ccc78a17a8b77431100e7c15 Mon Sep 17 00:00:00 2001
-From: Armin kuster <akuster808@gmail.com>
-Date: Wed, 14 Oct 2020 22:48:31 -0700
-Subject: [PATCH] Busybox does not support ps -p so use pgrep
-
-Upstream-Status: Inappropriate [embedded specific]
-Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
-
-Signed-off-by: Armin kuster <akuster808@gmail.com>
-
-Refresh to apply on top of 2.6.1.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- src/bin/keactrl/keactrl.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/src/bin/keactrl/keactrl.in
-+++ b/src/bin/keactrl/keactrl.in
-@@ -157,8 +157,8 @@ check_running() {
-     # Get the PID from the PID file (if it exists)
-     get_pid_from_file "${proc_name}"
-     if [ "${_pid}" -gt 0 ]; then
--        # Use ps to check if PID is alive
--        if ps -p "${_pid}" 1>/dev/null; then
-+        # Use pgrep and grep to check if PID is alive
-+        if pgrep -v 1 | grep ${_pid} 1>/dev/null; then
-             # No error, so PID IS ALIVE
-             _running=1
-         fi
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index 6b07ab8a4a..61b6158de9 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -16,7 +16,6 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://kea-dhcp-ddns-server \
            file://kea.volatiles \
            file://fix-multilib-conflict.patch \
-           file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            file://0001-build-boost-1.89.0-fixes.patch \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
@@ -86,10 +85,12 @@ do_install:append() {
     rm -rf ${D}${datadir}/${BPN}/meson-info
     rm -rf ${D}${runtimedir}
     rm -rf ${D}${localstatedir}
+
+    # Remove keactrl
+    rm -f ${D}${sbindir}/keactrl ${D}${sysconfdir}/kea/keactrl.conf
 }
 
-CONFFILES:${PN} = "${sysconfdir}/kea/keactrl.conf \
-                   ${sysconfdir}/kea/kea-ctrl-agent.conf \
+CONFFILES:${PN} = "${sysconfdir}/kea/kea-ctrl-agent.conf \
                    ${sysconfdir}/kea/kea-dhcp-ddns.conf \
                    ${sysconfdir}/kea/kea-dhcp4.conf \
                    ${sysconfdir}/kea/kea-dhcp6.conf \
-- 
2.34.1


