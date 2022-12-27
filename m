Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17292C4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 18:11:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.162955.1672164711247442474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 10:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IviTc75m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93609ec0f8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BRHeHak006289
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 10:11:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=yb/JX1k6tf/N7kzpimlc/f7TlRT51Y5FKVMDqP5Pw80=;
 b=IviTc75mmXyYNSK1sLev/8ULQ7J2rIKaq+1IDNoujqJv+BKrYTRvQ9u93i9k6kFjyX2V
 ZQ2WZgWEy5rKe132xbt635e/00wQ5eSFKGbH2njAM/M6v8X6l1riYdjWPfl5wJIoDYf1
 2NP4HwwCa+QfahMR5LmQXl02HhM/6OKwvX4CgMlJOwjot3u+pDODpLjCb2Bqc2oyAJ9O
 +AUJUX9gnRQWD4YXrCk2FunlPTRv+/UiDo+tLdmAu6kGeu//y2Li3an+yXWV1ScKCccG
 el9VZH2hcOuuegjI9qzjhaZJdfjl0rRKzG1alUOA8DCtKV/csitetBLob37Jucnq7osK wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mp1trhn65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 10:11:50 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BRIBoAl019428
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 10:11:50 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mp1trhn64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Dec 2022 10:11:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAep5SQJdeAco4gNfEdusGUgBR/EK4KZEyUZHCiWhIvWIyoe4dzVFJ3eFwbFLuTqbtICvyzrmt27G2wCaMAWMpTr2R2P5XC7ziFpHgRbx4WhwWke9zVHrxwYACGR+j27yyEl0uhFs6NbsSr1wGMkGu6MqBuAdQoHG5csg3IKfEJf49+qgWskpbQe5RXkLNhRgHSXrhf2cxjimrvvsPOtfSm0jDXcMpk52t0bGjeTpxRiurb7W5pFZZ8QuwSWKmEmO3yHEcKmQ9KWzh5KUEM2H15K2d7VAnB3wNCtcS0IsyOOZQFJkvFHJFge9577KBmhjqmS1Kk1xdgqZlk8isz8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yb/JX1k6tf/N7kzpimlc/f7TlRT51Y5FKVMDqP5Pw80=;
 b=D0xtIEX73V1eUXXMi9kxd6cQzGxoG411TZ4FHQkzy4WQ8KPeTg1fUiVYNqDRJve3QjIPNElHNIATiZzUR9j46MX5rytZ9BXVU9/T3M4FqJWoBtoiVP9kr6kuQ0DPJMAnkMZRQH7Q630SY/eul8j5NTCHTRBVAqy8H2J9JD9kxhYRb5kM+KgNQP95Lj0PuUIUpNInbpn6kqcq321eY/2fe1ylVDCnQtUAX4FvJJp3AvaQk8UOkHU2KyuNpaCyCJxmZ5AooXS8Gh+Ul/b7tIezTRqAO1B/GSV0qewKEWRc9ocK/1eTyS2St4icfA4bT7/NHW3L6MGvpcS0xG34SdlMHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.14; Tue, 27 Dec
 2022 18:11:48 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5944.016; Tue, 27 Dec 2022
 18:11:48 +0000
