Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433EBC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 13:53:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.84323.1657029204229940181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KmheNg4q;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4185742758=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 265DaoDc012817
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Jul 2022 06:53:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=rVPP95kgozWKzDh2yLdABFn6ATHpRZUmThjGqdR6H7Q=;
 b=KmheNg4qA50FOz9cbBDbgLWWqr0eGv5/Zi5r5mbNtBicSX/n/3q5/czOfAV+id8CvGhL
 KjpHksqCkX3ffIVRinr6g/l3SCDP/OiAqzGxnrpWhOj5zi3TP4chXHZNVXIViYs+d6qo
 gy2wT8gItTKDENNDmY2IRE/tuuqhEIlAJZLCo56zw/3zaPGjl37yfCbZitNlwX9yz2ON
 abuUW+1D+mJkqfJeguZ/DJU9OAVLouDm7s5/iR0C10Nq5ZM0vL4CEq1vyPYlziKnzPJ5
 wy/nmBGI8dbkkwpwmyYCuRuFDqH0MIiC1aKvP/I786ZV7fSquvsZO0R22XHbO85npbq/ Yw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h2ha4j1y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:53:23 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 265DrNUv018090
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Jul 2022 06:53:23 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h2ha4j1xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Jul 2022 06:53:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rd0D2QNP+LFal3vGN7adGMnVxL44jF4K8GrTUvjHFlSioQiosea18L6O2WyiWV6XKJzLs9QAsqoRNn3NTwmqXfGan2b7MqlDQCH4DUATIANjKKjQPLVyLkC+xWE9mCa/ZB23yZKeg2/GNbnrOOxpCRIc/NqBDN8FJZ3OY5XCtxQzQW9MTb21AZSkgY3mJx5ToEG7CvXPVrhWf9QTjcrzu3VwUjCA2C9A6IXjpPeT3wH1irSK1E6F92U8zFzR7vrojXCZiawJprPq6HLtpjVITo68sZkKw9D44Ba+0QaY8RmdXG5DbfRiljETqh6swIVIyREkR0lvvT//e4Yf8tzorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVPP95kgozWKzDh2yLdABFn6ATHpRZUmThjGqdR6H7Q=;
 b=WHib79mzJ/+5D5zoeBj/MApeeutA42KKhD+yFun93tCnTexTDVPhXwEW0CG4k4jSnpMVtveCP0UsyOfY48HoUMGa+WrPz/CPlxRb62FS+MN6hEkHdoqWdEp2ufP+Rr6A6qOwnGbuHrBRIQPWZbtbPBr1aTkbkbGavcGUlY1fXPdrZvk3nMfHr9vMNbTCQjAvpobAgXU2SRcmW3UjUs26xKbOHUQ52vVbs6CDUfrlPy4XQBHCVeMyGuA4UQHpHpbUQ1VwfR4lCiUnqK4G9L93v/MuQ9OX/M5zhdgVV7sWyvPInKL0DA8ELARUIBuKKcH6151fmhOrq/45XYKwkE/pfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BN6PR1101MB2321.namprd11.prod.outlook.com (2603:10b6:404:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 13:53:20 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d84b:7432:aca3:bbff]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d84b:7432:aca3:bbff%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 13:53:20 +0000
Message-ID: <73cb5723-9cf2-579f-1b8e-1386e6fb1382@windriver.com>
Date: Tue, 5 Jul 2022 09:53:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [kirkstone] Glibc: Glibc-2.35 Stable release updated
 with latest commits
