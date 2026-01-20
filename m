Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4241D2ED14
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13451.1768933895290289817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f6blWw+L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KAP2Oo4186223
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 10:31:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fXT/I6Dfxn9DiLPrD+J+U6LQvETCL5/Ok2ih/g05DQ4=; b=
	f6blWw+L/5k6Q4o54ctHjqRFVLNjxAWan5bBJH6YRSuq83moRqG8/R7IkZWFgNwN
	0uGxOS8zeI884dgHX5jPGjwgu5GZT5lFy/cF0RUBBVqIPBbhPJEu3muPFU5yxc3w
	2ooEnpDa1S+JmOnUVojF4DUfWyvmvulmPKyPLb2xykdGpzR5AGuRh7IuxrkjU8oi
	Elzu4kf+HeymQ7dFAJC03fyI+nIY48xEYh5yDxLOMk6j7t//ppoZUB9xAriOX5Ym
	azBGyqEkkTAaLWwNOqBAib8mjQzn3OJHSXGoM52AQ05aRCUhADyQz5rTL+HK+2mj
	k7o4lvExMZp3Ep+jlgNGCw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu4jw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 10:31:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvYMVLwgJ9IFNyH4mIawseVM0uruafCmcUAHWXbxfXNOupvsF2wbfpTk/TPmyratHtTDx+xazD2H5d0IvWbXAfAKKEmjW32nx56OmBY6hptCZAeINJTLBHq6ehD2kEOhdw++XC5w/AcNx9T2BUdHno/3mEORSN4iL818j3fF0wT6rQLLt5zwcctt4cy4g7fFqDTGb3A/Ok/xgFj6uceAKy1yWkK2tm6tCIGqLxeGI95p49r0T6wu1FpxchIlUUXdnefJp3ncv3PAbbDrdA4sc3MDFdvEfc43U+f1ix+r5FW1mDZwYI/2sAg28YB5+1MzTMyVSat2LpqneVC9+tzo1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXT/I6Dfxn9DiLPrD+J+U6LQvETCL5/Ok2ih/g05DQ4=;
 b=qEeQbSwsR6lFqOJc1NpgFXXlngn3/PgY8+BWgUhCkTXJPU9imkUZqKh34U7PQCZkFfcxcqjFySaex2znYJ0dnCZ6n3CSFrBQsd4trp9IAbTljDbNDWSg75dz5ayhH4yXZQh+WxfvczQSh60s4qbM/KZCvyKT+eeOWhJaYQdVMN8b9kkZyN3aDBepB1huPNntD8PSsr+L4v2a6+vx2YO20E4sNButpJqcOducNEA/VcOCdE8GUfkNTUp6fLn3Cr415vEzXOiSX1/uBuri/occyu2sprTpTibh5GGV/jK7ehyhMR5riwrd8Ykdeaj9jYRaBJenEG09P40CYsxlqb5NkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:31:32 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:32 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 09/16] kernel-devsrc: copying rust-kernel source to $kerneldir/build
