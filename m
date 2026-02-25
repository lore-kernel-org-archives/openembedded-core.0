Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F055F55456
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 04:39:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39048.1771994398796132179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 20:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lRdVQsrx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65164714d9=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P4K1qm1410555
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 20:39:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Ic0llYMnOuWm6VUcsBSEGenf9PoTK03TdcoAn+VbhMU=; b=
	lRdVQsrx1NStLqIsOn4Dl8cbSHcWPhdidwFQMy7EgnLfDM7YCK+DCPb0anvwPxX1
	lOJtrEw0zO1tWRqvryjjRt9MYjl/wDxRzoMKreJen0Iv9IyvUQtDu8eCNVxDcAZV
	bQUiGtf8AtDOwig1BdBNmdf1rob32jNrRvPkA0TUFO6jF5NVm9X5L6n0dv2XmM8T
	pQJaBiknq/NzXBC5kzFS7w9aehUMOZ6VjkzuzhkLeicdBmmDOL31b5lSPIJX2V+u
	uAHnD+nzk4cL9ps9RPI0L7NaZntPQP8ffCvIJgOGxrLpZwnCiRlICaRxKCg0RVFp
	4QDbkxN8VdQz5/odVP9owA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011042.outbound.protection.outlook.com [40.107.208.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf8v448yy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 20:39:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ua2QaZzb1NZoFktAI2IP806p63fjmkAjY0KNpiSCxYyMm5bx+FWblrGFhwqmlpmmHJMCZfE0ZXtOVNLZ3JV7dYmCX+CBOWA6IilFoEJrhhs4qE2I4rDM9N+/y5KqhkSwKxCZQg+eZijc8ijnjzND91bi0rz4lsHWVQKVuC/r/08MVYp0Zue2Yc0xwOIsP8aW2Xjrriyw4WQYhdjpCMJAYazatBmTjXMQpPVpij1WhhStoyCa7LT9gd8rnGQpl2oJrE9baLOJedldVOhRcYMdllKgupuwgJZRamKI6LiSkKYD1JpCOl7Onuu2YdksHWcjZusYViT1dXvUWIF70iJrow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ic0llYMnOuWm6VUcsBSEGenf9PoTK03TdcoAn+VbhMU=;
 b=R1YBo3T72LxfcjiwziKpZ0vt+APiojQTArLMuP/lN72SzHosWaeaFeg0/brFHzaIibxM6yQwqR78VmHg8jnvyrEKacZfCPQsuEIsCJDeQ70voo1Hmz6X5SCsxEY9jm8QAe+zNulljdVYDGRBDkPes121p0NIkxBSRY+CotreAsda+mx/tpdAexnFp3mB+ZM1Ln31DFKaKddOIMdcVx3ICnyQVO+gEnrkBtCkIyha7hLIoT5p9RSj2F6R907odCy0ogQ5fVGskWcYunHTIdpLJJqA99g2DnEuymF7OYTpqaN1wG0ucswf7tGpeuk2fWVoLTF8jhWgJPSsaoTgDwGa1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Wed, 25 Feb 2026 04:39:56 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 04:39:55 +0000
Message-ID: <336d26c3-b8ba-420e-88e7-e293a708485e@windriver.com>
Date: Wed, 25 Feb 2026 12:39:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] appstream: upgrade from 1.0.6 to 1.1.2
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <DB5PR02MB102138725558AB810833F8DFCEF74A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <18976046C73DA293.1454197@lists.openembedded.org>
Content-Language: en-US
Cc: OE-core <openembedded-core@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <18976046C73DA293.1454197@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: 88730fae-17c1-41a7-b13a-08de7427ec96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WmwrQzcxWS9ETUpDTVQzNWNpeUEyZUJxMjhUM2RkclVxWk1ZWldXbFZMVkEz?=
 =?utf-8?B?WThob1pyaTJtNTVsU3VIWWVHZXp4SHBZenF1NXVyOEJBUG9MdEdLRkh1djht?=
 =?utf-8?B?cXZnMzNFRm11Qmw0ZGMwWlcyMFB2L3JZdzBBWEZldm1QVHB1UnpsZ2YwYkhB?=
 =?utf-8?B?QkQzNUtjQ3Q0U09iWmd1YU94cUI1T3EvNnJBS0lobmhydUV6eWpycWtTYWdM?=
 =?utf-8?B?YU5yMTNqR0JOMi9wZzM1R2R5TVV4Y1Q2SUs1bzFERVpsRWp3NGVyZ0cyaE1z?=
 =?utf-8?B?ZDhRVFRVQ3lITGc3L0Z3M1ZwNXdGb2R5L3RBMzQycERwYmtWd1JISGpaZEdX?=
 =?utf-8?B?eWQrY05QMkdtZEhtR0pZWW5ORGdQRDJ6WmRkQ0NCZ2dDR3VGcmhTWlo5aFRU?=
 =?utf-8?B?bStVMGJNYWF5Vm9yV2RKUjJvMXBjc1JheWRRZExMVmJYRE9xaXJZSEhvam9z?=
 =?utf-8?B?RmtRUWVEV3E4VmduSVcxVEMxQVlLOXFQOEJicUllQTZwZVZtSG9GQ1JlUFMv?=
 =?utf-8?B?RU5QTlZNSDM4bnJCNEU5OEFlbXVLZ1JDNGlQNzhSSCtUNVNlQjNDWGN0V2hk?=
 =?utf-8?B?aW94RTJycExMbWI1c3ZTQkt0TU10eUJRRkNBcEIyekpsdWtMZWVPRm9NOVI5?=
 =?utf-8?B?MEhuek5BRHZsbTBzTG95NHE1WW03VUxIU0ptYU82RlZZZmZJSmVHeUQrMzFB?=
 =?utf-8?B?bkIyUyttMVplcmZVd1ZzQ1JDRUpya3BBbDdtS3dxSjAyd3FwK3V6MXk5emVn?=
 =?utf-8?B?N2ZuMlN2QkRzeHdDdjJmU1o2em90QkppeTBONjd4RC93N1VRMUhDaUl5Q09r?=
 =?utf-8?B?dDZIV1dHRFc0aWQ5clJtMW14aEJoQzVMWml1ZWUwL1RaVjVFUk9ubGtSdzhE?=
 =?utf-8?B?Qk40U0dMOS9RY1llblpTRzlBdVV5MGJISlpsRTErQm80T3dHN1VFZU9uQmRL?=
 =?utf-8?B?OWVFSDZvTWJ3U1dBUzBSR3o5RmtLdWczUEhGMkpXNUJDbnN3Y05LVTFJQUsx?=
 =?utf-8?B?TitXcFNhYjBMWEQ2UUpyaVdKbFJUaEJudi85Tk1BNFJzWXowWDZXOUNHTVRx?=
 =?utf-8?B?SnE2SGd6MEJJZjZCc3JhWmtKTXREWGdQVjIwSFlURWpFaFdwUUZjREZCU1Vw?=
 =?utf-8?B?bll1Y2ZLa3JDeU82NHI5eHErbDM5SGFpaXdTdmhVK0xVYmhacU4wQjhqYVBV?=
 =?utf-8?B?cGF6QXhBQVZaaGY5aGxWZzJQV29aVkRxQU9KZkVBcHhVNklkbXUvRWhrbWVq?=
 =?utf-8?B?azBtU1ZaNlRrekpyQVFRQkRhYTZVR09hU2RTaU9qbzJ5MDgxV2hSV2E1dnpB?=
 =?utf-8?B?YWZKcWNzSElwUm56RlliUlhQSWp4WVJxeWt3Q1B5RVJkRnhHd0NHSmRDQnFM?=
 =?utf-8?B?L1FaU1VkQmI0RXNkR01aaVZCemxyMGZWMDlSNnpNbHhoTzI5ZDR5Ny9YcGVw?=
 =?utf-8?B?RlFDTWlJdVYwbUt0Q1NlRHYrVVVSaFpuVjEyeUFaTDF2L2FlOFdsREo1aG9D?=
 =?utf-8?B?Yzc5aC9QTndnWkdaZ0JzRkh5NTZqL1Raa25XZHZMQXZqQjNUVWwvbHY3NTVK?=
 =?utf-8?B?d1l3YnBRL2JZMncwM1Z6UlhUckpFZXltRU1xM1VLWEQxc2Z0RzJ1Q1RERmNw?=
 =?utf-8?B?VUU4ck5meGFCTHZibWF1Mkd6ZU9ZbTFPMHV3TUNweXppUE1nR21XVkt0aTBG?=
 =?utf-8?B?RFlQMUtGWitzUzBvaDBLdjJ3WWlWM1gwYUdEbXV6NTJKbHd6VVhoZ2ZmeFJP?=
 =?utf-8?B?eG9WMjZGbFhzMjZzbGEwWEZOZHZXc25DaXRoblk3aXFGeTd2Z0srWWdYY0tM?=
 =?utf-8?B?cHJrbE5WMmVlYmNLM0t2aEZUWENLR2JHcW9lK0gzcDZ4VG5xQkJyQnQyL0lp?=
 =?utf-8?B?SktxeldGUnp4akhzUkhobWJBcWVoUzhzZmc0KzI2VzQrWnNyV2JwUW9TYVc1?=
 =?utf-8?B?cFpwMEdzVVFyKzVtVHBVek5oS055N3krZHV2c1VjTjMxZ1VwQ3pZUUN0U0g3?=
 =?utf-8?B?aHJqY0dVbVpTaUkvdGh4ZE9wUHk2ZEllS3ZQUWxFVEpqR3c0NzZmTGEwZDF5?=
 =?utf-8?Q?hH3ZWa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VTBrMUZiMWhVSk1jNURNUkVWb1pUK2l2Ti9VQmdwZHNIK0tDRk40UFdOWmda?=
 =?utf-8?B?M0R1aWhoN3lzK0g0QjRlQ3hvcjdpRWh4RU91WjQvZzZjeXQxVnMxYi95Ni9Y?=
 =?utf-8?B?VW9Dd3FtdnZrQytiZmxBYi9nTjhDY2h3UTI1MkhOMlI1VjZubzZ0cU5FTXl3?=
 =?utf-8?B?QU9uZmJTbmpBcURBYXVuTFlhMDVGdGZqb1p0VmUwOFlOclJkOFJkczhBaG5r?=
 =?utf-8?B?VUxIRG9PVDlQWHY3RDhqNEFkT09PZVoxUW1PN2l0S1pYSlY5Szk3ejhNamZq?=
 =?utf-8?B?Tjc1ckE0aS9zQ0FpaEhoQVNHQ0J2NFhKSmhleUt3RjhiNFUrZjB3dm4wK24r?=
 =?utf-8?B?blB3VXlpN2xqK2V4di9YNUk5QmtGZ2J2TXhTUWI1SzVWWW9WZy9Za05SL0px?=
 =?utf-8?B?RmZsbkRPYXVlVWNUUjJxcG1hRnh0YjhXczFlY25GTmltZDUwZTBnK3BIbG11?=
 =?utf-8?B?bnpKakp4ZklobDgyZ0Y4Ym5RRzVvRnQ4c0swVXY0ZWs5c1ltbDE5U0dMZTFv?=
 =?utf-8?B?RnN1YnRsQ3hBRXlWd0s2UG1aOUkrWVB6eHpXRi9Oa05NVWEyQkxpMmIzT1Y4?=
 =?utf-8?B?OEtiTWdweUZwS2VLeS9aUXFkSnl2WFFmcVI1KzlSWnZhVTZ5TzRXN01KazVZ?=
 =?utf-8?B?MytLMmVhK2FuT0lTTHdaOW1NQklZelJPdlhxS1BKOGFSVmFJU1ZBczR2aVNC?=
 =?utf-8?B?WkVtdUlNaUJRVGo0NmxaR0JNM3J1K293bnhnV3lTZ2UraGZ2RWNqbG9LaGo2?=
 =?utf-8?B?M0loUkhYdXdmcUdoZSt1MEg5NWJ3UFdsMElyMER4ejhBRWNxYy8wK1I5djFC?=
 =?utf-8?B?WG9vMmdUTkZ3Q2ZyK0ROQVBQNHo2VEg4aHRMYWE5a0FlRmZlYWJFeUdhUU4v?=
 =?utf-8?B?QWQ2Z3VGWGR0S2REbEJ0TXVGNTZMM21WTUcwb0t3N2ZRaEhDV2R0djFMYVlP?=
 =?utf-8?B?anhEQzk0SWFvb0lvb3BpTWdPb0JiaS9iTlJEeC9vSnhRM0lwMXB3cXVUS0JJ?=
 =?utf-8?B?QjBsSEpuSEN6c3VHb3h6RXBJOG1YSkRISXZ2RGljc1M5T3c5dnhkcWJFS3gz?=
 =?utf-8?B?N3lmWWlCSlJGcXg1cFFyNFdPY29SeUNsZHBhYitUalN3SmRZWjhJL2ZVNy92?=
 =?utf-8?B?T0Q1eG1VMXpab0ltWEFva3hjYWZmUHc5WVYzc1o1WXdTbW1ta2RvVjlVVUJ3?=
 =?utf-8?B?UWQ4WThnOEQvN1pvZ1RTNDlLZ3lXZFdJaTJsc2FabldWMThNK0NHbmdNOG4x?=
 =?utf-8?B?R29oRGt3NGhnSkxxR2VIOU5pY3oxQzlsaTRtYnNEN3k3L1RmZHRpQldJejhj?=
 =?utf-8?B?M3h2WnJJMXB4OVluZjNsUHUrdmZYbThIeDRUQnVqemIwZDNST2NhTzNoQ3li?=
 =?utf-8?B?VlZ4T0VBcE1vSjFMN0dSdUdmUTk0M3BxV3A4QVAwNER3cUd5QlExMU9aQWk5?=
 =?utf-8?B?aG0yQjZaOUJLOVhXbU5JVWowWkdWeHpMdGN3bFlxajJNT1RDNzdOWnVVejQ4?=
 =?utf-8?B?ZmZIQmRwZWxRK1pjRm5vc3pTb0tOWDJjT0k0SjA3QkFLOW1EMGY5TVU2WXlv?=
 =?utf-8?B?L05TT0RMMk02ZjF5T1JvSVJJL0FZUHlDdERpRFhKV0lxZkdndFpaaE9yR1Zl?=
 =?utf-8?B?ZjBsbll1WnZSWUpsdUlnejY3c1Z3c0syblJiem5oeW93V0VOS21aR1J5YjdQ?=
 =?utf-8?B?dnM1RkhveWpqM09yTUE2MTU2dGVvQnR4aWwxS1lGc2oyQXJYRGlOS3dKM2Rr?=
 =?utf-8?B?bDNjM3M2QXRMdkNNRkJwK2xPaUhGUWRiclhGL2xaYmUvVUNtRjgwQTFUNitv?=
 =?utf-8?B?cnRqalh1cG5DcVhidnlXL3hJdjhhdWJPbmdLMVNVTllYaHBLcDdDVmxtUFNu?=
 =?utf-8?B?QTVKZm92OEg0WllsbTc4NXg4djlzdTdjZ2xPMXVXY1NSajJzaisxcGVRK0ww?=
 =?utf-8?B?TFdiUXMwWkNLYkJuc1ZqUnNhaFZsRzlPM0t2cndKRFFMYWhZWWZDS3daNlZs?=
 =?utf-8?B?NEZOUG9oc3RwVnBCakpLMDY1Y0ZWdm1UcTQwTndObHRaR3YxTTJJYVFSdEVF?=
 =?utf-8?B?dWx0TkNtTHE4YndpeTNub1FuMGg5azhPZmdndHNoUGs0S1BiODdsNWxIeSt3?=
 =?utf-8?B?U0l4QmhVTVRWQ1FybHZUK2RyWExWUENSNjBtK0E0L01nazRxUUZBQ1ozOHBr?=
 =?utf-8?B?RWZjaitoMDNsNzBVS0ZjbTQwUlFTb0JBV2dtaDFnZGxPbExiZXJVbldkYXF5?=
 =?utf-8?B?NkdjNVcxZGRxa3JEbjFIYVd1Ym5BS3ZXYTFFR3lVMm43dU1GY2pNKzR1d0hp?=
 =?utf-8?B?ZUVlem41Q0FXR3pQMlM3MWZSTTNYWGFYV2g3YmhXQkRwWTZ4NGVySzFBbk1E?=
 =?utf-8?Q?rAhuooFMw1r35464=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88730fae-17c1-41a7-b13a-08de7427ec96
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 04:39:55.7396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYxBESXQvXB/Csw8fx85aCcoEErNCYpshGcAvDjgAkc3+Cjj7LvwWXjo/r1SLqkLonPR9pe5I5Os4MCz4r6z3Q6OGnmzBUcOZyqgt+i2e1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA0MiBTYWx0ZWRfX7ZIgvWjVGIGr
 C6FFaj3nwJ8T55VKjELMzETw7T8XWg3+sMHnPwv1ozpi2E3exeCFur5xFtRq3otgHwCH9RkPoqY
 5C0l5EIOldqqgzSm6KY87BVfeNY3sUX5Z+TMu2WeaMFo50JxUEN/BCCfB0Oke3RhDOShnKWVF/Y
 l3HS9QMRP3tSy4HzEz2mRIJ8RMM86EOarblXi2z2Y08YV12SP5US4A6V7gsKTtayQbCawDjMqSk
 FUNdsQwG+3HDjuLipz9GzwSEJLfYxDXt9NQ4GDEJtqgcQTXXdLHpnmiEg6+WRxUo2zrngqO6t6A
 bs5xelggc5eBLJulHbNUBp6HjjCLd4DVfR+d1DTKdEzpXW9q+npiM1uw12DoFWlT8TI/VBerYXJ
 QAOOOVTW/8NbT5HXRTrIy4vgT3sG7uD7B9lsezTDzjdlu+IaT2pQVE9pttqbp/5GNtqhpB3V4AJ
 ANPYxHuotYLiJXdfyHA==
