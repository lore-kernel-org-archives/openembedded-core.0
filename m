Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340F1C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 22:26:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.50783.1679956003002829854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 15:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=D9uMP2NE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2450b4e5dc=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RKbrbk018601
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 22:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ahJGseieBJ+Z2NTlTBYo7gi1tS1YXJXBE5ve/6HxY+I=;
 b=D9uMP2NEF76BtsOq/IebHzHvnwpR6N7AxmM3rhcudxNsg6pYRjHQ1RQzAXQjhQop6NMD
 BE8Z3G78ZMd5qX3igGEP8hjCxUFniwHE665aJk23+xt7vf9rG3L7RXZ9UlTEFMUvPfva
 z45ANfFIdWKp5Utd6dPaFJo5uOK2M0L5Uh0TqJO1MvZEadIcmBmCKaKOTWny4KdN7CpX
 avI13hoAu1h1fmAYuYox5om05ygwmDLihUoDKMezp1RyofduKsX/vqavrX2ZAuKWQifk
 mKseYI1+eSAsbZAa6VXqXg8Ugn4NcSd5rNQ8Oqht3LF42DB9hth66oby7ZjutMtOBrrf Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php642gs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 22:26:41 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RMQfq2011846
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 22:26:41 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php642gs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 22:26:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYhBKrYX28L6CPWK6oWl8SFYYa5FRo4ypesV2jbu9W2AKNpycZZ9JcoDGVOKHOLNN8SRbdiRVDjtRtmD2XhG/fqfT+7DgGyMzN6XCZTOFTN2cqWcikQYjyA4jEN/AKPa7zaz/9NtQmxcFYJrXfvNPwXUxp8FqR9meKLLlFr76g2x/UOpt+n0Hnd0iTMKTOySMarWVcN4Z3x1ZMrKlW7FnVBKEhj31GyjPX2izJGXIOAhEX28zY+ZfSSdy4T6J49Fbe83lRTP1lpKro8Es1zPnHHZ2jbTU7F9psmsYMa7/52os+qUAxuPspFMonD2IPD+f29qpAVwoQuFx6f8dlestQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahJGseieBJ+Z2NTlTBYo7gi1tS1YXJXBE5ve/6HxY+I=;
 b=IQcC/9cpv4udb8L9nr7g4r+ZoiIogTATgWahKxw7VSRXww5WjLJzFtqx6IUMDDQBUMULq/2GC4EthpBv7pvoN+n1qFLMxVpWYzBTChuoc637WonP4p4BQrWNVeFHxaAokp8fISuDlkivv4E10CGoajzEbmIYJQApEUmki4O2tZNpOFRgolI/5Smw0YloqvLlFw3zkem7HNSDX9pJGznKBD8qHAz39MUoT7kC3jiJs15mSOvdA76/2mVIViJC5aAMabK/Z31mIQ4btfuttgkPZG2Ge0GyKEDRaOeBb3e8g58RsIwngW3urs3fl9gONwaJEb2jKFrysCGiHqXFMRkz0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Mon, 27 Mar
 2023 22:26:38 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7%5]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 22:26:38 +0000
