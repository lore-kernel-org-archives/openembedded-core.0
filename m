Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5B1C74A5B
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 02:36:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33964.1679452601722464506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 19:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=GIGY49zB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2445593400=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M1xZRx002380
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=o1ng+cR987LWHEiSp9kRcw7cfutedyQi8Pf8URPcVd8=;
 b=GIGY49zBseRRTGoduhZgxDCzJA/6G6qPC47h2//ykQitxbwn27/g2UcpuxXfwGDRhCpq
 LWACcL/lw0gqBLKimJEdIl40Hh5yzy5atEF6xiUeH9BebtZkgkFzS8CQI0nhKM5B8qBz
 PBX3SE36bMl7PJarOGbZ7b/vJ/NUyA4g3eByMcGfN5gu5eSWdwr2XUVc5EXpGlrtn1GK
 6ELtanW9/hBq7saapLZ50fcDTtm71CeQ95+zinpq0+w4Tda720EMigduAnvP2b/E4nd2
 y+P/7sJw0+i7v32QtV3cuTCo25Ek7iJhuNSp4CQy5OZgjK5VDK099PJQLqXK1m5RllHO pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqu4g20r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:36:40 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32M2aeL0020014
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:36:40 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqu4g20q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 02:36:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSwGnpAPClpNzvQ47BSqx1ZXU2ysfl7XIg4GglprN5mEtEnmtxr4L/aOiuKtR9cuF/dSGIzdhhUQhqMux1VR8fhZwjeKVhHhY9FL7wARwVBhph0c0Dey+6Dhdl7nLANmXAvulgBJYCwTlI96YY/zRG5E2w8giTRWrieLF9hQ+gCk7kpRkCZ635pKP9PLYR7Vg2wG6w+j8wnR7x8CYD5n+QnQBTprs0SNRHDTNfYHM7Jj3WqZ6pwWJX3bcouT5zTTfqGIryrpIRbpSnOm2xwdNyeYu6K7tixvmQwJ94U7blEfUKxEdIv5CMyarU5sMykG5U8YMg1CkcwfAwYxTHX0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1ng+cR987LWHEiSp9kRcw7cfutedyQi8Pf8URPcVd8=;
 b=UWUC2bF7CGc0kS4TSMljsuAl94ctvOfpfCi0aVJ5FLQMY99DJ2f6zMTLGttGsxR+UPJzHisH/DyGRxv6yEXRlSt8Rfgt5dh2d8+iO0cHkgLYOPVqZKfBI6Q0gE2JoSMaE0pxeV2mfalniduAoFa7cqnUQmVjOQHdtCEhaL3JlNepNCLCC3pk1KfIOzTXy4jMx3E9Uo+Ux2C+MD6TQA6tK47/ftMwRuoB0VE+N4tuJkJYzVgCTr2T5iUseTqoAAweC5i6WoQu5iLkitraZfzlM8f30FizUK2ljL90UWP9zjCOoHkRSqA0v9XHCm44fHLEN7obUN+wzva8/CHQAZOaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 02:36:35 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 02:36:35 +0000
