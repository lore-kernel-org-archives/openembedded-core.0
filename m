Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3F4C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 17:01:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.928.1643821272698358544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 09:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LCwykmPX;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9032a99fb5=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 212DSgxD017819
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 09:01:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : cc : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=OzwxH+UWOq8qA7eCFcsjMaooOfTpVBrs3nscr5ED+5M=;
 b=LCwykmPX9DoJGBEJ5GhyO/VjRnfjGu8z8WZ40a2S2cCT0TzUu2YWtw9rXC3CzMGdgSnc
 nIWtnxoj+sLh5mu3YlbIolCtaSJ+G0PQzdEfJ31UJoSjGNPKj5VTr/i7z538rnzr6Su2
 mBvad/dmfLyKry30ElYuVzdgZA7sTKlJEdXcVfGuxxQvEQTSPPR4kx9ZbNqmVFn/GRto
 QFaQzLYb9Zhf6kQ68hTnDZezW5kW6vD/zGzaRwEg8BzxrnqEdce/0j5gywZ+6ettGioj
 hSi4LwGwKjflUSM+L1/Z0RiuFvCo75zTnKU7A/A78AWmsDtK+KgMUw7YXGOEkNPKJbsU sg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dxk51hjfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 09:01:12 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 212H1BHf012123
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 09:01:11 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dxk51hjff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Feb 2022 09:01:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cezfPSNwy0yKzWS86kj7BvfDTjm2n1wTgNHqwyoUP13PissQz/vjCGKx9ohumfKQOnVKGsGdS0yaUaIeCC5z7duPp08MlS2urh/LFu0yiZ4TX+tR8fU6G1TI6XWJgsOh3kggk1xgKyvi9/rNFicp83jJZiDME2EEIiwYN/SWM+T6PyFFwCSyeS32jyIoyf47wzh+LcZBG98QdWPz/dE2BSAKw2HUjPreikuDwRpEqc9W33cZHSvFUK96MSo5kryG6oH2SHUBZByqSKAt5rzpWsc1k+7Sm2No2DF7Ccg0d5WuaS2YN2X/Aox3JyhZBCr/JzokAv5WmLc09sk8B7/cGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzwxH+UWOq8qA7eCFcsjMaooOfTpVBrs3nscr5ED+5M=;
 b=IB8WaYc8mPhJA+BJPF/IFvM7NW5jbP9jLsHJxdledrYM8k3TT6jXJ7jvOn/rR/nAPh8uVM2Ht/liAtEj8wrwkOzH8WPB2FwV2D6Go5cBxLHS4kQe6oo+m6tsyt4ajGCDQJjxJbnVKJesLbCpNg6xmzN6H7E9ke+k84/+dN/JApoNlvE9NFgNQw8eixlRbsYKPOKZXKFjV8vOL0Id/WRqHBP5cBiSLiUKM0i3xp6n1zo5yPJhPqJrH1QcIXZuNTCLmHC9ZgP30SmP1P6uvGfWdA5M+KSHhcivkKloYIf7d2e4/Q2MMJ8YT+MBKrgmRc/zNk/hOv+lpK0VHC+wLfcmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.17; Wed, 2 Feb 2022 17:01:09 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 17:01:09 +0000
