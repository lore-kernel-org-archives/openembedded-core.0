Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AEEC3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 07:45:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13181.1704267909861154096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 23:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Y6BJ/T5o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17322eae69=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4036m0sK024518
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jan 2024 07:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=anw3t+BIGA5aJXx9SNL
	L1qw1d8vSJxeDxTGzDJATq2M=; b=Y6BJ/T5o+qco2rMYebpz+1njZGcNqI3iZS+
	q2cLY3Rmg5901C6wGRK/Es96moXdJ5wLm/1CrLDUCzZcd4zrCt5enJ1QMlkfQCns
	+kbYFmZE5E7qSat/map90wCqAmxogoat0U4VB5w2/BnL1pkIR+rMnMni7FX5ArTc
	V3ddmkabz4L/tezU8BdSO3YotQF/cElW+cYwyqOTbyJjs9LsFz3uFjPl/T8LB6Yr
	NVlUTJ45D9kdY+3AHwPuEWAr6uOrGhjk4rIsd+Hk09VYJcdHrhRIoXWRp7wHJTd7
	XseWgJaF6Zi6vh6gMt0kXolF4CUV+A7u0Q5xihwtc00MJqTiD7g==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3va8dxc21p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 07:45:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BR3FYDtwDSLP7PiakySJg4uUts+aqwv87x/29p6SyKITpfR5b/f8gPRqgE6xEP7bgQCBWcHqjODXtDWfkxs0GRK6kSbN+Fr7S6qSpjlQVYkkCgTbIlKUFFIh4fO6W1Cyyc7K0iT8ZL26ytQrHXC0Djle1GpInHDTBKRSWeZUnr5mH8vTm/qfOp3l0oJZOzYZGoUmZ2Gqr2ODZ/65XUbcJrDu6cSwyAfkD1QoRA/jT7VjA/ZZgpEC3oyo0NciBVPrqbFlPj7P9TmzMn+HWd20x+D0u0towhTJfVcSKwvpGDFMvVg4na3bdmEAG7m6ocVoKQskQS9FHMIoHiTzsS6O0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anw3t+BIGA5aJXx9SNLL1qw1d8vSJxeDxTGzDJATq2M=;
 b=WEp39hmBe8iJCqPtI0MhJ7fcOVQhFybqJgW8fwKMAuQ8V0D+ufqb7cs4p5BPPXoCrVcs1W6rRDI4BcoEVqwmAU/6nqDT78rm1VLDNzULFlwBPzV6B1yVRyV2gm5m3LUWCHp1xyzVnrdVHdCU0BMuzGWcooiSszNhZGaJUDOGPaPUePA/R2d6DOOjbd9GCviWq1h+VJbxtaEc4FGJWlFovgbTSlqBDSYQzM6s9APe5uFnYsbVffg3jhyCJfTXfWIjwGZidqX/q2rA+C8GNGb2mI9HfeOn8bWDBqZCJw+ZZudJlPbnzL681j2VRTNllr5ArC3EqFgXwQ+tNpA2gDA8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 07:45:05 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 07:45:05 +0000
Content-Type: multipart/alternative;
 boundary="------------0YhDnh990Uc000ZdQUzXbJno"
