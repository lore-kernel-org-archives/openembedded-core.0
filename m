Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13168CCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 10:45:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32672.1768819507171974467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 02:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=riKZk458;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=547974ebe8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J4WOrl2728450
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 10:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=IWvrAof0I
	pyG/wnr3SPSK/A4kP6yvBMKTeRyqbS0OTQ=; b=riKZk458ncVkVlrz2nfcMhVwy
	Gcm2qt6VtafEZty6n0lZGnea8Xp8YUWP+NIazuUCQQbV5n2uS4Qz9SrTmHIYaqk8
	4y8qCeV8q5KZw0ToioQ/3lWasdNgIOjBx7cB8kOv/R8R2aLULviftN3iTFKvdtWC
	ruTrRA6KOJW9ccnpaOlQR12ZI18UBF0eMhQKdxX10GZfajBzH0NMDsIvffMOVDc8
	IH73y2/pZU3fKNveXcAhyPwuDFdIEuRBxEUUlrH3HABnZ6YyuARLookWfPUotH6V
	JeFi8Ejr+FggCxbGtWUylGAZqMhiHtpiYd44EDkUvy0YYWr2cDAc/5SoYU7FA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4br1d49pw9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 10:45:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrFt21PyjC53rXm+GzorI5CX3P85/lefhC+t2/l/SL9e8PuiUuvbAVUOMq/MxP9+IBw3yj0ps1PV1R9iLxljijKGcoUDOuJ/zaljux6pPspCys0z875xLJx9AsJZbnkeYMus7vE3Puj14DpOWMOeK4NgQ1h5a112gETNH7+iZ7/kWXhm/YSVP86lwI/uMZOMkWa21zEqN1l960EIJegycxZ907f5qOF9k5rmgWK6l/QsZiQVqnL6TpZktSq/f37Aqx/q0WNx1xbxMOjDYkqzBZ1h8/XT39pJS5cp7cjY2wdo0i5Xo0MH/ut1LH5DWRwcCJ2b4knfXroGjwe4tOhpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWvrAof0IpyG/wnr3SPSK/A4kP6yvBMKTeRyqbS0OTQ=;
 b=xiAgEW1+XAFuQxG8VT8SXVg4SzIYDMOk6e4XWJWne+IdOb1HQKY7NFQ1YwAhbt6Ml6KjYoranceIyq/3Cys7em/vpljHGJNK9p/UMxXTYzjcNdGffvbe8UjXwsQGh3MIgCRzc7RyI/jxgc7/vJBU56eUaK9knXYax9L+hCedHbVK0Kp41ar1PtNJzs0o3RFINoNO0dwMU5ym7ZrVFdgUTaP49lh+w1nSS8ayjdr0VLIfOOS6KFwjZumDUOT7Xw/rwvWstm1ljD/RWrLP0K/3bdsp+aH0aGyBoGXrRHVvBJ1YCFWQmpYcim573tLT9buVlm+eycm7MynRZxm2gEW5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by LV3PR11MB8556.namprd11.prod.outlook.com (2603:10b6:408:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 10:45:03 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 10:45:02 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [RFC] rust: Drop oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
Date: Mon, 19 Jan 2026 02:44:49 -0800
Message-ID: <20260119104449.875901-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|LV3PR11MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc6dd7c-fcc7-498c-9f8d-08de5747ccd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wMpfSdn9HP3zwuDBtl8sZPfc9B2PTPag/ci4rDXaBNq/v2TurOx/waAsYyGn?=
 =?us-ascii?Q?6fSWRGLrnHb2HAuZrD2lEEEuZbaVYX3JmkgH5yd19ALIxtmJSyZ6u/vLTMj/?=
 =?us-ascii?Q?N6Ikg3XgtHsGup7YCPgtrVmHIYKcFT3BJC776FakqFwqHpSVYie8Uw0y6o8m?=
 =?us-ascii?Q?igLrxLHJaQ6xqjhdgZh9Im3+xkG+ilvsn18Ecp500nu8mbL//NxbBg7FjQ8V?=
 =?us-ascii?Q?vcE0tm9I7DFBjX1vPgEu008bH/31WPGhXAuA7xnjKSOHuxLd356ZHSwbnkwy?=
 =?us-ascii?Q?yK4bWCIZ1IpAVK5Wqwe3F476eFoK79NGRFfVz5vye6dN+jlTGpoFVhEWO5O6?=
 =?us-ascii?Q?VguGTROEgtWRELox0JmwwMVW20DbRhRmwgf53E2buADpS1xja9oDGWNayQ3Z?=
 =?us-ascii?Q?kQmE0EDyMaoUI238W5iFYJUGMqq9th+AiTJrHpCdXFy38maBtNpy6tT3UPd0?=
 =?us-ascii?Q?Sp9sF9Bvn3m/qxNMaxHSjLOECpgngzzIEJGbUUM+FhdOiaxVyPBf2sElOFG5?=
 =?us-ascii?Q?S1hrV9aYEVW3iPxFQBd468duOhr4NpYnrjBODUXUgWfyNR/7zIka31UUytps?=
 =?us-ascii?Q?UI5l4l90JJJcC5EhhbI3w+7s3xgVbfqPp++DVrvNM8tFVACVnaJEqN2QoZs4?=
 =?us-ascii?Q?U0YBJ2hdKzyeOw+wKEjs1o+VkLWkRJC07/Xfj8iek0WqERSQATn90OE2KW86?=
 =?us-ascii?Q?IISoAE8bINjKvbN5tmK4bFhbYObyJSATndTEoGY6MfrxEKMoDFXilq4C++SD?=
 =?us-ascii?Q?D6FNApjdCMUwWGaTeiOtqkGGazUTx3qLjFSzhjkNy0HKwPMxHO5JJmvX3yf8?=
 =?us-ascii?Q?JliFORIgAI/gI7Np7cxwJXhd0WUHDREftBwPpzr/Z2da3JLIZ5ai6DwWZM7S?=
 =?us-ascii?Q?Nzw4f+7ZJGJEi/IKuHSPmGw9A7SUbZbpQ+HKZXoRzcDPRylSwpCveG80DiSW?=
 =?us-ascii?Q?5jAXnXMOY1XngYDqjJjWI0WaUEh6/U77mR0sVLZ1cKiwaMj72t0OFUPQSBtv?=
 =?us-ascii?Q?omscm+xOtwkc8qEzuPxsc9xxNSr8itM785lBahWHuSEiDaKkVSjGZP1Fq4UC?=
 =?us-ascii?Q?dI9WGadhSTXyN2HtdHT8uXAa9YbLLrslloZnKwbVIFVAFPfYozU7l4bZo4UH?=
 =?us-ascii?Q?5PAfsABMUbp9S/fj+0FBMtxMA+5b1NZs3qSj617ShFdqa0rzkI82ygRu1HI7?=
 =?us-ascii?Q?3c3jVIDuepLRduNkzrVrHbygxCntQU2ibyJvaF8LP9a8A6ra6s14mU7aI/bf?=
 =?us-ascii?Q?JP1fy3TmujRFH6dJNNk+AbLMpDinGlRHxulsMhm4DzslBTv/c3d1JBymKs5n?=
 =?us-ascii?Q?LV6tebyPSiLPMpOCx42uV+UJ5YtjC8Bsc3gAgBalDPhhk6JFYlJw3z2Zgvmv?=
 =?us-ascii?Q?iWi07e9hr1+Mz8Nn5yYNm78pJnxQbjCm6tlp5J51EO73kyz/EJhO9Hme04OW?=
 =?us-ascii?Q?6a0GUiFMPEDRfph133ReXZjP7RM2H9Dne1qXKENgS2K/IrkTElS/5Cwmrclh?=
 =?us-ascii?Q?f21XJvqwOCU6scPVz46ZFp8wlO+CVtWMwAI++mkkZ2X0zXlnq61A/draFNcL?=
 =?us-ascii?Q?wtRsRY+/2Ui7Y+E1QOTyCKCOqAI6gQTQAJMCUh3r5wP24gu/tFZx8BoXgku8?=
 =?us-ascii?Q?mmSHa0H2+Njpe9qJ5uoZHyo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cgx7InbjM1b+plB/VmrqeeAXFhbNEuX6w1zdx8Cpk6C3XxyfojEERxRYm4Jv?=
 =?us-ascii?Q?e9SemcRwsMZgRNohGOJRurAB++0YhZIaGDH7lb4L6r6HTOxnq+PUIjkCZpYT?=
 =?us-ascii?Q?55zu75HySQOsJGA5ZaHosvRUhvL0CmymO1NeVChm1+nhi6npE8CewwxhlSOf?=
 =?us-ascii?Q?/8CYbkBlHcQNirvTmKJXr7swCdDOZLITSnzLl0QZLNlXcYXX4ApXcApNtf8M?=
 =?us-ascii?Q?conIpQDNvdH0yQYEXIh0XAuX/f1a1e4BseNduX9kPVsLzrvELEO/4WISttQ9?=
 =?us-ascii?Q?nLrVCDu3gp+7X04c0Nh21nBAiw4hIYacvcBDMe1D9J6IodmHJUQReILMG/Oy?=
 =?us-ascii?Q?dTzGtDQ847O3kdhMZdVprUrSZZaMg9XFBd2Ic8ME5+tjj88Vy5jcBf/FLE52?=
 =?us-ascii?Q?lz5TpsNuQL4kLP/hPY++/gtCUybGZBHY8keKp4J3HXlnYefjbUNkRGi2uKxn?=
 =?us-ascii?Q?+86mET+crz+fgQVMEnukTGDAdAc9vZI2OplkiAuUwUF6cjH3S5VS7539A40r?=
 =?us-ascii?Q?41lL2bPNpz/wjTu05sBXziRVveLuyqXh41oklJtWfkHJtNz+LUpHYWtd4wYw?=
 =?us-ascii?Q?jK003Whp+za3RA2VQOc5EDz6M1a4CxOuB3WflqXmEQtgSK7yPrp227fCZk/s?=
 =?us-ascii?Q?jPW5PWdt87o92PqY/R296WZ/MFbQep2WYYOBZanN1nVnYDq5520QKvmRK2jo?=
 =?us-ascii?Q?cfJZbJyQUHooLKotrtKbNoEmhKKU9kVGDX7Eq3WAYfc+6SBRtceIu029t56Z?=
 =?us-ascii?Q?ql2Bx8k0AA1hrzh6JL1ixX7Ha5a9lIWMNEwhoXML2X1qKELCpin0qHkxg+W2?=
 =?us-ascii?Q?xHb2j9IBAqW2yKmLDNPytqFJW0Ejv2eF8qak8+iKpLKjb4cFbytAvVNuv5b3?=
 =?us-ascii?Q?nz15N/OQOplNVCOW8GOxM2tR9NGvm7Xvi6il4JlhFmx6Xycagpw32JtS8KIl?=
 =?us-ascii?Q?MigwlUPRiA0OISBbwTihcBJNVy71NlNnVcuv4dH0/bCSATe/B3v+ZoxqNldc?=
 =?us-ascii?Q?y+eISoRDKPA7uRfOe6txAxa3bQ0N8sKjJHaLd5uIoagh3yNNhELPNQuiekKy?=
 =?us-ascii?Q?V+amZ2/PH3bjl0sCXdiDS/uaUYTktLcMVW36p9tlnxzjqluYlkMv1HwZzNxn?=
 =?us-ascii?Q?oYqhXxs9BQNeDvoBj34fBbgH1KKIw/C8rwTAI9HJm5b4MDsXZW2t1TcdJaqr?=
 =?us-ascii?Q?+g8JZF5BhZ8Ba0TEuIJP8LSVgGowkxIkJP2UMkySe3HUOJGRWqPvoGnA21C6?=
 =?us-ascii?Q?qssGwZIH6jCji3BzcgkEAPY46TynNqMuptOaWgpovgHUlYtC8+3HmC4/Pf8u?=
 =?us-ascii?Q?nJyfHA/QV/Hq1sl4rFpyg0SBVWcLEvbffApOjA9N+tJ1z/63lbcByIXvObB+?=
 =?us-ascii?Q?BapJfRhEOpeOtNx2+XT7zEX0lO3C3yk6TD8ZsMQ+cxKa7a2C61aFg2fg8GVm?=
 =?us-ascii?Q?eLszogHuehqR4Vz1j3qLGIWLyS0+sUPxRQI4NjpgcvoSe4QYUCGdfK/csDrT?=
 =?us-ascii?Q?85OZFh9LiZu1BHLFiOyuazAjA+4YLe2WlAHEbwfI0Ts7Q2OiH/TQ9219/74Z?=
 =?us-ascii?Q?Lv7mzIwqKT8loGRlpJO6JeDLJcei8fCbe3eznB9IKbwiaCVjOc2U6UD1L4Ke?=
 =?us-ascii?Q?8fF2R10hbRlY6Nr5VXd4Pe2M9+/eQxxdIyvTEWgEXXUp7q3IyhQpBeklqNwT?=
 =?us-ascii?Q?SOISjjnWhbJ12eFXSnObMRBdRlWDrRb7gd0HCFL4/Oely7kpOoz/vZ0AY60x?=
 =?us-ascii?Q?O+Kp9/Y8hRvA1u0ql1ZN3tyMhjFDmdtWXAaxb2sWII2mov6IhAjx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc6dd7c-fcc7-498c-9f8d-08de5747ccd4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 10:45:02.6147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McvR8+zvzZg7oPRss5swHg1uZXf/KcWTDT5oa99HXnlt31SYEjy4nihVy2yVXPD7d/G3ScspVcZgjz7M73CjEAI8TfMs/cYbxh5+H77oiPISynYAliT2m0bxYLnNSxhJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8556
X-Proofpoint-ORIG-GUID: ZCEHuoYRqNdftASmOzjxPDZ7z_HhNIVP
X-Authority-Analysis: v=2.4 cv=Rs3I7SmK c=1 sm=1 tr=0 ts=696e0b32 cx=c_pps
 a=cvmpvQQCsZncHh92cDAFKQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8 a=q1SAu9DnQ7EJbCrOdkMA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZCEHuoYRqNdftASmOzjxPDZ7z_HhNIVP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX1q78WOwC3A5L
 UB/PncvM4gM3G32DJRu3cfCO2r49c0MwU0x2VhV5f1ZYycsb0eqkCyJU37nz2QUj2MDx5FB8VqE
 4se6YX79qfDpUoOgcXRgO06nx1GHDlFX2YSCzByPs/JCo+OZrdyoNaVR+PVbVApeK5mzij4VU0p
 2QNLMNzF0uXpfDgbHbRs1qB2WgufRPVbphtC3oglahVPlYY6P3Z7GBv3vBLpz0hhZwCH6g/MRym
 AjpYczGmmRqBypKqRTHPP4QRvT0HYmo5+GXhWkpgWXao4nc2Qa3JY2FyJZz9DCzLEXh/0UYyix0
 7/A6Xx+HZpORpIsrQyfYDhBx23zSPrWivQUZO/MrMuYxxgjAcKsFTEb+d+ZRt7svRK20VDPtXkx
 uRQyP4fGmCmYvu+/y+Eh051TC8YuwEQu6KqKeDcu4bL7T2vwuJFFkfrEyG3gEM0ELv5X0b0Gph9
 ruwqsDFeZNdGtzp5lAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 10:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229606

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch was originally added to address a rare failure on the PPC
target observed in AB. Currently, we are no longer testing the PPC
target in OE-Core. Therefore, we can remove this local patch. We have
also verified PPC testing locally several times without this patch,
and the issue has not reoccurred.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...crease-timeout-in-process-sigpipe-ru.patch | 31 -------------------
 meta/recipes-devtools/rust/rust-source.inc    |  1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch

diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
deleted file mode 100644
index 5bd1abffb4..0000000000
--- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b4524278985f517b0785b6f64a21380dcf1ff096 Mon Sep 17 00:00:00 2001
-From: Peter Tatrai <peter.tatrai.ext@siemens.com>
-Date: Mon, 4 Nov 2024 13:58:16 +0100
-Subject: [PATCH] oeqa/selftest: Increase timeout in process-sigpipe rust test
-
-This patch increases the timeout for the process-sigpipe rust test, which
-occasionally fails when the server is under heavy load. Increasing the timeout
-reduces the likelihood of false negatives under load.
-
-Fixes [YOCTO #15625]
-
-Upstream-Status: Inappropriate [OE testing specific]
-
-Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
----
- tests/ui/process/process-sigpipe.rs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/ui/process/process-sigpipe.rs b/tests/ui/process/process-sigpipe.rs
-index 11f363d62..c12d66016 100644
---- a/tests/ui/process/process-sigpipe.rs
-+++ b/tests/ui/process/process-sigpipe.rs
-@@ -23,7 +23,7 @@ use std::thread;
- fn main() {
-     // Just in case `yes` or `while-echo` doesn't check for EPIPE...
-     thread::spawn(|| {
--        thread::sleep_ms(5000);
-+        thread::sleep_ms(50000);
-         process::exit(1);
-     });
-     // QNX Neutrino does not have `yes`. Therefore, use `while-echo` for `nto`
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index d7d44510e4..3edf0899ab 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -4,7 +4,6 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
-            file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
-- 
2.49.0


