Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54668EE01F8
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64848.1767104200728203324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MrlmyTkD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUD02gW2545569
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jUXONzz4P67x5nLEqTEWIiU6UVB9l/81Cl93tXcdHLc=; b=
	MrlmyTkDQlaMLgLR+Gz0fEa8bgx8K6GeauDMO+JkgG0uWSBO5CWPI4KciyaNJ6s/
	N+39FiaXLxZJPNDTXY9zBarCk12N9YFGtR1TsXrIxLesXZsL3tJgrn2qbVEG7SEh
	me76mTj5yFXsU8ssWWDeGImi5Kt6fRBmFjCwN7a5xy6m6jW+samc1i+I3Vhmc42C
	I5Zyw3HPJjL+JMMMYb284BMEFhMFcMtsLJB/bHvPQWebjcXXlM7OAZwCQUzW0ZNF
	ogIJAD76zVO/I7pop18cbjMiNTWXMvnLY+kLrKC9xmLPa5Tp8rXV9nav5LpVOED1
	HmvnU1f7XrdV6Ds+DssjPg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010071.outbound.protection.outlook.com [52.101.193.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxtxsu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 14:16:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0Lqtf6SnaPGmBe8uzkJDwL9SXAyQWwpCQ02rVp0iKR3FJyzKb8zY670YLgYVYHmEPz4kJQfEDr2lZW+uDLmgzX550OHbhEKes3ORpa/avK7aEciswQdhxoL9hg2BAw+VP7WGzjvkmy8mw3ZiooiTWMryPJBhi+ySOfxPsLZ4oY0TxzOCkHp76NLmjjW4sCgtvZmL7r3Pf3hguf+319pwxkwbJcgDh61/BOg5pRswxigIkzaCPzcPTCCKBRWB6BED7IQtUi/EiuqG7Kb9TY40s5muXxdjLlQDNEt6L94w9bdrnnr/9pUKo2Zd/aufJ29UT9fCqL1GuoouUtxpPTsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUXONzz4P67x5nLEqTEWIiU6UVB9l/81Cl93tXcdHLc=;
 b=ey+F0HZJ3GaTi6l1ofQrYf0FNjggfpzt9Rmw8v7l2bB0DL4nuEMr3IAy/bamKCAA2kt2lKgrMItxcumqyR484Y5gMX3zOcJeBQWSC6Ie8t8AP6NLfaE+c2R6ybX7ZPpU9pwrIirKKI8b9ETN/qS8vNFudub6Pi5Kk3NlOca23X+OSWtaJ4SK3AAzeU3Ep/on9ZgJjg/gwfibOGnOjatBApd3x3l2ehARcoRJqlxMbUaY3HdLAYU5fO+uekaElY/KTXnRmAWvXp8UWW8zj1B8TOSv6JBSoF1wxOg0hNIAVEd0/bowkLJOfc9fi3rdR5raLPH2UHMekxSq/ZW8Suhb5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 30 Dec
 2025 14:16:37 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:37 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 10/15] selftest/cases/runtime_test: Add test for Linux Rust sample
