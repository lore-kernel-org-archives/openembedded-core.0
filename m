Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9B8C2FC39
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 14:15:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.188778.1692281747112590529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 07:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OxKKwntj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75933f8e86=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37HE1Aax009828
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:15:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:cc:from
	:in-reply-to:mime-version; s=PPS06212021; bh=vkUll412zZoIHwoN8FU
	r9gWPvupS7datO7sXYgufw/U=; b=OxKKwntjt3/TPciMTvvKQ681+pUGPRtUdYc
	mIfOLUi00Ox8lmKMX8KXr+qap67xxa/kabV5wASxGVcw7/mMtX1qnicJxiyRR/E7
	0blnxgDOD7jCH0sOdFjzUh3qaxhXNnRUPmH3COORaU19hTlIpZgPh8NCCWHplbN+
	9h+l6RulQuhApvL9qTc79cSQdH5uAQV6YfFaf58K5GCEbzUUtX6JdWioCZ+j+gOe
	21qrC9EeAziV6/ZesWUyhfwh8Ts9Ivw6zYLf1HcnIQsQAoJ5OAaKvvISUs1bQdKG
	1fV4iQgtDY7BD74bG+XjsBTsrGpayHzwyB6DsIWsaSMUtFjv4XQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se5bycvvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:15:46 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37HEFk92027216
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:15:46 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se5bycvvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 07:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVKe0+BrQdF2asc5Egmc/WPvvW+QAujlJcU6w4e66l8+pJBMa8BmC/yR8XPRUWUbWg+ZCgyJbQly3bO/UVgTuHce5tCyjl6IxzXqiJqo6ARgyUaiHf/XzxQKJHcpJUE3raF+u2/p7xTlveRRF8+dGeh1KTNxaTURoK3BI/gYvjIa9B26TwtpNFM+nLXs1FVkqFxzTFO7RPsKDlyEDIIuN8q705GdvkfJqecbBUjq4661H7YTpPcSAhpeI4V1NhA47wdHuVN8pzKZezWP5ZMHwYEyf7DazWiqQcvy+/t7Bks+Vial0dqyPVrQFnbElKeJs0lAcpnLrJTaijESS1VM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkUll412zZoIHwoN8FUr9gWPvupS7datO7sXYgufw/U=;
 b=g/Ae9hWhWTvoLa7aVGoWC615olegay7+wiWF4mBLCj2zn+TRgEqmLPtgdb0J/q9QOEFCPw0B93BxpZzTJMRBj3gcqzWFKGyUlHSeg2JPUmV5ju6FE22dM6ijjwJbM4yBqdCl/56mCH0BqUi45k15S2RHgIuhG5fMRb/wQip5HJRaDxwUFpI5kBCARoPcBj74nooughZqvgcMj/lq1HhpJZgJsnZ3vzg4RAGaZHaAm2uDeVh1A1q7QPOMA0bxjgdVpn99USSv/9rKULmIWXIYWi8rP9Y1Odcj7UevgbM4RUb4++IyGEJJJs18PuEuXSuiw1Q2ac5RgBjYSSjTLKSmRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 14:15:43 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799%7]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 14:15:43 +0000
Content-Type: multipart/alternative;
 boundary="------------dB5mnae2x8QKlswwNgbu5LCe"
Message-ID: <9d57a013-9737-f119-2e43-e8dd1a71684b@windriver.com>
Date: Thu, 17 Aug 2023 10:15:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH v2] rust: Upgrade 1.70.0 -> 1.71.0
Content-Language: en-CA
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org,
        "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>