Message-ID: <716304e9-4eeb-d8ef-c831-93d84b2ca658@windriver.com>
Date: Wed, 22 Mar 2023 10:36:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core][PATCH 1/2] debugedit: add recipe
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20230321154016.34836-1-Qi.Chen@windriver.com>
 <BEEE1608-0309-4213-ADB0-7FC39A1F61F8@arm.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <BEEE1608-0309-4213-ADB0-7FC39A1F61F8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: a5512434-db9d-42cc-c00a-08db2a7e40f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ScIyBzhE/L7NfPRotjhGNq7U10VWOHQee3+1wfwual3wAnQw9MHExDgJP1z4KG5Jy1Q5BB2PGR5kcsDS9nZ1pZtha7pbd35pEk7xxDO8envjtlORi5Tis/2bOV60YzZqqdsmo58vDINPMJRmbf/3GE1u3+RuGeTvHywuZGl8eXOWpiKWqkY64SZJ/OEV9PRvWhTIDcRsy+IvD8WCf8OAFI0lH871hQ0TcbdKGze1eTyUhJNAlznfy+MWMG/xYvf7LDAG9Z1wyr6IsJk86SGyANPNHdt9NS+9dq0Hrhe+ZxlgOQX6M9lEH6jxdINWYLezHhdk9JGlRllYdaDJi8jSJoJw5Bo2zhtTq7rR+WDNfGkmIDDKw+w/crXlUeuJhmOIPAFgyxf6IaJdSYrjyOt/LGoWR2YKCUlRM7rnMSw8IvvHNAEablVHT0sCMtz3Bqh5xT51n9QdcF4AZkv+11t3zQ16WTfmR8cCmq/DHjW2SKrAyTpWnL64FiSbRGTjzJD1XrCYckPnrlFWRZDG1SldzqaouYpBveWigvrGKbiCf3jICNMFY+I0qnJHD007iNbObQ/qQcj6b/18W0OD5EGWMGoxVL9Nfje0akHgivLHKmCLPA/9JO+NSw++D707I3aW71JEYKinIYnu1IaEdX26F2e8xJh15xJwyhOHj+72uL8ihXWZ2GMIHUjnojRICtQJssPCnSGe3a30GHRcOrhYGJXUMeWegV502EK6R9Yo0KBeahXvR6jZCt+cu9qgZiL2H+DA6CsxuwG5tXr0aMv2jA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199018)(31696002)(36756003)(86362001)(38100700002)(2906002)(41300700001)(66946007)(8676002)(6916009)(4326008)(66476007)(66556008)(5660300002)(8936002)(2616005)(186003)(53546011)(478600001)(316002)(6512007)(26005)(6666004)(6486002)(966005)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZmpxSnJuS2F2WnR0RSs5RWFNMWlidUtMUTBsdEdIQWxXL3dxNHdVZWRobGQ4?=
 =?utf-8?B?d1Qwc2o3YXJRY3JuZ3RLMmRsblZlREZnRWFicDBUaWdaU1NXNFNJUmw4NmdX?=
 =?utf-8?B?cDB0anBYTWdvS082a2hDelB1djBMV0kxSGlZa0Z1Y0MydU5jQllUWVBuSDg2?=
 =?utf-8?B?MGs3L3YyL1E0TjVkczQ2NWJlV1UrbldPOFJ4dHNHMnB3eUlaOW4xUmhEQjB2?=
 =?utf-8?B?TkFiS1RVekh0SGxpakVkOFBTcFFZNXlqWVl4RWIwY3pUVVRzRzBCWm05WUhX?=
 =?utf-8?B?aFFkOTcwa3VtenV2SG8xbmEwUWZlSERUUmlEMlpQend3M2Z0NmZUbjZ3Vk9V?=
 =?utf-8?B?bERDNWhYMUtHc2dnM09BQkRYa21GclBabjRFckJwL2lCc2o5ZFovZGFRSWtH?=
 =?utf-8?B?ZWJEUGtNQWtWMmI4Z3JXVU1kc3VOYVZNS3h5eHh6YlN4SCt1NEdHR2Jyc2Ey?=
 =?utf-8?B?c1NraFFTamFnUUtXVUFOWFh2Qk5uUFl2SmlmVGtvQmQ5cnViUSsyV2RDU1VT?=
 =?utf-8?B?YjRhZ0dJcktJNzBhOFYwdkFWN2ZSOGM3bmVvMVZjb2ZURklpcXZLNTMyN3hH?=
 =?utf-8?B?bHFmK3VkeHA0NWQzTjRablhpc0JuSklFMzcvb0hGWWZOWUdTMVBBeXV2OTNi?=
 =?utf-8?B?aTVmeHp2aUlnNGN0MTErdm1uQ2I3ME1BMHNPNXB4cmVPdEY4TFY2V2FSaE1V?=
 =?utf-8?B?NkR6aWhXZHlqU1VxdUwza1FGdnpVUmhYajVybWZQS0VRcHhUYUdsSC9zc25i?=
 =?utf-8?B?Q2pvQVpqSStYckVWNlI1bG9yVkdpL2t5UlhodXpBQUZWeVQ3bGtGZ3R4Qkkr?=
 =?utf-8?B?K3NmL3F6RlYvVU8rMXlwenJkS3Y3MWw4L0FVNEZxdE1kdC96Vk1mdi8zSHlP?=
 =?utf-8?B?d3FmdjdiU1JmU1FMNlVpZTZUOTVXNFFJZHJGejZmamFWRndJSTRzNHp0RHdD?=
 =?utf-8?B?Sjk4QmZBZHlsbG40YTRCR0N6NU5CdSsrYVN6Z0p5R3hXSVRWMUpuczRxSG9Y?=
 =?utf-8?B?MEtQYnhhTHdqS0ROazQyRFRETWR1TStBN2o3Yy9ucW50dWgwS2szYWZHY1VW?=
 =?utf-8?B?SFg1aytIQ1NDb0hoNnFENC9RdFFKNVVNcFlLaDdmbGNqN1k0ZTZPQ2Q2T2Zv?=
 =?utf-8?B?ZFpWNEh5Z1hmUXIvSVh1dEsrd3NGTFN5RjlKZm9VRi81dVgyT1ZjUnptblZt?=
 =?utf-8?B?TytqaEc0dXJMRW1iUXRBSlpjRDNCTnF5T0ErcmoyUk9VK3V5bXg3cWRTeGd4?=
 =?utf-8?B?OEdRVnZZbkl4R3hTZ2pKZXZYM2ZaeG9JTExIUHQ0OTNKbko0dW0zbEU3Qndm?=
 =?utf-8?B?aktJbGx4TU5NNjJETDI5YXMzQzI2UjVYamlpVjVPOXZmVk1YSkhoY01BQUpI?=
 =?utf-8?B?bnl4eHRGMCtyMERBTWpxZXdPMHdlOHRFU1BEU1Nwb05QVCtWMy9iVmltM3VS?=
 =?utf-8?B?eWRsR09KYWtCMVhhNktFOEZqOEZ6MmNiZlQ3b3loTlc3TjJ2UWVsRk1EMW5W?=
 =?utf-8?B?b1JIWUE2a3pFaHRxMTdBSXdUelVFeElDMW83dEIvQ3lIK0s5UWNXSmJoY3V0?=
 =?utf-8?B?Z0RKd1Vnb2d4QS9pMDNZZGVUNVU4VVJlV0dMVzd5OS9uRWREWDJDV1lXeUNJ?=
 =?utf-8?B?Q21MZ3Z4c2JKekltZGxyeDZleEhjZDF4ZU1YZThBUHRZMVlua29tUkRSbHds?=
 =?utf-8?B?bElEajRmTCtrMlMvNDZyNWpGcXAreDNESmJGeTRLREpKcFNkd04zOHRTVXBG?=
 =?utf-8?B?RFNsbUNpYkZLYzN1S0dncnpraG5EdGd0N2NhMzNXdVdzSk5zZ2JHUmFIb1ho?=
 =?utf-8?B?bFh3b3RXcGs3V1pzTzV3M2xYSzdVdnlHOUg3OERYaTFwdEhoOXMrRjVqaHM0?=
 =?utf-8?B?SkZmRUZ2NmhFYy9TV0RiU3NEbnNUWGQyYlZFZndURkU5NUNZd0wva1VXOEdR?=
 =?utf-8?B?NTFhSHdZdDFOMzJwZTVoUnVsYmRpQmFyZGVwUFh6NkJEUGJDUFVqaVB1YWlV?=
 =?utf-8?B?c1ZlSld4RmkxUldHUllPb3huZjhjaWdBU1lRKzZaRmxuSjR0clpKYTVVSjhJ?=
 =?utf-8?B?STI0R0ZFaTdiODNTcUYvWGE1VVBnWCtyQktSMjhmaGkvUEgxZGxSeWx2VVlN?=
 =?utf-8?Q?1xJyUET1IWP8qG9ljSKwHbjxs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5512434-db9d-42cc-c00a-08db2a7e40f2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 02:36:35.0368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4J0X0yvx08AcRgnN7NMo7DBQ53eor5/WLrCGcnIbUOAkj1sFO7mxoUIKbtvSua0XrSql98SLbFD5qH3sVjJ16g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