Message-ID: <7861b680-41c6-9a1e-808a-91a75afcf58f@windriver.com>
Date: Wed, 3 Jan 2024 15:44:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] debugedit: add UPSTREAM_CHECK settings
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20240102083755.316126-1-Qi.Chen@windriver.com>
 <CANNYZj97wWSw-uyEUEppnkXQZ6XROr3BWoCz0KanmMknUTcF4w@mail.gmail.com>
 <06339c1f-9523-71f0-a6da-0b627ae1d480@windriver.com>
 <CANNYZj8URXrhQm3i=xZb+R0n8tZg3C5tzd1jRD-DBEzygX06rA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj8URXrhQm3i=xZb+R0n8tZg3C5tzd1jRD-DBEzygX06rA@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 95173193-836a-427e-d478-08dc0c2fe6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EHmD4byh5qBf3FmF3xnzS8byw3pA034B3Dsx0LdPww0RwdWcG6NckiYcqEtFZf9cLqxCGZ5MjIFgxOH6AvBRY+WhYLrGk9sw6+RTqCpZdEizmJUVQqs4zA7UadtY21NRlQoAntHtL2xuvs4nQW+Dk7r+F/w+YJsIK6xI3OkJgH07lQ4Zn5FearfSCtuItERlEH3t4naEjgZvgRqDGO4con6/T+ahy3JWK0Yb5EcPmNAdOmOx3kHi71wgFJQ1YHTHzFD0r4AoRLwSzizbG/etg5sGz+GUR5/gL6NJpPxpe7TQCCjf8eW62qPbwpXFEoj/D0jx+dmA4qANR+2i4Gi0u6m1a0A0J5lIocoVb/wHSpk3TRD4INVqKqWA32zjF3nAunOFIwCs1/el/gmPEqPkdTSuVnyF/8KAIrwMGQ0A1aDxlV3HvdCoq9qLAgJHhydjNmIXhltxDkBS2DGyFx8jQHV1udFgy2f+OITUh0yCsAvirwiSkANfbzoWagJBnuqgw79gFev9VV+HkEIKEQ7V9fgC0GDn0f6rQj+DG6xZ+qnt6suE1+elmgft3Dm3JmJ7hgwmG3VJsEcmqIBA3hCCeJ4rN5Hf+o9WVw1vz8MDwKQVDyU607nWeQCcsAB3OlKlLmGpWYfVGjoliGwyZd4M7w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(376002)(396003)(136003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6512007)(83380400001)(26005)(33964004)(2616005)(6506007)(8936002)(8676002)(5660300002)(53546011)(66946007)(41300700001)(966005)(6486002)(478600001)(6916009)(316002)(2906002)(66476007)(66556008)(86362001)(31696002)(38100700002)(36756003)(166002)(6666004)(31686004)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2dtMTJOSWRnQ2FlYkNGaHhvek1CZHFHWTJMZ21McTRkSmo4N29Wd3dObmtj?=
 =?utf-8?B?SXNKQjZxeHM3dS9sd085Sng5M1hpaHYzaE1wZXRKQ2c2RlNES2VDZTVkQVpC?=
 =?utf-8?B?SDJ1d3kwam8wODNBalpTRmRBZFl1aC9nb3V5QUxZTnVFSlBpRWVFZ1JrVXZt?=
 =?utf-8?B?Wm5PaGJKUnJnQWJibUYxZFh6UkYwWEViYmI0NklrOTlkVm9Fc1ZwdFlLSms5?=
 =?utf-8?B?anFidEEvL1JDRmZoblBMTTJuTFRyT0RwVzVvQmU5OTI4WWJFN0pYaFFIZ2hr?=
 =?utf-8?B?TjFYS2Niem0zamRNUVhibDd6QkwxU2d4R2c2SVFCRC8zdmVyKzExTUlDSU9G?=
 =?utf-8?B?ZUxDeGVKeGJoR2NCalZDM3JqYk1USndjMGhCbm1yUkZMWHMxVFowRHlGM3Zq?=
 =?utf-8?B?QlB5QkppMHNlb0tYV2JCT2xkclhOOFRsS2FzZWZkV2dOZEpZRUhBclI2WGtn?=
 =?utf-8?B?bUp0bHNBOWtYQ2FQK2I1ZkdwQStXYjQxQ214Q3luWVcreldNYnNUTkF0Z1Ba?=
 =?utf-8?B?Z2lSWGVMK0paREJETTcwYUNGcm5QUEZsQklrbXArY1dkK2IvenJTdUZudndQ?=
 =?utf-8?B?alV5TTZQTWRBYnpUMzNmbXBXOUFleDZxMUc4MUgxZWp2RmNJSWtnemZqaDlC?=
 =?utf-8?B?WUJCbmRtNzh0YXQ2aWIxZDg3bzNVVlV0bGdmTmMxejRUMEJ0OE0vUlhxYTY5?=
 =?utf-8?B?RExvV296T1BBbVFKdGk0aUViL3VDZDErTFlPR1UyekV5bXV2cGl4RXdoellt?=
 =?utf-8?B?QzMxSytjTjFzaVJLZVJsSFFZbXNyTkhtLzlMQy96RXR3cGJmWTVtaHBmNGs0?=
 =?utf-8?B?UXBxZ0lzM2VBaFJuaFRjWHZyM09Tb3BwUkpiSDBacDFnRnlEei8ycWE2MVVB?=
 =?utf-8?B?QlFGNW95TmJySVp3Nk1SbHE3bURIZXlCRkUydkxDRmN3T25RSUsyMW9sYW83?=
 =?utf-8?B?cEgrRnNHTDQ0UEN5QmYvazlTVVRkVE1LWnUwbXJsdmlvL2RrV2NwbW02a051?=
 =?utf-8?B?UDZQWDh2eG1MVzVrTCtPN25DWmtmMGY5RWdsZzN3QUJZT2JZclk4bzg2UzVs?=
 =?utf-8?B?L2JhM2JQZTJJV054T05obWdBOTRvTmdCckQ4ZlVmWm51V0JDV0x0N1lOM3FN?=
 =?utf-8?B?UlZFaFlRZGFtcHkrSE5qRDFwYzZSMndNaVRNbFRSUmVXTU0vVnpmNVBLTlFt?=
 =?utf-8?B?czRtZ3Y3MWhPVWhCd3RkSG5DMWh6eEtPbmVHdmtXUmE4ZWR2aWRKLzFvZWM4?=
 =?utf-8?B?RlMxbWRQdlladUxjYUh2VU9OckxyUlExb2FxLzZCM2x5MllOaVlBaHUvenlo?=
 =?utf-8?B?T3pwRERNRHpXaGJTRkVXa3hzNTJSTDNhRmpiUzhPcVl0dlBaM0FwYkhGV2FE?=
 =?utf-8?B?cFRuTU5wT0lpc1lITjhvZGRuWi8wQUE2RjlqRXZsdWlROW5BaWZjeVY1QXds?=
 =?utf-8?B?SVBvYW5KdVBBN2JxN3p6by84Nzkvc0ZOcTU0L2V1QVVUS0licUx5Wk1Tdjgr?=
 =?utf-8?B?Z0ZWZkg1am94TEJnWUhmbE1xelJrMUk5cVBLKzdMbTJraFhJT25FKzJpSTZa?=
 =?utf-8?B?aElGdWZCTnUzbXRKQVZMc1RHMUtXWlJzWURZem15Q0hoZE11dE1HTnl0MW1N?=
 =?utf-8?B?TWwreFd6aEVibVNEN1MwU1UvSFp6bVVEOUFLZExzaVMxQngzV3p0UWg3dnVZ?=
 =?utf-8?B?SytYT2JaMWtBbUFBMnRJcUhqT3c2TnNDR2g3eGRBaWIrSHV1dlRVNUdrUi9k?=
 =?utf-8?B?SGpTcE9UTmVTNTlDM1dwaW1NSHdyTjRDaXd6Uk42akRpUUdkRHF4ZmgxRDdj?=
 =?utf-8?B?SlZweVVJNkNEY1ZSazhITkc4b3VTOEVuOXFKbm9oUWFaNFhvMXFpbEhtNW8v?=
 =?utf-8?B?eHM4dlFxSmxDbGRGOEFINGZnOFNCQUpiUGd0ZXY5azVMMjZsUUVHQ0gyZFJJ?=
 =?utf-8?B?ZjVxRUpJWTZ2eGhUMk5nVWRCSHlVblhESlIxUjVNTXlXYUFQajRkZnViNUt6?=
 =?utf-8?B?YjROb0gybGJTZGFBVGd3SDlYZUhrZXlJQy9FdjF2REVsdXlrNmV6NEk1eEpx?=
 =?utf-8?B?MjFNWEY2NGZKYTFLK0NHZFk2Y0o5bHVFY0FmaisrUTRCMk93M3dhbExkSHhC?=
 =?utf-8?Q?3sGwD8l6OLCj1MgiRL5+gHv/G?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95173193-836a-427e-d478-08dc0c2fe6b7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 07:45:05.5416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2b5LzfYarSliruUfrv0ro2lw4SlUjScOuezAp9l3/+PzS1uuvMf8CaJzlrj5WdCPb+ffN02kSAEIkH12zX0StA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7828
