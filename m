Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45369E83858
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 13:17:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11622.1771334221627893951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 05:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qymKCJV6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65085d04ee=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8p53f2603564
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 13:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=2V3rqK8T8
	SgZtiqYXhEUsNLcdayVgbBC++cWbV+Z0dM=; b=qymKCJV6FTBWF5sanXMyAtY1b
	cdRaOtngn6H9Vd9hU/PtV19aa9XNqhPyk9L2TcavWp1Cs2b/f+ddaZt8t02PIzBL
	Pu5aj/sv0jzoft7ESNkUxv89qavgtRGKh5hQd4ZRgKnJKzweDyVbu+pJx8wQILpr
	V+UkD36SdN3Dea4wAt0hQ8nuv9TkbhEKl0lY3fpUCre+ZBhLcIeI9i0IMO5HZLPI
	ql9euIKN8B5I2Ro5Ss0zuzsUS/oe7GPFxZwxegtHVDkYMfGqjs9a9LTGaso6Zwyr
	7gNw3rpeHWmzXhbZdYeduPJ8Nsm1ABJCrGus8bcmBLJT3B4vMcLpJUhuAzNPA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ccbaprjge-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 13:17:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEH3oKfZUstXyNWMo8qvmQrUGlbHWqdLBeP2dZi5XKLAEd4xLVLSdfe3fG+CSmo+OaVSgXG/9h1Xp459vIypDVhZlbv332dO+As7RaaBk1KBgRA/PNe5+7hhWDkzCLW8tkF85ny+0DYKL20RDpihsPmeTDmtkkrNyLrZg0UgCcJQk+KmzF/2ruGNJ3km+et105Rr9+0vwLykK8SKieWoUPE7eyrvTWc6WZi0VWJC20JLZsLOVj9O8G13m8l70dRz8R5qAYKlsOjbu9D4XThPErr0lXTUOla0tH4DANjtsPDlEsYC77MqWamovhSS+vQyod6xQd8ASiCjoK/2+PLpUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V3rqK8T8SgZtiqYXhEUsNLcdayVgbBC++cWbV+Z0dM=;
 b=WHHVCwkB3Gjyfj9KDVQ2nqRyLgFh+XLNebNzl4Xo8EfbAxxTnYRHinq88aalwjFFfBMZeHKZRuoqAaaUJIEVuFiyiZBmC6JZswBsMKXJYR1Bbtbk+cK6dVYLNymeTTw3oKaNGVBxZA3BxaX/jkZJ7VcRctY4Qsoq3dZJnYU/eLHAwGnWSo7gMIpZ+h/MwzoPcQ+mynY/Lwej339F7L5s7k8Y7B4SXCKDZi6Rghks950vup61Hn6aOWicIzwnZRlq7bK85s9haT7smX//G8sBedo8d3R6MQ2K/aoLbHxKe1v2F6yteDt8WtKs8sgQWDHmSBUCOpheN1RLOXxqE8+0PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:16:57 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 13:16:56 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, alex@linutronix.de,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH v2] rust: Enable dynamic linking with llvm
