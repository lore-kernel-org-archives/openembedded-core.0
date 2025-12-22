Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D54BE67498
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 09:39:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77324.1766396337930000659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 01:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BNFKykDm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4451276127=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM50AhJ579608
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 01:38:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=bb47Oov0ZRUmkHHWi6XcpRZBVfw9bu4bKYpZrAbQI6k=; b=
	BNFKykDmNizBovB1dNIc53Afpw/jy1wjbvXGDlLxpnNy4UhidoUVoMsJEVmOYbdV
	6SAVcVP0aMlCwyPdxJtgfkYYb+0PDIDOk+aEnWr6sNHwjrXY6s+odKU6W7i/8GBE
	QZ4fu22pHGHoR5oW+sB6SGzYAH3FhoTCva+nmJ2MmN0JWOoZFg7gDRtYBmsCiBWh
	Zdv1zQQvZ0lZgCsVWzxfwEvK1NGe1iMmRzEsL4DN/JWwAtriJK+GyDqUFsTgCG25
	z+DyXno3ZKSdzTqVtLBbqSV30dQV7i8XFE003A4/iyk/G0SYNupH5e7i0OKUxcMX
	HsAQtR6tDgVWw+wTerXwtg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6h99kj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 01:38:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v45BrJxwBOoQxntwSgybRL5YSgA3gjBq4cWmxowDuQuzPjo4myLz9X4ynp9XJ7tftZK+WyAmv+iFmHnfaTN1N8ajdSRvMAUUQAgcS2yTKYMOl+RFHzRl6bs6xvMRM/LCEqKEggwflNk+70+ojJrqr54JUHe3Ud4nZMpae9YIJ0rtMeXmsCpr71y2OmbDyOaw7/Vm9ZNoIUXy5VRsRERmfrJlicvd7L+741HrBpUAc3wBKsPG79lh5L4d49fGf+zbkU6ZMm55mfQjv6o19TDZM51bur5NCQGoMGYBzNJUjc0ZnDKOF26i9EoClXI2mFixC/89wSLy5fhQDxkWCPIw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bb47Oov0ZRUmkHHWi6XcpRZBVfw9bu4bKYpZrAbQI6k=;
 b=Km4wMy+YiY8WDay/z03q3a871tfFX3RwfWg2ISrafiHYdIPs+rnnB6MdE6VamQofXqichqQj7X12fLfsZX+UEGxuOSIOskGPKOh6IDANDe7pCjeNPy4sHE7zQmJrGLLxUkAqndqHA2RBCeQ4j4RWkSNbAhLGzgNF243YmhFP8QADStqUBk7+BNYfRO1KHir+ITSgjitCxEc3OsHpvFwKXCtWKczW2daHAOgJP8B+uIZAviB5PBQqcjCIQiwez9hSZAL6dqgXrbCvtO8FQb4am6M3s9XSkMdrcfArW90fo53rFwGYmE96paYK6i2bICf+tpaZYSxNmkz0RJjI5ElJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH7PR11MB6547.namprd11.prod.outlook.com (2603:10b6:510:211::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 09:38:55 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 09:38:55 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, randy.macleod@windriver.com,
        Yash.Shinde@windriver.com, SunilKumar.Dora@windriver.com,
        hemanth.250302@gmail.com
Subject: [PATCH 2/2] rust: enable default uwtable and ignore arm no_std test
Date: Mon, 22 Dec 2025 01:38:30 -0800
Message-ID: <20251222093830.2658141-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251222093830.2658141-1-Yash.Shinde@windriver.com>
References: <20251222093830.2658141-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0044.namprd11.prod.outlook.com
 (2603:10b6:a03:80::21) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH7PR11MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa4c5cb-672f-44a5-d3b5-08de413dec7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BV58TNSl+4EsqqwHtMR0B73dpyDJB2utfYvHN7Uv9Hw++MUdlqof/ruKAYM5?=
 =?us-ascii?Q?grUemNTlC0/dvHsOWPO9k/QpzEcuzQqjzlBcAeJ0XR6n3n8x518JolJEmMw3?=
 =?us-ascii?Q?YILn6zCnbK/TjT8x8ZhBeLHUO2ZodTJP1wSvsvTazwqQe+w6C8KU6Z/OgIFi?=
 =?us-ascii?Q?IFSabbUmYj+/Mm39VVUntR9S1qbJ0qWsCldxYbhAAMw6oGnWjaB/dyys6s8A?=
 =?us-ascii?Q?RW3fxYhJxyBZdJniNdMB+KItV9WXUMPgSXTPpnjRKeyZxMnxBLoDHnXEBaUO?=
 =?us-ascii?Q?rPJ0Ni12XjJ+0tevqwhIAxw7bNtpJEYxv1V5jYdmA+uYmi02v2xmOicHlXrZ?=
 =?us-ascii?Q?3FZBUbrNXq3szFo6Mzql0bCRvzU/mKX9MmX4hj4tnjQ18gseZZKqrr4nw/hC?=
 =?us-ascii?Q?CYR3IarQFjsFrA9g5MQsZwPraZGs8SgEIJYMPrcruIWQ6UvEaA+rirJ8fL1A?=
 =?us-ascii?Q?+DGlRWpypKsHaHbIO4ZYHKgLePdhmJ1v11PHWqNbgJiHJMXNADEXKm9g8QDS?=
 =?us-ascii?Q?nB2C0/w31qWtRxc815tLucexcDlE/NzRV13jSQ6fLTzwINfXVfIPVWK/pGxs?=
 =?us-ascii?Q?otsSulHfeQpJ0/eDcCpXJXpLb7s45EAP8dHJ/aisUKJ6zELvCidLrp0rk5KA?=
 =?us-ascii?Q?1mn1trYBIKbtJd6hRAsFUqfsQ5U/LlrcqyjPwhcP6HXuhxnxAOcq95zmbjNf?=
 =?us-ascii?Q?a+njrDssMIIarAW6EHEr2gusNMxs/4c7zdl+tzHDDlur96+dEVsRaNl8D/7D?=
 =?us-ascii?Q?iw1wG7gYszODHUyZCFdEZUXy2OJVTBsYtzEhuca47LQJEUHTsuU4+tQArGME?=
 =?us-ascii?Q?eZKlXciI29Scjsc7KdwvsnOfRRbZ9qGt5bHuzuJ2i1lhCa2gmCal45fVqNTN?=
 =?us-ascii?Q?KvyFAwfm/1D3tb9ClGXhtkmYboJtxZXRa2+9HAMBblcBbCTRK5omVqjRToq9?=
 =?us-ascii?Q?gDW6WrAQZAjA3gN6Ay93E4nqFwYLLd3dRk2jnEm6SkpQwQxpKYCS9bcjZDxX?=
 =?us-ascii?Q?xYqCUZWzCQXuQhucd9GqKr0Qgm+UDPVULtPrx3q67wjWjJaqXfH5EeXQ6+6F?=
 =?us-ascii?Q?5xltXKHLQhzzyplpPirGGpiZFceDuMiKMidhOooA/AQf1qx9rvH+qRUl/2j0?=
 =?us-ascii?Q?DtLcq7rSYc0+41zwZK1llAIRRJayk079fKHLNKg3Obg+whaoj4lT5USseNQ8?=
 =?us-ascii?Q?CUtiZA2O/HV1VkZzoosxP5Bw6ELcKbOSsfzunSl0CRsBhanbjCUnV6K2x93k?=
 =?us-ascii?Q?8r/HgYc4u3unRkVMwMtPKyRhYcMhQhxIPmNrsasJEC4CFljo7KJOZ6wH5BBC?=
 =?us-ascii?Q?AfvplEWWGgOoyd9+dGkG7PsN9nsp40hkWsEsfnkQaZdE8rNAaMWAAz7yDV9R?=
 =?us-ascii?Q?MAatAM1l3BffJNQIldr+w8iIcGK42sBPVhFscXjNeZ5+jwLNc9VWJMDx1cE7?=
 =?us-ascii?Q?SHmdFkoRNeoozr+6o0F1gj3j+YFGzxPw16LsI2fMNRm9EexL+gLP9Aqye5HH?=
 =?us-ascii?Q?J6kPnQtvk2g9RWLF2XB8LXD8sn5ThMi/487J4fDSxqdCS0yEdSgl7481Ig?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q9kKTne/wxjdcaOgvlu8p4bkCJ0lcMJAVNWZc50/SAa5pkAb+XbiATdrL6c/?=
 =?us-ascii?Q?3HpMk4diVaB2ogVl/buOrV7b207ErW7WN/b6PjeM92Kh3slz5Jc7ry5cM4qM?=
 =?us-ascii?Q?BH3EqG60T4CZ93pHoUkJvS/MBlLGO3WEuXLWM1fRayA4R3dizYOyYvE7/Kdv?=
 =?us-ascii?Q?fK/pbGf0x0JEGMKEkaIL/LVSnw6eU7TmGqoHKMpYMkfvWAwBbLYKcFjbaQuV?=
 =?us-ascii?Q?GrEs/lzjVzVm8eRJqnPlP21+6u9HRJJ60JChUYS65KM3xkqNsvnpZwQM6y5n?=
 =?us-ascii?Q?bFwx79a4GZYmw2l0WKf73eB0z5Bz4CbWUiln7FNvDP62jdONaO9xdtYky2Ej?=
 =?us-ascii?Q?cZbpRQgv5L+rSZrCHHb60SRiuhPb9zpf1lOE4wWlr7VhhzEObR5imhLjkKCM?=
 =?us-ascii?Q?grMDRCKw6hl8ac3jHxweFZbZVvBvPVkWJscwpJx3eXOCxlvZeZfAcSQ9eg17?=
 =?us-ascii?Q?4UlZo2rwk/tA+G4t4dpWSGt3aC/oW63uVgDb2S7orOWb4RA6NShcE0bxzitV?=
 =?us-ascii?Q?DX98SyPOKjovzdSNa5QeTC4cFX+C1U7GkCF5ihL4KrEN52TPLVrXqKV4cPY8?=
 =?us-ascii?Q?63+UnzHxju2P8aDOqbhhpZZ8pSPQdMr8dJYACaAm7UXZvbObsgQw0Oo6WB9z?=
 =?us-ascii?Q?A6jDJb5fEZMnbqp6hCs2VWZUgZCNLj5hOSzIdKoFLMRx8ufaHdDvJY9rHJPH?=
 =?us-ascii?Q?9rwr9IMdxUgM2+wJDcFag1YIEsWpFqa2ZpurRzVhuD0JDJrtMVVujMLKhXkV?=
 =?us-ascii?Q?m+DcU25Tt8CI5PBU66wftVvNWwOJetlCkErB9NCPyzo3CpST/eCXi9wJG715?=
 =?us-ascii?Q?UZV/GoYDW9KKLnItzHELm7yeUjSOOFTZ/dETawIR/clODkbbS9U8sbHk2XOk?=
 =?us-ascii?Q?rzgeNA407aKr7PBsfQhegjhxNhKJ3vrdfnJkmhI7cg9Sd1XCVRXRPC2NcXeN?=
 =?us-ascii?Q?qSFv0zGzgV5aOuLrJERTYOAHNnW6CkHt6fxqUyvLGAHdFrj+gGV5sCiBkyjl?=
 =?us-ascii?Q?zqKCDF/INPS/GNXE/Nc/T1z4JZUnaAeS8GQL0qawAXrPgklCPuqympqnV819?=
 =?us-ascii?Q?7z8+egeeY1+kqpGlgX+X0QMILcnLAt/B+vDEEXmpCBSBL7QfFNLOY68AzF/A?=
 =?us-ascii?Q?xq90Gy9QrgUip49z1p31I5ygw5ZyJ7HZz5n1yiM3zwsYc3yBjUXjizCTNhW4?=
 =?us-ascii?Q?81FDkd4XdJVOPdc6PppM9ElQ4VgoWW3IKcWACo/uL6vu+GyVvVzYYbVleObH?=
 =?us-ascii?Q?9XY9mS16Pqyj+UWuDnNtwz6IEuz8FszirGke9s3fQr6IVI/ay4wiqFG0cpb+?=
 =?us-ascii?Q?m9dGhfYOEsXGAdQS6rarlrRdcoIRtFyJWyUHXFLEVEkwso1/ysJ34g8B5v2H?=
 =?us-ascii?Q?yiVLTPn+t+rP9FjfEwvv/74/Qlz6KUBGRDjhHfRibDzWCAgLRIXZt1slRz9Y?=
 =?us-ascii?Q?ZLZvTv5oEoTho7bfv1wGGzLtKzDUlrr094WyYPHFeg8NWCVpqylgtnvd4k4O?=
 =?us-ascii?Q?c7GA+o19LVPTqz8okWuOqW7YZRyPNLH7ZToMJJzV9pUPK1Kxzg3ggXcNLhm2?=
 =?us-ascii?Q?auJQgZ/cTjioDxJwSRr/LVmAG97AOcZWr2Ut8Tl5OUNNAvjdE9GfcarEee9W?=
 =?us-ascii?Q?e+wVGgSc+domfnd8ntcOJZb2utUZPxd23jS8+PW9lTbzku6EjaUbdz02kxSS?=
 =?us-ascii?Q?eR/Z8PJLgV/eHID5L+1mrHz6SuGqaR2zSSoI9Pzrr1KoAwFe3MGPTawg6ZI8?=
 =?us-ascii?Q?r3GIJOU8K+fcknadzE8anVxAySF+80w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa4c5cb-672f-44a5-d3b5-08de413dec7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 09:38:55.0297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XNOzp6ZJnXUNSdC1ZpOM/GEaf4bUPfcL+MkHvgfhpjejJsWcDgN7KvR/YJuEhXfyDmzjs//cDeD2d3TvYwdugeNtYqWZUqC+3jzip+7bhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6547
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NyBTYWx0ZWRfX3atESKBMSOeA
 l6Z5o46rLPzgMSOPlKdDtX1JVOpcV3J8EdOszEeMNMLKLK1PbANyITVH5arHmZ15xxFm2YPtssi
 Gcb68ylW74A47ZV3+rLwz6VDVZg1AaGHYtDZR4EYwa4cQ0TMh2PnUWpw0tFUdWnuPJiipwmdmrJ
 wEhDExVDQYk8SZVWHhFucNvD6B7PJ5ElZDAjJhsHmQrBi6Q3epN30PWWGUJk4mQ4fPORu2ye5tC
 Mo7LMheIMYlsPHU9vA4pYqqy0sIxY0/AoNOGCWCo4q6p9KWgdJPu/1jyMLJVKfV/Qb9+5KXSPpd
 0qPXAvtLaC+f22bQ1glN8JaZZI0KQas7udeKuRQ5F7tchwPbFDp+EaCSu6skDDCgBtAHI+DFbP6
 TcB2Mw6D6cT+D8GWxXz08Ilut9dxPxyd7xrwsvgD8U0rGDGzYnyqKHBfksilPsghQTlfz06RShT
 swkP5G/xmo5FkJ9LfCw==
X-Proofpoint-GUID: Jko0MAW_7jWfXDhY98ep9zjIhsJ_G3l8
X-Proofpoint-ORIG-GUID: nnkSp0nABggblJDivJuRa2NWnhnxJHlM
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694911b1 cx=c_pps
 a=0Wok1Aa8RnZXRT++mDYMDg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=T5giomQT-miuRDmbSvEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 09:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228289

From: Hemanth Kumar M D <hemanth.250302@gmail.com>

Rust 1.92.0 adds new test that require unwind table support to be
enabled by default. Set `default-uwtable = true` in the generated
target spec to match upstream behavior.

ref:https://github.com/rust-lang/rust/commit/fe66eaa67acc47525db6f13cf97d54780d87b805

Also ignore the no_std simple-runs UI test on ARM targets. The test
fails with panic=abort due to a known unwind table issue on 32-bit ARM

https://github.com/rust-lang/rust/issues/146996

Signed-off-by: Hemanth Kumar M D <hemanth.250302@gmail.com>
Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass       |  1 +
 .../rust/files/rust-oe-selftest.patch                | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 33a290412e..2a06c4ae8b 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):
         tspec['llvm-floatabi'] = "soft"
     elif fpu == "hard":
         tspec['llvm-floatabi'] = "hard"
+    tspec['default-uwtable'] = True
     tspec['dynamic-linking'] = True
     tspec['executables'] = True
     tspec['linker-is-gnu'] = True
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index b39b326455..d1fba81612 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -254,3 +254,15 @@ index a3562f2fd93..d4e52ed91be 100644
      fn linux_hwcap2_aarch64() {
          let file =
              concat!(env!("CARGO_MANIFEST_DIR"), "/src/detect/test_data/linux-hwcap2-aarch64.auxv");
+diff --git a/tests/ui/no_std/simple-runs.rs b/tests/ui/no_std/simple-runs.rs
+index af44dfe..e6674e5 100644
+--- a/tests/ui/no_std/simple-runs.rs
++++ b/tests/ui/no_std/simple-runs.rs
+@@ -2,6 +2,7 @@
+ 
+ //@ run-pass
+ //@ compile-flags: -Cpanic=abort
++//@ ignore-arm FIXME(#146996)
+ //@ ignore-wasm different `main` convention
+ 
+ #![feature(lang_items)]
-- 
2.49.0


