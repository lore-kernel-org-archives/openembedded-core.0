Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D36C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 13:27:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13482.1670506017077947194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 05:26:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=SFkQbQi0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9341ee321a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B8Cn20n024736
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Dec 2022 05:26:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ISVnbZ46lY1daTKPFVSBeDE20WN0aYq6nl3Ol1Eh0c0=;
 b=SFkQbQi0M/HZ5AoP1aWVnlhYDs5VeXlw9HspIXVKevpLmccZeY1bbE407EUC9/anLM3H
 fOGucz9QiLHMWqcVJD/x3lx51TOcjQDpnivYZeo9EnSGd/rUHy8flnC4B00ZZ+kLVgO6
 MkuNb3ODn6fKbwwDxdkQD5vGbmKAug2PH03+YFbOrp5XVJfDsaENx//0l7Hrxqhzh2ZG
 FyqEcOL1ENDjI0SSdqxsL3a32ovIbJh7i5TpElCgpvdU+cW6iB9y0rhgeTKkOtmaJ514
 MDQSp/G9pG+sqNd6wVrlmy29GN2IUB02rEwtpmPNM/9iAtHoADasP8X0jZs41WdCAXni NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6vc19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 05:26:56 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B8DQuwh018460
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Dec 2022 05:26:56 -0800
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6vc18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Dec 2022 05:26:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQ2LVW/khqob9I0IFNYgnNN3mAy2hJxgqPxJSOMW7NdxvxEpRgER/yhJuTJci/Yw2lQSXyLy3jGZQCbse2c6cls2KYHncn3JPbHKU1z6gy8p0e9C6CmUpI/j6pB5lUGH0VJ08+8eyE+n7EychK8Oytt+WapcfmhjgyQXby6bzGik9mZ2yc+1UPzrsxRmWRVU5/LwH+wzoO9F/+4/qj6Z0yQx4NDoCYdZrjbsroh+947L0rZ7zqffH4g0GgF75CyY51CzbOHSDRc3yEy+NKtaZW45BKEy74BjkIQoYmB+V/RAi6pkB4YMhO7/5mrIt8rA5EsOzxlOAa7kOQ6n+9vQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISVnbZ46lY1daTKPFVSBeDE20WN0aYq6nl3Ol1Eh0c0=;
 b=GgAPOipAFBSO5tMcc5i1mxoLG4DSTGzseSEkmVg2J9kG+bGPI0VACU5QKMaaOdac1GDazZv+VanI3O1nm8WXbknUhuAg7jHVGCFtigwcmUCtkguqoTPjCF8rREx7NthYG2LkhrDp7F85h3sJtyQ3coO9R0UrwOz7kqq47pQYRqg/KQXA+q8FQO4iJLosnK1/0okYSES3kzhmjLUVYLQ68cKZSWzgSPDreggV254OnX1u9RwFrEXBIgqVPS/4Rh1W3ykJynrCCwDGC4H6nHJDOpNdrEcIbe+CL9Yiag5T2EhxBXpI7KcSJiTRrqw//6YTjSzJixBigJg8REvdj/NU8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ0PR11MB5022.namprd11.prod.outlook.com (2603:10b6:a03:2d7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Thu, 8 Dec
 2022 13:26:52 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 13:26:52 +0000