Date: Tue, 30 Dec 2025 06:15:35 -0800
Message-ID: <20251230141540.1974380-11-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|SA1PR11MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a33d03d-4cbf-4a4d-567e-08de47ae0b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rrBCIqWjjS0U7kJduXRG6pRwDD2eH565uGMhZOS8QESWBnhGD4s8Mk8kukyb?=
 =?us-ascii?Q?Yp7zoygj7PqmXNcsL47zA8VuvPx1Xiphn0sTjNXKHDKwmTuRTWnffZmCTIFx?=
 =?us-ascii?Q?OC385YNVDFHTAkio80SMZH/ZGW09RbQSXME6xwyCm4UtoRu0WllHPp2hnAV/?=
 =?us-ascii?Q?GpGNrgyozQ5jr2iOOBv2w/JPT9KAOcYontLOXlCzrR9QJ0otsvC0x5vBKoko?=
 =?us-ascii?Q?NEAlQhb2rQUwF/IQw8cf8/PRXxk/n8hkkwmwEBV6IPnMrAzs0uBA1nznDloH?=
 =?us-ascii?Q?XuB5isvIyTxsXhe0A5owv6dXzrR5aIW5dzPbD8PP5ox5kAUdRq2Eu05F2kOK?=
 =?us-ascii?Q?NBznGjOTojcOLt6+RrN6aeTbGH+XPfc8SbbjvVtZJ7ZgLLQ1NeAYijl3Y5dH?=
 =?us-ascii?Q?+B+EArJFYo6m7YdXBh0XRksN+OOQJ+txKscXbRHMVuM8/dd3gl2YSgDF+8bx?=
 =?us-ascii?Q?gHAETBfhHCFfgD+B8yaqI+w4o8H8S2FaDqpEyvETddwHMKyfibXoiqcwkQiH?=
 =?us-ascii?Q?dXDHsRf9Bup1P+e/l9NRJui+zQUQu28tHxxrmSK3n1GY0XDNPcI/oh2UZqMF?=
 =?us-ascii?Q?Km5oIVuBpSf8KADCuXylQ+56/w/yRyagTON+csl+BS6K1XPfIQ6kKV3hVjXO?=
 =?us-ascii?Q?MprNnkMS1V8q6O14Tz4ODbBfAwn5XMuylWGlDfU6kV6brmicX0wwgWLUl/43?=
 =?us-ascii?Q?0dSUh5589yMtsjdjn5Erl3g6CsTMSjcJLCDsU0qsFd+GlpwHuXMkCp8yA+Ex?=
 =?us-ascii?Q?jQvyVc3ibpn12lHvfAwWUG7ExUL7WXHByj6Psvm9IanXh87Z47d1OAL8PROm?=
 =?us-ascii?Q?X1EHI8OJCCzfFITzr7oo7BVtrWUNQhgH1FIA2ec/7J30kUuqDuTh/o33tzmz?=
 =?us-ascii?Q?U1eq1p1rMXq6Hj97NGbBFFQ5Aa3eqYU7BzPf+6gHXOnwFrg+OI4Xs00qwPHG?=
 =?us-ascii?Q?BL0icxdEDY+szffBd55zqZlye1ZOhhREmt7ylKF/EOnQWzr3VOLhqr0wtCbw?=
 =?us-ascii?Q?Vokp6eETD7drF9iIcKKUO1la7NHdC8OeyVCymrifC+zlj0/I1sfvE5TyHT4L?=
 =?us-ascii?Q?UAGEO+HvxOjPCV8zuS+uumY0tdMsRrBRnb1rXbuDrtyIqVnkCqOR0OVedIzB?=
 =?us-ascii?Q?CvRgHU09ir/e0fmglFf5VQ3o4DsucgrnLpRPyqMuu3K/zSZ/0OFDjq81DZz6?=
 =?us-ascii?Q?mQCMi+Lzj3bmNWOefu/L+PEnvuKEmsYoHzPYoli4XuKbUAPhHBsUvud0KFNe?=
 =?us-ascii?Q?pCttF7ELsrcaDznfsWWviDGir3np+bBD9EVoEd70p6Kw4xa1UsT/TGyGd79H?=
 =?us-ascii?Q?yZ5Zbn3Io+rnLrZXWibRHMX3AnfgrlgF9Xm5ree41C7/bpHPJ+zWq8Gq+dDQ?=
 =?us-ascii?Q?tL/RAswq5kPlmLwsFY8J4koGEYuaCwOI8cm59MlBNMbSudMVl9Fzedul3yL1?=
 =?us-ascii?Q?idNlkikaCOqsrGQebg1B2NS+G9urgSEVGvey6yv1ZZN3tfWH/CC2ecePLOwd?=
 =?us-ascii?Q?JYc7vyd5C6pBu+bLT+hV2+nme1nGKRz4Jw3A?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d4yiTRqwTqUrAQAf92BAz6O9AL08+qmQTHKl0ywoz8y8hM0cCXdwrQuMvMxz?=
 =?us-ascii?Q?LY/KDmvipBuyfO5m4LZDbVedGU+Ir1/KcZ+mfUYfRVjycedwYEK0BRmJbL9d?=
 =?us-ascii?Q?O1nTW0f/vs3shma6Ney+ZJ9QVH8dBBTqqimOtKes/araUHmcytk3gOSbuwqR?=
 =?us-ascii?Q?Zf4v9TvoRy3+skKAcCXn5Y09rOtgMTBxLAG0NPULNeFpEUjtxJ0cjk58U22b?=
 =?us-ascii?Q?TmdBN6TfON2dbJOHln5IfkwydcniMBGs3G6+TQQrh6Ni07UXC3DbrZE7BtKg?=
 =?us-ascii?Q?Fkbl9ujnppEy8O/pN7OY7UKcW5O+MRXoCkUDVOsL9Sr7/DPvbp/4aSO2gjgR?=
 =?us-ascii?Q?ny8mT4qjiViu6VxgfBoihnu66zA3Q3TULF7HceaO3HuSr9kAHazijLa/NNqF?=
 =?us-ascii?Q?EIEXMHZJQyV1C6pXWXCVXuU+uNLCoYcla6W5AM6QkLwGmia5sVPPppFpX+nD?=
 =?us-ascii?Q?HsBLgjZe1nA/rwCDUBA1rTrsr7shxyh8PG7tkSXcrO711Tx7BStrqHFx3Ucy?=
 =?us-ascii?Q?d4zdS6jo/PR3DG/JiDkhCD5X2iA4yt2ORZer2QyZ2s4LmtYCu+uqGHfU/Bq9?=
 =?us-ascii?Q?CdLM/zsmdfjLhUou986n9roqluaYfezkRSmvXyrTEVfN80l3O7+K2P+v0hcE?=
 =?us-ascii?Q?CCglJYmi1TYJj8PTT1CarZmww55xqSrvLfP+V61+VVTb7Y8tbx35JBPvONEC?=
 =?us-ascii?Q?bqkhvHD4qlBu3CbwDvvkgKVZTv88m3TR8ILnyQvC6k2T/WoOXvGWUhayRLwo?=
 =?us-ascii?Q?j2oJ/ymh56q/UfMz/KbsC98LQJCYA0pFxB3g12E/KBeuh7JE0Wr0wL484i/y?=
 =?us-ascii?Q?aVI11+jJOh4DLseCoL6Rny6MXXm43bAeCAMzhT26MHculr0pTXcB65xQt8HX?=
 =?us-ascii?Q?40aoudYdySboUUuSXjt+wWK1yuv7R+NvOsQLBXfgycv6aCiDsxg3N5Ta/Mct?=
 =?us-ascii?Q?4pGErhG5DDbcMtFnNQ8Zlo26HCNADRrfYrOXifYkb+kZkx9mTHnilhOZ0JtZ?=
 =?us-ascii?Q?YO5WCTyhnk0i6xKk021xDOTKhcddCjAJtH+cT7goBdPdSPZIxsXBAuK5GApI?=
 =?us-ascii?Q?2qxz5VIXliWy1m0qcMLsu4cRFTapb6lLch4n+jGsIqdzBfFUYduKAZv/2k+3?=
 =?us-ascii?Q?+X99Wa1BG4esNmWl4cw84ZGjcw2+yCo8PCASB3I3ti+jUF3AIWmy1bpbqjdT?=
 =?us-ascii?Q?JHe9cch4gceke82ieSbYniY5+Jfz4Z5Ddxrw+eHTDrSCKUiucEsM9NEcBxYl?=
 =?us-ascii?Q?NNtBnCZUbOGsD6BoZDmTMAEOggPs5P4dMCU1sl5zrcIoaoU1/ks9eJlYEOIQ?=
 =?us-ascii?Q?ztGa7i9JzAyV02ZxpFkMwZ2ngLpVGWV3TzhKheaxGBQzHNSnCCWZGcdqSKZ+?=
 =?us-ascii?Q?lUv0nkN2oU3FuOnHUUA7ioykpQJglOHJs4RvHNIXxKFDNfBbEyEBJX/527Mt?=
 =?us-ascii?Q?fJJ4YD0D+IXwsYPebaJUb6wO8uMKD6hNYUpyOd1QVxXKFO9lzCQMA3kDwWxt?=
 =?us-ascii?Q?l/Q0IYfUS9QJcE85aLf3i70BTHT3N0gC/3KpZfwBprc0BK3B7qUXHWoFX4rH?=
 =?us-ascii?Q?8bjhvAEns0bDYr6l2RZs7OvGJC0vVBYuU0FoMG47fC4DWh1j3onuZbMrB0UN?=
 =?us-ascii?Q?YdG6cUXlzHlhpvzYBd4d/ACHKU0NzVTsOoRNPAXjYMv9CSyusWffzCDz6IB1?=
 =?us-ascii?Q?acC672pgUzbY5RW0ghVCw6e0mtcJmlhXnEGX91QBDa+MoJL6mKvNi3NGn0aI?=
 =?us-ascii?Q?UVPnX7eKMtYBfNvOwGB7jhAExZDXdKo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a33d03d-4cbf-4a4d-567e-08de47ae0b54
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:37.4239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVkkfDicFL0zymjhiX7etQf/UVDSrCGeZlW1oFNqcltdWf43LZeVWb5BDdHPpzF45cfzqLLff4d2eHHMvRhgTIFhVBfjKAsJg2P3RKX42JA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX8cyFroge44Ay
 fe8M0UlAfDp/R44ymds4Guid5Dl0PiDnuXMyXqg54QCbureBNmuKnLyijMd2pCuBC+FxftjEsKu
 567/PlYbjG9+UPNSuepDOgBm+b+71sHTTHcdE0LiZxVkOrzP2Ak6t6LFEU6Cs1Gh0QEa/M6ex56
 kN73YWjY+1CeW6ICbYjmY3/piNLFpiYIaC6AqY0D3tE9jVcH+cUJv05WlZAk/dIGZp7iVo2Vuc3
 oHIZWG1NLBb0DtIefO+gAM2A7rW1EzYoapadEW80y+/QF8U//tB4NGR/QLiWKGbnKONZDh8Nqw1
 xtCcTxuKufrz1buZ00VzVU377LkNK5Dwrau4iZsp4QbShYHy9dKh+/19fwN50KxKRraoGJVZ1bM
 ONJy4zv123M4NTYRirLJ7+c7KMqBUDkueNjsvxtCP5mVHyPiVWF6d1GDRYuj/mICemC5H4ZZyjw
 66Hy6ivkE0dCOMAneIg==
X-Proofpoint-GUID: T4jxI_4h-uikXcbwT8esuxrNVLLfusDq
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=6953dec7 cx=c_pps
 a=/fsfGrOPy16csppsbskbtg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=p_vdLtrgfc09iYJXKugA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QfT2oMe8kMrGCT9ijLkmNIjXaMGUTc-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228676

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d58ffa80f5..e8374606a4 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -481,3 +481,28 @@ IMAGE_INSTALL:append = " systemtap-runtime"
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
+
+@OETestTag("runqemu")
+class RustKernel(OESelftestTestCase):
+        @classmethod
+        def setUpClass(cls):
+            super(RustKernel, cls).setUpClass()
+            cls.image = "core-image-minimal"
+
+        def test_kernel_rust_sample(self):
+            import textwrap
+            self.write_config(textwrap.dedent("""
+                DISTRO_FEATURES:append = ' rust-kernel'
+                KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+            """))
+            bitbake(self.image)
+
+            with runqemu(self.image, runqemuparams = "nographic") as qemu:
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_minimal")
+                self.assertEqual(status, 1, "Loading rust_minimal module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
+
-- 
2.49.0


