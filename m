Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC80FF55454
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 03:40:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38200.1771990833934867169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 19:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CUmV3Sn6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65164714d9=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P0sIsd1059837
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 19:40:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=snOG0ZcK+v6cT2ClrMDJChN1gnt8w6BRaqjDsVW14E8=; b=CUmV3Sn6a1qB
	BZDlyEP/vqIwAbXemr6CHIdKj34RQ0t42b7ShM3l8i6JwOU8zqhi8HHQ+tAiyRo7
	PBc05aQU3TDpOUiaeIiBrjKLD/q+FDVOGp4WgPNqM3r0dgyRo6JhPQ3Gu5vHQC0T
	NSFUY6mL0wkX0ZX4knnpoyp2Lr6YBWKcfOpF3f+lLYrYenbvrDFIq0c6WZUWIWD+
	oEAiv5Ft4UlLRnPnYjExeEQ8UE3eE6tGCCQXOIBeY1xwSjR0SzicxR5uLvusCWty
	ompDLbNghzmfs0TQtBHWQcMm25Zx+imNXCfqVqiqiwjwSf+psuIobNe74/LwKGFc
	sy9N/rsVKQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf8v447g6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 19:40:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lO7jD+fUlq59QuvuuBlwo7TGimbv7oP98UMPlKP9IpTOYuqRXYr8lub71WWUbq6RkMaen+QVGwsfIWLIPLf/SSpaXXKcKKJJsvvUolntZE6pZR9xc3O0PxqelZZMvoSpZKS2nXZ3P+q4OOB0hzZe0T1H0MrCNziGgAz801iKQpYifC/IWykZKnGYdcm+ADP5ap1gPOgaTVwOaBWFjVBcZtJP5+ttMaEvMF5jpERT5SzdYCZga3SPbvUUyXlm6NYAxdyTjP+Ss2NY8bUAtGFdSqu7d/eUtdOUmZncU9MMWOcJLEu1r4II3FCQVHXKPhW6+fxJ0ye6M1ujpm0Koeyc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snOG0ZcK+v6cT2ClrMDJChN1gnt8w6BRaqjDsVW14E8=;
 b=rQKgsqkUb35NXoT07fD46YaofMKFepfKu6uvAjkDCR5RSkECGsRaOxeqD6hg9iB1AwJ1WkyzBDvrAzDh6rJuIY3/G/GcRzEQKZnFApzKhtz1zVBfyh101oRp/3Gde9qJBpPR5ihQ01iYIFZ3g4jRz++0OoL2x3HPzoNtBhAAvOU24nG5HLaiOwNuOUpc3ijMDcRDKz2Wnnb8+uTSQ3Iuwf8T1yfc5oBliXh8r+N/xCiNjSl+ghOG7y7EN4DoxpdrBqvAPGkpfwlXBc6RLenboX/opP+5sI08gXvvC6H4gKuN29MSxqer7q0+libUM36XU3hkCgHW2/1xQYIJO8E7zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA4PR11MB8962.namprd11.prod.outlook.com (2603:10b6:208:565::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 03:40:31 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 03:40:30 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] appstream: upgrade from 1.0.6 to 1.1.2
