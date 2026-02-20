Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E433BC54F52
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 06:03:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32933.1771567389939102180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 22:03:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gRYgkrvk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6511fe63f5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5XM8t2005603
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:03:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=B4Z8xzuVmZGXrE1/xXKNPY6dYsfvIfhj9TdiatpZKN0=; b=
	gRYgkrvklUPz7wNZCUXM1WVlp9wkL0/7YDxzHXRHwcXozT9xONA+VI2SCWAtvVkE
	Q8zQOGCcs/su4E7gunEFB6CcuvYKh7xthqgwRsHYB+KnoqaHmB+hZTp6EifeKhNr
	3U2c4NCC292uw578mUeQeNdZtga9x70OidGzuGcO8ZsJAfe9MV+9QZM2QqNVSeMQ
	yKBG4TR1Anddt36oFOc/yvOr7tuivrsZ7nET4wiztey7wDSFHIP/U6jYFhJwhn2n
	EVLalvDfeGmPeNhaUQKniTea1dxCsZc5sQ1AqfRXOIma/gNtAED3ay1X8V0H53Rh
	TGgbH15vu3IXPHbYP6kn1Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010025.outbound.protection.outlook.com [52.101.56.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuahb5s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbQ9m5rQrb1E3OGBQqnhDgutldsaWSt265n2e1mZq/axMqsjHS4SZvMfGHCbFQLH+YPyzJgC6SrVhh9Ry5wA/nT/0zxnkCidNPZjkXNfcFxVW4x0ZhaZY+P9Ykq8RQe5H8itaUWUmNBPVq8NFLAsarfUsN8GVxBssk4yeMnVqu03LGVm++N8M6w/7t8gf3BaPnPAJIJ0kUFNdg8NL5YKclFQrCI4j53W5naAEHQWtVq4Ue0a7vvljA30egpVQ0kC8quYDsF0bzV+/AdEVRxN5EIPrdBRO3+DjOR51BlkK0rE7ZyT1eQ9bWPplDR4LLuinowYGrNnwuXihyIITe/cBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4Z8xzuVmZGXrE1/xXKNPY6dYsfvIfhj9TdiatpZKN0=;
 b=Rr4o1/CfYcKUFCTvxHn93/yYPnlyy6ivb1PDPYEUfRsEA7jh5GyK/tK4+qx/BhYVwSms9w6CJ1Wbz8bswhXy1Tg4ptiQdZTeIp6s8tIeN4XnS3TNjt1ODc4bmwIlsKKCJ55gt/XaruYQjAUfHtfNXZOnpZfCqn8j6PpLd4xqxUovLnWOt7WXEt/O7uacOx1v2wIiMReGre8V3A9fTW2J1XgMP8cHN4pGSlaAS9sDQeTCWath2RIVGTvRVaNXA/8LFXec7LpuzDMk47j4d+OJHbcYyKfToA62PXwy2QIEfxSx7OYzUHrbUCKKHRGiOqxMEAcq8V+sLlb9YTxMc2B+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SJ5PPF8622363CD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 06:03:07 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 06:03:07 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH 1/4] clang-tools-extra: disable tests
