Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E650C25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 08:09:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.730.1660896558899444705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 01:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=B1YrzIhT;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5230d96046=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27J81R3s032256
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 08:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=417F2IfmGtKRYkAuRdsPTiTmaxji1O9jswbhOpjG9uA=;
 b=B1YrzIhTHh9+6I5r3viF0XJ3KBVbXSx0cjIqM/TYchgVaPeZ374j4P+BY/oMNGz5ckzw
 DdXxtLf/qyQq6rksKoyFNR3D1KQlUHD4sRSQDzA1KGmceNOC2UlaYmR3E6bt82AlQPYX
 fIzl/AGWs39wn//YKRld6TTlJJJKoHynStbbBR1PGfUc13WC0jurqyW07uHd799vYban
 ulLapbrrLW/V1TM3Ajd0oJGIm+ktx+tOKYOX27/K5NKUIVLv9MuqwBZOFzdj95aqxfa7
 x7scvP6PBXgrHwFd3bQwT+9anfhU6O3Jh8KamV0kOdP+pAsl+R+ohMn1/Vm4wb2iEseo pA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx2x8n5vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 08:09:17 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27J89Hqo013557
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 08:09:17 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx2x8n5vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 08:09:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ7rX0FvByqkm2wyxDvzD2VsAIDT336zozjce7HWkSCYuo+DJZ1LKkJVre+OP5EYKYKzV/0E7xPYN1ocp+ddP5OPXAm5UYVBTZrtRkinCm7KCSKiac7QsT5KTCHCE+l5AcqvzHh2xPqHp9FOwLKEc+6kTW8Jht8q3wjhamGehypg5Irm7qA3qSXHl5XRJRpOtiPZDW3nFjYTuFeTkcIX406XsXnmScBR7nmwd5FAFawB0JZ5IoZ7pHyxP9kl0fc8Ar+VRfi7c+6fJznD74LPQ73V+NvRWAuEXtNSSLhSneaa9kOzkVF3GjocHMJ+GK2gj2G0bqdXW1E0DWkfu9NBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=417F2IfmGtKRYkAuRdsPTiTmaxji1O9jswbhOpjG9uA=;
 b=DkmfW5HKUtpnc4axcnqDSs1BEom21jZ4ZHOoWi4WspWXegN4AUojcL6mpAlL7wuUhmrwY8JuTQVm2710nGUlZuqOdlJGY6OcX0zFTa41SE3QQi4hEv4GinlPNBVE1QzQcTGSWQIWLuPD9nP7ZLVH5pslTIoN/eqVF/0dH+jvC7tzKkAuaZVhs1IsvTr0clCsrzgh29SPtJsNKAlp1hyOIniuhs2LpUJM3vDfSnsgCX/gbfgXfzPecDhZ1BhcWkJ31Hq9iQ0n+eyNQxbKTP5YlXqvYeI2mn1VcP35FO5AFDXP2anj9n10Z6LqGv1xcgNiWL0M3Xa1Xp2gmQe/wk05fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH0PR11MB5426.namprd11.prod.outlook.com (2603:10b6:610:d1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 19 Aug
 2022 08:09:14 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%3]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 08:09:13 +0000
Content-Type: multipart/alternative;
 boundary="------------SUO8pRPUbJcTTpiJS3zaBlHl"
Message-ID: <ab7d4e38-db17-edd6-3914-7a53f313d691@windriver.com>
Date: Fri, 19 Aug 2022 16:09:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH 28/42] python3-hypothesis: upgrade 6.54.1 ->
 6.54.3
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
 <20220819072727.2236928-28-alex@linutronix.de>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20220819072727.2236928-28-alex@linutronix.de>