Date: Wed, 25 Feb 2026 11:40:13 +0800
Message-Id: <20260225034013.1510432-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DB5PR02MB102138725558AB810833F8DFCEF74A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <DB5PR02MB102138725558AB810833F8DFCEF74A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA4PR11MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a1d6fc-b753-4171-894b-08de741f9f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ntc4fP3WN9TgUOCi5rTiik3rPu/JgEk5MS6FFYM4xjtJXjnwGdyUGl6Jr+1X?=
 =?us-ascii?Q?6J78O5wD1XucgX8/21LAJ2en0xmg55e8Px6OeQRGDuIKG6SOwoKlTqr08PSK?=
 =?us-ascii?Q?KxAkXhCxeDw2DV5l+71T6O/xXaWHoWHEnemq5zthY4HPkNIKKOK5e0/86JcF?=
 =?us-ascii?Q?wmgVC1xnprw61g0+HcyWRrTY7pYfm1ydIm81OL2/JmVz1uMIikggNrt+j0u8?=
 =?us-ascii?Q?DUgeanwHdgd05HYCydNccQj/+ikBinqzticTzyikevhyy03OYVDMaeU/Z0St?=
 =?us-ascii?Q?nOXuLHieBmLyxtE3E6n06DeBoA0HL1gEWfgu99vKnboP3pcNtFHYFnyBVsl5?=
 =?us-ascii?Q?Pbb00YfrY9AbHSAFnRKzihoE2HqT/imIkQqkhTnb5+7E1xx8fPfctYwrebrk?=
 =?us-ascii?Q?97IrCncazD//RGHTq/i1mWcoQ42XVPWY9lpM1zZhcAjceFjosXUF5k2AmMES?=
 =?us-ascii?Q?+KjftOP3HvZftwhlWlO+6XGQ3WmaKsm4tldkVMbEtTmhJPaqKM3bM45Ie/3p?=
 =?us-ascii?Q?akFDN5kHhBNcQ81uYFGhMLKPuUETtL/V3OsKJilksRCSMqDcMBV1lbxSvu0z?=
 =?us-ascii?Q?Tg0fDXd6VpvU7RJ2y9b15edP2m7LyQ8AsuCgYUI81PDkR3Tx6xksyE4AmM+V?=
 =?us-ascii?Q?d4NyoVtL0L1REhpFq9Bdw7iLYV8Fnyt0R2a3ZHI3IH+0HHkEYlPia5XSWuDC?=
 =?us-ascii?Q?YwxjXzOjyDJFo39svWlPIAH/VhrOGGcaH1sNIIWRbl6nCYaSGF94vn4FYhDl?=
 =?us-ascii?Q?viG8XxuKD9e+5QMGkLLHIqXaS3dttFzv9kYxYmxuGQXtKmC9kDj/t/9kxcus?=
 =?us-ascii?Q?zScz3cBmsrte72Fb11AQ+A93ZTmdB+r9UDziWjM3LryZz6lM3XxFldlWdNEA?=
 =?us-ascii?Q?pJb3MJUDS6BrOiVq8UgGlBnVVdejI/TzhGOT7lvQwOqIzjaN8ylO0Dpp0iGc?=
 =?us-ascii?Q?EO6569qe9nPZlyFdOpWVIIZZo5xZrrwb3Otnhnp/TxnQdUD1yDBEkUMdrbG/?=
 =?us-ascii?Q?5e3PjU7DerFswe9QVZSRjlJByILBOgMhlQ4w6ECf4uMiXR7ycWcZEVY23bBJ?=
 =?us-ascii?Q?SUuJ5LO3yI/QqE5pvOvzl797slZYRyJx69IoCwWNz64/9cljF3ncsvTOfd59?=
 =?us-ascii?Q?+DK+Sg6mnMXCTfeT4fT0MtRo3DOEBJomVDnFqbrgLso33ImEqUdeYGb54Q0y?=
 =?us-ascii?Q?bWO75Kh1fuE8swxENwuUiAMOvG5ZD13TtMGwJ5TlzZ0yLt1exeobVSf+Y253?=
 =?us-ascii?Q?YBVzT9CU+uZO1/ttXQ8Yh9xsBeIwXMIp8/uDtHkNh0B5z+9recS756tC4vF2?=
 =?us-ascii?Q?97iMvJGVUmO5Rr8gmXNoFIRn04NpF4HLpVn7YwBXtDg/p6fh5UzD1PBXGg0g?=
 =?us-ascii?Q?NnkeM3BduS7nF9dtjm6Rpci2wUF7Ah28knVUQvfjqv6GCN1UUd5O3NZcBSts?=
 =?us-ascii?Q?4umvV2r7Ex6mMvoBTvVyPBkHR1CjnaZLnYhmxoiMmj/LeJT8pQfw4X5VSzSr?=
 =?us-ascii?Q?375hW9/8Nj3/MZtIZb1OYLrd+vfRLCEPXNiEYC1TqaVIfiMByLEJtXVU00ZL?=
 =?us-ascii?Q?UncjDTbn4IwMyT8R6F6aiy53BoTf1epD0c2vGiivORy1wnhtNBSEMHBiIzMF?=
 =?us-ascii?Q?2/UyWVPVZ9sqNMNMdG2a/pA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dg8f2PxIUeuKZ01HmF+o8s9+ORMUibDCgwQt+Ja9ngja5vNNRubgz21qcrwT?=
 =?us-ascii?Q?j/W8kiMaOzmcnYJ4nq6Zge9j6gok7PKO0jWeAc+rZt7pYMzM17ztgY6gE87s?=
 =?us-ascii?Q?6XVPJRe3e2/rCQur5BN/g/JgM7n1UboJxSfdDEm1dG/wQ4+gyoCChG4SS6OC?=
 =?us-ascii?Q?Tx4wih0k0/uVw5Ox7ytyVcHsmsFEqRfvDpm5VDh+21ekLJPFa4fbujRaFNyh?=
 =?us-ascii?Q?v5c0sBF7f6+sA1AVCrZMPxzxwjivvpYfXkb5LFcgP8sD7mForndyZGSEDZIR?=
 =?us-ascii?Q?W/biixnWK4Eofbw6OKlt9Pj2p4Vv5AYy7aVYYC2LQvM+HkGKsLH/j3Nl1W8x?=
 =?us-ascii?Q?ipAJsSdQbWH1wNikpPj7w0U2L9pSptSxGi4Hf+skfIo/H46wCS/vWzLpn0qq?=
 =?us-ascii?Q?8/bm4iQs2lyDEV6trXL5ES29t0IHDiraqwHrauHYB1M+Tu6OLsem1Qcdpntx?=
 =?us-ascii?Q?5loRWnS6JQIbWf6MW6+bj3minlpkUJrwL3skZdKilems6yWBk5F5aul3luIp?=
 =?us-ascii?Q?Ngtnn5Zf6yBfunB1ga+TG0FXAJrOJguRaEBtDveUlYw0m8iHG4/9QfhRYHAj?=
 =?us-ascii?Q?XIZzdBUb7xcgqJZ3ZqoZFxHLSHA5HCrzX6AG8/ysqhLJSs70bJuWmu1RKXKa?=
 =?us-ascii?Q?nw5iZiklvS+dyk6HsoyWAOv8UWKxn+fcnlc+iCQojMU5Dwl8ZeqvSOvdp8wD?=
 =?us-ascii?Q?14Nj4MhxesXzZqv2ezYtveJbzWgqZj5PHxeqExWpaPUFHCHtOoi2FL4kkke1?=
 =?us-ascii?Q?LjRsilJCbgwZzdIwYSpjO/RgYh+ZptEZQ9rL2+168Ygwi6DI25iveQk/7osT?=
 =?us-ascii?Q?oS389+HNZiw0zwQ2+zxGCHgoPbQyOd+bt11GE3A7NLqIHZNqSefBxHFilSYJ?=
 =?us-ascii?Q?wC3lXHc/jJlh7KDGk4VIqp4uyVFMP//4++QYAZiuPaTb4EAOc877tfvYmIAl?=
 =?us-ascii?Q?4WWBiZsUli3fvdkLwkWBT9Rx13cV7ycA28ASkvWsVR++HUO8DFLUIqoqWxZO?=
 =?us-ascii?Q?VnXUloGWmm9KOkU6b6GgAwqJhFnwhxLMKt8ozuTmuYlYCVauFFIHXUo095uP?=
 =?us-ascii?Q?JBtqXIUasGWPqv7pY6BxIw51WCDz0lnMtiL8m4x6Wz8RovW/Mh/gYnUwf/H8?=
 =?us-ascii?Q?xYEBs19VYtfn268ZKmNdsC8rytJuPSDwFgs8cnyHaPqErEja1cim3bKQh/lu?=
 =?us-ascii?Q?9pcBdGmTt+dSJ+3sRnk7f9utnUssRq/1eTb0fsoLmCvl26etz9gPDVaIBk9u?=
 =?us-ascii?Q?3SK2YwGFkLKXOdOeDrg3i1snQXYg/py2HV6sOge1Ktf/VCzb98ZMGXP004w6?=
 =?us-ascii?Q?2ZGhKzsxefpDKPfmmJd8P6EE+BFgpADX487+PukLlfm+MkRw/y5txOqIOBao?=
 =?us-ascii?Q?LUMj1ngUqyQvJAeea/ZTlZlx1DNH9+6AlS+giQfjemZkc8TLwHiHvQe7GQUG?=
 =?us-ascii?Q?+w35B9xLXHTcfaA2JTjoin7gyRi2WBhJLnk6pxjsuSrmyU04mXGa+T3CVoIn?=
 =?us-ascii?Q?KY6SA/VWehnZAO4jm4fkQhdi5eZMgvtmbwLrLnGREjcP0Z2I02bbXzosXXm3?=
 =?us-ascii?Q?ziSGphRnKMGgWA2HZW7xqG9kC2jRHvr96yYANOikn5NGISNITDUcukdwzPqY?=
 =?us-ascii?Q?u5d5uCaKsfN+RVIKAvCiEbJgJEnxhVe5S1yK90NQXoHxWGn6gRbh9CSS9nJQ?=
 =?us-ascii?Q?w7bX03BgSsna4hZJ7oTJuFsruImGcM6Et8bk4BehqJDVKAGin7jrYwHPynsd?=
 =?us-ascii?Q?nOTftjPtT3KLFxTNpYRA6aMGLRvkpL0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a1d6fc-b753-4171-894b-08de741f9f7d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 03:40:30.3525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZxMEK+DVebIGEl2VE6mwstRjmtvcpfxEJRxNDDQqCnHRxL8ySYl6PzYqL0arlVisrh8O5r4JZim8iQurjBT3EojJ5fHlD5CVBe5yoIMeOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8962
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDAzMiBTYWx0ZWRfXx27D7VqbORCI
 34+jpDXkmp8PCD8NsJ2WKTXUVU6WMaFKOJwS7Hk2e16spKgYncJuKArgUa6Sst5V4RGxVZXW/X9
 dWJOBdA9x5kpp7WNrL6Zs88q5OsXMmYkCYDnuHzRujhH1nvXYRPqvzX8hkoqewaRH990w0NLO0Q
 FN3LoU6m7A7F8L8eOnRRllS0xyclwmaj+bfgw7ofFxGIc9dPBz2ZApgekpsWE5vEblzNVAwl0/C
 MI8eatiuXv+FAxzc4hlg/e2FvrbwtWzyYOY/HQtIbRKBel8AZEXezm4ng/m8Dh39YwGe/Qjfhhn
 4J2UQd5i4Ts1W2yjBv/UQoCzVYAF8SZ+kLrTshviHDF6KiFmf7wB/BOAJA1cLKbabcfMkv983bJ
 px82mLVnWuzFo71343H5YAMaLuiuzueluhoCsz7ZAd7n0befC604Re3uNPoSM+Dke7nws2PHfAb
 XsoBqzHRlUoYLhELnbw==