Date: Tue, 20 Jan 2026 10:29:40 -0800
Message-ID: <20260120182947.857242-10-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 730c98cb-896d-4b22-bc24-08de58522249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3HSEdP+yKuKxbZ0ovaSVB10G2NNsBfAiGbJEjFBH3QpCq2JB5fSNf9FetZJF?=
 =?us-ascii?Q?rOPl+k/22LT83pBUW71rdb6zWQ5kN2tT8WRrCDDJuaiHnEJPVemjISbs9Nn1?=
 =?us-ascii?Q?I8evv+4W7tzczDTP+KGKTM6mqi9smmd/gV5dqA1B+k9obEu180KaVc0XEfT2?=
 =?us-ascii?Q?FGDsdXA7cZOtJWFm+lugR66ZCWISKLS6won3CfZmo5A1CCfqukotNdCyu7je?=
 =?us-ascii?Q?PDkZFsZ4LH/Ax0gbtybr8bMUSQwex4T0ZXHFBVu2YCQaiRXlyhZnWQQ2xywi?=
 =?us-ascii?Q?ruaX+j3lCjNhysy979VP+WiIlYerY6fMpX7Qscm/n3tjl3nXmMq5WOPb+Xrg?=
 =?us-ascii?Q?p20QFVAjEqwUL8LjOQqOkhBORzcO68ZAzhSW5BgY+//YXF0yiUwAj25iJ613?=
 =?us-ascii?Q?Bcv8QtGQ0zVxUt5EhuGCj8dSViJIOI+LNfEzNUxpWvs1/abQQSHgoCynxp6o?=
 =?us-ascii?Q?wRy15rNVqfKznLmc4XCM6yTmlf6LX8BmgCIOUCgAFm1qxlRnZzbCTIrgOBmL?=
 =?us-ascii?Q?eg0o4JZpON7Cqy/xvr3bJFezzV2ZYOl8s+6oCgXsjgWCYMVzYjuGmetF2rHv?=
 =?us-ascii?Q?kD0fDCC265tSMV4EQbKtvmeexndNxyBEOrssgQf896IRiwAFSNqyCGLTkltB?=
 =?us-ascii?Q?b61rBGsqFJpCL/gu/qBBiIJsjyuEgmDtzGLb0V2EW5pHX4xAosREsas2S63U?=
 =?us-ascii?Q?CLZLihDTBYbm3EwqORr8XEoM1eI5iO+7ZcXOoe0FFgH9T6kQh5IT8qZu+8a9?=
 =?us-ascii?Q?iNL6e4RGERaJs53BeqPpuZG9KLGFF3kDp1BhoAY/7r9PhczfL/OU6Fc6pca2?=
 =?us-ascii?Q?ZTUiar47XAg2FuBpKUG4KZWsX8JqUb2qcI5s4T+mQDJcOnuDYR1s49r7xMMS?=
 =?us-ascii?Q?DKx4eVbkQOxbzfybX7McD8GF5O2YS8Iz5dXYnw6APpOb0nl7ddKvrful2zZG?=
 =?us-ascii?Q?kGhHkQjqBJ3DGNktAuf1O2N4+tcWMsWxszaMKGS/nCsT5Wg1FNLy0p31Icln?=
 =?us-ascii?Q?AQuJfLvhdjU7O+t1ZFacDPtmje9YzikF98jBRvkou4KnXjF8WAhTg69oYRkl?=
 =?us-ascii?Q?9bCwtKj5fDDmwNz/FFoMWGthiCTzMl/JlJEbkPUg32+k95zDzBbWQiTmJc8N?=
 =?us-ascii?Q?ySjVtUIderX2Z9znnpUFUKScu6UL+cpnymW17PgQw/CuP5BcEVIW6/T+/8XI?=
 =?us-ascii?Q?iTHbjuhvqXhBhq9MKwtQWAbk4j0sZGNh8zpoqgZuGA4Kq0Pn5WKISa5Tesss?=
 =?us-ascii?Q?aGdHktCdE/LICPBg2c79OPWvAFJYSSvh/jLuoeeaHSy9pnQJ0l1vw4T8r784?=
 =?us-ascii?Q?MHduwU4RCdT+bZZDj5UNSIjfl8sN2RHdEaA1zb0h5zUTjE/tVGRoEDfa4GJb?=
 =?us-ascii?Q?gks/R/a/NpB2yK24azyUjgTXdrSQmajsyiS1CDqXrU1kv80YvduT+AMKOGfy?=
 =?us-ascii?Q?ZYpk36xQRTphJCTRUE20FvLlfnCqs5TZMSfZx8BzAaiH9n+yFCxmPQDJYtn4?=
 =?us-ascii?Q?IzIVQmAAhw1tlQCiMCcRG5mOUm7anowuxVeGIeQgpLLGl/a9l7pH04ih8B+0?=
 =?us-ascii?Q?ELWxFXAsc2brobjzGnAbn2SHOMn6ikyKPQOy1vKacbBEvn+MBX86UVpLzSf8?=
 =?us-ascii?Q?1DQZROdUYDUjel5+BVazYGs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kbhoOwpDHA4Cr9EC9gQJZcgIUzGkp7LRoRLB6dLrQe//ziYLWge4H7hQn0HL?=
 =?us-ascii?Q?tUn1fcb9j292BZ9R7D2tRKlwQ971LE0TscltuIpLVgy0HnqqeI4M04Nr3WyD?=
 =?us-ascii?Q?9MKpTt7Y1g70v8DkinNbUfFjp/G86c/zO23+HKX59KA9M1o9GKBY9+sPpwVD?=
 =?us-ascii?Q?pflw36K2Es/vsJkqt2GRMNYBFci6a37er1g12DJSODhN8GJRUINsB5AXWKUl?=
 =?us-ascii?Q?ftzZQylCd4W+R/i6/SX9MSOEl5FBhV/ZTVLpbRIJZ3zNb33tZ1oQ3x8eKTV0?=
 =?us-ascii?Q?iGhR1AiRUvNteQ2A2N8mXQdwCoplorpx1qe33pG2N+yHjxCzxJPojxIm476h?=
 =?us-ascii?Q?DKVYoz9kf/MnKUtXgmqY76amQ1QNfh3d/gWPi9G90ghoLh2LHrf4zCffGS57?=
 =?us-ascii?Q?sBywGs2D5WDChWK59rhqc6tkQM+8cyJx/0881LNo+rxBRsvLXc66vAI/rvVv?=
 =?us-ascii?Q?AdbGIm/QyXIOoCuVcR6JD/J28LBgg4vu/xta2N1RnCnqAPS+8nXC3M53CXCx?=
 =?us-ascii?Q?fOHK3xnBGeL6iVuO5gzjb8gIP87l0oL3rthwpAN6ROWu6b8IRmm/LWEBhQRt?=
 =?us-ascii?Q?K35/OhhQyNKTTGk22MRsSlQl6/Gc2Gk7YPeBaCLQpYv9YiuoP4UXnjDPqJJi?=
 =?us-ascii?Q?2Y3agHUC/vvysGO6IwsioHDe1w4Hzmxesz4gGcQXi/o75xtekWQ8b64XVSWi?=
 =?us-ascii?Q?OlE2ViiLnczvweiE5qz9VxT0GbGm1FPtdYRPEwVNrbsJanEtWb2CbeHjN02s?=
 =?us-ascii?Q?+XFLhvUUy/W9/BOGR/3q0iG0cizNjtsMlqExw1Y6Bxn1ZTtBrvD8IyL7uwqa?=
 =?us-ascii?Q?eQNohE7Ifgwvyqj/EKI6XhsJxQqSe9pKUKohzTuxdr2YzRLs2ns4pRKpGdWe?=
 =?us-ascii?Q?thF2wuExhbdL6KjanswI8nd+qbQPM+ZewCR2Bq0dgee52x6kJnoFRm1vzkZ6?=
 =?us-ascii?Q?bsA4GlquvWdD611thiProPwslnJlMnrA1knT7S4tG3RSPsdHlWFI2FfFe/or?=
 =?us-ascii?Q?rIPnspaXl2DpJi0z+ZmvBSGSMpnux17aC9lHNqMzbj8CRXTRQO/340UCHqaV?=
 =?us-ascii?Q?+aPPbfL04KzmXm7ZoJ2jIU5O4sv046cntYc7mzOX13JDr94VUejF7gRusBzm?=
 =?us-ascii?Q?wcsYoMOaJq0Yg3o+SrMpFebDkaYTwr9lj14L1Wll6WL1FfYtL1BBbvl7/WM4?=
 =?us-ascii?Q?irYz/Wv7+k4lPBe6PM2wpn0DeTVx8HjhoPHAOH170CQUjfK2bCVn3ua4jZpT?=
 =?us-ascii?Q?3BJzbX/IrpzE3K0Bd25vVb/lXSQnB3Pw9q7W7mRtmNMZ5BrD6vE8YELHH6nN?=
 =?us-ascii?Q?Tx7XDAIwVN8hQ/3NeCAQv6yk6C+FLlNcPhWi91L/A5kQyg7kE+ugZc9a+Y5p?=
 =?us-ascii?Q?1jBJbWNQkq2CICIXPf7I8qd+WomP9Q6dP4OFVtV17627KwRIlyuHUWGfZyQ2?=
 =?us-ascii?Q?3YIhFcFzorlRFW+oR2RmEY0fqJZgIFBtNXaR+1mDAXh2cQvvgTCB35dBgIAL?=
 =?us-ascii?Q?XmRTeNpy0oYQa6MgLnD1rgY7/GMLzLiV7Qgy1ktfoy/seXcU4odHvlUf5vPH?=
 =?us-ascii?Q?+eT8jZvt15cZaoua+fPQ4o5cWzz/nQR0IUZs+zDLXehbU9KrPEldG1oKzfAH?=
 =?us-ascii?Q?g/UhHIPS3gUqGXrscdNRPgzzRiv6crEzKkEQWsE1HXrwcmnriQlOmEogK75e?=
 =?us-ascii?Q?grKEA62PRnZDWWoHfQsla0vafGaLlVPe7dWqRvqUxifO5jI+n+5DRtTaIg+o?=
 =?us-ascii?Q?D6H7nSQh6sYyXWi0BUrN2GoHbrqKn6g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730c98cb-896d-4b22-bc24-08de58522249
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:32.0563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1LLQljBmYTTpZj9zr94aY7yZwqXAP+QzZzcQ757uySM2wcf9tWHlAiNIdnkR1HZqXO+OtijhvN91BSsAYX/pfd8G7qt2nXMuoXIz1VqsDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: VYtVdYScCwabowSXYMuwOesSZKM0hJuL
X-Proofpoint-ORIG-GUID: JSOBFxoM666Zq3-OhhpvptysZSY6n_0L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NSBTYWx0ZWRfXwfDNBv3CkQMs
 gissRb0U/cDWQjoFveZCxRl+PoyV4NXYEnU5WnMB0JrLND5gNwSZgHhaG1sFQV9A6WvMH5sHdyM
 oYC1ioNO1Ffb2F+72f/2SBiKnrNXdOBczcbpUDJMPAJoP/KVu67pXPpAd8TZF/GWZt6SiIzBZ2C
 FJzeez0lf/MgpQVMSSmChJGQ0Sobj09xjnsLobAktYXGCX9Smb7ehYmzA9rCbGKBJjUwSaKXBRz
 sLfSqSseF/nQr2HcgJo1ics4Oyngs5c6E2MUHIy/cKf0Huq4i8Onj/cU3yMQ6OSFPVWrXBmjaI+
 gJazDBtcUq4AVvb+qfDw793oLgENf1jmbOaaeWWRc9XTFGyo1XnymUYANXNWw81iVK4cZvAM+iz
 zw3PAvKJ88rPyGgV88TLk3wsPw9eDoW7ZzOE0+XU9uQlUWWyB5pk8A4yYGbcc6804fkDINYdYxV
 Co53++hLZflBfzA555g==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fca06 cx=c_pps
 a=j8kfsx1CyBm2fJFf+vs0Eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jGeDP5ryJtbC-vnzprAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229776

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When CONFIG_RUST is enabled, running 'make prepare' in the  target & SDK
fails because the Rust kernel infrastructure is incomplete in the staged
kernel sources.

The Rust build system requires a wider set of interdependent sources
during make prepare, including bindgen inputs, C helper sources,
generated headers, and other support files. These are all located under
the kernel rust/ directory.

To ensure make prepare succeeds and to support building Rust-based
kernel modules from the  target & SDK, copy the full rust/ directory
(of size 2.5MB) into $kerneldir/build when the rust-kernel distro feature
is enabled.

Additionally, when Rust support is enabled, 'make prepare' generates
.rmeta files (crate metadata in a custom binary format) and shared
objects (.so) that are required for compiling Rust kernel modules.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 23a9093ede..07f082132b 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -139,6 +139,15 @@ do_install() {
         cd ${S}
 
         cp -a scripts $kerneldir/build
+        
+        # In sdk, when CONFIG_RUST is enabled, `make prepare` requires the full Rust
+        # kernel infrastructure. The Rust build system pulls in bindgen inputs, C helpers,
+        # generated headers, and generate crate metadata (.rmeta), and shared objects 
+        # needed for building Rust kernel modules. Copy the entire rust/ directory (of size 2.5MB)
+        # to avoid failures with 'make prepare'.
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
 
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
-- 
2.49.0