Date: Thu, 19 Feb 2026 22:02:49 -0800
Message-ID: <20260220060252.77248-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
References: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0048.namprd17.prod.outlook.com
 (2603:10b6:a03:167::25) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SJ5PPF8622363CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9a10e3-79b0-4bfb-c881-08de7045b7cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zZCWPaW8ozjf4rL1jkFyBnRtgCGUaeW+iIbWCK9uhuIl+WsS4NKVRzr9HCV/?=
 =?us-ascii?Q?CNApjo080F03TSV1fG/U1uWURyN9ZDVgtUCLLIVpMMmOTfm3uzHYjyt61l35?=
 =?us-ascii?Q?hQtoTU5lbjM5kIIK3+VOWvbTiodQI99IRxY8EsaLegUGqUvS9EJ94+AxUgXJ?=
 =?us-ascii?Q?Je7l6T4ULw6NxRRaYh4+z9J4U4eGu0i/eNSmA0Qe7yOwKlZ8XxdO49IOs2d8?=
 =?us-ascii?Q?xFgKxYqjevBAkKN/WdPp2LoLGnNaVlKMzQ9eSlwww0/8gLInxHRBoRYiuzMn?=
 =?us-ascii?Q?QdfXirc51Xm7OO3PCTjRON0Q3jDY2Y2mr41BKeAaKrD2k/bjL6YnFgK+W0Nu?=
 =?us-ascii?Q?+ZPRBN6pbmKsEQwY/qDOYj3X+2aJ0mCIaLuwEbBq7RJtUV4WZEx1hjq8GN0P?=
 =?us-ascii?Q?I9ipNhtaMzJgXzJ+P+xeb9rckV4W0B9UBITpJTK+g5VqeMVSnQxf3iRhZJPe?=
 =?us-ascii?Q?/kbYdZe/MCS4RzDmdibLWXorlyphrvtPHNqnQBD1Bjh5M+u64ZEAJpN73EnZ?=
 =?us-ascii?Q?hd7JuNkAcUIfwSSCMcS+NTHgjnH/u5UcnIiSShEkP72f9bneITpsh+B6o7By?=
 =?us-ascii?Q?mRQ2L8AjRh7AbpbD3DkgJCLLnuC2mjs0b8E2SVtdz++uzB+qMDy7QXBXRDWK?=
 =?us-ascii?Q?irxTVlRZbQyVTA61fXjdrQYzpS8zW3p+LI0v8XxJH5UGMtwbbTYY3MTUiPlc?=
 =?us-ascii?Q?O8A+dU++7NJ4mpypO8BRRYv35u34iM0nO6vpBdmbb6Vlbvm13FgMKsNhjqSv?=
 =?us-ascii?Q?v0R5MF0+s/N4wFFEY6KB38TP9hjTP9Pefk8F3Bpz5lZS6xY2jF3Qd1yN7NKq?=
 =?us-ascii?Q?VZdbiJ8571eXUmav+hNaZ19Hbat8PW5C8CTTfAuH6EPw8xPuh459XiJndEB0?=
 =?us-ascii?Q?dNJp/YGqlsuj9A8D0q4trDvV0jn6M0RtBS5KH2NZMX1xvF8QtR0DyYrzKJWh?=
 =?us-ascii?Q?k2+XNRQNG/VL66DzezG4GeBgHFcKOMLCJ63OcypuKQDyTBmmQS++sxL2CrN/?=
 =?us-ascii?Q?Q8BeutpM5OYpzR38n1V75Pu0ZfxcukaeCC14DiZt0nY2j4XFXhGfPMIoGMAF?=
 =?us-ascii?Q?eYVAX9vRCD9abVMBr6kmUiX9R2Sjt1LvYIZ8LTQqsqmeKZTk+651ilzbh2lj?=
 =?us-ascii?Q?WFc/mzIoq5IyzNod4pOQiv9Hx/Ki9npxEzj2CMelTLUdl6PO7HXFgXUePQlb?=
 =?us-ascii?Q?Vl6Y5AKaZDBTs1Hzrne+NfYZOGNvZcwjBs90NDxMaOH9n3PtloGFMW2EQgW5?=
 =?us-ascii?Q?HkYm4oG7QGZLHRtF4iL9GGtr22vZybkEb2WIBtPjISqzeNF66OInDSBs1a6G?=
 =?us-ascii?Q?bW5bCr0wLexuNvJXQy5uoZtns7MmzE2vyS7fPmFZy5oyWV6Gx19qdOvACC/P?=
 =?us-ascii?Q?poDLzwchqWuD0mrcZOFjAwiVmEmTZ+IRD+/MlUGCXcWQa6hvfM2vlcVJDdwW?=
 =?us-ascii?Q?cIqVFMcLah3bj9hcwFpEnlYdbEwoYBoDptC9YE4dOVKu3/KAWA8WNXkbqTTK?=
 =?us-ascii?Q?cdlRKWOf37rBb9P4Nu/bpxUVknmT/C1o+0WfgXJ27tJMloZ8MmquLkuMecVY?=
 =?us-ascii?Q?SsaZKZnxunZnLwSFk1OpzKrn/LonOZQ2IGp2AcLt0DSLsKGXbGyBtQZGqyiq?=
 =?us-ascii?Q?Q7lQgBogyMuQF+boz4BQtxk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lw958qALSLejrtAFR7LNH2ZRqWrWSF0K8Knk23QiLTwnqb+deP/hD5qdoWWW?=
 =?us-ascii?Q?Okb12nrV7F8+TZ8iMBmG/1JEdpFS0L7cc6mTs9AvxNQjJup/D4oQ5mjauhQu?=
 =?us-ascii?Q?o/wHHPmQ0oaW0ZDaQ/b7I/bsHcd/nN3AawQfMJCuBUU1fP5FWwj+e12g3/0D?=
 =?us-ascii?Q?WSHkiFkUp4/RpWvhvDMRd7Moa2WmNIWG9ZEh3Wsd1g/5SbJrymBDa/0ZGCnH?=
 =?us-ascii?Q?wApSO6cZAU+iPoMWLZ0ccg5s5mHSoifHm9Des4UcZlC99/GA+paVfRLHQ5Rh?=
 =?us-ascii?Q?kk6v1ZysP5mQ2vlqNd9KgdXhkQxzZk6W4TjojLX01zxBiQY5s5rdx4zL67qm?=
 =?us-ascii?Q?J5ukbhs8thq8solsPiL0HLO07A1vPoQlv9sdpR9K3tG0JCyyJVzDIHQK0L1i?=
 =?us-ascii?Q?a6x/mKdPYeF47WxoXJCdimQ/npXPeQdrtfRFKX2za89KTiqHh1nvF+lg58Yt?=
 =?us-ascii?Q?1o3ssopP7231QIQ1Vy+W3eg3QthiUDAApJCZa1mdzQwTRhsaJw90RbmW7y4y?=
 =?us-ascii?Q?9ulUxZ6McWlyMF8vjSKq5s23tRQJurj0OIXmy6ETuOBIpPUrBcH7pVUw/Cj7?=
 =?us-ascii?Q?GJdvFOUlcm3jU8CvuczRF7Bvf+ZHTmzffJcqWuQytHru5Hxd33CmDF+KILZp?=
 =?us-ascii?Q?w/Wsz5n0Xmw1Javm3nf3vYwXiecKTZNQp0+lFXWtK7GalsMXayHlLHvMGeRT?=
 =?us-ascii?Q?vUmPGBsb9lMfxkYDC6E0hwhiiJLcCBbsb5qH5I1rNcI+DIMoAXtEkPesGuUz?=
 =?us-ascii?Q?wUVE8IQVEfSZQaRJEFBibXxlPC/w11c54X00QpCgyxawAIKZMihlfa+woz/j?=
 =?us-ascii?Q?Tt99+C2DkJmdxRKKQaP75aG9zDtNfXSRjd4QItrEQbwkqQ7eXs7eCSwpwZWd?=
 =?us-ascii?Q?7t2QmdAMiotJPKYYp/6O/ZWZQEVWt9LebJakjTU/utA21JZ1xB69URJ2v+U5?=
 =?us-ascii?Q?FUXajKYEH4zhSwZGnNt+C6dhdMzJMrU0oxfG743dZUO6DPx7GAYKcE88OMXu?=
 =?us-ascii?Q?s3SZOMNQmtCS9Y50wOE6826c1qzlRORCRLI2uexStUihUUoyRRNV3MGPgvBT?=
 =?us-ascii?Q?NJhtpEzt+0bbG11UyEOI6yFh/yvYBBoPACsXOE0ruzGLXwo+2SZZuS+bYWM1?=
 =?us-ascii?Q?kLWXSQIQexi0T3abqrWvEA/8wFz/kPHG535+VVM2wKUzZI7HCIHegH/AeviS?=
 =?us-ascii?Q?Ic+SmKCaq71RuuYRRznWtZINCDeQrT5vp4AlMPnTGPDAeOIOn74t4ZJzZZap?=
 =?us-ascii?Q?K2+HMq97HJASm8eVM8dMWRbqWhuuoIRJJYUuFLCrfnN7iV0zHuqwpb33InJ9?=
 =?us-ascii?Q?UtPleX5Hzmt8xwnwQoPa+KnGviRkzDfpSojf+eMev7fCVWiL0lEB3RIyImht?=
 =?us-ascii?Q?rgMo9J+Oiat7BRmw4JZHKsF08JKzy2aKSAu9LEjOzdJ+gcCxnQtWlCcfcwUp?=
 =?us-ascii?Q?DJ0GmAgStQs1AHK5SM1BopMI0P7v1+iboZJiBPVwDXHAWIvQT1L5wMRI31W5?=
 =?us-ascii?Q?MVHJTlw2GLahI/J6mE3ixfzZMRnmsCK5fiOLoe1Jaf3V0+HWqD0GbNQMB1rX?=
 =?us-ascii?Q?D6mJ9uKi8lGMHq2VmzIzxyoAjAxeEruzWIKpqm/wZm0VE0Lf8sPHlrM6kI4Y?=
 =?us-ascii?Q?i0Kvc7wwXPp1XWgnt/eawG+S85PnDNKa7BKBuRXq+MO0CoP1baN8pG5KeSRF?=
 =?us-ascii?Q?AQzEf8pJ+L4pyd2nYLyuBLIkhclUk+L834gzYBBIjabNd60Ok3BLyQYbP0A0?=
 =?us-ascii?Q?rcQZ7Z35YdHLSOZGLBLoGelV3wUCGOWvoiXzeLMZBr77QO+URwZR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9a10e3-79b0-4bfb-c881-08de7045b7cd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 06:03:07.3144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBj4MfA0fuc/5E8T4zZo29QmgtQI1JI+HaFH7uy7ahXaQqa2PK8mQTgzaROMHwhjzE9uqi8G6QWI0wuDlYFwpjq47evoqUqstaYb5y5EWn/Q0sRs6Q2lIAcAFyyuyi5J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
