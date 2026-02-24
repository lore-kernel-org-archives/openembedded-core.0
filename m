Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46096EFB7EB
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 02:46:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11967.1771901196400862853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 18:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kdvCQI9n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O1MMr0424278
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 02:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SAZ0L08BEq7yKlt1iTCu
	C1epDYkPses3xIRL/7w2/0U=; b=kdvCQI9nENPN0vdWxf6S2q7OA3pNADGwSLYX
	PpWVMu5xfZpgTobvEv3Vim/u/P5yl93sbwyihY0S+yhmUKVhNTsXYCf00SuZblcp
	dXd+NLF7+kxV+u1fId5/Q34uaf5hDRHbnblveAJmsEf/sgBzcLe9iU1vgC2/ruFp
	GVRqrKK/NDXar53H+fniB2zr9W/91NNpyETMUw4QFBxbQJJmejt2dCfZOdjvdnAn
	viG4mnAjVipC85uublfqmlZ3nIc9po1C2BOx7dMij8kgxX8bejgPEyd4uIDIhFN6
	3FIumCch1KJq/6tt0CCO8kA6LUiPSqrVYEgkWfygqfvpNqIxnA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010056.outbound.protection.outlook.com [52.101.193.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf3p4an5g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 02:46:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLIjhEtWS9L3HnSKorIVxC+sk9UF6wi1FHlfYQKAXEA+TPkeRqzSdU+J9P7JaIzVmSuS8Sedk13ijfYGxEq1zafAMPa+Zk96MQBRY1uFleGIF7LjYW057joqF5GCT/bStN98mQu9TVNzAotblycVf/NsLPJsbMt6fjDAmUTNsoG9uOtKkD2mdAiTb0j42Xe0mIC7MeIXff5i9tiC0obd+CUUkCCoQbcVKXthR4eOKOoerLw5mnJH0XYAEma3BSzM19bGJJFM/Sg/g3t7C7mr9HzDlxVXMfQ3XR7eICFMHnE13icdC67RHXz3Fa6H+JcgRRRAFXNPzWX2VVe7rEj5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAZ0L08BEq7yKlt1iTCuC1epDYkPses3xIRL/7w2/0U=;
 b=FNllTE37o3gS4PJWEsksLyagO2+9zpARbemz73z7a2ZM7nS3KO8dVJ9080cS3qbKSU90CBsmqBPLRRVQinNJpQ4dsI+xF5bDzfLgWmFIOO+A+OQZV+9RHm4iL0Dcp4v9KYjrKQ4e00W/UOQjLIhTiYu3yh5hiKOZ88lU2gMkGfMrn4PeLTUkVhEsxjuiJhsyVEl5/8v9A7W4G+fQtUhClHelCkVLNl4fEh8honmJtLuXzo1CiaTxALk3Roq8EJ+27ysweESJh2u17iJF/2A9GDvup+W8nXX8Hpw07KmqrWX4S3vsQbBULlRPBYTWsi3TD6YtwscZ1anK8xP6MhwONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 02:46:32 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 02:46:32 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] gdk-pixbuf: upgrade from 2.44.4 to 2.44.5
