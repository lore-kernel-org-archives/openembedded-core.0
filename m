Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71FEF4180E
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 16:10:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18453.1773072606050351277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 09:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L1V+COd8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6299wXmb2544593
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 09:10:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=xlPmSLrdNOm99lsA7N2Oyn
	IKOQ722XeUHYlbHKKMfDk=; b=L1V+COd83048MrhITPjPbF2g9Nl9ApCo/0BXac
	OIdKthbTStirkSw7jbZ+w3zBgjH8WfV1pGKTAl5T3RdGXljDeR9Mu+yssBPkjvcJ
	XS5DD+pLhiHNrCXyBc13iORx54uYVYVgQ/VLqIOiXxiQT9Ge5NldlkYjT4LTy1IY
	ZSTE1LP5XJ+VMu3/oNw4219+JqLhNnqBSXSW4xNU41xeKyxzyGBx/u3bqWb7x8Q5
	ltdSkJRZJ2EPTof1EzlTrjZCZiWKHMadijPqkcvyrNx1IoGDXMuObmkfVqBe4EyY
	qtNhqmKQxaXAEsqR/uHCSKsW4oKEr9h1wt69SrNLzJ9pV7GA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62hwag-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 09:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JX3ZjuGN89nqonKGCGp/qrheRAR+P9+uVcpw3O6l6fbPJkL1NSEfLdhDXjuylDW5/6ANjR71vJ/VBwJ6OaEhzPjxBpM9hUn2R1+LX5ppWLrAVxdTn80I7HRE/+dbzOUc+NcpI0ulnPfDWuIL2YQXOaWymXFAbDai4TPv5+DqG5ZvtW1cTSxHeRbolbflO2g2RiYhQZYahMO3zjE7giZycdDl9LQgeYNjO/Ub/ZwtaznpKItn5FG0RyGfgpr4In/6VnyNV3SuqPfWvwyP2ACQxSB4k7PSgPi4BPbl+J+6isRQDS/ScjD5KYY/upQ8CBBMYOFj5yGuUVhhw5H1oOkzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlPmSLrdNOm99lsA7N2OynIKOQ722XeUHYlbHKKMfDk=;
 b=syRk+CV0U1gl8Gv2y0Ma2A9bP5FI2Tr6n9HvX0cqdE2ZOHIdlsAmMkzpHt9+QibNg9RVmv+FnIlCZ6j0c54GnmyBQLqnlEDXy3mY7MNelF32d8cizjO5rUKv0Zs7glBfspCyRUTL4ATxCNBPlIxdQVRzz0YKlbIa7Wv7OGuTu/0QsN8mOLTSjOYWB95ZgmsQZUTrZgLVdZTys+PrEFBGnvuxqv9Q9WDsSQLwT9T6etGDa4nEpZK+CDUw2Y5aoTpKriZTprh0n6/RgfpjlIQPSZBz4Ha0/0AQj1mIdcZckp0O1CymcP8UskH9SV7Ufp/ZscK6RBIa8Gen/TUCFaJ3zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 16:09:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 16:09:57 +0000
Content-Type: multipart/alternative;
 boundary="------------ksYwiQHhrYpVfVkl2HxQtofK"
Message-ID: <22371edb-5575-4636-88cc-462d0b19646c@windriver.com>
Date: Mon, 9 Mar 2026 21:39:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr,
        Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
 <20260304174324.1186644-2-Harish.Sadineni@windriver.com>
 <da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org>
