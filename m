Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37FAC4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 00:45:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.4454.1666226731004807570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 17:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MWhV8OIb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72928ad116=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29K0eEpx010281
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 00:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=oudo8oE1/iCO7QxA9XGMPGkvq3dQu6oTVP+UzSlI0fY=;
 b=MWhV8OIbIUKagxWyOHQsrr2om8eb+dkhRcDLwJYjAsjDkHRz4hszFonm9TR6j1TmhVKT
 GvDRgmMjzvuKIl8lN6NEbf8T0B2YgJDpjDfCNUp2TKB6MXKoULfVykgq7F7Q7bzAo+X3
 kDciFvlxNX5abwBy/B9JkS50+nRTs9oB7aJEQeTzDoZ8NFkfiUge5tj875H2rdS4JBHy
 rxPsUTQGtYi7aiXKO795j5CNispz6Gtk/Amv/mO4yEWW9dqxaE4yzB/71WhipNglp9nK
 gO44Ms4GgZbrKkSB5rvNhUWaRXCCfvFGassXDCNDohb5EYQmLqXq3kDKWn/VMAUj2zJr EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7ku9d0fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 00:45:30 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29K0jTOj022365
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 00:45:29 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7ku9d0f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 00:45:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ab+yBy7AQyCdDnl/0q+30w7sN1qio2M69dVUZBRPXRaXxSofgb0BjYBKpyU65JJ8Qe0X5C5yWb029LZVo82m0NjwH2xh/BbELL/L88LoBcrN79RJo80sulkgVtEwXNE/O+YKyd4hWuVF5UOLcqB3uLOToCsmnB9x7hSvIUhEbhcaCmFfgLMiOybklvL+zy9idUPqrQhrR5t7qb6PpxUlY83fYG0MmXuIAO6tBPc4nMxg8T3TNZCWnwF4sh50mYvGkuVNNzLcM1wUKz1EuMspOaecFZJoyYUHqrTOpjP0znvCC4m5b5T1lQuA8A5vPjXrzVbf4PkgVvPc6mU4FrzZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oudo8oE1/iCO7QxA9XGMPGkvq3dQu6oTVP+UzSlI0fY=;
 b=Mv4O/PbNj++tCS5Q6kQ5qVmIwwk9OT/5Xx0LiXdICVp1v4DAwRtmbAUsIoWmxowbOVe+rWD7P++Ubaykp6Q+GOrcFIfmFaw7Yw82JmtC4piW/kqW4biC/K3+7+f0PUxhEHlSzwVMjm9xic56zGQrNf3ZPB/8wc6u2MbLWgvpIFGUzPDnLww+Jdl8cbu4HOA7l1SgOVMMmf/ZEjTXN59kuWkPH/sJsv7N2c5I1tuXtWWZG75Za3ZKh50TwktrXSbQvsJdQTAYxn/cFWAwzFRuai6zYgLJHy17aHkAo59gYwHf2l94uWlN/b06v87UgI+h6GSGSJBOBPUsN11Fgxnh8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by IA1PR11MB6146.namprd11.prod.outlook.com (2603:10b6:208:3ee::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 20 Oct
 2022 00:45:27 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2a19:1d60:6710:ac8]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2a19:1d60:6710:ac8%7]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 00:45:27 +0000
