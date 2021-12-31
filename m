Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D7FC433EF
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 02:18:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.7048.1640917133143033431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 18:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=E/I9X4Cr;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=89993e9ed3=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BV1v2S7032767
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 18:18:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=bL5JcUEPrNL3jD3b2Q2Nz6H/Xp3turh7F3sXzjcWQ8c=;
 b=E/I9X4CrumZV+ffPEM4FDwolTDGqxhD2JehHPeFvSgZl0WvnvZo0PxhhuylM6KPLjMvd
 0IfjfkRxqtaY3QwrBA7SImqTgEltKy6xjXCiKmzU+RAjEwjXOafiWKGOseQftrfMBETW
 caB7UuFEaYTBvPLFauN1AWkrmRszrbCLwlV6ABbr1jcgaVBxJPhYK4PqPXglq/h4sEt8
 ho02XAVl/EUmw3QQb6RZSbRo9tdUKLNFmAtA4KyJ3H7UUNcJ31xABdHMvaKDKZDY8soy
 7vULG6QnZZe/ufTqgSrcUlV9WEDY/09ygbEe1JQtTUdcuOTXkMsRIZ5ac8DckZHrWJEj mQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d94k6rj5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 18:18:52 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BV2IqjO009480
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 18:18:52 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d94k6rj5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Dec 2021 18:18:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUOrHV06ePD1JZO2SZ+F+MUx49RHVWTRWd+QCvyvasZ5YmCxfur4997Uu1JMh3FgLPuqmkqUqKkr0+JpVOYKr8D43sR4ECk8HS0ZgfxYOi6Vs5YmtZRYVQL0Xc+C2Q/ZQCxCAxjecTvr+qP415wVCWj3wjRlAU8kgB0yOL3vc1KI3970NeZ2DjlCfQDMH+B203uFSa0zG5n8ECE9lFL/ExA0ODCSFGtlisSGxdWH5K0fQVNhgYzAP08/EiWu1IAtqgBsCN0nsvTkwuTnLosOgCZXYSoo6c45DhN0NcIdK++j88dDQTFfbBH7fs/Zbjttnoki2oSHyGFxkQYNAAx2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bL5JcUEPrNL3jD3b2Q2Nz6H/Xp3turh7F3sXzjcWQ8c=;
 b=RUu7wsbrlSwd0z0EjhpfM7H9CDyEtcjJ1EabRvczOgaANIpiyAqmK59xmRvim21b7HPgfujaAGTumjb+H7np4wFyVp6YQftx1lyMQ/ZlZKt7e5VMKtrwVcLF+VkVYLf1nCwLRbFqYvMG5mzg8MxXG418uCqeHmK1sarjuyE8/5hZ+WVWQo3NT5sQ9RnubUy/WKX5tvW1rm5g5MRKrslFCm9/jNjRvEgl3FtoiWwf/rLaNxeDSybJuDqCg4P17AKsS6SKfR8L3KcdIninOSTE/yZuj5+7hm5aee3OuPLB15RNQYdjshyI+ZLaz/X+WszuW/vZiB9eIZReMxGEfSIZtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (52.135.90.161) by
 SA2PR11MB5036.namprd11.prod.outlook.com (20.182.117.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.13; Fri, 31 Dec 2021 02:18:49 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7%6]) with mapi id 15.20.4823.024; Fri, 31 Dec 2021
 02:18:49 +0000
Subject: Re: [OE-core] [V2][PATCH] rpm: fix CVE-2021-3521
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20211223061238.16986-1-changqing.li@windriver.com>
 <e6d34fc6a7dd35b26b1d9396081f417ac439fa24.camel@intel.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <e1cda44a-9c13-07b0-a643-9ec41ff9a1c9@windriver.com>
