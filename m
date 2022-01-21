Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8022C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 01:46:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.5945.1642729587273435590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 17:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mumwWAoe;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80200e2199=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20L1AQTV019845
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 01:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=EySb3NJ7PXNhVd3zLkAzRsZEbalxRJrA0ugE5rVve0Q=;
 b=mumwWAoeExmx2XlDxRN7jbiPtDRU7em7DQd19DCskwHhX6Ew5R24bVRu9vIlH8suevui
 IeltVDqRYuH9IwZK0mwqLIBU3ziAwfp14cYCrGvshWiiH2+CAvgllMAb8opTob6AXiEz
 /t65Wf0CFNdJePq3bH2yfEnDIg76kzF667CvkVwuV82sKh5dvMzbr3UNmqcagpH9IRVM
 0pDwSQRSTyMt0D3thubUp8+asH56kdBuPI1WYonoqo3hC/BbWBySiLY2JuSAz1B3CBNY
 PjltbCaJAuWpyTKVaj208xDzz7TaUt9fDEkVGwCow82KqbUKnKYSD12E0F4fISYE0o6G Sg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dqhx781pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 01:46:26 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20L1kPE7032127
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 01:46:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dqhx781pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jan 2022 01:46:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqtmhTy5KGSmiwYMLMO6dcP6KhafEtRQ8OlIktrKY6hzSj3O3LDPVs3jgca3Z94zBSdqeD8ixMdRrEUFqIirl0AxhGFYX8LL7dvuUcyXpbJn6IZw4UHnJ+FosHPfgNXeK9pXdWgZZkzzOjHnmtziHWaSlgWqMzWpkVW0Jl5c/IBdm4wgBa4y4ru5Mogvsc0t+eQ0ML0QhCeiE1nwolO7mQKv1JFpkPjUL7F7fBg8wC7ffRZImzmgbGXRd2qnAlfy7TTb1pEweyON5RNtPs2HnpLiLXCpUqd/4oSAvc5Mn68F91pvYo0aNjEvRQltfXqJ6SFXUIu//bxiQvGXUd/9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EySb3NJ7PXNhVd3zLkAzRsZEbalxRJrA0ugE5rVve0Q=;
 b=VPbN7Qc8j0MQlYutDs+iayGk2toaD3NZ78zJ3xBgrCH7Wt2JX9pmyqGWIDo8taNnQu3HETLqB58QliLzELTsVyO/GOf8j8iZbgT8JSU9erZ2jO47Q65NJpz4G8J8KfHUfYVp5kY+k7VJeffpT90r3P+OXPo0CN+9wVHjFFQE2zs7SWxGagAdSWmhfTBb0QkIGJUzagFOhunpCfterxIIyD6xNARQdu6jZKq6GVZr+FXk28qguCWPQcRJ8qngemDUUfzFFtY1HDsztqczvgv644w2Oh2Dcq5s2Lx9Ktv7tGr7GjUiVbXOk9me5p95W608Jxq93qYQQrKGjbLwZ9ps6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2827.namprd11.prod.outlook.com (2603:10b6:5:c8::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Fri, 21 Jan
 2022 01:46:23 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f4ad:a867:7f2:8958]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f4ad:a867:7f2:8958%5]) with mapi id 15.20.4909.007; Fri, 21 Jan 2022
 01:46:23 +0000
Message-ID: <07cfb791-5fd8-9d47-5a39-e93188c768b8@windriver.com>
Date: Thu, 20 Jan 2022 20:46:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [OE-core] [meta-oe][PATCH 2/2] gspell: inherit vala
Content-Language: en-CA
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>
References: <20220119142457.2974185-1-f_l_k@t-online.de>
 <20220119142457.2974185-2-f_l_k@t-online.de>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220119142457.2974185-2-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0025.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::38) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1349dc8-6b27-48e7-5329-08d9dc7fd43a