References: <CANNYZj_WLs2V=DtsaG7XH862Xn2rJnn+bZZBbVd+5J=Wh_StXg@mail.gmail.com>
 <4191.1692280258442699624@lists.openembedded.org>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <4191.1692280258442699624@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::6) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH8PR11MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa49ca6-a4b9-48e3-a27a-08db9f2c714d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uikQkD4NE8JFmqqfVD/u1pD6ZC5j/M6i+TeZj8wI3/s+2eE5Vb+JObA/IyCPiWPbeh8dgy5EqM+fFy7mjyOWffVyU5T2LIXi+P+V+J145kEwbyhR++oqhcWGVDuTwf/saDdzxDjSB431dOfC9LI1euRzboDqk/HsUIl/u+GLx/HhH05jGYDuMATeO2vuHqvQ4SDshxTv8yekZPpQFEcYxoBV9kOe0dqQLK0wILTxZ/i0U3iBAvSr4kfxxYP3s2GMDkW//BXWyZWjlRFYO04zaEL1xYckGXJMAuk1I8zSXGYKKQyiLCUhLkkfP0mtAE7uP82S62HTK0lMZ4mSb1SmmzTySwmVEMz5E0xn8IHj//NX0S+3ZMzd6u5/7FRO5OXmFXQsG2n+sGS6tvg1qUtYTccjKu48u8ADd3gizp9JE8JOfzNr/oHNiexXnQ5BWPSTzXbXC9mgHpMygVsXxORdC1/3oDRUQhw+lVfhRkot+hBFpN0Systfr6c1ecXmbh0ur2sJlaVK/c60QO82L6fDVvL/4ABTVh2rRE8Oy4YlVOu0qFUAKZg5vqAXWyAjzchCfMuQjv+td73aWDfeeOPvSdZo2G87w7BUrZUK+mU0rKNL0J5qMVb1WNNfHHklovoQQK0Vaq8W6D+FpBFRnW6sE+82LwhUctLsgzcyBt4ePUb8z0ohfpYsBILDFWltUZC6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39850400004)(451199024)(186009)(1800799009)(31686004)(86362001)(31696002)(36756003)(38100700002)(478600001)(5660300002)(107886003)(2616005)(66476007)(6486002)(6506007)(33964004)(6916009)(66556008)(66946007)(316002)(966005)(26005)(53546011)(4326008)(6512007)(8676002)(41300700001)(8936002)(66899024)(166002)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0dkWDZBelprTkcraHlFVzFNbWhqU3ZBQ0poMzhhRDJXSmovTUtDSDRrZWFO?=
 =?utf-8?B?Sjc4NDlodWNFZkpVQ1hjKzdSSzdZUTZRUzNpUlB1T1VHVmJVb0FjTnNUQ1Z5?=
 =?utf-8?B?ekRzUnpzNkJ3TCttZkFGeWpURGoxY0xwUDBlQkV4d01tdTJJME9TRDBvU1Q3?=
 =?utf-8?B?NUk0VUFGVlNKeUsrSGxZenVEVnVabGptTVpsdU1QcFdOMkdJTUIrL1p6b1Zm?=
 =?utf-8?B?dDgzcE5lWEtQaTF6RldrYzQ1TmI4QXc5cWRVMW1NZXo3Z0lLeFZxZDlCenRH?=
 =?utf-8?B?clhhSE8xS2EvU0drYnc5SE5wNHNHdDZ3RUFtZ09tNnZZa1JNVTNCY3RneHli?=
 =?utf-8?B?QkJxek8xV2g4c3IwK2ZaK05UYXJtM2J5U2ErN2VtUFIvN0R1L1dMN0VFL0lm?=
 =?utf-8?B?ajdVaVAzL3RHSWdMT2I2MmFOcXZSRjU3QXZiYjQvYU1qS2N1bnNwTnR5YUpS?=
 =?utf-8?B?NFFja2trd2lrT1d6Y1VkaEVMbldrZUV5blYrSGRCbnI0LzNIUjJrcFJCcEFO?=
 =?utf-8?B?NktWK21rTFVwcE9pb0NCemVEVjZBc0JydE01WmFJajdOUTk5a2xhN0FNaWVF?=
 =?utf-8?B?b05PakRTSEo5RVlyaDBCV25DdmFMYkhlM0dlclA2d0xOZzFKM2ZNcWlnS0V2?=
 =?utf-8?B?WmZmbTBOcCs4T3dMc2xBdkRpcngvUFQraUtHdmZkdTNZZGlmQWlmOVcrZ0JW?=
 =?utf-8?B?MEdTejJOU3Jlb1htYmpwSlRkMjVrMnhXV3BycHI5YkxsN0pxVVI0ZUFxVXBI?=
 =?utf-8?B?UFJ6VmRLNmlSU2NLODc4eDRxdlgvaGNwM3V4dktRODUvUXdQMEljZVNxdEcv?=
 =?utf-8?B?L3RsTU1ZcjRWb2pCMGJhQ0NzSC9lSkg1QnVQeUdjbndscE1rWHpCRHlxbUpQ?=
 =?utf-8?B?YWUxS3hTYjdxZXc5dVk1ckhzQ01EVHpQZ21rdDJ0TlU3ZXNzK0xuS1BTYWM0?=
 =?utf-8?B?ZlA1NGg3ZTlzUkViMER0NklBb01JdVlnb3BpNm52RDBMRDZMQlJWN1M3MjhZ?=
 =?utf-8?B?RFVZTWpSdlNhOHJacGhnNVJnNVJMUmRBV3B2ZkFkT1J4ck1rUDJvS1VyV2dk?=
 =?utf-8?B?VGxLSEsxeDNNdytBTDNEeEpNWlduc0k4aGZPTEd1L0htQ1RYV2Z5dEZSbWJj?=
 =?utf-8?B?OG8vdUdEZWU5MzJpNk1Ueks0cXBldWtZVzhWd09MT0ttLy9FUnhCdTNaTENR?=
 =?utf-8?B?OU1KM05Tc0xZMkd3bEFOdTUrZ2czbTdHSm4yak9YZzZ2RFN5bUVjZExwdUJJ?=
 =?utf-8?B?YkcvV3hTVzd5ZXBUU3FqdU50QnFiUnRJeW1EVVNBUlZHNUNZOWVRTWJNdEts?=
 =?utf-8?B?ZzhKeE9XNktabldTSDBrMWE1UWZOVnhVZHRtTkZGaStlN0pJRldITU90c0NZ?=
 =?utf-8?B?dlpjamgvS3JCZit4dkVIcktxTVFud2dNQXhlbWxlWldySUtQWUloR1krTitK?=
 =?utf-8?B?NE1WZENpSU10TGZqTzZpT3MxZTFLak9HelBBOS9oQmkyMHV4a1hvMDJEbWta?=
 =?utf-8?B?eEFBbzlmZjNkN1YvTkdJZHFmQW0vaXNOeGM1SHJIcW1iZGxUZG9BVHh6amx0?=
 =?utf-8?B?dHIxSnZpcVJKN0JHU05kRUlZM01oZWwzWE1jWUtLbzNrZy9EenpVS2lPcmtH?=
 =?utf-8?B?a1FwOFB1L3pwNG5BOG9YbzZEYVVOcDZSRktNblR2bmdNSnVBRzFSNFhsd0Uw?=
 =?utf-8?B?SXpZbW1CaSs3dDJxeGJBT0x2bitVMyt0NTZCWDFQa2s1WDBwdXJ6MzM2Um1s?=
 =?utf-8?B?N3p2MG1uT2w5dFBiUUhJazVpa0plSVZDVG04WUw1Q0VvSnROYkpSTmp0VjVj?=
 =?utf-8?B?QVNJRDh1OXdQMy9IVXlEYVMvSHJGd3JGa2ZYdE5vWTFiaFh4MXg5Tmh0TG96?=
 =?utf-8?B?TW1oeEtzVWFtTnZIU2Ira3ZoeDFMTWp1WDA1dXI4K0x0cVBaN1BuaEU4eFBu?=
 =?utf-8?B?eWRLOUdCeGZBYnhubEYwSXBxc0ROSmxyMGRkaHdXTDYwUDhBWlpCMUJjWmxV?=
 =?utf-8?B?RFdRYjN5RHpTMTZWTlhPZUxFZ1l3VDBTQ1pwZW1HSm1wNWQ3c1p1WUJ1VENE?=
 =?utf-8?B?ZmZaSmhPSU02OWNtOGZ0WDl2MXdXcU4vZGErbTUxcXlGbzkxQWxaT01UT011?=
 =?utf-8?B?dURaOXpRSkNNemhWNzFZT2FyL0RWVkRKV3BKdjBlREZ5aSt5ZnphL2xacUgr?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa49ca6-a4b9-48e3-a27a-08db9f2c714d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 14:15:43.3114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWRFArvD/983Emjx1JmezRYnHWblLQKRib1Mg6R0DgwYo0pTzB8R39VNjcJ++h5hsFzNzvWgNfQy8jK/V/J9hm4DWl37H0dKPIkc6yllayw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
