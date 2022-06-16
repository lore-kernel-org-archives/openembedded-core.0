Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0900BC43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 14:19:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18255.1655389168900095282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 07:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=JW1aEfFU;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=3166ba7818=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25G9q94S009153
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 14:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=WqBvxNNvkGGGnrcfm4y7mIVDeSmEi99TxIgxiJuJtqE=;
 b=JW1aEfFUuYZyLOMcSxM6cZ63QUjc25yVLQBDOe+rQtMmwVp4cP0EdpgkAfojDbhKrPgl
 WINQJRH8lDTj+IlmxTX3pY+eKD7vGNG7a1XsILoHIt56YvntavVDDb5vE2jES04IFwQY
 +23Y3ZAWBDKin2e+Yb64DNOMU+Pdh9CJ/FUtZWkHLoJ/y4BcEOUDDL7dSq2QDy9ZG2Ef
 isd7cO5h3niVYEVRe9qN3v2zYrQgyIFUeO4KVya+Lrg2p0ccpVOF+xuDXTzr1uRitKBp
 XqzGIaipTjxddUe5omP5ZQ42AA8rGdTBSvG3wu6ChrorQsMRFSWuB9TtVHp7su72T+Dj Kw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj19c7d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 14:19:27 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25GEIURx026113
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 14:19:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj19c7d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 14:19:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJ1tuxPwdMERbzRilIg0KS3rwlKYFZQgapAnk5euPdkdnh/rtjlXVMMrjZu1S1Z4rETs9burv60epL+JC1HzIA0LNZ8ENVtAQ7jLT9W72fcB+x6xV9XjqbeFscjIe1YdhQ5+tiecV21QJWE8tmmmxlnJT5JQZgyxMOBHnSsPap+H5QYCVJg+u6EXG1U1WKMC+MOpHJWmnuxKcGIqkLnrrz+0Bj+yHYZiSPneeupCKBqR6i04SCXS3LXLiZwi07wFXcnykPu6Bs4vEwr275WzZQDd5iqssPA1iNYebt8ZGy9pTnyvldqVEYVP3A2WOGa/ufg/6idPep8MgQd8cOxzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqBvxNNvkGGGnrcfm4y7mIVDeSmEi99TxIgxiJuJtqE=;
 b=O7HOMhlse4WmRyMgdthhhO2JRCL+fvOYItvyHWldTcld6QE/ALknD/88+iF2pznRSWEfS8+y7HeLsdrGRbvNQUzYcy3iRNJ92CvdSgn+AOJ6hspnHNKP0hAc68NowJV00KUuqidjyrFHrFWnEw1kjexxuN55OeJ3tiCf4DEb+lHaup9e6be7txS+pnoN6mhTAFpc0BeQYbbh2LbDboDUVB5NUtMilADtOHcEgcKcoiQMgqCBKsnl+iD4OG8sn4CwouWeg+ReK3UNMO9d+/BOyRnnnGWeXx82pL9Ewx+fpHC1kk1wKbxLMmL6SBCKv3x8GeyMamP4jS0xGHEUcNiCTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1291.namprd11.prod.outlook.com (2603:10b6:3:14::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 16 Jun
 2022 14:19:24 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b999:2318:495a:f64a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b999:2318:495a:f64a%3]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 14:19:23 +0000
Content-Type: multipart/alternative;
 boundary="------------wVmyaUKZiyyH3qkBLPUWcZXG"
Message-ID: <e449115f-00a6-e11a-cd8d-f502db8a0b0d@windriver.com>
Date: Thu, 16 Jun 2022 10:19:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [kirkstone 00/26] Patch review
Content-Language: en-CA
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
        openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: 
 <CAOSpxdY7jX0L+eVhQmsATJ0Ui7WY2BO3YLhHPy9A1_xD8WVo7Q@mail.gmail.com>
 <10174.1655345951333043146@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <10174.1655345951333043146@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a9eb6b8-7e67-4bb4-a5b2-08da4fa33658