X-Authority-Analysis: v=2.4 cv=SNNPlevH c=1 sm=1 tr=0 ts=699e7d1e cx=c_pps
 a=Fekr5IJHOwr6cQga7yOItg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=J-hHrZbvAAAA:8
 a=aUhp3X_kVLx4LXVIkX4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bPRBTIHFs0NZ5ul0a9uo:22
X-Proofpoint-ORIG-GUID: 08BaV3zKOM5RvZ1LQuEWmqklYxHjb4FN
X-Proofpoint-GUID: -y7RRmNQx8chrO6RlZZrkowf1f0zPB7J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250042
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61P4K1qm1410555
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 04:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231926

Hi,=C2=A0 Mathieu

I see V1 is on master-next-tests.=C2=A0=C2=A0Just a kind remind that ther=
e is a=C2=A0=20
V2 for this patch.

Regards

Changqing

On 2/25/26 11:40, Changqing Li via lists.openembedded.org wrote:
> License-Update: Update COPYING with latest from FSF
>
> * Upstream changed the dependency, libyaml changed to libfyaml, refer [=
1]
> * Upstream enable bash-completion by default, but bash-completion is in
>    ASSUME_PROVIDE, on host without bash-completion, appstream-native wi=
ll
>    configure failed, so disable bash-completion for appstream-native
>
> [1] https://github.com/ximion/appstream/commit/2899271049c0c9716eba0ccd=
62b10cdb9df5746d#diff-35104d8113cb43cdd6cfaa78c780eba89165e17c580d1e6678e=
5c3dfbd9b23c5
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../appstream/0002-Do-not-build-qt-tests.patch    | 15 +++++++++-----=
-
>   .../{appstream_1.0.6.bb =3D> appstream_1.1.2.bb}    | 10 ++++++----
>   2 files changed, 15 insertions(+), 10 deletions(-)
>   rename meta/recipes-support/appstream/{appstream_1.0.6.bb =3D> appstr=
eam_1.1.2.bb} (82%)
>
> diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build=
-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-bu=
ild-qt-tests.patch
> index cf26013019..f6bbdd180a 100644
> --- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tes=
ts.patch
> +++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tes=
ts.patch
> @@ -1,4 +1,4 @@
> -From eafac7178683c9fe5ab50192dec004f24638b2f4 Mon Sep 17 00:00:00 2001
> +From 5763a61ca9aff2e2383c1eeb1ef3f5e6cd07c539 Mon Sep 17 00:00:00 2001
>   From: Marc Ferland <marc.ferland@sonatest.com>
>   Date: Fri, 26 Jul 2024 15:41:00 -0400
>   Subject: [PATCH] Do not build qt/tests
> @@ -23,12 +23,15 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.=
com>
>    1 file changed, 2 deletions(-)
>  =20
>   diff --git a/qt/meson.build b/qt/meson.build
> -index 7d9ed7d..e319425 100644
> +index 407a57a..840c838 100644
>   --- a/qt/meson.build
>   +++ b/qt/meson.build
> -@@ -150,5 +150,3 @@ install_data (
> -
> - # end of Qt version loop
> - endforeach
> +@@ -130,5 +130,3 @@ install_data (
> +     join_paths(meson.current_build_dir(), 'AppStreamQtConfigVersion.c=
make'),
> +     install_dir: join_paths(get_option('libdir'), 'cmake', 'AppStream=
Qt')
> + )
>   -
>   -subdir('tests/')
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/appstream/appstream_1.0.6.bb b/meta/r=
ecipes-support/appstream/appstream_1.1.2.bb
> similarity index 82%
> rename from meta/recipes-support/appstream/appstream_1.0.6.bb
> rename to meta/recipes-support/appstream/appstream_1.1.2.bb
> index 62761380f5..c6ec0fff0a 100644
> --- a/meta/recipes-support/appstream/appstream_1.0.6.bb
> +++ b/meta/recipes-support/appstream/appstream_1.1.2.bb
> @@ -1,7 +1,7 @@
>   SUMMARY =3D "AppStream is a collaborative effort for making machine-r=
eadable software metadata easily available."
>   HOMEPAGE =3D "https://github.com/ximion/appstream"
>   LICENSE =3D "LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D435ed639f84d4585d93824e7da3=
d85da"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5e=
0ae21"
>  =20
>   DEPENDS =3D " \
>       appstream-native \
> @@ -10,7 +10,7 @@ DEPENDS =3D " \
>       docbook-xml-dtd4-native \
>       gperf-native \
>       glib-2.0 \
> -    libyaml \
> +    libfyaml \
>       libxml2 \
>       libxmlb \
>       libxslt-native \
> @@ -19,7 +19,7 @@ DEPENDS =3D " \
>       python3-pygments-native \
>   "
>  =20
> -inherit meson gobject-introspection gettext gi-docgen pkgconfig vala
> +inherit meson gobject-introspection gettext gi-docgen pkgconfig vala b=
ash-completion
>  =20
>   GIR_MESON_OPTION =3D "gir"
>   GIDOCGEN_MESON_OPTION =3D "apidocs"
> @@ -30,15 +30,17 @@ SRC_URI =3D " \
>   	file://0002-Do-not-build-qt-tests.patch \
>   	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.pat=
ch \
>   "
> -SRC_URI[sha256sum] =3D "db4439db6a33de3ca1041473501610844ddf1b72ae2301=
6c05242c681c380b4d"
> +SRC_URI[sha256sum] =3D "46b4257100e25a6468ceed7b3ab82441f47b119da3398d=
30aea6d7b91174b586"
>  =20
>   S =3D "${UNPACKDIR}/AppStream-${PV}"
>  =20
>   PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', =
d)}"
> +PACKAGECONFIG:append:class-target =3D " bash-completion"
>  =20
>   PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,system=
d"
>   PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemming=3Dfalse,lib=
stemmer"
>   PACKAGECONFIG[qt6] =3D "-Dqt=3Dtrue,-Dqt=3Dfalse,qtbase"
> +PACKAGECONFIG[bash-completion] =3D "-Dbash-completion=3Dtrue,-Dbash-co=
mpletion=3Dfalse"
>  =20
>   FILES:${PN} +=3D "${datadir}"
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231925): https://lists.openembedded.org/g/openembed=
ded-core/message/231925
> Mute This Topic: https://lists.openembedded.org/mt/117989519/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

