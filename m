Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F9FECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 15:49:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38659.1661528951266092734
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 08:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=VKQiD72Q;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5237bd7a43=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27QAv61j028200
	for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 08:49:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=UjgtBGbgf70GWOvV/lWVlBz89eV4CMvi0zHHzACrxTw=;
 b=VKQiD72Qrow1PZVgaF4VWS2CqGOik29uLu2wVXA2zpqyLz9kfyqBXVgYFDX/hESzcCUX
 kXBBo9F73HazXewU77Wha4Zz6kA89rRrqiHy4YEf1/afHBtizZ5fhLK+OFuCqfxUN3I4
 jamIfWZT/Bx9bcVU+XQn+/a+1RKfzsJiJeKNNi+QIi0gZWD+Zlll9+0AFfjLhTHoOfiV
 KzdMh+j3xz5eZ5gnJxj0wXH2sUbbxfaNTvMbeVdeDTtrq5GPPnhKAp8U9NiML9DJoEbF
 CMNd6kI6vEU/IQkz1AdyuJWxSxf13imDOsgYtCD924GZEFkbh4fBs6OmuKG6BlCUqRIp 5g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53rvavvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 08:49:10 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27QFhFoM030716
	for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 08:49:10 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53rvavve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Aug 2022 08:49:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k176QmokZ6GnOpKmgP3tOJwcBjuG0PLE1LLCs1QOrJrUUeE8VBv6Y997nGjQSeLJfLCQcdacAB56IVJtCSrQH6K4Nyhh75vW4uwXIf8iHL5x+PMQSb+5+swzEqI0F3Psug8xeyMHXnBOn+bVNS8CJSwZHBBEqXFPqh2Qvn7x7+V7lMZC4JSLQ/xYmTqlyosygmdmXrcS6vPMu19rbgld3+bVmZtWRNLXTmGsLXioGtlYBPFjRf188BzSJju+tcEbnrqsDHFSM7NPC6h8jdpIjaR8ndrnMph17CTZGuoJCIpv1Trw3oI0TS4kkUqKNp1jTwhTe9UbyLUz0dHxgl3/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjgtBGbgf70GWOvV/lWVlBz89eV4CMvi0zHHzACrxTw=;
 b=FjjTePxXhPzO4Gdql+6+d1zKv9RXN1TUwOyN92uOhVSGHsjq2Mix4hzabCzNiO5csyU2fPLHTQi3Au4mWoBvnLmtR0LhjFNgbGdDjNwr8hh6PnYQH+ei1PJJhUy+spbgjH1c2hSLhTC+trOwE6Tr+iVuDTdm5QpaThw8PoRw3mGm9XBlhBRKVjCRxmiaQiLn+zk3Te9diyrumhDEpsmU+9kd+61GWhDYRgGFjk0nO+hrmXrezCeL8IrtYlduARiiPm8islY9LlTT842/YSz4f89Fu5KLeaBYfbqDiCi98fPCT40Zy/Kct9e2Dy+NVOsb2AgHXdaw3t2m13n7Iuqfyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Fri, 26 Aug
 2022 15:49:06 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5546.022; Fri, 26 Aug 2022
 15:49:06 +0000
Message-ID: <d605cd95-6f6b-a013-4568-72c0a8589617@windriver.com>
Date: Fri, 26 Aug 2022 11:49:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [RFC] Rust Oe-Selftest implementation
Content-Language: en-CA
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
        vinay.m.engg@gmail.com
