Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79213EE36B9
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:05:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51938.1770919522696263965
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WP3HOvAM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C7LA0n2401724
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Z4FzvT7RF
	f+HoIAU6yBtJk3wlsfpaDomtC9UMM6O7ds=; b=WP3HOvAMurDMk+n+mfa86IeO/
	5ZwOog+xdrNJcVORAkd6aJ8gQI7S/yNtspCEqjnnj8bvrN3d+HeQksH2rsa2nxfP
	eJvP5xMspayLc34fcMVv5HIiOiUlkNkgQJdSobGRZfqFp4Rc+PJ7b8oo+ECKVxk7
	WraoSO1kl8aUTT9M9bgrUvq/pNLLVgj6CjBrlPKxzrz04g3yPwbEfmqd4qgdJB3S
	S0z4fBwAIyfEaKMuSaKqhNEzaylD3Sk3CTD8vpN8GIKRTxBxIbEUTfgMSmUmylRq
	BlvpVE73pbpEdlOf+KX6WAVpTNQOtKwGbJ310zZnb9vCE/mjjM1cz/CZePUWA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013005.outbound.protection.outlook.com [40.93.196.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwph3q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 18:05:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ev8tI+c5QTMGUuh9cwrY3FDhiyiIavK5Okf2yvgPakeiSJ0b8t+paMRMyqeZPmK6Vdyo+x+zWGxLAcjLWvrtIlP1y1qA7CP4236euTqtHFkKX3IjduEDxK0iMf839oC8P+keC3IVM+uvNHEiJZimp0bP2DLC9oG/PabMjKOxCAPHDDGCCw5FhX6zg60UwncFVjH9zLxO7uR3OYFOwRx/nH1af8OB3F1gomPJZDXl7dcrGVSB+EkAH4//d9mRF5Iaw3MdDOsq1FPJuQ99FeseQ0LbrrDvp12jmYH7dYVUiMexqACKqRb/N3RFfSvTz7/ivghageWbQPVQhvZfurbD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4FzvT7RFf+HoIAU6yBtJk3wlsfpaDomtC9UMM6O7ds=;
 b=uEv64Te9wrom2Zk6Y7/XCUqExOtyMq5RDACkSjFrbOXyAXXwPTTzqINzwDtTbkzUFiJ/Rs2fvVl7zPmPmg6fyazLKPr3/FTEMyt0odimNyAIjpGiCpkbBC1RFB+swOOmySUPbduKTTDTMWax4IUjxWVkUcWojSpy82ajP9fsqDio1ZIY7j8mCul/zVtI0qedo9bUfO8U8Kphno7Iv8aUnyLvZTvmIyFKxJa0mZpGjySzjkgNjVOtSdPrNEhpH1QkhuhtryHbk5p3p8v6LummjQhgS3zLT2XE3iQCwDC/+jZPi7Ic5xDiWnOnObTbF4Ev86VDwvwBCt85hqoP/0mUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:05:18 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:05:18 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 00/14] Enable rust support for linux kernel
