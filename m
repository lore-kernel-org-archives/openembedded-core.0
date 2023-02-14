Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0189C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 11:28:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4423.1676374109706025132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 03:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XrtR7qgd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14097dbe8b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E9t3tO006115
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 11:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=5JDgmEm4o3lsVq1YI3bLcBJeHh/HX4dkQMHEGeygve0=;
 b=XrtR7qgdGcMFCoL87Ln4zBbK5xiNJbvoUog3eWZTC1wR0GiUHO5tRK4PtFNFhLOpmQns
 V5AzbT0aCgar2rWxARIOmtEe1fVcETkWmrZwC8iJuiAOMw4njbwPBkGqkRTBWOe2hZyk
 4dC4Un6r+MT1jzIulCA5UsoElsKxJr4rx2wGYVX/jyFiczTfKXrAyqHINPlmmGdtw7oE
 2C71bUxONKWIovN4vQcVqodikhf6PoaSBOIbtfHwXn9cQNTWaXJPFYoObQPsoMtsvIyl
 8+jZkJOe539eD3sXmGl1G/wOPuUyXj55s/SuV9mgISzKdddqgp6RHlGBsGZgDr3HdsPW vg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np20a2ju5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 11:28:28 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31EBSSqJ011347
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 11:28:28 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np20a2ju4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 11:28:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpKHgo5w5sz/erLvdR/00frhYR0/Yn1E6hZivwh3lIs7VXJCCffbT0nrpoLnR2HSMmBj47CmoFA9ED+manZvoou4iiIawYYKJo15cp9yi87aJ+tyorO0dq24mWNuPtZdYJF+MaevYWBNIAdFhO5+gWP+T2BzOl1W8aqnRRkjKtCxtRpUeKFkebFJugqdDrULkXs8WnJYvuHqvMC2ruxcBTpFJuXlnYZYTIs5VbCewspt0K5ActJb6Cjp3J5ii914cmx/Uxa7VFQIa0LPGoeTrWS2ZnBN7+jPsCC/JIn8ddB5uUWl4fKEOz0ITVt1IiwlxhCYa7L04Gg5rqQN7j/CUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JDgmEm4o3lsVq1YI3bLcBJeHh/HX4dkQMHEGeygve0=;
 b=PG//W9XFMdSevCcwdqxMUBspVOYmkO0LOQUXxLTuD92tUg6ZX5zy1McFgEv9HkqugMeya5NupU01FNciPnQeqZ7R5ScRNN9ZyFOWu9soBxAkoJzTZEuw4zblG8QUuUhKuhxBZr+jL+S+tqCHlW7adRe9nTWi4yaa78+vhSYUuYf2mYsIQO3+/P01080+IhCEpyR+MWF4/dNfnQWJZM/cPxMUMDbZwEH/o6YMCD3mAgcJ/puPHiWkLBKY4gWHhXWZ12Ee+c0m7gjOZJ1CWYDI4rb1w+dMCg8x2FnJbRXhVMSQc2xs5lhbeJaIHVOBN6r4eI6WdX7F+gRBFDG3fHfQxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by PH7PR11MB6793.namprd11.prod.outlook.com (2603:10b6:510:1b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 11:28:25 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::144c:b47b:a51a:b602]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::144c:b47b:a51a:b602%3]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 11:28:25 +0000