Date: Fri, 31 Dec 2021 10:18:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e6d34fc6a7dd35b26b1d9396081f417ac439fa24.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e98dc63-3b1b-4938-3aee-08d9cc03e193
X-MS-TrafficTypeDiagnostic: SA2PR11MB5036:EE_
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB503609C2012F68C7C8AB166F82469@SA2PR11MB5036.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XnI8paMtTleEN16ThkJDFqtWUJxATlPMKpNUgCeCNk5Ct3oKhg8RsKp8ehgOWe255Cf5MkbF+mEOAaWRxw7ub3Eyy0pdEWzoRncWN498sJ5chZ8odk6BWq13hYr9XcSnNd9USBZPpYW/1NnydA/C//uZcF84qEmh/nv93KIK788DM/Youc4cY0ujjLSfBBrDL0ySmwHWqYGE+bI+q0i8AUE+iDfhYSZw6PDEODIgu+CtmVac3WYN4+0xqYtqiJJUIvS9Q5UsyBhsZyhZdcdpiQ3mNH3cZyHVVPQhK/a9xINwAth3qaJ5GojOGop2geBoBqKQ+Oz9gPcWt1bMkVDgtRi9GAvlkD+rSg4JSTiIPtLi8SgvOa/oymAwROK8hHlN8GyqZ3Qh7QZZBGr1KkD6cnRCk4noPTiHRdksJc2p7Yfrsoimo4dJbp0H8qpBddewZu8W2GvMBLT9/DzNj+izqrSGFSnuzZmMMWTUQnvvB9RzcJnRSk9nfrDYpCLIt2rjLET2amEeOO3JYgvACdVjLcMsJSbsms9VMu2msuzrEnNNxcq6KXKqQzzRMPAeOLHfNiLcyJ4LJQJs2ND1hrQKrPAgiw/68GdjLor5FkHNLSivQ4H+nCwMF5cbFABRPjSfouudJ9ApE81IaCUUwX8/zsgPpbSqfd1OS1ue4R/3B5Izzpjouhrs1es2fw/qOReIH5Tcxn2RxtGXkfn9+ufX4kNMjCOhh0m1mWcflhqv48/3IFFUT6asgOQDsZjjpaTyTsQoP5uM4PTQ2anDtInzmA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(8936002)(38100700002)(36756003)(83380400001)(66556008)(6666004)(8676002)(508600001)(31696002)(6512007)(5660300002)(6486002)(186003)(4001150100001)(44832011)(38350700002)(6506007)(53546011)(26005)(316002)(31686004)(2616005)(110136005)(66946007)(2906002)(86362001)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bjFZWlhhZHRnaEtFSkRpQjBQQ2ZnWWxFTWVWSzN5SC9KWUZqT0RvNWpPUHFX?=
 =?utf-8?B?cWdVZVpaZ0R6dGwxeU1uQ2VjblpuanJVY3dvOUJFdnNRc1J2VllML2h6UlNE?=
 =?utf-8?B?RVoxK3JncnZNWi9yUTFmLzFBZ0VIQkJGUG4rQXFCZHhoT2FYZjJNUnFsMkpN?=
 =?utf-8?B?eVNpMkVXWmR6RGJZbGN5QlJtL0dpR3d0MTQ5ZFIyMm16UnlLYUkrQ0RNN3dL?=
 =?utf-8?B?Zlp4MGM1c0w0VnJFb0RabDdMbWMxdkpuTXVEb2xJb2R3UUk4WWk2VWdQNDdD?=
 =?utf-8?B?VjVjT21KaXFVWFpjTEg2eThXbFJGNUc0TG5RNlFRclBsNWNxL3ZLek1ldXI0?=
 =?utf-8?B?QjJmbE9NdzhBM0dwWm5yVTZObWxpVDkyL0RZRHY3ZkdmWVdaNUJlMlkrQVNr?=
 =?utf-8?B?Z2orT0FISUFCNE1WbHZ2b25leU9XZFNEQVVKWjUrZkoxRFNId3FRYis5QXdT?=
 =?utf-8?B?aHFYRThIc0JJZVFEbmdINTNiVVlrajVEYTRrNVl5dFN5WFZNalJLWXhaQU5a?=
 =?utf-8?B?ZTl4Q2VpeHd6cmhyNjEza1JGS2VHTlNyWDVhanViNysyclRlTVZ5K2o1T0pL?=
 =?utf-8?B?dDN2VDc0WTFMcTRyc051VGNRQ3BZVVlrQitHOUJUemZyUjJsM3VORVhKUzNR?=
 =?utf-8?B?ajZUS3pFV2lNREkyOXl1QWlvSVFwUEFwSGpJL2Z2REh6Q2krdzB4L1B2Nk5C?=
 =?utf-8?B?cUt0ay9uR0svSWRlNnh2TDd4WXBmbFZnUG1PMnlBY0NzeHk4ZDRSOG1PbHNr?=
 =?utf-8?B?NkhrTHY0eXl5R0t3Sld1dldocWhqRzhrRUtrL1VnTWhRZlBKSXY2Q1VDTGVt?=
 =?utf-8?B?TEhTT043Vnc3Q1FuOUQvcE9xZkZubmUzUTUyeHd6Z1lqOXczeWxsWUt0eHNl?=
 =?utf-8?B?TGQ1dzlEK2tFSnlXbGdvMDduYUVnQnZNbFNITkk1UlVUTmY3YUxDc3I3ZEZF?=
 =?utf-8?B?U2VraFRKK1Vab0tDYzc2d3hZVjNFWWN6dnR2bC9NSEpheUVqUDVXSnpYS2tI?=
 =?utf-8?B?aEhCRWJnNUdyQnZUQjVXU3VxZ1RhcWhrT1hGSUZIVkVEY0NPK2xoL2NueDVa?=
 =?utf-8?B?eFBKa2VMME50ZGgxUEd4UjQwQVl2NVZGYnFYNkRZMkMyUXM2eXlJYUdvMmhH?=
 =?utf-8?B?dXh1SEh0OWR3REpReVpxMWhRd2c3RitNNEc4OHd5eEh5WUYwZEVGSnZGNDZR?=
 =?utf-8?B?NFRtWTNld3NQakNnaVFtaVVqOWFESmtYTnJOMGpVNE9jeUNzNE9UT1Bkb1VV?=
 =?utf-8?B?S2U5dlZ4OE1VVFRCblZHOXg4Yk1td1krUG00NUc5RFNjVWt1MU81d1hHMG1h?=
 =?utf-8?B?UVJRcHR5TEdrbk55Ri8rNjhZTERmZFRLTjJrSjZtOEhtc3F2RVpsN1pQdnpN?=
 =?utf-8?B?NE1BWHVVSVFsbTcwbDlvdnpYTzVrNk9JaExEcEFNSDg5VW5nTUxZT3lpU2xl?=
 =?utf-8?B?R3djc3lTT1RmZWU0Mm84T1Yzb3NmbzQzZG4xY0xvWm5JclBZUEJDRVZERjhN?=
 =?utf-8?B?V2dkMjI5ZUJNSWxlKzZvZ25FTXBBc0oxdWJCLzFCVzMzN0xWcWczWUZ1M2gy?=
 =?utf-8?B?Y0hxRGk3TWlxb1ZURTZCMXU5UGZOT2dLV1V1bElsOW1BRTgvWTZOb1dCSlZE?=
 =?utf-8?B?MU1rT2VEd1ZYV0xvTmdNUWFiOXNYZnlWZjN6SHo2bXhFR0VWOHZtUWJJT1lV?=
 =?utf-8?B?eklLdGZDdlZyZG1yUFh4RXdUYzZUcFppdUFQYmN6aWJsMEt4V1BteXBWak9B?=
 =?utf-8?B?R0JzSkRZQ0xRcjNFM2NCeFh0a00xTnVkMzE4aDZBNmM3YU1UUXhmQnZ6cFh1?=
 =?utf-8?B?eDdiV2EzWk0rT24zZUZxZkdZUjBldHAzME9wd21YYzNRZVpsM3pyQitGckwr?=
 =?utf-8?B?a1AxQnYvYXc5Mk1YbE1wYjBnOTJockRkcU5KT2FlMk16d2gyNGs3cGlKVE85?=
 =?utf-8?B?di9vdjBFTDJweFI5USt1ek12aFBOTFJLTUJQYkFBWmpFWGFTYkhwejFnbXhZ?=
 =?utf-8?B?UXJwOHdzNWM0NWZwUlhHeERZYXBWTGdLK3Rua1Y0QlNjbERnbTFsem44VHNs?=
 =?utf-8?B?N3hkTGZuaGZsd0JIQ1ZJbzdQUkY5MUhLYzBSK2FoODh3M0N4OHB6ZUtJYXVU?=
 =?utf-8?B?c1Y1UllIQ2FEM3d4QyttL1l1a0UrVk9pdytabWw0NjlWcUx5WldWdlBaQXEr?=
 =?utf-8?B?bWhuRHhhQXJ5M2o1QXVnT1VkME83YW9XT21MY21wRFJtKzhlZ2tra3l1M3lo?=
 =?utf-8?B?RkxSWGU1QjUyT1BYc3czU2hqYVJ3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e98dc63-3b1b-4938-3aee-08d9cc03e193
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2021 02:18:49.2625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jWNnvd5aewCjHFFY2PpGiPz55Ou7dzeRjR5u0r9egQVMAfLTGU29YTXuGwlizn2IFliArJXmhyPJRmuKW+g7Sh5LySAVzHwk8WUhH7GiWWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
X-Proofpoint-ORIG-GUID: c6RzwA7XIUU2K1T2MkhYQ022Vbv2lGSz
X-Proofpoint-GUID: 8cwfwCEdnoyacU4Z9CWJU38v4zsRStXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-31_01,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112310010
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1BV1v2S7032767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 02:18:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160084


