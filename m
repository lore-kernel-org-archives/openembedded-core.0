Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B66C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 23:59:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.585.1642118387039520455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 15:59:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=RD8oNUd/;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=801232f56d=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20DM7WOK026830
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 23:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=0jskDiRCdMJlYz99Mme4nho7o8Il9SVpe3WkJ5bxYuk=;
 b=RD8oNUd/8YFX1iwrVQPZEjb0mSGcagzBtLk/eQnA70iZb36Gs/Re09RZoIyDyka8XyVZ
 Lzgs0tes1zAat68lTN7LRyfCPYegFLV2G1ut0fR1GYI47A3unt4iPcHfCR9v2zxQlI/Z
 tcGedzIuGBXnpVMDkiDvp0DjoDevLwBE0sAE9Gm+SVg6jhF/xboQCl35qdlCZ4Li/fyQ
 uAnm/+UE2loy8ZgdiXtfq1SX44raBmJhN341woHl1lKhVlH5YiYK64X9KJYgyM2+7Thr
 0UPXxrIzaGPfJCImfX79IE2w9M/Fh4pFnnHF9Igt8D0QCY68g26cqFOEhZqZmyTquyw0 SQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhtf01dkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 23:59:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnqC2UHfquybawd+fmqw56d1E3uJ3vnQu2Q61uEZTWS0ajW4x1MCOjWXix6oHhcL76bITAtG5RTpAC+to+KQBqClB4MGCs23UWK/RzlDAnXKMgUsQyo5uICKDObojUNcNqHevOQhg7/+8NEspteHrc1mKjutUQ0QGqpv4N9Z/mD4Mh98MsMj5nr+f9p6HkSyms7FgbmzgzLgMpJhfdhCgDb3sG815HkSvpKADxxVst+vvfKSZspee3sDrkDVa1a3r59IePX2KtxNfT25JDfn0EHXNkHTSMuSuc9RtqFWLUmJf5UnmCyVRAlwJNvq5vPf/LFnfBaYIvCcO6+8HG6lVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jskDiRCdMJlYz99Mme4nho7o8Il9SVpe3WkJ5bxYuk=;
 b=FDBiwezsBfcVYUr5mn8BsmknzQFyGJ5fjvryV8X4IAP9G4MRA8WS7N8n+wP56YgRqkv9XnJtjHbgZthTfBXG6cSHzm9flYbWEJWNAIpVey0zYF5klgXeQXJgF1LvsdKhXAqZe5ioL/fFDbIe0E0ZDpzNl/yj8eW/FyGyiKxBfWJBIQyMRcxQGQDm3V945RNIRxyUJyCZwf+9Bm+c5N4YCbx3JSrU9JzffR604cxiHzOFym5n2xkDIpHbMdoIed0hSLzCEY7bEPey5OlqslxvWOM6lSc2rrSxXqTeRJmzO8ldNb4HJx+SAwXnQj/owOC9tUmkesUd77eIL6YY0s43WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB3356.namprd11.prod.outlook.com (2603:10b6:5:58::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.10; Thu, 13 Jan 2022 23:59:42 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344%3]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 23:59:42 +0000
Subject: Re: [OE-core] [hardknott][PATCH 4/8] qemu: CVE-2021-3594
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <20220113233551.36855-1-sakib.sajal@windriver.com>
 <16C9F8B19CAEFD1C.24345@lists.openembedded.org>