X-Authority-Analysis: v=2.4 cv=OqxCCi/t c=1 sm=1 tr=0 ts=6997f91d cx=c_pps
 a=I+0PaAUBL5uRonxG4DgGUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=IQOrjEw-PoaY6VFe8koA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: z2svERj3vf_t4QBKFQeVHymhd29iohWm
X-Proofpoint-ORIG-GUID: z2svERj3vf_t4QBKFQeVHymhd29iohWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1MSBTYWx0ZWRfXzysuJzP2JSNV
 njjjZJHKT+YpqbHpXgApRgo5G5muG1tvBLylewfEY5SV/awSrZkJ/3Ux9E96kbdRhbuH6OjmwQw
 W22a4wAPFss/xKzECx4cgF1aG/tLZko9MWsS15MbwGrtLs02leeEWs444X+NBK0QCDPe0apRAaL
 0vqzb2B91P6XgWRjSgT2ioXJy0sIuzDaYV6k+GVONQIBq2h4TVIqaOMgsY11ZxCh9ypXaw9tbWl
 Am/3YMbGZJXu4Xe2jJzL8l5eH7cGjwN1QUqWuv7sf87m9VI06GWqMwdkguLmEG9vSukpHANpUBd
 KVNIoQMSUlHB/S/4+WqEphZPSrDdTj3AWMWmww/rqJRhLxnQYMTN3uiGJdHInSDRTXQj6Lm8eUM
 R5095HqP0/ArCCCt9Vh9Xxd/ZR21NMbxGTEjinsx5Apd2vLZk9If2lq12iJ9vtnkeiqPM4ZLlj6
 +fi1kSuBXiKPsSCuyBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602200051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 06:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231489

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
exists in LLVM's CMake project but is not visible when Clang is built
separately. To run clang tests, disable clang-tools-extra tests for now.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../0042-guard-clang-tools-extra-test.patch   | 74 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