X-Proofpoint-GUID: -cbHUxRIZf_Q3j3GVRicu8mkd4VlS0C-
X-Proofpoint-ORIG-GUID: -cbHUxRIZf_Q3j3GVRicu8mkd4VlS0C-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401030063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 07:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193273

--------------0YhDnh990Uc000ZdQUzXbJno
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4036m0sK024518

On 1/3/24 15:21, Alexander Kanavin via lists.openembedded.org wrote:
> This works as expected. What made you think it=E2=80=99s broken and nee=
ds=20
> changing?
>
The 404 ERROR that 'devtool check-ugprade-status' prints out to me=20
unconditionally, which is all upper case to catch people's notice and=20
can't be avoided by any option.


> Alex
>
> On Wed 3. Jan 2024 at 3.47, ChenQi <Qi.Chen@windriver.com> wrote:
>
>     On 1/3/24 00:54, Alexander Kanavin wrote:
>     > The check already works, at least for me it correctly checks
>     both the
>     > top level directory and the 'latest' directory:
>     > ...
>     > --2024-01-02 16:51:30-- https://sourceware.org/ftp/debugedit/
>     > ...
>     > --2024-01-02 16:51:30-- https://sourceware.org/ftp/debugedit/5.0/
>     > ...
>     > INFO: debugedit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A05.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MATCH =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0Chen
>     > Qi <Qi.Chen@windriver.com>
>     >
>     > What does devtool output for you, without the patch?
>     >
>     > Alex
>
>     The command and output are as below. Pure poky master. No local
>     patches.
>
>     $ devtool check-upgrade-status debugedit
>     NOTE: Starting bitbake server...
>     NOTE: Reconnecting to bitbake server...
>     NOTE: Retrying server connection (#1)... (18:44:43.533538)
>     Loading cache: 100%
>     |##################################################################=
#########################################################|
>
>     Time: 0:00:00
>     Loaded 1848 entries from dependency cache.
>     --2024-01-02 18:44:46-- https://sourceware.org/ftp/debugedit/
>     Resolving sourceware.org <http://sourceware.org> (sourceware.org
>     <http://sourceware.org>)... 8.43.85.97,
>     2620:52:3:1:0:246e:9693:128c
>     Connecting to sourceware.org <http://sourceware.org>
>     (sourceware.org <http://sourceware.org>)|8.43.85.97|:443... connect=
ed.
>     HTTP request sent, awaiting response... 200 OK
>     Length: 2602 (2.5K) [text/html]
>     Saving to: =E2=80=98/tmp/wget-index-e1dsj90e/wget-listing-vrofeac4=E2=
=80=99
>
>
>     2024-01-02 18:44:46 (330 MB/s) -
>     =E2=80=98/tmp/wget-index-e1dsj90e/wget-listing-vrofeac4=E2=80=99 sa=
ved [2602/2602]
>
>     --2024-01-02 18:44:46-- https://sourceware.org/ftp/debugedit/5.0/
>     Resolving sourceware.org <http://sourceware.org> (sourceware.org
>     <http://sourceware.org>)... 8.43.85.97,
>     2620:52:3:1:0:246e:9693:128c
>     Connecting to sourceware.org <http://sourceware.org>
>     (sourceware.org <http://sourceware.org>)|8.43.85.97|:443... connect=
ed.
>     HTTP request sent, awaiting response... 200 OK
>     Length: 1353 (1.3K) [text/html]
>     Saving to: =E2=80=98/tmp/wget-index-qwu98rgj/wget-listing-8esd1gn0=E2=
=80=99
>
>
>     2024-01-02 18:44:47 (179 MB/s) -
>     =E2=80=98/tmp/wget-index-qwu98rgj/wget-listing-8esd1gn0=E2=80=99 sa=
ved [1353/1353]
>
>     --2024-01-02 18:44:47-- https://sourceware.org/ftp/debugedit/sha512=
/
>     Resolving sourceware.org <http://sourceware.org> (sourceware.org
>     <http://sourceware.org>)... 8.43.85.97,
>     2620:52:3:1:0:246e:9693:128c
>     Connecting to sourceware.org <http://sourceware.org>
>     (sourceware.org <http://sourceware.org>)|8.43.85.97|:443... connect=
ed.
>     HTTP request sent, awaiting response... 404 Not Found
>     2024-01-02 18:44:47 ERROR 404: Not Found.
>
>
>     >
>     > On Tue, 2 Jan 2024 at 09:38, Chen Qi via lists.openembedded.org
>     <http://lists.openembedded.org>
>     > <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>     >> From: Chen Qi <Qi.Chen@windriver.com>
>     >>
>     >> Add UPSTREAM_CHECK_URI(REGEX) to allow for checking new releases
>     >> for debugedit recipe.
>     >>
>     >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>     >> ---
>     >>=C2=A0 =C2=A0meta/recipes-devtools/debugedit/debugedit_5.0.bb
>     <http://debugedit_5.0.bb> | 3 +++
>     >>=C2=A0 =C2=A01 file changed, 3 insertions(+)
>     >>
>     >> diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb
>     <http://debugedit_5.0.bb>
>     b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
>     <http://debugedit_5.0.bb>
>     >> index 63ad7babd9..3a596f5fea 100644
>     >> --- a/meta/recipes-devtools/debugedit/debugedit_5.0.bb
>     <http://debugedit_5.0.bb>
>     >> +++ b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
>     <http://debugedit_5.0.bb>
>     >> @@ -9,6 +9,9 @@ LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
>     >> file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
>     >> file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504"
>     >>
>     >> +UPSTREAM_CHECK_URI =3D "https://sourceware.org/ftp/debugedit/"
>     >> +UPSTREAM_CHECK_REGEX =3D "(?P<pver>(\d\.\d))/"
>     >> +
>     >>=C2=A0 =C2=A0SRC_URI =3D
>     "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz
>     <https://sourceware.org/ftp/debugedit/$%7BPV%7D/debugedit-$%7BPV%7D=
.tar.xz>"
>     >>
>     >>=C2=A0 =C2=A0SRC_URI:append:libc-musl =3D "\
>     >> --
>     >> 2.34.1
>     >>
>     >>
>     >>
>     >>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193272):https://lists.openembedded.org/g/openembedd=
ed-core/message/193272
> Mute This Topic:https://lists.openembedded.org/mt/103478272/3618072
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------0YhDnh990Uc000ZdQUzXbJno
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4036m0sK024518

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 1/3/24 15:21, Alexander Kanavin via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj8URXrhQm3i=3DxZb+R0n8tZg=
3C5tzd1jRD-DBEzygX06rA@mail.gmail.com">
     =20
      <div dir=3D"auto">This works as expected. What made you think it=E2=
=80=99s
        broken and needs changing?</div>
      <div dir=3D"auto"><br>
      </div>
    </blockquote>
    <p>The 404 ERROR that 'devtool check-ugprade-status' prints out to
      me unconditionally, which is all upper case to catch people's
      notice and can't be avoided by any option.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj8URXrhQm3i=3DxZb+R0n8tZg=
3C5tzd1jRD-DBEzygX06rA@mail.gmail.com">
      <div dir=3D"auto">Alex</div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed 3. Jan 2024 at 3.4=
7,
            ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" moz-do-no=
t-send=3D"true" class=3D"moz-txt-link-freetext">Qi.Chen@windriver.com</a>=
&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">On
            1/3/24 00:54, Alexander Kanavin wrote:<br>
            &gt; The check already works, at least for me it correctly
            checks both the<br>
            &gt; top level directory and the 'latest' directory:<br>
            &gt; ...<br>
            &gt; --2024-01-02 16:51:30--&nbsp; <a href=3D"https://sourcew=
are.org/ftp/debugedit/" rel=3D"noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true" class=3D"moz-txt-link-freetext">https://sourceware.org/ftp/d=
ebugedit/</a><br>
            &gt; ...<br>
            &gt; --2024-01-02 16:51:30--&nbsp; <a href=3D"https://sourcew=
are.org/ftp/debugedit/5.0/" rel=3D"noreferrer" target=3D"_blank" moz-do-n=
ot-send=3D"true" class=3D"moz-txt-link-freetext">https://sourceware.org/f=
tp/debugedit/5.0/</a><br>
            &gt; ...<br>
            &gt; INFO: debugedit&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;5.0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;M=
ATCH&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Chen<br>
            &gt; Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D=
"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Qi.Chen=
@windriver.com</a>&gt;<br>
            &gt;<br>
            &gt; What does devtool output for you, without the patch?<br>
            &gt;<br>
            &gt; Alex<br>
            <br>
            The command and output are as below. Pure poky master. No
            local patches.<br>
            <br>
            $ devtool check-upgrade-status debugedit<br>
            NOTE: Starting bitbake server...<br>
            NOTE: Reconnecting to bitbake server...<br>
            NOTE: Retrying server connection (#1)... (18:44:43.533538)<br=
>
            Loading cache: 100% <br>
|########################################################################=
###################################################|
            <br>
            Time: 0:00:00<br>
            Loaded 1848 entries from dependency cache.<br>
            --2024-01-02 18:44:46--&nbsp; <a href=3D"https://sourceware.o=
rg/ftp/debugedit/" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">https://sourceware.org/ftp/debuged=
it/</a><br>
            Resolving <a href=3D"http://sourceware.org" rel=3D"noreferrer=
" target=3D"_blank" moz-do-not-send=3D"true">sourceware.org</a>
            (<a href=3D"http://sourceware.org" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">sourceware.org</a>)...
            8.43.85.97, <br>
            2620:52:3:1:0:246e:9693:128c<br>
            Connecting to <a href=3D"http://sourceware.org" rel=3D"norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">sourceware.org</a>
            (<a href=3D"http://sourceware.org" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">sourceware.org</a>)|8.43.85.97|:443...
            connected.<br>
            HTTP request sent, awaiting response... 200 OK<br>
            Length: 2602 (2.5K) [text/html]<br>
            Saving to: =E2=80=98/tmp/wget-index-e1dsj90e/wget-listing-vro=
feac4=E2=80=99<br>
            <br>
            <br>
            2024-01-02 18:44:46 (330 MB/s) - <br>
            =E2=80=98/tmp/wget-index-e1dsj90e/wget-listing-vrofeac4=E2=80=
=99 saved
            [2602/2602]<br>
            <br>
            --2024-01-02 18:44:46--&nbsp; <a href=3D"https://sourceware.o=
rg/ftp/debugedit/5.0/" rel=3D"noreferrer" target=3D"_blank" moz-do-not-se=
nd=3D"true" class=3D"moz-txt-link-freetext">https://sourceware.org/ftp/de=
bugedit/5.0/</a><br>
            Resolving <a href=3D"http://sourceware.org" rel=3D"noreferrer=
" target=3D"_blank" moz-do-not-send=3D"true">sourceware.org</a>
            (<a href=3D"http://sourceware.org" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">sourceware.org</a>)...
            8.43.85.97, <br>
            2620:52:3:1:0:246e:9693:128c<br>
            Connecting to <a href=3D"http://sourceware.org" rel=3D"norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">sourceware.org</a>
            (<a href=3D"http://sourceware.org" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">sourceware.org</a>)|8.43.85.97|:443...
            connected.<br>
            HTTP request sent, awaiting response... 200 OK<br>
            Length: 1353 (1.3K) [text/html]<br>
            Saving to: =E2=80=98/tmp/wget-index-qwu98rgj/wget-listing-8es=
d1gn0=E2=80=99<br>
            <br>
            <br>
            2024-01-02 18:44:47 (179 MB/s) - <br>
            =E2=80=98/tmp/wget-index-qwu98rgj/wget-listing-8esd1gn0=E2=80=
=99 saved
            [1353/1353]<br>
            <br>
            --2024-01-02 18:44:47-- <a href=3D"https://sourceware.org/ftp=
/debugedit/sha512/" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">https://sourceware.org/ftp/debuged=
it/sha512/</a><br>
            Resolving <a href=3D"http://sourceware.org" rel=3D"noreferrer=
" target=3D"_blank" moz-do-not-send=3D"true">sourceware.org</a>
            (<a href=3D"http://sourceware.org" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">sourceware.org</a>)...
            8.43.85.97, <br>
            2620:52:3:1:0:246e:9693:128c<br>
            Connecting to <a href=3D"http://sourceware.org" rel=3D"norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">sourceware.org</a>
            (<a href=3D"http://sourceware.org" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">sourceware.org</a>)|8.43.85.97|:443...
            connected.<br>
            HTTP request sent, awaiting response... 404 Not Found<br>
            2024-01-02 18:44:47 ERROR 404: Not Found.<br>
            <br>
            <br>
            &gt;<br>
            &gt; On Tue, 2 Jan 2024 at 09:38, Chen Qi via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank" moz-do-no=
t-send=3D"true">lists.openembedded.org</a><br>
            &gt; &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.open=
embedded.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt=
-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
            &gt;&gt; From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windrive=
r.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">Qi.Chen@windriver.com</a>&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; Add UPSTREAM_CHECK_URI(REGEX) to allow for checking
            new releases<br>
            &gt;&gt; for debugedit recipe.<br>
            &gt;&gt;<br>
            &gt;&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen=
@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">Qi.Chen@windriver.com</a>&gt;<br>
            &gt;&gt; ---<br>
            &gt;&gt;&nbsp; &nbsp;meta/recipes-devtools/debugedit/<a href=3D=
"http://debugedit_5.0.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not=
-send=3D"true">debugedit_5.0.bb</a>
            | 3 +++<br>
            &gt;&gt;&nbsp; &nbsp;1 file changed, 3 insertions(+)<br>
            &gt;&gt;<br>
            &gt;&gt; diff --git a/meta/recipes-devtools/debugedit/<a href=
=3D"http://debugedit_5.0.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">debugedit_5.0.bb</a>
            b/meta/recipes-devtools/debugedit/<a href=3D"http://debugedit=
_5.0.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">de=
bugedit_5.0.bb</a><br>
            &gt;&gt; index 63ad7babd9..3a596f5fea 100644<br>
            &gt;&gt; --- a/meta/recipes-devtools/debugedit/<a href=3D"htt=
p://debugedit_5.0.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">debugedit_5.0.bb</a><br>
            &gt;&gt; +++ b/meta/recipes-devtools/debugedit/<a href=3D"htt=
p://debugedit_5.0.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">debugedit_5.0.bb</a><br>
            &gt;&gt; @@ -9,6 +9,9 @@ LIC_FILES_CHKSUM =3D
            &quot;<a class=3D"moz-txt-link-freetext" href=3D"file://COPYI=
NG;md5=3D59530bdf33659b29e73d4adb9f9f6552">file://COPYING;md5=3D59530bdf3=
3659b29e73d4adb9f9f6552</a> \<br>
            &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://COPYI=
NG.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1">file://COPYING.LIB;md5=3D2=
d5025d4aa3495befef8f17206a5b0a1</a> \<br>
            &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://COPYI=
NG3;md5=3Dd32239bcb673463ab874e80d47fae504">file://COPYING3;md5=3Dd32239b=
cb673463ab874e80d47fae504</a>&quot;<br>
            &gt;&gt;<br>
            &gt;&gt; +UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://sou=
rceware.org/ftp/debugedit/" rel=3D"noreferrer" target=3D"_blank" moz-do-n=
ot-send=3D"true" class=3D"moz-txt-link-freetext">https://sourceware.org/f=
tp/debugedit/</a>&quot;<br>
            &gt;&gt; +UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;(\d\.=
\d))/&quot;<br>
            &gt;&gt; +<br>
            &gt;&gt;&nbsp; &nbsp;SRC_URI =3D &quot;<a href=3D"https://sou=
rceware.org/ftp/debugedit/$%7BPV%7D/debugedit-$%7BPV%7D.tar.xz" rel=3D"no=
referrer" target=3D"_blank" moz-do-not-send=3D"true">https://sourceware.o=
rg/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz</a>&quot;<br>
            &gt;&gt;<br>
            &gt;&gt;&nbsp; &nbsp;SRC_URI:append:libc-musl =3D &quot;\<br>
            &gt;&gt; --<br>
            &gt;&gt; 2.34.1<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; <br>
            &gt;&gt;<br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#193272): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/193272">https:/=
/lists.openembedded.org/g/openembedded-core/message/193272</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/103478272/3618072">https://lists.openembedded.org/mt=
/103478272/3618072</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------0YhDnh990Uc000ZdQUzXbJno--

