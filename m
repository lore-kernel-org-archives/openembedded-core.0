Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDF2C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 08:04:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.81157.1673597092059454826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 00:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=f3Vj/20N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0377c82581=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30D7mkbG028180
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 00:04:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=VSa1OveOzm2H/jQhHknXrYZfzIqwSGhO/qVoQqjXKew=;
 b=f3Vj/20NuWjwSX8csA70yTO5PnGReZvSWu3jOUcMITfK/hQiNufx/qGHEGToMJIw3zLK
 NJLznZrFKgPSCzBPOCkduvNss+TE9D+jInfg/IzSGDDn8wx7vk2duuqE2iUBvR/dO0iE
 rcz0J1T7CDjJphV11aYD1c9V4OQl8x+iESjZm3+3jG3CvHlGwQe4CQFwcaBH0tNMUUOz
 Vbm20xdB7yhSkANu+zoGP7+HlsZJhZrqHTQsT6dRqHBTX5sK4evpipWnvQ7wggikvvSf
 FlyMWjZbvoFUIKVlxSPhVKqofFpmQc3/F9fsEmrh9mfRxpPbDTqv7NqfdwDW+3Xupa2i 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5tjd3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 00:04:51 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30D84oGp030198
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 00:04:50 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5tjd3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 00:04:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAP7rP1feIIQI+gOWvHERBccAwst6uIguzMTOJjf5b8zJHJA7kpoxo5bs3or2WqOI/ieRlmZQ9xozM2nmo/IEpDeIbLz//tO0qQ4R24fbkR2EAoW5LbaYnCw5yKR+SeLXmstDtFqXvYyjaDWSgOeY9NntH/TsB1D9lqaa1RmqdJkj+v90Kq/VGt8JyUAqeVkPc1ZkFnrGhhbS//LWZZ+530f6gL/jP4PT8zJcHUo6Crv1BNVpUo+A7hs3Yf3NVIxY0GYQMBRcMZ9qQcmwkNmuQAF9/VwrdXtElq1Q/ilRBVEy7hLTtisF+8/N31k95zQRBTf1CcMgNjMFhQMoJp2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSa1OveOzm2H/jQhHknXrYZfzIqwSGhO/qVoQqjXKew=;
 b=VwUGrua0xXGJhRbKEFnKUqfCRbZ3E+UqGiZwXSlJl+vxQL08e+n1Fc0poWJyubWq8YFtKmRImYWQ2P97MSod2msUEG2ydsS2sO+ll61NzVpwEB8F+t9sPrrlt8ZekDrdmIJ/GhFEpvSak6gWc+QROcXzCIQ0Gez4Ht4ayssuFAUWNbCBHyzyNiVNO43LzrKlnlcmLgXEwVft5DVm2TN5kgYxdO8iwdvoNMlzLzunJzn3XV+De3ME6UJEwisj5vb7/qIGix3gePN5UM/I3KWO44nysT56tBJkNSFK8HPubD1NAF83V4mMS/UWg7fPdjfzl4DcTYg4Px1DVeupm4NfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by BL1PR11MB5397.namprd11.prod.outlook.com (2603:10b6:208:308::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 08:04:48 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::f1d4:6e68:1a49:7364]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::f1d4:6e68:1a49:7364%6]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 08:04:48 +0000
