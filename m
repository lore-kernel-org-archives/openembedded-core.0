Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7560C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 00:19:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2247.1685492359907173312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 17:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cWqfISmU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5515c7fd41=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34V08fYK013501
	for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 00:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=fdHyzJsdZW0DQ7TBuG+lmMzL5RdLx/v0kbXy0R/36B8=;
 b=cWqfISmUAWISjN6OjyzGSZF0e5R1Rt8n24oo0uTwlkzZC+0gS8s/kpnX5v7f/WC2dG+p
 TF0J7ArgSKMYYv/IKHSowdFJNulJGVeAAra68yZ9exn/eqOXOigsdDJdthRgAlswlFER
 U3A/JFA3uTWOjQ1Bt+It+I9kbqftXWFoF/JCgRCUK+E9f4ndLZr1R0jAMIvgOhQdP/c/
 QjD22klgXACEkHANNalt/vFH+UdFh6B9qI9iKOceNi6tznvjJhl92gg3Fmr5kGFCkQsG
 IdgD7l1ojgUTJ1CRQMcQuGZf22lvz7bozzZrm/1LYR4oo5R/Kh+A7G2V98wwSfFy2L/Y Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qu8u8k58h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 00:19:19 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34V0JIAv031673
	for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 00:19:18 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qu8u8k58g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 00:19:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhOuvwZRCh2+kJ0H/iHeUiCsonk/Y3dWwJfv9xD1r3IHiztsrKpV+yC+E+q7wfhShE0xWicuiCTa0yGhqK0H2CUzfHidZeyuJBGY67XhypsnqPPzZE9ScH+zrkRpaSh0i6ywi4WCo6ciJdG4x1WSDwCiUXymV4Yd6uc7YnGl4sNAuv/FcP7NDulUSbvOX8ZqY6TJhq3jD7+/UDNUiQU8GjMP2D8EFBs8muQ6SyuC3QlmZP9+RWO+qtXgFHksti1BF+jHbIcX2EqLk1qGrLZwMHOCWBk4V2ONxzIakNhan9m+km3PCDXc2iyI+kNkS7pPxjw0kN8vUThJ4I7oHb6Z0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdHyzJsdZW0DQ7TBuG+lmMzL5RdLx/v0kbXy0R/36B8=;
 b=hkS/kpXXp+EqyZnkslfvg1MC94D0BrhRnjCs94PBGF8HMFD6ATa3cELIF/sH1JYeZFpkK4FkYITe2Ogz7qdA/C0Kkof2tyTzDcm7C9R4zPyeMZmyErsN15N/edmXjeMXcs1Sc2LQngElminQrERUq27z765GAVthKQePcA4MzneWowQfk3l0FI/fVgZ1lcieD+4uEkZK4KC2l6EhrFMcj+szRIC/mYF2ax2acbD33ODbCpsCexuHUcK0dM4tlXgUW6/VUoKD4Mff8Mvi3apZU85R9qkAf75G8mchOhN+4+zGceIOTkFF1aE+24uEgImEg+zFP3ZQaXto2Yx74DoLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB5950.namprd11.prod.outlook.com (2603:10b6:510:14f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Wed, 31 May
 2023 00:19:14 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f%6]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 00:19:14 +0000
Content-Type: multipart/alternative;
 boundary="------------9RwnUbBTZxDIzO62526MyZ4Z"
Message-ID: <bf28f4a0-6646-aa19-59ae-5556ee9b5c80@windriver.com>
Date: Tue, 30 May 2023 20:19:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH v14] Rust Oe-Selftest implementation
Content-Language: en-CA
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Yash Shinde <yashinde145@gmail.com>,
        openembedded-core <openembedded-core@lists.openembedded.org>,
        Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Yash.Shinde@windriver.com