Message-ID: <c4fcf1ab-3cf5-03f3-9fc2-36ee9f243634@windriver.com>
Date: Mon, 27 Mar 2023 18:26:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [kirkstone][PATCH v2] go: fix CVE-2022-2879 and
 CVE-2022-41720
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230321193606.2656701-1-sakib.sajal@windriver.com>
 <CAOSpxdb6Lo=TxqXNSjCR5mrHdCsw419wmf_be+oQYQYxJgs0Ng@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: <CAOSpxdb6Lo=TxqXNSjCR5mrHdCsw419wmf_be+oQYQYxJgs0Ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BL1P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::14) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|PH7PR11MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c73e2d1-9893-40fa-9ede-08db2f1254e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4ZDVX/zrtUdhm2jKn0X851RcTUo24vKPBF+QNvM/wiwI8hjjD2KlJxAGqW3xd9J43IveBiR+YEg89apZL1h8dibVDpp3Lddg8dhdpG/XTWxm3GPXWfTNIg5dUNUToknmdyATF1/R67ylIpJY+RPX8eAlohp2uQWQ/XkIGoPYH/S2KH2jvAfnzQmJfq6Y0364igHycnZYZmPnJoUrPVbR1nBirm+UCjAeYNQxfWqnreqV45ZLwLY0qhmpD4t9tlzsgG7px0frkcRPQsgLWzTb7qzPgM6Ss9jlWNT25uK/SlovsqHWQEaDEBlYNOEsQAf19zayqQ5zzrCL27RBVKjVvQekkejlCqUf7BJ3SNjCzaHeI3CC0vP8MC7gl1DmWoajwO3Q5w1wuQZTAIrswOX1TjpLN3AGtFwG6Zs6EHxXj69ELsF1ZLzuoF8DSCKrlofrx8TbBzRn4wgRDE4CafxKRoJYn3wEDZDtGLQFFaHOWVD5ygh5zqEULDhIZUZf4LpqW5emcJGqhpcMGCDdzo95b1o2aSQ6+n2TUqeXC5fIfRUm8sAip8/PRSfLiJT78/4yW7h3LHSe1LfKof5dH1zaw7dCbWSc9HxQoFH+JMzEtjd30BPN1tyz4ozJjuGAJcDGGgWdDVZ9YukpbTrDUvaPnEIQTw1fVoCoqloxxYPF/QCcLJzl9N4aO3hGfvXUiOdW2rsgB4P24BI2VzyfvjD2zw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(451199021)(66899021)(31686004)(2616005)(83380400001)(41300700001)(31696002)(44832011)(36756003)(86362001)(5660300002)(38100700002)(8936002)(6486002)(966005)(478600001)(8676002)(66946007)(66556008)(4326008)(6916009)(2906002)(66476007)(6512007)(53546011)(30864003)(6506007)(316002)(186003)(26005)(403724002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWNORS9OcmRFTU5mdGZKMjdmR2RwNHFxb1NLSWJWZGE1eTJPT2ZOVDJRZysy?=
 =?utf-8?B?RGVkdDYvVHZVZ2Uva3NIcnlVS0I4T014R25qM1BpeTVZY09aWjBUdVNaekJP?=
 =?utf-8?B?a01Ya0dON1BYWGNZeEVFKy90WGYzSTY0STBtLzFrNERJTkp3cysrZURMcEI0?=
 =?utf-8?B?aDJ3Sk5EcFIvYVBRM2tBU251UWNHR3JQdkpGbEhRaW9wL01nU3NEaWlHMHJE?=
 =?utf-8?B?UDVHaFkwRUJMbkp4MTdEaUczRUZNQnltQ3hCK1BGUElZNU9hcTJFVkhEdWtv?=
 =?utf-8?B?NTk2OXkyVjhZaFpFNS9Ia1ZaSlp6SFJoMGdqMkJFeTluQkorUEs3bWNKTUYx?=
 =?utf-8?B?ZiswWEhYRzFpVm81a1RPZlVGUGpuTkRoZ2dJblh3QkRJZ2oyemRiajRVK0ZE?=
 =?utf-8?B?bUpKQm80T3VnU2drQ0ZiOXpsd0ZGd0tlTm1pU3IzZHd2WDExTkJuNlc1eHY4?=
 =?utf-8?B?bWYxU0I1ZS9uQ1hNQy9hSk5uc1dGWDU5MHdXTTY2bjBscnNlRldKQk0rcnZx?=
 =?utf-8?B?OGdjdi8wc0FCRFF0NkFXMlp2a1R4anlIbTk5R2hlcXZkV0RYZW0wMUxMa3ZS?=
 =?utf-8?B?Y2FPQjhIcnVnK25WMjcxVGNKUUk0REQ0L0VKNE11SC9nTkFNWUw4dGt2cm5G?=
 =?utf-8?B?RUM0bXByZ0NzK0pSeTNCK0FIRjhzbWhTUlEvUk9wUkZUU3owWG04U25PZ095?=
 =?utf-8?B?NkpIWlBCaEplLzZwRURKL2ZJZklpU2RtN3RpRGZPeEZDVHZSaG8wZGtVWFNW?=
 =?utf-8?B?Z3lRak9WaEZPWTZ3TjQ0cUFKM3BlcmNJSmViOEh6MjJGMjYrNDRkS0x2azBS?=
 =?utf-8?B?dUxLMXN4V1YzUGorMEVVK3U2OHo5MTUyY1pJTWZ3Nm1sNWNJWmtVc2xSVy8y?=
 =?utf-8?B?ekV3cWxzYkJzVVYxTlJocWU5anZGd1Z0S2tIWWI2VW9LNmRQVmhCSnNjSWRG?=
 =?utf-8?B?ODZSSWxGK3VMWUdlUmhYZmFaY3hPSDRpcy9EU0VPUzBoRWFMdmVTMG1hUFJ5?=
 =?utf-8?B?WFFCU2plKzVmZWpiV2sza2c0Y1NqbWFNY3pQVUkyWW1zbjc1YW1yV2tNRnZK?=
 =?utf-8?B?OUpWdW5ESXdUQlp3QW1BWTF3ZTBWUElUemI3VlNVa2VBVVdld0NpVGtyTjlG?=
 =?utf-8?B?L3UzMzNoMkhLeG9xdFdCWGRoRGk5QXZJUjJURnMvdGJsQ2l6ZEk2VFF3Qmho?=
 =?utf-8?B?R0NvSTM3aXhEYUhDdFVHQTNsL0w4bFVwRUR5eW0xb1ZRd3htdURpakp4YW4z?=
 =?utf-8?B?ZWVxTUNEcGlYK0lpanRjMjhGSmdEcnVmRFV0R2JqZGZRUWVINE9aRTZNM3gv?=
 =?utf-8?B?ZExYdFZMZnZnRUtJY0pRamluSU1WNzRaMjhCWFcrb1NKcHZPNzZLc3pnc2p6?=
 =?utf-8?B?dTVHOEE0NXlsQnBhbXhVbHVZeWZzcHYrU0RVQ3hzUTBUTWZaSGt6MjdHOEhW?=
 =?utf-8?B?NXRLZDBZUi9QRzJWWk81Q0o5ZzFRVEJHUUtESEczZGhMYlVKVjMwMm01UVZl?=
 =?utf-8?B?bDl4UkljSmlmSFpKMy8xRnk5RytWSms1ZmZiZ3lHNFRqYzRxUzJPYkxOaHkw?=
 =?utf-8?B?Q20wQ3BIZVBUd1VKZDc4UUU0VmdTQVJBZlRPTTN6V2lHWE1objNoQVdzeEtE?=
 =?utf-8?B?cXFldi91NkI0ZlkvVlh6bFA2UVQwb0NFUnQrdFJlWmJwKzltMk95UmVzTGM1?=
 =?utf-8?B?Wlgxelk1NWp4THhyUGxSNWdXZGtsWi8ya3Q5VWNzY0dLMXRpRDdCRjVQSkk3?=
 =?utf-8?B?OUtaTUZVNzdxN0RKNkFOSmJ6TFRvclFZMG0rMmtZQnNxMkRYS2pYZ0NNTVpu?=
 =?utf-8?B?NVlaajZib0lxTDVZNFJzcGp4TE5xcS9DeEpoUHZJTWtZclEzLzZ6Z2tVRGNK?=
 =?utf-8?B?ekxlVmVhcFRXNVNGMUFISE85cm1QL0dhRFJLK2VSaU10OVFYSEJIblozRlVn?=
 =?utf-8?B?WlBPSmsxSGJEOHhpSGJTdjBvYmZudC9PSUZEdFJZMjVSZnduejB0bXdwZHBk?=
 =?utf-8?B?N2EyN3A0WXFTN0N2QlBxN05aWlRGWktXRHU3K1ZSNmpkQU5LNzFpUTdUZ0ZU?=
 =?utf-8?B?L0VmTjV3TVYwZ1JtTUgxU3lOSU1FaHhyQ0duZ0x3M2hpK1ZiQ1RJcHhURGNr?=
 =?utf-8?B?b2pwUHZiVlFYbHdvcjNUVXNQMnE3S0dBRlF6N2E0MXB5K20xSkE1SFFMcytR?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c73e2d1-9893-40fa-9ede-08db2f1254e6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 22:26:38.5248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuzD9QPl3CFGouxMshBWdBGTrBLcSE3MOp3n0ZDSjrAojW3icrGHea0qBbdizweMIAcv6X1I0lBa/BMXJ0G9C8CiluAymlfAUFaIp4DS/oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6978
X-Proofpoint-ORIG-GUID: KdR19uyx9xfPxpM73duZTrif6EAo1Xax
X-Proofpoint-GUID: OoC8JNdx7stPO4rxqQ51bhuJwXYXOI_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270179
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32RKbrbk018601
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 22:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179187


On 2023-03-22 12:21, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Mar 21, 2023 at 9:36=E2=80=AFAM Sakib Sajal <sakib.sajal@windri=
ver.com> wrote:
>> Backport appropriate patches to fix CVE-2022-2879 and CVE-2022-41720.
>>
>> Modified the original fix for CVE-2022-2879 to remove a testdata tarba=
ll
>> and any references to it since git binary diffs are not supported in
>> quilt.
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   meta/recipes-devtools/go/go-1.17.13.inc       |   2 +
>>   ...01-archive-tar-limit-size-of-headers.patch | 177 ++++++
>>   ...d-escapes-from-os.DirFS-and-http.Dir.patch | 514 ++++++++++++++++=
++
>>   3 files changed, 693 insertions(+)
>>   create mode 100644 meta/recipes-devtools/go/go-1.18/0001-archive-tar=
-limit-size-of-headers.patch
>>   create mode 100644 meta/recipes-devtools/go/go-1.18/0002-os-net-http=
-avoid-escapes-from-os.DirFS-and-http.Dir.patch
>>
>> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-de=
vtools/go/go-1.17.13.inc
>> index 99662bd298..a6081bdee7 100644
>> --- a/meta/recipes-devtools/go/go-1.17.13.inc
>> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
>> @@ -20,6 +20,8 @@ SRC_URI +=3D "\
>>       file://0001-net-http-httputil-avoid-query-parameter-smuggling.pa=
tch \
>>       file://CVE-2022-41715.patch \
>>       file://CVE-2022-41717.patch \
>> +    file://0001-archive-tar-limit-size-of-headers.patch \
>> +    file://0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.=
patch \
> Could you please resubmit with the patch file names changed to reflect
> the CVE they are fixing? i.e.
>
>        file://CVE-2022-2879.patch \
>        file://CVE-2022-41720.patch \
>
> Thanks!
>
> Steve

Done!

Sakib

>
>>   "
>>   SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f=
6f1d1fc0c1d784ada0cd300fd"
>>
>> diff --git a/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-s=
ize-of-headers.patch b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-=
limit-size-of-headers.patch
>> new file mode 100644
>> index 0000000000..0315e1a3ee
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-size-of-=
headers.patch
>> @@ -0,0 +1,177 @@
>> +From d064ed520a7cc6b480f9565e30751e695d394f4e Mon Sep 17 00:00:00 200=
1
>> +From: Damien Neil <dneil@google.com>
>> +Date: Fri, 2 Sep 2022 20:45:18 -0700
>> +Subject: [PATCH] archive/tar: limit size of headers
>> +
>> +Set a 1MiB limit on special file blocks (PAX headers, GNU long names,
>> +GNU link names), to avoid reading arbitrarily large amounts of data
>> +into memory.
>> +
>> +Thanks to Adam Korczynski (ADA Logics) and OSS-Fuzz for reporting
>> +this issue.
>> +
>> +Fixes CVE-2022-2879
>> +Updates #54853
>> +Fixes #55925
>> +
>> +Change-Id: I85136d6ff1e0af101a112190e027987ab4335680
>> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-priv=
ate/+/1565555
>> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
>> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
>> +Reviewed-by: Roland Shoemaker <bracewell@google.com>
>> +(cherry picked from commit 6ee768cef6b82adf7a90dcf367a1699ef694f3b2)
>> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-priv=
ate/+/1590622
>> +Reviewed-by: Damien Neil <dneil@google.com>
>> +Reviewed-by: Julie Qiu <julieqiu@google.com>
>> +Reviewed-on: https://go-review.googlesource.com/c/go/+/438500
>> +Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
>> +Reviewed-by: Carlos Amedee <carlos@golang.org>
>> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
>> +Run-TryBot: Carlos Amedee <carlos@golang.org>
>> +TryBot-Result: Gopher Robot <gobot@golang.org>
>> +
>> +CVE: CVE-2022-2879
>> +Upstream-Status: Backport [0a723816cd205576945fa57fbdde7e6532d59d08]
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + src/archive/tar/format.go      |  4 ++++
>> + src/archive/tar/reader.go      | 14 ++++++++++++--
>> + src/archive/tar/reader_test.go |  8 +++++++-
>> + src/archive/tar/writer.go      |  3 +++
>> + src/archive/tar/writer_test.go | 27 +++++++++++++++++++++++++++
>> + 5 files changed, 53 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/src/archive/tar/format.go b/src/archive/tar/format.go
>> +index cfe24a5..6642364 100644
>> +--- a/src/archive/tar/format.go
>> ++++ b/src/archive/tar/format.go
>> +@@ -143,6 +143,10 @@ const (
>> +       blockSize  =3D 512 // Size of each block in a tar stream
>> +       nameSize   =3D 100 // Max length of the name field in USTAR fo=
rmat
>> +       prefixSize =3D 155 // Max length of the prefix field in USTAR =
format
>> ++
>> ++      // Max length of a special file (PAX header, GNU long name or =
link).
>> ++      // This matches the limit used by libarchive.
>> ++      maxSpecialFileSize =3D 1 << 20
>> + )
>> +
>> + // blockPadding computes the number of bytes needed to pad offset up=
 to the