Message-ID: <a690d84f-aa54-4187-e0dd-780a966cf454@windriver.com>
Date: Fri, 13 Jan 2023 16:04:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH 2/2] curl: enable nghttp2 for support HTTP2
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20221229023442.2520067-1-changqing.li@windriver.com>
 <20221229023442.2520067-2-changqing.li@windriver.com>
 <Y7baMI4MLdLKahf+@mail.local>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <Y7baMI4MLdLKahf+@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::33) To BN7PR11MB2548.namprd11.prod.outlook.com
 (2603:10b6:406:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR11MB2548:EE_|BL1PR11MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d66736b-14c0-42e8-8373-08daf53cd6fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7gkhyZn7AJQiy2k/w/cCnIocp4zNY8wbe5z767lcwwSoKf4IterOoYAxOPyoJ1xXQHkjBfdWwEgox3lVVr6BdYVcM3k0ZuLyCoQWfIovIKflKBpU0upsS1HWTNBWafq3GC1mfM3DwD9zvI3dByJWZKSMdKpTFKM9V28NS2JhXdwQ7WilN9C3VyGnTgOe/FVUM8QlsZk4bR6SipTVfE1VgtIFoTOSZwSAEyOVacCSwqYC0FNcQ/iVlgufDjDDAL1TLZ3V576HweWMNWAkSYat3+gNGASuo0YfzLbpSL6niMDiige2GmVl4NPacKdO+dhqUf8g5pviHfmUIOwKcb62OCHcuUBvvm858E8OgtZ5x5kYHOpxUvmHFYJNZi5JntmgQVmK9Uat8BpO3/ExN398nVX0f+ez9xzqLxZSmfIw1tEM+FRwsOHAGTe4NYJc7ANK5R2F+Qy9jC3Q3NdWgR3Cq/DIsNHtLNx1sGwjTBNZLOy9B8hnqNm2YAerulP5qal3GbA2MlHLuFe1+QmAlxiC4i0k64Q6MBWNenEBeRAM0tYfTR17gbok+K1pus6itcS9ZBKmg0M6XpZngvtIUGd8XY08NJ+7wOidlBA6S74QC7p1lpF7OStu9lOUymFJG0y5RWdJnlbjKzFtf74eVAwa6cbCCGqhVaV/u+HPpAgSTOFQ1wMjoMdHTK7TXQcd9ZqfTq0O2hx+XPwZ9mGxE3ew2NM4IF/5sGAjySXc2icBQ4swCgPgJN7TbHkz3RrR14KPhWB616LGhDWY0k8etFo6kd/FYkhN31+pCVsx/96p9vU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(451199015)(2906002)(110136005)(5660300002)(316002)(44832011)(36756003)(2616005)(38100700002)(83380400001)(31696002)(6486002)(966005)(86362001)(26005)(53546011)(6506007)(186003)(6512007)(478600001)(8676002)(8936002)(31686004)(6666004)(66899015)(4326008)(66946007)(66476007)(66556008)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFgyd1lSa0Z3Nmdaa2d1ZlJBK1FDZ1JBNWJ4dnBvUG4yTkh3TS84UU5qL0dJ?=
 =?utf-8?B?YTJrWFIwS21Menc0WkxCakhjaXdLdFErWi9TQThzdjJvRnRkbXVoL2wwYTFL?=
 =?utf-8?B?WEJtUzg4d29nWTJyK2tGcFcyZnJramVpcTNOWHI4eFp2UXRtRkd1Q2NDakYy?=
 =?utf-8?B?OWpzRDVQcWR5S08yQjFPVXBaWjg3K2tnR0Yya2xxbTNhS3cveVlIT1hXOWUw?=
 =?utf-8?B?NlJ1L25qcWhtZmxUSCt0MzBBMlhjem9mSmJpV2NIeHNob2NHbmlTdGdpaE9P?=
 =?utf-8?B?aWx1SytkeVhnOVJUdFBhcVNlV3Z6UE5yWFF5TmNaWWlIYzY0WTBwQ3BaT0wr?=
 =?utf-8?B?WGxJSzlONXQrZ3R2SWc2TGduYjNqY2JFa3ArQy82citvbFpXRlNDd1pnQ0RP?=
 =?utf-8?B?ci9lV2VudXR5TVdZRHFsYWZBUUViOGZMcTNVZFZCSnM2RTMrQTIyaUNoc0ZC?=
 =?utf-8?B?NThuekxVZGJFTklNT0dIUUI4Y3o0SUtIdE9zRWNiV0s1WGxBNUpBcTlEMDVp?=
 =?utf-8?B?VDgrNW9nZnJSSWdlUXNVZDVUNkxUU210KzN6Umt6elV5TmliejdtQ2dkTGNl?=
 =?utf-8?B?MFpEdkw3TFp3UmJibm9ZTFpKcXB5SXBWVmFCb29XL1BRQW5DdGZBaE5FUHhC?=
 =?utf-8?B?RUdRZ1QzVUtYNFJlek1aUnFQbWlrdk9WRW50THUwQlAxdHFGR3pVelVVa3l1?=
 =?utf-8?B?bkFKTFhoWE02OGY2M29WbUl1T0FtR3B1WTNTVWtNMDlnd1VSVlY1blh3VC84?=
 =?utf-8?B?WXVRM01QL1pla2poTS9kZzdkZkhpUE02T2l3VkJ4c0RYSlJxY1QzTCt5b1d6?=
 =?utf-8?B?RWFEaEFPSEphZ2pBUFpYckVkaDJrL2lhbDd1dEtucnRPTkNhcUYxSkl0Z01J?=
 =?utf-8?B?TlZMbmVrN2FidVpyd1ZlMUNuaWxEZ05wS2pZajdkTE04SVVPVlFLb3Y3WjJS?=
 =?utf-8?B?UHpjcXFJaytncUhCb1ZOYXVqQmI5eEdQQWJDMG5CcDg2MmxsQTRDVUgzMGhy?=
 =?utf-8?B?MDNOdnRWbUNIek93RkNaODAwekx1WUJ1ZkpuTnl4Nk1kR2E0UnZtTm41TWlU?=
 =?utf-8?B?QitjN0Y5VkdiejdTaEhHb0l3OEJZWnRIRlFSeVBObWZBcHpHYUIzM3ZUUmlF?=
 =?utf-8?B?REFKQktiaXo1UVUwY3Q5dngrMGdCa2xiak1lT3BxT3lQOVRYMXo2cjhYaGtB?=
 =?utf-8?B?a0pKT245czZFS2pVUFBFTU1vNDV5ZFoxa05mdHJwZ2R5UXpNYmc4eFNnbjhw?=
 =?utf-8?B?N005Vm5HVFNNOC84T0RYMzN6dGNWZWs1WHRvWFpQYy9panM3NVJLcFYxYUk2?=
 =?utf-8?B?dVJ4YjR0V2U4WWEwcWZoMWxOL0lmM2tXOVNGdHBRMWpZN0dsdU9mZ1ZrYmVY?=
 =?utf-8?B?YWRQc1JsVXBpOXArYXhvamY0Z29UbzdZYk1Ia3pCTFhhMXlQR2NlM3dGaDBu?=
 =?utf-8?B?Y0ZmYTZ2WDBweWt5VE95U2FybmsxMWoybzBTSWVzS0p2eFNIa1NkRVdETnRh?=
 =?utf-8?B?ZUJjRFcyYVBCSThkckdLNFNWTlFaL0hnQVdKT3g1a3FFdWVKZWJ3b0lzQUZq?=
 =?utf-8?B?bnVNMDkzby9YeDh0bVRsUTc1TTFXN2dpUUdDUkR4TWtIYlA5dmtvaVE4UlFG?=
 =?utf-8?B?ZFkvSTVGNmNQenFGd2wwSkRjWmdDT3AyTFJwR1dvaWcxemIrbis5MXcyNklT?=
 =?utf-8?B?OEp5dUZYOXN2U1ZleFNRRVAwRVpiU0N2cXkzTDFudEsyNnZnbk9NYVBYM291?=
 =?utf-8?B?SHQxY1UyRWs4S1BROFZPdUtUSkVMRy80akk5STg2WE1Ja1NsdVY0cnZvaGpB?=
 =?utf-8?B?N1hoUDJCWkN0V0FFcXVEVUZsdjljT21CUDZaR1drTzBwSGY3Sk9QTW83Z3Uz?=
 =?utf-8?B?U0lvOE11djRLMUlmaElOTXVFbldXdENHN0xIdG1BbytPNHNQTkNhY0JhdWg5?=
 =?utf-8?B?MjdLYlBQSjRTUncvNjdpWWk3VjU5eVhBUHk5akNkTG5yMFZYWkxnSExhMnov?=
 =?utf-8?B?eXU3UUtUcG9XcC9oMFlMRFpoZTgxL3AxRU9RU2NsbTU3S1RxMmw5M3ptZUhF?=
 =?utf-8?B?ZlpJSEtjVTRJR2J6OWFVYytyWjVYUTlFbnZiL295YkJ5Z1hQYjdjM3V5UDg1?=
 =?utf-8?B?ZzBrem5Nd1RGSDh1bUZWOXRkSElqZkdLREY0WDc1ZllkVlRBcFlPb0R5bTVQ?=
 =?utf-8?B?TWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d66736b-14c0-42e8-8373-08daf53cd6fa
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 08:04:48.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/FSHZQfKO8OtZH4+YPMiXWL9+ezQ7t7kjLau0G/yzIFktLPKBtIpVXnAdQ9hz+i6qlD7DLG7aUW4O87jt3WgCZQdEn7ipovBN4aB5d34Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5397
X-Proofpoint-GUID: SPrTDM-50VI9g8V3ZoEpOHCuwshgraCQ
X-Proofpoint-ORIG-GUID: JjfzWYBU-8KbNn9NOdIdu_xNQw0yCIpm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-13_03,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130056
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30D7mkbG028180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 08:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175812


On 1/5/23 22:09, Alexandre Belloni wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> This fails on the AB:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4580/=
steps/14/logs/stdio

Hi, Alexandre

I need some help to debug this issue.

I cannot reproduce this issue on my host. First,=C2=A0 the gcc command us=
ed=20
to build the binary conftest will

have as-needed enabled by default,=C2=A0 so actually,=C2=A0 these libs wi=
ll not be=20
linked, and runtime check will passed.

Refer the command:

gcc -o conftest=20
-isystem/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r=
0/recipe-sysroot-native/usr/include=20
-pipe -Werror-implicit-function-declaration -g -O2 -std=3Dgnu89 -pedantic=
=20
-Wall -W -Wpointer-arith -Wwrite-strings -Wunused -Wshadow -Winline=20
-Wnested-externs -Wmissing-declarations -Wmissing-prototypes=20
-Wno-long-long -Wbad-function-cast -Wfloat-equal -Wno-multichar=20
-Wsign-compare -Wundef -Wno-format-nonliteral -Wendif-labels=20
-Wstrict-prototypes -Wdeclaration-after-statement -Wold-style-definition=20
-Wstrict-aliasing=3D3 -Wcast-align -Wtype-limits -Wold-style-declaration=20
-Wmissing-parameter-type -Wempty-body -Wclobbered -Wignored-qualifiers=20
-Wconversion -Wno-sign-conversion -Wvla -ftree-vrp -Wdouble-promotion=20
-Wformat=3D2 -Warray-bounds=3D2 -Wshift-negative-value -Wshift-overflow=3D=
2=20
-Wnull-dereference -fdelete-null-pointer-checks -Wduplicated-cond=20
-Wunused-const-variable -Wduplicated-branches -Wrestrict -Walloc-zero=20
-Wformat-overflow=3D2 -Wformat-truncation=3D2 -Wimplicit-fallthrough=3D4=20
-Wno-system-headers=20
-isystem/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r=
0/recipe-sysroot-native/usr/include=20
-I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/usr/lib/..//include=20
-I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=20
-DOPENSSL_SUPPRESS_DEPRECATED=20
-I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=20
-L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/usr/lib=20
-L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/lib=20
-Wl,--enable-new-dtags=20
-Wl,-rpath-link,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/=
7.87.0-r0/recipe-sysroot-native/usr/lib=20
-Wl,-rpath-link,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/=
7.87.0-r0/recipe-sysroot-native/lib=20
-Wl,-rpath,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.=
0-r0/recipe-sysroot-native/usr/lib=20
-Wl,-rpath,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.=
0-r0/recipe-sysroot-native/lib=20
-Wl,-O1 -Wl,--allow-shlib-undefined=20
-Wl,--dynamic-linker=3D/mnt/lincd/build/tmp-glibc/sysroots-uninative/x86_=
64-linux/lib/ld-linux-x86-64.so.2=20
-L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/usr/lib/..//lib=20
-L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=20
-L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/reci=
pe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=20
conftest.c=C2=A0=C2=A0 -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz


I also tried to add "-Wl,--no-as-needed" in above comand, and manually=20
run it,=C2=A0 then conftest will link those libraries. These libraries ca=
n=20
also be found at runtime

since these libraries will be in recipe-sysroot-native.

$/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build# ldd=20
conftest
 =C2=A0=C2=A0 =C2=A0linux-vdso.so.1 (0x00007ffd447c1000)
 =C2=A0=C2=A0 =C2=A0libnghttp2.so.14 =3D>=20
/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe=
-sysroot-native/usr/lib/libnghttp2.so.14=20
(0x00007f6bd36af000)
 =C2=A0=C2=A0 =C2=A0libssl.so.3 =3D>=20
/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe=
-sysroot-native/usr/lib/libssl.so.3=20
(0x00007f6bd3606000)
 =C2=A0=C2=A0 =C2=A0libcrypto.so.3 =3D>=20
/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe=
-sysroot-native/usr/lib/libcrypto.so.3=20
(0x00007f6bd31cf000)
 =C2=A0=C2=A0 =C2=A0libz.so.1 =3D>=20
/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe=
-sysroot-native/usr/lib/libz.so.1=20
(0x00007f6bd31b5000)
 =C2=A0=C2=A0 =C2=A0libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x000=
07f6bd2fb9000)
 =C2=A0=C2=A0 =C2=A0libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread=
