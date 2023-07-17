Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570F7EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 23:21:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.586.1689636057260963537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 16:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=m6c+ORaP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6562a20ac9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36HMNRi8004234
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 23:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=w2/knY4hvNiO2bRJAjd
	JGUnSPStKbJ47YEVJinn7zlk=; b=m6c+ORaP7uJl7m78V8q+ROKLjq84fMyrtCa
	4TCM8vdL2YeEMVtsXU/88hs14Pk3pjStlGjf75PKLgTOLdL33JupM848qHTw0UiD
	QWh8k5tooQQYQK+d1IFncRIR02khuPU0Q1pB8n0T50bxFr27qzkF2FYCmtEaH9Be
	alPqMZkDSJPhK+Ria68CWZdCBWokl1khWxzxTslxAHkcI9hbVj68PuBRG+cqgeGI
	gMaG9MiYIhAz5oUcm9P9BaolGiLsIT1WNhPaORJ4GTsk6hi4wvWpqNqPlIO9l03w
	M4TMqvOibNAIxgcvAvuWtUzcB+DnATVxVhD757Az1nvgOd01S8A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8aa1g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 23:20:56 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36HNKtAg016639;
	Mon, 17 Jul 2023 23:20:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8aa1fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 23:20:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzYybJGyl+LppJciGe78/jUeQcAhJiQxWpQcltLAXSIeFDFpCqp+dNdYNwpSAHngdi2bEGKDoIPdxn9S8YbDxcyOlmBOfSA5M0PLLLCPpyNOglbq+PMee/kriJlmzavnwL01UQu//tYoaMfd4LpHnhHOMXq/B83s7sCilZVxnNCqjfVNxNuVWjSkgoS45/W4XfhmK00Lm2F05eULcnA0uknNrv5LGR3RKR0bjfiRgiz5GHmsnbYJ4oJtg3FIXSR3QY+qy79d8LSX4LJroBiWu+NoECjpct3KP0anWB42Sa2pQQ1ddUTzFqgYD2Jk+RLG+4/2jJcQx8m9KUdr3h/ddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2/knY4hvNiO2bRJAjdJGUnSPStKbJ47YEVJinn7zlk=;
 b=KC9Cu3el8+NsZcglTRm8l/sGnfAEa3aXs3suIBwoPTm1GUdg3u3IWFWEeXrnKQuzBrsAuSJJx09tM1uYSto1SbW7cL5Jb7sBfUcDl3kflACtOay4QrF7c6olZu7eDcjsUPrSkO9zNcYYRWPtkJGeNvDo9JlRAjER3hxp8HXusgSMwT+T1CZnIB5673nlT5aiYQ7dnJb9tvcHiw7jtpUtkSFixqkHwSfTBlJXGv5XA34yhDZccUocsdua+eldiBnC3dONExfV/VHVwoT3xTFJt7D+fUO8GiS1iKLt/eg80NlEw0NR/25eGoY/oRwKG3u0ksqv2FyMg21dIz033f9g5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH3PR11MB7844.namprd11.prod.outlook.com (2603:10b6:610:12a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 23:20:39 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 23:20:38 +0000
Content-Type: multipart/alternative;
 boundary="------------N3J5NKBRrhQoqn4d1RRFvFaj"
Message-ID: <b4037c59-84ce-b1c0-c2dc-bd93b43889c4@windriver.com>
Date: Mon, 17 Jul 2023 19:20:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [mickledore][PATCH 0/1] Cherry pick commit from master
 to update webkitgtk to 2.40.2
Content-Language: en-CA
To: steve@sakoman.com, Kai <kai.kang@windriver.com>
Cc: Kai Kang <kai.kang@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <1771AA996BA380BB.28005@lists.openembedded.org>
 <6dc56bfa-5736-74b5-b13b-ef014a24ce9d@windriver.com>
 <CAOSpxdZ1Z3=o=TZDubjm00V69H9cibJKuipdSkf513vBbdENJw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdZ1Z3=o=TZDubjm00V69H9cibJKuipdSkf513vBbdENJw@mail.gmail.com>
X-ClientProxiedBy: PH7PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:510:23d::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH3PR11MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 82747721-924e-45bd-19e6-08db871c6e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+0ZsxWIT7z2IulUw76MbErame887wXoqbqqdm2qOY0dhtmBoha2WEAwg0I4mu/fCw4A3eqOYJLXfU21Mx15/j0o24pm5mQsn8GLl15OGxpJ+TFDDdJNud0SMhYyKY7fbQ6KtZfx9UrtzwuDoNGuT5TP8Y1BvxCwFPY0nmq5HAesmxi8xdG8YGKju4d/Uwvi/TCnslAIeT4v6Q8Hy/KI8+1eAuxeaxEpCfFcbyunIT6NnSF/j83osBbNoSou17wxcMaRphGslexv4xb/ECtvImYdsnHUt2TuM7vjif5lwpambzXnJD8Fy0S5pHEv+Qn9XysVKtUENIH40PHD69myU7xmKEo0yuKa7C5yi6zVBcHHpsJi1DafeOnnjW25+sXDOo1jr0pjvEgoRZDHdWshIL+n/Iw5MHETRTcL68iHmhsyfLvcVOQfPHc3vGSMVmuuhaN5d3tT4ZEVNe1V+Cv6WpIdU6vOo+LqsLZVH9SltzE4zILHNa7AaBoeK1aZNixnPzzCyCwvJDVI6jm6MpnFwmNnho9YmcASXjKsVeTp/baOFdx+LRqxQ4tTaGxKaVX/aFON6IYedtO/GDqapyplt8ZVmb56ln0jRNJP/MAEm+22/l1oeao0umKjq5imnt1uR/hmwwHFDl3+G/wtUYjBf+A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(451199021)(33964004)(966005)(66899021)(6506007)(53546011)(26005)(38100700002)(66946007)(36756003)(66476007)(66556008)(37006003)(21615005)(5660300002)(31696002)(2906002)(316002)(6636002)(41300700001)(6862004)(4326008)(8676002)(8936002)(86362001)(6486002)(166002)(6512007)(6666004)(478600001)(15650500001)(2616005)(31686004)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZERWeWkzUHhlRGlMVnFucVIzQWEzZXV3Nml0SWYyVTNxZ0cvR2JieitQQ0Fm?=
 =?utf-8?B?YUcwcmVaeVR1MEVYdGtzbDBTNGVHUm1aR0duS0hyNnd6SDV5ZnV6eEU5cE8z?=
 =?utf-8?B?ckpMODhzcVJ5NVNqRE4yM0lrNEg1SHN2VXZrNjRxbGhMclJSTkkrd3dEVWlD?=
 =?utf-8?B?dHBxU292Y1pSbmp1MHlLT05vNEx4ZVV2endIdDZnejYyY1RLWHlINXBhQXN2?=
 =?utf-8?B?WkZocVZUcG9sS1JNbEdCN3VZbnFRV2ZFQlJXUWFsOHREdFo5Y1F5Q0w5eUMr?=
 =?utf-8?B?WlN3cGwzS0o4b1JrZDhFTDd1d2tYZDVJN042bCtxdm82R2F4SlowZmdranEw?=
 =?utf-8?B?eDcrQ2VrYWtNUDhBUXBVZnB0cTRleUlKUVNMVjd4SlplRHc3VEdxOS9FYTVn?=
 =?utf-8?B?VWRTNjZaZkYvWGlqWkFtY3hzaFI4eU1CSnBZbDZQL3loaXR5S2tvc0VOWFFM?=
 =?utf-8?B?U21QdjROcDFKamNoNWNJV3habzFmNkljcWRkZy9rb2VMOC9JS20zWGwzaEQ5?=
 =?utf-8?B?R1ZDYVJpMzduR3dIaXFWSVVQbDZWWUV0Wm5EeTBaem5DYlF4M2dnNElDRU5H?=
 =?utf-8?B?ZldET2MwSE5zQ2pZLy9YM1haeG8rZ1lYK0w0eDlCVVVvKzRtWlIwS3M1elQw?=
 =?utf-8?B?OU5COGQ0OWIrc2E5ZjFNeU9ranBwei9nR3ZCOTEydkFmaFNieHZIaVROcTFU?=
 =?utf-8?B?QXVtWmw0UVprWVAyM0xCbzVJNjd4WndXOElnbkxXNUVsc2xldGtSaWR3bDRv?=
 =?utf-8?B?MWRBWEdnQkRoSHJSbnZpWnBMeTFLQlBpWURmRm0yWkVGcS9HM0drM09GU3NY?=
 =?utf-8?B?UXZXVnZhTGRwSGtPcWFPZEJyOW92bDdkeFcweHY0TTVyc2hsMzBrbkpid2Ey?=
 =?utf-8?B?OHNiaFdWd3piaUNCSUxuMFV2eXVoY252SmcvWlpjMUlFditsT2Y0WGxSODJ4?=
 =?utf-8?B?V1UvSzBnTE9EN3Y5KzNZVktHeG90bjRITnJoQ2xnSWlXcHVuN01uSXFCcG9w?=
 =?utf-8?B?SkYva3pSdFlDNitGSkhmUFpqSW9JZTd5dUY5djFRT3BHS3NlRG1ZUlJRTHRu?=
 =?utf-8?B?QVRPeFR2YklHeUhzdlllbnh4eVRZNTJaYW56TmlYMWQ0ZjhEMU54TWgyd0dZ?=
 =?utf-8?B?V3Qrb2VBTGV4Z2hnZHEranFDTXk0eDVQVmduN1pobTFEU2JzdmlFYTBEemVZ?=
 =?utf-8?B?NHNORzZzQlQraThYRmJBQTYzMTVGYUFJeC95SE5UakpQbVpZK21IbkIxVFB5?=
 =?utf-8?B?T1BXWENkVHZraVo4M28zNmQraWVCWDRWWEpXUEVVUmVsYjhjbDNVbHZ3TzZN?=
 =?utf-8?B?SFhQUmVWU00vZzhCSm5EU29GR1ZmOFhBdkNQY1JvNFZidC9ZUHk2RW0rN0xv?=
 =?utf-8?B?RjUxTDdIQVZPU2NYR2RhdjlKVytOZzBmenpXYytxY00wV1U1QlAvbnRUeFpt?=
 =?utf-8?B?eEZMVGlGTTNOK0wvVEtRaUphT3NMYnZHaFN5eDZzcVhCcjdYelh6K1VkeDhO?=
 =?utf-8?B?UDYxMzZyNHB5WThFTDUrUUJKcUtTT2Rybm9wLzJrWjJ3ODJGNlYybk03UkpJ?=
 =?utf-8?B?V1pmYjJCOEh3N1pDQ0p2bUludS8waEJnZmczNEU1S0xud1hFTmYxRXg2R2RF?=
 =?utf-8?B?YktVSDdHSm50Vjl0SFlReEtLVm9wK2x2ZGJYV2pCUmJIVzUvNUY1RUg3MUtE?=
 =?utf-8?B?WlF3WkpaT3lsekJBTVhBSkNMQXVzQSswQzRhalNZRzBhbTdFR2g1ODhDbmIz?=
 =?utf-8?B?bVFmZG9VL0JMRWJMUkViQlVIS1pIc3l0N0lYNFJ6cVdKak4rSnlPeXpTYk10?=
 =?utf-8?B?WFgxazJaeDlkYXp6NmhQcXhHdWZoVVozWGtpNWZFb2ZQdXBGUFpmWG42NkZL?=
 =?utf-8?B?b1hCcXBzYjc3RlpmeGVrVG9OU1Y2ajV2Y1Zvdy8wQ0tLdEN6Yno4enpxU1RV?=
 =?utf-8?B?YWp2bHdQMjlaOU5PKzA1elBER3BsRUxBald6dFpKSWo5cHJVb1Zhbk5ZaTA4?=
 =?utf-8?B?clJkcHpTUGVwTmQvcWVxeGhxZjhMdWNtZ2FtcHlJdlBxVHJSQmgySjdGMXV0?=
 =?utf-8?B?c3pFNVplYjBJdkFVL3prazZvb003ZHlRR0JkNFViTER0VldIWVVFQ1I5T0hZ?=
 =?utf-8?B?VVIwNEJTUWM3UUNuSE9MN1l3cFN0Q1doNHhTTzI0ZTRHTjRuOUtCb08zd0l1?=
 =?utf-8?B?RWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82747721-924e-45bd-19e6-08db871c6e54
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 23:20:38.4580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiuITc5p460WQzSEM7ifkZmsP7C1OgNUaDImh1HvZYYpvPHKmVhEbErJW2EViULYt7Afm8us1DLnjHJYm3Lsvx4M4YLreypGwrSU4k+uyU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7844
X-Proofpoint-GUID: 80pJi9UcpG4JoZlJFOPdIDxza24c8QBN
X-Proofpoint-ORIG-GUID: 9k8gJ4gx42rn97mB0pmBzSqt9abi0Ri_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=938 clxscore=1011 adultscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307170212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 23:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184483

--------------N3J5NKBRrhQoqn4d1RRFvFaj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36HMNRi8004234

On 2023-07-17 12:09, Steve Sakoman via lists.openembedded.org wrote:
> On Sun, Jul 16, 2023 at 3:34=E2=80=AFPM Kai<kai.kang@windriver.com>  wr=
ote:
>> On 7/14/23 15:15, Kai Kang wrote:
>>> From: Kai Kang<kai.kang@windriver.com>
>>>
>>> Hi,
>>>
>>> I've discussed with webkitgtk maintainers about api compatable issues=
 on
>>>
>>> https://lists.webkit.org/pipermail/webkit-gtk/2023-March/003887.html
>>>
>>>> WebKitGTK 2.38.x is backwards compatible with 2.36.x, you can safely=
 update
>>> without needing to change applications. In general, we always keep th=
e API and
>>> ABI backwards compatible.
>>>
>>> Note that the current stable releases (2.40.x) introduce a new API le=
vel
>>> when using GTK4, but I suppose this is not a problem because most lik=
ely you
>>> are still using GTK3
>>>
>>>
>>> I suggest we apply the update in mickledore too which solves lots of
>>> CVEs.
>> Hi Steve,
>>
>> I have no idea why the cover-letter is not in the same thread with the
>> patch.
>>
>> So according to the reply from webkitgtk maintainer, would you like to
>> re-consider
>> to cherry-pick the commit to mickledore, please?
> Sorry, still not possible, this is a major release bump that adds
> features and APIs.  Please see:
>
> https://wpewebkit.org/release/wpewebkit-2.40.0.html

We do need to be careful but upstream is saying that:

 =C2=A0 "WebKitGTK 2.40.x is backwards-compatible as well and that will=20
remain true indefinitely,
 =C2=A0=C2=A0 as long as you continue to build the same API version [2]. =
"

I'd like a simple way to measure if that's true but I'm not sure one exis=
ts.

Kai,

Have you looked at the source diff to understand how upstream is able to=20
introduce
a new API yet enable building the old one?


Kai, Steve,

Should we investigate using the flags suggested:
 =C2=A0=C2=A0 "is still possible to build the old 1.0 API using |-USE_SOU=
P2=3DON|,=20
or the 1.1 API using |-DENABLE_WPE_1_1_API=3DON|. "
 =C2=A0 -- https://wpewebkit.org/release/wpewebkit-2.40.0.html

or do we really have to backport patches to 2.38.x ?

../Randy


>
>
>>> Alexander Kanavin (1):
>>>     webkitgtk: update 2.38.5 -> 2.40.2
>>>
>>>    meta/recipes-gnome/epiphany/epiphany_43.1.bb  |  3 ++
>>>    ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 +++++++++++++
>>>    ...44e17d258106617b0e6d783d073b188a2548.patch | 42 ++++++++++++---=
----
>>>    ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 +++++++++++++++=
+++
>>>    ...bb461f040b90453bc4e100dcf967243ecd98.patch | 30 -------------
>>>    ...ebkitgtk_2.38.5.bb =3D> webkitgtk_2.40.2.bb} | 15 +++++--
>>>    6 files changed, 111 insertions(+), 48 deletions(-)
>>>    create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-=
JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
>>>    create mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab=
35258a6da9b13795c9b0f7894bf4.patch
>>>    delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f04=
0b90453bc4e100dcf967243ecd98.patch
>>>    rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb =3D> webkitgt=
k_2.40.2.bb} (90%)
>>>
>>>
>>>
>>>
>> --
>> Kai Kang
>> Wind River Linux
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184474):https://lists.openembedded.org/g/openembed=
ded-core/message/184474
>> Mute This Topic:https://lists.openembedded.org/mt/100136728/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------N3J5NKBRrhQoqn4d1RRFvFaj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36HMNRi8004234

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-07-17 12:09, Steve Sakoman via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZ1Z3=3Do=3DTZDubjm00V69H=
9cibJKuipdSkf513vBbdENJw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Sun, Jul 16, 2023 at 3:34=
=E2=80=AFPM Kai <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kan=
g@windriver.com">&lt;kai.kang@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 7/14/23 15:15, Kai Kang=
 wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">From: Kai Kang <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang@windriver.com">&lt;kai.ka=