Message-ID: <724024e3-02dc-8159-8f7d-b49277a44077@windriver.com>
Date: Tue, 27 Dec 2022 13:11:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [kirkstone] [PATCH v3] binutils : Fix CVE-2022-4285
Content-Language: en-CA
To: yashinde145@gmail.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: Yash.Shinde@windriver.com
References: <20221227164202.3700000-1-yashinde145@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221227164202.3700000-1-yashinde145@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0172.namprd05.prod.outlook.com
 (2603:10b6:a03:339::27) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ2PR11MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e8f036-10b6-4ccb-c131-08dae835d20b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kR0YvkqH0IMcHy15zjYUT6xowr8+aNoVewywsUy5Yys8vULygJUlsYAL/DcP80p9TQqR5VkNXOLeIkedQ4osR+ZbXt5X5lE1hskI5m/pUcb+QmAA/+3FiHO1qSbeQKBxicv4W6tlk/QdDj0WMLyCPJhJTFg/BkFSRdSsIpI7hFYtCKdb7SH2mEIY8Wae5/LtbuV89AQd9TXGovktLVjcSQlmHhT26XFqHKta8PseJKg06c3YSB0ITMHROH0e+LVOUA8w72z75fAdxqWlzo9Y5xz1FxyMOQ5wzoqcXQp9UZ9Y8CA/pgLfthvA2dwrKX1d0SM9zDx7AYGpPxvB5wzk4QaaQmI7GlY7iudsD3K3dXOCNPCzrkPZAkDNJ7zaJ0rxPDb9G+SH7UPcDPijimSUkTuylpTQC/aoTp1YUqUBveLI9LD/fY9rDIWCumTkqaYWY+rZFClOnEaizUlPk8O5bXOjqK4dq/UUtRW1uBMT8WTO4ToSrPZMrP7sgpIjB4t4KGYTs4LXd5c8NQRhOQ1hRlFIgI0ZaopGZm+7udPLZCRZDJh/kd2+D3LgWRUv1OV4mrLiHAIIOzso9RjDyzpD8+i0PB5rr092R9kMKLt5syxrZyT5Zk4/ctjtUqeHZiRSo+40tYspOxVid+1pLlSBuJiSfFyvbI2VzHYbKpkRN1ewQUsxrapO9sQvk6aIyCVAnJmA+U7H6ozEZHhXNeqEAt1CWFhvGhQo+WTcZkjXRZPe2XEQkQD5xYbxtz2n7cFxV63wn4zTlQebbjQ702MM9cw/UqWdv7rwgI0zPYlJkmg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(346002)(376002)(39850400004)(451199015)(41300700001)(8936002)(5660300002)(966005)(316002)(4001150100001)(2906002)(6916009)(6486002)(478600001)(66476007)(4326008)(8676002)(66946007)(6666004)(66556008)(107886003)(6506007)(53546011)(38100700002)(6512007)(186003)(26005)(2616005)(66899015)(31686004)(36756003)(86362001)(83380400001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TmZWQXFBMHJVaFF2MnVJZC9ZVStDMTY1TCtxSkg4V3BjQ05ETyt0Q3IwNlBu?=
 =?utf-8?B?dllqTEFBQ3BUOHY3dE8xMXgzcmtHTlczTDFrU1VYdElCT2hFNExKT2hhcnBY?=
 =?utf-8?B?ekVrOGQweGo3OEFYdUJ4QkRhdjJyeExNT0JObjNNNFJmUFUva2EzU2tOMDVm?=
 =?utf-8?B?cmxIclpMUUM2bWQ4UC95YUFlMm9KYTd1eEpuOTRmVjZNQnQrbCs5SDJSZDVh?=
 =?utf-8?B?WHZLdXV2WWJLTmRLN0ltQ3A0TDhrUDRaYW5NOGV3RUpaN3VTK2dNdEgyYVM5?=
 =?utf-8?B?QnZTVVcvbVcrSGZMUVRtVWRyaXhSTERBTVluU0FsOE9GbGluRWlCMjJNYVJz?=
 =?utf-8?B?NDJjMytFMHlBMmhQZFVyeFlJS2wxcGI2V2s4RFg0ZG1DaVB1aTZwTHNiSFhy?=
 =?utf-8?B?Zk41NlAvc3Vjb3N1Uk9mamZiaHdtRWxhVUdCS2FZLyt6YUF3SjU1TVZZZWZT?=
 =?utf-8?B?dFJuYmdTL0NyYlVtSFJHdU9ueURxSVhSdEFaOHJ5aDZrTGw5eGxXdSt3MVJp?=
 =?utf-8?B?VUoycWRaYmlqTHA3RnNCcUxqbEhJK2ZwcWJzMjROZ2pCbjVKdEV3UVl1UFFD?=
 =?utf-8?B?THN4RiszcVhBMFA1NithODFGNEdRT3U2N1g4V2ZZdGlEUVVRYWMvOEZMN3k1?=
 =?utf-8?B?dVJ5TnI0LzZGQnZLZFFxOFRiVEdUdDg0b25mc2lTZEpYdVQ3T0dCUkNxR1Fl?=
 =?utf-8?B?b2p2WDRFeHhMWTFJSTRsSVRZbmpTTUZjZXFyZUwzcGxFUU12Y1JTUjl2M09V?=
 =?utf-8?B?Q2paMVlJenFUYmM4aEdvVnh6czlZeWJ4K01jNEwxRThwRnNvaFNpVStMeTYx?=
 =?utf-8?B?a015Y2RwRE03bnFrOTVEbW8rZHZRWUlBVnB4ZUFDSFc0L0F0ZGNMN0ZzT00v?=
 =?utf-8?B?aUQ5VXZ1ZkxDZllVaHFhUThjSmdKa09FSTNNbkVCejRTeTN0RHRJZ3ExMXNM?=
 =?utf-8?B?TGlKOG1HQm9pYkpFSEVsUmJDUm5EdTEvYWxMVjdXZ25RdTQ1VWNwYU9YdzZQ?=
 =?utf-8?B?S3JkRWlhMlRMdzZ2RXkwUzJFZlVZcnFWUE1tK3FGTDYwalh4bGIzcVB3UFpa?=
 =?utf-8?B?dmVjTXhudmVIWERWd2QyYTI2eHlhanFJQmljN3FwQ2hsN1QrMi9CNmJjR0RL?=
 =?utf-8?B?bmp1YUwzeDh6YzBsRFVwN3hMaVFQSTBQMCt0N201WFJyM0hBYnk3UjZDOWdz?=
 =?utf-8?B?UEQ1R25CbC9LZkV5RDYwS1E4cWVPY1laTlM4SFR4TXBRSXpPQVhkWG1qbFhL?=
 =?utf-8?B?dGIxa3NlZDFHTzUveHZZbVVGZ3A3ei9nVW1uWVQxWmJ2akZNRGptMWdESHZ6?=
 =?utf-8?B?SkVjai85K25pTng2cE15WENvbDFsaFlnQzRUK0w5OHNYR2ZNMzk1cDBaVGds?=
 =?utf-8?B?YWdXRUtkVVB6WkN2STlHZWdOWGoxRWcyenA5L2FjdEJJaWFtODhXVHNFb0di?=
 =?utf-8?B?cUNlQUJPQnVVa1JMbENJMzBkNEUrT3ZzU1d6ZWEzVzduMkhDaFVZR2preko2?=
 =?utf-8?B?cFF4VkR2aEhWUVVOTlhsZzRWN0ROdEhuNnZSWXFZSU1PR1VvWkZVVTEzaVZZ?=
 =?utf-8?B?QStRWUZtU0t1eWFiVkQxb0I0WXpDZ3lCV0pUenZGenArN0dhejE1c1BBbkVH?=
 =?utf-8?B?VEQzZGt0dVZCUWZTRzdiVTQ4M2did0tjZGR3V3RhRnRTTWhGa3lOY0Q5TzU2?=
 =?utf-8?B?cmVMNEN4allhOW1pOERrREhsWDdaZUkzNTVkZE9lQXMyZVpYOXhQTzRDcjdy?=
 =?utf-8?B?UGxETkhLYS8vSy9TaldGUlk1M1hYWldEemZ4TVRxUXZCT1E4bmxvdXJJNkxB?=
 =?utf-8?B?anVXTzRiNWtOaWh6VjBjUTZkZjRCbVI4TVYxVW1YU2NnSHdCaURDbmNQd1Vo?=
 =?utf-8?B?bGdFVzRBb3cyNDg4YVlkdnh0R0ZPcWtWdjNBLzVjbEJwVWZPMXlvTERxT29n?=
 =?utf-8?B?NnpodHlYZEZpRndCenVjOFFpb0UzZFBhVzU0ZGNESkNPWUpHMjN6RU96dGlK?=
 =?utf-8?B?UGpKMXk5cFoxRkZDaWh2L3NKc0lzN3BxaWFCamQ5MjczQzVreXJ6WXcvcFVp?=
 =?utf-8?B?ZUkzME5yeUQ4aWpRTjhpLzI0MzZjaWl6MUVmRmk4a1ljdHNnR1pBL0FwcEZ5?=
 =?utf-8?B?NmtWQmp2Y3J1TG91TkNCU09QY3RQbXlxWkhXeFVVSU9WVGZNZmIvMURvak1v?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e8f036-10b6-4ccb-c131-08dae835d20b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2022 18:11:48.2649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qZiCengI3AbbUM8HTvnMkGn1rDzck4pnh0q4+6DJPFQ6Bkpr05Bq5MsIL31Ts7PqPWWzjLK6Ij0Sy8tr0ywHY40o5jV/8mMQlQzlUlvSjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
X-Proofpoint-GUID: 3Bbv4qzQe8s0On8KFOh4tHGj6dSjryok
X-Proofpoint-ORIG-GUID: E0tZS8Vbah1a9nHPeWiYO8xp-Tb59GKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_13,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=989
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212270150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 18:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175033

On 2022-12-27 11:42, Yash Shinde via lists.openembedded.org wrote:
> From: Yash Shinde <Yash.Shinde@windriver.com>

Yash,

I know you have a problem with sending email from your WR account so
I suspect that you're trying to ensure that the patch is authored by 
your WR email.

Don't bother, we'll get your email fixed early in 2023.

Steve,

I'd drop this version of the CVE fix an take the one sent 10 minutes 
earlier.

Yash,
As I explained offline, you need to tell people why you are sending a 
duplicate fix.
In this case if you wanted the new version to be merged (we don't!), 
then you should
have replied on the old version to explain that it should not be merged 
and explain
why.

../Randy


> 
> Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
> 
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>   .../binutils/binutils-2.38.inc                |  1 +
>   .../binutils/0019-CVE-2022-4285.patch         | 37 +++++++++++++++++++
>   2 files changed, 38 insertions(+)
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
> index c1904768dc..0a4a0d7bc1 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -42,5 +42,6 @@ SRC_URI = "\
>        file://0018-CVE-2022-38128-1.patch \
>        file://0018-CVE-2022-38128-2.patch \
>        file://0018-CVE-2022-38128-3.patch \
> +     file://0019-CVE-2022-4285.patch \
>   "
>   S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
> new file mode 100644
> index 0000000000..e5e404982e
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
> @@ -0,0 +1,37 @@
> +From 5c831a3c7f3ca98d6aba1200353311e1a1f84c70 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Wed, 19 Oct 2022 15:09:12 +0100
> +Subject: [PATCH] Fix an illegal memory access when parsing an ELF file
> + containing corrupt symbol version information.
> +
> +	PR 29699
> +	* elf.c (_bfd_elf_slurp_version_tables): Fail if the sh_info field
> +	of the section header is zero.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
> +CVE: CVE-2022-4285
> +
> +Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> +---
> + bfd/ChangeLog | 6 ++++++
> + bfd/elf.c     | 4 +++-
> + 2 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/bfd/elf.c b/bfd/elf.c
> +index fe00e0f9189..7cd7febcf95 100644
> +--- a/bfd/elf.c
> ++++ b/bfd/elf.c
> +@@ -8918,7 +8918,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
> + 	  bfd_set_error (bfd_error_file_too_big);
> + 	  goto error_return_verref;
> + 	}
> +-      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_alloc (abfd, amt);
> ++      if (amt == 0)
> ++	goto error_return_verref;
> ++      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_zalloc (abfd, amt);
> +       if (elf_tdata (abfd)->verref == NULL)
> + 	goto error_return_verref;
> +
> +--
> +2.31.1
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175030): https://lists.openembedded.org/g/openembedded-core/message/175030
> Mute This Topic: https://lists.openembedded.org/mt/95905716/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
# Randy MacLeod
# Wind River Linux