On 12/31/21 9:51 AM, Mittal, Anuj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Thu, 2021-12-23 at 14:12 +0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../rpm/files/0001-CVE-2021-3521.patch        |=C2=A0 57 +++
>>   .../rpm/files/0002-CVE-2021-3521.patch        |=C2=A0 64 ++++
>>   .../rpm/files/0003-CVE-2021-3521.patch        | 329
>> ++++++++++++++++++
>>   meta/recipes-devtools/rpm/rpm_4.17.0.bb       |=C2=A0=C2=A0 3 +
>>   4 files changed, 453 insertions(+)
>>   create mode 100644 meta/recipes-devtools/rpm/files/0001-CVE-2021-
>> 3521.patch
>>   create mode 100644 meta/recipes-devtools/rpm/files/0002-CVE-2021-
>> 3521.patch
>>   create mode 100644 meta/recipes-devtools/rpm/files/0003-CVE-2021-
>> 3521.patch
>>
>> diff --git a/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
>> b/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
>> new file mode 100644
>> index 0000000000..b374583017
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
>> @@ -0,0 +1,57 @@
>> +From 9a6871126f472feea057d5f803505ec8cc78f083 Mon Sep 17 00:00:00
>> 2001
>> +From: Panu Matilainen <pmatilai@redhat.com>
>> +Date: Thu, 30 Sep 2021 09:56:20 +0300
>> +Subject: [PATCH 1/3] Refactor pgpDigParams construction to helper
>> function
>> +
>> +No functional changes, just to reduce code duplication and needed by
>> +the following commits.
>> +
>> +CVE: CVE-2021-3521
>> +Upstream-Staus:
> Should be Upstream-Status. This is triggering build failures for
> master-next.

Sorry,=C2=A0 I will fix this and send a V3

> Thanks,
>
> Anuj