ng@windriver.com&gt;</a>

Hi,

I've discussed with webkitgtk maintainers about api compatable issues on

<a class=3D"moz-txt-link-freetext" href=3D"https://lists.webkit.org/piper=
mail/webkit-gtk/2023-March/003887.html">https://lists.webkit.org/pipermai=
l/webkit-gtk/2023-March/003887.html</a>

</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">WebKitGTK 2.38.x is ba=
ckwards compatible with 2.36.x, you can safely update
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">without needing to chang=
e applications. In general, we always keep the API and
ABI backwards compatible.

Note that the current stable releases (2.40.x) introduce a new API level
when using GTK4, but I suppose this is not a problem because most likely =
you
are still using GTK3


I suggest we apply the update in mickledore too which solves lots of
CVEs.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">Hi Steve,

I have no idea why the cover-letter is not in the same thread with the
patch.

So according to the reply from webkitgtk maintainer, would you like to
re-consider
to cherry-pick the commit to mickledore, please?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Sorry, still not possible, t=
his is a major release bump that adds
features and APIs.  Please see:

<a class=3D"moz-txt-link-freetext" href=3D"https://wpewebkit.org/release/=
wpewebkit-2.40.0.html">https://wpewebkit.org/release/wpewebkit-2.40.0.htm=
l</a></pre>
    </blockquote>
    <p>We do need to be careful but upstream is saying that:</p>
    <p>&nbsp; &quot;WebKitGTK 2.40.x is backwards-compatible as well and =
