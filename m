Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B41FC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 13:40:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.72])
 by mx.groups.io with SMTP id smtpd.web11.47263.1744033249514054042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 06:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hgN9BHm8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hgN9BHm8;
 spf=pass (domain: arm.com, ip: 40.107.21.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aCMeKBXofNTUgZcQN43oaUHwBDWjcHezD+GgcSGgq9q2VTle0ikPNytbb8ach57dVURqkOxiivk3rF1OYXR89Mya/+h+xd3fTgPHqXydQhOzToopIYD7XdZ+fT+IB7d0YQsR0wUB2i9zvHFVEfNlJQ0QUBCucUnzxHK6VAOkcEzKXKCURbrjY0YH3hnMu+Hf7hUkwnS1H4dnejCkS28RLjkvp9I0ow0xGGX3vUnESf1OPgGBoG89HIZ8WtJMB4Vgs7iB4S01qqSeDinS/gWY3BTmpiNG2pu50o0VnbBMlKn3/YAW96ZvHqPwlOmZoTkmGR9B/nT+CMKx6nGvW/Ss8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dTscoIMwWCa74Be/U02XvU8pv8J1aBats3oCQ7kw4s=;
 b=ggmoNQGLckJKbQDqdKoqPp8jsv90MUS8gnPrj9J36lNC/ps8P4rTagq346ZmFPQuo+tEJT+jIbB4qc/9eGx3Mfr7pgH0aQDyiy/SmthA8FsQKn4VCt55pE85b7r92Mjvr0RFdhMn7Lcd1DKClJa25YVibSO2uLHSQXFmk4NXMa1MxV3sqiM6eWYLhr9Q7D0cxVret7aJEvSFOIuLiTTZPDr9tKloHfbKOv0g7QWd5f6qwypH5pi34DW2+dFFzF7wcUScoSVs2FCV5/n1UnpCLlFffnBGcvCwBXuK0m01iQR9QIPPdtaPAmDM6phZxuyuLcykmS6VvSXI9KU4FMgAyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=geanix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dTscoIMwWCa74Be/U02XvU8pv8J1aBats3oCQ7kw4s=;
 b=hgN9BHm8T0uviVyv3DLIZcmpq26y72MXHVNBEOR2nUtSo4lZ/OxN5NSiwDmevIKY8fIyZlYt7YlXd6ekGW3SIFSpSmGy0KUkAbINx327NwU4LHk2tzL9Mv4ENVCUFIIndPazXmjdWhjvwr7DYxy0sPtR8zv3AOrLWyVh3kXg/RY=
Received: from DUZPR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::12) by GV1PR08MB8107.eurprd08.prod.outlook.com
 (2603:10a6:150:94::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 13:40:42 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::fe) by DUZPR01CA0089.outlook.office365.com
 (2603:10a6:10:46a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Mon,
 7 Apr 2025 13:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Mon, 7 Apr 2025 13:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPAtqQHzK0OKf0/Icr3NUr4r/27RqC2OL1LhkhegqwbD504keWkQwrt92hkPr7d9yKIjNm7OAOfOy4iY0IjfsPZuiEBz9SRhlo0WFM2aeZXP9MKVXn+UjBs0S0pjONeSHnEBR7VlGYRJJ9KLMd8yPDu+qV9t88BxsBoPIhXeiA1xio6EUx3kREd8EQRr+f001oEAN+aAJwIpGOakwz27MZe4TIhh5VKKCMitvlMK0Gi0ByvTlaoRg5KGB1VILN/fUFPwTN9VihoxRFxR95YMJDhraiAgK0ySzUGuOES0I9Vq7scRozyPkuL42l6IgfVKRUeODC0bpT9m7DiKIxPX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dTscoIMwWCa74Be/U02XvU8pv8J1aBats3oCQ7kw4s=;
 b=TAkW4PdIvZoQeQTDpRGiQh6AmbDvWMiAKepjrHDa9NmJgprt2XWXuubSZvEFaJ9ftco76PvPnl/M2Jmq77SExHNNnpxfJ18LbUPDOmwQjCZ+yDt7BXcBLGx8Qwp8ARnSZgLSDQETiGpXPctGo0hMdrRVWIb5l+7wXQUEVABLjVdzo5wxfOZJRHyB7hSzz3QRfc1qzIJI9YcmA+7tH+HkYw/Romq6AMuakOFaHVp26siA9a1l/oKhH1IigLKP6e576cOut36fBFyK3E4RarO4IyE+mOhifRLdzwN+4Cddb95j3hI+CeDbXPc3Q7FeQDPpgP0I/Q+av9wtznv+KMHeeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dTscoIMwWCa74Be/U02XvU8pv8J1aBats3oCQ7kw4s=;
 b=hgN9BHm8T0uviVyv3DLIZcmpq26y72MXHVNBEOR2nUtSo4lZ/OxN5NSiwDmevIKY8fIyZlYt7YlXd6ekGW3SIFSpSmGy0KUkAbINx327NwU4LHk2tzL9Mv4ENVCUFIIndPazXmjdWhjvwr7DYxy0sPtR8zv3AOrLWyVh3kXg/RY=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AS1PR08MB7660.eurprd08.prod.outlook.com (2603:10a6:20b:47b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 13:40:07 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 13:40:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sean@geanix.com" <sean@geanix.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] rm_work and populate_sdk
Thread-Topic: [OE-core] rm_work and populate_sdk
Thread-Index: AQHbp5Mza8+5ee8Dc0e5FxKXqu5ZtbOYNfIA
Date: Mon, 7 Apr 2025 13:40:07 +0000
Message-ID: <36740DAA-91AE-4DBC-AFB5-1290C43E6805@arm.com>
References: <geg2j2asa3pqdjo5ah5lpwhh4elgn7djjcdsjm3gfl3olhqtnp@kvdobzw2dmwu>
In-Reply-To: <geg2j2asa3pqdjo5ah5lpwhh4elgn7djjcdsjm3gfl3olhqtnp@kvdobzw2dmwu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AS1PR08MB7660:EE_|DB5PEPF00014B91:EE_|GV1PR08MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: e71c9f5e-d58d-44b3-09d5-08dd75d9c983
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?lKOknsm4wY4wPx6xXRPhoaHekUruswTQrTVj6oJll351RYMG2bK/fLjklYYf?=
 =?us-ascii?Q?cubN1OF6Vx8UjjjDAdBKPqCFkJBmzsHhQ4f4jOzxdguG9v+ex+1tWl3lE5i2?=
 =?us-ascii?Q?Wv9NNXkLExJFibB+15J8t3DxCcwOpGnwv12wMFGNtp2SwEcQViTMO0eACc9H?=
 =?us-ascii?Q?Q+0NcWBX3SeLtbfGXmn5zDsNgL69J7S/xNd92D7KYYrlADUP+fB0BwZCsHQ/?=
 =?us-ascii?Q?xTd1437uD/aUf1ZB2yyfXTYXnFWUBsRY4ZZJM93KgRet9iBqBLCp0NLZ7pDG?=
 =?us-ascii?Q?X2nL2+Dl7odAnr+bNrsHuVVPJlPPTHSF1KxuOD2jmVQpOvMf7Uhn3VCLWxOe?=
 =?us-ascii?Q?eh0F16T+iCj0E2LhSPVfAhmXqhi9gb1tbvQcah08Sn32QlLupaihnqO9rKzO?=
 =?us-ascii?Q?t4cOhG4GrUATg7ol/Luhsz/X2RwRaN1aPkc9i2FH+kwxsluRHyNYDhKhTGX8?=
 =?us-ascii?Q?W4HEHqsy+vJelfDuze1VNCcS7sOQ68RgDePIYaWP9cTRd1LvRszqlrhL/EB1?=
 =?us-ascii?Q?Fy3YUhOG/5Jv6P9cMUzrWPaKc6MkuelO1Xf4LOBPJIRAZ6THZmC9LK8Yn9Hm?=
 =?us-ascii?Q?4OPlB57zGC6rlyIdyDpaNXtor5Jmdo0QFujjTcki0AeoYGc7LlYzE9k120qm?=
 =?us-ascii?Q?oE4txqLEC3fu69WGYe9uiZD1JiWwd0EvmbMU9+12Z3HNgUsgLfNZjUKrJJfU?=
 =?us-ascii?Q?cjglnGro3EPAXOGUwlHFB9WPGDC7Bbkogd/tuX8oDmFL5KgGYQTAN9b9fuqu?=
 =?us-ascii?Q?7wHaWurkqFcXIRs+R4gkwdTS2TJhBnSiSjgyI3BD43aej/PAx6Fpu3Oo9r3d?=
 =?us-ascii?Q?JBvmjMqc0a08XICv/ibo64PB+bsUbdpVP/Ip5snpV+mXOANquo0MgnK7EpQA?=
 =?us-ascii?Q?ltvfC5Fp0248O076ttLSRNItzIHnaGq2qsDHWtNboKevNyc+CghcusoYjCbZ?=
 =?us-ascii?Q?z1htbEwY0+uu6uY03oc7KpphvOOESEhg6UrqvtCXmobSAnuyldoe0sTViLye?=
 =?us-ascii?Q?EMpD9YDQ0j6eSaDT8WrNIh71JY7Ic5+ZMqUFRRKoJ1qi62/Z4OL+4tA83LTX?=
 =?us-ascii?Q?FHC+pCf2vPY1P35nL1ZxsgkoyVJguGB3jFLa2ev6qlTmgPX3OiZxt+w2dXCY?=
 =?us-ascii?Q?ZXYA3vN/hnGrD765ZtCfCIaTW/p25YFpJBOFKa+V/ZF86qvV57Ylp4RuB5+t?=
 =?us-ascii?Q?fpSzMSFPtejG2LMYt+yGjbkWgmj4p55C4sMr9fbGvAfpG3FggS4fNVS1HTeB?=
 =?us-ascii?Q?84ggLELtIvv0f+rq7SfiwgpflKeN7M3LARnpRD8T13jo927Sr1tTv+0Qjwd9?=
 =?us-ascii?Q?Zqdi2DMPlgG3A3xNuPEwFOFCq+Z5tCORRYYqDXljQY3JBGVSQe18DcrR2yfY?=
 =?us-ascii?Q?c7Hj25czwfPa3HX2O08d1V70ey3xK+i3ImV6XI70dRlPCwhUjWx8CIWll1db?=
 =?us-ascii?Q?Fs7PI6e219A=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D419EBA3455A304BB205C9289875B22B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7660
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	27b46516-e0a3-47d1-f596-08dd75d9b58f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|35042699022|4022899009|1800799024|14060799003|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J75Rdfat+sUeH8Y0k517SmCb0gmaFkLlNgh1cA9hmIz3emQSkM47T8ohHia7?=
 =?us-ascii?Q?6TiDEOo6hWeDB562oOQsgEYmLj4Vg9iTg9neIQ8C9vHvzjoc84h9Jjx8TRbr?=
 =?us-ascii?Q?S8sU4N995ycAelbz1Qctd9qx1kjLs+FJrI/XS+lOvb772QQD9KNrzhxJlWLL?=
 =?us-ascii?Q?o0ojNO98jnqhj7vRTbqcpO+/azyUtTotBcz9kYSMKLZKn7HMv4/4mDPCzs3b?=
 =?us-ascii?Q?wdp4QAi+e2rD7uikVPDDTSToI9ATGN2ZlWnJSshdzmoTjyKnzO4INjewrGSp?=
 =?us-ascii?Q?60WF2XCQnQWy0Y6D7KdFDG5FfXsXHM/Z2e8fQlWjlA7/jHhTwd+YtJVohF0n?=
 =?us-ascii?Q?lCATduxeYM7fsTep4DvYnES+2DuqbjmrPtg+PvVmTUwh9OYc2HllVaMMlfdx?=
 =?us-ascii?Q?kstnFMeg/F1+sRRe7Z99W9QGvgWNDWMtreEPAMLEe/FIUMHy0M+Yuj5pERS+?=
 =?us-ascii?Q?wvt0qRGeRsMPjPWvldptwvL+hqeehFpsY+T2M4nxjBgLUwpapQF1wH+xtlDc?=
 =?us-ascii?Q?K1jRLAiCSWsSFSCKQ2IYgxEpikmlSBfxuz+IgwVDfw3qEcXxaYxNbLRLZ9DA?=
 =?us-ascii?Q?eAzuRkOBwW0ZwSbrQ0nuiRpih+gNbwlEjhmLCqOL4YLtk6FnjBB9x/jTOmbi?=
 =?us-ascii?Q?hn6A2TcZoXuhZLQnAesdIIoKOdRdD73A9U1VRuwjzPBMA41qLyzIIbupP0Gw?=
 =?us-ascii?Q?1iJ9DR4IF5lhS97TvgwEqGLVnpNGqqyT0TtQghZN3qgeYROV7IAuvPx06rPY?=
 =?us-ascii?Q?1xOpid6rmTkrjJlzEK4/aZp5BGPjKh3E6eyspMYSD+Nr50NmoNPw4zRtNujI?=
 =?us-ascii?Q?89MGfQjprxpgf1fxwAs1p6gmHVoKxVxuHteJWdwII78L1QjZuFfrlPoeEgNO?=
 =?us-ascii?Q?hWX/bGwsdhzkhbTGcn9i0Lzar3UVBRYau8aqCHjkS02IvksxHwxRlO8kPs6P?=
 =?us-ascii?Q?FWD5P7llZhj0AnQ0GAxsLrEafUCZu4/y1XgBf9mpbN/IYc+tYOiL4ST6AGlG?=
 =?us-ascii?Q?nE1RYloSZPFLeD9wQjqP70NmlHLWkU7tN+WUgI26RuQilq6ZBKKQ36FOHT5g?=
 =?us-ascii?Q?xUbyKwVat9Re8cg+4wxKLoym5UsChoROYS64k0WG4gZKIEh40Jl971/vpzrM?=
 =?us-ascii?Q?mnnWaPZh1yOG1KicLyZIeWW+elFDaqyesp0Yo+SfLnmT6Aqkb8Ca+LMuEjRQ?=
 =?us-ascii?Q?TKfd8FQTC/rMco6dwJPSMx0kf319yXncjkkIEmXeq5qOEfFX6Eplth7G79iq?=
 =?us-ascii?Q?0CuaEcZJSHtymVweivcQFGvLisHTh4IENopmhFpSi/hgWFjEoXzyMlV/0mWe?=
 =?us-ascii?Q?qRwU58uvtFj6z+IS8kcIouDKcAzRemCXu9s21Fd2VulWCq1CKAXDYC2CtvFL?=
 =?us-ascii?Q?CwBXE6K4B5FHhWPwQZMRKCim+heXnElgZDv9f9Bd4DtsPJBZ2yKiJP2vw58Z?=
 =?us-ascii?Q?oCzHIpJ82SDfEA5sr9M9+g0YvruQCsSc?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(4022899009)(1800799024)(14060799003)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:40:40.5170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e71c9f5e-d58d-44b3-09d5-08dd75d9c983
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 13:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214456

Can you file a bug for this?

Thanks,
Ross

> On 7 Apr 2025, at 09:00, Sean Nyekjaer via lists.openembedded.org <sean=
=3Dgeanix.com@lists.openembedded.org> wrote:
>=20
> Hi all,
>=20
> I have enabled rm_work and when building an image it works as I would
> expect.
> But when running populate_sdk for that image, it doesn't look like it's
> running the rm_work task and the disk usage increases.
>=20
> I have tried adding [0] to my image recipe, and it makes a significant
> difference in disk usage.
>=20
> Some numbers for reference::
> With sstate and without [0]:
> 26G     build/
> With sstate and with [0]:
> 18G     build/
> Without sstate and without [0]:
> 120G    build/
> Without sstate and with [0]:
> 29G     build/
>=20
> Br,
> /Sean
>=20
> [0]:
> addtask do_populate_sdk_and_rmwork after do_populate_sdk
> do_populate_sdk_and_rmwork[recrdeptask] =3D "do_rm_work"
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214401): https://lists.openembedded.org/g/openembedde=
d-core/message/214401
> Mute This Topic: https://lists.openembedded.org/mt/112128614/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