References: <20220826093747.1879722-1-pgowda.cve@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220826093747.1879722-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa3ba713-0706-49c0-62c1-08da877a81f2
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9wthJET26ITyxy93RDxVUivW7jNi1JwXywEhLYoRASuhGOJgkavUnDcCAGMVVICP6huTLUGbt+J1ibu1zIJUKhwJ0gtZbZBn1j7xDn+r587PIsZq60x+/tOqpp6kLlpX+hhnwPR7t05QiqfGDSuKLQrx07ZdI3oN8/iBkEZy/+9NAemZCc179QcCHO7yhRRsioTyIw33kC12RHdUzhPqMpO96uWmcsXLFazplhqXjDqI/Q7N4i14H8IwTpKAE4jnZAer/tlYcVgpnWZdmnvHnnBzaoWiPmg9W25M5cMQgR/sD5m9wLSTaaJICGO658RdVyUznAXjnlafGcCuoYrvm829jA3CIoiJ7Lug98V43Z4ayobQ+c9g3kf4gzcenXDN6yzSSVaEUUbYluIUslu65jnXrJwwxsdDkh7Oqz8y/+IxYLQK38TCxUDQVrX6E7RtWNNy9NyQj6JiHQaPXXsgWKtXJgyWINdl3S0OjH2eWlmr3YvnI5OLa1+PsUGjydf7UszbZwGmDRYFkUrH4zxamBP2CxUKQnssr7pYgEI8Z7pT2gNWWAFcCvEaPPD7T68JlEBzkz0cWNFgT0qAZ2T8VDbZtzs1B1dQafG75vfP3s72XCDIBZOyud9L5faIfCw2YntXAuOPIuNM72HUWJH9X35Juj5xRrymQ4uKbwPZ0kv52K1pCNhP1VF00bspRowYL4w40vMJYymM2DmwTMVWPwa4LKUDn7PFYw30Z0Q1xLhypjFj7e/UJgN6EoQlt95B/gczpOi2mzH+o1XBS3afGekUObPmyMhXdiXY/uWN/nGI44muiUgeHfPwvVY4U1w6k8oU94Dug3rNzIC8vmbbTPaqXGln6PyLTvaqlq8pOpMoaBa5NRufkXuKmCdUaxsUeOBjrXtngUeJzN/TDLEk7A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(396003)(39850400004)(136003)(186003)(83380400001)(5660300002)(2616005)(8936002)(8676002)(66476007)(66556008)(66946007)(4326008)(41300700001)(6506007)(6666004)(30864003)(2906002)(31686004)(36756003)(478600001)(26005)(52116002)(53546011)(966005)(6486002)(6512007)(86362001)(31696002)(316002)(38100700002)(38350700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGJRZE9hQTBoWGZWUWVIalRLZVZGc1BmQTUvSnFaWCtXZmRmazdCdk5NWlFr?=
 =?utf-8?B?WUtNVndWNXFPdkhQY0NqcnRnRWNNS0ZtQTFpc01Eb2x6QzRmdDlQTWFmd2hq?=
 =?utf-8?B?VVUrU1FVbHpXMkE5U1hWVUEzRHlpSUdJRUxDaHlLZDhPSis1RStsTEtkNUZi?=
 =?utf-8?B?TWdqeEJ6bEQvQkVsbVMzRlFZN3dWd2c2ZDMvLzdnNWdFMDNqZGFtZUwrNGNV?=
 =?utf-8?B?TDNHdGltK0dXSHl1eUhCc1ZoeGhhSDRPR1hpKzVVbURFWHRCUXlPS2Q0WjFt?=
 =?utf-8?B?QXdQSFNGQjdkWHhhSENkMU02N3EraHFrZ2Y3RXFTNVhScVN1bkJMeXVJN01M?=
 =?utf-8?B?UHlFcVptZXRmcTBXM1Q5MFdmVGJhMzAyM1Rsc201KzJTcEl4Q2dWdElGTnN5?=
 =?utf-8?B?eWVMeVFiMlpoVXVBc1RVL3IydDJLZEkrNVE0eWtVUlp1OTAxMHBxS3dDenBZ?=
 =?utf-8?B?eWlwNll1d1lkSjI4MnhLeEtxN2tCMXdnL2lUYjhUazZLMEljT1g4aXI1TkNI?=
 =?utf-8?B?aVBVSFFkYW16S1ptdk9zSTZpaWZrTm5jNG5MU3gxQ3FpMU1EMThDMjRJbEJ2?=
 =?utf-8?B?KzB0VzU5U04xOEFIVWtDRHF1ekd6L0pLY085T3RZYldHbGtoR0VQeHFRa1RE?=
 =?utf-8?B?UHJ4U2Y2VDFvQ0hvd0xscDhXcmNzeGFmVnFEN2RVWVpVRGpSeGNVQ1lwUU5v?=
 =?utf-8?B?d0RrbHd5N1hSeXFDNjhPWDJ4QXY0NS9FSDhCOGl0NGlpcit5c2lrcmVDKzEw?=
 =?utf-8?B?cnFjUFg2akpqK2xyak9FTW5XMkpreVlKOGhTUUp0bkxMdUFwL2NMMTNzc1BT?=
 =?utf-8?B?WHRRRjRDVFlMSjYrZlZ5VzNzWSs2Y3ZjYzZPTndtZ005REtnY2l2STA3YjUw?=
 =?utf-8?B?ZmNXQVU5VDArc1huMW1wd09NQWczbU45VGZiQ0Q5eHlNemYrdGVmUU9LU1dQ?=
 =?utf-8?B?VVFndFBEaGt2RE9QZDBQMkdoYXcvUHFlZDV0blhraTdOcXp1T2J4WDlQTlNT?=
 =?utf-8?B?UmdjR1VIaHR2b0lEcnV0K0IrcEU2L2tZYTZ1Qk1wU1daeXNrKzlLdlY5UWt4?=
 =?utf-8?B?eEdYeVY0M3BFUkpkMXBETjZaMzY4Ky9UZmMrZXMxVWcxRnhGTjkxa2FnZVFO?=
 =?utf-8?B?VVVDQzdOam82T3dERVdodThiZm5Dd0JrMU5Jb0t6THhEYVJ2T3gyV2p3SmpC?=
 =?utf-8?B?dWU0QmY5VzJvSkU2b3dOdldUbnMrb1QyODRuY285V0RnWTdYbm5vWTFRS29E?=
 =?utf-8?B?MkFsRExuamNxRy9keXF6UWUrVEVaREc0d0RndTZyb1RlQWV5V1BtemJyTUhB?=
 =?utf-8?B?MmZKOTE3TVZHSEVha2pEcnI5MHNtcmZuakwxTnBmU01SUlVod1k4dTZRYjRz?=
 =?utf-8?B?QmdnNkIwdmxna3FZSkFjOENHNWJvY2sxcFhtbisvWW5hWU1ZdjJSN3E5QzVS?=
 =?utf-8?B?WXhlU2RqMTBhTjNVWUcweEZHbHcyaHVVbzFvTzcxWm1aem9UTW00cnUyV1JH?=
 =?utf-8?B?Qk00OXdoZmdjckh0RC9ZQWJqWitPN0U5Q3JzVi9UeUFialBUYk5PSncrU2xy?=
 =?utf-8?B?ckRZRVdpQzFvMTY4TzBCeTJEN2hkMDRQa0dQUnlaL29Ja28wSGg3VUFJVWJm?=
 =?utf-8?B?VW5wc0lJRlFQYjZVYlYzcGdDQ2cvcFhMQUU1akhFVjljMlRjNEhieWlzZWdC?=
 =?utf-8?B?RmZNVTJwbmFPT1NVYUYvVFBpWEJqSGFrZHpUK1FoVFVmN3QrekFJa05LWG16?=
 =?utf-8?B?dWoxcksyKzNERFZ0WEQwaUIvODUyWHZvOE9rRzhBMUpEYUErSG9MWEhpNkNx?=
 =?utf-8?B?UWE2V0txNW5DOUk1TU9YdGJDcnJvTERPcXQ2cGpudmlvTmovZHB4T0JFVlcw?=
 =?utf-8?B?bTRMSWhWcll1WUczYmNHZUxWOWplTERNV1daaG56TERlOXQ2TFFRSlJZYW9M?=
 =?utf-8?B?TmpNUUkyWUZreHVNcXllVEhyRjBadXEveFk3RHQrNW9hYlUvMU1IN3ZzMnZF?=
 =?utf-8?B?b2o0SXMvRzVvMFdvVTVGc2xKeGdQSTNGcWdZbHB4VmJCajJlLzBlamxSR0Qw?=
 =?utf-8?B?VFF4QXBiUWZkOC9mU2E2VWVWTHNJRjhXWXd5VG9WMTNoYWNzWTd4TVFNUmZt?=
 =?utf-8?B?ZzdyMk9yRmZyRGpHSC9iUnZ1eUtyMGpQSzNtNGw3ejM0SXc4ZE5GL2VuWmVG?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa3ba713-0706-49c0-62c1-08da877a81f2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 15:49:06.6783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ySuWv2zOp72sreSYWu94gwdvg4Vm5ABrm8im2iad6BwA1cnFgCOgqGN72X0OaAlpvv/Xm4nWou6iuyjFD6Aj34hsG4dF0/a0RxFc+rVQz7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6139
X-Proofpoint-ORIG-GUID: ZzhYfbhyXfE-nINVsY9DAnS7Q0uwTDLr
X-Proofpoint-GUID: cq4ApOkuhIxvwwm2rW9cIJeqnT6cskyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_08,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208260064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27QAv61j028200
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 15:49:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169924

Naveen,

Thanks for submitting this as an RFC as I requested.

I've made some comments below but I think we're mostly looking for
feedback from Richard and others who are interested.

On 2022-08-26 05:37, Pgowda wrote:
> From: pgowda <pgowda.cve@gmail.com>


There are lots of whitespace warnings when I apply this patch.
I'm working with Naveen offline to help reduce/eliminate them.

>
> Implemented Rust Oe-Selftest on the latest Rust sources with
> modifications. Rust testsuite will be merged with Rust to avoid
> duplication. rust-testsuite.inc modifications will be merged into
> rust.inc file. There were errors encountered during the rust-testsuite
> build which are fixed. However, there is a linker error as follows whic=
h
> if fixed would run the testsuite successfully.
> Please consider the current patch for review and let us know if any
> modifications are required for the final draft of the patch.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    Compiling rustc-main v0.0.0 (tmp/work/core2-64-poky-linux/rust-tests=
uite/1.62.1-r0/rustc-1.62.1-src/compiler/rustc)
> error: linking with `tmp/work/core2-64-poky-linux/rust-testsuite/1.62.1=
-r0/wrapper/target-rust-cc` failed: exit status: 1
>
> rustc-1.62.1-src/build/x86_64-unknown-linux-gnu/stage1-rustc/x86_64-pok=
y-linux-gnu/release/deps/librustc_driver-b7e5da8186904a15.so: undefined r=
eference to `compressBound'
>            collect2: error: ld returned 1 exit status
>
>    =3D help: some `extern` functions couldn't be found; some native lib=
raries may need to be installed or have their path specified
>    =3D note: use the `-l` flag to specify native libraries to link
>    =3D note: use the `cargo:rustc-link-lib` directive to specify the na=
tive libraries to link with Cargo (see https://doc.rust-lang.org/cargo/re=
ference/build-scripts.html#cargorustc-link-libkindname)
>
> error: could not compile `rustc-main` due to previous error
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>   meta/classes-recipe/rust-common.bbclass       |   2 +
>   .../classes-recipe/rust-target-config.bbclass |   1 -
>   meta/lib/oeqa/selftest/cases/rust.py          |  58 +++
>   meta/recipes-devtools/rust/rust-testsuite.inc | 174 +++++++
>   .../rust-testsuite/rust-oe-selftest.patch     | 444 +++++++++++++++++=
+
>   .../rust/rust-testsuite_1.62.1.bb             |   3 +
>   6 files changed, 681 insertions(+), 1 deletion(-)
>   create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>   create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
>   create mode 100644 meta/recipes-devtools/rust/rust-testsuite/rust-oe-=
selftest.patch
>   create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.62.1.b=
b
>
> diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-rec=
ipe/rust-common.bbclass
> index 93bf6c8be6..7b1b818a04 100644
> --- a/meta/classes-recipe/rust-common.bbclass
> +++ b/meta/classes-recipe/rust-common.bbclass
> @@ -57,6 +57,8 @@ def rust_base_triple(d, thing):
>       bpn =3D d.getVar('BPN')
>       if thing =3D=3D "BUILD" and bpn in ["rust"]:
>           return arch + "-unknown-linux-gnu"
> +    if thing =3D=3D "BUILD" and bpn in ["rust-testsuite"]:
> +        return arch + "-unknown-linux-gnu"
>  =20
>       vendor =3D d.getVar('{}_VENDOR'.format(thing))
>  =20
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/clas=
ses-recipe/rust-target-config.bbclass
> index 3405086402..e30eaa1da3 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -362,7 +362,6 @@ def rust_gen_target(d, thing, wd, arch):
>       tspec['linker-is-gnu'] =3D True
>       tspec['linker-flavor'] =3D "gcc"
>       tspec['has-rpath'] =3D True
> -    tspec['has-elf-tls'] =3D True


You seem to have pulled this in from master-next:

$ git log --oneline master-next ^master| rg rust
56866d0f54 rust-target-config: Fix qemuppc target cpu option
5410b72c19 rust-target-config: Drop has-elf-tls option <-----------------=
--
8bb74a9c93 rust: Fix crossbeam-utils for arches without atomics
59a6179d26 Revert "oeqa/sdk: extend rust test to also use a build script"
a280194bfb oeqa/sdk: extend rust test to also use a build script
3370fc4f9f packagegroup-rust-cross-canadian: add native compiler=20
environment
cce5b649ee rust: Fix build failure on riscv32
b1fbe932a3 rust: update from 1.62.1 to 1.63.0

You may not know but we do hope to merge the rust-1.63 update that is in=20
master-next
to master early next week so please rebase onto master-next.

>       tspec['position-independent-executables'] =3D True
>       tspec['panic-strategy'] =3D d.getVar("RUST_PANIC_STRATEGY")
>  =20
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selft=
est/cases/rust.py
> new file mode 100644
> index 0000000000..64134a91cd
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: MIT
> +import os
> +import subprocess
> +from oeqa.core.decorator import OETestTag
> +from oeqa.core.case import OEPTestResultTestCase
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_va=
rs, runqemu, Command
> +from oeqa.utils.sshcontrol import SSHControl
> +
> +# Total time taken for testing is of about 2hr 20min, with PARALLEL_MA=
KE set to 40 number of jobs.
s/set to 40 number of jobs/set to 40 jobs/
> +class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
> +
> +	def run_check_emulated(self, *args, **kwargs):
> +		# build remote-test-server before image build
> +		recipe =3D "rust-testsuite"
> +		bitbake("{} -c compile".format(recipe))
> +		builddir =3D get_bb_var("B", "rust-testsuite")
> +		# build core-image-minimal with required packages
> +		default_installed_packages =3D ["libgcc", "libstdc++", "libatomic", =
"libgomp"]
> +		features =3D []
> +		features.append('IMAGE_FEATURES +=3D "ssh-server-openssh"')
> +		features.append('CORE_IMAGE_EXTRA_INSTALL +=3D "{0}"'.format(" ".joi=
n(default_installed_packages)))
> +		self.write_config("\n".join(features))
> +		bitbake("core-image-minimal")
> +		# wrap the execution with a qemu instance
> +		with runqemu("core-image-minimal", runqemuparams =3D "nographic", qe=
muparams =3D "-m 512") as qemu:

Add a comment to indicate why you picked '-m 512'. ie. is it based on tes=
ts
that show that 256 isn't enough and you picked the next power of 2 or=20
are you
using the same value as other test code?


> +			# Copy remote-test-server to image through scp
> +			ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=3D"roo=
t")
> +			ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage1=
-tools-bin/remote-test-server","~/")
> +			# Execute remote-test-server on image through background ssh
> +			command =3D '~/remote-test-server -v remote'
> +			sshrun=3Dsubprocess.Popen(("ssh", '-o',  'UserKnownHostsFile=3D/dev=
/null', '-o',  'StrictHostKeyChecking=3Dno', '-f', "root@%s" % qemu.ip, c=
ommand),
> +                                shell=3DFalse,
> +                                stdout=3Dsubprocess.PIPE,
> +                                stderr=3Dsubprocess.PIPE)
> +			# Get the values of variables.
> +			tcpath =3D get_bb_var("TARGET_SYS", "rust-testsuite")
> +			targetsys =3D get_bb_var("RUST_TARGET_SYS", "rust-testsuite")
> +			rustlibpath =3D get_bb_var("WORKDIR", "rust-testsuite")
> +			tmpdir =3D get_bb_var("TMPDIR", "rust-testsuite")
> +
> +			# Exclude the test folders that error out while building
> +			# Need to fix these errors and include them for testing
s/Need to fix/TODO: Fix/=C2=A0 Perhaps create a bug in buzilla to track t=
hat=20
an mention it here.
> +			testargs =3D "--exclude src/test/rustdoc --exclude src/test/rustdoc=
-json  --exclude src/test/run-make-fulldeps --exclude src/tools/tidy --ex=
clude src/tools/rustdoc-themes --exclude src/rustdoc-json-types --exclude=
 src/librustdoc --exclude src/doc/unstable-book --exclude src/doc/rustdoc=
 --exclude src/doc/rustc --exclude library/panic_abort --exclude library/=
panic_unwind --exclude src/test/rustdoc --no-doc --no-fail-fast --bless"

all these exclusions make sense based on your comment above.
--no-doc is probably fine.

--no-fail-fast presumably allows all the tests to run even if an earlier=20
one fails.

--bless was a mystery so I looked it up and you should add a comment to=20
help readers:

---

commit 37dee69dacb0fc199d52d9baba3a3caf3018958a
Author: Oliver Scherer <oliver.schneider@kit.edu>
Date:=C2=A0=C2=A0 Wed May 16 11:18:19 2018

 =C2=A0=C2=A0=C2=A0 Add `bless` x.py subcommand for easy ui test replacem=
ent

...
+++ b/src/bootstrap/builder.rs
@@ -311,6 +311,8 @@ fn pathset_for_path(&self, path: &Path) ->=20
Option<&PathSet> {
 =C2=A0pub enum Kind {
 =C2=A0=C2=A0=C2=A0=C2=A0 Build,
 =C2=A0=C2=A0=C2=A0=C2=A0 Check,
+=C2=A0=C2=A0=C2=A0 /// Run tests and replace any failing tests' output f=
iles=20
(stderr/stout) with the correct ones
+=C2=A0=C2=A0=C2=A0 Bless,


> +
> +			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttool=
s.
> +			cmd =3D " export PATH=3D%s/recipe-sysroot-native/usr/bin:$PATH;" % =
rustlibpath
> +			cmd =3D cmd + " export PATH=3D%s/recipe-sysroot-native/usr/bin/%s:%=
s/hosttools:$PATH;" % (rustlibpath, tcpath, tmpdir)
> +			cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rust-targets;" % rustl=
ibpath
> +			# Trigger testing.
> +			cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";" % qemu.ip
> +			cmd =3D cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s =
--target %s ;" % (builddir, testargs, targetsys)
> +			result =3D runCmd(cmd)
> +
> +@OETestTag("toolchain-system")
> +class RustSelfTestSystemEmulated(RustSelfTestBase):
> +	def test_rust(self):
> +		self.run_check_emulated("rust")
> diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recip=
es-devtools/rust/rust-testsuite.inc
> new file mode 100644
> index 0000000000..17adfd8b81
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite.inc
> @@ -0,0 +1,174 @@
> +SUMMARY =3D "Rust testing"

s/Rust testing/Rust test suite/

( Googling suggests that it's not 'testsuite' but 'test suite' ;-) )


> +HOMEPAGE =3D "https://rustc-dev-guide.rust-lang.org/tests/intro.html"
Useful!
> +SECTION =3D "test"
> +LICENSE =3D "MIT | Apache-2.0"
> +
> +SRC_URI +=3D "file://rust-oe-selftest.patch;striplevel=3D1"
> +
> +inherit rust
> +inherit cargo_common
> +
> +DEPENDS +=3D "file-native zlib"
> +EXCLUDE_FROM_WORLD =3D "1"
> +
> +S =3D "${RUSTSRC}"
> +CCLD:append =3D " -lz"
Add a comment above, explaining why you need that.
> +
> +# This should be removed as the path is already set in rust-target-con=
fig.bbclass to rust-targets
> +# Path of target specification file "target-poky-linux.json"
> +# export RUST_TARGET_PATH=3D"${STAGING_LIBDIR_NATIVE}/rustlib"
Remove the three lines above if they are not longer useful.
Ah, I see that you had that export in an older version.
This sort of change should be summarized in the summary
at the top of the patch (that's missing). This summary is supposed
to be present and explain what changed from version N -> N+1.

Here are some examples that have a vN -> N+1 change summary:

https://lore.kernel.org/openembedded-core/20220817162437.1150136-2-raj.kh=
em@gmail.com/
https://lore.kernel.org/openembedded-core/20220706101827.76249-1-yogesh.t=
yagi@intel.com/

You can look for more with:
 =C2=A0=C2=A0 https://lore.kernel.org/openembedded-core/?q=3D%22v4%22
or similar searches.


> +
> +export FORCE_CRATE_HASH=3D"${BB_TASKHASH}"
> +
> +# We don't want to use bitbakes vendoring because the rust sources do =
their

s/bitbakes/bitbake's/


I didn't notice any problems after this but hopefully others will take a=20
closer look.

So, rebase to master-next to be based on 1.63.

Write a change log that is not part of the commit log at the top of your=20
next RFC/vN.
When you do that, you can just say:
 =C2=A0 - Make all the grammar changes suggested
rather than commenting on each one and

 =C2=A0- Added comments as requested in previous review.

If you change any code, that should be describe briefly.

Now, I'll probably start a build to see if I can reproduce the problem=20
you're having.

When you rebase, please let us know if you still see the issue by=20
replying on this thread.

../Randy

> +# own vendoring.
> +CARGO_DISABLE_BITBAKE_VENDORING =3D "1"
> +
> +# We can't use RUST_BUILD_SYS here because that may be "musl" if
> +# TCLIBC=3D"musl". Snapshots are always -unknown-linux-gnu
> +setup_cargo_environment () {
> +    # The first step is to build bootstrap and some early stage tools,
> +    # these are build for the same target as the snapshot, e.g.
> +    # x86_64-unknown-linux-gnu.
> +    # Later stages are build for the native target (i.e. target.x86_64=
-linux)
> +    cargo_common_do_configure
> +}
> +
> +inherit rust-target-config
> +
> +do_rust_setup_snapshot () {
> +    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.=
sh"; do
> +        "${installer}" --prefix=3D"${WORKDIR}/rust-snapshot" --disable=
-ldconfig
> +    done
> +
> +    # Need to use uninative's loader if enabled/present since the libr=
ary paths
> +    # are used internally by rust and result in symbol mismatches if w=
e don't
> +    if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; the=
n
> +        for bin in cargo rustc rustdoc; do
> +            patchelf-uninative ${WORKDIR}/rust-snapshot/bin/$bin --set=
-interpreter ${UNINATIVE_LOADER}
> +        done
> +    fi
> +}
> +addtask rust_setup_snapshot after do_unpack before do_configure
> +do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
> +do_rust_setup_snapshot[vardepsexclude] +=3D "UNINATIVE_LOADER"
> +
> +python do_configure() {
> +    import json
> +    try:
> +        import configparser
> +    except ImportError:
> +        import ConfigParser as configparser
> +
> +    # toml is rather similar to standard ini like format except it lik=
es values
> +    # that look more JSON like. So for our purposes simply escaping al=
l values
> +    # as JSON seem to work fine.
> +
> +    e =3D lambda s: json.dumps(s)
> +
> +    config =3D configparser.RawConfigParser()
> +
> +    # [target.ARCH-poky-linux]
> +    host_section =3D "target.{}".format(d.getVar('RUST_HOST_SYS', True=
))
> +    config.add_section(host_section)
> +
> +    # Points to wrapper files which contain target specific compiler a=
nd linker commands.
> +    config.set(host_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
> +    config.set(host_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
> +    if "musl" in host_section:
> +        config.set(host_section, "musl-root", e(d.expand("${STAGING_DI=
R_HOST}${exec_prefix}")))
> +
> +    # If we don't do this rust-native will compile it's own llvm for B=
UILD.
> +    # [target.${BUILD_ARCH}-unknown-linux-gnu]
> +    build_section =3D "target.{}".format(d.getVar('RUST_BUILD_SYS', Tr=
ue))
> +    if build_section !=3D host_section:
> +        config.add_section(build_section)
> +
> +        config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}=
")))
> +        config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")=
))
> +        config.set(build_section, "linker", e(d.expand("${RUST_BUILD_C=
CLD}")))
> +
> +    target_section =3D "target.{}".format(d.getVar('RUST_TARGET_SYS', =
True))
> +    if target_section !=3D host_section and target_section !=3D build_=
section:
> +         config.add_section(target_section)
> +
> +         config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_C=
XX}")))
> +         config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC=
}")))
> +         config.set(target_section, "linker", e(d.expand("${RUST_TARGE=
T_CCLD}")))
> +
> +
> +    # Wrapper scripts of build system.
> +
> +    # [llvm]
> +    config.add_section("llvm")
> +    config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X8=
6"))
> +    config.set("llvm", "ninja", e(False))
> +    config.set("llvm", "static-libstdcpp", e(False))
> +
> +    # [rust]
> +    config.add_section("rust")
> +    config.set("rust", "rpath", e(True))
> +    config.set("rust", "channel", e("stable"))
> +
> +    # Whether or not to optimize the compiler and standard library
> +    config.set("rust", "optimize", e(True))
> +
> +    # Emits extraneous output from tests to ensure that failures of th=
e test
> +    # harness are debuggable just from logfiles
> +    config.set("rust", "verbose-tests", e(True))
> +
> +    # Override default linker cc.
> +    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD=
}")))
> +
> +    # [build]
> +    config.add_section("build")
> +    config.set("build", "submodules", e(False))
> +    config.set("build", "docs", e(False))
> +
> +    rustc =3D d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
> +    config.set("build", "rustc", e(rustc))
> +
> +    cargo =3D d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
> +    config.set("build", "cargo", e(cargo))
> +
> +    config.set("build", "vendor", e(True))
> +
> +    if not "targets" in locals():
> +        targets =3D [d.getVar("RUST_TARGET_SYS", True)]
> +    config.set("build", "target", e(targets))
> +
> +    if not "hosts" in locals():
> +        hosts =3D [d.getVar("RUST_HOST_SYS", True)]
> +    config.set("build", "host", e(hosts))
> +
> +    # We can't use BUILD_SYS since that is something the rust snapshot=
 knows
> +    # nothing about when trying to build some stage0 tools (like fabri=
cate)
> +    config.set("build", "build", e(d.getVar("RUST_BUILD_SYS", True)))
> +
> +    with open("config.toml", "w") as f:
> +        config.write(f)
> +
> +    # set up ${WORKDIR}/cargo_home
> +    bb.build.exec_func("setup_cargo_environment", d)
> +}
> +
> +
> +rust_runx () {
> +    echo "COMPILE ${PN}" "$@"
> +
> +    # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust's build for=
 a
> +    # wide range of targets (not just TARGET). Yocto's settings for th=
em will
> +    # be inappropriate, avoid using.
> +    unset CFLAGS
> +    unset LDFLAGS
> +    unset CXXFLAGS
> +    unset CPPFLAGS
> +
> +    oe_cargo_fix_env
> +
> +    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argum=
ent(d, '-j %d')} "$@" --verbose
> +}
> +
> +do_compile () {
> +    rust_runx build src/tools/remote-test-server --target "${RUST_TARG=
ET_SYS}"
> +}
> diff --git a/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest=
.patch b/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
> new file mode 100644
> index 0000000000..f3bbf58a85
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
> @@ -0,0 +1,444 @@
> +Rust testsuite outputs error even on a single testcase failure.
> +Hence, some test runs are ignored as they fail with error messages.
> +
> +Upstream-Status: Inappropriate [Ignore the testcase that errors out]
> +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> +---
> +
> +diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_in=
terface/src/tests.rs
> +index 1327bf6fc..41f5dfbc4 100644
> +--- a/compiler/rustc_interface/src/tests.rs
> ++++ b/compiler/rustc_interface/src/tests.rs
> +@@ -113,6 +113,7 @@ fn assert_non_crate_hash_different(x: &Options, y:=
 &Options) {
> +
> + // When the user supplies --test we should implicitly supply --cfg te=
st
> + #[test]
> ++#[ignore]
> + fn test_switch_implies_cfg_test() {
> +     rustc_span::create_default_session_globals_then(|| {
> +         let matches =3D optgroups().parse(&["--test".to_string()]).un=
wrap();
> +@@ -124,6 +125,7 @@ fn test_switch_implies_cfg_test() {
> +
> + // When the user supplies --test and --cfg test, don't implicitly add=
 another --cfg test
> + #[test]
> ++#[ignore]
> + fn test_switch_implies_cfg_test_unless_cfg_test() {
> +     rustc_span::create_default_session_globals_then(|| {
> +         let matches =3D optgroups().parse(&["--test".to_string(), "--=
cfg=3Dtest".to_string()]).unwrap();
> +@@ -136,6 +138,7 @@ fn test_switch_implies_cfg_test_unless_cfg_test() =
{
> + }
> +
> + #[test]
> ++#[ignore]
> + fn test_can_print_warnings() {
> +     rustc_span::create_default_session_globals_then(|| {
> +         let matches =3D optgroups().parse(&["-Awarnings".to_string()]=
).unwrap();
> +diff --git a/library/test/src/stats/tests.rs b/library/test/src/stats/=
tests.rs
> +index 3a6e8401b..8442a6b39 100644
> +--- a/library/test/src/stats/tests.rs
> ++++ b/library/test/src/stats/tests.rs
> +@@ -40,6 +40,7 @@ fn check(samples: &[f64], summ: &Summary) {
> + }
> +
> + #[test]
> ++#[ignore]
> + fn test_min_max_nan() {
> +     let xs =3D &[1.0, 2.0, f64::NAN, 3.0, 4.0];
> +     let summary =3D Summary::new(xs);
> +diff --git a/src/test/assembly/asm/aarch64-outline-atomics.rs b/src/te=
st/assembly/asm/aarch64-outline-atomics.rs
> +index c2ec4e911..150d23004 100644
> +--- a/src/test/assembly/asm/aarch64-outline-atomics.rs
> ++++ b/src/test/assembly/asm/aarch64-outline-atomics.rs
> +@@ -4,6 +4,7 @@
> + // needs-llvm-components: aarch64
> + // only-aarch64
> + // only-linux
> ++// ignore-stage1
> +
> + #![crate_type =3D "rlib"]
> +
> +diff --git a/src/test/codegen/abi-main-signature-32bit-c-int.rs b/src/=
test/codegen/abi-main-signature-32bit-c-int.rs
> +index a7a4520ff..fcd409287 100644
> +--- a/src/test/codegen/abi-main-signature-32bit-c-int.rs
> ++++ b/src/test/codegen/abi-main-signature-32bit-c-int.rs
> +@@ -3,6 +3,7 @@
> +
> + // This test is for targets with 32bit c_int only.
> + // ignore-msp430
> ++// ignore-stage1
> +
> + fn main() {
> + }
> +diff --git a/src/test/codegen/sse42-implies-crc32.rs b/src/test/codege=
n/sse42-implies-crc32.rs
> +index 47b1a8993..71e2d5ef7 100644
> +--- a/src/test/codegen/sse42-implies-crc32.rs
> ++++ b/src/test/codegen/sse42-implies-crc32.rs
> +@@ -1,6 +1,7 @@
> + // only-x86_64
> + // min-llvm-version: 14.0
> + // compile-flags: -Copt-level=3D3
> ++// ignore-stage1
> +
> + #![crate_type =3D "lib"]
> +
> +diff --git a/src/test/codegen/thread-local.rs b/src/test/codegen/threa=
d-local.rs
> +index c59b088f7..506547ea3 100644
> +--- a/src/test/codegen/thread-local.rs
> ++++ b/src/test/codegen/thread-local.rs
> +@@ -4,6 +4,7 @@
> + // ignore-wasm globals are used instead of thread locals
> + // ignore-emscripten globals are used instead of thread locals
> + // ignore-android does not use #[thread_local]
> ++// ignore-stage1
> +
> + #![crate_type =3D "lib"]
> +
> +diff --git a/src/test/codegen/uninit-consts.rs b/src/test/codegen/unin=
it-consts.rs
> +index 3e370c7ba..a23b47e6e 100644
> +--- a/src/test/codegen/uninit-consts.rs
> ++++ b/src/test/codegen/uninit-consts.rs
> +@@ -1,5 +1,6 @@
> + // compile-flags: -C no-prepopulate-passes
> + // min-llvm-version: 14.0
> ++// ignore-stage1
> +
> + // Check that we use undef (and not zero) for uninitialized bytes in =
constants.
> +
> +diff --git a/src/test/pretty/raw-str-nonexpr.rs b/src/test/pretty/raw-=
str-nonexpr.rs
> +index 7af80979b..5261b0543 100644
> +--- a/src/test/pretty/raw-str-nonexpr.rs
> ++++ b/src/test/pretty/raw-str-nonexpr.rs
> +@@ -1,4 +1,5 @@
> + // pp-exact
> ++// ignore-stage1
> +
> + #[cfg(foo =3D r#"just parse this"#)]
> + extern crate blah as blah;
> +diff --git a/src/test/run-make/issue-36710/Makefile b/src/test/run-mak=
e/issue-36710/Makefile
> +index b5270ad2b..a470f0a83 100644
> +--- a/src/test/run-make/issue-36710/Makefile
> ++++ b/src/test/run-make/issue-36710/Makefile
> +@@ -7,6 +7,7 @@
> + # ignore-nvptx64-nvidia-cuda FIXME: can't find crate for `std`
> + # ignore-musl FIXME: this makefile needs teaching how to use a musl t=
oolchain
> + #                    (see dist-i586-gnu-i586-i686-musl Dockerfile)
> ++# ignore-stage1
> +
> + include ../../run-make-fulldeps/tools.mk
> +
> +diff --git a/src/test/rustdoc-ui/cfg-test.rs b/src/test/rustdoc-ui/cfg=
-test.rs
> +index d4ca92585..fceb2968d 100644
> +--- a/src/test/rustdoc-ui/cfg-test.rs
> ++++ b/src/test/rustdoc-ui/cfg-test.rs
> +@@ -5,6 +5,7 @@
> +
> + // Crates like core have doctests gated on `cfg(not(test))` so we nee=
d to make
> + // sure `cfg(test)` is not active when running `rustdoc --test`.
> ++// ignore-stage1
> +
> + /// this doctest will be ignored:
> + ///
> +diff --git a/src/test/rustdoc-ui/display-output.rs b/src/test/rustdoc-=
ui/display-output.rs
> +index ec27a9f6b..61655fa6e 100644
> +--- a/src/test/rustdoc-ui/display-output.rs
> ++++ b/src/test/rustdoc-ui/display-output.rs
> +@@ -5,6 +5,7 @@
> + // compile-flags:--test --test-args=3D--show-output
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> ++// ignore-stage1
> +
> + /// ```
> + /// #![warn(unused)]
> +diff --git a/src/test/rustdoc-ui/doc-test-doctest-feature.rs b/src/tes=
t/rustdoc-ui/doc-test-doctest-feature.rs
> +index 0b79aaece..8cef6d974 100644
> +--- a/src/test/rustdoc-ui/doc-test-doctest-feature.rs
> ++++ b/src/test/rustdoc-ui/doc-test-doctest-feature.rs
> +@@ -5,6 +5,7 @@
> +
> + // Make sure `cfg(doctest)` is set when finding doctests but not insi=
de
> + // the doctests.
> ++// ignore-stage1
> +
> + /// ```
> + /// assert!(!cfg!(doctest));
> +diff --git a/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs b/src/tes=
t/rustdoc-ui/doc-test-rustdoc-feature.rs
> +index bf334c67e..c372097bd 100644
> +--- a/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs
> ++++ b/src/test/rustdoc-ui/doc-test-rustdoc-feature.rs
> +@@ -2,6 +2,7 @@
> + // compile-flags:--test
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> ++// ignore-stage1
> +
> + #![feature(doc_cfg)]
> +
> +diff --git a/src/test/rustdoc-ui/doctest-output.rs b/src/test/rustdoc-=
ui/doctest-output.rs
> +index 2670fa572..b4b612916 100644
> +--- a/src/test/rustdoc-ui/doctest-output.rs
> ++++ b/src/test/rustdoc-ui/doctest-output.rs
> +@@ -4,6 +4,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> + // check-pass
> ++// ignore-stage1
> +
> + //! ```
> + //! assert_eq!(1 + 1, 2);
> +diff --git a/src/test/rustdoc-ui/failed-doctest-compile-fail.rs b/src/=
test/rustdoc-ui/failed-doctest-compile-fail.rs
> +index 6f2ff5d70..2561ffdc3 100644
> +--- a/src/test/rustdoc-ui/failed-doctest-compile-fail.rs
> ++++ b/src/test/rustdoc-ui/failed-doctest-compile-fail.rs
> +@@ -5,6 +5,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> + // failure-status: 101
> ++// ignore-stage1
> +
> + /// ```compile_fail
> + /// println!("Hello");
> +diff --git a/src/test/rustdoc-ui/issue-91134.rs b/src/test/rustdoc-ui/=
issue-91134.rs
> +index d2ff3a252..90e0816d2 100644
> +--- a/src/test/rustdoc-ui/issue-91134.rs
> ++++ b/src/test/rustdoc-ui/issue-91134.rs
> +@@ -4,6 +4,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> + // edition:2021
> ++// ignore-stage1
> +
> + /// <https://github.com/rust-lang/rust/issues/91134>
> + ///
> +diff --git a/src/test/rustdoc-ui/nocapture.rs b/src/test/rustdoc-ui/no=
capture.rs
> +index 321f5ca08..463751e48 100644
> +--- a/src/test/rustdoc-ui/nocapture.rs
> ++++ b/src/test/rustdoc-ui/nocapture.rs
> +@@ -2,6 +2,7 @@
> + // compile-flags:--test -Zunstable-options --nocapture
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> ++// ignore-stage1
> +
> + /// ```
> + /// println!("hello!");
> +diff --git a/src/test/rustdoc-ui/run-directory.rs b/src/test/rustdoc-u=
i/run-directory.rs
> +index 0d432c1e6..357e3ccc3 100644
> +--- a/src/test/rustdoc-ui/run-directory.rs
> ++++ b/src/test/rustdoc-ui/run-directory.rs
> +@@ -6,6 +6,7 @@
> + // [incorrect]compile-flags:--test --test-run-directory=3D{{src-base}=
}/coverage -Zunstable-options
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> ++// ignore-stage1
> +
> + /// ```
> + /// assert_eq!(
> +diff --git a/src/test/rustdoc-ui/test-no_std.rs b/src/test/rustdoc-ui/=
test-no_std.rs
> +index ee919985e..3e479bf6f 100644
> +--- a/src/test/rustdoc-ui/test-no_std.rs
> ++++ b/src/test/rustdoc-ui/test-no_std.rs
> +@@ -2,6 +2,7 @@
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> + // check-pass
> ++// ignore-stage1
> +
> + #![no_std]
> +
> +diff --git a/src/test/rustdoc-ui/test-type.rs b/src/test/rustdoc-ui/te=
st-type.rs
> +index 882da5c25..bc8e8e30f 100644
> +--- a/src/test/rustdoc-ui/test-type.rs
> ++++ b/src/test/rustdoc-ui/test-type.rs
> +@@ -2,6 +2,7 @@
> + // check-pass
> + // normalize-stdout-test: "src/test/rustdoc-ui" -> "$$DIR"
> + // normalize-stdout-test "finished in \d+\.\d+s" -> "finished in $$TI=
ME"
> ++// ignore-stage1
> +
> + /// ```
> + /// let a =3D true;
> +diff --git a/src/test/ui-fulldeps/gated-plugin.rs b/src/test/ui-fullde=
ps/gated-plugin.rs
> +index 445469f87..85eaf5336 100644
> +--- a/src/test/ui-fulldeps/gated-plugin.rs
> ++++ b/src/test/ui-fulldeps/gated-plugin.rs
> +@@ -1,4 +1,5 @@
> + // aux-build:empty-plugin.rs
> ++// ignore-stage1
> +
> + #![plugin(empty_plugin)]
> + //~^ ERROR compiler plugins are deprecated
> +diff --git a/src/test/ui-fulldeps/internal-lints/default_hash_types.rs=
 b/src/test/ui-fulldeps/internal-lints/default_hash_types.rs