Date: Tue, 24 Feb 2026 10:46:16 +0800
Message-Id: <20260224024616.1130318-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1d9463-1c5a-4fad-5c93-08de734eeb30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SM5ViDf2IIt7FA0+2fPAEiALoZ0NnfgilYApxN9UZbsSbHY2BeguvsiXhzcG?=
 =?us-ascii?Q?IDn5afqqx9MlrdfQNI9opUG9bMsoTHjiG+U9Ol42b5VKzOsunZCoC+2Gn7hr?=
 =?us-ascii?Q?7O9J4kuR+ZZOjLQmcpsUlXiqXkKqHF9cAPIfQvSZrqSbedqskitcsp8muGwq?=
 =?us-ascii?Q?/C5ZCw2r8QMz6o8Sroe52jyVSUaVJXWCIodR1suTBQCYqO5hf2oNroOaZWU4?=
 =?us-ascii?Q?SdrWK5gq3b9kUnKUTf44O+6/U3G5cIGfBQrQ/RD7AfuPpT+YTCT4pOxeiPKF?=
 =?us-ascii?Q?7Wwvjf0IbWy5rGPusm4XM5fIyKXBA18F3emWwwotXN88oZKQ6hyWl9INFKQI?=
 =?us-ascii?Q?j5qZZEIsQzoiCfeJMBoTkiAwX9vw4/3GAFn29/PFWOtGv6NcffOcIxvY0QF+?=
 =?us-ascii?Q?WbHfg49t3f5eekjpEtFBrdiy5VUcFETvS3YmKEdgPcCHuDOgvGjQs0p5fAZK?=
 =?us-ascii?Q?cFU/ruCQRmyffYO/qWpS53/5Us7CnywW/yRsSYt22mQFvfO+26vlkofv9kWn?=
 =?us-ascii?Q?cCXpbeBl/FNFCfcq63o/+c8ITcPd5ngnyWklgxe/n+rVtSdUHt8SqDZOtpfr?=
 =?us-ascii?Q?roeq7D3B1Hu0uGh7ZAoT9YpfweOyBgRN7TOfk/F/BtOiS+LZgYbcI0o235gA?=
 =?us-ascii?Q?Ur8aeqzx2gd9VwbWcUtmibhCdjagtoP3cAsqI4PEy9zYgbY0hhOQYTEYmTUZ?=
 =?us-ascii?Q?n/UzSL8nC2uyxtcL/+j9cOm4ojAWsaTgcWEmShaHMv7ByIKM7JDs4tcKG0Su?=
 =?us-ascii?Q?VS6lpfU7SRk99n81A5IRU5UByROxUaKMhUu87EW87mUdktq54SbHHQU7w2Rq?=
 =?us-ascii?Q?+BrD+nTxXRO1PItcqyCXvkaMwgbkW7v7SbmVI/6/W833xVL9i0KnEdnyGaev?=
 =?us-ascii?Q?ystHp4APvNz+sY8zb3NMndiu5mVJvUBLGGySW/k5t6dbNeiGdpzAHJybo7X0?=
 =?us-ascii?Q?zq+FtCumJhtW78IfPdexRXTufxcOaZ1JeV+Z2tcn9GOrKJe4zk93dR4sFaUB?=
 =?us-ascii?Q?Lt5YdnqxiK8AK967NF50YzhPAFdON+lMF4pMd2RSMFYbHpdFMbPCdmFtjc/Y?=
 =?us-ascii?Q?VNNFdPi4YINRitfcFuWGpPdAwNv4HBbaffZfBXHCIQ7nh2xzMYXEyJMenmL6?=
 =?us-ascii?Q?bQ/YaUvIUhd/IuPcc+2Ju53O455V3mrCoO+x/iff6FJMQtaeIUMotXHi5cCl?=
 =?us-ascii?Q?KRTnMdnqbxtzCUB0/uWaS8CR0C4gYsdAlPyFtVQGCrg0m7xkouuKrE1URhPn?=
 =?us-ascii?Q?rw9HderuMc8cF8bjTW8XNZlU+304USdgK8uY5SJgObDJqeijb07HD+WGrS2j?=
 =?us-ascii?Q?gZ4kPloRRgN9SLaegLPoNp5hH4KGHp9R+cFlkZzKVCWQW56YtG79e6k2XndT?=
 =?us-ascii?Q?9UloTnNWQMIFGYvS0Tz6zVCxggYo5wQ8DFhtFKbXB9AA6XRcs3GtR3j5VlpB?=
 =?us-ascii?Q?IMJlARIoTkyYAbbijkttSPS0WDJFNQhh+IodUJ8qcCgMPYRcWqAW5bgh5l5o?=
 =?us-ascii?Q?/LkelFjh1TqrYx7jU9V+0kOz369rG0wsyn6L32N2trnBEZ/tQyHOl/zExY84?=
 =?us-ascii?Q?HLzTBkfMFrg64l+1MNONYo444QItNiNbZl389X8sB5Me17zDJwEb5e4k2JPx?=
 =?us-ascii?Q?AWxw24gz2PuP6i98QtHFWdxn0+io3M3iCWhKyu7LDwqI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AdDRZwSLHKwaWKi34khex8OMnUHp7lJNOjivbsnSx9qwPhuAKL4rVWK/5uNo?=
 =?us-ascii?Q?hdB8olgnEThDpsHwDGM7AfiQglY/xohfYKNp+7W4K5+hWfrpsgjJzIW25FgG?=
 =?us-ascii?Q?wcbyHf0R05R2P6uebFVWemFmaWcxy+7DsW5El5ggGg2mWqrmhVniSVuADt+n?=
 =?us-ascii?Q?GX/xNnCEREA+a/YGysRu7gJXQDj/+XsSmQ48V75gwH9SCUsIJ9Mv3tPW0MiT?=
 =?us-ascii?Q?FX3yt6fAa1MI1tpeqcNcizPqr4gWho4y1O3u24nHxy0WaUR+SDrMzz9Yuu0p?=
 =?us-ascii?Q?kAmHN3iYp/RkWcihlawJjq9C4T9XrIpKdLavAwkBmIxgXv9vG0XCmu0fY1HK?=
 =?us-ascii?Q?oIbeLb43jRgbbYSUUJEp6UCKzeMbHI5TZKmd7KTjTNg86sVeXYW/ajHM1Ftq?=
 =?us-ascii?Q?3Yc6IIbs3DVtbbpGr2M4mPidHaAI9L6TsPWp1S9Tx9aqdmoV1Kt/fiBv/jf5?=
 =?us-ascii?Q?5FUqK4AY0Xy9HKcrUoe6Odl712M8/6vJT/4RI6SQ9kzh0BfvRSRsWqxGvbgE?=
 =?us-ascii?Q?8+gSMZEpRnmF+DUSWmHNOGnOgeaNUCLsxG7xEWzIgRT7o9x+TFzVPr98k8mA?=
 =?us-ascii?Q?DEPNXLsbe786vUj6Kvp+qBzD8tj/oV8YRgkgBKebFdK/wRx8QJMgxjOQKSu9?=
 =?us-ascii?Q?k4IgVVSkXLmXemjt0v9LLF/TpMqQTg9n3oI+wVrXhGv/9IWuMztQyZPoqUW/?=
 =?us-ascii?Q?OGyTZbdj8uQQQ2BrEsPpOUqhmkLVpn2cYtOP9N7bmjezTw9U88erGzBbihV8?=
 =?us-ascii?Q?YPEJhFfu3tk5RhdG354VDW1+pGzLFCIsqQGA1Skih1KfHxij4qEgdPQCQWb2?=
 =?us-ascii?Q?jjQ3g230xg3nO24POCuA3tD4rfJ5VaiQOKhWqpapbTPML3aeI/4/hDla8yli?=
 =?us-ascii?Q?/WlPmPmgeOMVlEryRKesmUulDltUS9QLaKrivnpG7SSwP0FoAyaMRKKccDEY?=
 =?us-ascii?Q?GC0xTF+ZP4oJhLuL6kuXWC5Wdmny8mwGetET1VbCfwvXK5+R3R5kIFExYkSm?=
 =?us-ascii?Q?tmmtijeQ0q0IB8t2uCkvg5aNDQwskpPAllYtMH8ad9mLYtlIpn+nD+gBW66c?=
 =?us-ascii?Q?fDNSIcFwFxMNGMY/fFoOOF5Npb/NJfq2I04EKLPhk6iiXL1+Vuo/OQiebjz3?=
 =?us-ascii?Q?+pX7aOD9+cHJcoznJdKQEZHFTPPiPB0TdWatx6owLLxnD/Q/XmiTczM2qBYP?=
 =?us-ascii?Q?JeTWD1/H8VJ4SUuVTmIugePH2ApMIowjES6AeQEl0JoDIEMKrh1+YPC3ATia?=
 =?us-ascii?Q?a7lMUHImcFM2BgFYRiv8vqHPCcY703PJ1kvJTBmV9+O89MT0FA8ZT/+L837K?=
 =?us-ascii?Q?OrJMZPfMYYYX+Qz7Z1WZgIy+b+IqGdVEkkqNYkXVCLMNpmN9b6eSWF0sAxaZ?=
 =?us-ascii?Q?qkZ4/X23pHsxLVyJmUnNIBVLEaEfaK8YTdIfaWUI8IGzRdgOYruBappLbazz?=
 =?us-ascii?Q?V1tac06ToQ4vwm7B6e+X1YtTsYQJEIk6hwPHL5aMIMOvhwsc4pV4R9aPS5JP?=
 =?us-ascii?Q?XfSzK22GM9Sq/XHlz9sBGf6KopK0c8xCZso+FOz6uURsRQB8my6sy+RmV2xF?=
 =?us-ascii?Q?aiBHta7o0atwDUykXc8SUR4khokr+h3uEr2Bot9xdfkqNZCUnnq+07eFqz0B?=
 =?us-ascii?Q?MCQkPWnMQGeMFQejqNOeRsnv4gcVZTPA258cRGZIaEI172T6u0K1PbpwFd88?=
 =?us-ascii?Q?MM2n2kzrdEWNwWIuQoWgNUopiWOI/dB1nRT8W1zvcfY2YeR7gObtUUexAHxs?=
 =?us-ascii?Q?rFG2J5BQPW9wX8ubOk5STqe3XUsdk1g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1d9463-1c5a-4fad-5c93-08de734eeb30
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:46:32.5529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaCbK77AcRiq+vf2FpA4Q+zuv1vciTs7hoteWWUbpGKbrCKrMm8YjATIzJcPQCXzI1v+NBFCyk1nKes7o/hu9UXpeoNm7MZAiZlN5C2We68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
X-Authority-Analysis: v=2.4 cv=V4xwEOni c=1 sm=1 tr=0 ts=699d110b cx=c_pps
 a=OocfSUbDEXyHRS7ToLrH+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=GHR8O2WEAAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=YiNiJB1NaOXgVCpsLy8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyMiBTYWx0ZWRfX65+e5f0VJZ5y
 NuA6mLBNUS/0QcPhfNvpQiTAkRTcrxdQ+mo/DyLxDZCU5YyM6siKkZ/wa+d/Fevr20cHe+RUsLs
 HJ+VrlgwtOuFaYheBafGUhNDofeapGQ21w0WOlTOlLk2eURKZhplVMorJnyMd8yxRfLZfylQbWA
 XO/Jv1oqSUh92U42HV8Xn9437DN4hb/gXRQ84AzY3BhLrOZ0zujflgziIUtM4Mx2GL4VSX1r7Ey
 GWBQvo6k7n8jSc1VE46N9JvXpBZyk98dOl2RsvZkNrWvfs8qKsgttgQwGQFl7kg4H+FhiNeHpWU
 pj2UNZAf7SxS2OMimGiDxsPIqG2PrexMD9aM7uEpl5iKxm0s5kmhRGdXgy+kuRjLjlNKO+3wzWy
 zmxIh2fOvcUNV4ym4qhTpKAnxAY87Mns9SJgd9pq+fkKPNhNzNcot966+8PJnWkNftGaFCpHq9W
 RudIApy1xzsphYwjRQw==