Message-ID: <0ab92f03-3533-8268-72ad-a0fa0a10a8ec@windriver.com>
Date: Thu, 8 Dec 2022 08:26:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] rust: fix for target compilation failed issue
Content-Language: en-CA
To: sundeep.kokkonda@gmail.com, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com, yashinde145@gmail.com
References: <20221208112612.3023718-1-sundeep.kokkonda@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221208112612.3023718-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ0PR11MB5022:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0e7764-c6a3-4d71-94a2-08dad91fde79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IdQxnaIaFV8YtQEdjFHZ//6qqToi/vgB9xmS2An055uJ9onJfu2WSTiug6Hc8V9p5jSsEgeSEnLskJdoID5kD6g8btqRfoDuBZNcsTmBcgOVoMyqGzasbVM8Ns4nrmc3VEMupVhqTZ2rZhlC20txAEvTZIZcJecwa+lFL22LC8zqmg8WasFyKS1GWPCeCKLn40Va624kh78qcMkGY9GNxDnTXOlptg9zy+g92HIhE4gyH74llw8f/zKMS6TBL0QYU/XxjAzhyDJoRcSkotMVsDilpf43eMOcVsqamHiHCuxYV7pqshkho4m8V312fEz8e+fW+GFWT0arQRpfdkqFMhuqG+3lBwBcM7wnbTnzMReom62RcpsJ/ECz9424oogiVLEZY9hxZgKFz4xJpcEW+kHrcrKuF5l5EY0TaNslS+mPU57UQGJFSIBJ7ZhOpqIL2C2BQr6dgaY9c099w01qMzQ33vFpcda44eQ2AH2gyBgAqR/ErxQcW9WflLKEwlpaZrGfS1iY4stxQGlDuQDq9Uh0jwJnaS9yL7vNV2RtEPmQ3TgHi+4muMb2b1/beu0wnks0O+arEODjovLIJYBahQWN4ul/TjIB8JPLIq1Z5/w1ulLLwLewKVGqCroOzxW5WJf5TadnjofvXprbz7TLSfe6yQtmCkuD4E85qfgRNAgf/qVdbD+/XxGC3+84xy44tCaSgh/FwlbrxUuAjJAVaX4gcMmmtrpf2WgAf2CfXfJ0V1s5vd0BFZhBitOJmSwP0v/vDQBp5bwlBltytHcyMOUNwDCn2rIbSQj/bMQLDVY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39850400004)(136003)(346002)(376002)(451199015)(36756003)(31696002)(2906002)(86362001)(2616005)(83380400001)(6666004)(478600001)(26005)(966005)(6486002)(186003)(6512007)(53546011)(6506007)(41300700001)(38100700002)(5660300002)(8936002)(8676002)(66476007)(66556008)(66946007)(4326008)(316002)(31686004)(66899015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TU9yL2piYWFWSTIzL2pZZVY3cWFEdlBiVnAvOHVrbVRsbTdLWmU0dThoSVpw?=
 =?utf-8?B?S1Azc0xVRVkzQXp5eS9jaUJxU1FuRmU3Si84K3JrTEx5NWVXSjV1RTAvSTA1?=
 =?utf-8?B?UTh4dytRUUxFWWNDTlY5clFpYjlYeURBUEdxNW91bG5xUXVvcXhSQm12MkdC?=
 =?utf-8?B?QU9aaSs3WklkMXZBbUR2eDVvcVNZMC9rQTU0U2hRdzlIR3RYditXamFhYzJU?=
 =?utf-8?B?b0hpMEZrUTN2YllxVXdPRlFGeTNyWTZQMFNIc0JzcmFyLzhwQUN6SEZtbEFR?=
 =?utf-8?B?RUZFOE5iRmNCOFBlN0ZxL1A0RlhnZ1JEcUVsZGNyYkQ5OGcvaE1CTkxPTWZX?=
 =?utf-8?B?Slgxcjk3aU5hOVFuVTJLb0lvYzNJbVRicDc3Ujc3VUdmM0JLTlFqdk92RzFk?=
 =?utf-8?B?bWVObk9hZUY5WVVTeWVyN3VGVTl3UXh0N2lGd014OWY5TDFlOG1GRUhPSGlS?=
 =?utf-8?B?aVh6cEpmQk5YUXZIbzBJRlhwK0RZYWxLUnpZYjI3ME5FN1RpQnNXR210NFVR?=
 =?utf-8?B?eFRkMi8xeEs4cmpscStOaDhPTGRRS054cXQ4b05oRjBlakpuMm1BOEg0OTN0?=
 =?utf-8?B?ZWYwYVI2Wk5uc1JSMnBWMGl1L1lpVElyTEUyVDBFVUJQc09mMkgyZVVzK3Qv?=
 =?utf-8?B?dTlxREhhcUxHQnFvdlJCWXI2UFF5VTZzQ2NVNUpTZlNZRUgrcHhON3YxSVRp?=
 =?utf-8?B?MU5mWFlReTh0Nkxrb2ZlekpkRlhicWlvN0FQM1pWOXZuejdwZWlyQjZpQTlP?=
 =?utf-8?B?TEcxUmJ1Sy9vdDR0VkxzeFE1alROU3lsQlFWeGNETWNRUWpaY2c4eSt4Nngr?=
 =?utf-8?B?c1VManpDOXdQb3ludFdYSTNyVUxZN3FGNURtUWg4dndXMzhFTEw5MVVHOHNk?=
 =?utf-8?B?d1pIZ1dhdEF2YmhBdlhQR3o4aW5xbXM0ZVRLWDZjU2FFMTBzU3FCZUk1Qytp?=
 =?utf-8?B?SzlraHJHeXVwYjNSRnpNQ1F4a1p3MFpmejZ4Z1RvR3lpbTRzK3pwR0dnQjds?=
 =?utf-8?B?cGI3VlpVUGxFRjVDNitBM3RFSndPMmIxQ1l1bUNXall2bFVDSjJlenZQZ1Zk?=
 =?utf-8?B?SGNHQlBIaFFIS2tVZEpFU1RWQ2xmVVM4K0VvNWcyWWFOWTJ6Sm1qcE12cTdx?=
 =?utf-8?B?OWpLREZlS1FsMVJHZGxvVGh1T2lJYmxWVmh4UFpHLytkVEc3blRWcmNJV0R6?=
 =?utf-8?B?WisyREFPZ2k4bWMrdlRmK09NZTdRVmNURjRhSkg0TFhPS0hXT0htbUZNSmtR?=
 =?utf-8?B?SDlsVWFWZHRMZUc3Y045OVRLdU1BTTc3Qm5VN29NK2lvRmwxNVdLZ3ArZ0Ir?=
 =?utf-8?B?QndxU2NqeXpwQTRySU9kek8rR3pNWmtoQzVZODFwSFJLdktUSmVURW52c3p5?=
 =?utf-8?B?UFlCOElXME9FdWRUVHVvQXV0NGYydEJCSXVNbGFmbEhiOFlBU25hVWRxNHFh?=
 =?utf-8?B?bDhZZVFFL0FjQ3RYbWZDWkk5MVVxQ2JsSDc3SEhrcE52U2JuTGdBcDhmcVow?=
 =?utf-8?B?M3dmbi9leGt3RUhYTUZ4ckxDdkRYTXpoZnZtVTFqcnBBVXI2MldhRzlBVUhs?=
 =?utf-8?B?M2g0a3lrcE9aejhSVmVVejRwa1RTcjY4VHRkSFYxdWpIbG91WU16bDFPcjVa?=
 =?utf-8?B?UEpmaW13K0pvWkNrRmtsVWh6ejduSnpNUFYvNVlGYnhlUVRKZGxMUjczMmxo?=
 =?utf-8?B?d29oWUtSVUFRWnhVNkhaZytKeG1NanRqRWFrdUJUZ3lqZGNlWGVuSXhVNEJE?=
 =?utf-8?B?Q05yMmJJTm05Wk5tWC9vY2pHY1cxQmJaYmdJYW5WRGw3VUduc0V5Qjd2V2dx?=
 =?utf-8?B?K1VBMGpaWUxON1hma3lHL1lUTGprZFFrWk9TWTZKc3kxQzJIYVB6V0dkcUhV?=
 =?utf-8?B?VndzUUFYTHpwVHdrQkRpUVpRZ1Z2TWMrUTRibTF0VHNWbEpvRy83bU1iMFRR?=
 =?utf-8?B?emZIV0tqV3FMTG1XWkNJVVE3Y1lPOVk1RjYyYVpGL3N5ZEcvMDliSkhVK0xx?=
 =?utf-8?B?dW5qUm42L20wY3o1d0h2OUxBQ1JQeEV6KzN5VmNOMnd1THpxRG0xazB0T3pa?=
 =?utf-8?B?Vk1mTnlCZGZuWEZ6Umc0OThSeE5VSi9xMG1qb0ZDdTc5Q05QRVBVd3ZDemNi?=
 =?utf-8?B?cEd5Rm91Z3RoWXY2aXBRT2g0eTdTb2Q4MjYrVTRpSDhhS1NvK3pIaUoyajUz?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0e7764-c6a3-4d71-94a2-08dad91fde79
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 13:26:52.7632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nS/94POcLNwXC7oZJS9y/dYE/0A+wp3NM/X/Rukk5yDcEYyQkeIn+335CUOuGw69/DcvrILyq/P2yP7xlSKipD0YxOPGbCEWY2/f8AX/rtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5022
X-Proofpoint-ORIG-GUID: -MmCKoRauAWhXy2p8nb9ajF6N-YJ8QoN
X-Proofpoint-GUID: dq9OYpY0QGndjB-j06SDZgSNn_-xsgmv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_07,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212080113
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2B8Cn20n024736
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 13:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174407