X-ClientProxiedBy: YQBPR0101CA0209.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eb4f834-515b-46ae-5524-08da81ba1aa3
X-MS-TrafficTypeDiagnostic: CH0PR11MB5426:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+vdKfGcVrDH1A+ZCjuJO0DlrxLeGxQjQmvo3Y7WMTcLFeQFu8i1tEC2PEj//IX3xIjrhUSp7kKHvPhu8+lkSlRqaQKn7aUVlNz0XNFMZoSRVB+4PeCl51mly5XzylkdfTZveeJKwl0eZhlI/DKp46qw0SDIrbtrJAwmsuK6Joi5ucc4B02oM5PpgYh0tEAKTSfsM7uDyEEXyy9H7ud5eBIlqlf+1tZdPpgXMZBwENP5DUmqwVmm609RjvMEqbKdLaYt03iOXgjppDcjQvkuKlLqDbMg58uBa8HCB2slY11se6/pDEYUxSy3dFs2Bgbf5E18OK5JDl6NpzkLv8+v3+VP29qLBVGmomeV5wK3GgtMuaSZxVYz7E9Mzrb1tb5+wHK13/6c0WNr8QPkojnaLSB55fd5b9ENdwC24XR9y591r2ZU2HHEsBGAiXidKtSQok0ASPf6mfTuk7rghm5JmwYc0G1Bkh32WIZH3De5l+cJhcqDprZyFvfvE3AYiqGu/N1wdZ5l4yaWgZ9E9sl8s+k1vOxSisPqaMuQELNuAEAr8C33LouxS8LX9M+YyuVS/3Tf9+jsUO/N/PtyNf2xRYuDk/plxHE7vYEY2VFg4zR96b+RMyrIf7bWDXJrzYOgrUQWZtA3PCyJqdp1tqoB51QMoFWersMroe8HVVt3lsUW0BLgRa1WP9rw1RTUYul03VII30nkQk6Yc7LmHHLrSEpp5BnR3BWFLn+u/IM20qOa+kKGfXLqZ2llGmZ6kAYoE5pHmuR7+iDduQKwK5c89x06Iw0stV+WSEKoEjongJwn82YSPP3IcMcldx1wUc+xNyegO99+IlrRmI7kmrJ4U0p8UwkgJ7Slkc+mvf+QWXv0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(478600001)(33964004)(36756003)(41300700001)(6506007)(26005)(31696002)(6512007)(6666004)(86362001)(166002)(31686004)(186003)(2616005)(966005)(6486002)(53546011)(83380400001)(316002)(5660300002)(66946007)(8676002)(4326008)(66556008)(38100700002)(66476007)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eENTVi9Lb2FLMEM1ZkRnRnQ1b3lsbEVRNXZlUEVWeHRsRHlEdGR3anZwYlZt?=
 =?utf-8?B?OVB4aDFxUi92T3lvNmRCKzRpQmZYMjNocFFCams5RU1JSmZLc1BrL3ZuSzJZ?=
 =?utf-8?B?VXN5L3dPSGFPRXhOQmhQdldTbElPVzVBV0JOaEluOHRHNS9kYk1rT3VrSm9k?=
 =?utf-8?B?TUUzQy8zSnBqeUNIdGkyWjRHUDYybmMrZ0FHazJMcGM4bFNlZ1BycmduNTFP?=
 =?utf-8?B?SktqSDJMeWMxSFVGV1JLT2Vsb3I0clBtT2t1eERjdWpsY0E5NUt2V3haZlhY?=
 =?utf-8?B?QS9UMGFyQ3Y1eFROZkYvbGpOMWlDdjAycmpHbXE5MER3aFh6VG5vV0pCOGt5?=
 =?utf-8?B?RGRBWXlFeHVFSnZoVG0va1N5blF5Z1luQ2NiK2V6ZWwvMFFNTTVzd010cGtZ?=
 =?utf-8?B?ejBCcmNpL013TmQrWThJOGRHTFpNaTE1eWJCaXdjSlc3Y3gwbVBMZDlva2RF?=
 =?utf-8?B?SGR1QVo0SlJiMWtIVXNHZlFTa0hDbm1xQlRsQUU0MWxaY2FwNUNmc0RiZFox?=
 =?utf-8?B?dVV6dEJHYXJTR083SktzYVR0VTBQNE14blk5dmM5cjJpVlZtYndhMzBLMWlU?=
 =?utf-8?B?NlhTRklIZWRCajQ2OVR6VENBZERtdHNNR0lhdlZCZGNkY3JNektxRW5sT25M?=
 =?utf-8?B?aDRtbVhOYW5YMWd5OFdxTU9rT2prRmlFemtESHNhbGtzQ2s3WWx3SUNPT2pJ?=
 =?utf-8?B?WGNHMjNHdWxhWkhtYnlCOHFGekxtZEJVNXVvazV0K0ZzQllaaGpaZTkyVlBM?=
 =?utf-8?B?Zk15TllYTG5NK0NES1JFWnZDQVZaQW1mblpTNTNTdlN5dStzdS8zS0paWDkx?=
 =?utf-8?B?UkgwbklDY1d5L0Ixc3JBYVJ0d2FzWVN1YVFvT2x1cTgvVk9pZUk3N05RMDdV?=
 =?utf-8?B?bFVlaHIyNk1wVzk5a3l0bnhxSUVGcXRtblJFamxBNGh4OUZyQU9FRWRuTjlH?=
 =?utf-8?B?RjhCNVN0RjRKWmg0UVVVbm9TRXcrVE9ndlExTnM0QSt3NVNKaEVrNHpKWWhk?=
 =?utf-8?B?U09UM2dpOVo5WmNRdWJ2T1pWZzUwTkZSbzJ3YXdsdXF5S2prRTRteStaWXVI?=
 =?utf-8?B?a2ZlZFdaNnE3RzRBcVZ0cTlPSWFnbXVQYW95L3pLVlk2QnNzM0lGM0N3eHJY?=
 =?utf-8?B?RENpa0VuQkpOSHorRHJsWDFHYUx4bUtUK3lrYmkzVnp2YVNCTDMwQTYvTVdt?=
 =?utf-8?B?RTI1dDVGTEt0d04rdFhRRDNUSXBlbEgzSENDSFpqdWZmemhEMmphTU5UcjNW?=
 =?utf-8?B?cEZNK1N4emIyWmRKMlloQUdrd2tKYWppcmdoVENJb0ZkUU55V3RuN2kvUGZS?=
 =?utf-8?B?amM4b2ZvdTJhaWo1c01iZzhITnpnRUpUQklBL2doMjNqU2NWOGdmWWxvZkxa?=
 =?utf-8?B?L2NUZkJUYXdVZ2VRNWlpZTEyUXdydG1MOGlSSUdjNnlpSUxmdDlUdkR3UDl4?=
 =?utf-8?B?aFhlUTRyaUIvWHg1elhxYkpoNExNWWpoQmR1WVRqMVphbWZqSEdQQ0FzbmVk?=
 =?utf-8?B?dS9MZGEvZTgyZzhJeTVmTkliaFpJcG9Vak9nRWZ4a0RrRWtnSzkyNHhiRkdP?=
 =?utf-8?B?OEdsY1Y0WVFLcHVPanJ1RXlzV3pGc1QvZjcwYnlIL3lEN1BFN1ROaDlIWHBF?=
 =?utf-8?B?VlF5UTY2a0RObDBaWFAzME9TeG5XckdKMCswOWZzek9EUTVuYlE4SWRUUk5N?=
 =?utf-8?B?MEx4Q3ZjTFhLeXIvUjVkOUlLSlQ0NVFhemI1NCt3SHRCY0Z5Q3VjQlJSM1ky?=
 =?utf-8?B?dzArOEhFRGpUdzdVWklYc1p4TktLTVViRjAzTEE0S1gvNzVHdjZwWlQvRk5j?=
 =?utf-8?B?YURxc09qN0llU2dRZE9lRk5QSkl1SmNIYWNkRW9ZU3lGTUpZL1hJZXpPYWI0?=
 =?utf-8?B?MnpST1JzV0JZOTRDZlpZMHUxMzhlWU9HME1XU3c1REw1VlZyYXpUT3JPc1Zm?=
 =?utf-8?B?S0F3Nm1HRlc3bi94dE9zM0Z0aFpMdDdpRzZwb05oNFRsUnc4Umc4R0tmaEZr?=
 =?utf-8?B?NTNGU29tNU5xWG5KdGg3VTMyY09ETndQVEUvT0ZKQkdoNVc2N2VadmtsU2hB?=
 =?utf-8?B?M2hvaTFHNFhFbjJEd211RjZnRTBYOE81U2VjNGdtNjZ3M2VWekdJK2FvRk4v?=
 =?utf-8?Q?Bt96JAa+YceNZVS2OI+ulk7+B?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5eb4f834-515b-46ae-5524-08da81ba1aa3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 08:09:13.9045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 f4yPyg2Roq0vJlBJ+N6KOIF/YJb56fu/F126VQ+pg7Iy76HlztbWtlosZcFyMvlWqeMRPSabq2KDJEYpjjS8BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5426