Content-Language: en-CA
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com
References: <20220705040139.165670-1-sundeep.kokkonda@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220705040139.165670-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::7) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34117238-e834-4b0f-b82d-08da5e8db83d
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2321:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b09HdWlLR2puMi9uNzMvdHBDTGV2QzRQampHR01tR2M1RWJ0cm51bGF5Q0pF?=
 =?utf-8?B?bmU5bkVweTVQVjZ5ZDZRMlBGeWp5T25KRDE1d3lGdDdYN2VaTFZWM09jR09m?=
 =?utf-8?B?UjJFNlltOVFSdm91MC9NQ3NjdkdncWFwMVlJY3p4S3MrTm43Y3hLeVNOdGZH?=
 =?utf-8?B?OUx1aDk0RFFQRmszbmVzTjJqUTJEeU1TZXZ6cGlOU1ViVGJoMnJyYkt6RmY5?=
 =?utf-8?B?L0tjckNTUXdQSkx3aGxzNVg0am1CVDNUUXZaVi82Z3p6aElGbHcxUnQwcDdH?=
 =?utf-8?B?Yy9WUHVSRldZaGYwWUlEa0phVURRNm1EZklaTzJKTVAwNGwrOGMvNHUyRG01?=
 =?utf-8?B?TXRDaCt5ckJRMHBOc3RnTklHV3IxT0h4RTdPQzUvNTRyY3RVY1N5Qnl6Skov?=
 =?utf-8?B?WW1VNjljV2tRZU95SFVvbjZscnhiUEVkaW9kZmlYTEJXM3h4bGMzUmFRTnFY?=
 =?utf-8?B?SzNxMjRRTU9qYXZCOWpnZ3FHZHVQQWhXZloweEJFSjROV09lVVU0ektERzVY?=
 =?utf-8?B?SmZ5elJUN0dWRXpncEtYMFBrZXI1T3J1SkY2VHVPbjk1VnFhdk14VkZWanJ2?=
 =?utf-8?B?V2V4SWpiTW1RWGZBRDk4UngxSGdjbE1vRHV5bnFtQlQydUVwOFFITUNneVdM?=
 =?utf-8?B?L1NwZzVHTVVYRUwxNzRqWkc2b2NadnM4R0J4dUNBSFI0ZTMvZ1MvZWhZU0hH?=
 =?utf-8?B?ekYva0l2dTNQLzdEQW43MVNOd0V6OHdRblFnYkphbFZER1BaTkRtcW1iT1g3?=
 =?utf-8?B?NjBJRVA0NmV5SlhLVWkzemU4MERYMVp0NmJFYldmL3NRc2IrWm1wMkNVNHBr?=
 =?utf-8?B?V0tUMld3eUVlRTh2T2VudGdTeDAzV2VDbUNjZERKMC9GZGovVGhjM01ScTQx?=
 =?utf-8?B?ZURVeGxVV1hoemhwcUtKRWs5SVptbElRblZGUW1PWnNPNDM3NldVOHhHRVlC?=
 =?utf-8?B?dkRXdUlhMXZQNWZ6K1lWU09XenNqMG54ZFpqYkFUZ2JkZitOWXdBaXhGdzN0?=
 =?utf-8?B?ZjZhODhwS0hhYy9vMzY3dE9lNFF1UXJGYUNaN2g2VUhyeU11V0VkWWd3MldX?=
 =?utf-8?B?cnBTWHMrS0JJM2RLNVl6aFc1L0ZWa0t6MHBwTkI4YjFSWnY0ZG4yNUgyZ3Nr?=
 =?utf-8?B?OS9mY2dkOTh0KzZDWm1UbStCUno0WlpZa1Q1S0JzS0crQTBXckxvMHMzbWxU?=
 =?utf-8?B?SXZEYkpCN0RLRjBaNE1QY1NOSTFsQ09uSHJ5NlBmRjV0RENXTHJxUE5WVEdq?=
 =?utf-8?B?NjkyOE9RQ2ZUTkNkK3FYaENxb0xTOElGWFNrVmI1NHVaUXVJdW1uRXl0N25h?=
 =?utf-8?Q?1/Opu92RGRmdQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39850400004)(366004)(396003)(376002)(15650500001)(6512007)(26005)(38350700002)(6506007)(38100700002)(66556008)(66476007)(4326008)(8676002)(41300700001)(66946007)(6666004)(53546011)(52116002)(2906002)(5660300002)(6486002)(83380400001)(966005)(8936002)(31696002)(86362001)(478600001)(31686004)(316002)(2616005)(186003)(36756003)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2JFckdHckxzSHVzeHdsQjJZOCtPYU0rb1VRUVlKSW9vcS9JTVRJZFFKNGh3?=
 =?utf-8?B?M042UFk1a2RzOVpiVTRpQUNOUU5VNVhHSFJOL2ZUeS9hZ0E0clJJeUR1bWM4?=
 =?utf-8?B?Tyt3TXBaQzE4Qm95T3o4N29jZTB1SUg5VXpXQjg1akdrQjRpL2txL2dTQTBX?=
 =?utf-8?B?bDRlcjBCdW9qcUU2Y1pVMEpGT3JLNk15cXdUV29ndndaY21jblFwd09aRzhD?=
 =?utf-8?B?UjdpVXZJNWUvZVJGQktOVk5qS00yaUM3MVU2RlFQeDJ0b3B4aDhBU3BrQVEz?=
 =?utf-8?B?bGdVM1Z3Vk83SlpFRklDV2ZFTUR2Q2UwTThRTHFKaUNpS1dZVy96SGFvR3hP?=
 =?utf-8?B?czNiTzg1T0Jvb2Q2cStZeHVXRHo3YkNEakNVZGFwTkl4amRLYno3a0ExTGpC?=
 =?utf-8?B?REZwV2VkeVlGQXRQQ0p1b25vbGJYMUxYZGpLYXBuRnNFS2pPTW91WWREd2hK?=
 =?utf-8?B?UVB3Q3dveCtZMkFiaEh0U2VYbU81N2F5Rkt3WTMxRWRqRjZYemIxdWMxME5y?=
 =?utf-8?B?cHBIUXg1RklHLzdNczFxSXhwU3V5a1h1TmNwcy9FQnEyZFc0NUtuNUpMTlBO?=
 =?utf-8?B?NzJxWWtGMUs1aC9kWUwwaFVFendvazNsc0Mxd240N3pnTXJZMW9NR1pNenFs?=
 =?utf-8?B?dTZzMjJUckhXamE1bVE4Q1dsRFJ1ZDFxWVpjZHBWMjV3d2pNSC9nOXY2ekZJ?=
 =?utf-8?B?QjZDdmtvQkVoNjZEYU5IZXNzYU16RzRTZE1OdnpZV1BaM0lGbTVPc1ArdWJU?=
 =?utf-8?B?ZW1XZUQzSldPckM4Njl3ZlBaaTVMVzk2SXBnb01aV0Y5OXF0Z25VV1hKZklx?=
 =?utf-8?B?ZkhJSDFVd1dzOXNBTWJCNVQxaTdQeXlnM1hHZUI0TER1Y1BNa0hjVTRYbmw4?=
 =?utf-8?B?emxGSXNjbjRCcUtDcTd4dFk0K2JjdUJJUnA5MERPRWJQWGduQ1RHeXd4MFB5?=
 =?utf-8?B?NktBYnp0TTh1cGlsaFc0VXVONHh1eGM1azZieWNkeGFldklQcGtRdHJOQ0pQ?=
 =?utf-8?B?TFE3VVR1dUtuWGhRVnAvYnNkR0NsNFRxSGhyK2ZpK2c1QkN2akRSQ3QySGtv?=
 =?utf-8?B?Z1VpbnJGYXBxZkVMcHRHQXFzcGpSOEdlME1tcWplZVpibmJ4MDcwTCtNdE01?=
 =?utf-8?B?WUJQL1djQnlkRkUrSVRnKzJrT1JMMWEvd3NyeTZndFRObVMyQk8xUnlibHQr?=
 =?utf-8?B?WUNBRG9wQ1MvaWVlUzNra0JaZE05OUt5UEt1RUxnREg3dXpTd00rOWZhTXZB?=
 =?utf-8?B?OGFremRNSWdvNVFTdGlDVlVKeThQNVQ1RUQrWjQ0VGxxa0FHckNoK2dsdjFF?=
 =?utf-8?B?S0ZJS3NKOFVZT2pTZk9QUXhTRThoRjYrSk1seHBzZ3haVWtXSnBib3RJQnZ3?=
 =?utf-8?B?Si9pd3ZudTU3Z3Z5bEQzM3NDOGNIRDFNbkpnQ3RhamRnTnlVVE5acG13Z1NW?=
 =?utf-8?B?blhuUnh4bVBvakhGWFI0Z3hPQSthdys2aFlhNE00bmV2emdOUHhJbDF6L2ll?=
 =?utf-8?B?Ym9PRWd4Tm44aHd3a0VnUUVocE9SUTYxcWdSaVRGcmJoNTJqL05ldFBNOG5D?=
 =?utf-8?B?UUtBNVRCZHZqQzNEeXZGckFuY1FDV1lPaUhGcjhZUEhlb1BMYVdEM1I4bGk0?=
 =?utf-8?B?c3IwY0pCMWVRWjBpYmVhZXpPQ0RUKzBta2N3RGI1SzFxYUwwRWdRUTdEcHZK?=
 =?utf-8?B?ckJFdkJ3R0t1cXVaR3R3MW02b2oybW1kdExWSmlJMWxBRm80a1RBTjByS3I4?=
 =?utf-8?B?NWhGWmc4bElBNXVXeXBOK2dYU0UweWhObDd2SnRkeDUvbnVKRHRuckNuaExO?=
 =?utf-8?B?Z3FmMWQyRlYrdlI2MFZQSm85RzhwYUE0bURqUlUraVpyenp0VEhFZ3hVTnRr?=
 =?utf-8?B?K3hteGRhZnJGVERyOVVSUjNrRk1wZ2pybHR3KzJIdVFHS1M4cEJvaGp4cmdj?=
 =?utf-8?B?bEpzeHlYYUlrVHE3SXFBcVJwUzVWZDBPMk1TTUhNTXpFYWVPUHExR3FFZVdL?=
 =?utf-8?B?eEVjTWVoVjZtTURSZUl1SGRpWHhKME1manZjbGJFc0NIYS9xT3lEUmR0WFlm?=
 =?utf-8?B?L1U4TmdvOVZIQzBsQ1I0M04vYzJkSW1CUEF4Sy84RHcveCtRVjhDeFZvUFRv?=
 =?utf-8?B?UVI2TEg3UCtZaUdsTmwvb3Z6QjZ5NGd6MW9EQzEzMkhXUXNBbFYwN0lwZ21v?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34117238-e834-4b0f-b82d-08da5e8db83d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:53:20.2361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aMEXglbXgBiEddZIyy+Lmm1wlFjLOCphWF0fCvoWC+Q+U82hrFDumvB8OHs9jJbk1RRGRZnQm9JYH7w3q4cKI4hPfrChi7GTEuQu+MTj5ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2321