X-Authority-Analysis: v=2.4 cv=SNNPlevH c=1 sm=1 tr=0 ts=699e6f31 cx=c_pps
 a=5tz+rB/kfTqQMEo17N6B4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=J-hHrZbvAAAA:8 a=MzO-o6fT0cgg80_ASQYA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bPRBTIHFs0NZ5ul0a9uo:22
X-Proofpoint-ORIG-GUID: -nGSmlfeHZXCsQXFmR6jxmVH5aIeIro4
X-Proofpoint-GUID: -nGSmlfeHZXCsQXFmR6jxmVH5aIeIro4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 03:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231925

License-Update: Update COPYING with latest from FSF

* Upstream changed the dependency, libyaml changed to libfyaml, refer [1]
* Upstream enable bash-completion by default, but bash-completion is in
  ASSUME_PROVIDE, on host without bash-completion, appstream-native will
  configure failed, so disable bash-completion for appstream-native

[1] https://github.com/ximion/appstream/commit/2899271049c0c9716eba0ccd62b10cdb9df5746d#diff-35104d8113cb43cdd6cfaa78c780eba89165e17c580d1e6678e5c3dfbd9b23c5

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../appstream/0002-Do-not-build-qt-tests.patch    | 15 +++++++++------
 .../{appstream_1.0.6.bb => appstream_1.1.2.bb}    | 10 ++++++----
 2 files changed, 15 insertions(+), 10 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.0.6.bb => appstream_1.1.2.bb} (82%)

diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index cf26013019..f6bbdd180a 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From eafac7178683c9fe5ab50192dec004f24638b2f4 Mon Sep 17 00:00:00 2001
+From 5763a61ca9aff2e2383c1eeb1ef3f5e6cd07c539 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -23,12 +23,15 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/qt/meson.build b/qt/meson.build
-index 7d9ed7d..e319425 100644
+index 407a57a..840c838 100644
 --- a/qt/meson.build
 +++ b/qt/meson.build
-@@ -150,5 +150,3 @@ install_data (
- 
- # end of Qt version loop
- endforeach
+@@ -130,5 +130,3 @@ install_data (
+     join_paths(meson.current_build_dir(), 'AppStreamQtConfigVersion.cmake'),
+     install_dir: join_paths(get_option('libdir'), 'cmake', 'AppStreamQt')
+ )
 -
 -subdir('tests/')
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/appstream/appstream_1.0.6.bb b/meta/recipes-support/appstream/appstream_1.1.2.bb
similarity index 82%
rename from meta/recipes-support/appstream/appstream_1.0.6.bb
rename to meta/recipes-support/appstream/appstream_1.1.2.bb
index 62761380f5..c6ec0fff0a 100644
--- a/meta/recipes-support/appstream/appstream_1.0.6.bb
+++ b/meta/recipes-support/appstream/appstream_1.1.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "AppStream is a collaborative effort for making machine-readable software metadata easily available."
 HOMEPAGE = "https://github.com/ximion/appstream"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 DEPENDS = " \
     appstream-native \
@@ -10,7 +10,7 @@ DEPENDS = " \
     docbook-xml-dtd4-native \
     gperf-native \
     glib-2.0 \
-    libyaml \
+    libfyaml \
     libxml2 \
     libxmlb \
     libxslt-native \
@@ -19,7 +19,7 @@ DEPENDS = " \
     python3-pygments-native \
 "
 
-inherit meson gobject-introspection gettext gi-docgen pkgconfig vala
+inherit meson gobject-introspection gettext gi-docgen pkgconfig vala bash-completion
 
 GIR_MESON_OPTION = "gir"
 GIDOCGEN_MESON_OPTION = "apidocs"
@@ -30,15 +30,17 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "db4439db6a33de3ca1041473501610844ddf1b72ae23016c05242c681c380b4d"
+SRC_URI[sha256sum] = "46b4257100e25a6468ceed7b3ab82441f47b119da3398d30aea6d7b91174b586"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG:append:class-target = " bash-completion"
 
 PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
 PACKAGECONFIG[stemming] = "-Dstemming=true,-Dstemming=false,libstemmer"
 PACKAGECONFIG[qt6] = "-Dqt=true,-Dqt=false,qtbase"
+PACKAGECONFIG[bash-completion] = "-Dbash-completion=true,-Dbash-completion=false"
 
 FILES:${PN} += "${datadir}"
 
-- 
2.34.1