Date: Thu, 12 Feb 2026 10:04:19 -0800
Message-ID: <20260212180433.1825988-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: ba729af4-1508-4b3c-cc7b-08de6a61478d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G00C+zd9ox3EN5vMjvMDgisM8GPtQHf816uCmkH2hAf8JMICKavG04Bt6m+D?=
 =?us-ascii?Q?lZ3phzqEOQ686bYB7FG/jUTuZTyR/HQTgc4JWqVzypoaCC7haz4AH8bfD4QQ?=
 =?us-ascii?Q?WBc/n/mtnnRgIwtK7Xcl0nSCDEUlzbvfLFqRlgXeQRtxvq9VmQTnL9kGc30B?=
 =?us-ascii?Q?2+z/k0nbsicW6uDOz7TGXLJiRAeYpKBR7a1ZhRV784mPUrIxQNshPfTtAwxN?=
 =?us-ascii?Q?5Cu//ptEYdKyNtQluF+Gpoqts++TW01oPKcMUAq3Adz+nhlqTniP85MRtSB7?=
 =?us-ascii?Q?18HF3qdW9FKTyx9GZjUCEdasnkxesHdehvv8jktsq2bt/wswAYTCV47a/p9X?=
 =?us-ascii?Q?1JmgHI/OFVbw2S1YkMXF7lJsiLs/DQcmx+UbA9ghDu0tj3FOsTufCKqMytu9?=
 =?us-ascii?Q?qOSy3cXCwlO/L1Iyy5YG6G32RQRmMUuHsEurVZJ3JqmjwCAgrzKtshNzrfZ+?=
 =?us-ascii?Q?TmEGcbZ4EqNxbVUhppzlZg/EVMJTTrOmrTkdezeT46X1ejh+KwYLRmoxGGU4?=
 =?us-ascii?Q?2JqwqH9zDxrjSr26qgqGi4GK9y0zAa7j6UM1LPQWKClylIAKg5I4shoc9yYH?=
 =?us-ascii?Q?0kOqesPeIzxLDkUCydjjWfZuIKWmpxXMtDc/pwgzpi7oBdlWG43EIWKg3xXq?=
 =?us-ascii?Q?htl/Stmyh35Xp4v5utNoxBhXHoWV5wHwqLlCIZE53//EtOcUGVDhSoNc10Ro?=
 =?us-ascii?Q?pnOVcwWY8NqPJxY3hnAPt0U9dENsHlCauqcjDqQaBATEYgxoBbwSp3hXr2xH?=
 =?us-ascii?Q?XZhb+IRFs/nk8PdZsVAQpHKz8f/k0/oFdG+nfK/IJR5c7U/OnULaF+GgnKYC?=
 =?us-ascii?Q?g0QUCEgelyLl2ytbx3KUUXEOdBNY05BaYHDhPkoWEwzY5hMZwF9ZvXixUPmp?=
 =?us-ascii?Q?+UflIbBUtIkm8CL+yCeIFZ0vOD78vgYZEIK2PCTAL5mdQ8pUI9cj4mLmIjq4?=
 =?us-ascii?Q?ZVj8+xmR4N1ZQBN5FzrL6HhNuYjwFQvthqp5VrtcaAay+2CuxKjNOp548ECY?=
 =?us-ascii?Q?p6hHIsx+yLjM4cUtrOt4DuMJgKpETgsAZmFwgZ85nORL60Wzu0e163IF+ScP?=
 =?us-ascii?Q?ss0PhILK7vIUhJE3vQTsKwM8XQgwLo5kXT6A+b2dsvAbn/hu6YIAIBvOBvo6?=
 =?us-ascii?Q?IODkBL6PiXuLshANB4Xz4FMp3TBlNIVETvfNQ8Pl/ByRidKxl6D0QhNOKm9F?=
 =?us-ascii?Q?1g6YJSK1i6tTNqmLwIJsuR6KBDzRlX8NQqaPN6xCNUpB7k2s/JQmLSAsyN01?=
 =?us-ascii?Q?/ilkYzr95Xr/XJKmBv56BJXlt6l9JRI0srg5P/Z+Funl9Tw0eXTgtDgh7xQ6?=
 =?us-ascii?Q?Pht26OW+dtWbmZxr7O3wsA6w4JC5sY4k8AFeGtjGqAX/w/ZjGaf5sD44dw/2?=
 =?us-ascii?Q?JRyG+bxHOwWce7FmlrhC9uJHGUl4d6KUCtK13SBdgbXLFhFWYpfKx5s8Vs+z?=
 =?us-ascii?Q?jNTtpauN97wJ75VxfPv5vHzni4R4RxRNDGtXd8MP2QcLS8ZkbVyPQQOY0wH2?=
 =?us-ascii?Q?GnSvLlpL5vhXNZOrWNLoteGlZtgTvd3cFJESFvPrQ4E8k6chL/UpMAy+FqKu?=
 =?us-ascii?Q?gRx3nuBuaBriMwtKPL8mqiZ1a4vtojzaGohtKEJY+SJUO9UK1Ddy4MBkK9CR?=
 =?us-ascii?Q?uLEqs5xRBZOsaYr6ShR4VYF8J6JSVTaZrtXHIYTkcIs5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vttj0mUEe4MA0ddVXVIwBY6lfzd/AHneo9yJPVChshIldJhRxugYx7VtbFbT?=
 =?us-ascii?Q?H03YweeIy8lFV0EPbRrytG6pUOtqNFyvtIkQfbf7oVP8RzUopwgjgXAx5UFr?=
 =?us-ascii?Q?G9/QbGg+J+jvD0wrV8lzCplPo4kvl4cuF4+Jg9Bj9x/hV804uy5+hx/Vr8i7?=
 =?us-ascii?Q?Ybpb7IakYNqyfkuyUK102Lgd+SrUl1FkfEO89EXTEHgW/Q9EeXYBNwIjFSO1?=
 =?us-ascii?Q?GGjL+Dm5AYseSTopgoksIhG/S4AcEnPdmrtCaUOgzf0oEhHzArJsPxW+KAFn?=
 =?us-ascii?Q?NlHJP99YpL9J8t6BBFehL1cmvEUiHwBY+ltLvRMN40q93pkVIIi/lAs+5e5g?=
 =?us-ascii?Q?9qO5VGdKpUrD/I2lbQLENvOhh1k/rDz6NLEwfSktkKpER8AXlEjGvVrYu0nf?=
 =?us-ascii?Q?dsVRXFjfwBpLpSKt67Ijksh1dFg7+JYry20/LJeYmd3mmPn9AnDT0lsu6kUM?=
 =?us-ascii?Q?Y5vocgiVPu9mRPc6u3gI6oIxirqv7v5OdJIZ+4ZOPWpKbOOlH0XD+O0XItkk?=
 =?us-ascii?Q?XDA/Oqt4xCsg5Zz8OfMh+9qQukejum/qck70PYSV3VoLsa91VDGqazWR1JjV?=
 =?us-ascii?Q?qteGbeObPXGbVfg+gBm0zCMlhtPQXojChPM7Vbf+hN91ARb9fa2DxPNQdqnk?=
 =?us-ascii?Q?+8RIo8gcD9L3W1fraLDx22Xc7MJ6EpwMM5Zx8s5Oie4Bx0G9ppuIEjpMyH1l?=
 =?us-ascii?Q?iDAXyTUiCh9ycjlxCaBCbsBZo2eL1KzRmtTi5fpQmZTFRS/++wfAFw4WMeN6?=
 =?us-ascii?Q?tpQrH6nQoYwlasBGq37QsIEIcwB0zMYsDmeI/RBZmK5wTed/gDZP0GHx8K6a?=
 =?us-ascii?Q?qft1lAB/7EA2o3Gs1xydxSyDI/y0Q/ssm85UpKDfsJ5LQZbfP1aIn7EHJQ73?=
 =?us-ascii?Q?T4/bilCc884GD+v0giYpEpaNCrXBNRfC5+YfYsvFmUEpsd/3BMExW/7q0l6E?=
 =?us-ascii?Q?ondojOGLiuOdt2ab2bn7HyjHk6zeU2Cmxt+Ue+kL83t/kyJi0farOZll2o8o?=
 =?us-ascii?Q?h/6Re0DG9jPrV7YazMLMe3gqRgqZoDZ6xA69kpGqc/UJTN++Aov19phPK7Km?=
 =?us-ascii?Q?nD63NkYaqXVcpA8DhkrrIqMFykBOPC/xgjZK4LUDdVkE3tmuqMMwkcj4OJNx?=
 =?us-ascii?Q?Kyd6/wihDme8CIooy+Qu+futnzH55fA/bvrtcDYHYha8X5/TIlrPqT/ucLa3?=
 =?us-ascii?Q?+5+CvhiDrR+pwmYn35r0ks1RovEW3YABk6w5ghuDFeU1A19VlWL8Wv0XBz4T?=
 =?us-ascii?Q?VlmlYgI4pMeDhOCnr1b0RDkxtgajRuAGh8ddBN0CHxXPiJDXNKqn85RIGaVN?=
 =?us-ascii?Q?JGQaIdfzQzAiNvgkrcMLcrePVA+UveerixB/murUl+mNYb6zawVBtpxm57GP?=
 =?us-ascii?Q?uBG7GftOd6RzrygQBIrzoLjiDjPBUzBGvc/+xKQ6O4C2gl+Fcynj3C3zyVQ8?=
 =?us-ascii?Q?5a2eNnh6Wzi0zGD/opU+OgZGmpRiFWK/2YnOfj3W2CpGBNWnHk7/ERBWiq/M?=
 =?us-ascii?Q?YPQc1tUq/Qap1fCM2eUywhjuHiVf3NRins95ARXLI9oXN/OnhvXPcY3j9jFK?=
 =?us-ascii?Q?0+L1DSErR35JnUE+5ZfdzfTlN04wvdsaURk2/s2CCcgibZ18B/PHjJbMU+Sc?=
 =?us-ascii?Q?+1Wu90Sf+UzFHbnGfH1UF62THIQXsH7i/dA5pcVc8vx3fCZxThqJiIqnR4ND?=
 =?us-ascii?Q?RsdAOYlMgj03P6l1Y/tp0FiNltMBMpunieE/JrlAau063/a2Actc7NkDwPlN?=
 =?us-ascii?Q?wC9RLjNlxy12J09rjvboph6mbEvFQOQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba729af4-1508-4b3c-cc7b-08de6a61478d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:05:17.9459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTWF3EmnFgju+FR9+zbYLIs1urrbdbBY5NZEevbd9l/9yL2YvFM+uesbj6vOvmMHAW2btECn+27ZSg0zE1rAj2CRYQuB4I8r7LD+T2HX8F0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698e1661 cx=c_pps
 a=MVrca6uEa0E4C5ICDaep3Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=1xu6l7B-EAIxQ2hwfIcA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5IhndZSvnpJHUOPkABdnMzjkZIwoQcLP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzOSBTYWx0ZWRfXxQZP3Gdjd2Rp
 EBYXeBTO3rDY4sXvPsyv0bP/E1EseEjESzdRU31F/WuzxcQsleaTV7P9QRWf1EN5uLf7GBI7Qru
 FDAhPTzcFH04Wvmv2pi0jXO0MQTZEFQ6aJdAmJTL2Mgj/5/wdzGM8WNp9A2W3qhDGyRfM1RhE8M
 TqXZ5M4aUP4+37rrbXTaENQD/Sz7Z/7uc/oqoZnr5fHVNmNXxV01Dq2rJGSM4nbyYX3EQ0F/rxq
 UlKDx7RXJLFF4jjd+sl22X+AsQBlLPGQnbDpq0A2wxJwzcWw7NwUh/IFSFO/gFhWnoL32vt8Z9A
 z/DxfGYqMJWX6s2hWvrhBeo5F21m3jFQNJfX0BwmFpuGc6OlunI3kw5QKbMjnUOC6cfGasuguqf
 vkuxiyxqWKdukcop2H+2wSMwsuQRYq00Be1iJ6yOMn8EGKGfZHw8v77g+B+MFtR3USnAcGwz39H
 BEQKvp8CYUPZs+EsvDw==