X-Proofpoint-GUID: _TvkrK-W6w7S75L0UGUJsuzHwMNAvBOH
X-Proofpoint-ORIG-GUID: _TvkrK-W6w7S75L0UGUJsuzHwMNAvBOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 02:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231735

NEWS:
2.44.5
===

- Make the testsuite work with glycin
- glycin: Add support for xpm and xbm
- TRanslation updates

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...w-a-subset-of-tests-in-cross-compile.patch | 20 ++++++++++++-------
 ...-pixbuf_2.44.4.bb => gdk-pixbuf_2.44.5.bb} |  2 +-
 2 files changed, 14 insertions(+), 8 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.44.4.bb => gdk-pixbuf_2.44.5.bb} (97%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 534f4e0076..45b9aa60c4 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 325a4cde99a00b84116ab7111d27e6973f3c5026 Mon Sep 17 00:00:00 2001
+From 3b6aab24f6844b7d5b3e166bc910bffbcee1f6f5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -13,16 +13,19 @@ items that do require running target executables.
 
 Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/150]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+rebase to version 2.44.5
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  meson.build       |  6 +++---
  tests/meson.build | 10 ++++++----
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 3eb3fcc..dc7e790 100644
+index f478326..464ae1d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -390,10 +390,10 @@ subdir('gdk-pixbuf')
+@@ -428,10 +428,10 @@ subdir('gdk-pixbuf')
  # i18n
  subdir('po')
  