>> +diff --git a/src/archive/tar/reader.go b/src/archive/tar/reader.go
>> +index 1b1d5b4..f645af8 100644
>> +--- a/src/archive/tar/reader.go
>> ++++ b/src/archive/tar/reader.go
>> +@@ -103,7 +103,7 @@ func (tr *Reader) next() (*Header, error) {
>> +                       continue // This is a meta header affecting th=
e next header
>> +               case TypeGNULongName, TypeGNULongLink:
>> +                       format.mayOnlyBe(FormatGNU)
>> +-                      realname, err :=3D io.ReadAll(tr)
>> ++                      realname, err :=3D readSpecialFile(tr)
>> +                       if err !=3D nil {
>> +                               return nil, err
>> +                       }
>> +@@ -293,7 +293,7 @@ func mergePAX(hdr *Header, paxHdrs map[string]str=
ing) (err error) {
>> + // parsePAX parses PAX headers.
>> + // If an extended header (type 'x') is invalid, ErrHeader is returne=
d
>> + func parsePAX(r io.Reader) (map[string]string, error) {
>> +-      buf, err :=3D io.ReadAll(r)
>> ++      buf, err :=3D readSpecialFile(r)
>> +       if err !=3D nil {
>> +               return nil, err
>> +       }
>> +@@ -826,6 +826,16 @@ func tryReadFull(r io.Reader, b []byte) (n int, =
err error) {
>> +       return n, err
>> + }
>> +
>> ++// readSpecialFile is like io.ReadAll except it returns
>> ++// ErrFieldTooLong if more than maxSpecialFileSize is read.
>> ++func readSpecialFile(r io.Reader) ([]byte, error) {
>> ++      buf, err :=3D io.ReadAll(io.LimitReader(r, maxSpecialFileSize+=
1))
>> ++      if len(buf) > maxSpecialFileSize {
>> ++              return nil, ErrFieldTooLong
>> ++      }
>> ++      return buf, err
>> ++}
>> ++
>> + // discard skips n bytes in r, reporting an error if unable to do so.
>> + func discard(r io.Reader, n int64) error {
>> +       // If possible, Seek to the last byte before the end of the da=
ta section.
>> +diff --git a/src/archive/tar/reader_test.go b/src/archive/tar/reader_=
test.go
>> +index 789ddc1..926dc3d 100644
>> +--- a/src/archive/tar/reader_test.go
>> ++++ b/src/archive/tar/reader_test.go
>> +@@ -6,6 +6,7 @@ package tar
>> +
>> + import (
>> +       "bytes"
>> ++      "compress/bzip2"
>> +       "crypto/md5"
>> +       "errors"
>> +       "fmt"
>> +@@ -625,9 +626,14 @@ func TestReader(t *testing.T) {
>> +                       }
>> +                       defer f.Close()
>> +
>> ++                      var fr io.Reader =3D f
>> ++                      if strings.HasSuffix(v.file, ".bz2") {
>> ++                              fr =3D bzip2.NewReader(fr)
>> ++                      }
>> ++
>> +                       // Capture all headers and checksums.
>> +                       var (
>> +-                              tr      =3D NewReader(f)
>> ++                              tr      =3D NewReader(fr)
>> +                               hdrs    []*Header
>> +                               chksums []string
>> +                               rdbuf   =3D make([]byte, 8)
>> +diff --git a/src/archive/tar/writer.go b/src/archive/tar/writer.go
>> +index e80498d..893eac0 100644
>> +--- a/src/archive/tar/writer.go
>> ++++ b/src/archive/tar/writer.go
>> +@@ -199,6 +199,9 @@ func (tw *Writer) writePAXHeader(hdr *Header, pax=
Hdrs map[string]string) error {
>> +                       flag =3D TypeXHeader
>> +               }
>> +               data :=3D buf.String()
>> ++              if len(data) > maxSpecialFileSize {
>> ++                      return ErrFieldTooLong
>> ++              }
>> +               if err :=3D tw.writeRawFile(name, data, flag, FormatPA=
X); err !=3D nil || isGlobal {
>> +                       return err // Global headers return here
>> +               }
>> +diff --git a/src/archive/tar/writer_test.go b/src/archive/tar/writer_=
test.go
>> +index a00f02d..4e709e5 100644
>> +--- a/src/archive/tar/writer_test.go
>> ++++ b/src/archive/tar/writer_test.go
>> +@@ -1006,6 +1006,33 @@ func TestIssue12594(t *testing.T) {
>> +       }
>> + }
>> +
>> ++func TestWriteLongHeader(t *testing.T) {
>> ++      for _, test :=3D range []struct {
>> ++              name string
>> ++              h    *Header
>> ++      }{{
>> ++              name: "name too long",
>> ++              h:    &Header{Name: strings.Repeat("a", maxSpecialFile=
Size)},
>> ++      }, {
>> ++              name: "linkname too long",
>> ++              h:    &Header{Linkname: strings.Repeat("a", maxSpecial=
FileSize)},
>> ++      }, {
>> ++              name: "uname too long",
>> ++              h:    &Header{Uname: strings.Repeat("a", maxSpecialFil=
eSize)},
>> ++      }, {
>> ++              name: "gname too long",
>> ++              h:    &Header{Gname: strings.Repeat("a", maxSpecialFil=
eSize)},
>> ++      }, {
>> ++              name: "PAX header too long",
>> ++              h:    &Header{PAXRecords: map[string]string{"GOLANG.x"=
: strings.Repeat("a", maxSpecialFileSize)}},
>> ++      }} {
>> ++              w :=3D NewWriter(io.Discard)
>> ++              if err :=3D w.WriteHeader(test.h); err !=3D ErrFieldTo=
oLong {
>> ++                      t.Errorf("%v: w.WriteHeader() =3D %v, want Err=
FieldTooLong", test.name, err)
>> ++              }
>> ++      }
>> ++}
>> ++
>> + // testNonEmptyWriter wraps an io.Writer and ensures that
>> + // Write is never called with an empty buffer.
>> + type testNonEmptyWriter struct{ io.Writer }
>> diff --git a/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-e=
scapes-from-os.DirFS-and-http.Dir.patch b/meta/recipes-devtools/go/go-1.1=
8/0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch
>> new file mode 100644
>> index 0000000000..6c2e8804b3
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-escapes-=
from-os.DirFS-and-http.Dir.patch
>> @@ -0,0 +1,514 @@
>> +From f8896a97a0630b0f2f8c488310147f7f20b3ec7d Mon Sep 17 00:00:00 200=
1
>> +From: Damien Neil <dneil@google.com>
>> +Date: Thu, 10 Nov 2022 12:16:27 -0800
>> +Subject: [PATCH] os, net/http: avoid escapes from os.DirFS and http.D=
ir on
>> + Windows
>> +
>> +Do not permit access to Windows reserved device names (NUL, COM1, etc=
.)
>> +via os.DirFS and http.Dir filesystems.
>> +
>> +Avoid escapes from os.DirFS(`\`) on Windows. DirFS would join the
>> +the root to the relative path with a path separator, making
>> +os.DirFS(`\`).Open(`/foo/bar`) open the path `\\foo\bar`, which is
>> +a UNC name. Not only does this not open the intended file, but permit=
s
>> +reference to any file on the system rather than only files on the
>> +current drive.
>> +
>> +Make os.DirFS("") invalid, with all file access failing. Previously,
>> +a root of "" was interpreted as "/", which is surprising and probably
>> +unintentional.
>> +
>> +Fixes CVE-2022-41720.
>> +Fixes #56694.
>> +
>> +Change-Id: I275b5fa391e6ad7404309ea98ccc97405942e0f0
>> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-priv=
ate/+/1663832
>> +Reviewed-by: Julie Qiu <julieqiu@google.com>
>> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
>> +Reviewed-on: https://go-review.googlesource.com/c/go/+/455360
>> +Reviewed-by: Michael Pratt <mpratt@google.com>
>> +TryBot-Result: Gopher Robot <gobot@golang.org>
>> +Run-TryBot: Jenny Rakoczy <jenny@golang.org>
>> +
>> +CVE: CVE-2022-41720
>> +Upstream-Status: Backport [7013a4f5f816af62033ad63dd06b77c30d7a62a7]
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + src/go/build/deps_test.go                 |  1 +
>> + src/internal/safefilepath/path.go         | 21 +++++
>> + src/internal/safefilepath/path_other.go   | 23 ++++++
>> + src/internal/safefilepath/path_test.go    | 88 +++++++++++++++++++++
>> + src/internal/safefilepath/path_windows.go | 95 +++++++++++++++++++++=
++
>> + src/net/http/fs.go                        |  8 +-
>> + src/net/http/fs_test.go                   | 28 +++++++
>> + src/os/file.go                            | 36 +++++++--
>> + src/os/os_test.go                         | 38 +++++++++
>> + 9 files changed, 328 insertions(+), 10 deletions(-)
>> + create mode 100644 src/internal/safefilepath/path.go
>> + create mode 100644 src/internal/safefilepath/path_other.go
>> + create mode 100644 src/internal/safefilepath/path_test.go
>> + create mode 100644 src/internal/safefilepath/path_windows.go
>> +
>> +diff --git a/src/go/build/deps_test.go b/src/go/build/deps_test.go
>> +index 45e2f25..dc3bb8c 100644
>> +--- a/src/go/build/deps_test.go
>> ++++ b/src/go/build/deps_test.go
>> +@@ -165,6 +165,7 @@ var depsRules =3D `
>> +       io/fs
>> +       < internal/testlog
>> +       < internal/poll
>> ++      < internal/safefilepath
>> +       < os
>> +       < os/signal;
>> +
>> +diff --git a/src/internal/safefilepath/path.go b/src/internal/safefil=
epath/path.go
>> +new file mode 100644
>> +index 0000000..0f0a270
>> +--- /dev/null
>> ++++ b/src/internal/safefilepath/path.go
>> +@@ -0,0 +1,21 @@
>> ++// Copyright 2022 The Go Authors. All rights reserved.
>> ++// Use of this source code is governed by a BSD-style
>> ++// license that can be found in the LICENSE file.
>> ++
>> ++// Package safefilepath manipulates operating-system file paths.
>> ++package safefilepath
>> ++
>> ++import (
>> ++      "errors"
>> ++)
>> ++
>> ++var errInvalidPath =3D errors.New("invalid path")
>> ++
>> ++// FromFS converts a slash-separated path into an operating-system p=
ath.
>> ++//
>> ++// FromFS returns an error if the path cannot be represented by the =
operating
>> ++// system. For example, paths containing '\' and ':' characters are =
rejected
>> ++// on Windows.
>> ++func FromFS(path string) (string, error) {
>> ++      return fromFS(path)
>> ++}
>> +diff --git a/src/internal/safefilepath/path_other.go b/src/internal/s=
afefilepath/path_other.go
>> +new file mode 100644
>> +index 0000000..f93da18
>> +--- /dev/null
>> ++++ b/src/internal/safefilepath/path_other.go
>> +@@ -0,0 +1,23 @@
>> ++// Copyright 2022 The Go Authors. All rights reserved.
>> ++// Use of this source code is governed by a BSD-style
>> ++// license that can be found in the LICENSE file.
>> ++
>> ++//go:build !windows
>> ++
>> ++package safefilepath
>> ++
>> ++import "runtime"
>> ++
>> ++func fromFS(path string) (string, error) {
>> ++      if runtime.GOOS =3D=3D "plan9" {
>> ++              if len(path) > 0 && path[0] =3D=3D '#' {
>> ++                      return path, errInvalidPath
>> ++              }
>> ++      }
>> ++      for i :=3D range path {
>> ++              if path[i] =3D=3D 0 {
>> ++                      return "", errInvalidPath
>> ++              }
>> ++      }
>> ++      return path, nil
>> ++}
>> +diff --git a/src/internal/safefilepath/path_test.go b/src/internal/sa=
fefilepath/path_test.go
>> +new file mode 100644
>> +index 0000000..dc662c1
>> +--- /dev/null
>> ++++ b/src/internal/safefilepath/path_test.go
>> +@@ -0,0 +1,88 @@
>> ++// Copyright 2022 The Go Authors. All rights reserved.
>> ++// Use of this source code is governed by a BSD-style
>> ++// license that can be found in the LICENSE file.
>> ++
>> ++package safefilepath_test
>> ++
>> ++import (
>> ++      "internal/safefilepath"
>> ++      "os"
>> ++      "path/filepath"
>> ++      "runtime"
>> ++      "testing"
>> ++)
>> ++
>> ++type PathTest struct {
>> ++      path, result string
>> ++}
>> ++
>> ++const invalid =3D ""
>> ++
>> ++var fspathtests =3D []PathTest{
>> ++      {".", "."},
>> ++      {"/a/b/c", "/a/b/c"},
>> ++      {"a\x00b", invalid},
>> ++}
>> ++
>> ++var winreservedpathtests =3D []PathTest{
>> ++      {`a\b`, `a\b`},
>> ++      {`a:b`, `a:b`},
>> ++      {`a/b:c`, `a/b:c`},
>> ++      {`NUL`, `NUL`},
>> ++      {`./com1`, `./com1`},
>> ++      {`a/nul/b`, `a/nul/b`},
>> ++}
>> ++
>> ++// Whether a reserved name with an extension is reserved or not vari=
es by
>> ++// Windows version.
>> ++var winreservedextpathtests =3D []PathTest{
>> ++      {"nul.txt", "nul.txt"},
>> ++      {"a/nul.txt/b", "a/nul.txt/b"},
>> ++}
>> ++
>> ++var plan9reservedpathtests =3D []PathTest{
>> ++      {`#c`, `#c`},
>> ++}
>> ++
>> ++func TestFromFS(t *testing.T) {
>> ++      switch runtime.GOOS {
>> ++      case "windows":
>> ++              if canWriteFile(t, "NUL") {
>> ++                      t.Errorf("can unexpectedly write a file named =
NUL on Windows")
>> ++              }
>> ++              if canWriteFile(t, "nul.txt") {
>> ++                      fspathtests =3D append(fspathtests, winreserve=
dextpathtests...)
>> ++              } else {
>> ++                      winreservedpathtests =3D append(winreservedpat=
htests, winreservedextpathtests...)
>> ++              }
>> ++              for i :=3D range winreservedpathtests {
>> ++                      winreservedpathtests[i].result =3D invalid
>> ++              }
>> ++              for i :=3D range fspathtests {
>> ++                      fspathtests[i].result =3D filepath.FromSlash(f=
spathtests[i].result)
>> ++              }
>> ++      case "plan9":
>> ++              for i :=3D range plan9reservedpathtests {
>> ++                      plan9reservedpathtests[i].result =3D invalid
>> ++              }
>> ++      }
>> ++      tests :=3D fspathtests
>> ++      tests =3D append(tests, winreservedpathtests...)
>> ++      tests =3D append(tests, plan9reservedpathtests...)
>> ++      for _, test :=3D range tests {
>> ++              got, err :=3D safefilepath.FromFS(test.path)
>> ++              if (got =3D=3D "") !=3D (err !=3D nil) {
>> ++                      t.Errorf(`FromFS(%q) =3D %q, %v; want "" only =
if err !=3D nil`, test.path, got, err)
>> ++              }
>> ++              if got !=3D test.result {
>> ++                      t.Errorf("FromFS(%q) =3D %q, %v; want %q", tes=
t.path, got, err, test.result)
>> ++              }
>> ++      }
>> ++}
>> ++
>> ++func canWriteFile(t *testing.T, name string) bool {
>> ++      path :=3D filepath.Join(t.TempDir(), name)
>> ++      os.WriteFile(path, []byte("ok"), 0666)
>> ++      b, _ :=3D os.ReadFile(path)
>> ++      return string(b) =3D=3D "ok"
>> ++}
>> +diff --git a/src/internal/safefilepath/path_windows.go b/src/internal=
/safefilepath/path_windows.go
>> +new file mode 100644
>> +index 0000000..909c150
>> +--- /dev/null
>> ++++ b/src/internal/safefilepath/path_windows.go
>> +@@ -0,0 +1,95 @@
>> ++// Copyright 2022 The Go Authors. All rights reserved.
>> ++// Use of this source code is governed by a BSD-style
>> ++// license that can be found in the LICENSE file.
>> ++
>> ++package safefilepath
>> ++
>> ++import (
>> ++      "syscall"
>> ++      "unicode/utf8"
>> ++)
>> ++
>> ++func fromFS(path string) (string, error) {
>> ++      if !utf8.ValidString(path) {
>> ++              return "", errInvalidPath
>> ++      }
>> ++      for len(path) > 1 && path[0] =3D=3D '/' && path[1] =3D=3D '/' =
{
>> ++              path =3D path[1:]
>> ++      }
>> ++      containsSlash :=3D false
>> ++      for p :=3D path; p !=3D ""; {
>> ++              // Find the next path element.
>> ++              i :=3D 0
>> ++              dot :=3D -1
>> ++              for i < len(p) && p[i] !=3D '/' {
>> ++                      switch p[i] {
>> ++                      case 0, '\\', ':':
>> ++                              return "", errInvalidPath
>> ++                      case '.':
>> ++                              if dot < 0 {
>> ++                                      dot =3D i
>> ++                              }
>> ++                      }
>> ++                      i++
>> ++              }
>> ++              part :=3D p[:i]
>> ++              if i < len(p) {
>> ++                      containsSlash =3D true
>> ++                      p =3D p[i+1:]
>> ++              } else {
>> ++                      p =3D ""
>> ++              }
>> ++              // Trim the extension and look for a reserved name.
>> ++              base :=3D part
>> ++              if dot >=3D 0 {
>> ++                      base =3D part[:dot]
>> ++              }
>> ++              if isReservedName(base) {
>> ++                      if dot < 0 {
>> ++                              return "", errInvalidPath
>> ++                      }
>> ++                      // The path element is a reserved name with an=
 extension.
>> ++                      // Some Windows versions consider this a reser=
ved name,
>> ++                      // while others do not. Use FullPath to see if=
 the name is
>> ++                      // reserved.
>> ++                      if p, _ :=3D syscall.FullPath(part); len(p) >=3D=
 4 && p[:4] =3D=3D `\\.\` {
>> ++                              return "", errInvalidPath
>> ++                      }
>> ++              }
>> ++      }
>> ++      if containsSlash {
>> ++              // We can't depend on strings, so substitute \ for / m=
anually.
>> ++              buf :=3D []byte(path)
>> ++              for i, b :=3D range buf {
>> ++                      if b =3D=3D '/' {
>> ++                              buf[i] =3D '\\'
>> ++                      }
>> ++              }
>> ++              path =3D string(buf)
>> ++      }
>> ++      return path, nil
>> ++}
>> ++
>> ++// isReservedName reports if name is a Windows reserved device name.
>> ++// It does not detect names with an extension, which are also reserv=
ed on some Windows versions.
>> ++//
>> ++// For details, search for PRN in
>> ++// https://docs.microsoft.com/en-us/windows/desktop/fileio/naming-a-=
file.
>> ++func isReservedName(name string) bool {
>> ++      if 3 <=3D len(name) && len(name) <=3D 4 {
>> ++              switch string([]byte{toUpper(name[0]), toUpper(name[1]=
), toUpper(name[2])}) {
>> ++              case "CON", "PRN", "AUX", "NUL":
>> ++                      return len(name) =3D=3D 3
>> ++              case "COM", "LPT":
>> ++                      return len(name) =3D=3D 4 && '1' <=3D name[3] =
&& name[3] <=3D '9'
>> ++              }
>> ++      }
>> ++      return false
>> ++}
>> ++
>> ++func toUpper(c byte) byte {
>> ++      if 'a' <=3D c && c <=3D 'z' {
>> ++              return c - ('a' - 'A')
>> ++      }
>> ++      return c
>> ++}
>> +diff --git a/src/net/http/fs.go b/src/net/http/fs.go
>> +index 57e731e..43ee4b5 100644
>> +--- a/src/net/http/fs.go
>> ++++ b/src/net/http/fs.go
>> +@@ -9,6 +9,7 @@ package http
>> + import (
>> +       "errors"
>> +       "fmt"
>> ++      "internal/safefilepath"
>> +       "io"
>> +       "io/fs"
>> +       "mime"
>> +@@ -69,14 +70,15 @@ func mapDirOpenError(originalErr error, name stri=
ng) error {
>> + // Open implements FileSystem using os.Open, opening files for readi=
ng rooted
>> + // and relative to the directory d.
>> + func (d Dir) Open(name string) (File, error) {
>> +-      if filepath.Separator !=3D '/' && strings.ContainsRune(name, f=
ilepath.Separator) {
>> +-              return nil, errors.New("http: invalid character in fil=
e path")
>> ++      path, err :=3D safefilepath.FromFS(path.Clean("/" + name))
>> ++      if err !=3D nil {
>> ++              return nil, errors.New("http: invalid or unsafe file p=
ath")
>> +       }
>> +       dir :=3D string(d)
>> +       if dir =3D=3D "" {
>> +               dir =3D "."
>> +       }
>> +-      fullName :=3D filepath.Join(dir, filepath.FromSlash(path.Clean=
("/"+name)))
>> ++      fullName :=3D filepath.Join(dir, path)
>> +       f, err :=3D os.Open(fullName)
>> +       if err !=3D nil {
>> +               return nil, mapDirOpenError(err, fullName)
>> +diff --git a/src/net/http/fs_test.go b/src/net/http/fs_test.go
>> +index b42ade1..941448a 100644
>> +--- a/src/net/http/fs_test.go
>> ++++ b/src/net/http/fs_test.go
>> +@@ -648,6 +648,34 @@ func TestFileServerZeroByte(t *testing.T) {
>> +       }
>> + }
>> +
>> ++func TestFileServerNamesEscape(t *testing.T) {
>> ++      t.Run("h1", func(t *testing.T) {
>> ++              testFileServerNamesEscape(t, h1Mode)
>> ++      })
>> ++      t.Run("h2", func(t *testing.T) {
>> ++              testFileServerNamesEscape(t, h2Mode)
>> ++      })
>> ++}
>> ++func testFileServerNamesEscape(t *testing.T, h2 bool) {
>> ++      defer afterTest(t)
>> ++      ts :=3D newClientServerTest(t, h2, FileServer(Dir("testdata"))=
).ts
>> ++      defer ts.Close()
>> ++      for _, path :=3D range []string{
>> ++              "/../testdata/file",
>> ++              "/NUL", // don't read from device files on Windows
>> ++      } {
>> ++              res, err :=3D ts.Client().Get(ts.URL + path)
>> ++              if err !=3D nil {
>> ++                      t.Fatal(err)
>> ++              }
>> ++              res.Body.Close()
>> ++              if res.StatusCode < 400 || res.StatusCode > 599 {
>> ++                      t.Errorf("Get(%q): got status %v, want 4xx or =
5xx", path, res.StatusCode)
>> ++              }
>> ++
>> ++      }
>> ++}
>> ++
>> + type fakeFileInfo struct {
>> +       dir      bool
>> +       basename string
>> +diff --git a/src/os/file.go b/src/os/file.go
>> +index e717f17..cb87158 100644
>> +--- a/src/os/file.go
>> ++++ b/src/os/file.go
>> +@@ -37,12 +37,12 @@
>> + // Note: The maximum number of concurrent operations on a File may b=
e limited by
>> + // the OS or the system. The number should be high, but exceeding it=
 may degrade
>> + // performance or cause other issues.
>> +-//
>> + package os
>> +
>> + import (
>> +       "errors"
>> +       "internal/poll"
>> ++      "internal/safefilepath"
>> +       "internal/testlog"
>> +       "internal/unsafeheader"
>> +       "io"
>> +@@ -623,6 +623,8 @@ func isWindowsNulName(name string) bool {
>> + // the /prefix tree, then using DirFS does not stop the access any m=
ore than using
>> + // os.Open does. DirFS is therefore not a general substitute for a c=
hroot-style security
>> + // mechanism when the directory tree contains arbitrary content.
>> ++//
>> ++// The directory dir must not be "".
>> + func DirFS(dir string) fs.FS {
>> +       return dirFS(dir)
>> + }
>> +@@ -641,10 +643,11 @@ func containsAny(s, chars string) bool {
>> + type dirFS string
>> +
>> + func (dir dirFS) Open(name string) (fs.File, error) {
>> +-      if !fs.ValidPath(name) || runtime.GOOS =3D=3D "windows" && con=
tainsAny(name, `\:`) {
>> +-              return nil, &PathError{Op: "open", Path: name, Err: Er=
rInvalid}
>> ++      fullname, err :=3D dir.join(name)
>> ++      if err !=3D nil {
>> ++              return nil, &PathError{Op: "stat", Path: name, Err: er=
r}
>> +       }
>> +-      f, err :=3D Open(string(dir) + "/" + name)
>> ++      f, err :=3D Open(fullname)
>> +       if err !=3D nil {
>> +               return nil, err // nil fs.File
>> +       }
>> +@@ -652,16 +655,35 @@ func (dir dirFS) Open(name string) (fs.File, er=
ror) {
>> + }
>> +
>> + func (dir dirFS) Stat(name string) (fs.FileInfo, error) {
>> +-      if !fs.ValidPath(name) || runtime.GOOS =3D=3D "windows" && con=
tainsAny(name, `\:`) {
>> +-              return nil, &PathError{Op: "stat", Path: name, Err: Er=
rInvalid}
>> ++      fullname, err :=3D dir.join(name)
>> ++      if err !=3D nil {
>> ++              return nil, &PathError{Op: "stat", Path: name, Err: er=
r}
>> +       }
>> +-      f, err :=3D Stat(string(dir) + "/" + name)
>> ++      f, err :=3D Stat(fullname)
>> +       if err !=3D nil {
>> +               return nil, err
>> +       }
>> +       return f, nil
>> + }
>> +
>> ++// join returns the path for name in dir.
>> ++func (dir dirFS) join(name string) (string, error) {
>> ++      if dir =3D=3D "" {
>> ++              return "", errors.New("os: DirFS with empty root")
>> ++      }
>> ++      if !fs.ValidPath(name) {
>> ++              return "", ErrInvalid
>> ++      }
>> ++      name, err :=3D safefilepath.FromFS(name)
>> ++      if err !=3D nil {
>> ++              return "", ErrInvalid
>> ++      }
>> ++      if IsPathSeparator(dir[len(dir)-1]) {
>> ++              return string(dir) + name, nil
>> ++      }
>> ++      return string(dir) + string(PathSeparator) + name, nil
>> ++}
>> ++
>> + // ReadFile reads the named file and returns the contents.
>> + // A successful call returns err =3D=3D nil, not err =3D=3D EOF.
>> + // Because ReadFile reads the whole file, it does not treat an EOF f=
rom Read
>> +diff --git a/src/os/os_test.go b/src/os/os_test.go
>> +index 506f1fb..be269bb 100644
>> +--- a/src/os/os_test.go
>> ++++ b/src/os/os_test.go
>> +@@ -2702,6 +2702,44 @@ func TestDirFS(t *testing.T) {
>> +       if err =3D=3D nil {
>> +               t.Fatalf(`Open testdata\dirfs succeeded`)
>> +       }
>> ++
>> ++      // Test that Open does not open Windows device files.
>> ++      _, err =3D d.Open(`NUL`)
>> ++      if err =3D=3D nil {
>> ++              t.Errorf(`Open NUL succeeded`)
>> ++      }
>> ++}
>> ++
>> ++func TestDirFSRootDir(t *testing.T) {
>> ++      cwd, err :=3D os.Getwd()
>> ++      if err !=3D nil {
>> ++              t.Fatal(err)
>> ++      }
>> ++      cwd =3D cwd[len(filepath.VolumeName(cwd)):] // trim volume pre=
fix (C:) on Windows
>> ++      cwd =3D filepath.ToSlash(cwd)               // convert \ to /
>> ++      cwd =3D strings.TrimPrefix(cwd, "/")        // trim leading /
>> ++
>> ++      // Test that Open can open a path starting at /.
>> ++      d :=3D DirFS("/")
>> ++      f, err :=3D d.Open(cwd + "/testdata/dirfs/a")
>> ++      if err !=3D nil {
>> ++              t.Fatal(err)
>> ++      }
>> ++      f.Close()
>> ++}
>> ++
>> ++func TestDirFSEmptyDir(t *testing.T) {
>> ++      d :=3D DirFS("")
>> ++      cwd, _ :=3D os.Getwd()
>> ++      for _, path :=3D range []string{
>> ++              "testdata/dirfs/a",                          // not Di=
rFS(".")
>> ++              filepath.ToSlash(cwd) + "/testdata/dirfs/a", // not Di=
rFS("/")
>> ++      } {
>> ++              _, err :=3D d.Open(path)
>> ++              if err =3D=3D nil {
>> ++                      t.Fatalf(`DirFS("").Open(%q) succeeded`, path)
>> ++              }
>> ++      }
>> + }
>> +
>> + func TestDirFSPathsValid(t *testing.T) {
>> --
>> 2.40.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#178900): https://lists.openembedded.org/g/openembe=
dded-core/message/178900
>> Mute This Topic: https://lists.openembedded.org/mt/97763091/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