X-MS-TrafficTypeDiagnostic: DM6PR11MB2827:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2827DD1FA2447ED5D871A6C7F85B9@DM6PR11MB2827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7+qEywYCL+wYqhxIe/X6qVemT0lSA1T4jV5NPDNjVIcyZofi7N9qMvBaFw8CUGWozB7Vd+8ENk+DiX0fVHPPOX6LaPU/RN2WXluYRAzq6L2JzcNxCXrFeycP8I7pnb6qivHuzZ9+0tf3MIjhSubOIJize1julgOSPbjtijw4xCJKD3vpPGHmJIRQdoHe+u1aJ64ylJOXOLxlQKOAtAW82cV1OYPi6W53ywt0VeU6r4g070cadeE7kYkIJT/kzvv09F5G6fERqPfPBPzAtZO/KD5ijpu+Ka0NZ694ML/AwdPIg3sU0vgzTOK/jEkmzjOdFb/8gM99bBdPoxiPzzMkHraUju6wKgkybgXHp0vh5njQ/SYp7VLWObsTKqtj13S2HmR6hbXl19yDQ8YnZzcCbIRTA2Zf2dBP9X4NQsSA2rtsK7wysFR8EmdFS20eG2mbCkmSb0VwxTiH4ASAcp6uZ9dKSJ4dW8aw0UhK93pLcDNBzGseFbdi3Nl0Hvn1BBBbS594kEXJ8GVJGuJ2wxCQxfTSc+AAhbkIPenga6DLZsQU7/leege16qL3nXy3HX/ZkPOQpJi11hkavMoAvGwy0jZ1LqRxtC1BSfzpCcpGf+eZFee8TzxWXxXuYmwX1xCZoIfuhrOWO4Q/LPnPUzSebgCwAvyY7vOzIZIGnxpJjdeLZrEavYZJ5WSDw3mSaQ+x4loxZMmret65QFNLam0uoOrSasZOTAaRqmjlygfPP8CfrmdJTDMTJ1aorrLnxkPvRvxZiXk/wq6cl0VccbmojQidR2vE4TffZ3tfxENjKhTBhSalccrG+6ZA33gpwHNDQQMJ/ERQWgKWY7b+B+csrAQVRaz3fYkA7T2ueCC2QnY0HjESLj35/z1SkkxUh4QVtOrryy0FOVVVgzKqIT6+gA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(52116002)(5660300002)(53546011)(86362001)(2616005)(6486002)(31696002)(8676002)(316002)(2906002)(6506007)(110136005)(6512007)(8936002)(26005)(186003)(38100700002)(38350700002)(36756003)(31686004)(966005)(6666004)(66476007)(66556008)(66946007)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjJ4ZDlVL1c0UU9CNEE0a3JIZUpKUGVvNG1yYU1wbzlnU2NIOCsybkc1NDZR?=
 =?utf-8?B?NGJhUTc0OGwxc2dGQ3BiMWRaakMrUWQvWmNhVCtLMDVVKzNBZVA4R3ZFWEF3?=
 =?utf-8?B?RWZFRG1UQVJFcHpYNTBVcTlUYUNVb1pMYWlpdU1sUjhuZmxKdzlldzFHTEp1?=
 =?utf-8?B?N2VIejZkVFRCb3JEVmFKeWJmbE1rNUFmcmlvaDhzcHV4SHUvb0thY0pwVC9Z?=
 =?utf-8?B?MDI2M0ZjSzFacWllZUl2M3lpcG5nTnVvbWtVRjVwUTdlVnVvQmpjRmNQc3ls?=
 =?utf-8?B?WUliQVlxMllUT1F6dGE3dUhKTUZpZTBjQ29pcnBEUkNIOVlzdXZvbkowNGZM?=
 =?utf-8?B?aXBaVXhCY1ZXcDBIVWtvaDc3eTVZSlkxeGRHdEpPZCtPRXpZaGlFRXZFQUVP?=
 =?utf-8?B?NjRvRmhCTkpUVWJmaGZEYlZWeklvdHdyMVM1Vm04NmN4aUg3aTB0YnNVV3pF?=
 =?utf-8?B?aEdXSzdlOTBEMXpJcGFTVGZ6U0haRjMxbFl4SFMwUVpWZjlQNWh6UTRyU2I4?=
 =?utf-8?B?TXZaUFB3d0tsR3pyTzlmbzVuazhuK21paXhNY0dnZU9pejVvMzcvM0tlMXQz?=
 =?utf-8?B?WEZlQVVxUUVrS2Q1ZzFOK1E4a01NZzdTU25mOSszSG9uK2hkdmJXVmlrVzZ3?=
 =?utf-8?B?MHhSc1ZUdHV5RWJwY3YzcmpjamNTckRpWFZ1eVhvWUp5WE05clE4YkxJaUNX?=
 =?utf-8?B?RG85Rld6Y2YwMTJkTjBQbkNCaUw1U0dvN3V2dnVoWllxV2o3bjNQTFBybXlM?=
 =?utf-8?B?OStJTFc2VklNYXJnakpqSUptSHJVQXkyNHlVL2k3WUlLWGxpSkFpVHpsZmtn?=
 =?utf-8?B?TlhUUTBPWUF1Yk1jNitWbTBZanB0dGp4bjk1L1ozL3hNMnFCWXBsUSs5cEFl?=
 =?utf-8?B?bzlqT1RpeFZSNW5Yemc4V0lmWnp3bHpIazJ5SnZUa0tVSnlPdC9yaDVISEpC?=
 =?utf-8?B?U2JSN2xLN0t5cG0rZXpSV1huNldsUDVsMUd0MWJaMm9aZnk4WngrL0VuL0RG?=
 =?utf-8?B?MWJmYUhCMkdVcW9hQVVPRGV6WlNFdlordEkvVWhXWTJQWHF5ZCs1M2RLV1BF?=
 =?utf-8?B?NWdXcmQybHRaNmM3S0JXNWF5Uy9ib2REcWcvRDNPWGxjYktaMzJnUnR4NmlB?=
 =?utf-8?B?SStRUlY2OU9uVFFhNWZ6SlhFSXNCMG5jb1U1ZnNseHRKN0RYcjdhSnBpSnlu?=
 =?utf-8?B?RlAzcmplUHdRTk1aaWc5dVgzM2wzRXRFY2dBc3JKclBocUFQZXczTW9yTTNu?=
 =?utf-8?B?MktJUFd2R01oZGRvVnVPZHVqWXNEaDVuT1ovYms3WlBKd2JLVU1sUzNTU282?=
 =?utf-8?B?d1pnWXBtU1V2MVB0b2NLOEtDQjgyc1FNYWNtTEYzVVYrbjBDamZsRGxQcHgz?=
 =?utf-8?B?Q1pSaTVMY1JwQUZJOUs1bm9PNDBCRm5mem5INDBTUWU2LzM0aWQzZzBTYzFt?=
 =?utf-8?B?VVhGUjVNRC9seFBocGlITlVFMktVTnNRWXlxR2RSOTA0RjBWTjR5QVVUK0lE?=
 =?utf-8?B?RE54bWc5ZjFKeHBtWGJvK2QyRHYxd2pRZW1oNFVxSVFwa0pUbXNhS0YxV25s?=
 =?utf-8?B?VlhSY082dmZwdG9RK1ZRQUYyYU5XbjhuM1FuY0Rzcm10TjQ0YWEyQ1JLSmJx?=
 =?utf-8?B?UGdYbkJPQU93M1lsUzZJQktiQUpRNnIyUFgzUS9WSU5FbG1Jc04vMmt4Skhu?=
 =?utf-8?B?WFpWRWdqWmwzV29La1VycWM3aWQ2Ry9sZ1J5U2lJQVdjTW5EdDRuUmliSVhC?=
 =?utf-8?B?SXZ0YjdWVWpuZlQwOW1jREQ0R0ZRS3lnSkw3ZHF3QldicGo5VEFCQmhOL2wx?=
 =?utf-8?B?TCtWbzBMaGhZT3E2M3NCWWRyQ2ZkNk9Eb24xUjBhME5WMEp1a1plQk1qV1Jz?=
 =?utf-8?B?d1VGbkdoQnJxYTFWSk0wRGtlYnkvMUlwL1lPY2t6K0ZlSENyR2ljd1pUcEdm?=
 =?utf-8?B?Y2xqOENySDIyTjV5WDFYSlNtSi9RVVJZeEgrRDNKdHg2RXl4bjMzaS9yeGpj?=
 =?utf-8?B?NFZ4ZmJETW82V05uaElhQ3F4TUpFa296RWRxQU5Ja3NDSXZHVnVKYmFrMmM5?=
 =?utf-8?B?ZVJNK1Y2L1FneldJUE8rMzRlVStrNzQrQ2Yya2JPYzFCQkFYUHZCOHgxeDZk?=
 =?utf-8?B?RHZKTzVMSnhDK0hkcWNKcG8zNCtPdjBGTytJZkI4WWRzOVNqYW5YMjcvMCty?=
 =?utf-8?B?V2JxRVpDSGtDT0NiS0sramZaYngwcTNGd0R1QlF1aGhCSGt4cVJHVHVrbFRn?=
 =?utf-8?Q?zUiQsOtYY7uwkR2Fmk7KYXF8K0d9goDgMqYnG2a+Q4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a1349dc8-6b27-48e7-5329-08d9dc7fd43a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 01:46:23.0747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xauIRz3N8xkofA5THXZYt8VRoOmPoizSWmPmTg5XAGFR9p3cv4R6YuRd5ZheWzDD/d266aIL/xswZuL67exHQyQEJ5N6IGzXsFx/4XbC5i0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2827