X-Proofpoint-GUID: bhEjRYSTPaLqj0heynUSl-jJfeQWfuZG
X-Proofpoint-ORIG-GUID: X9SDxJU8dD75FKiP2xOqV74hf0kXuV0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=966 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220016
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32M1xZRx002380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 02:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178906

On 3/22/23 01:50, Ross Burton wrote:
> On 21 Mar 2023, at 15:40, Chen Qi via lists.openembedded.org <Qi.Chen=3D=
windriver.com@lists.openembedded.org> wrote:
>> This recipe provides find-debuginfo which is used by rpm, more
>> specifically rpmbuild.
>>
>> RPM upstream removed find-debuginfo and switched to use debugedit
>> in the following commit.
>>
>>   https://github.com/rpm-software-management/rpm/commit/04b0805a756cdd=
9466fb9dc717846f5bf15518cc
>>
>> Without debugedit, rpmbuild fails to generate debuginfo package when
>> %debug_package is added to spec file.
> Our spec files don=E2=80=99t do that, so why would this be a problem?
>
> Are you building =E2=80=9Cnative=E2=80=9D spec files on target?
>
> Ross

The original problem comes from users using nativesdk-rpm-build to=20
generate debuginfo packages inside SDK.

This mainly affects target rpm-build and nativesdk-rpm-build. rpm-native=20
is not affected, because our build system does not use %debug_package.=20
And users would usually care about rpm on target and inside SDK, because=20
that's the tool that would usually use to accomplish their tasks.=20
Without this recipe, the 'rpmbuild' lacks the ability to generate=20
debuginfo package. We can also see from the following link that RPM=20
treats debugedit as a requirement.

https://github.com/rpm-software-management/rpm/blob/master/INSTALL

Regards,
Qi