Message-ID: <5d6451c6-498d-eafd-239b-25ff6fb951e3@windriver.com>
Date: Wed, 19 Oct 2022 20:45:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core] [PATCH] kbd: package some fonts as restricted
Content-Language: en-CA
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20221018001415.76680-1-Randy.MacLeod@windriver.com>
 <C1D675A5-2FB1-486A-9B31-189E50FFEEFC@arm.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <C1D675A5-2FB1-486A-9B31-189E50FFEEFC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0032.namprd08.prod.outlook.com
 (2603:10b6:a03:100::45) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|IA1PR11MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: ede6c21b-e79b-4354-d1bc-08dab23461d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qXMgyxUmIWxerTl9OHyGfe3TBSy2cdMzBkB2ugV0iGdoStqlyQMBd2Vfr85RtChklaflui6W1qyPLYlYqyWiRH4SxRVeh/g2w7SZ6ECs+3Q00tXz88L663IuUKgeKm/q0CKQs3HE2k1BF5rojySIU2SMJNsQLB7JYQ/VYsh1CA5bTH618d/UVqmszQFwXzVmlt9JQhcfmQvTGDrPR4SV0khdv0i2Gdwj53Rk1GzcgtsU8Gf366fzgZnzLVkHtYQqKq46jkQnhBnH1FtarMsJK9YaMxcLiuD3bfkz+9bsJ8PMjja2d7caumxQLblThFMkk6odGiScGLjZKt5E+V4OzU6SGHVfNcH3G5MCp7Pnu5vzMDuDBfVsu8NJj8gAKSCMO0ckPGOd+6bfGzJJqd+R3J8+Y2uMty1BU9GQ2dwr+qtyeOacUcSsaPz2Uc3mS5rrP5O7YlXTS8iqWqeYUp2EijnMAQL2jEFWZx13Wq9A/CqGJNYbg6iqrhHGX1ZjfS4QHkCsAhW4IcNyE+0LujciP/ySvPozznsFOyuWQILllStLa3RERbI56cTpvlzQp1+6GUFPsu26fRXk7RUYCH/hn4EW0Mmpqw+pVBg+LRnIQh60GGdyFhL17u+KvlJIaY0rQqK/+iZh09/dOOD8NKViJeZVy0mpw8NdiaueyNVFGnoTNGEE1RsXOnZEVzwPQdR8JzvVXl9nH5TiMiKalxN9ufqoYiPAvwsEKd/NYXqUjY0Riito4F0nYcx5kxAbpjfUbqY0TJXOuswCdOX9w+y9Yyltn+jOa1nmbzPeT6YUA/4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(366004)(136003)(346002)(39850400004)(451199015)(36756003)(31696002)(86362001)(6666004)(38100700002)(66556008)(316002)(6916009)(31686004)(5660300002)(4744005)(478600001)(53546011)(6506007)(186003)(4001150100001)(8936002)(2906002)(66476007)(2616005)(66946007)(6512007)(6486002)(26005)(4326008)(41300700001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VCtoeTMxYTB0YWcyZmFha0JhMkRJMFZyNk9XM0VRMVovMU9mbkJuY1pLaWtm?=
 =?utf-8?B?bWZvVVVFQWZRN3IrSHlFbWh1U1hZS3dQcGc3ZWdsRFAzdlRBRktranBNYVUy?=
 =?utf-8?B?UnNBVTZhQngwSmRCTDVTKzFkRjNyTnM0U2FHUEFXcWZXMmthd0Y3blViM29V?=
 =?utf-8?B?UTUwNHJqaDJtc2FidGJOb0czUWI0VURoSTh3NnI0VlNWUGk0YVdZakk4d0JO?=
 =?utf-8?B?bldCaTBpVzlFanhmZ2FBR1pPdFd4cmt6Ylc1aVljQXdKK2pyOFVHQUlXclpw?=
 =?utf-8?B?L1pnSkNBVGc4OGtNeXBnemlCRVZPdG1xNkNnYTRsbEZjeVJrMGlVcldlbU42?=
 =?utf-8?B?emg5eGdPQ1hXRWxnb1lGRi9yOXBYY3JBR3F3QUFMTUM1Q2t0TTE1L1BGQVM4?=
 =?utf-8?B?VW9DQm56U1hjanc5dzFUOVd4akdFUGk3UXlSUkxHcFQ2OExDRzAwK2grQ3dP?=
 =?utf-8?B?NXBtMzhTb1ppdiswa1VncnBJRVBzL2lldDZtd3J5QU5Tdkx0c08vVjdPSXRz?=
 =?utf-8?B?YkNZY21BYlVxbDI4T1FTN1NSRXNmdlZRb013SUg4UTh6YnU3TjdBYkhodHV0?=
 =?utf-8?B?Tjl4VkgzaVFpN1BBU3V4UzVNK2VYTjdTVUlRYThlWGV3ZmF5VlRyRlhuMTBF?=
 =?utf-8?B?YXR6YWN6RTNKTzlhZ3NnMlBtQlFwc0ptNTJLUk5jcUk1dzNRNU1aMDdXazRP?=
 =?utf-8?B?L3lLL0paNWEzU0RZUUNZSmYyZWpPNkttYTdQNGdvVlYzMDJtUTIyekYyZnlX?=
 =?utf-8?B?c0lvc1ErNWhSVkN4WHBtTSs3dkR3YkRCcWlDY1FqbXBVRVh1NGUyaVNtOHJq?=
 =?utf-8?B?dldDY1JIeUxJUlMxcE1STURyNk55cVFPdVlPczFXcEF5czVMKzNUMEJndlVi?=
 =?utf-8?B?K2x0WkU1MWFSeWtkdWJSSHJMc3VDS0txUDNLTzJPWDFTQ0xTRUE2Vk5TZlNP?=
 =?utf-8?B?SXFkdjhiNVI5ZkJkdnJBMUVQb1hpNUh5bEQwOTFaVXRmTGdITGEvU3dWeURC?=
 =?utf-8?B?dWtIeEVjdXBwd29ScDZjNzUzTHJCVi9JVDZDeFJZbStwODcvbkRKcC9pUlNM?=
 =?utf-8?B?MHYvSmY2WnVzdEI0eCswamxFSnZLWHprWVN4T0g4eXB6MGFSS1U1SytVVHpF?=
 =?utf-8?B?UGJ0b1QzQkdYYkIwM2NkVzdiTS9Sd09uRklQOHBqc0RkU1U0bzZNZW5vMERB?=
 =?utf-8?B?aW03WHdvVHc0TGF2MWZRQ1V2eXBSeWRFSDFkMDZvcmNZWGFzekJMUElYUVhD?=
 =?utf-8?B?OFZHK1BQV1htWVNnWlF2N08vWTRaanNGK3RxMGs4ajJianE4SDNIaEdnUGVM?=
 =?utf-8?B?d1ZibThlZElvUzJmam82T1dDZ0JwVVo4V0t6eklkTEFsci9MQWtEaDlNajQ5?=
 =?utf-8?B?R1lRdHNlNmZtTFVucmZIZi83bGR2c0ErVVA4Wk9NZldrYkxQMW8xM1poVlJW?=
 =?utf-8?B?K2o1MnMzL2k2anBRSTlKVFZyQ3ZoRjFRcmI1ZnFnclVhdkpqdlp4ZXEydmFV?=
 =?utf-8?B?aWV3L2g3N0o5VjJhSFZTTHd6bEdyckRKU0N0WG9WQzh6YlVQVURJV0hMVElM?=
 =?utf-8?B?WG1kcHVVRmsyeWMxYjcwdFl1dkJEQ05CNmRTMDBtMExTMnViVVNXUXN3cUs2?=
 =?utf-8?B?U0hyb0twQVRZRnAvQ1pXckIxS2QvWlp2SXRDNDV6KzN4a3ByTS8reDZ3ejJa?=
 =?utf-8?B?ZUVIY3Z4YmhwZkp0WDBhclpOcmoxYnp4Um40aU1yZHd0QXhkNzhRbDdxcExv?=
 =?utf-8?B?ZHVXeU5obWplS2xSVkg3eXhSVXdxcVdqSWlwRTZ5aVZMNUhVMHlRc1NOcXpi?=
 =?utf-8?B?Nm9lQzdzSDRiNVI5eDd0Y2FoTlJrM0w0R3d0bzJLZEIxNXMzSEFIVFZtMEhB?=
 =?utf-8?B?UE9pT01xQkpjRTVacFBiNEQyZ0J0RU5JV3k1U0pZM1VoUktFR3N2KzhwM3Bt?=
 =?utf-8?B?WUR1MjFpTlY2WWtpUndKbHBJZ0MyakF2b3ZJRzdHT3VDT050VjRZZ1dGOXVO?=
 =?utf-8?B?THhPRGpqbjNrZlFqdjVXZVY4eW1ZSUhydzlDOUpHdCtmb0FzRXorTW5Xa1ZT?=
 =?utf-8?B?UUpTL1ZLRUk3Y1VxTGp1RjIra05PTzRCNHpTMjB4ZVl2VU1EMEU4cng3Ly80?=
 =?utf-8?B?dFAvRFU3TllGV2lmUlVKcW1weXJZZXBPVmVIanVBSHY2NGF1RXNrWW1KWVBN?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede6c21b-e79b-4354-d1bc-08dab23461d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 00:45:27.7067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnEjfZ5fQTtsjlnn7uYmtfT87j6TjC9SF9Bncr93q7VoqhrImC/IQdj0LOPTkrOateaLGHfR1UGoePPIx1oSpyp6AHGptsewkEcL+Bj3uhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6146
X-Proofpoint-GUID: t7s9mBySFioIaINygoggCIrEMSlhI_0-
X-Proofpoint-ORIG-GUID: CzvfgWJ2h_V0zonMArfYGCmlfWLZ5t4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_12,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=938 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210200001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 00:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171986

On 2022-10-18 06:25, Ross Burton wrote:
> On 18 Oct 2022, at 01:14, Randy MacLeod via lists.openembedded.org <randy.macleod=windriver.com@lists.openembedded.org> wrote:
>> The distribution terms of the Agafari fonts as described in
>> data/consolefonts/README.Ethiopic is:
>>
>> Agafari:
>>   Donated by the Ethiopian Science and Technology Commission
>>   <ncic@padis.gn.apc.org> or <ncic@telecom.net.et> and may be redistributed
>>   for non-commercial use under Unix environments only.
>>
>> so package them seperately to make it easier for affected users
>> to avoid installing the fonts.
> Looks like you need special per-package LICENSE variables set to people can identify this programatically.

Indeed.

v2 will show up at some point, maybe even this week.

../Randy

>
> Ross


-- 
# Randy MacLeod
# Wind River Linux