Message-ID: <52aa1de7-20ed-566e-1a54-291bbf7db3cc@windriver.com>
Date: Thu, 13 Jan 2022 18:59:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16C9F8B19CAEFD1C.24345@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------82712E835A6B0A1AD8D514A3"
Content-Language: en-US
X-ClientProxiedBy: YQBPR0101CA0186.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::29) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 414c346a-8ef3-4a62-29ce-08d9d6f0c429
X-MS-TrafficTypeDiagnostic: DM6PR11MB3356:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3356E16FC73F38777FF89A5CF2539@DM6PR11MB3356.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bboDOYc3Y8HyW6xjfHVKpXqtIbMg1DLJN6v8OO2GzrQ7FpHxA60FsJBiMvGMYoReEI2SPw8FqM4ZEtNS8pYliyvNYiQlQSgaE9zMvt5yUVi9MJ362YxhpqUYRX25xlw/j4Y1HUnGAtQq0KNETq25QYJ8qPN3G/zL00/cldOF35JFBHgRU+lUSgOKWgv2J8QxL5PLUbZhsP68vzeVeUrwjqe6j21xaYEmYRVfgF8nloj1f1o7y5/YDGkDLqIoVC0LCOLC5G0FRPoYkM5eJRQaCbxhebyiGHJ6WGjwsTpYfQSXBSv7aY08VsEXHBlR8SiDafdLfA9SfaYfowUWNzk6/9qmHnJo1jcZKA2hAaoeFx/n4qy74LkRax+mWsuq90WNSCA3Upk04+yRXbIydll+roVllHFs3fgHDKjH4N9gFOX5AQtOcICVrJhAooTogzeYbflrFsgyyb0RuWl6HNSXg5ssFDbqxoMoB3lH1DGQEOuuFFrAPrKT1PT6hkZt/eL4oFv/jU8fq5AotZhFEVp5SArSJbpc3fnWQ2P4EJXbOxDEUcFBVWbSUmru9Cfgw+v/bHIoEqrLDuEc20m513JNG6nstjQrM0h/KJnpxvRtRicmWQcFyuQLakTMGfQjTylMaU/qvVE4YpL0Wfxa15GBDj4rW785IJY76Djd0cqVYD2tOb94lnkJWp9AKh+/wa2Q7sgfCLr6N2LWmOAnglbcnOO0Vehwvcbg+X9DjzksGHh54CK0nrW0ieiSuj8PxYYMY4zWM7CFHXp+7hypvyGs+mF4+eFce0+BqLLsiKLBekOP9ZEfpiNiiSh1sBKTl9K8LhaY+VY+ngbQe8XR1XPRbcLs+sNMWrxYBaQ9Ezl4j5o5VdLdRvnvHEeT9/bcAw2C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(6506007)(31686004)(38100700002)(83380400001)(53546011)(186003)(38350700002)(6916009)(6666004)(2616005)(26005)(36756003)(52116002)(33964004)(166002)(6512007)(2906002)(5660300002)(6486002)(66476007)(66946007)(316002)(508600001)(66556008)(8936002)(966005)(8676002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mlo4ZWg0eWhmZVVxQ2laR3pJN0FTTlJ3cVY5SUZUaUx0aC9IYzZQT2Q1ZERo?=
 =?utf-8?B?Z0hsSnlBRUEzR2hxNFRRUzlxMXVLR2VET2xPSG1LRjA3UytUUG1OU3ROYXVj?=
 =?utf-8?B?aG1tcFFwemZVWllGQ3JXOUl0ODNFQzJuNlIyc2FxeTVPckZpVUc1THVteXNH?=
 =?utf-8?B?dXgvSzNkZW9VZlI0L3JjbGx3RzJDOTd4cytWRDhwNTA4V3pMU3BSVGJqbzB3?=
 =?utf-8?B?ZlVUL0dZOTNlYTFONGxXMHRiVTI4cGpnRUhKQjcxNmd4ajlna29OSDBRRnJq?=
 =?utf-8?B?M1JLaThTOWh2TERuMExzaitjMzFGY1NyczlMOHVvU3NYNzV6RHdpdFI4Q1p0?=
 =?utf-8?B?YmFlZjFYQ3hiWjM0V1Jjcmh3SFFqd29zVDYyMGp0Y0JyQXZubnVjeFdmeFJa?=
 =?utf-8?B?cktsVFNPdFBPM3dlNmw4NVgxWjJmT2JrekM0UW5lSjY4b0pzWjhpRGlmT3h2?=
 =?utf-8?B?and6c2o4UU1NT3hrejVkZ09jVk1HRXFNNXdIaS9MWkwwd2MyNExYVXE0bkdn?=
 =?utf-8?B?Z2wxdVZzQTQyRVpHQnVvenpCYnNWNi9zMFFubmRhR3EwcEprTWQ1cUdGWGw5?=
 =?utf-8?B?UEhzNnZ0eHlhRFBKaUJDYVV4ZGR0MDArc2FsTXZ1WEZGWkJiV2lQZUkxNVE0?=
 =?utf-8?B?Qmx4cDJGZTZXWStVTGJ4MitqTGh0NHNQU1NNZk5aQjAvbFRWamFnZWQ3M3ZP?=
 =?utf-8?B?VTVJVlpDdnZrTzhHNzV4OW5Wdkl2eHJHTVR6RTJkdEZDUkV5bzNoMWFyNWFK?=
 =?utf-8?B?WlEreGhvY1dFU1ljd0NjK0FaaXdMdmZnbldXbTFBRXdxVUxpcHRvbnBuS0U0?=
 =?utf-8?B?U1BvWTJOaDNPY0dUSTRrb0hzSFBIN1VPRVk2cHlzcmJyNk84dE9lZjFYMy81?=
 =?utf-8?B?a0hWRkk0SDVSL3J6YjRJclRlQ2tVcThFQWNuOFJ6ZVB4dGxkcjdpTloxRHRo?=
 =?utf-8?B?YVdNM0JUUXdRYmZidnM2Rncrbm9zcHZGUVdhRi9adWZ5aytVQWNNS08zQXBu?=
 =?utf-8?B?M1JlUjJJK2tyWTJHRCthdytabkhlVE8raDhxOHoxZHFEVy95Sm1PUWFQdElp?=
 =?utf-8?B?Qmc5OXhyK0tYbXI4ajVWaFZNNTEwbjBjalRUazROdnI5bzN0NzJqbWJNQXBV?=
 =?utf-8?B?KytwYUFEd0kwdmp6SDRuZFhpbjYvaWpJKzJYdWlOOWhQUGE1ekM4eU50ODNE?=
 =?utf-8?B?Yk1RL2dnZEhUZENxbkdpZUlPMnU5UlJSNkRBcUdoMW5Jc282T3lrSElMZWNH?=
 =?utf-8?B?VjV3L2QxOTNrdHhzajlrV0cvTnByMXJmaUlWSHJYZmZKZGtqYTBTeFhQUWRQ?=
 =?utf-8?B?MVVBWnIwSTdRa3l2RnZwK1ZnazVrTFgrUHUwSncrbG1LdjRjYWhMc1F4UXhE?=
 =?utf-8?B?VUtyRlBxb04wSmlPbGNiRGtQczV3aWFaMDM4M2lZYWdaTUVkQ0I3OVBRME9G?=
 =?utf-8?B?NE1aaHMwVnU1OUFxNTd0MURvTXZWWmJ6MFlGN0FCMmllN3pSMS9Pd1loNjYz?=
 =?utf-8?B?cWR3RDQreS9ITjlDMU9yMUNCaFZHVCtCdTBEUDVFU1kyNGFSeGhDRitEeUNs?=
 =?utf-8?B?WWxCVXRWRGMxOEhSeElORHd4ckFTU3JpemhSSSt0YjhNbjdoSTNjM1hxdFR5?=
 =?utf-8?B?c1h6Vi9PZUVvaHVzYVpPa0JWb0dJSDVzNUw0Zk92K2FmOGF2MnM4OWhKVTJz?=
 =?utf-8?B?ODNNd3BoTjEyU2dYajJFQWFyYU0wRFVSZzcxSnBkd05TV0p0b1lHSzZ1Mmww?=
 =?utf-8?B?blRVZHMwUWFxS1oxMktYVjJlQmw4d1dKdUlsQ2xtL254M2RVSmFGQm93ancz?=
 =?utf-8?B?RitxMS9BVXlnWk5saU41dzZoVjZPMWhoVXpsNEdLbjAvcm43SnRmRExYYlFi?=
 =?utf-8?B?TTRzeHdMU3ppWmVFbzdSZHFwVTFWcnZVRGQrNnpMMUowQjhUU2NLdUJPU3N6?=
 =?utf-8?B?bHdadWFwb0dUSFBiaUp1RzA0ZDJaSHowT2JaZjVSd1FjK2F5U0ZnTjQwNVJQ?=
 =?utf-8?B?aXViY01RNlMzRDVhYUp5emxDSnp3TXNhNlNKOGpLSnBjTjI2N1VNUmo0Wi9J?=
 =?utf-8?B?UldjWHpCM1Y5U3hiRkh2MUZpMHNTWE9BUmFWdXpBclFadmdpdGVxejh2OTVN?=
 =?utf-8?B?cFplQ3pTOVZDYnIyNVUxb1picGdsWk4zck9YZ2tNVVdjdERBN3loK2VEczdy?=
 =?utf-8?B?bUR0WTFnUWc1MW84TC9sZ3ZMcE1sSVYrMzAvbTdJQlhNUGVDUnkrUjBtWnNX?=
 =?utf-8?Q?babROJcpFhOGWhQJ0WXW0YM9iwGq6/6siihvR4/2IE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 414c346a-8ef3-4a62-29ce-08d9d6f0c429
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 23:59:42.5068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5sg1sJypDqyZjN36/W3WB7CtLMLsyd47zFcnISWly3/hlSZVcHl0J8IWzyuihPWclfO+cL7s69Oj4kKh+Ol95VcO/0XfgO/2clzHB4+vNUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3356
X-Proofpoint-ORIG-GUID: u0xL3yJZ3G1L8-3mPwT13tbLz2DgTvT0
X-Proofpoint-GUID: u0xL3yJZ3G1L8-3mPwT13tbLz2DgTvT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_10,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201130143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 23:59:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160546

--------------82712E835A6B0A1AD8D514A3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20DM7WOK026830

Please disregard this set of patches, somehow it failed to send the=20
first 3. sending a V2.

Sorry for inconvenience

On 2022-01-13 6:35 p.m., Sakib Sajal wrote:
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>   .../qemu/qemu/CVE-2021-3594.patch             | 40 ++++++++++++++++++=
+
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patc=
h
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> index 811bdff426..4198d3a52c 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -76,6 +76,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
>              file://CVE-2021-3593.patch \
>              file://CVE-2021-3595_1.patch \
>              file://CVE-2021-3595_2.patch \
> +           file://CVE-2021-3594.patch \
>              "
>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  =20
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3594.patch
> new file mode 100644
> index 0000000000..ec2a254c7d
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch
> @@ -0,0 +1,40 @@
> +From 7a5ffd5475f2cbfe3cf91d9584893f1a4b3b4dff Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau=
@redhat.com>
> +Date: Fri, 4 Jun 2021 16:40:23 +0400
> +Subject: [PATCH 07/12] udp: check upd_input buffer size
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes: CVE-2021-3594
> +Fixes: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/47
> +
> +Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2021-3594
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + slirp/src/udp.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/slirp/src/udp.c b/slirp/src/udp.c
> +index 0ad44d7c0..18b4acdfa 100644
> +--- a/slirp/src/udp.c
> ++++ b/slirp/src/udp.c
> +@@ -93,7 +93,10 @@ void udp_input(register struct mbuf *m, int iphlen)
> +     /*
> +      * Get IP and UDP header together in first mbuf.
> +      */
> +-    ip =3D mtod(m, struct ip *);
> ++    ip =3D mtod_check(m, iphlen + sizeof(struct udphdr));
> ++    if (ip =3D=3D NULL) {
> ++        goto bad;
> ++    }
> +     uh =3D (struct udphdr *)((char *)ip + iphlen);
> +
> +     /*
> +--
> +2.31.1
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160544): https://lists.openembedded.org/g/openembed=
ded-core/message/160544
> Mute This Topic: https://lists.openembedded.org/mt/88409940/4422444
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
sakib.sajal@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------82712E835A6B0A1AD8D514A3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20DM7WOK026830

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Please disregard this set of patches, somehow it failed to send
      the first 3. sending a V2.</p>
    <p>Sorry for inconvenience<br>
    </p>
    <div class=3D"moz-cite-prefix">On 2022-01-13 6:35 p.m., Sakib Sajal
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:16C9F8B19CAEFD1C.24345@lists.op=
enembedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Sakib Sajal <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sakib.sajal@windriver.co=
m">&lt;sakib.sajal@windriver.com&gt;</a>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3594.patch             | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 811bdff426..4198d3a52c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -76,6 +76,7 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
https://download.qemu.org/${BPN}-${PV}.tar.xz\file://CVE-2021-3593.patch\=
file://CVE-2021-3595_1.patch\file://CVE-2021-3595_2.patch\+file://CVE-202=
1-3594.patch\">&quot;https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3593.patch \
            file://CVE-2021-3595_1.patch \
            file://CVE-2021-3595_2.patch \
+           file://CVE-2021-3594.patch \
            &quot;</a>
 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quo=
t;
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3594.patch
new file mode 100644
index 0000000000..ec2a254c7d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch
@@ -0,0 +1,40 @@
+From 7a5ffd5475f2cbfe3cf91d9584893f1a4b3b4dff Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <a class=3D"moz-txt=
-link-rfc2396E" href=3D"mailto:marcandre.lureau@redhat.com">&lt;marcandre=
.lureau@redhat.com&gt;</a>
+Date: Fri, 4 Jun 2021 16:40:23 +0400
+Subject: [PATCH 07/12] udp: check upd_input buffer size
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: CVE-2021-3594
+Fixes: <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedes=
ktop.org/slirp/libslirp/-/issues/47">https://gitlab.freedesktop.org/slirp=
/libslirp/-/issues/47</a>
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:marcandre.lureau@redhat.com">&lt;marcandre.lureau@redhat.=
com&gt;</a>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3594
+
+Signed-off-by: Sakib Sajal <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
+---
+ slirp/src/udp.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/slirp/src/udp.c b/slirp/src/udp.c
+index 0ad44d7c0..18b4acdfa 100644
+--- a/slirp/src/udp.c
++++ b/slirp/src/udp.c
+@@ -93,7 +93,10 @@ void udp_input(register struct mbuf *m, int iphlen)
+     /*
+      * Get IP and UDP header together in first mbuf.
+      */
+-    ip =3D mtod(m, struct ip *);
++    ip =3D mtod_check(m, iphlen + sizeof(struct udphdr));
++    if (ip =3D=3D NULL) {
++        goto bad;
++    }
+     uh =3D (struct udphdr *)((char *)ip + iphlen);
+=20
+     /*
+--=20
+2.31.1
+
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#160544): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/160544">https:/=
/lists.openembedded.org/g/openembedded-core/message/160544</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/88409940/4422444">https://lists.openembedded.org/mt/=
88409940/4422444</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------82712E835A6B0A1AD8D514A3--

