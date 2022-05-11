Return-Path: <mark.asselstine@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D58C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 19:45:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1393.1652298309594027351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 12:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EpbGUsDa;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=213085b3ee=mark.asselstine@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24BGwfhj002480
	for <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 19:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=mbeKPKUccOrYG4pCd03FXVFw4WmjX9gj6+vb2/O1HlM=;
 b=EpbGUsDaWFYq9aRpswZ5ETu1lD3SbzYFDEiJ00IcLLyxNeYUAX6wNLORxwyejbT72zox
 ySn9GPeFVP3kFEIJM2TFMa9Cp39siR+2qSvKPZPSCk8xyUMEQ4lSY9VQjFSinJY5HFs9
 n3H6UPMuWxAEiXfEWDo5efJlKKu/0Z9lOBMaR9jLiQgoZy4//XER8SpRPmaic38dM1qW
 YaQ8nwqf170uRMuY38Lgfm4Bq1P+PmzOxNztYx9jdHgDtxeTXgID8mh7H1l0Jry2w+HC
 /C4mF7CkU2KQKeAfZDVVeGBmt3yfoyY862iPv5WWv6WL1PGwyH6Dzb1KAxwm/H1s9clI pg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwdyyudwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 19:45:08 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24BJj85T003547
	for <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 19:45:08 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwdyyudwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 May 2022 19:45:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hr8vTuJpOst3QbdCnIc7db1Gms+GuR4ZN62A4nU00vN0YDr149lp3l0EbtcCM1R01OVUg/iUYAZxYHHshFgOQjNhcbYTHclwurVqjRInYy3PuIBsh7n+fdFUSTyAGq/j1TTzve+e6AINnm9D1Me4y+LRoKVpb7m1XElg2PECv1AK4Dg9mairOeI4GjHa5OD/soosk9NxHGq8cFJ17QD184xfQmm24vtWZAtmJbrfr5TYchE++wO38zjFHVz0oGu9dH6GlY0mb9cqpog4Q7yRxcnjLjtGZduF27caGNL61peMGjwHbJsQXW8Aw1ur6LU39FHSo8pBKEO/kpSZSBWEdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbeKPKUccOrYG4pCd03FXVFw4WmjX9gj6+vb2/O1HlM=;
 b=RC7Hhc/G7QAggu1Edom/HDH+N/Kw39er+NjmwuBH5GwSrX+3RrOkBHr9K+jfWz6X4DHH6eMK4KUZseuw0133V30wMAOZkruD9+/FrC2u1rwhjSEoqb6q7Plvz3IrwRaWeTA61t3CxJ3HnC0/CcgeLSdBT3suMNV+owCd5yx1EiVWlN998tANHm++q/E4FcitZOenk/dkUDWQljO4yxhqQiGKr7OA5Oqez4lpSMA/SLapWRB/DgVSwEHD7sL+wTsRMwQE/c/5qEl3ppvQfcYBKfpt7x2j8PPT0hHyG1hNRiUPziB9JtllPB+gJ0xFGXN7IVWHQmxp1abtPduwXoAXdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by DM5PR11MB1916.namprd11.prod.outlook.com (2603:10b6:3:10a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 19:45:05 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2585:f5e4:9eab:5fdf]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2585:f5e4:9eab:5fdf%3]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 19:45:05 +0000
Message-ID: <80f21134-10da-402f-de0b-2c52a599a845@windriver.com>
Date: Wed, 11 May 2022 15:45:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH 1/5] recipetool-create: add ensure_native_cmd
 function
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        Lukas Funke <lukas.funke@weidmueller.com>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj_bYU0RFtyaTzeVWZMCHfxtQwP-Vjt7ovqOHh8+SWduHw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
In-Reply-To: 
 <CANNYZj_bYU0RFtyaTzeVWZMCHfxtQwP-Vjt7ovqOHh8+SWduHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::32) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 000cc19b-236c-4e5b-0fad-08da3386bf14