X-MS-TrafficTypeDiagnostic: DM5PR11MB1291:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1291654050A5218580D4C793F8AC9@DM5PR11MB1291.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AS1NXlfeABko4aayFP1NGiRLQ1qdbmnjNwjXQ/0bxCRcZwnov8M2G1ywyq19n57B9mXslBCUU9v5v7rWjlSs4Pfggx1H+lGGK/We7HrwzQZwk2VMhNTbud0sPodRgXVlnwUrIREZ+nc8EmOudBXVMZQ6yncpv+v7uO05rD/hdA299B3K0VK59nbZRRULLIvWj07CMoX8Qgpc2VFfkutJZjCyHDuvs9k6BPzppeVtKS1/7osZCrJ/eMWkVFe5+hnuGhf0a80TI/z7WJHwS8skvUtDzYSgI3imLs1MiXFMPYS8GWj8rJBp7hydBoJTsx+3zxeBL0fUD2gQwhEon4JPUyv1hBqiGav3Ycku5449KewuF0kF5lGN3wyXaCxeATA3owq4P0RhPgawvq6hbOQ80i1ezZtSvX0UiqYb0uiDEfA7LPBl6sjgX/DNZj+xy283vEIW4s0IV1mj5Fpj5IsSar+lPRXz+nqMgUEeuV3JPYxKaaALyjgiIrCotH7b0/5q5n/mC8ki90HVeNZ/vLpoCw2LWPTIsjHPuwJInITC5N2QycrNOHUcXTssAeu1FvYOdzQv098A1XAvrbk3PdoJ9s3XOJmBUYWGnjL36uV3S7eomZ3h1ka/b1MwX7vj89jHfye47hkRomQWOE+Vd+sFBJfHhAanl75hplv4/0h+xG/R3/yjz2ys1MW4mREiTcdSvRGHBj3bULeW15SzMQptHtNcj4iB5NnEZlpWnJMNX70Y2RYJt9hXwTd6/bubZ90x4HR6rYrV0EudOUwnSfxrsCqgE5DzXymkX4hmndaMZTyobuok7ol/caUZ/f09WnjVjFK+Iv1xHwq5WqEDOsYjrSpuz6ZF/R/cdi6r6TvPYZQBUP4oCZY7Yv7M9nrXpoPcSmuX2Vs43+xuYtI5bYYV1g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6506007)(2906002)(966005)(316002)(6486002)(31686004)(86362001)(508600001)(6512007)(52116002)(33964004)(53546011)(26005)(110136005)(36756003)(31696002)(186003)(2616005)(166002)(38350700002)(8936002)(8676002)(5660300002)(66476007)(66556008)(66946007)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnhxQ1lJVTZXTmt2aE9XOERId1ZKRW9xSFpTbWNmcUdSNFBRRWIxT093bXUz?=
 =?utf-8?B?RDAvQmxNbjJtY29Yb3F4UVV1SWZIZ3JndGVBTlE4a3RxcFh5MzJGblFqUGlP?=
 =?utf-8?B?dUFmRXVkcU5UT1I5TzdzTkdBUzhlZ1BlOWZSNTNzVkJKaFhuc3FtaUV3TEtP?=
 =?utf-8?B?cEZLMUxjWDdLU004S09DTnRiSVYwc2FQeHpnUXl2eHV6WTdmdElGNUZXVjNo?=
 =?utf-8?B?Q2kyRjBmdURUZjR1b2tmQWRXUG1OcTQzM3VFd3pDWFVpYmpqRjV5NTNyQUk3?=
 =?utf-8?B?THdtQ0liVzVTYno2Sm9la1pwSFBsK1JKR21XRGFmalIyWHhwR04wMzJnU2s2?=
 =?utf-8?B?TXRqWXkzYmk4VHlpSmdOcUU3WXZ4cFd1TkpPZituQkFmTXNwMFlLZlBpYXA2?=
 =?utf-8?B?L2NaVC9lS3kyOThLUlNuS29PTHh5ZUlqaGVLelF4QzNGZis4UXcrcitTZDA3?=
 =?utf-8?B?bW45ZDlkdVZTZmNYT2RWOHlTaU0xbzM4eWx5czJnbUJCWm5tb3dQcVh6T0pD?=
 =?utf-8?B?Q01aYVFpa3NmSk9pbmNUVU9sYTVUK01tUSsvUytzNHdmajQxWDhnQU83ZlNa?=
 =?utf-8?B?dUJrMjhFcjFMM2ZzeElIRWVwdGUxUFpST2g5WkxWc3kzK21NLzkyMzNwQ09o?=
 =?utf-8?B?Ri9WTzZ0U0J3SmVmK0I0anU1UWdwWXhleDVIMWl6Wmp0M1FOTEFHUmxnVUc5?=
 =?utf-8?B?ekFJbEw3YzBzT0FhK281cWJzTnVwZjRWQnQyMUR0UTlGaThwV1Z6TUpOaGdl?=
 =?utf-8?B?ZXNkQ3IzbnVoY3p5a0QwZTgvaHN6dHlwNjZGTTg1QW9NZisrT2llTlorR20x?=
 =?utf-8?B?d2laN1BvbVpVMFFTc0p2N3U0K1dDQ0w5c3lrQmltMzFWRmpXTG50alJPUE9K?=
 =?utf-8?B?RCtTZVdidDY2MmppajNHY0s4aHhWYlNta2lvZUM2WGpVeHA5UmFZK00wOVdr?=
 =?utf-8?B?TXVBZnA2dm5OMG9XbjkyTVpoNmRJdUxRM1NsOWoyMFA4MVJvZ2ExNlE5dlAz?=
 =?utf-8?B?dU5MZFBCcGRuN3BkVEY3SFFQNzBQcS85amlQeXF1RHk0a240bTl5SW9mTnhk?=
 =?utf-8?B?VEZ4QkxBL3h5NURHKzRmYTdwd0FJQWFYREx4dlNpb0kxUDBnQ3VTRFBDTmlR?=
 =?utf-8?B?MzlRNUcrWUU3aExZWHpFejlvNnhZa0ZvNGRQU215U1ErT013YlVXMTNCWTVI?=
 =?utf-8?B?OEthTkZ1NHJvaE1leEpuTFQyVUVYVGhjU0t4MElHN2F0NU5EdERNZjNTZ09k?=
 =?utf-8?B?SXJRYjdJOHU5alJaNEc1c1hIdW5Bai9Ld3dXbThLTUV6T0hBL25TVTBoVkFp?=
 =?utf-8?B?VXpKNHIyWi9weEc3T09idGVrMEtmMFlJWFFqU09yeWs1RGRLdzRxZnVMTUtr?=
 =?utf-8?B?TXNXc0pYaXFEUGora0IwT3Zwcmp2KzdTZE9Vd0trb040NWd4VFlmZ3BmNGs1?=
 =?utf-8?B?aW1GcTdUWHcyaGlhUDhjZEN5akQ3YW5hT0UybHlmSEVtR05NcFFvWmJkUS93?=
 =?utf-8?B?dXVzV08rTFBVTFJ1RFZydDBpR1drNlpNczNZOEhna2Zuc1YzUDAwbEs1WTNL?=
 =?utf-8?B?SGRqUExBWk43WGVaYm9FVWNxcG11VkRDaDY2Q2hSWUV6T3hZb0FkYTZ5NXow?=
 =?utf-8?B?bDAvRXhRUHJVYi9rbTJrdFN6TDdJZWFEN2FESmNjZzZqWUt3cUJTSFprUVBB?=
 =?utf-8?B?NlB6dFl6YTVrUVZGV2NvSmJPeENwVWhSL2VvcnByeWM5WUI0K21MK0EyZHBm?=
 =?utf-8?B?OEVUaDZReHlvNlZwU1B2TGU5czBWcHUrdGYxVG43V2RzZFhJWGVvR1c0a2Na?=
 =?utf-8?B?b0lrOGU1SFN6WmJCeHRjVlpkTGEzZGUxd2EybFA0ZVJNZzlYbjZWdWtRcGRE?=
 =?utf-8?B?ZDNvdmFsWlBFOExMbndHQUdZdEVUQVdoUXc0MUJRcGkvTnRUZDZtaG9GTHp2?=
 =?utf-8?B?VmVvVSswa3o2STZTankrVVRwS2tDTmRFNVZVV1psdkJ3Wms4dXRDc2dHcEZh?=
 =?utf-8?B?ZkkvSnoxOTVyZDJiL25rMFU4UUxrYTRBTHh5bzl5VTF0MnVKeE85ZTc0QzRW?=
 =?utf-8?B?UnlUNkhEcGc4VDZIbGN1RG5MSE9MVDJPNUUxNE1WZmdIZnNybHFXcVozQzZD?=
 =?utf-8?B?K2hjRjJkVE16S2RRL004VUtTSFRzWkpDWU0raUl2dE52ZnFjZlQ1MjNTR2da?=
 =?utf-8?B?VVZFLzhUTEowaUd0YWdsRUFlc2x3aitNWUVsWkpQVjdERTBhQVQxSDNlcTdt?=
 =?utf-8?B?QWVZcS9HSmYrdjNaQmRtZTV1WHhIOTRQNmN0OHJDWFZpWWR2c1FkSXJqNjBu?=
 =?utf-8?B?Mzl2ckE1cGhBV1ZoNklTREEyTE5yYVpNTkZHV2MxN1VJSzJLOXdtOVZveFFB?=
 =?utf-8?Q?HNZvC8auAQHhVMqZnFECjARolRSeZmxAb4U8W?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a9eb6b8-7e67-4bb4-a5b2-08da4fa33658
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 14:19:23.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OO009QgOjrDzd9ghWL0lJvN84KoeHu/W8j/z4R7BIF/ciFyJNMeJ9IP1dYEq7R7r6IXMVk5Jp86WJNzG0Y8sdjBErQ4sGv2gvykVtqxOUKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1291
X-Proofpoint-GUID: g6TtqcCBjQZ9LvPpBEwW5lEzFLaQRKc5
X-Proofpoint-ORIG-GUID: LDUUhAfyq6dPgSAW7RaLmY3D6Szz0TZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_09,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206160060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 14:19:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167007