X-Proofpoint-ORIG-GUID: O2nutqmCvWqx7KKOUvwIEPzGwtRmK7aj
X-Proofpoint-GUID: sorrT4k7_iM_a0V_P-3tjpifPy8S3ftA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_04,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208190032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 08:09:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169614

--------------SUO8pRPUbJcTTpiJS3zaBlHl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

I sent a patch to revert this recipe's version to 6.46, because it was 
broken since it was upgraded to 6.48.
In short, it's trying to use some python3.11 feature and falls back to a 
module which itself is a backport from python3.11.
More details are in the commit message: [OE-core][PATCH] 
python3-hypothesis: revert back to 6.46.11

Regards,
Qi

On 8/19/22 15:27, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin<alex@linutronix.de>
> ---
>   ...ython3-hypothesis_6.54.1.bb => python3-hypothesis_6.54.3.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-devtools/python/{python3-hypothesis_6.54.1.bb => python3-hypothesis_6.54.3.bb} (91%)
>
> diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
> similarity index 91%
> rename from meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
> rename to meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
> index afcd5e64ef..7874fed296 100644
> --- a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
> +++ b/meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
> @@ -13,7 +13,7 @@ SRC_URI += " \
>       file://test_rle.py  \
>       "
>   
> -SRC_URI[sha256sum] = "de63c34309181875e71d0f5d1c1051c9320a1fe0517ea6733af8cedf818191f4"
> +SRC_URI[sha256sum] = "03749f5e2cb982e54e2a11abcb367b9a260ef8e279387d437145354c080a6bdc"
>   
>   RDEPENDS:${PN} += " \
>       python3-attrs \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169598):https://lists.openembedded.org/g/openembedded-core/message/169598
> Mute This Topic:https://lists.openembedded.org/mt/93120253/3618072
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------SUO8pRPUbJcTTpiJS3zaBlHl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Alex,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I sent a patch to revert this recipe's
      version to 6.46, because it was broken since it was upgraded to
      6.48.</div>
    <div class="moz-cite-prefix">In short, it's trying to use some
      python3.11 feature and falls back to a module which itself is a
      backport from python3.11.<br>
    </div>
    <div class="moz-cite-prefix">More details are in the commit message:
      <span class="error">[OE-core]</span><span class="error">[PATCH]</span>
      python3-hypothesis: revert back to 6.46.11</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Regards,</div>
    <div class="moz-cite-prefix">Qi<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 8/19/22 15:27, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220819072727.2236928-28-alex@linutronix.de">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex@linutronix.de">&lt;alex@linutronix.de&gt;</a>
---
 ...ython3-hypothesis_6.54.1.bb =&gt; python3-hypothesis_6.54.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.54.1.bb =&gt; python3-hypothesis_6.54.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
index afcd5e64ef..7874fed296 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
@@ -13,7 +13,7 @@ SRC_URI += &quot; \
     <a class="moz-txt-link-freetext" href="file://test_rle.py">file://test_rle.py</a> \
     &quot;
 
-SRC_URI[sha256sum] = &quot;de63c34309181875e71d0f5d1c1051c9320a1fe0517ea6733af8cedf818191f4&quot;
+SRC_URI[sha256sum] = &quot;03749f5e2cb982e54e2a11abcb367b9a260ef8e279387d437145354c080a6bdc&quot;
 
 RDEPENDS:${PN} += &quot; \
     python3-attrs \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#169598): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/169598">https://lists.openembedded.org/g/openembedded-core/message/169598</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/93120253/3618072">https://lists.openembedded.org/mt/93120253/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------SUO8pRPUbJcTTpiJS3zaBlHl--