@@ -37,19 +40,19 @@ index 3eb3fcc..dc7e790 100644
    if not thumbnailer_opt.disabled()
      subdir('thumbnailer')
 diff --git a/tests/meson.build b/tests/meson.build
-index 3781066..911b5fb 100644
+index 9b96fdc..9c3ed7d 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -4,7 +4,7 @@
  # gdk-pixbuf-pixdata from build directory because it needs all DLL locations in
  # $PATH. Ideally we should use gnome.compile_resources() and let Meson deal with
  # this problem: See https://github.com/mesonbuild/meson/issues/8266.
--if enabled_loaders.contains('png') and host_system != 'windows'
-+if enabled_loaders.contains('png') and host_system != 'windows' and not meson.is_cross_build()
+-if (enabled_loaders.contains('png') or enabled_loaders.contains('glycin')) and host_system != 'windows'
++if (enabled_loaders.contains('png') or enabled_loaders.contains('glycin')) and host_system != 'windows' and not meson.is_cross_build()
    # Resources; we cannot use gnome.compile_resources() here, because we need to
    # override the environment in order to use the utilities we just built instead
    # of the system ones
-@@ -164,9 +164,11 @@ endif
+@@ -159,9 +159,11 @@ endif
  test_deps = gdk_pixbuf_deps + [ gdkpixbuf_dep, ]
  test_args = [ '-k' ]
  test_env = environment()
@@ -64,3 +67,6 @@ index 3781066..911b5fb 100644
  
  foreach test_name, test_data: installed_tests
    test_sources = [ test_name + '.c', 'test-common.c' ]
+-- 
+2.34.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
similarity index 97%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
index 0c06bdda09..9ed9a272e0 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0 shared-mime-info"
 
-SRC_URI[archive.sha256sum] = "93a1aac3f1427ae73457397582a2c38d049638a801788ccbd5f48ca607bdbd17"
+SRC_URI[archive.sha256sum] = "69b93e09139b80c0ee661503d60deb5a5874a31772b5184b9cd5462a4100ab68"
 
 inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package manpages
 
-- 
2.34.1