--------------wVmyaUKZiyyH3qkBLPUWcZXG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 25G9q94S009153

On 2022-06-15 22:19, Sundeep KOKKONDA wrote:
> Hello,
>
> GCC regression test performed on /Kirkstone/ with gcc-11.3 & gcc-11.2.=20
> The results are *NOT* identical. Below is test summary.
>
> *gcc-11.3:*
> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D=3D gcc =
Summary =3D=3D=3D/
> /# of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 126552/
> /# of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 24295/
> /# of unexpected successes=C2=A0 =C2=A0 =C2=A0 =C2=A077/
> /# of expected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 782/
> /# of unresolved testcases=C2=A0 =C2=A0 =C2=A0 =C2=A010/
> /# of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2760/
> //home/bft1/skokkonda/kirkstone/poky/build/sdk/sysroots/x86_64-pokysdk-=
linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc=20
> version 11.3.0 (GCC)/
>
> *gcc-11.2:*
> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D=3D gcc =
Summary =3D=3D=3D/
> /# of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 125933/
> /# of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 24215/
> /# of unexpected successes=C2=A0 =C2=A0 =C2=A0 =C2=A076/
> /# of expected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 773/
> /# of unresolved testcases=C2=A0 =C2=A0 =C2=A0 =C2=A010/
> /# of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2779/
> //home/bft1/skokkonda/kirkstone-gcc-11.2/poky/build/sdk/sysroots/x86_64=
-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc=20
> version 11.2.0 (GCC)
>
>
> /