X-MS-TrafficTypeDiagnostic: DM5PR11MB1916:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1916D2ADE1E8D995BF6F7EADEDC89@DM5PR11MB1916.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vI37EdWGYCTgoZiMsgcke7OxEkW39yoKLmlRCVH80d4Bo2Pgruqx++VRwn/SRsH4OPNM+Jgkcwh4r1Hi3SLtp8uK9GT2BBMm44doXfS6vbNKyV0FK4JTfjGU1/Ry0f8CoC8UR7XEbabPAaYGim4I2lwjTjbmwW4VR5fBLo0fLm3HkgqPLDfS5BFx30VeHHo9BLttjabDBhOKtG6sYstniuR7tuoDfOFnMRTmluo5gu5GkhK5+bq7qUU/Aa/iYoAxEc57GMaUUNf/iiTvJ2eiizZ9Ick+xMWFgqhj43UCOIOZVRv6Pi8dt+DzLh6vdYTg0TAvf3eLRLETJGluYDPHpXATkIMxSfGk8MXkgjoeGTx965NkV7B9dOvFt8FkNbe89l3AevpMD6x+OAue7tO02YZly3+Ohit7oUm+povUdaDK/dMyf/hcup0m6POg3OzXWzX24OI4CQrPwN+szU7en2W7vJtn1AQdwVRAUNJgJ3rTHlTBQq/H+SQo25ojkrzWA1cu9Z8cI/cle8Ax0zqgJgNXcnCWJKdOpJNT9fC7MQjJ/dMc87dLzOsPwbCyEr3N1EH3Z9oxikgJGAYSkbMeTa0XrC5knIbKbSp/m3ng9MT9JXk2iwoYSY7yWnog6Tt1uYFBE2UlBr/kVLDoqJok6Nb8YvXgyDEhSK0HeyvB67A/u8xR9FOa+Fa9MGQlAWI4Oq/4/zAwHJtt7rQu67m+F7YSvmwzTBWnbTg2o70fEq+GZqFajV3C2mE2NRu/mUZNULf1N8O6p1w0udXXyzlIElD/p0vgzC75YF3hGmJL5gvir3zwHHoOt8I0wlsmexkG5aeFqaPZUv+vI7so9AwjtOZdz7MAwZVaNC4iEZM4w9o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(86362001)(53546011)(8676002)(6486002)(26005)(4326008)(31696002)(66556008)(66946007)(2906002)(66476007)(6666004)(508600001)(8936002)(44832011)(966005)(6512007)(316002)(2616005)(54906003)(36756003)(38100700002)(31686004)(110136005)(186003)(5660300002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlJHeDQ1V3FPT1QrMmRHWEtkbXRqeHJGdnk0bjFSZzZQVU9qdHA1RXh4dVI4?=
 =?utf-8?B?ajg3U29qVThLK1YvZmhrWFlzd1laS0J3Sm1kakFpV1BrUnNVVVVjbnJHdkxk?=
 =?utf-8?B?QndiUG01OVgrQmcxN0J5d3owWHBFWG1WNTBHZHRqbWtSb3VYcTNtZlNQZDdv?=
 =?utf-8?B?K2FZYVFySEVuK1ZlbE5tb1JnUkVnZUdLeU1NUkorcEFrNzQrd2NzeSttdVRO?=
 =?utf-8?B?YVpjS3lEVm1VRWNDRXNoakk3dWVTem5rTmxIUDVkY2k3N0lPY0VsSGxUSUpG?=
 =?utf-8?B?RVdCeEFGemhCb1RnYmdGSVcyTncyR05yQXhjckV1cmd4K2NLd2lDVzNsSUR6?=
 =?utf-8?B?SWtBK3ZIOEg1RGExckZxWXhmZXZBenJqbkF3aFE4RC9lakk2N2JtaUkvZ1lq?=
 =?utf-8?B?RGZ0YW5xa09yU3B4UTdzVW13R0tsVDQvcDdmTThaRW52NWlseTRUYWJIWlI4?=
 =?utf-8?B?L0xNaE5FYS9UWS9OY2JlVlNDUzNsc1BkaVZCS0ZTRGNEdnJ1dllDMWIvT3FI?=
 =?utf-8?B?b1F4R0RnTXpxcUZ4eDZ0bFV5SEpVWU1ZUytHMEt0YWVUMWltbWhRZU9oQ0JX?=
 =?utf-8?B?TW9LbTRydzN5ZXpDWHRQWlA1OXZrT2Vha2RqcTM5UlAvZTZPL2pCT2dVbUZ4?=
 =?utf-8?B?cVU3ODROcXRadE5OOFRWL1hoelNJcEZSUXl4VWJuT0psRlFYZHBuYXNuV2Vm?=
 =?utf-8?B?TXR5V09iUnlVTGRRMmhvM2prRnNCbzM0eHJFeXZuQjdvYVhyYm10bnFzb3Ry?=
 =?utf-8?B?MDVBSUlZZTIyL3o0SVArcHgzUjdFaEFpNjBFeEc5ZTI2Q0lIbWZZd01sdDRV?=
 =?utf-8?B?cWg5VEE1NlBtQkVwTEc2cVZiR1NzbUUyU2VOTVhDejFLb1BmSmsxNXJ6R3hW?=
 =?utf-8?B?N3JSZGkzblJ2VCtxMzhEVHpIRFA3Zlk4WEt2QXp4eG5WZ0h0bnhIVkhQTkdz?=
 =?utf-8?B?Y1VYYldBOFJoT2RUUDZGbXFISkdXaXBzMjRBY1lpUDRPd0d4a1BpclYwT0Ir?=
 =?utf-8?B?bkQxK3BsWVZTRzIrU1cwZTlqSlZFV1hkbVRzNHhDRFROU1pwMGh6NytmS2Nh?=
 =?utf-8?B?M2Y3K3ZCWXh6dSt5dG1KSmx5WThidEl2Q1VxUmIyK2wvVmVEZWRTL3YvOWNX?=
 =?utf-8?B?bEJDeW9aQkFpeUllaE9qMUk3cXBBU0NZSitXNERtVUV0eWczekRrUE5MblpU?=
 =?utf-8?B?N09QTjJPMGN1ZENhZ3Roa1VsWjR6Z1BZVUZvWVBoTHVPSjJaS2UycXlDVFR5?=
 =?utf-8?B?Y3I4V1hpMG0zaURDMCtBSGRFZlRZVlN1K1F1elo3cTlhTWR5aVNLVUh2QVJN?=
 =?utf-8?B?M0NXd2h6Q3Jnb0liSjhnb1NLb3JwMlFSVHNXa1VsQUYxZys1MTRGRlRCOVVP?=
 =?utf-8?B?aHpTVDMyZGlNb0c4WDVIcVAycVhsM0llYUhLb0tuSjR6K2JQTms3NWU3RFRD?=
 =?utf-8?B?cnB0OUJkWmphekJ1MStnQkMzRFA3S1lqSGlnUDltSndZeEtrbXNyczQ0dkQ1?=
 =?utf-8?B?WFdtSklzUGJZd013NFBpSWdpYjVaUWV3UmRIVEpGWGJLNkVEYlRhTUhmcTVQ?=
 =?utf-8?B?blhHeFF0bUxkc2hHVC9CWWRmai9zS1BsWHBiT0xkbnBwcHdkVHQvbFpLWmMx?=
 =?utf-8?B?VGl2c1hvWUJ1d0xHZXRDbjNRZzE5UlNnZ3R1UzMzdkFVblpaOWJBSGxSWHZQ?=
 =?utf-8?B?a09PU3M3RkxNYktqWExtdG9RQ1Avcm4rdFBWYWJva1FTWElpeU9TYjVnNU9Z?=
 =?utf-8?B?Ym43Q2FHdll5RGk3dnVqR1lxTW40NlN5eXFkL0F0bERDM3BzOXkrTG1vQzI5?=
 =?utf-8?B?SFlEcitaL25WNEw1UlA2TXlmaXRYWjhRcTN1TUhnOFVxaGlYRktkT3lLSG5r?=
 =?utf-8?B?ZkxlUlBvZ3dRRmM1UGpFVkZqcUs0S3JRSTFIV2gxeXVEMWZQL1M0OE9pZnE4?=
 =?utf-8?B?L1FrVmYrOWRHc3NmL0t3Y2JSVnFoaGRud2pVM3hxSzlFV0U0L3pDQ1I1NDJ5?=
 =?utf-8?B?ZldJbUcrY1VIM1dsRlhTdUI0eW1meWlpaFZqZlVzVVU0cWNnam5WN2VtcHJM?=
 =?utf-8?B?WHF2bDZpclBvclY1MnFQdk1YbVlYNmRvN3owc3Z3ck9PVkpTcnMvWFJ3emNm?=
 =?utf-8?B?NnhIUHBPa3pTbnp2S3gwZEVCK01YOFVFVjRCMHRhcUxXMHpjWU82MW1IZmhJ?=
 =?utf-8?B?SGM5N2NLNExpY3R0MFNzWjJtVTlpWU5Ja2dJamFnRmdjSTd5dmtva3RNNzUr?=
 =?utf-8?B?RjYwa1hGaTZOemhJM0o5RU1jaTFWNjdTVFE0bkUxVUxzQmJsV1NwVjlMUUJ6?=
 =?utf-8?B?SkdaVnI3WS9qVkdxUUlTbDNhN2MveE1GUkxVMmczQ0dhQnQ1RFdIM0xhZGc2?=
 =?utf-8?Q?7Bp5R8nM1PTnybDKHNWSY7AKg/dNWp8n9jfUK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 000cc19b-236c-4e5b-0fad-08da3386bf14
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 19:45:05.2709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 O14P4TDzkgJdXERg+KHsRhI47bmQqYNxzwlzbbYgEkf/Mg/WOEBAQVNDtIA+WPzJUOxqxOZqpYE4iEq4nHrMDx9D0LcK19fzY7IAFm2jTTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1916
X-Proofpoint-GUID: yTBIP_SWHxPPPPZVN5ImlsOInUB7sboK
X-Proofpoint-ORIG-GUID: StnfOblJ7g_FkZsf4ZPWZH7IH-YjbD7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 19:45:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165523



On 2022-05-06 03:09, Alexander Kanavin wrote:
> I think the terminology is a bit confused here, instead of 'command'
> it should say 'recipe'. Also:
> """Check if the command is available in the recipes""" is not
> everything it does, it also builds the recipe.
> 
> And please write a commit message that explains what and why.

Additionally, I would squash commits 1/5 and 2/5. Most people, including 
myself, will review the commits in order, in doing so commit 1/5 is 
reviewed as original work, only to find in 2/5 that it was an existing 
function, just made generic. Combining these also makes it easier when 
mining history.

MarkA


> 
> Alex
> 
> On Fri, 6 May 2022 at 09:00, Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>>
>> From: Lukas Funke <lukas.funke@weidmueller.com>
>>
>> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>>   scripts/lib/recipetool/create.py | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
>> index 824ac6350d..efcb82173e 100644
>> --- a/scripts/lib/recipetool/create.py
>> +++ b/scripts/lib/recipetool/create.py
>> @@ -1375,6 +1375,29 @@ def convert_rpm_xml(xmlfile):
>>                       values[varname] = child[0].text
>>       return values
>>
>> +def ensure_native_cmd(tinfoil, cmd):
>> +    """Check if the command is available in the recipes"""
>> +    if not tinfoil.recipes_parsed:
>> +        tinfoil.parse_recipes()
>> +
>> +    try:
>> +        d = tinfoil.parse_recipe("%s-native" % cmd)
>> +    except bb.providers.NoProvider:
>> +        bb.error("Nothing provides '%s-native' which is required for the build" % cmd)
>> +        bb.note("You will likely need to add a layer that provides %s" % cmd)
>> +        sys.exit(14)
>> +
>> +    bindir = d.getVar("STAGING_BINDIR_NATIVE")
>> +    cmdpath = os.path.join(bindir, cmd)
>> +
>> +    if not os.path.exists(cmdpath):
>> +        tinfoil.build_targets("%s-native" % cmd, "addto_recipe_sysroot")
>> +
>> +        if not os.path.exists(cmdpath):
>> +            bb.error("Failed to add '%s' to sysroot" % cmd)
>> +            sys.exit(14)
>> +
>> +    return bindir
>>
>>   def register_commands(subparsers):
>>       parser_create = subparsers.add_parser('create',
>> --
>> 2.30.2
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#165330): https://lists.openembedded.org/g/openembedded-core/message/165330
>> Mute This Topic: https://lists.openembedded.org/mt/90928682/3616946
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.asselstine@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