Message-ID: <69dd692e-28b2-7787-2582-16f9c5f0c662@windriver.com>
Date: Wed, 2 Feb 2022 12:01:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [hardknott] qemu CVE backports
Content-Language: en-US
From: Sakib Sajal <sakib.sajal@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>, anuj.mittal@intel.com
References: <16D00495D34D3FEC.20712@lists.openembedded.org>
Cc: mhalstead@linuxfoundation.org
In-Reply-To: <16D00495D34D3FEC.20712@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::10) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5b2b517-ddfd-4312-c320-08d9e66d9bd0
X-MS-TrafficTypeDiagnostic: MW5PR11MB5882:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB5882E64394BC545A5442E269F2279@MW5PR11MB5882.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OES55+5g0uuEWD1B+lJeQ5sUWD6pajpH3D2ewFQCSNbvORvlPG7i73pcZ2eZBYGDaPFLQqBE4v4HTh2iIrnMeVbgJW48L89hs1/DgzTsEvoOsQakS3vfyfTGuFi/0zq+jArnr9jeR4zggj2mCKTixqlv+y70NR84y2ECsZmOMazIpRysKiB9klCAvWlSpid1/8hiCgbE9UulRX8tP/7+1epxXr9dC3JlDam7aIVCSNUiwnNz4vEH/0b8XVErzxR/oWqXU2qezcS22hqMnBFsVgFi8Y+9SjpNHggrah0bTylDP9KDl0tsCu9KlAF0vRrNdIHLfEmmGAuCuS42Dd9IyTNwFEDufy3Hpk/rrhV13Nd8lV7TD0QnBYW5yt4S0ulkQEL5dEiuTkf/+NJoBngzXZ7eJW+iDIRXGU9PdIQOXyo1qnR0uhIf/mbz8Pj/EB6auuYDYOmUBE9rI5RZZCfboOwvLssheQnEHvsTvPHg0v+WW4iN3Dto8CWgiL6OsuB4OY4UWLYHPNqVFMuDJSn6vsuIP07n5SKjflVofGupO4YV9muJobVUQwRYoLYM8K2PhSi2W2p9v3N+6GZ/ovyJTepyoFWUiMPzTDY2uCySXQD6hvOyHr6SjZkYfe+i4HeRTMf9qrJJYlI+yJTHSCe33XGjPD3kWN86GU0l4FcRpBrcl/PBWwUVXpznty6Ts4kLh5Yq114CdyElXoHF2hQDvIzArA8zt8cL5f/rlmz++ZPmWJIG2HCqsG1xeOPs4E19wfBsPP2BrMHI+u7yhH00udI25pEdSFn19lguJXzlR/aKkvaPcoJtJSLxO3kxSV7IM/yEcjPv2/UgWNFlwnB8VWsSAFDz+ZksYIRH3xVFr1DBaNYntHfLh5jrLMSS4OqNwloqDJ+aDfr1r5y1tcCKuQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(38100700002)(53546011)(6506007)(6486002)(966005)(31686004)(38350700002)(52116002)(2616005)(316002)(66946007)(4744005)(44832011)(66476007)(508600001)(66556008)(36756003)(8936002)(8676002)(4326008)(6666004)(5660300002)(2906002)(6512007)(86362001)(31696002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N3dOaklvVENYQ0lvZC9jUnk4c0s1dGlEaEdBQ0gxTUFPSzVySGN0ZERZY2Jw?=
 =?utf-8?B?K1Izd0dhN3I3VnMzNUZ5Z0N0aG9ZK3N5SUp1RGZCWnlpUEJ3d1lTMkdpcENr?=
 =?utf-8?B?MXIzYjVtNmM1OG44dHUxV3VWcklGSFNhc2xORWR6MXlwNk0xTHNkSlRlbmsw?=
 =?utf-8?B?TmJ5UzdlbStSRU85NTU0WlRIZ09UcWc3WG1qNGViZEkwMmRrcXNvdFRXUDk0?=
 =?utf-8?B?dWg0ajU3ZmdjNDloQTFDdnAyRk9idVpKWGdUc1BRdTVOVVJxdC83Sk5lYW1r?=
 =?utf-8?B?TUhiT2JhY01GZmtMVnpTNEl2WC85M2ZKQTFVYUVud2k1WXRRWEhBWVpDWjR5?=
 =?utf-8?B?ZlZ4WkdQWGR5L1BJUHdSZC9NaC9qV2U1VmZBSW42aEh1T3E4bk9aN3dER0Qv?=
 =?utf-8?B?a0ZoQVV6czlZQXdNYThMY0J6ZDltNE83bHNPZUplQWdEbzJPM3dxck16VDds?=
 =?utf-8?B?dTVHdnF1L05IaUVDeDlwZlRkSXZmSHdocXJBaU9VWldQNWRvaVNNWmtseFZC?=
 =?utf-8?B?Z0NyYk5IaHFZZCsyN2JRUEpqY3cxQlFkWGFnNFc1bFZxTzZIQ0dzeXVCNTFC?=
 =?utf-8?B?UXpWRzNiZkFFSVliWHFpQlYzVy9BU1JITzhFRTdyY25XMmtQaGVxanIvNFZV?=
 =?utf-8?B?c0xwT2xTQW9IdjhQMWxhbXNFMTJvbkovWWgvZzdyZlpmdXlWOWJHSlVYbVNq?=
 =?utf-8?B?Ti92RGdkWCtkQWtUUDdrdnZyakNlN0xKbXFoZ09GWGh1aG9OQ3dPbER1ejhX?=
 =?utf-8?B?SXJGeTN4cXlzaUIrMjVBbDZsY1hrNzRqdHAvZXEwRWNGZ3BkYmFhZ0tPZG0v?=
 =?utf-8?B?MGJhV3hxSkoyWnJsYkIzRXFlYmRiN0M4UitTM3pBbEVaZjdBdlFiN09wak9I?=
 =?utf-8?B?YmRMTGVvdjl2czRJSmVaNVZCMkthVHA3b3VRbDhoaUpCVnlGQnRoYk1xbHF5?=
 =?utf-8?B?cFBQZ1l1WjBSTUZ5YTg1NzZzYnhVdnp2cFlBdWlTQy90WkhUYkhRckwyODlD?=
 =?utf-8?B?dXdkMC9HbHNNbEFySStqZElBYTRGWEVNcDlhREN6S1ZiejA2c3dSNHVPZkJs?=
 =?utf-8?B?elRoS0p5c1M4eUZsbkViSmJONE5ZcURLR0piRmFOdlVzUC9tZUJJODlQaURB?=
 =?utf-8?B?dmw1V3NLTlJpU21TS2h1Q0EvUnFzcmFUU3BvQVZjd1hMcmdEck9WdkZTVzJP?=
 =?utf-8?B?NEQvYmxWSzg0ZXphSlNmNTlxdktxQ040MlduZTlrZkRmeURSVjZxMEZMSnF1?=
 =?utf-8?B?SUJvVFFhRFI4ZWJqUEJWRHBTemc4b05KR3ZocjBQcHRUZUgxdmtJNGZhRWpJ?=
 =?utf-8?B?OXBZbzJtLzJmSzZiUFNoQkJRc1V1UDdaR0txNDFpWWdHbExWZkZoRzQyL2Z6?=
 =?utf-8?B?ZW9sOE9jQU9UN3hpRkR4QStYVlRhWGs5MGRVWkFQNTErUVlyQS8rd2E5T2Qv?=
 =?utf-8?B?eFgzNmZicjhXT3IxRkdiM1BJbGtHZzY2aUFiOXp3Y1ZLc3V4alBUT2ZNbUM2?=
 =?utf-8?B?Y0tvM1dPRGk4MkRqNFVuWDJjVnEvbU5KdEJCaHh5emJoZWdtcCtKRi92akJq?=
 =?utf-8?B?My9TQVNLbXRqRDRXUzliYXIwc3k4Z24xektHNVpuOXVodHZMYXFBNDRBaURN?=
 =?utf-8?B?KzJyQ2tIeDlqT1NoN29RSURsbWtGL1B2MlJlOFQxU3J6cGtvY2lUdlkrNUFl?=
 =?utf-8?B?d0lzWTRQa0lwSGIwS3ZZeURUQlBpTS9UNHZYck9Ja0VFdkFha1Ira1l1Q0VW?=
 =?utf-8?B?NVpqRTlPSVQwMXRrandvbEN2UUtlOHRjbUdWNE15TktLeHlSNzd0NkhUcEZo?=
 =?utf-8?B?VWxpR3R3bVorektsS2RBMDlJZmsvVW1yQnVBdi9ORDFpZVhqNCtkSy9IYVM4?=
 =?utf-8?B?NWQ0TUNnenJqc1FTVWxva2l3VmlpdHc2STkwQnhUT1lRZTdlWFptVlI1S1p4?=
 =?utf-8?B?V29SVDJ2TjNIeFRaZGFuNERydXdnZXVXNlhKbElIYlJTWjV3N0dnUGZVc3g5?=
 =?utf-8?B?ZjVqaFd6b0hadS9CTkFTVXhnOEZYNlZVaGE5d0FQTEl0dTJwR2J6OTJwcjB3?=
 =?utf-8?B?bUVPU0lTU0NSNjZ4ZFFVMzR6aWUxMjVNRUZibXA5OVhlU05YMnZsbkxITE56?=
 =?utf-8?B?cGlVT050ZTNlTFhnWmg4Y2N4RE10Yk9ocmdiT1pwcEplYkd5ZU1wcTJuSUl0?=
 =?utf-8?B?bVhIU25VYVk3OFV5R3JObnFERXFsWWNTWUxyYWwxdjFWcTFSVlVjQzUwWjB4?=
 =?utf-8?B?TWsyOGRoQmFRcDJuanE1WDljcDBnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c5b2b517-ddfd-4312-c320-08d9e66d9bd0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 17:01:09.2265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1/mjWAs1KYxHEtXYsM6eFiZ6eh59T7gKlC3RTKcOXDSXdxVNOCG5s8nLqHGC1fA4SYGlEF1+zEGoksaMjXSdcdEN+x7smk+Cfp3s6c2ZQzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
X-Proofpoint-GUID: SMTdjluTsTF1MiL3lyyRquSoqZMv4NZi
X-Proofpoint-ORIG-GUID: BlORGYqec2CvzO4LVgkeSFweH9hjBZmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_08,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=671 phishscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 17:01:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161221

Hi Anuj,

The patches did go through. However, the patches are sent in two 
different threads, the first patch in one thread and patches 2 to 8 in 
another thread. Please merge the commits accordingly.

Sorry for the noise.

Sakib

On 2022-02-02 11:21, Sakib Sajal wrote:
> Hi,
>
> I am having trouble sending multiple patches at a time. I will 
> individually send the patches in reply to this mail.
>
> Sorry for the inconvenience.
>
> Sakib
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161219): https://lists.openembedded.org/g/openembedded-core/message/161219
> Mute This Topic: https://lists.openembedded.org/mt/88861937/4422444
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakib.sajal@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