Message-ID: <b910ec70-09a5-cc92-5fd3-f222bf4843d6@windriver.com>
Date: Tue, 14 Feb 2023 19:28:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [OE-core] [PATCH 1/1] rootfs.py: Set PACKAGE_FEED_ARCHS when it
 is not defined
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <cover.1676363203.git.liezhi.yang@windriver.com>
 <6d40f0d943ede3088c8a3f77ef2ee1b7442ddda3.1676363203.git.liezhi.yang@windriver.com>
 <ff0ea75fcce5de13f380fb9fa3abaa80d1cb2506.camel@linuxfoundation.org>
 <4e074d0e-a609-9c16-d11c-0cc285c16216@windriver.com>
 <CANNYZj_PLXE1S8ssawoPbATF04qiSyW_8J83puKnLQ5u28Gx_w@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj_PLXE1S8ssawoPbATF04qiSyW_8J83puKnLQ5u28Gx_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|PH7PR11MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: cc6e0948-deb2-4e96-b368-08db0e7e960e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XFo8AC67KKuqXHIH2EOvXkbICK9+zj493vssN+kStRhlpAAJojbygVTB7QFyYUpvmaoBpHIZo3e3hjUHABcD60tZFWZNmulJq40+qzp9qxmviWwE8Xt4hP0UGaY3LZChcD3eIIC2/qCIefcffyrNbWmFRxFeHu2cWuQ6C/p5BFpBZ3LPGAwrfJ1ArMtkZCI3PoaaMawvLLqyk8RPdFcpeXnrZ5TkJuzhjBsiz11l3TNTzABTWVfOcY5yo6hUKBBh28N4z31IzphoFr/cwzfU0T8cHmgIOPZdI5+qGoy/yMO/4sCRuXJf7qVB3Ipergf+kw8NrEfvXQ1fpRFw+Jlc4oColalssQOTE/+P+Y9s6I2YrYto0kz0Y5tC/gybRmB+PnOpKBq4tAOUFCEScFaWGvJBjuz/8aPAlXOG8dInHPWGRTHZ9oBbNJsyE81X1jNl0BlOYF627G00i+8KDAUZgqMULz2WtvYI9DEnnkRwiofvhWjvFLujcQQxGO1RiI+7X66UP9oH8Nkh+TvyjTyg+9dRw+tijrkwaMK8iaadC+QUGl6BSyRH5fF5XH+tQePeVWV0W3MCpJyGwaMLYo8kt8tfYNrL27cXKlVv3+XOa8ZjkpyOFc+94Qzu/QAEHC760IGV/hfjbOIGVBxGUPX7O3zEBCNYajViBg2w1yGhGYDu0JpuB+Ehdl6IcR0paCPbS8wi3VnOIX+c49dz0dFOgVWgx6DD+Kex4vkRyP5p1xl2q1rpYZpLkwNjsE98vbQc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199018)(5660300002)(6666004)(6506007)(53546011)(2616005)(26005)(478600001)(6512007)(186003)(31696002)(83380400001)(66556008)(6916009)(36756003)(66946007)(4326008)(8676002)(8936002)(66476007)(316002)(38100700002)(6486002)(86362001)(41300700001)(31686004)(2906002)(9126006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3Uyb2dWSW56bUVCbFIzTzlERzlTYVZUZU54alJibVNQRHl0Wm84aFpjL3p4?=
 =?utf-8?B?YXBIcS8vVGhSQklLNDZHNHk0K1g0VStnMmpHT0MwRFVvaVdvR0JQdDBSTHVn?=
 =?utf-8?B?cm4ySVBMTUNQSFk2RVVjZEtDZWQ3alhEb1kzMGxRNE8rTXNSdm5oTVhlaXN0?=
 =?utf-8?B?MERuaHc1OEFuYmJnNWVoeXFTdWhvRE5aQXk2R1lWcUVrczZQdm1VVlpEQTQv?=
 =?utf-8?B?RWoxRi9vcmxlR3lwbUFEZjQ5bVQ1aVRiYXhCWmxCeGNtSUxGUUk1N2k3ZSsr?=
 =?utf-8?B?VFFXeHdUVCtRUEdYQk0wY2RnSHFaOThFeVlzOUlncDhxWkpQWGgyMDdwbHFI?=
 =?utf-8?B?U2ZxZjVRakwzWVpCYlVVK3RPUnVpT1IxMHFnOU5mQ25oeTBnK0NIREJNVFJF?=
 =?utf-8?B?OUlVUXh1d1FHZVRzdHdJWk1jVW45WG1ISFpGUHN4eTBjUkpZaHFkUjkzL3RR?=
 =?utf-8?B?aEk5UkdUSjZRQzZCbmxidlN0MmZPTklMVkpEamxKVTlyb09vSHlxT1cvb0lO?=
 =?utf-8?B?OGpRMjI3NXVqVHpDUldvQldCcG5jSUJXVjllejdNSlM0SHlFSVZ4ZDNwNzRk?=
 =?utf-8?B?NUxvQy9ibVg0UVVJY2QxL01EN0UzR016UCt3YVc4bjNndjVpRkRyZ0M5ZjJP?=
 =?utf-8?B?KzJDYy9DeWVZTVVoVXZ3ajFLUkR1MXN4NzVWRGdaK25OU3FjdVhlMFpIcWw4?=
 =?utf-8?B?YTlKOUNmS1U4enJzNWNCL3JjeVorenBUSGpERWNQVmxkTjZDZzdYVmdxUTUv?=
 =?utf-8?B?ek5pM2J2N3JrTmxiWmdkd21sTWJUQjZHZUpUSHI0NEx1aE1NS0JxeVZxaUpY?=
 =?utf-8?B?dDFGUnpjWVh2eVdINEpDeEQxYm5JYVk0YkFlUWlrbElYMkRlcy9OU083WEpG?=
 =?utf-8?B?RFRYZDRKaEtlRjhyNHA3Q29nbjNEMkdIUVRDaUJaM1hFZHU1STBQRVEzNldz?=
 =?utf-8?B?Q2trRDdNZUlwdjB1cE9XNlFWM1NiOWhrd0NXODNVVU51Vkd5UHg4QVkySVJY?=
 =?utf-8?B?SDRURlZWR1NtZ1h0OC9iZ1lRV0szYXgzajF4dDBzNjZKSHhxamV5Tm1YYWZw?=
 =?utf-8?B?MWMvTVBYTEg1am0rYmtNNVJFa00vRk5ac3RnZ0czMERoNTdxYmxiandKa24z?=
 =?utf-8?B?eHQ2ZVNwZW9SbWp1WHVMNGdZclFyY3FOc0d6NFJYQS9jUG5zZ3lVTHlGd2E3?=
 =?utf-8?B?d3FVWlJxb1FlWStZRGlKK0lnRFVyMXdaMlg4eTUzOWVsMjlqaUNMTm9CalJZ?=
 =?utf-8?B?VXdyVTBhazRIajc2TDE5UHU5V1g4eXhmV1BTaXZNRWhpTU4zbUZJQ2xYVk9V?=
 =?utf-8?B?eXE3bDVUeld3bDE4ZWI1c2xWenl6N2haVG8vOEo4OHFYYkxGNFBlSWh3azZp?=
 =?utf-8?B?ZVJRRW1oN3RVSEk0aGdTYlRiZ2c1Vkx5NzJYbUFpc1lMSlQ3SW8xWDN0bDFX?=
 =?utf-8?B?RVJmRVhVQWovTERMUFRibDZ4MkhFUkk3bzcyazFGcE5tVTlhVXo1YVVaQzJS?=
 =?utf-8?B?UUYxZmZNSnVEWlJBZTljaTE0c1kxUXRLUEsxZHF6eGd1WjBJZ0VLQmdHOWhp?=
 =?utf-8?B?Z254Vmk2MWcrV0grcGQxMUsxRE1TNXNBdHFVcFNDYmlmRkNodStrQ3g2QWZV?=
 =?utf-8?B?Z3p6RGpUNE9jeTlHd1hvMElpRHFDWkJtRDVpQlJ4OFpSZmNlWnpJbHJwbk10?=
 =?utf-8?B?cTQrdTlXOEhreFpCWS8rSWw5Zk03eHJHczVSTzUxQUs0OVJlbjkyT2tHaVFZ?=
 =?utf-8?B?SzE2WU84eUE5aU02MW5kNW5nVkZRdHMwdFRSU1UzMjZnQTJYTUdvV1hPLzVi?=
 =?utf-8?B?ZnlKWlUwUFVqUTNtMUxsYzdiaEp4SFJkRUR0ZGZ6b3ZwdC82R21KcTNUaU5W?=
 =?utf-8?B?ZnM4WDV0VmtweGdFMGVrQ090Y3JFS2JBQUhPZ2xtY1U0aHdVZ0JnKzlQUmF1?=
 =?utf-8?B?R25vSUZBVUNFeTVkSDRnSFRUUDBOOHBlSW9uZGIvVnRQeFVJd0lXRng2ZTdq?=
 =?utf-8?B?Z0xyTVFxY0pNUXJkSHA3d2dLQ1AxdS94eWV1NjUrbTJadGo4Nk9xa3paN2x5?=
 =?utf-8?B?b3NCMDFwWS8rYWJoVUgxRVMyZSs0N3NLTkNMcXpMVG9Ea2QzSkRHNko3cUdr?=
 =?utf-8?B?WVdkU0hWSzRwYUl0eTJkV3pyME9nY01pVlUzaFdWU3p1VlQ1Unk1T3NrZjQ0?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6e0948-deb2-4e96-b368-08db0e7e960e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 11:28:25.0521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8mR8Yp1/3N7UM3cAq2RXClTCHwH206UUZSJme85quJ7E6GT9+YCTTnxF2zaK8Fy+CUC/iHvoEKIi0WkSUmNQn+lgwXZKWLWhgO+p/sXhBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6793
X-Proofpoint-ORIG-GUID: b-VEhAMT3WOFawaKaWg8jDn0Lt1VoC5r
X-Proofpoint-GUID: aFirqOVG7rY8NCap3RiSRz6kK8oPz6Hj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_07,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302140098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 11:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177140



On 2/14/23 18:38, Alexander Kanavin wrote:
> On Tue, 14 Feb 2023 at 10:12, Robert Yang <liezhi.yang@windriver.com> wrote:
>> This is used for online package feeds (When PACKAGE_FEED_URIS is set), the
>> default PACKAGE_FEED_ARCHS is None, so "dnf install/upgrade" or "apt-get update"
>> doesn't work by default, we must set PACKAGE_FEED_ARCHS to make it work, but
>> it's hard to maintain PACKAGE_FEED_ARCHS manually since we can't add more/less
>> archs:
>>
>> 1) When add less archs in PACKAGE_FEED_ARCHS, "dnf update" can't find the missed
>> packages.
>>
>> 2) When add more archs in PACKAGE_FEED_ARCHS, "dnf upgrade" will report
>> "can't find package feed" errors.
>>
>> We must set the accurate package feed archs to make it work correctly, but
>> different builds may have different values since recipes can set PACKAGE_ARCH.
>> Set it automatically (when not set manually) can make it work smoothly.
> 
> Tests for online package feeds exist in
> meta/lib/oeqa/selftest/cases/runtime_test.py and they work without
> setting PACKAGE_FEED_ARCHS, so something isn't quite right on your
> side, or the tests aren't covering your local setup (and maybe need to
> be extended for it).

Thanks, I will look into it on why it works.

// Robert

> 
> As I said, you need to tweak existing code that handles empty
> PACKAGE_FEED_ARCHS, not add a whole another overlay function that
> clobbers that.
> 
> Alex