Date: Tue, 17 Feb 2026 05:16:36 -0800
Message-ID: <20260217131636.3155022-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:40::33) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: fac0da3c-5f37-4d20-6a5a-08de6e26d36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yp1Ciz451amLZecLTMkRf5FDHSQH08zIh0Jv6vJ+y3QeYOjXZFcOkX+mWLmY?=
 =?us-ascii?Q?nC+3e6Ze0G50ViOrC4vbWlcSFL0N/L4ePHf+cWcZQypRlpzwNl44cq5WNWTQ?=
 =?us-ascii?Q?etQyelA+fBmWCsoCTedNnQSFddvF4wy1VJErhVLNsM8FAEcvX/duVauh6Rdr?=
 =?us-ascii?Q?rZGfhyJrJFMI1jjJpVikmA3kCRylQx6LDgF41MzjjV1DZcV82tC+p32/8KUD?=
 =?us-ascii?Q?ZeBPVW6nJRvy+23k/4ZeIa7tjZB4caShamrHtTvV8lI+3QwoVllyj7IQB2l6?=
 =?us-ascii?Q?AYpe/rTsLRtpWzBTK+s7FeoiDfQxcmrNs9ctqCxv/2KkdG6QZRX21CNCpmaq?=
 =?us-ascii?Q?8aeHDNpBg4DIewBxdDOm3J61b4kk6s4XSIXAiobtpQIwCML3P6TIjVoPux/L?=
 =?us-ascii?Q?0Dw3LwIJkSHfNx4UXAtcdVBeFWzuMy+lJJlSCpAPAm6G6mGf+daV+DLWz69l?=
 =?us-ascii?Q?xqrDcRjazTvmD86f6TqJvWFi34NOab3a9PXJ7aPGf0MiOHJ6sFmy0eElqgPB?=
 =?us-ascii?Q?quB+tFMraWp9bSn7U+qHfvgbhp8UE/M9ZAGeBJd7khEHxAAAT1v+x5TN3HXf?=
 =?us-ascii?Q?Mr2ZpA9qATblpDyqviWQXsLX9F5JQ2Vb0Ulm353qL/svt2G5rrRMMSVjeLPI?=
 =?us-ascii?Q?+1iwbZvoxXoMAtbrA+o6VxYVORo7F4Ex23vvyiPiVzPGOw2FvJ3D2dSWZ48A?=
 =?us-ascii?Q?Anp3mgcUfZm/Xol+CqKyXw/b0CcrYrhh80wTM10xBprwsmzI5BoCz6szGv2J?=
 =?us-ascii?Q?kLeL/UyjUNM08TwgrlTFsWwXPjO2TLwYxlFBVU/8/Zd2/zJYvJCwhqTamcyP?=
 =?us-ascii?Q?H7MMvVIM2BVJ6Hb7h8TJWDgwYWaNIZ4fBbc/2zxU9LpkEuVpLuQ+HpH/9vZP?=
 =?us-ascii?Q?3Q+QdwmSz7PVrvuIbSUUU21+AZk755IhMsXtC5hz5JJxVyBmaLkwr7P3QmWV?=
 =?us-ascii?Q?eMQdEF1LzJ76tdVYwJDOgwHsB0sbfeI0E9cNXLfyHa/ggR2stX1Nwv1kdVK4?=
 =?us-ascii?Q?fV9YnkaGuYXyeD6fFdsLpm6/ZuQpg7kmSKgegyWB4ZHjDZ2RelNoqRXaNrzk?=
 =?us-ascii?Q?eVRsR02AHzzCkJ6ybpTiT7Mxks2BnIzxsiFSRY4QQcTrrP+IzsKQAT3gxP8G?=
 =?us-ascii?Q?TuqyodpMXbVUgU9UcYZUFNqhT92xqzcbNxmuNdOYStXpswYTGUteR2fKYNE3?=
 =?us-ascii?Q?mbH1SgLmabJ/8PzDdnJO8GdlB2tVos7qmVt99V2KG3lOZPME8jtyyqcBe3nD?=
 =?us-ascii?Q?hW/7np/ynnjSkzMibLhVIHtmwoWYrt2fSzbvYeFfUwx+canIoAkqMarIqZ4F?=
 =?us-ascii?Q?LSWMFixBiyMjZ2VAsK+Iiy8/1m0fCRsnqtYTT6uIzVRCJvJ1LL7uEJq7CH/5?=
 =?us-ascii?Q?1PC/RnqxY/ranP5Jf20GrAQvPLIlsQQJUq3wkh1H8VdIHe/gF8C8/rlfV/Xn?=
 =?us-ascii?Q?R0Z3b18SqjdU68A0lEGLP8mJQZ0+zUElsJYRAyVhu1H/qXAiqCOrqfSBcfYE?=
 =?us-ascii?Q?AVqbPL8w27TsfKSs53jd+XAlIPxOTADW/Tc7gmPTmTSwP+mZ50SGATIgT21I?=
 =?us-ascii?Q?BV/LFzhPmEsuSaCcR6DpKv56DOrYeG5p+rlrgZ30A3a1Gh6arLYrEU5HuxBE?=
 =?us-ascii?Q?sWOQ2x0Uy//wXY7DL3XHbnA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dxx8GvXzjWzLZyVemUdeaZl5vCJbd7fZ6EhGIUcmQZgsP3x2mwoTVGRfeu1A?=
 =?us-ascii?Q?2Y3QlVOp/OSmFHFhXYwb0qd92vh+H9tzV7p+03q9Ej8Y0TTeIRKMHYDH/OH5?=
 =?us-ascii?Q?dPPnQtud4qJWCyb3FhG6XFeOMuQt/U5Iye3rHLFqaFvHV07dDJ+yqWnJootS?=
 =?us-ascii?Q?ak8BFfkOM/gB5XLj8RbF+UGkxhqi46dhXwtyjXyZRBG4SXykyIHJc7mk2lGA?=
 =?us-ascii?Q?7dIC+uDTGdHcpgdaR11A0/qtd+v+dZk7w2mPl944RyuvVROvx7lF0FZusD4u?=
 =?us-ascii?Q?KJMRPi7Ui+1+nGc/PhsFqpyeOywh/EGiibUOIInftXAYZBioiag8GY52YEMJ?=
 =?us-ascii?Q?RyjTrYRyEleW1BGN+fPhNNunjcmE8foxgGOoQt9/hq650oLx+OU6zKOeD1wW?=
 =?us-ascii?Q?M7ei+ufSQF7PIFYKeNbQ/cugO43xP07JMtofwf3oHn0PBjkugbAFAyYcHP8Z?=
 =?us-ascii?Q?M900viybVhy1xqqUTifXaWIAzJWydKjVvtABwbO7ClrdrQMlj6Z+ZB0z6yEw?=
 =?us-ascii?Q?RPx0bIgXntjJJBINxAblD5GYFdksAmP5/dFi3Zw0WDUHx9gOyXzIF5GHh7Pj?=
 =?us-ascii?Q?+WgX6KT2UMP3Y73QVhuRAWi7x2yl4oLZ6CNVTJS1efhK+ym85RTP/V+/0ya5?=
 =?us-ascii?Q?7PZMHbJRz4SeAsaIJ0Uwk6nQUO1EMKPKf7Ng8hUlJqCZDcw/D7HdjiG6tipL?=
 =?us-ascii?Q?h0W8EGm5LgONjpdt4wu59miL7kZ1/ce8aok7wPe+AZvG9SuXcuAJLYA35ou8?=
 =?us-ascii?Q?DYy956DHjZkJch5u0uTg9Ob/KdDImx3O1WeRBTDmtLZ01/FvnlJzBf4ofbx5?=
 =?us-ascii?Q?ZK99W0C48eHhRRz+6kpd4rT7OFsyDgFu/zllwF+8i4VMTSPMRToR9prgIck3?=
 =?us-ascii?Q?mS042X6NyfCc3pPC/GdEKIKKrh/uK285oTH/S25IsPLTLKm/3CqHy3/QQ3Wl?=
 =?us-ascii?Q?Myet2M/3R3U0nDpyA8t2yzQjciP5O0P0v1wRPgk2H7aV8/hX+16Izb212vpg?=
 =?us-ascii?Q?F2G/UDlw9VVGaDgFlHnBd/5eF7bW7yt4F7wGpMPWe9euB9o9lKyln+jjpLAO?=
 =?us-ascii?Q?5R2kdZcLdT2Pgf/XilSJy44kNVNCZP78SD+1mal7DZ/l1jilj1aZ95bJDPQ4?=
 =?us-ascii?Q?o+vJJap62oR9kqX24y3B/xsiOcxwKuDS+cGtqsuvXd+5WePTjuKIQSP9Tny/?=
 =?us-ascii?Q?M1c07Sb8lsYu2YK4HDh7oesd/QdwxZnOhh6x4NagBXx7CZEU5dI4UWM3fbuM?=
 =?us-ascii?Q?/4w5GrUu6Ouyyx+tsGrKLeqM48ABi5qJyQAdnu0Ljt9tNuQ3F+dIUoijDYji?=
 =?us-ascii?Q?OkpSnMAFN5APkFjoyy+Eg/ACwO9KuBz+84YnguS5+e1wzQwX1k9brTVm6g57?=
 =?us-ascii?Q?oJH9q7+k9bYS0JGt9v/QqHfyqNDo1T31sWT5qDOCaK3PSviDyt83ZSMoQX0c?=
 =?us-ascii?Q?lmThEKNRY1bDeUgrZSh9ovrc8zmbIRelNx/2/8l/IEoo/DzYUIKxQlyXQK1H?=
 =?us-ascii?Q?ar+dZBXBlmAUv5wOplfrbmLhK23Lr7CLgixA0dG53es5L/9ELkbKuN7nHv76?=
 =?us-ascii?Q?TZ3sSmalNcmOUg/CA8qX/PV7cOI5E8DdeK/+887YQ/1h5HbonTfcTt4B5kjk?=
 =?us-ascii?Q?Gye/uQsHs4Yt/nrKygPYgX8Uh8zWnpOz7K9JpEj/kHINeK8/LBXc6hAHUJCk?=
 =?us-ascii?Q?33xMU6qvN0e6qQ7an/rDYiCXgnZSHE5Xlx90amlOHGqs1O1UUHLb8KsXsCzH?=
 =?us-ascii?Q?WZ97V085KGsUNj27Kj4mqZ7JIoFFPQg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac0da3c-5f37-4d20-6a5a-08de6e26d36e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:16:56.9172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4jTrqkzNtk4usvNveqQmpGNRnAgn1Nd95g3ZGgxxd4JkPprPtNKp8JgWNAbb1UoKAlpSKM81sfh7VmBNFnPsH2Ii0duZeyv09EFR8k5stw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bOYb4f+Z c=1 sm=1 tr=0 ts=69946a4c cx=c_pps
 a=KOHnGYwbv2QpRqiwWHMRyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=jZR2Jk4x8UeGw1_DyQkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: zpFB9ix3LTFrCH_omNyEhm6_b261gz4L
