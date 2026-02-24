Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CA3EA4FD8
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 01:48:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11077.1771897688158058427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 17:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Uy73qtZh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O1MMpQ424278
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=DY0/7DBW3YPdVnV9dL7zSSl6XMlCs3cgFH2l+/oFjlY=; b=Uy73qtZhM0Yd
	4zPOB1Uf0sn65D5sE5pW+DoMLETMQMFPpIFo3bJoRXvFvecYAHv1DorpEfvUPPxR
	SyKBbxHqgDPR+6WmLGbZFKqn7htNRXfsK4FHHvTLdX7/NnbGxBK8fradNQcoiGZh
	qGug+KXaHpLT5m1ESnEd/W8xypaRTdWKjR3fUSIU7mEXA0qPFICgp2Ns+vwYqEYW
	D2dR4RpJC+0tFVnkcoUVUR+XXfh9/UWqpwYq25vbgfr3cP5LZxHUF+otEZr/F6JT
	eNiRd0ljilb8JkU2wAc2AMHH+ukaCxc7TP6XJCP6u43a/pT0gDIZ4s6lVd8wWOd7
	yiu8gwv5aw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013057.outbound.protection.outlook.com [40.93.201.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf3p4akad-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:48:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCxYLDIAmsqLd2Ex3R7zrSr7Px2cgN7ldx1+aY1Jk5FSygWMyHAcAWzHn0o//WO6xnSM08DuuNoOXfj5sryjB4R6VGHB8VR345UMN7gdGIi500+YrPXPptLdD8z0rjWY7cZVpuNQeXfE1zqn06EulqcwcCzfe+4hWH2/Uxjec9ndAnW8qn4oETH5QfcICiyaQCKVYWY5JeO+p6gIHgKwXEe8Cw0kEjY4OeT29jmFlIj/DhQVrEMdDJNihcd4eEFkxEcemMStrELVNBiEcgFMGVmEc55XLNiNg9wIbHY47f1oddCiDxVyeJHVtvdxmBkgtcEEUTX2NW66QyR5ZHhtqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DY0/7DBW3YPdVnV9dL7zSSl6XMlCs3cgFH2l+/oFjlY=;
 b=KqXMAU9Z6j4HdoinDN2vmQEpBkWyqdPdHg/VHnim/QO0w6zX/3/zfkmmC1wWM4B6p2a8dLu+/foJnRNOAEITJuYflemQWir0tzH0vf27/q4HAOunJ6LflnfjTtGg7OKoaY84S37929M9gyEyBC4NpEFZTZjp4HkJgUpErTQu40lbacNPJvCXFvGj3GuLjrRzN3MHgFm3chxngq8ordeve0kT+A6dINjwgtDizxGu0lWXkB3SXB5RxnNaP9fY2Q6x15usJrbf98I6O0n6uSKvuBAstfVuCdTeHLHfP5oY8ajByhA7x3E1gAcrpoNG4eQ3dRHxVYDBdlie54Km5+Am3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA4PR11MB9393.namprd11.prod.outlook.com (2603:10b6:208:569::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Tue, 24 Feb
 2026 01:48:05 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:48:05 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] procps: support ptest when TCLIBC is glibc
Date: Tue, 24 Feb 2026 09:47:48 +0800
Message-Id: <20260224014748.3336195-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224014748.3336195-1-changqing.li@windriver.com>
References: <20260224014748.3336195-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA4PR11MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c0602d-230a-4946-dc94-08de7346c097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xvqr7rsTL9LoxOdPj9AkjiYeFku+bF3FBRFthVMni+b0VVVeHEPVLauinDMr?=
 =?us-ascii?Q?pSMIhIC0eHWvR9GXYG0sy19CphpTdD1+MtQEUSXHBDG+rhKiMX+XnuHmB6VQ?=
 =?us-ascii?Q?dHrW3yJOKYaP8cbUQCGXA8g8ynPo/8zBUHI/CAXJ8ZdnTXMXvHKUTBTe/eYG?=
 =?us-ascii?Q?f83rFdPB+lMPgDn9LtUG149arq16+fBaS0EDV1pKUBF63Jaraj8N4lFzrcDj?=
 =?us-ascii?Q?LGiGM7ZOb82aEc3xvBfAKEveCsMCa+Ms8NyUFy6A5INdoLfu9ejYk2Z6QvTQ?=
 =?us-ascii?Q?oCaeTXxKrm9ply2RecW+NuwevR0XaVp5BQegL4W7MhgPS/8zdSLM+G7+m7ox?=
 =?us-ascii?Q?ejDTJ7bw3BRydTFJ1IEsMJsbYMaF1Wor7FHDnsPmF5zNpFI8E8FB3NWLH/yk?=
 =?us-ascii?Q?VoiSSkS/jppwBUev8mssHP91Zz/eFUAYAuA1nrwUdNp3NG6fdC9KvBUkp/5T?=
 =?us-ascii?Q?MC4ALadcgA0yPfhMXn0BXZq9ZlD0B+1y9EpPDXxmCTzJ9aq5kUWPIVlLU7hx?=
 =?us-ascii?Q?+ERd8gUmKijfyDt+8Ps1tsBW3XuQv0X8O1fCNnDx1NXlpVZhZRhoMgvxbxxk?=
 =?us-ascii?Q?ABNHlGoTr4u5F7dpSAGyGXvfCZArOukatBmIerw8TMGU+ZVenuMhgjtdqxIs?=
 =?us-ascii?Q?9GIVZfIkjxEwyEbYdYfT348ELEcwznm2Z3T0rno/Gy+P0zqSHNR8SEz3/SQa?=
 =?us-ascii?Q?lDQ/8jYVdh5QzR2tl9NIYnDn87iGBMUuacIQrTpU9Wn7hf/qXhfDEEFdFG/1?=
 =?us-ascii?Q?Kfpv5mEOhmYwYQL7A3096cr6G6LiY0kkU9vG7yjBMpRwfKl7NtqsKQqGvGq8?=
 =?us-ascii?Q?GPDQLwYVHhe9H9AadvAJW4QRWL9tIT5sk6JAK+3XUH4xsl6obXxKRNSjOx++?=
 =?us-ascii?Q?0GPn6n9Nh8mQNbDP+VC0bm6zJW+b+UodkB5uuW9Hb+wUuoKXQjRS/eUrsjqh?=
 =?us-ascii?Q?9NalLEA2h4M8jr2j5GplQVAFKqH0+l3sq/JK+f05Xr41SNQcQOX8eDQos02y?=
 =?us-ascii?Q?MIQkG6AjgvXHkL4C83nPf3IxMvvSzvv1xOXxB4mm6D6bkMwXKx4xMZos3Ek6?=
 =?us-ascii?Q?+TtkrPXcTgy4Nt2kTZwYDI44NglkH2ExEq0+D8shaHKTfDS2SwQNIMwRJgpD?=
 =?us-ascii?Q?3BXRYrX6EIdw8QIOUEgSE4d/duKZ/jGUCswxszBQA8AA7EO9Nc3RH8SZtB/n?=
 =?us-ascii?Q?0R5QjNAlZ7R14llJd8vJoTDmpXX6YGQujeqCLmV3c0k2MPh/BlNKPJ35SNxR?=
 =?us-ascii?Q?xMM1Xi/xTNUdbVaGkdXocfb4Zn9zJ1B02CDCiEdvBmOAq54fkhqWyYRpuTLy?=
 =?us-ascii?Q?9/387c3vszKus8FvivuGK3URmu5O1VrAs/27h06QV3Me9hPnpPOOdPWr5lua?=
 =?us-ascii?Q?qze9TQ1M9V9jEjcOX7m8GA89jbQOMHbbcCn0s/kJr16I/XaGO3RTb8S6uD2d?=
 =?us-ascii?Q?/PqjIfirhbz4uKjGLahVW4LwFRXZwvMXRODzmhldJbQZAlFLQDg6Goh8s8by?=
 =?us-ascii?Q?FbnKS6VvoWz19aZh1p1ROGgqwC9QQHxkKc3AKmotOK5b03Wo/2CQf0A6TgLc?=
 =?us-ascii?Q?9kmqgKXzGnINTkScTJ6697HB9l2edOad/DzvAqX2bqqWgcfWayFs0wsQoNZO?=
 =?us-ascii?Q?VlTR2MstC/8DadcCjC05mdU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nQw6LsLfT49hNxO6UAUDHjEJqX+IzgsAG9JTRaz6JzO3HzCI84sksRsLv8kl?=
 =?us-ascii?Q?uG5KFuavtNVoRHgujCY1osJs/MtcYgQNHe+tt0lJJ6TvSiFeo+2MqrG05uS4?=
 =?us-ascii?Q?azR0wjG4eEM/eJcVHmWnFSegTR6nEulK78/G3bHx+uNcwqhNG8fh3ep9Swev?=
 =?us-ascii?Q?aY02TUxNLbxmqbSXZIj2Yi1tATAspbWW2p3KxrzLx9d266QmsAsodtOus+0g?=
 =?us-ascii?Q?f5KvNFiha99q9pDTQwCxR5hKHeAvkdHVaMvklIIIWw7lT47z1wkSr8G+TNh7?=
 =?us-ascii?Q?1uxy2I428yune0dwl2Kzit8IBt7a66MjGVKlo0/Q07Djk1xSovo7J3m6VPIF?=
 =?us-ascii?Q?vZDoRHD5YOvdlizwBUENajNGxq5yFyckaNRVYrS/d+VwWhhgXBp4mKS1hrLn?=
 =?us-ascii?Q?9xvPLPnCfuD2E6tmMA0RVCIOlmhpAn17KoS5A0Oq0IsTOa2rHOQ/AApPDX59?=
 =?us-ascii?Q?0hV9ZpYKjbXFWOJegAEp+HaMDBuEPRj7V+UaMUAlnjWI/4OT6WiwUgdRVtQ8?=
 =?us-ascii?Q?UNgUK8/LwKbLKWLuJWlCJnGPyWb0g4VO5Lb8N/HHpFdOsqc4P7GmmibXYfCt?=
 =?us-ascii?Q?xr9sh5UIR4loXLvBlnuyRjGyxR7n/KtI34G4SRCF3ySfOkitNCY+qRtsP01T?=
 =?us-ascii?Q?cHsgKFwq3lCtml+ZhCsZIXFeZ3BfNSMdy9+EfnN6+cElXdgf/udL4GbXveY3?=
 =?us-ascii?Q?1Cs5TFBCRaXVBf4JpoCPSE3BqxROfGjEmax2N0/CThswaj5WAp+KojkMULYQ?=
 =?us-ascii?Q?wDjud6w3O8WVDJNgle73GJI/Gc47tFxpcDYtYAXsE+4W15GEwlf38sRLgqj/?=
 =?us-ascii?Q?3it3z/4wAkbfBOQcLvPsbwg7J5CDjwmULbDpkllYAUmEpuujeV/WTWn1G/hO?=
 =?us-ascii?Q?YSvVqFekLR22smvrJ9lpSj/k7wMUXevD4UmqHbXhmb5JuKMhFtar8TKOrhdD?=
 =?us-ascii?Q?Szk6siD7a8qob1LpYxDin50BCTDHfWgHKPq3DvbmvYXqs7mZLA3sboBdVMMN?=
 =?us-ascii?Q?yBtAzmjL42dPb+k7xWAJr9j6GkdSIqdeYhnu1nSWOqOBMBh1bh8DS3EEtoUz?=
 =?us-ascii?Q?dnCY3a2RqHkzO7sGaE10e3C8EaKdX+vFk6m9OD3WFG5gIUOOY95NgqKvkuY8?=
 =?us-ascii?Q?tdao+KuaR24fdLWtu3aLjSYJFiSAxC00Q9YO55++6N2mVEaLSsmNXAJ1PAzh?=
 =?us-ascii?Q?Pcl15HTOo9s7ABsLKZrKa/nRnUARluvy4VgQ7aENklsS+kyIuoCjn1Xcz6Vo?=
 =?us-ascii?Q?HsH+gJcDSC9a/KWorYHoE9bIWgt6vPdP5mOIJWQqFIr3MRZJ0HinoY1oh8nd?=
 =?us-ascii?Q?5EC8PDXm6xUshO+moCkQNsqW/l6o4zsX6BTglAAcJmHRStSiFNQvnZPr+D+g?=
 =?us-ascii?Q?/QPpm7MTDsxS3WSx0AO2KQdfuzPsFtVILqal9dLRyG+9kt74cgaKNBd9dCiU?=
 =?us-ascii?Q?jaRhmOxLkQGP/LrPT5YAggqnLpRf9vx8BqkqiMuy+VMnLdCLxnYEBLmOffIl?=
 =?us-ascii?Q?YUG3CFWwQ1CclAEnzpXpE4WsFhweTzYHyLfLszy7U0tmDNf7WWOQG3Pzq+WF?=
 =?us-ascii?Q?0FZgwNjYAwOWbHa3OykDkFmT48VBTiYHl2nSj6l1khi3R9QII0lSt8CCoCqI?=
 =?us-ascii?Q?I0zFdZVcUd6+2UsKrwZTMIMcYHq207tlZh781SkUK3bHdsa63tAz4qtPQJ5w?=
 =?us-ascii?Q?dEms9skuDAQ2L0nEW9mn7tswhk88Wj2BBdSLym4ihN6c/82aNvNTAkkke8KP?=
 =?us-ascii?Q?x/WvaelUQAGkHi1EknW5MCv8RiaJNx8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c0602d-230a-4946-dc94-08de7346c097
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:48:05.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yq6yL+JAH2CvhxON93llWtDtUQXB/zke6xZlXanE1hq+Oj/ADcmv20RATqR779gFsKcxfy9aJv2URBvbW5SRdXyTExPDzVIZiplnOcbPSFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9393
X-Authority-Analysis: v=2.4 cv=V4xwEOni c=1 sm=1 tr=0 ts=699d0357 cx=c_pps
 a=+XPUo/5NTXuj4we3MZHZ5A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=p0WdMEafAAAA:8
 a=t7CeM3EgAAAA:8 a=jzd3iM5pAAAA:8 a=2UeFF3pVGNfi5kIeiOoA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=TO2bqnfdc2VIsZqNzVeZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAxNCBTYWx0ZWRfX8G5bO6Wbc5jT
 HVM4f0YXYvt7h7Ol7Jmv5beb+QZxJ33mbD49RJVHiwnBWY5Q96SKSHZBExliB85lnbs0VgTq30e
 uDuPF+tVoirOMso300G2oWT3WMD6PbYmKfOpiDkDznT36RD63LHSlKgEGkIfG30q+CrHTNAo9bj
 52KylMP+f5SkaakHfAQlFUMFN958RFxFaDoVCPFm84YYBtGZUlhwkp543Of6GXxGBs8lRAD0INJ
 0CiNH/eZkiC7utiU7PQtXWloB4MNarcchl1lA7azoGwmrma87dZ6GGEFppcCe/qjPc46KPlsfkM
 4Lot/ZmbeN6905KW2K6/w7xp3Nm6Xa8iQRD92K71Pqb8GTQARfqTGHNfw1TqGIv5XJazfe9xIYA
 r2o3hrSMiGDwIkcj4CTIaCX2h4khsatBbojHSvzIJApyhn8X5XXHNpK7xp5+ZpEOtEZecjUTVI1
 bzcGJ9KcobZY93ht65A==
X-Proofpoint-GUID: JxaKSA7Iv3OLVLC7taoJDDyaLn43MEqj
X-Proofpoint-ORIG-GUID: JxaKSA7Iv3OLVLC7taoJDDyaLn43MEqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231726

* support ptest for procps TCLIBC is glibc. The configure.ac only match
  LINUX as "linux-gnu", we can patch it to make test can run on musl lib
system, but the upstream testsuite should only run on gnu libc host,
some test cases only suitable for glibc, eg: Some of the error messages
for free command on musl system is not the same as glibc system, which
will make test failed. In order to avoid some other unexpected failure,
just support ptest for glibc.

* procps's testsuite use DejaGnu test framework.  The testsuite is
  expected to run during build time, this implementation create the same
folder structure as the testsuite expected to make it can work well.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  2 +
 ...sts-Disable-twice-total-pmap-X-tests.patch | 55 ++++++++++++++++++
 meta/recipes-extended/procps/procps/run-ptest | 24 ++++++++
 meta/recipes-extended/procps/procps_4.0.6.bb  | 57 ++++++++++++++++++-
 4 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch
 create mode 100644 meta/recipes-extended/procps/procps/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index b9616e9bf4..8099ff3cea 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -59,6 +59,7 @@ PTESTS_FAST = "\
     nettle \
     opkg \
     popt \
+    procps \
     python3-atomicwrites \
     python3-attrs \
     python3-bcrypt \
@@ -99,6 +100,7 @@ PTESTS_FAST:remove:mips64 = "qemu"
 PTESTS_PROBLEMS:append:mips64 = " qemu"
 PTESTS_FAST:remove:riscv32 = "qemu"
 PTESTS_PROBLEMS:append:riscv32 = " qemu"
+PTESTS_FAST:remove:libc-musl = "procps"
 
 PTESTS_SLOW = "\
     apr \
diff --git a/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch b/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch
new file mode 100644
index 0000000000..ec26af92fe
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch
@@ -0,0 +1,55 @@
+From 56505e2ac9b703aac979f0849814ab7c83af57e2 Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Mon, 9 Feb 2026 18:19:35 +1100
+Subject: [PATCH] tests: Disable twice total pmap -X tests
+
+Sometimes the memory count can be just a little different
+but the test is equal, i.e. must be the exact number.
+This means sometimes the test fails.
+
+This removes the pmap -XX pid pid and pmap -X pid pid tests
+for checking the result is the same.
+
+Debian buildds this test never works and has been removed
+for a while.
+
+References:
+ #409
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/bbe21e141b77398586c90884a43ff75996b83843]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ testsuite/pmap.test/pmap.exp | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/testsuite/pmap.test/pmap.exp b/testsuite/pmap.test/pmap.exp
+index d37b55e5..6fb6fa1e 100644
+--- a/testsuite/pmap.test/pmap.exp
++++ b/testsuite/pmap.test/pmap.exp
+@@ -93,13 +93,14 @@ proc expect_twice_total { test } {
+     }
+ }
+ 
+-set test "pmap X pid pid has same total"
+-spawn $pmap -X $mypid $mypid
+-expect_twice_total "$test"
+-
+-set test "pmap XX pid pid has same total"
+-spawn $pmap -XX $mypid $mypid
+-expect_twice_total "$test"
++# Disabled twice total as there can be a small change issue #409
++#set test "pmap X pid pid has same total"
++#spawn $pmap -X $mypid $mypid
++#expect_twice_total "$test"
++
++#set test "pmap XX pid pid has same total"
++#spawn $pmap -XX $mypid $mypid
++#expect_twice_total "$test"
+ 
+ set test "pmap finding shm"
+ make_testshm_proc
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/procps/procps/run-ptest b/meta/recipes-extended/procps/procps/run-ptest
new file mode 100644
index 0000000000..7e132653b0
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/run-ptest
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+# Run testsuite which use dejagnu
+cd ./testsuite
+for tool in @DEJATOOL@; do
+    runtest -a --tool $tool --outdir ../log
+done
+cd -
+
+# Run test programs not used by dejagnu but run directly
+for p in @TESTS@; do
+    ./src/tests/"$p" > ./log/"$p".log 2>&1
+    case "$?" in
+        0)
+            echo "PASS: $p"
+            ;;
+        77)
+            echo "SKIP: $p"
+            ;;
+        *)
+            echo "FAIL: $p"
+            ;;
+    esac
+done
diff --git a/meta/recipes-extended/procps/procps_4.0.6.bb b/meta/recipes-extended/procps/procps_4.0.6.bb
index 168027077b..21da72039a 100644
--- a/meta/recipes-extended/procps/procps_4.0.6.bb
+++ b/meta/recipes-extended/procps/procps_4.0.6.bb
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "ncurses"
 