X-ClientProxiedBy: MA1PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ2PR11MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abce0ff-bdd7-4e71-110a-08de7df64ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|8096899003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	3ImCfpIntBFS67DEotZJXmifs/PXkolIjOFM1z7shfayIH39VRhbYQtZr6KNFXNo9fakDdNYlubzZa8hLBLMd7uQRHnv1eiFEqJbT7M+QVtKHUmaH/UhAvwJPqwiGgd+cuaVzTUnGjpS+oH+1xS2AVxi5NVr9X5nX95cnDzPd/G2JK/p2EVmisWTIy59WVosOykMEvQZY9b1ZnNoPgceVBADZ1oGnoLhk2vLWE0F+RIWsR05tv7j88OsjbpBuBxCwi4B2DQ6L+LUZU2LZDTH1zf7pvrWPuxDKHX6scEuvPwDY0ydroFKx7YJKNy2MCAXx2zngF973FDpHo0fUvCbwldnrIH59WKdQSshu6Y4UX+A1DkQlEP6naN2MsJCE1GDaPApsbvEmVcBrsd8SiWgiEdRd6aD5DYlKOk32ni0dsMgGk+ZZHs1GXz/eSOZSYfb/J2CWLbuqw/HGRsCyFPectO7KcwKB18+K9+z+4468CE3QuEtRnNIx69vrjP49wQS7D7G7YAjENscuA8TCZlRm8tGpcgmBcADF2H00vTpBX79YvKIpKnjhUtge+J3NnbMNqKjtpw8lDLQ1btSl56XXjKJZoTZeIwieenpD2xeGPk+osOGMKmK3ds3F6Uvm+axov7aRNGyRQ0BMMhM7XXbma5oWspLB1gmfJhDsVkccqXdF0tb0V/pRqbkIqo8Xv6dJYglW8kdA9VphVnOoEzBGHajD0KKDrsH2ms7EdPZdnafVJStbF/k/Yls530aDNlmP97DXMLqRYSNBhA4vzXMwtn1OATS/nd99vMnFQuMTe0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(8096899003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TTVlTTkwUmswai8rVGw4cWpkajFacWZOclNJYXNpUi9YcE90T3I5NzVZMElV?=
 =?utf-8?B?TjhlSkNhUFBCZi9zbG9yVmFXTWROaVRYOXpSMVkxbExSZnBJVFJQTlNFZXEy?=
 =?utf-8?B?ZzR0eXljbjNzTERDK0dBdEtMUkFvVzVobm90ZkJzMVF2SDcxVE8yVTNKNWZx?=
 =?utf-8?B?RllYbDRJYnZubFdDdllCTi9QcmNIZ3pXbUpMaG5aOTJRaWhIcWxoWFFSQXVa?=
 =?utf-8?B?UG1IUjVtamFhUlBvOVV1dHpkR1ZmTVlrNkExZG9zYjdONDAzNE04clRpeC9W?=
 =?utf-8?B?clgzTk1TL3Y2b1dISnZQc3BxM1d4V1pxRHFJVTRKUWVkdDVxQ3cvUEdjczRL?=
 =?utf-8?B?blVscW94cXJrcWRRRWJ0Tk1CRHl3Yk9BdTQvVksvS2plZFdrWElxb0tBMERU?=
 =?utf-8?B?RWl1MDd2eXM4UTB1OFU3cU5LNEZMSDJEZS8yM3lSeldUY3c0Y1dvME5keTd4?=
 =?utf-8?B?SHh2RnFFMEdEbEZ5YnR2bGROOFkzNGN4TFRGSmNXMTI3aWZYdGVSc0daQW9v?=
 =?utf-8?B?RmVmUlVnbEl1QlREUWM0SXRxVTNaTDJQSk1NM2hFTFdtZlpIbGFYM0pUY2VM?=
 =?utf-8?B?YWtoemFLKzVZR2Y4MGNuZnFFMEVZaG5ac3pqT2lueFlvazZ5LzI2THJzeUpI?=
 =?utf-8?B?UDdxN0I3MC96U2JNcVRDQVg2TGVGRFFoZVNYaENwZ3JjSi91VE9LNmwxQm5s?=
 =?utf-8?B?bWZxS3FabWExdTZ2TXkyNjlhbHArNHVXc1ZZWDJIRGlrcnY3Z1Rncnp2UDNN?=
 =?utf-8?B?LzVoTE9Qa1FYc1pnWktXMW0rcEFTQWJiVXBlTVlaR2wvYTd1aGhYczhjK012?=
 =?utf-8?B?YUpKNGtNdTV3NjJFNUJYNGJsSlhWY0RsaEoxbTFEc3pteHlKbUxZcFV6aTNO?=
 =?utf-8?B?NzdCM1psTktQMEV0b09HM2daMmxBRGJVcFI2RVh2b2V4UUY2QzZ5QnIzSDYy?=
 =?utf-8?B?WDNmRzFrRWl3R3FtUzFUUUhxRVM0TlJUdTN0U0dFRlh4MlF0d1dwWTEvR1Jj?=
 =?utf-8?B?ZnZhYkhFd0ovWE84SVQ1MndOYkpOWG9ndS9wQkVoTVRLT1JvakwwU2QyRlpx?=
 =?utf-8?B?b2lRZmY3SjhMTEJzc0VQOTZ3REZ2VEV6MHRWZFU2MW5iNDJzVWJxdmFvZkNh?=
 =?utf-8?B?eVRWam5DNzlGNUtUVGh2a3V6bXdhbFdwL0RzcytKaVAxeWwwVG5HcWFjcHBH?=
 =?utf-8?B?WHV2MldlRW1EWHgyZGlRS3Q4YTNhdHkzNHBtSmlBZ2ZWK1hTSTE2K0R6OFpy?=
 =?utf-8?B?eDc1NE5wYWJ2Vy9GaFlzT0h5T09WTG5MQngxT0Z4RWQvRlB2Z2I1Mld5THY1?=
 =?utf-8?B?SVRDSjJqMGZGM1ZZRFQ0SDRzVTBFdHI2Mm50bGRKZnphZFFOK2VMWHhYK1E4?=
 =?utf-8?B?WVNsRVA1a3RhcVlyN0prZE5TM1c2dTJXRXhtWEp2TnQvTWRleEhjNGpzcnpI?=
 =?utf-8?B?LzVCSkFPWHl1ODFTbVZxUXdrL09YWkdVTkdMQ3RvV00yMTdheDdtMkVvQmYx?=
 =?utf-8?B?a1hnbm1DbXA3Ti80UDFVK0ROR0NEZjNpcVQveERCTXJLekhCTFltMUdjYmVH?=
 =?utf-8?B?dFh4KzFQUlhxcGFjVjRCdW92M1dwOXBLbjkreUE4OG80cjgrcnl0RTRWZlYy?=
 =?utf-8?B?R29nZ1ZRYTFtUlN5WnNJS2NnT3p2TEc1TkNJNERBaTQ1N0FHLzg1UnBLeWZF?=
 =?utf-8?B?OEo4eVZQTURodFRrWTdxOXc0aldURzMwWVROK1A4NXV1dlhiK01UdlR1bGk5?=
 =?utf-8?B?cytWQWRSUWdiUHl6d3NaTHQ0Uk43eUlOeXN6bzk2ZTRHQ0RMaXIyTWRtYUR4?=
 =?utf-8?B?S1ZreGJpZkpFeVZ0ZWUrYTgxaWNhWjlzSVJMUC9yVkxBYzZEZG1IbU9SdzJS?=
 =?utf-8?B?cTRucW9JYzJIY0tha2ZGSzUwSXRSWDZ3Tk9PWlgvUldQR3RHK1JrQThEeGdQ?=
 =?utf-8?B?YjVyOHF2OWtzbjM4MHErMkZYemVxNE5JNnBHeGtNak5DaEZ3Ui9HWlowaFIr?=
 =?utf-8?B?YU0rdXJXaFRpcWtPMk9nTko3Y0dTYVZrRzFiVGVHL2tEcUVzb0lPRVp0UVdr?=
 =?utf-8?B?SENEWUkwTjNoOWc0MEpBRzQ0dXR3WkFBNmRqS2lNcWp2VWNFTUMrdDdvZ2dQ?=
 =?utf-8?B?VVFLR1NjMGtSMHJIWVU5L1l3bS9rb2NJUG5OWkhOM3AraEoxVXI2bXVyOEwy?=
 =?utf-8?B?ZWdhR0hBamYvbFI5dXZ2SXZmZ0taRjB3RXhsbE40TFY5TDA3aytSc1lySjVJ?=
 =?utf-8?B?b2FKbGRlWVJ5aEpGQWRQQ0pqbUYyOS9rYmZYY0tlYXZWUk82Z2o3Ulh6SStT?=
 =?utf-8?B?d2pSQ0FrQ2dFbThiYkFNVHlvRkwyay84dEpPTjE5WE9SK2MyWFR5Y1doOGN3?=
 =?utf-8?Q?uL2fZDBFU7tjJdG0=3D?=
X-Exchange-RoutingPolicyChecked: 
	BRJ2JWeQSphGfd4bSDlcjincavDinizTYqtC+m8dWvR/BT7tvE8CKDF0lUap+XiHho9cTK6sUmFGtx4FW9+wA5vPWesPdD/LgY5a7r7e4xjph6pdU1qcculYNScfqa69j7wvQsLXuGQBtC22yPHm2Lr66dVw/Og8TTo0g+Akv5n8HutAqePIuxsXiJAwPS319ikZOCBewzqKKYOvXIFtnkfnw7imRRFSwXE3EIAKh/ew9r4Msnoo1c4UJwOCV6AuvkI3nuu/tVkpcLEzkjVYmE7iCtU1SXZXZZdOoic/U1Yn4O/KEJSiJJPRWIhZzkrK6yCmZKNvLd14BxhDlxJNnA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abce0ff-bdd7-4e71-110a-08de7df64ee1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 16:09:57.8813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GemBEQkLmPGAbj5JmFVt8o/NI3fL9v/BggFdOt8OzgJ7PaTiD9Ej7EYi2/B73/RXQa3cZ2wEch4SZWyI27060DGanUUl4iv//tkifncY1v4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69aef0dd cx=c_pps
 a=Vharl4M+XVTaKge5CdhMZQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=wUxZ_qSXGe78a3KpR80A:9 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8
 a=yj-aMKAYKbz0kkd27lYA:9 a=Q89q7Dxll5h0zwxK:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE0NiBTYWx0ZWRfX2+2j3yYmM4XD
 MhFOv4mpKU/+2tphMB48mLUKnbbSEm4+V81coo3+cjk2GwG1D31hPaLf2bgI7yWf3+Ba+tqaZCu
 HE7saXv7fz/oQT7gWBvqtWNKsVRy1+DrKkmp2yKU4J+nm4X4RQXkk45KkD2wFha6sL6qUyxCyyV
 ZZxaUUDxYZ4lz6bGmPkr2MLaBl867z5OTUf/kboG8Qy9reXns09NrA3zSmYPkvc7NptAYLqWd6I
 wPkd+mhOWqYULNNIS0/DpJxa1YIhwmYitnvGmsI0liIU23n0JHYZfcopBYpV1iG2OFU3uS4ek8L
 Ke/qp46FRd7+dF3jvgOs/pY3wDFkTT5bhWDYrQhQ2DmgP416nKpAm1nhAnBaeGkMIwLuwn6Oqac
 dUs5uCM/hj9G14nn1tzmWTnTQcQ0oZXkWEssrnV8Y2qlCLpTm/p014m0VQq3gIIxtJxvlPMQk3z
 eT2JQBZwIvWkwBQGJAw==
X-Proofpoint-ORIG-GUID: FHA0CY3SC7agiSl4qSuHQH2u8_QBWguz
X-Proofpoint-GUID: iyHlYPedcUgd1WqYw1xz8YU3bdfc-0FM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 16:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232728

--------------ksYwiQHhrYpVfVkl2HxQtofK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/9/2026 4:56 PM, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via lists.openembedded.org wrote:
>> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>>
>> Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' to 'DEPENDS'
>> when Kernel Rust Support is enabled.
>>
>> These tools are required for building Rust-enabled kernels and for
>> generating Rust FFI bindings via bindgen during the kernel build.
>>
>> This ensures the additional dependencies are only pulled in when
>> Rust support is explicitly enabled, avoiding unnecessary native
>> dependencies for non-Rust kernel builds.
>>
>> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 4d0a726bb6..b7961bbcdf 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -76,11 +76,14 @@ do_install:append(){
>>   KERNEL_FEATURES:append:qemuall = " features/kernel-sample/kernel-sample.scc"
>>
>>   KERNEL_DEBUG ?= ""
>> +KERNEL_RUST_SUPPORT ?= ""
>>   # These used to be version specific, but are now common dependencies.  New
>>   # tools / dependencies will continue to be added in version specific recipes.
>>   DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
>>   DEPENDS += "openssl-native util-linux-native"
>>   DEPENDS += "gmp-native libmpc-native"
>> +RUST_KERNEL_DEPENDS ?="${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', 'clang-native 
>> rust-native bindgen-cli-native', '', d)}"
>> +DEPENDS += "${RUST_KERNEL_DEPENDS}"
>>
>>   # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
>>   do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
> I thought we were going to try and use KERNEL_FEATURES for this?
Hi Richard,

I have tried this but i got circular dependency error with 
KERNEL_FEATURES. So, I opted using variable KERNEL_RUST_SUPPORT.
> The implementation of KERNEL_RUST_SUPPORT is problematic as it only
> works for the value of "True", not "true", or "1" or 1 or any other
> thing people might dream up. "Contains" isn't really an appropriate
> mechanism for a boolean either.
>
> You can use bb.utils.to_boolean() as a way to better obtain a boolean
> value from a random variable.
Understood, Earlier i took reference from the code that already present 
in that file.
I have updated the code we will send v8.

Thanks,
Harish
>
> Cheers,
>
> Richard
>
>
>
>
>
--------------ksYwiQHhrYpVfVkl2HxQtofK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/9/2026 4:56 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' to 'DEPENDS'
when Kernel Rust Support is enabled.

These tools are required for building Rust-enabled kernels and for
generating Rust FFI bindings via bindgen during the kernel build.

This ensures the additional dependencies are only pulled in when
Rust support is explicitly enabled, avoiding unnecessary native
dependencies for non-Rust kernel builds.

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..b7961bbcdf 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -76,11 +76,14 @@ do_install:append(){
 KERNEL_FEATURES:append:qemuall = &quot; features/kernel-sample/kernel-sample.scc&quot;

 KERNEL_DEBUG ?= &quot;&quot;
+KERNEL_RUST_SUPPORT ?= &quot;&quot;
 # These used to be version specific, but are now common dependencies.  New
 # tools / dependencies will continue to be added in version specific recipes.
 DEPENDS += '${@bb.utils.contains_any(&quot;ARCH&quot;, [ &quot;x86&quot;, &quot;arm64&quot;, &quot;powerpc&quot; ], &quot;elfutils-native&quot;, &quot;&quot;, d)}'
 DEPENDS += &quot;openssl-native util-linux-native&quot;
 DEPENDS += &quot;gmp-native libmpc-native&quot;
+RUST_KERNEL_DEPENDS ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('KERNEL_RUST_SUPPORT','True','clang-nativerust-nativebindgen-cli-native','',d)}">&quot;${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', 'clang-native rust-native bindgen-cli-native', '', d)}&quot;</a>
+DEPENDS += &quot;${RUST_KERNEL_DEPENDS}&quot;

 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains(&quot;KERNEL_DEBUG&quot;, &quot;True&quot;, &quot;pahole-native:do_populate_sysroot&quot;, &quot;&quot;, d)}'
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I thought we were going to try and use KERNEL_FEATURES for this?</pre>
    </blockquote>
    Hi Richard,<br>
    <br>
    I have tried this but i got circular dependency error with
    KERNEL_FEATURES. So, I opted using variable KERNEL_RUST_SUPPORT.<span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">
The implementation of KERNEL_RUST_SUPPORT is problematic as it only
works for the value of &quot;True&quot;, not &quot;true&quot;, or &quot;1&quot; or 1 or any other
thing people might dream up. &quot;Contains&quot; isn't really an appropriate
mechanism for a boolean either.

You can use bb.utils.to_boolean() as a way to better obtain a boolean
value from a random variable.</pre>
    </blockquote>
    Understood, Earlier i took reference from the code that already
    present in that file. <br>
    I have updated the code we will send v8.<br>
    <br>
    Thanks,<br>
    Harish<br>
    <blockquote type="cite" cite="mid:da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard





</pre>
    </blockquote>
  </body>
</html>

--------------ksYwiQHhrYpVfVkl2HxQtofK--