diff --git a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
new file mode 100644
index 0000000000..a37ab65975
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
@@ -0,0 +1,74 @@
+clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
+exists in LLVM's CMake project but is not visible when Clang is built
+separately. To run clang tests, disable clang-tools-extra tests for now.
+
+Without this patch when CLANG_INCLUDE_TESTS is ON got the following error
+
+--------------------------------------------------------------------------------
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-clang-tidy-infrastructure-header-filter-from-config-file-simple"
+|   does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+|
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-modularize" does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+-------------------------------------------------------------------------------
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeLists.txt
+index 6b6f2b1..26e4c10 100644
+--- a/clang-tools-extra/CMakeLists.txt
++++ b/clang-tools-extra/CMakeLists.txt
+@@ -6,7 +6,7 @@ include(GNUInstallDirs)
+ option(CLANG_TIDY_ENABLE_STATIC_ANALYZER
+   "Include static analyzer checks in clang-tidy" ON)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   umbrella_lit_testsuite_begin(check-clang-tools)
+
+   option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind" OFF)
+@@ -43,7 +43,7 @@ if (CLANG_ENABLE_CLANGD)
+ endif()
+
+ # Add the common testsuite after all the tools.
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+   umbrella_lit_testsuite_end(check-clang-tools)
+diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang-tools-extra/include-cleaner/CMakeLists.txt
+index dc147f9..4855577 100644
+--- a/clang-tools-extra/include-cleaner/CMakeLists.txt
++++ b/clang-tools-extra/include-cleaner/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ include_directories(include)
+ add_subdirectory(lib)
+ add_subdirectory(tool)
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/clangd/CMakeLists.txt
+index a1e9da4..94dcb96 100644
+--- a/clang-tools-extra/clangd/CMakeLists.txt
++++ b/clang-tools-extra/clangd/CMakeLists.txt
+@@ -213,7 +213,7 @@ endif()
+ option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
+ llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 1e70e9c64b..c5f607aa21 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -65,6 +65,7 @@ SRC_URI = "\
     file://0001-dont-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch \
     file://0001-clang-Support-building-native-tools-when-cross-compi.patch \
     file://clang-no-tblgen.patch \
+    file://0042-guard-clang-tools-extra-test.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
-- 
2.49.0