X-Proofpoint-ORIG-GUID: 4mYK8Q-j_zBgnO0pt4US_B0B-tP_PRes
X-Proofpoint-GUID: A-peGHOJH0wQjT8Dza6R6c_Vq-FYIGvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_10,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 01:46:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160810

Markus,

Thanks for the patch, seems sensible to me but please resend to:

    openembedded-devel@lists.openembedded.org

as documented in the README:

$ grep send-email meta-gnome/README

git send-email -M -1 --to openembedded-devel@lists.openembedded.org 
--subject-prefix='meta-gnome][PATCH'


Oh it seems that Khem already suggested that for another thread so
I'm not sure if he picked this up. It's not in master or master-next.

../Randy

On 2022-01-19 09:24, Markus Volk wrote:
> This is needed to get the vala gir files created (needed e.g. to build geary).
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
> index d6de146b1..aba9be87a 100644
> --- a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
> +++ b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
> @@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8c2e1ec1540fb3e0beb68361344cba7e"
>   
>   DEPENDS = "gtk+3 iso-codes enchant2"
>   
> -inherit gnomebase gettext gobject-introspection
> +inherit gnomebase gettext gobject-introspection vala
>   
>   SRC_URI[archive.sha256sum] = "dcbb769dfdde8e3c0a8ed3102ce7e661abbf7ddf85df08b29915e92cd723abdd"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160739): https://lists.openembedded.org/g/openembedded-core/message/160739
> Mute This Topic: https://lists.openembedded.org/mt/88534924/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
# Randy MacLeod
# Wind River Linux