References: <20230530105125.445622-1-yashinde145@gmail.com>
 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
 <CA+cAkeoEfQWbQkwYMhAUqQKQXyXcyCYJdoFewWkDKsVW=Mpyeg@mail.gmail.com>
 <c13fb9159ec84ab2bb4710a3e59190db61b54612.camel@linuxfoundation.org>
 <CA+cAkeqPd=5dodJ_mfEv_w-BsvfUCE1JQq1k1oSk+Paegrv3ZQ@mail.gmail.com>
 <d07d99ab-865b-0d1a-1efb-4e8c167415b8@windriver.com>
 <1cbd8aaaa38757e875876fa903df75321beef321.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <1cbd8aaaa38757e875876fa903df75321beef321.camel@linuxfoundation.org>
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bb1464-f1d7-4201-20e6-08db616caa10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6gwy8UM9HhY06viDyERwPCRETRj8QmoED9nhkgHckXC5OutCdl1DYB9Gp7LQ8hOvZE5tZAf9mOhm6GdURNd8UczKWmF8gf9UrbQOAWjCPQ8+evTP1yK7IOK4obmOSp95f7PGwsskr3Xb5wboKHKR6okYldxb4dqOV1SiIqTC1KebRdg3eXanGQIwJL43Xd8kxwP9lmwu/6foTT9iY4l1XlxkvDZSFG8jBNg7+VO3Y8OIXvXXI9H1iV77a4JzoyZDRXsvzCcYhSgB0iRPbs3r8du8ijAWZ9WUO/KGY36kjPb8ITY0qJzedscXf2qSa1S6G7ZODOTPip+mtj8se9X4TUadh4pPnzbrIw/2NmMmHSIaoErX9SDJ79Gna6JHcRTKPfVZ6s4esyDTHqYcC5mMKCfFZtANZSBaoFaL/FuAk1FLS8SOyuq1qewqupXp2oHW3PnQrfZBL/vOlAu6UekKSzb1qCj0Lvwrpn93P0Upiy8M7MS07xWTTEHgcJQgGcgDOdXbhPDYD4XT2KwacbgC1k1Qmi+yQPSFzDlTH5GIKbCFXB9HXC2Ggk4kJAZwd8mziriHMVRXR/GVPciVu5cbH3P2H/cE0LZWCbeaUdrCZeEaOKDHOGOcUmiZMVlP5MS967dZsVDHZbhakIpStwRp5Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39850400004)(376002)(396003)(451199021)(38100700002)(186003)(53546011)(6506007)(107886003)(6512007)(478600001)(2906002)(6666004)(26005)(6486002)(31696002)(86362001)(33964004)(110136005)(54906003)(66476007)(66556008)(66946007)(41300700001)(31686004)(2616005)(316002)(36756003)(8676002)(4326008)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y3h2alovU3h6UitGQ2ZZeWxZWFBYOW5JcWJFaTcyYlQ3YklhRUhEY2prWDU0?=
 =?utf-8?B?K1F4NFVBWW5RSk0vU0tMNmZ3Q1ZLUkhFVWpNTVAybExORnRSYVl3MWpKbHd0?=
 =?utf-8?B?U3VHbnB0bUhHbDBJMnlab2hCRzZZNTNQS3FYaVZ2N012T1puNXlGWXVUQ1Ft?=
 =?utf-8?B?d2R2aFVwNlRYc1NZcG1aUXJvSTRQN3RDczBiZGZUUENPN2JZZTlnMnVFZC92?=
 =?utf-8?B?TTBPcjA5UmRsbjA0dTBoTitROUFVS3BlYkcvSzBxSnRDaU8wVEFubktwY0lZ?=
 =?utf-8?B?Vy93U25tQTAwOE5GYzMxams0WW52aEFrdjc4SXNaNTVhRFlGLzZ2enBGcXpE?=
 =?utf-8?B?NE91U2VrUWtuRVBJcG1MeFR3ZE1saVFrcUxuMG51MEpkTDVoTzhja2lhL3RY?=
 =?utf-8?B?TEdZckdSRWtIcjIvM1dXYVBMVGRub0kzdi9aL2YxQnkzRWRKMGRjNjYvYXY0?=
 =?utf-8?B?NjRvVVNOcTVSRjEwbmFtcUsyM3N6QUlSOHlGMkROWVUrUTBRdkFwQzhHbzRF?=
 =?utf-8?B?TGtmczRHcGJzdi9EaHdMUnkwMGYvdUF5NTViOWlvTXBPUEhzc2Z2R2pDdG1Y?=
 =?utf-8?B?M2JyYzB4MVc1WDFab2I3ZVVMSzlhbWZDWW9zS0FSQzU3YXlOTC84Q21mVnFs?=
 =?utf-8?B?T2tpY1ViYmZ5bmNXdUYwc2hIZmlQZHYvSnVFK1B1N1ZERVhNUEtVd282VVg4?=
 =?utf-8?B?Z2plRzdKMC9xZVBYTzJ1ZU82em1tYnhjZUlSZTI0R2xZeWl6QXlMbnFHbnlE?=
 =?utf-8?B?VnRha0EyK2tNQjkza0dYeTlBYklSdW1tQjZtd21sRGZSUDFFN1ZuVitvYS91?=
 =?utf-8?B?Z3k1RDNyWXZMZEVVeWsvdm81TW5Kc04xYU9ZTDd1WDlIeXhzNVJxM1JGcXFa?=
 =?utf-8?B?d2g1ZkFYSE5WT1ZsZDF3M0UrM1RTVXhFTHNZdldkWVhMNkZja0NFZlBzcVBp?=
 =?utf-8?B?Q1NCZXJ2NXVLUitra1N4dk56UGNCUy90azN2THFDUHg5eGluUWEwMDZiQmVC?=
 =?utf-8?B?bkcyNHRVTXZac1VMV3dvY3VWODZlMjBldHNQNU14blpZcjdjWDNCcFRqWGs4?=
 =?utf-8?B?RFNNR3MyUEJGbHFCNmJjWURKV1N2YWZHVVNsejUrK3VrSll1dVA1cnp4NUxO?=
 =?utf-8?B?a3VRNGFtakVlOEhFQ1RVdzdjVjdlOVFHZDJINUE3L3BUSWcwckFIS1dKbHFr?=
 =?utf-8?B?bnpKTzdielZVQWM5bnY1RStJcE5GaGJ1NmxEbzlkdzlzM3JpTS9UNFZ0bHMz?=
 =?utf-8?B?V2c4Q3IyamFiaEw3VEwydEJlR08vWFVFR3BhbFNBY0JYQmpRc3hPcC9tOEti?=
 =?utf-8?B?d2dXUFBWeFRkYStVTjVrVndvWEIwVElhN0h0SC9HM0tiZzZrZm9Sd0dHdko5?=
 =?utf-8?B?TkFKMEE4VXRZNS9VaExrQjBQOVZrVTRTQnFrSUtmRnBjdkJrb055WEhPbFFT?=
 =?utf-8?B?OVg3S0tXZTFpT1V5ejZ4a3V6azI1cDVvZkRUdnVjSlF5cWJnSW1WeHFER3U5?=
 =?utf-8?B?ZDltQXVZRXh2bHN3YVBvNzcvTWk0RXZPc2NGOVA3MlBUbmwwWm5KQkgvdmFu?=
 =?utf-8?B?VDZvTzRGNVdLSGZMSnNueU1jNmRlNGI2ME5pTlVoK045bWYySEl5ZUNHK0Zl?=
 =?utf-8?B?MFVmdmE2V3NGcUtCRnhyTG94YjUrSklWbW1CVFoyQUMyKy9qSjQ0NUlXWjhH?=
 =?utf-8?B?T0JOV3pRZGRpd1U4eWlJRmI1R2FmVFlOeFRlaWM1dDZLc1FGUDFvN2h3Rjk2?=
 =?utf-8?B?MGxrQStEbno5dHdPbm9HNThWUEVqOWJIMmVSTmZiUEVNeEZha2s0dmRneVhl?=
 =?utf-8?B?ZTVqYlVKSlZ6b2lMTThFZXZkVm11cHN2ZUw5VUsvT1l5Q1prZG00eW0zYVFz?=
 =?utf-8?B?YjREcWs5RWZ4cG1JTytuY0Y3ZHN0SFZYVHJlSWcvOWZRTWYxWHRpUTdtT1Vh?=
 =?utf-8?B?eSsrYzk4Z1h0SmNGdE1UTEMrZzBUVWp0NDRQclN3YVB1NjMrTmszd2ZkR1oz?=
 =?utf-8?B?MkRVY1hieTZqT0lrYjA5SkFrS29GMjJ1R0lLQm9CSWh1cHdpWW00N284dUhV?=
 =?utf-8?B?c0N2azZEZzlQNHZyNjNLQjI0YTVZRno3WXd4NmxGeWIxN0VTNU9pb29PbWNX?=
 =?utf-8?B?dE5ib0tybXlMUVhGaGhEMTl2ek90NTBSU0J2cnB2TFFUWnF3VG5KUTkzaXlK?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bb1464-f1d7-4201-20e6-08db616caa10
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 00:19:14.2184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KG927w1g+pN1L/KTQqlCo3680L9H5OXT+PMGFwUoT6FQqv8BMcHWhmyMJpwZkbVW7GnRYhVvJCyUEluhoqojfuE8W6r9aFW9eE7DkYDktA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5950
X-Proofpoint-ORIG-GUID: LL6JNoYLEYVJ-7IQfOurdd3ddgn4qM9E
X-Proofpoint-GUID: 4eesYvJQEqpSOmcdtG7CI-07Mwf0MFXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_17,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=636 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 00:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181967

--------------9RwnUbBTZxDIzO62526MyZ4Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-05-30 17:20, Richard Purdie wrote:
> wait for the beginning of the fail development cycle.

Ugh, that's: FALL development cycle.

What an unfortunate typo!!

-- 
# Randy MacLeod
# Wind River Linux

--------------9RwnUbBTZxDIzO62526MyZ4Z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-05-30 17:20, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1cbd8aaaa38757e875876fa903df75321beef321.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">wait for the beginning of the fail development cycle.</pre>
    </blockquote>
    <p>Ugh, that's: FALL development cycle. <br>
    </p>
    <p>What an unfortunate typo!!<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------9RwnUbBTZxDIzO62526MyZ4Z--