X-Proofpoint-GUID: VhoJQvhBd8yo4rNVnu8Nyoqq3MdrvC3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNyBTYWx0ZWRfXw+NwdBPfRlBt
 D9Yukb7NdGJfXAVV/RHko3GzPuL8HBssrEYZd1MDB3j9Zs5YOX6FeIKX5tEfZAD9JAC1dqcP9xX
 A9bNAKvulzFLZ+eT3PGf9cHrnBMZkLYDRDOfWqLxibTlIwQOm3rQY7R/GHbpoTSi3yokvCy5KAI
 cj8IMKKu6BQCu5ZDRLyQ4TLccUOLnn4Ymj7spjK6SW8t/47uDifbhL8/cii72qHXaeeQC0WJKnb
 89uI3Ye3cIK2XmgVfrIFSF8krjVrTm1Ac9cOa7C8PWaLLgCqh5pBok7iK39clEPfHxTeeF5rdCc
 38SRv7/7TZzTTF02DjXozwf8zZ4FwPXv2kfB7XfH4SIDcgrGqKr0Srw1iEhT95qjySswao6EjtI
 QXw0XP7xs6ADThIjIbTcoLFfTW4GtGa0ZlvDddiCk/mr1xh5F2XVeZg5QWmSDCB5etjXKHEzYKx
 Zms767OiMSNZRyaMqrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602170107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 13:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231254