> +index 795c7d2dc..dc6b4f53f 100644
> +--- a/src/test/ui-fulldeps/internal-lints/default_hash_types.rs
> ++++ b/src/test/ui-fulldeps/internal-lints/default_hash_types.rs
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::default_hash_types)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/lint_pass_impl_withou=
t_macro.rs b/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_m=
acro.rs
> +index f6f0c0385..4523e2a6d 100644
> +--- a/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro=
.rs
> ++++ b/src/test/ui-fulldeps/internal-lints/lint_pass_impl_without_macro=
.rs
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::lint_pass_impl_without_macro)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.=
rs b/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
> +index 32b987338..6187e2370 100644
> +--- a/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
> ++++ b/src/test/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::usage_of_qualified_ty)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/query_stability.rs b/=
src/test/ui-fulldeps/internal-lints/query_stability.rs
> +index 560675b44..e7d5ba583 100644
> +--- a/src/test/ui-fulldeps/internal-lints/query_stability.rs
> ++++ b/src/test/ui-fulldeps/internal-lints/query_stability.rs
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> + #![deny(rustc::potential_query_instability)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.r=
s b/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.rs
> +index 402c41f37..fe1f10d8c 100644
> +--- a/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.rs
> ++++ b/src/test/ui-fulldeps/internal-lints/rustc_pass_by_value.rs
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_attrs)]
> + #![feature(rustc_private)]
> +diff --git a/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs b/=
src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs
> +index 973294e98..f4b3f8342 100644
> +--- a/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs
> ++++ b/src/test/ui-fulldeps/internal-lints/ty_tykind_usage.rs
> +@@ -1,4 +1,5 @@
> + // compile-flags: -Z unstable-options
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> +
> +diff --git a/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs b/=
src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs
> +index 7498745f2..28c00f2f8 100644
> +--- a/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs
> ++++ b/src/test/ui-fulldeps/lint-group-denied-lint-allowed.rs
> +@@ -1,6 +1,7 @@
> + // aux-build:lint-group-plugin-test.rs
> + // check-pass
> + // compile-flags: -D unused -A unused-variables
> ++// ignore-stage1
> +
> + fn main() {
> +     let x =3D 1;
> +diff --git a/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.=
rs b/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
> +index fc19bc039..9563e9930 100644
> +--- a/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
> ++++ b/src/test/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs
> +@@ -1,5 +1,6 @@
> + // aux-build:lint-group-plugin-test.rs
> + // compile-flags: -F unused -A unused
> ++// ignore-stage1
> +
> + fn main() {
> +     let x =3D 1;
> +diff --git a/src/test/ui-fulldeps/lint-pass-macros.rs b/src/test/ui-fu=
lldeps/lint-pass-macros.rs
> +index b3c2a5427..9ed711a34 100644
> +--- a/src/test/ui-fulldeps/lint-pass-macros.rs
> ++++ b/src/test/ui-fulldeps/lint-pass-macros.rs
> +@@ -1,5 +1,6 @@
> + // compile-flags: -Z unstable-options
> + // check-pass
> ++// ignore-stage1
> +
> + #![feature(rustc_private)]
> +
> +diff --git a/src/test/ui-fulldeps/multiple-plugins.rs b/src/test/ui-fu=
lldeps/multiple-plugins.rs
> +index 25d2c8bc1..9af3ebd57 100644
> +--- a/src/test/ui-fulldeps/multiple-plugins.rs
> ++++ b/src/test/ui-fulldeps/multiple-plugins.rs
> +@@ -1,6 +1,7 @@
> + // run-pass
> + // aux-build:multiple-plugins-1.rs
> + // aux-build:multiple-plugins-2.rs
> ++// ignore-stage1
> +
> + // Check that the plugin registrar of multiple plugins doesn't confli=
ct
> +
> +diff --git a/src/test/ui/abi/stack-probes-lto.rs b/src/test/ui/abi/sta=
ck-probes-lto.rs
> +index 90df1f3f5..f82c12a86 100644
> +--- a/src/test/ui/abi/stack-probes-lto.rs
> ++++ b/src/test/ui/abi/stack-probes-lto.rs
> +@@ -14,5 +14,6 @@
> + // ignore-pretty
> + // compile-flags: -C lto
> + // no-prefer-dynamic
> ++// ignore-stage1
> +
> + include!("stack-probes.rs");
> +diff --git a/src/test/ui/abi/stack-probes.rs b/src/test/ui/abi/stack-p=
robes.rs
> +index e998dd0f8..d735a98fe 100644
> +--- a/src/test/ui/abi/stack-probes.rs
> ++++ b/src/test/ui/abi/stack-probes.rs
> +@@ -10,6 +10,7 @@
> + // ignore-wasm
> + // ignore-emscripten no processes
> + // ignore-sgx no processes
> ++// ignore-stage1
> +
> + use std::env;
> + use std::mem::MaybeUninit;
> +diff --git a/src/test/ui/empty_global_asm.rs b/src/test/ui/empty_globa=
l_asm.rs
> +index dbcc7be05..276d689b0 100644
> +--- a/src/test/ui/empty_global_asm.rs
> ++++ b/src/test/ui/empty_global_asm.rs
> +@@ -1,4 +1,5 @@
> + // run-pass
> ++// ignore-stage1
> +
> + #[allow(unused_imports)]
> + use std::arch::global_asm;
> +diff --git a/src/test/ui/macros/restricted-shadowing-legacy.rs b/src/t=
est/ui/macros/restricted-shadowing-legacy.rs
> +index f5cac2dfb..d84f8efd6 100644
> +--- a/src/test/ui/macros/restricted-shadowing-legacy.rs
> ++++ b/src/test/ui/macros/restricted-shadowing-legacy.rs
> +@@ -74,6 +74,7 @@
> + // 62 |   Unordered   |   Unordered   |       =3D       |    +?    |
> + // 63 |   Unordered   |   Unordered   |       >       |    +?    |
> + // 64 |   Unordered   |   Unordered   |   Unordered   |    +     |
> ++// ignore-stage1
> +
> + #![feature(decl_macro, rustc_attrs)]
> +
> +diff --git a/src/test/ui/process/process-panic-after-fork.rs b/src/tes=
t/ui/process/process-panic-after-fork.rs
> +index 1ccf6bb05..c4b074092 100644
> +--- a/src/test/ui/process/process-panic-after-fork.rs
> ++++ b/src/test/ui/process/process-panic-after-fork.rs
> +@@ -6,6 +6,7 @@
> + // ignore-emscripten no processes
> + // ignore-sgx no processes
> + // ignore-android: FIXME(#85261)
> ++// ignore-stage1
> +
> + #![feature(bench_black_box)]
> + #![feature(rustc_private)]
> +diff --git a/src/test/ui/simd/target-feature-mixup.rs b/src/test/ui/si=
md/target-feature-mixup.rs
> +index 6d7688191..a8d551154 100644
> +--- a/src/test/ui/simd/target-feature-mixup.rs
> ++++ b/src/test/ui/simd/target-feature-mixup.rs
> +@@ -1,4 +1,6 @@
> + // run-pass
> ++// ignore-stage1
> ++
> + #![allow(unused_variables)]
> + #![allow(stable_features)]
> + #![allow(overflowing_literals)]
> diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.62.1.bb b/meta=
/recipes-devtools/rust/rust-testsuite_1.62.1.bb
> new file mode 100644
> index 0000000000..d334231c8f
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite_1.62.1.bb
> @@ -0,0 +1,3 @@
> +require rust-testsuite.inc
> +require rust-source.inc
> +require rust-snapshot.inc
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169906): https://lists.openembedded.org/g/openembed=
ded-core/message/169906
> Mute This Topic: https://lists.openembedded.org/mt/93266562/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