X-Proofpoint-ORIG-GUID: _v7sP9z0QI3ioDzC4dkeosIISdD1ANyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231055

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v6:
- rust-kernel support is now can be managed with a dedicated KERNEL_RUST_SUPPORT variable instead
  of DISTRO_FEATURES. Kernel rust support changes are now moved to new classes kernel-yocto-rust.bbclass
  & module-rust.bbclass for ease of maintenance.
- Dropped patch "kernel.bbclass: Export artifacts needed for out-of-tree Rust compilation"
- Extended disabling of cache to make-mod-scripts as well.

v5:
- Regression in autobuilder with v4 series is due to applying v4 series together with following patch
  "llvm: enable LLVMgold.so build by adding binutils dependency"(https://lists.openembedded.org/g/openembedded-core/message/229387)
  is fixed by droping Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091).
- Updated patch "rust: install Rust library sources for 'make rustavailable' support" to install
  rust standard library sources for rust-native.

v4:
- Resolved patchtest failures.

v3:
- Removed the DISTRO_FEATURES dependency for installing Rust library sources in the Rust recipe,
- Extended support for on target rust kernel module developmet by installing Rust library sources and
  introduced packaging of the Rust standard library sources in a dedicated ${PN}-src-lib package.
- Integrated Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091)
  that uses the Rust bootstrap tool to install Rust library sources for rust-native.