/11.3: # of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1265=
52/
//11.2: # of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 125=
933//

So >=3D 619 additional tests were added and they mostly pass (as you'd=20
expect).
That's good news.


/11.3: # of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 24295/
/11.2: # of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 24215/
/
/
/So 80 additional unexpected failures - can you summarize what these=20
failures are?
Were any of them fixed after the 11.3 tag?

Are they related to one part of the toolchain or spread across various=20
features?
Are they reproducible when buiding outside of bitbake?/
/
/
/The other differences are less significant.
If you post similar data in future emails, please do the math for people!
/
/
/
//
> gcc-11.3 & gcc-11.2 test summaries are attached.

I didn't look at these yet but=C2=A0 thanks for providing them.

Since we're not seeing any runtime regression in our Yocto
test suite, I suspect that we shouldn't panic but should instead
just work to understand, fix, upstream and monitor for future regressions.

../Randy

>
>
> --
> Thanks,
> Sundeep K.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166997):https://lists.openembedded.org/g/openembedd=
ed-core/message/166997
> Mute This Topic:https://lists.openembedded.org/mt/91503792/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------wVmyaUKZiyyH3qkBLPUWcZXG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-06-15 22:19, Sundeep KOKKONDA
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:10174.1655345951333043146@lists.openembedded.org">
      
      Hello,<br>
      <br>
      GCC regression test performed on <em>Kirkstone</em> with gcc-11.3
      &amp; gcc-11.2. The results are <strong>NOT</strong> identical.
      Below is test summary.<br>
      <br>
      <span style="text-decoration: underline;"><strong>gcc-11.3:</strong></span><br>
      <div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; === gcc Summary ===</em></div>
      <div>&nbsp;</div>
      <div><em># of expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 126552</em></div>
      <div><em># of unexpected failures&nbsp; &nbsp; &nbsp; &nbsp; 24295</em></div>
      <div><em># of unexpected successes&nbsp; &nbsp; &nbsp; &nbsp;77</em></div>
      <div><em># of expected failures&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 782</em></div>
      <div><em># of unresolved testcases&nbsp; &nbsp; &nbsp; &nbsp;10</em></div>
      <div><em># of unsupported tests&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2760</em></div>
      <div><em>/home/bft1/skokkonda/kirkstone/poky/build/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc&nbsp;
          version 11.3.0 (GCC)</em></div>
      <br>
      <span style="text-decoration: underline;"><strong>gcc-11.2:</strong></span><br>
      <div><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; === gcc Summary ===</em></div>
      <div>&nbsp;</div>
      <div><em># of expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 125933</em></div>
      <div><em># of unexpected failures&nbsp; &nbsp; &nbsp; &nbsp; 24215</em></div>
      <div><em># of unexpected successes&nbsp; &nbsp; &nbsp; &nbsp;76</em></div>
      <div><em># of expected failures&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 773</em></div>
      <div><em># of unresolved testcases&nbsp; &nbsp; &nbsp; &nbsp;10</em></div>
      <div><em># of unsupported tests&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2779</em></div>
      <div><em>/home/bft1/skokkonda/kirkstone-gcc-11.2/poky/build/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc&nbsp;
          version 11.2.0 (GCC)<br>
          <br>
          <br>
        </em></div>
    </blockquote>
    <p><em>11.3: # of expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 126552</em><br>
      <em><em>11.2: # of expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 125933</em></em></p>
    <p>So &gt;= 619 additional tests were added and they mostly pass (as
      you'd expect).<br>
      That's good news.<br>
    </p>
    <p><br>
    </p>
    <div><em>11.3: # of unexpected failures&nbsp; &nbsp; &nbsp; &nbsp; 24295</em><br>
      <div><em>11.2: # of unexpected failures&nbsp; &nbsp; &nbsp; &nbsp; 24215</em></div>
      <div><em><br>
        </em></div>
      <div><em>So 80 additional unexpected failures - can you summarize
          what these failures are?<br>
          Were any of them fixed after the 11.3 tag? <br>
          <br>
          Are they related to one part of the toolchain or spread across
          various features? <br>
          Are they reproducible when buiding outside of bitbake?</em></div>
      <div><em><br>
        </em></div>
      <div><em>The other differences are less significant.<br>
          If you post similar data in future emails, please do the math
          for people! <br>
        </em></div>
      <div><em><br>
        </em></div>
      <em></em></div>
    <blockquote type="cite" cite="mid:10174.1655345951333043146@lists.openembedded.org">
      <div>gcc-11.3 &amp; gcc-11.2 test summaries are attached.<br>
      </div>
    </blockquote>
    <p>I didn't look at these yet but&nbsp; thanks for providing them.</p>
    <p>Since we're not seeing any runtime regression in our Yocto<br>
      test suite, I suspect that we shouldn't panic but should instead<br>
      just work to understand, fix, upstream and monitor for future
      regressions.<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:10174.1655345951333043146@lists.openembedded.org">
      <div><br>
        <br>
        --<br>
        Thanks,<br>
        Sundeep K.</div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#166997): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/166997">https://lists.openembedded.org/g/openembedded-core/message/166997</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/91503792/3616765">https://lists.openembedded.org/mt/91503792/3616765</a>
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

--------------wVmyaUKZiyyH3qkBLPUWcZXG--