On 2022-12-08 06:26, Sundeep KOKKONDA via lists.openembedded.org wrote:
> Rust code compilation on qemu failed with with below error.
> error: Error loading target specification: Could not find specification=
 for target "x86_64-poky-linux-gnu". Run `rustc --print target-list` for =
a list of built-in targets.
>
> This patch fix the issue by adding the missing json file to the image.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>   meta/recipes-devtools/rust/files/target.json | 39 +++++++++++++++++++=
+

When I fixed this manually, I just copied this file from:

tmp/work/core2-64-poky-linux/rust/1.65.0-r0/rustc-1.65.0-src/src/test/run=
-make-fulldeps/rustdoc-target-spec-json-path/target.json

so I'm puzzled about why you didn't take that file, or better still a=20
non-test source of that file,
and perhaps sed out the=C2=A0 'has-elf-tls' line that generates the warni=
ng.

Also, this looks like it would only work for x86-64 due to:

data-layout":
+"e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"=
,


Perhaps the target.json isn't really what's needed since I
I don't see such a file in my desktop install that I installed using rust=
up.

Back to the drawing board....

Oh, in the rust git repo:
$ grep -B 4 -A 2 target.json RELEASES.md
Compiler
-----------------------

- [Rustc will now search for custom JSON targets in
 =C2=A0 `/lib/rustlib/<target-triple>/target.json` where `/` is the "sysr=
oot"
 =C2=A0 directory.][83800] You can find your sysroot directory by running
 =C2=A0 `rustc --print sysroot`.