X-Proofpoint-GUID: atkso08Lz1VUMJ2OD-adqeRM1ypAjsfh
X-Proofpoint-ORIG-GUID: 3u7D1qEnCiEi6lmhmsh89ocKnO8HiWN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_08,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=547 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308170128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 14:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186320

--------------dB5mnae2x8QKlswwNgbu5LCe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37HE1Aax009828

Add Alex back to the To list.

On 2023-08-17 09:50, Shinde, Yash via lists.openembedded.org wrote:
>
> Alex,
>
> I will look into rust upgrade 1.70 -> 1.71. What's the timeline for=20
> this? I guess it's 2 weeks for feature freeze for 4.3.
>
We talked about this offline and concluded that the best approach would b=
e:

1. do the rebase of 1.71 but don't send to be merged. (keep it aside safe=
ly)

2. when 1.72 is released on August 24 2023, do that update, test and subm=
it.


Alex, I assume that you are on vacation but if you happen to read this,=20
please
do let us know if we'd be duplicating any of=C2=A0 your work.

../Randy


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186318):https://lists.openembedded.org/g/openembedd=
ed-core/message/186318
> Mute This Topic:https://lists.openembedded.org/mt/100230901/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------dB5mnae2x8QKlswwNgbu5LCe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Add Alex back to the To list.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2023-08-17 09:50, Shinde, Yash via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:4191.1692280258442699624@lists.openembedded.org">
      
      <p>Alex,</p>
      <p>I will look into rust upgrade 1.70 -&gt; 1.71. What's the
        timeline for this? I guess it's 2 weeks for feature freeze for
        4.3. <br>
      </p>
    </blockquote>
    <p>We talked about this offline and concluded that the best approach
      would be:<br>
    </p>
    <p>1. do the rebase of 1.71 but don't send to be merged. (keep it
      aside safely)</p>
    <p>2. when 1.72 is released <span id="beta-release-date">on August
        24 2023, do that update</span>, test and submit.</p>
    <p><br>
    </p>
    <p>Alex, I assume that you are on vacation but if you happen to read
      this, please<br>
      do let us know if we'd be duplicating any of&nbsp; your work.</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:4191.1692280258442699624@lists.openembedded.org">
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#186318): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/186318">https://lists.openembedded.org/g/openembedded-core/message/186318</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/100230901/3616765">https://lists.openembedded.org/mt/100230901/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------dB5mnae2x8QKlswwNgbu5LCe--