.so.0=20
(0x00007f6bd2f96000)
 =C2=A0=C2=A0 =C2=A0libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x0=
0007f6bd2f90000)
 =C2=A0/mnt/lincd/build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-=
linux-x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x00007f6bd36e6000)
$/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build#=20
./conftest


This should be an host related issue,=C2=A0 Does the worker "debian11-ty-=
3"=20
means that this build is built on debian11 docker or debian11 host? Thank=
s.


Regards

Changqing

>
> | checking run-time libs availability... failed
> | configure: error: one or more libs available at link-time are not ava=
ilable run-time. Libs used at link-time: -lnghttp2 -lssl -lcrypto -lssl -=
lcrypto -lz
> | NOTE: The following config.log files may provide further information.
> | NOTE: /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-=
109066/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build/config.log
> | ERROR: configure failed
> | WARNING: exit code 1 from a shell command.
> NOTE: recipe curl-native-7.87.0-r0: task do_configure: Failed
> ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/oe-selftest-de=
bian/build/meta/recipes-support/curl/curl_7.87.0.bb:do_configure) failed =
with exit code '1'
>
> On 29/12/2022 10:34:42+0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> After commit `ostree: replace libsoup-2.4 by curl`, ostree depends on
>> libcurl, but it needs http2 support, otherwise it will fail with
>> error:
>> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_n=
ext_curl_request: assertion failed (rc =3D=3D CURLM_OK): (1 =3D=3D 0)
>> | Bail out! OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:88=
6:initiate_next_curl_request: assertion failed (rc =3D=3D CURLM_OK): (1 =3D=
=3D 0)
>>
>> Enable nghttp2 to fix above error.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-support/curl/curl_7.86.0.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-support/curl/curl_7.86.0.bb b/meta/recipes-s=
upport/curl/curl_7.86.0.bb
>> index f5e3e7235d..6cee548f35 100644
>> --- a/meta/recipes-support/curl/curl_7.86.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.86.0.bb
>> @@ -24,9 +24,9 @@ inherit autotools pkgconfig binconfig multilib_heade=
r ptest
>>   # Entropy source for random PACKAGECONFIG option
>>   RANDOM ?=3D "/dev/urandom"
>>
>> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)=
} libidn openssl proxy random threaded-resolver verbose zlib"
>> -PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random threaded-re=
solver verbose zlib"
>> -PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random threaded=
-resolver verbose zlib"
>> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)=
} libidn openssl proxy random threaded-resolver verbose zlib nghttp2"
>> +PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random threaded-re=
solver verbose zlib nghttp2"
>> +PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random threaded=
-resolver verbose zlib nghttp2"
>>
>>   # 'ares' and 'threaded-resolver' are mutually exclusive
>>   PACKAGECONFIG[ares] =3D "--enable-ares,--disable-ares,c-ares,,,threa=
ded-resolver"
>> --
>> 2.25.1
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#175090): https://lists.openembedded.org/g/openembe=
dded-core/message/175090
>> Mute This Topic: https://lists.openembedded.org/mt/95931602/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alexandre.belloni@bootlin.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

