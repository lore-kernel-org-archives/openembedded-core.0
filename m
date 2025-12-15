Return-Path: <maganuru.jayasurya@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058FBD5B17F
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 15:12:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51076.1765811525428144944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 07:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SzpKB+aI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4444652189=maganuru.jayasurya@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFCGHAJ2623297
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 15:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Bbfi+G8uvSJrojksY62HtJZozgjQsiotriQfqcz1ZMc=; b=
	SzpKB+aIMvf8Zm6Tuv/ELppkh0K9/qlOXZXSL2kDw4yboSgYMOUH46PXqGqrCAo2
	nc/SF3i9XCwELY7pYTYsHRk6ZlzlVXX54yKPSH32rQcBsi+hRdX4pdOFAjFG41ju
	e9UM9z6unrFKScUlWuhjIpA5+iaUJpyqQEbLinNSRgYfjpAiLZTpx/+TpYN1JUON
	Rm3HmZDcU9f0NCBHb06hJ6IzT+Z6esvSV1Pexv0gtFeBzez7YgW6fC2rOWHa8t2m
	9pQpEs+X4tLx26hU6oHSsr9FP7jjTAtzZ7ntUHR9BPYOaNC5U1i313UgRpz7+qFx
	EFaaxalTMu5VBn5ZghXS4A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012009.outbound.protection.outlook.com [40.93.195.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y489wwj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 15:12:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOyDj6lBbxZyjjhU/t2QK1LtDypGb70j+YEfDW/pzZM12THUyJIdVkeQDQ+N+p1CpSsGuQaheXpZL5hKod/P8CGWiLHjWEEhdsmRfJYnjRRZeDNtIBOLducdQ+mF3uVcFgrOtTcDL4psgA9xiPGnsmP4Rfogi0mZk/QE4nrOCNQd3fefRhSgx/Q7STq1fpSOIaf3iNNb7mfCp9sIFY7dgjYwJzagOLW3amKDI4hjlkle8L9hx2WX2POBSw8pMwUIXF0MT4WlqQnhxme8NZ/XsgMqr5uJM+5CuHMPjwD1dXqHSbrdoVzfkZEMHfo5q7UNVbt/QOQEW7u+rpvovJpXJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bbfi+G8uvSJrojksY62HtJZozgjQsiotriQfqcz1ZMc=;
 b=Wuq04IklTfbtbCcTpbmJuzFtB3EHlfhpYE9JcvIdgahum2uchLQP4TPl/asIgUdce5Ll+ct+yVhle7XpWI5wPBiFkwncDIiEJE9o2e2QCy44rdhTQQTPL82rNVkWK+aUYYoTI3zC0AL4FcYRiI1SGQh4LhNOoogW8EgvEUNqyFZgHeLpZaQ/IjT4U9Z0L6SFTBdWsL02sa+GMhomLBf2Odw6AKdHAJgykMN6DapiDzuSgov1gdTHxGvRUvG6Ajs/NLxBf0jbJ8e09sszSiLCAVkMgbwsmJHctu4wlD4Ymeofwi/ykLgC9wzj18lOXxkM/qIHkKGVctybc5FIhne04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by PH0PR11MB5045.namprd11.prod.outlook.com (2603:10b6:510:3f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:12:00 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::8d46:700f:2de7:c0d6]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::8d46:700f:2de7:c0d6%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:12:00 +0000
From: Maganuru.Jayasurya@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, JPEWhacker@gmail.com,
        SunilKumar.Dora@windriver.com
Subject: [PATCH v4 2/2] populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in locked sigs
Date: Mon, 15 Dec 2025 07:11:07 -0800
Message-ID: <20251215151107.2010834-2-Maganuru.Jayasurya@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251215151107.2010834-1-Maganuru.Jayasurya@windriver.com>
References: <20251215151107.2010834-1-Maganuru.Jayasurya@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0152.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::15) To IA1PR11MB7753.namprd11.prod.outlook.com
 (2603:10b6:208:421::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7753:EE_|PH0PR11MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: 556884b5-f9c0-417e-212f-08de3bec4bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QqkGfN6Mf3eZUwvr66N9hAOVZ2xYPW0K9NR6ILT7EKjZqIwAxKpFuLxGk5sJ?=
 =?us-ascii?Q?teL4/v/xpjNmPZlzGZn8hxzaAFY7C5l/HrE208jLvB2x32xe9am+xxP6F791?=
 =?us-ascii?Q?PdQJvxa8f47cKNxAaEXataEc3yZVaSaqGlpSld53TQ+iNROgnIkw/4OlU5aZ?=
 =?us-ascii?Q?mAZGZP5i9hP+AKoyzyFEiOlgPE4zplsurJYP2YKuTNaOGIaU5fi2DCzrFGC8?=
 =?us-ascii?Q?oUUtKCmpzSVzt1QB4BASGeD3/rxybXDtNxf3ZkUmoTEUW4PHCw2aYk4icNfw?=
 =?us-ascii?Q?swaVjHU73Auah2g/VRPp+u201mu1gA65ZhpXhY8PNPdrbJsGHla77xkEbBCG?=
 =?us-ascii?Q?0owBVmxsu2oW3zyewtgxhRHKqOqA6Kro9WnWI2reZ59zo+beSSnjftBxur67?=
 =?us-ascii?Q?mOFHKy3bArH/BJCftbHzCTlDc0Ho1ttlSOPjnfxtiHY04QVDZAkbnpFOApZc?=
 =?us-ascii?Q?pjN7FW9I4FuE6RL+A701y8yhiAihNyv1FqE23t9BRPbP4Fh+CL3rANJq7LIO?=
 =?us-ascii?Q?l4A3t6FCbOPmR9OkKS5KycqiGZPpioNgUym05BW8LGkg8UdBu8BdxU4TMaTe?=
 =?us-ascii?Q?rQkqcAkvxvwNjFDFSmqReScA7Y60bfcZh5gmzdj8l30BopYEkOnSCWXcVaSF?=
 =?us-ascii?Q?IPEfy+2KpEjYRjswIcQ3sVRgRaoYqmLy4otzbGRB7Ns3m6UCs6+K6QSeba7E?=
 =?us-ascii?Q?TMVz9ph1R4j25UeQ/SmJtgq7muLLye6MANE8gM3vm4FE/E28gqkW0UemWxxT?=
 =?us-ascii?Q?zZbasYYix9lpwKojZVoxruytyLlKQ2TowmSvwqVKngkQF2SzTrgWUCxI5Jzi?=
 =?us-ascii?Q?4j82eknZxxfbgW+Hl20SPJxeESo8UF0hM2OifuA6XQaMGXAyVxS8lyGMsiZM?=
 =?us-ascii?Q?ysUjzvh5nDrqF+Xrg8aZb/Re8K0dgpZ9demQjIjqKW27kCOESg09TXhZv3KU?=
 =?us-ascii?Q?vWLB4fkd/0sfreT75K/qEGSnZaDXkfPt2SkOXzVMIIeexnL4RjjwSjCjvrmn?=
 =?us-ascii?Q?gcw/8yPb1WdD2wzpYwyAlxE5EXV/EM08Eqmj2QAMMqbojq1z2B2wI3l18htx?=
 =?us-ascii?Q?FaLdcMP8/pVRblA2p0iIZlBJr85dfnHimoqOyb9wEfMEKmBh9ec+iqTWjqp+?=
 =?us-ascii?Q?wTuTLewqWKqaU7grTWKRiVJM2LOT0KjG+YDkegphEbiQxVgVN+Z3UWp+71eQ?=
 =?us-ascii?Q?Zj6z30tB03ipdWM0EOJ/46MoOVrI1k7pl71RYlJw7UMZBfi84wZ8j14Ga/6F?=
 =?us-ascii?Q?2TAxySYxVTYRfHdsizBv9/5HADxcOd5HQUGF9lM8GzZvNGDtddSbMFCBOtzk?=
 =?us-ascii?Q?OUtPCLr6BN1yptYmmuwjWC/k2iGD81bzzAydWa1C3oD4zgOw/lFt5944QQjp?=
 =?us-ascii?Q?YX0rwYt+bQ8LVGOZfbji0F28heydfwUIAabNQ8bXJECzxte0IzmXZnFYRGVi?=
 =?us-ascii?Q?qvDhkGx95Bgf7yNsCoPn4q+XELsPDMHOIyoOkti2Sqw3TMSjaxCTQgN0Rreo?=
 =?us-ascii?Q?1TqdVOb31wtdO9iqr5yqQwUsOBEguFa91GN2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hlPAH21nVJI+q71YAW1uf7l1e8TmAiD3YWtDHiZGGmGYtmMMHVq5v56sZ/Cp?=
 =?us-ascii?Q?TKIuXbHMGlJPPf65+KyMgzuTfP7+xohn+jPyeK1HH+TM8lkKCvMQWY47nVGD?=
 =?us-ascii?Q?MSHHwuXK3NE3NL7qmqH1UgruC92ALDdXM5tIkSHQqBsflEHumt2Xs5MsIYUX?=
 =?us-ascii?Q?3wkCrwl62wkv0y+g1sBMtbSPHSM+ql7oTLdh4HzUmOMa87sLmw50QWkV3Kll?=
 =?us-ascii?Q?nw90YEFxQaQMth/+NJmYczvH5zsyTf7ujJKD/guqn+ZX1N8f0jbh7l2hui/w?=
 =?us-ascii?Q?9TiJirU6lJmXWAg+7ObDyCTVHncJ1nnXwPTEtG9RuF2QeWo5eUsusd2x+OFK?=
 =?us-ascii?Q?pVw6nqGGSgTlYen0BwIFvtctAe7ske/HbFmTdAcDn7goWkafms9rhuTARFUs?=
 =?us-ascii?Q?9D9L8HENkg+fzSXZ1XnlAJuyVdXeXbAg0E2XqpemK6M4JH77v75FQkEH6I6D?=
 =?us-ascii?Q?rmM73e13WHVWGOTlYFIo1/txo0BKzBnu0CGIWUmLCDyOgKqkksn1+yfU1RR8?=
 =?us-ascii?Q?xWRzydCL9A7W4ZlWHfvxiIOQ07wEdpC9wSsmd+3TqSN/AfdCweYFoOW15ldW?=
 =?us-ascii?Q?KLL7+w/BYC4i2tPvat7Y/PJLDsRV6sdq+3o8XEkUz7v+nF9MYaUyZH+cMuS+?=
 =?us-ascii?Q?gowrpXyHrfb3q9Fy10mKWnJIagREl+IaNfwkK+i8C79Lw9F3oiX7IWOljr+y?=
 =?us-ascii?Q?8Y48iYQfaCVCSw0L6CmY4x573Ro/HuAd1Cm1nHr6hjzxIRl3h70JoTt6HWXK?=
 =?us-ascii?Q?rjxgaOdt61uXZknCS8GJaViG3HL4JiykmqEILzteRScl5QhYS42TMnP5bG6y?=
 =?us-ascii?Q?U2f/DVxN5FmqJnod5GWTjug9smKxjAPDC4CTFZiZUzl3uweIGT/CRA+hr53I?=
 =?us-ascii?Q?R4gN6VjedSGtId8JYCNGgvqXi71kY90ZI00NiqwCrmFlCzTAt1HNTEmJ5eZR?=
 =?us-ascii?Q?6kPIOMFLXwgStfy+vHdUrpF5D+wJKRdiTcBOR1dN8MrJTTc30ZEbE15kQU+G?=
 =?us-ascii?Q?Xl3GfRB2h9OArdprYiFZDZMdcgsY/3UOuMw8C0W2hTRRDdKEkZBFRfSv4bEf?=
 =?us-ascii?Q?SBmsrwxTwNubxvXuyB8vjKjlcK9pt12ISQ7c8/qqTWj6Idexe7YDGSsRwgn4?=
 =?us-ascii?Q?gd5Kdm9fsc86FWM+FiPUgcsrCoKxWPXH1fq0CJxv4fmJ4oRIzMYQDwEkwAME?=
 =?us-ascii?Q?3B2D2JdqtSXwe7XWvuLJuliy4FlUNdea4km/dckGR64HxofT7/0KnwDVqU54?=
 =?us-ascii?Q?fMtI6FAxUwtgvUG32Y+kfkcau3RC58CbP2E0yTxKp0Vr9R5sHWU/IlVOosuJ?=
 =?us-ascii?Q?fDuP1qBAmKDj7uvRy/v1Y7ubftLDH1U92A2WbGotEwd1RTwYPVNWa5NyE5ef?=
 =?us-ascii?Q?BoeZEO3VbGp4lvf1g1weY/ffC8Btmff8kzHOoxFQx9JZmaodSebotW3qxGcp?=
 =?us-ascii?Q?MNLaEa54J1wSjtZZCaqDIxy0lJycRvAU1ffmWB4vBY/YDmpgOPjVw1xgl6Uk?=
 =?us-ascii?Q?GVVOW8cXSVEcJcjUidNadDrJUWzYDNnFql/FRU4ovyac1Oa4E2lLgBOOlgIt?=
 =?us-ascii?Q?sqKwZseR7k4axoCcpEKui3RowsXww6py831j0nMn73Etb5Wd3ocTqTE2vRJz?=
 =?us-ascii?Q?ZMH9T9itPxAQLj362+ArfGE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 556884b5-f9c0-417e-212f-08de3bec4bbb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:12:00.4639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWw7Nna0tJhgQRB6W5Mqf9vLukgxthVNgWxCxxuhaEwBEuMewoQLVN6XJ76Z31W4upivXqmJM2Pu//ieH/9KhLf77vuu15SrwbSglVycPBHzt4oaN6eFSjzaEl98aXCw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5045
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEzMiBTYWx0ZWRfX03dtNcDJNG+v
 44Qm9RSTgq+ddV2FQ+M+sccWIYj7IhpkoSLb1pVeQyD7tJv6ScJDvSllh/MAJMO0EuDqovBQeCn
 mSSDucC7MUypDLZd4+jU5KfS+N4S5eI95AOAbnwp+qR619zT5Qr5NexDtaGDp9lMSd0Ai32A0iZ
 LvnwKarFt8fkX/SW8+C2Rh9+DWHl1vxt6ozSFtDMtdrwiZpHGrIh9nI9YVeaItDvKnTsJY5QrcU
 qde9NECxLhGaHsv9ikGiMsSzfHyUKutSd+j6aQdNGzL8xq1XpvXc/gRwDKNvI3Y1qB3eiG7vGmd
 2Up1PkoGlyK2wgFaNcfEx42HtwakWOneDVgNUX5ihxadGpQWAwkK2+lH9fIOFEC8UyVfGDQNrg7
 Qe8Xm/l6KdzUrI/ml1Ox3iJ8WwDI4g==
X-Proofpoint-GUID: TA0TXQlOtQRF9O2GACP4JcEld16_78jj
X-Proofpoint-ORIG-GUID: djDZ_ecWK4DIoaoJw4l9KLf4eDLZtADY
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=69402544 cx=c_pps
 a=BFxEMT9/7ApEM+sm6hv7VQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=5hl-ExYLI99A9eZlSqoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_03,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 15:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227740

From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>

Fixes [YOCTO #15853]

The filtering in populate_sdk_ext.bbclass was removing all image targets from
the locked signatures, including the main SDK images (SDK_TARGETS). As a
result, their tasks including the image SPDX/SBOM tasks were not added to
locked-sigs.inc.

Without these entries, the eSDK lacked the necessary sstate, and the installer
attempted to run the missing tasks during installation, leading to unexpected
task execution errors.

This patch keeps SDK_TARGETS (and their multilib variants) in the locked
signatures so their SPDX/SBOM tasks are included. With those tasks in the
sstate cache, the eSDK installs cleanly without needing to re-run anything.

Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
---
v4:
 - Split the original patch into two patches as suggested.
 - Improved commit message for populate_sdk_ext.bbclass.
 - Addressed shortlog length warning.

 meta/classes-recipe/populate_sdk_ext.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 2859320ddf..2838ca1a03 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -460,6 +460,15 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = get_sdk_install_targets(d, images_only=True)
+    sdk_targets = d.getVar('SDK_TARGETS')
+    ext_sdk_target_set = set(multilib_pkg_extend(d, sdk_targets).split())
+    excluded_set = set(excluded_targets.split())
+
+    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in the locked signatures,
+    # as they are required during eSDK installation.
+    filtered_excluded_set = excluded_set - ext_sdk_target_set
+    excluded_targets = ' '.join(filtered_excluded_set)
+
     sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     #nativesdk-only sigfile to merge into locked-sigs.inc
-- 
2.49.1