that will
      remain true indefinitely, <br>
      &nbsp;&nbsp; as long as you continue to build the same API version =
[2]. &quot;<br>
      <br>
      I'd like a simple way to measure if that's true but I'm not sure
      one exists.</p>
    <p>Kai, <br>
      <br>
      Have you looked at the source diff to understand how upstream is
      able to introduce<br>
      a new API yet enable building the old one?</p>
    <p><br>
    </p>
    <p>Kai, Steve, <br>
      <br>
      Should we investigate using the flags suggested:<br>
      &nbsp;&nbsp; &quot;is still possible to build the
      old 1.0 API using <code>-USE_SOUP2=3DON</code>, or the 1.1 API
      using
      <code>-DENABLE_WPE_1_1_API=3DON</code>. &quot;<br>
      &nbsp; -- <a class=3D"moz-txt-link-freetext" href=3D"https://wpeweb=
kit.org/release/wpewebkit-2.40.0.html">https://wpewebkit.org/release/wpew=
ebkit-2.40.0.html</a><br>
    </p>
    <p>or do we really have to backport patches to 2.38.x ?</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZ1Z3=3Do=3DTZDubjm00V69H=
9cibJKuipdSkf513vBbdENJw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Alexander Kanavin (1):
   webkitgtk: update 2.38.5 -&gt; 2.40.2

  meta/recipes-gnome/epiphany/epiphany_43.1.bb  |  3 ++
  ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 +++++++++++++
  ...44e17d258106617b0e6d783d073b188a2548.patch | 42 ++++++++++++-------
  ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 ++++++++++++++++++
  ...bb461f040b90453bc4e100dcf967243ecd98.patch | 30 -------------
  ...ebkitgtk_2.38.5.bb =3D&gt; webkitgtk_2.40.2.bb} | 15 +++++--
  6 files changed, 111 insertions(+), 48 deletions(-)
  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaS=
criptCore-CMakeLists.txt-ensure-reproduc.patch
  create mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258=
a6da9b13795c9b0f7894bf4.patch
  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b904=
53bc4e100dcf967243ecd98.patch
  rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb =3D&gt; webkitgtk_=
2.40.2.bb} (90%)




</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">--
Kai Kang
Wind River Linux

</pre>
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#184474): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/184474">https:/=
/lists.openembedded.org/g/openembedded-core/message/184474</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/100136728/3616765">https://lists.openembedded.org/mt=
/100136728/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------N3J5NKBRrhQoqn4d1RRFvFaj--