-inherit autotools gettext pkgconfig update-alternatives
+inherit autotools gettext pkgconfig update-alternatives ${@bb.utils.contains('TCLIBC', 'glibc', 'ptest', '', d)}
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;tag=v${PV} \
            file://sysctl.conf \
+           file://0001-tests-Disable-twice-total-pmap-X-tests.patch \
+           file://run-ptest \
            "
 SRCREV = "4dafddf4c3f4646caa517f039a2307e92657ec93"
 
@@ -46,6 +48,58 @@ do_install:append () {
         fi
 }
 
+do_compile_ptest() {
+    for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
+        oe_runmake $p
+    done
+    oe_runmake -C testsuite site.exp
+}
+
+do_install_ptest() {
+     install -d ${D}${PTEST_PATH}/testsuite
+     install -d ${D}${PTEST_PATH}/src/tests
+     install -d ${D}${PTEST_PATH}/log
+
+     install -m644 ${B}/testsuite/site.exp ${D}${PTEST_PATH}/testsuite/
+     for p in $(makefile-getvar ${B}/testsuite/Makefile noinst_PROGRAMS); do
+         install -m755 ${B}/testsuite/$p ${D}${PTEST_PATH}/testsuite/
+     done
+     cp -r ${S}/testsuite/* ${D}${PTEST_PATH}/testsuite/
+
+     for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS);do
+         case "$p" in
+             src/tests/*)
+                 install -m 0755 ${B}/$p ${D}${PTEST_PATH}/src/tests/ ;;
+             library/tests/*)
+                 install -m 0755 ${B}/library/tests/.libs/$(basename $p)  ${D}${PTEST_PATH}/src/tests/ ;;
+         esac
+     done
+
+     tests=""
+     for p in $(makefile-getvar ${B}/Makefile TESTS); do
+         tests="$tests $(basename $p)"
+     done
+     sed -i -e "s#@TESTS@#$tests#" ${D}${PTEST_PATH}/run-ptest
+
+     sed -i -e "/set srcdir/c\set srcdir ${PTEST_PATH}/testsuite" \
+            -e "/set objdir/c\set objdir ${PTEST_PATH}/testsuite" ${D}${PTEST_PATH}/testsuite/site.exp
+
+     sed -i -e "s#@DEJATOOL@#$(makefile-getvar ${B}/testsuite/Makefile DEJATOOL)#" ${D}${PTEST_PATH}/run-ptest
+     for p in $(makefile-getvar ${B}/testsuite/Makefile DEJATOOL); do
+        if [ "$p" = "ps" ]; then
+            install -d ${D}${PTEST_PATH}/src/ps
+            ln -sf ${base_bindir}/ps ${D}${PTEST_PATH}/src/ps/pscommand
+        elif [ "$p" = "sysctl" ]; then
+            ln -sf ${base_sbindir}/$p ${D}${PTEST_PATH}/src/$p
+        elif [ "$p" = "kill" ] || [ "$p" = "pidof" ] || [ "$p" = "watch" ]; then
+            ln -sf ${base_bindir}/$p ${D}${PTEST_PATH}/src/$p
+        else
+            ln -sf ${bindir}/$p ${D}${PTEST_PATH}/src/$p
+        fi
+     done
+}
+
+
 CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
 
 bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
@@ -78,6 +132,7 @@ RDEPENDS:${PN} += "${PROCPS_PACKAGES}"
 
 RDEPENDS:${PN}-ps += "${PN}-lib"
 RDEPENDS:${PN}-sysctl += "${PN}-lib"
+RDEPENDS:${PN}-ptest += "dejagnu glibc-utils"
 
 FILES:${PN}-lib = "${libdir}"
 FILES:${PN}-ps = "${base_bindir}/ps.${BPN}"
-- 
2.34.1