From: Sunil Dora <sunilkumar.dora@windriver.com>

Fixes [Yocto #16058]

A segmentation fault occurs in rustc (e.g. in
llvm::X86ReadAdvanceTable) when reusing sstate artifacts built with
different host toolchain versions.

Issue sequence:
1. llvm-native is built with a newer toolchain
   (e.g. GCC 15/Binutils 2.45).
2. rust-native is later built with an older linker.
   (e.g. GCC 12/Binutils 2.40).
3. The older linker statically links parts of llvm-native into
   librustc_driver.
4. The resulting binary crashes at runtime inside the statically
   linked LLVM code.

The corruption happens at link time when mixing static native objects
produced by different toolchain generations.

Enabling dynamic linking ('link-shared = true') resolves this by linking against
libLLVM.so instead of static archives, avoiding the linker incompatibility entirely.

As rustc now depends on libLLVM.so at runtime, the following changes were made:
 - Added llvm as runtime dependency (for selftest).
 - Extend the multilib symlink handling to include shared libraries so llvm-config
   can locate libLLVM.so in the expected lib directory.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Suggested-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/rust.py      | 2 +-
 meta/recipes-devtools/rust/rust_1.93.0.bb | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 3ae1946e43..7614941661 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd", "openssl"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd", "llvm", "openssl"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
index a25f65f674..e02e7f4b24 100644
--- a/meta/recipes-devtools/rust/rust_1.93.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.93.0.bb
@@ -124,6 +124,7 @@ python do_configure() {
 
     # [llvm]
     config.add_section("llvm")
+    config.set("llvm", "link-shared", e(True))
     config.set("llvm", "static-libstdcpp", e(False))
     config.set("llvm", "download-ci-llvm", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
@@ -188,7 +189,7 @@ python do_configure() {
     bb.build.exec_func("setup_cargo_environment", d)
 }
 
-# llvm-config expects static libraries to be in the 'lib' directory rather than 'lib64' when
+# llvm-config expects static/dynamic libraries to be in the 'lib' directory rather than 'lib64' when
 # multilibs enabled. Since we are copying the natively built llvm-config into the target sysroot
 # and executing it there, it will default to searching in 'lib', as it is unaware of the 'lib64'
 # directory. To ensure llvm-config can locate the necessary libraries, create a symlink from 'lib'
@@ -205,7 +206,7 @@ do_compile:append:class-target() {
 
         # Only do per-file symlinking if lib is a real directory (not symlink)
         if [ -d "$lib_dir" ] && [ ! -L "$lib_dir" ]; then
-            for lib64_file in "${lib64_dir}"/libLLVM*.a; do
+            for lib64_file in "${lib64_dir}"/libLLVM*.a "${lib64_dir}"/libLLVM*.so*; do
                 if [ -e "$lib64_file" ]; then
                     lib_name=$(basename "${lib64_file}")
                     target_link="${lib_dir}/${lib_name}"
-- 
2.49.0