so maybe looking at the commit log for that change will get you heading=20
in the right direction.

../Randy

>   meta/recipes-devtools/rust/rust.inc          |  9 +++++
>   meta/recipes-devtools/rust/rust_1.65.0.bb    |  2 +
>   3 files changed, 50 insertions(+)
>   create mode 100644 meta/recipes-devtools/rust/files/target.json
>
> diff --git a/meta/recipes-devtools/rust/files/target.json b/meta/recipe=
s-devtools/rust/files/target.json
> new file mode 100644
> index 0000000000..69dbbaa9f9
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/target.json
> @@ -0,0 +1,39 @@
> +{
> +   "arch": "x86_64",
> +   "cpu": "x86-64",
> +   "crt-static-respected": true,
> +   "data-layout":
> +"e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S12=
8",
> +   "dynamic-linking": true,
> +   "env": "gnu",
> +   "executables": true,
> +   "has-rpath": true,
> +   "linker-is-gnu": true,
> +   "llvm-target": "x86_64-unknown-linux-gnu",
> +   "max-atomic-width": 64,
> +   "os": "linux",
> +   "position-independent-executables": true,
> +   "pre-link-args": {
> +     "gcc": [
> +       "-m64"
> +     ]
> +   },
> +   "relro-level": "full",
> +   "stack-probes": {
> +     "kind": "inline-or-call",
> +     "min-llvm-version-for-inline": [
> +       11,
> +       0,
> +       1
> +     ]
> +   },
> +   "supported-sanitizers": [
> +     "address",
> +     "leak",
> +     "memory",
> +     "thread"
> +   ],
> +   "target-family": "unix",
> +   "target-pointer-width": "64"
> +}
> +
> diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtool=
s/rust/rust.inc
> index 956301023a..75473f967b 100644
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -13,6 +13,10 @@ DEPENDS:append:class-nativesdk =3D " nativesdk-rust-=
llvm"
>  =20
>   S =3D "${RUSTSRC}"
>  =20
> +SRC_URI +=3D "\
> +     file://target.json \
> +"
> +
>   export FORCE_CRATE_HASH=3D"${BB_TASKHASH}"
>  =20
>   RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_LIBDIR}/llvm-rust/bin/llvm-co=
nfig"
> @@ -217,3 +221,8 @@ rust_do_install () {
>   do_install () {
>       rust_do_install
>   }
> +
> +FILE_${PN} +=3D " \
> +       ${WORKDIR}/target.json \
> +"
> +
> diff --git a/meta/recipes-devtools/rust/rust_1.65.0.bb b/meta/recipes-d=
evtools/rust/rust_1.65.0.bb
> index dbf74cec8f..afef72e45c 100644
> --- a/meta/recipes-devtools/rust/rust_1.65.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.65.0.bb
> @@ -68,6 +68,8 @@ rust_do_install:class-target() {
>           chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
>       done
>  =20
> +    cp ${WORKDIR}/target.json ${D}${libdir}/rustlib/${RUST_TARGET_SYS}
> +
>       chown root:root ${D}/ -R
>       rm ${D}${libdir}/rustlib/uninstall.sh
>       rm ${D}${libdir}/rustlib/install.log
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174396): https://lists.openembedded.org/g/openembed=
ded-core/message/174396
> Mute This Topic: https://lists.openembedded.org/mt/95535785/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