- Dropped the patch that added rust-kernel to native/nativesdk feature filters in bitbake.conf.
- Updated flags in the make-mod-scripts recipe to fix build failures when building Rust out-of-tree
  module recipes.
- Dropped the bindgen-cli patch extending BBCLASSEXTEND to include
  nativesdk, as it has been merged into oe-core.

v2:
- Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
- Updated commit message and added in code comments for patch "[PATCH 09/15] kernel-devsrc: copying
  rust-kernel source to $kerneldir/build"

[0] https://lists.openembedded.org/g/openembedded-core/message/228559
[1] https://lists.openembedded.org/g/openembedded-core/message/228560

v1:
The previous series was RFC v4, "Enable Rust support for Linux kernel"
(https://lists.openembedded.org/g/openembedded-core/message/226623).

In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module support"
(https://lists.openembedded.org/g/openembedded-core/message/227281), which builds on top of RFC v4.

The current patch series is a unified version that combines both efforts.
Compared to the earlier series, the main changes are:

-Kernel configuration fragments have been moved to yocto-kernel-cache.
-The kernel fragments have been removed from SRC_URI and from the files
 directory previously stored underrecipes-kernel/linux/files.
-Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Linux Rust sample"
 by appending KERNEL_EXTRA_FEATURES:append = 'features/kernel-sample/kernel-rust-sample.scc'
 instead of adding this directly in the linux-yocto recipe.


This patch series introduces Rust support into the linux-yocto kernel recipe and
related build infrastructure in the Yocto Project. The goal is to enable building
the Linux kernel with Rust components and provide support for building kernel module
which is written in rust and also provide support to build rust kernel modules in sdk.

And this series adds test for Linux Rust sample and also added support
for out-of-tree kernel module written in Rust as well as associated test.

Summary of patches:

- Patch 01: Add required dependencies ('clang-native', 'rust-native','bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 02: Install the Rust standard library source ('library/') for  native,target and sdk.
- Patch 03: Updated `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 04: Add kernel configuration support for Rust (via 'kernel-rust.scc'), enabling the Rust build options in kernel config.
- Patch 05: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 06: split `HOSTCC` flag to align with to linux-yocto and fix build issue with make-mod-scripts recipe.
- Patch 07: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 08: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 09: Added oe-selftest case for the Linux Rust sample.
- patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
- patch 11: Add support for rust-out-of-tree module compilation
- patch 12: Added rust-out-of-tree-module recipe in meta-skeleton layer
- Patch 13: Fixed buildpaths errors for rust-out-of-tree-module recipe by appending --remap-path-prefix to RUST_DEBUG_REMAP
- patch 14: Added rust-out-of-tree selftest

Patches have been build-tested successfully on:
- qemuarm64
- qemux86-64

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.

Harish Sadineni (10):
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  kernel-yocto-rust: enable Rust kernel support via 'make
    rustavailable'.
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto-rust: Fix for buildpaths errors when rust is enabled for
    kernel
  make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
  kernel: Disable ccache when kernel rust support is enabled
  kernel-devsrc: copying rust-kernel source to $kerneldir/build
  module-rust.bbclass: Prepare out-of-tree rust module compilation
  make-mod-scripts: fix for buildpath issues with rust-out-of-tree
    compilation

Yoann Congal (4):
  selftest/cases/runtime_test: Add test for Linux Rust sample
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 17 ++++++++++
 meta/classes-recipe/kernel-yocto-rust.bbclass | 25 ++++++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      |  2 ++
 meta/classes-recipe/kernel.bbclass            |  1 +
 meta/classes-recipe/module-rust.bbclass       | 21 ++++++++++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 33 +++++++++++++++++++
 meta/recipes-devtools/rust/rust_1.93.0.bb     | 19 ++++++++++-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  9 +++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  3 ++
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb  | 16 ++++++++-
 11 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
 create mode 100644 meta/classes-recipe/kernel-yocto-rust.bbclass
 create mode 100644 meta/classes-recipe/module-rust.bbclass

-- 
2.49.0