X-Proofpoint-ORIG-GUID: 4GRD26ixTg6zL6bt9luvCPkFMIMaNx8D
X-Proofpoint-GUID: o5E1isUFVnYBnvVH4Qpo9GQP635D8nHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_10,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 13:53:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167657


Same comment about CapiTaLiZation ;-) and word repetition in the short 
log so:

Glibc: Glibc-2.35 Stable release updated with latest commits

should be something like:

glibc: Stable 2.35 updates



On 2022-07-05 00:01, Sundeep KOKKONDA wrote:
> Below commits on Glibc-2.35 development branch are updated.
>
> glibc:
> b6aade18a7 nss: handle stat failure in check_reload_and_get (BZ #28752)
> ccac2d6d95 nss: add assert to DB_LOOKUP_FCT (BZ #28752)
> 9d8ae95604 nios2: Remove _dl_skip_args usage (BZ# 29187)
> 8468be8433 hppa: Remove _dl_skip_args usage (BZ# 29165)
> 99978cd42c NEWS: Add a bug fix entry for BZ #29225
> 97dd8b3f70 nptl: Fix __libc_cleanup_pop_restore asynchronous restore (BZ#29214)
> 0a1572b8bb powerpc: Fix VSX register number on __strncpy_power9 [BZ #29197]
> fe9ca732ac socket: Fix mistyped define statement in socket/sys/socket.h (BZ #29225)
> d7d1eebd4d iconv: Use 64 bit stat for gconv_parseconfdir (BZ# 29213)
> c5a75ecec8 catgets: Use 64 bit stat for __open_catalog (BZ# 29211)
> e429695805 inet: Use 64 bit stat for ruserpass (BZ# 29210)
> 6ea3c0aba4 socket: Use 64 bit stat for isfdtype (BZ# 29209)
> 9bcf5b12f8 posix: Use 64 bit stat for fpathconf (_PC_ASYNC_IO) (BZ# 29208)
> 45e5d0f533 posix: Use 64 bit stat for posix_fallocate fallback (BZ# 29207)
> 37c94dc999 misc: Use 64 bit stat for getusershell (BZ# 29204)
> cb49c14183 misc: Use 64 bit stat for daemon (BZ# 29203)
> 6abb4002df Fix deadlock when pthread_atfork handler calls pthread_atfork or dlclose
> ac87df8d75 x86: Fallback {str|wcs}cmp RTM in the ncmp overflow case [BZ #29127]
> 478cd506ea string.h: fix __fortified_attr_access macro call [BZ #29162]
> 2b128a7d30 linux: Add a getauxval test [BZ #23293]
> f5f7144dfc rtld: Use generic argv adjustment in ld.so [BZ #23293]
> 04892c543e S390: Enable static PIE
> 72d9dcfd16 csu: Implement and use _dl_early_allocate during static startup
> b5ddf33c6e Linux: Introduce __brk_call for invoking the brk system call
> 2d05ba7f8e Linux: Implement a useful version of _startup_fatal
> 55ee3afa0d ia64: Always define IA64_USE_NEW_STUB as a flag macro
> d66cca3fbb Linux: Define MMAP_CALL_INTERNAL
> a7b122a7b4 i386: Honor I386_USE_SYSENTER for 6-argument Linux system calls
> d1772c9376 i386: Remove OPTIMIZE_FOR_GCC_5 from Linux libc-do-syscall.S
> 58bb3aeaae elf: Remove __libc_init_secure
> 0a5c6c9d99 Linux: Consolidate auxiliary vector parsing (redo)
> 76304dfdaf Linux: Include <dl-auxv.h> in dl-sysdep.c only for SHARED
> 788eb21ff0 Revert "Linux: Consolidate auxiliary vector parsing"
> 150039ff07 Linux: Consolidate auxiliary vector parsing
> 3948c6ca89 Linux: Assume that NEED_DL_SYSINFO_DSO is always defined
> 29f833f5ab Linux: Remove DL_FIND_ARG_COMPONENTS
> 1695c5e0f6 Linux: Remove HAVE_AUX_SECURE, HAVE_AUX_XID, HAVE_AUX_PAGESIZE
> 756d583c9e elf: Merge dl-sysdep.c into the Linux version
> 2c4fc8e5ca x86: Optimize {str|wcs}rchr-evex
> fdbc8439ac x86: Optimize {str|wcs}rchr-avx2
> b05c0c8b28 x86: Optimize {str|wcs}rchr-sse2
> bc35e22be4 x86-64: Fix SSE2 memcmp and SSSE3 memmove for x32
> 4d1841deb7 x86: Fix missing __wmemcmp def for disable-multiarch build
> cee9939f67 x86: Cleanup page cross code in memcmp-avx2-movbe.S
> 0909286ffa x86: Remove memcmp-sse4.S
> 5a8df6485c x86: Optimize memcmp SSE2 in memcmp.S
> af0865571a x86: Small improvements for wcslen
> 3b710e32d8 x86: Remove AVX str{n}casecmp
> fc5d42bf82 x86: Add EVEX optimized str{n}casecmp
> 33fcf8344f x86: Add AVX2 optimized str{n}casecmp
> 3496d64d69 x86: Optimize str{n}casecmp TOLOWER logic in strcmp-sse42.S
> 283982b362 x86: Optimize str{n}casecmp TOLOWER logic in strcmp.S
> 420cd6f155 x86: Remove strspn-sse2.S and use the generic implementation
> 4b61d76521 x86: Remove strpbrk-sse2.S and use the generic implementation
> 2fef1961a7 x86: Remove strcspn-sse2.S and use the generic implementation
> 1ed2813eb1 x86: Optimize strspn in strspn-c.c
> 3214c878f2 x86: Optimize strcspn and strpbrk in strcspn-c.c
> ff9772ac19 x86: Code cleanup in strchr-evex and comment justifying branch
> 424bbd4d25 x86: Code cleanup in strchr-avx2 and comment justifying branch
> 0a10b8b181 x86_64: Remove bcopy optimizations
> f0a53588da x86-64: Define __memcmpeq in ld.so
> a133623048 x86-64: Remove bzero weak alias in SS2 memset
> 18baf86f51 x86_64/multiarch: Sort sysdep_routines and put one entry per line
> d422197a69 x86: Improve L to support L(XXX_SYMBOL (YYY, ZZZ))
> 58947e1fa5 fortify: Ensure that __glibc_fortify condition is a constant [BZ #29141]
> 28ea43f8d6 dlfcn: Implement the RTLD_DI_PHDR request type for dlinfo
> 78f82ab4ef manual: Document the dlinfo function
> bbb017a2bb NEWS: Add a bug fix entry for BZ #29109
> 5c0d94d780 linux: Fix posix_spawn return code if clone fails (BZ#29109)
> 059e36d9ed x86: Fix fallback for wcsncmp_avx2 in strcmp-avx2.S [BZ #28896]
> 676f7bcf11 x86: Fix bug in strncmp-evex and strncmp-avx2 [BZ #28895]
> c394d7e11a x86: Set .text section in memset-vec-unaligned-erms
> de0cd691b2 x86-64: Optimize bzero
> 0bf9c8b5fe x86: Remove SSSE3 instruction for broadcast in memset.S (SSE2 Only)
> 58596411ad x86: Improve vec generation in memset-vec-unaligned-erms.S
> 36766c02af x86-64: Fix strcmp-evex.S
> 250e277797 x86-64: Fix strcmp-avx2.S
> 34ef810945 x86: Optimize strcmp-evex.S
> b68e782f8e x86: Optimize strcmp-avx2.S
> ec5b79aac7 manual: Clarify that abbreviations of long options are allowed
> 0bcba53020 Add HWCAP2_AFP, HWCAP2_RPRES from Linux 5.17 to AArch64 bits/hwcap.h
> 95759abbf3 Add SOL_MPTCP, SOL_MCTP from Linux 5.16 to bits/socket.h
> eed29011f9 Update kernel version to 5.17 in tst-mman-consts.py
> e72c363a15 Update kernel version to 5.16 in tst-mman-consts.py
> edc06fdd62 Update syscall lists for Linux 5.17
> dde291ab53 posix/glob.c: update from gnulib
> 7d96aa2d7d linux: Fix fchmodat with AT_SYMLINK_NOFOLLOW for 64 bit time_t (BZ#29097)
> 14b1e32a4d i386: Regenerate ulps
> ef87599348 linux: Fix missing internal 64 bit time_t stat usage
> 10fe3cd309 elf: Fix DFS sorting algorithm for LD_TRACE_LOADED_OBJECTS with missing libraries (BZ #28868)
> cb4d670d8f scripts/glibcelf.py: Mark as UNSUPPORTED on Python 3.5 and earlier
> 106b7e0e45 dlfcn: Do not use rtld_active () to determine ld.so state (bug 29078)
> e5cf8ccca6 INSTALL: Rephrase -with-default-link documentation
> c8ee1c85c0 misc: Fix rare fortify crash on wchar funcs. [BZ 29030]
> 499a601796 Default to --with-default-link=no (bug 25812)
> 70f1eecdc1 scripts: Add glibcelf.py module
> d3feff2232 m68k: Handle fewer relocations for RTLD_BOOTSTRAP (#BZ29071)
> 68d3a9a696 nptl: Fix pthread_cancel cancelhandling atomic operations
> 8e8d46d598 mips: Fix mips64n32 64 bit time_t stat support (BZ#29069)
> bd415684df hurd: Fix arbitrary error code
> ba9c42ac0e nptl: Handle spurious EINTR when thread cancellation is disabled (BZ#29029)
> 6583d53445 S390: Add new s390 platform z16.
> cc9a4a664f elf: Fix memory leak in _dl_find_object_update (bug 29062)
> db03235895 NEWS: Move PLT tracking slowdown to glibc 2.35.
> 9be62976af hppa: Use END instead of PSEUDO_END in swapcontext.S
> 01d5214bb4 hppa: Implement swapcontext in assembler (bug 28960)
> 123bd1ec66 nss: Protect against errno changes in function lookup (bug 28953)
> c54c5cd8e3 nss: Do not mention NSS test modules in <gnu/lib-names.h>
> 3149f47b80 io: Add fsync call in tst-stat
> e30c1c73da nptl: Fix cleanups for stack grows up [BZ# 28899]
> ca0570fee3 hppa: Fix warnings from _dl_lookup_address
> d82d9cdff4 hppa: Revise gettext trampoline design
> 2631d3b3a6 hppa: Fix swapcontext
> 1f77081178 Fix elf/tst-audit2 on hppa
> c60e6a458b hppa: Fix bind-now audit (BZ #28857)
> 90797f4972 localedef: Handle symbolic links when generating locale-archive
> 732dd3a63d localedata: Do not generate output if warnings were present.
> 3feecd8001 localedef: Update LC_MONETARY handling (Bug 28845)
> a787325e83 NEWS: Add a bug fix entry for BZ #28688
> 264ad5d7d6 resolv: Fix tst-resolv tests for 2.35 ABIs and later
> e247a3b118 elf: Replace tst-audit24bmod2.so with tst-audit24bmod2
> 1dd783fafd elf: Check invalid hole in PT_LOAD segments [BZ #28838]
> 3226ffde07 NEWS: Add a bug fix entry for BZ #28896
> 676f85759c x86: Fix TEST_NAME to make it a string in tst-strncmp-rtm.c
> d001088e22 x86: Test wcscmp RTM in the wcsncmp overflow case [BZ #28896]
> fd412fff6d x86: Fallback {str|wcs}cmp RTM in the ncmp overflow case [BZ #28896]
> a30807b7db string: Add a testcase for wcsncmp with SIZE_MAX [BZ #28755]
> f055faf801 linux: Use socket-constants-time64.h on tst-socket-timestamp-compat
> 491f2ef1f0 linux: fix accuracy of get_nprocs and get_nprocs_conf [BZ #28865]

Lots of bug fixes, optimizations, etc.

Do you have regression tests results or are you running them now?

../Randy


>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>


Please use your Wind River email address for the SOB.

Thanks,

../Randy


> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 080e905b6e..99017ce1d4 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?= "release/2.35/master"
>   PV = "2.35"
> -SRCREV_glibc ?= "24962427071fa532c3c48c918e9d64d719cc8a6c"
> +SRCREV_glibc ?= "b6aade18a7e5719c942aa2da6cf3157aca993fa4"
>   SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
>   
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167635): https://lists.openembedded.org/g/openembedded-core/message/167635
> Mute This Topic: https://lists.openembedded.org/mt/92179092/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux


