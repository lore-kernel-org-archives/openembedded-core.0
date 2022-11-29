Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D405CC4321E
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 22:28:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1280.1669760909205831533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 14:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=dV8yEnDK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9332043db8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATKjd6d021423
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 14:28:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=kznAUBJVaYOsYreRrvTq1+gfZuOR2GS13zI3GKDTYF4=;
 b=dV8yEnDKIBb9rTE6vmjwAEpmqLYN3NoSYQ7tNJobcSukRNsjBTUSZbxgTI0OzoXmb4iK
 BpvH7wL7U3BBPO+lRfYsKZBYf1fhj6k4mBlPJYh2lX4ZuWOpO2NHyfbC6Cst+SnzWX2L
 8klu1yylSnYRJsnMoqHk2oY8qsA3z/B9S01lNt+lYQ9GZCH+ei0AlEQUWZLjs9drvGPh
 f3TPW/gRaBt1jGzJeCygrhWDlHLB59v/PLQ56s2FOfLVboX4MEiH/XFcSmBKzlWpnJfu
 WJUdmAYpzJG8ABVUrqt/XpW4p9X6JTFgPam30CpBf8Qzj6H0n7E/2CKLT/xUmOQRBHAf EA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3ey92q0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 14:28:28 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ATMSSSq012663
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 14:28:28 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3ey92q0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 14:28:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N36K+emVhrZokt4z1GWvFFSeYHXj0Kc9UxoHM3cHchYqXEyJsA3aDR+xaWCJRYOX/qOiIE6e2JLP+4wABZgrtf87OT95f4g/ojsUVGoHOJeGWu/BO8BW2Y2oNYNmKq3DPQNjEWdoJqFj+AKcVOAfWeTmqZwiwJCVda6sWYJgRP/WYONYUFqXF/gqGISZONdts5ugaFsMnpmcp5h9X2GB7MEu26JiPEF0mYQ1bgiuYQbDtSG8nGHVfzOMiYW7vhKY/a+coyd18D8JPjvN8lYs1aFWSqAoUoHNe6AzNfJ5GywlduLemzJ/NEyTVViv27454TZDRSEBZiTW8zpdEexscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kznAUBJVaYOsYreRrvTq1+gfZuOR2GS13zI3GKDTYF4=;
 b=YYh24lxaQ4HahPONZpWXfpnf3rxiRcQhxL7g19LZJgI894gCqW/WTcbNiKQV/Dc395ZqiDtpLLpRGgR5eoSAgMPqpS/b265/ZZ6dgsoDZYNCIB/vQ925Bx7/OAF7ga2D90FGJonADEo4mS/qtZEHm+t65xazVybkIpB2x0j0Vi4OcnTWJ+EnsjpfyNDzlanFBUa0aBNQLg74qF9bNjbfQPEvEzJ+6FfrlQC58brRyrO5HhpOiDGvcZIzm6N97QFbdDeJY9dZJ7nSsbjoT0M+GdCyZt1fw4Mb2qW38bLv0n/9JIJkiP9nDxGf5xYKuj2qEDbLj4FUMZHlmTMHTr9jDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 22:28:26 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 22:28:26 +0000
Message-ID: <ea2e31cb-21e1-0c04-9542-d8b8f0e58040@windriver.com>
Date: Tue, 29 Nov 2022 17:28:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][master][langdale][kirkstone][PATCH v2] rng-tools:
 backport patch to adjust jitterentropy library to timeout/fail on long delay
Content-Language: en-CA
To: ross.burton@arm.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Xiangyu Chen <xiangyu.chen@eng.windriver.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20221127134909.72700-1-xiangyu.chen@eng.windriver.com>
 <CANNYZj95YNhEgK+ony5KyLo_DBXJg-wE8cD7F9xVH4vDMELqwA@mail.gmail.com>
 <0ADEBB89-0C61-4976-946B-4A0E1B997EA4@arm.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <0ADEBB89-0C61-4976-946B-4A0E1B997EA4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:a03:60::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2686a5-4616-42b7-0dca-08dad2590856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vmfnyKZnfl48eWJyOlvz00d6wTMteKecQEucRGUsITOebM3BLbpwVmOVuL949p2M/NkcWEUf4D1T0fJ6imVFG1gb1Yul6lNkeyfcnFWh7fPT+rl+FOOhQjX6KHBYfihepkz3ohYS/GA9qDxvOmPtlbBR/eXgUoRGBse7squYzig5uNgU1LSKEw/Rg9CbUiL8Cv3V4ASK/yDZDeMQw1H5V7v7Vp41YDe4DW9mkKzD95TkgUDwx8JnIJKnxgauA9ttKG1fNZpsCjfAj1ozJNbV7V4r4ns2dtWTVn42gh8eNhfmml+Rsouyta9lYogNrEXnnZLjE92vCCY+q2X/NnFpd9MpzBhE4V1Wz/nX0lXHD9yG8quHliFPahtO6+K+XH+r5mPKmnfjwlFVNaUD+WXf9P0YqRJmqPYeLXKTItPxSDkv2p6sfrwNfmjlVNeZDw+ck6BaOOnPfuwTRa2aWEPMzT65rINBH8hvNObwj3nH2zgbJwkcbwqg2ilXX/ch238pQQ4mnm5GKwCKvR/J2T2hmSooOUk1e2HGxW1K0jaSn5+UjxlTOLlUL7+jRfUbEkru73CZmFdvsxhJVcyba9lQfzZMvUAm9Cmm4Tzl438H89sVIOgqK9NKZ157CddPCF0qyfzq9L78fcjfsHReygXnp1cZWnVVIhrwtrjDmoCDgSiRMP07bh5Y1XUiNZ6fv14dhVcxLjtpHUGSkLpZGHqlucnMUFtVKt3PKwjeGRuiWzZBX6YN5UUsd81kZGJLlymvlT56+3KZFBsQqGNNjGV1jvVAwQ6G7KAv1mgnU06gp1U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(39850400004)(136003)(451199015)(83380400001)(26005)(53546011)(36756003)(86362001)(31696002)(6486002)(966005)(6666004)(6512007)(6506007)(54906003)(4326008)(6916009)(4001150100001)(5660300002)(8936002)(478600001)(2906002)(316002)(41300700001)(8676002)(66946007)(66476007)(66556008)(38100700002)(186003)(2616005)(66899015)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWl1UVVMUFZmbTNUdEkzV09VcnpVeHNkYmJDYkk4SVNOUzFDSE40cVlpcitF?=
 =?utf-8?B?Y1d5cXMwSUdWc0E5aGdBY3hBZzRNMFh4bXU2b2U0R1NjMmQrVjVKbEtnM0JB?=
 =?utf-8?B?dUVJeGE3ZzkrVHM2aGk1U2NJcE4xaXlxZTZib1MzaW95WEJ0UUh1aDlESENI?=
 =?utf-8?B?bUc0VkhGWmxzUWoxUU9MYW1OZFk1NlYyeUhJdTd1ZzIwdWM2QlQrTmNZYnly?=
 =?utf-8?B?WXNZVndNd2RaS2NXN0QrUmsrSlc4dGlDNHAzVHF0QURXWlE5T3lya0gzRlBj?=
 =?utf-8?B?MDBtcVVwNWxjWGYxOXA5c3VUOEpKSmgxcHIxNnRSSGdBeDFMK3hlTjA1SnFO?=
 =?utf-8?B?MmhoOTN4Y0JaTUpQTEZDVG5hR2ZPN29MM0VBS2k2NXdrVjVnRUx3Y0pGYmpX?=
 =?utf-8?B?SWxuSjQrOGgxUkRCbmthTXkrUUpIOEpxS1VMRjQ3ZXJBUGF0MGpHZkNlV1VZ?=
 =?utf-8?B?RHdlelZlUm1TWFYrMXh4SmN5RWk0U0RXRDB2eCtoL0Y2aGpwYjZkdnhTNWNq?=
 =?utf-8?B?MFVKcXZWOStvYUpOZ056eEM1RHZJeGJ0a2hUN2pEL1c4UE1ldE5DSUphR0dY?=
 =?utf-8?B?OFhoSmlrczBLNHVnYXdFYkJxR2hBRVZIVWpXOW1Sc2xpWmpoaGppWi9OcWhM?=
 =?utf-8?B?Q2ZNRzQ5UzQ3SjNlYmY4UWZtRU53a2E5MTRuTjl0UVNLQlN6TkoxZGFibVRl?=
 =?utf-8?B?VElOdDAwSldab1JJa2RxL2daNEZOVlZFcWhqSVEwVDZ1emFGRk8yRHVxQjlt?=
 =?utf-8?B?bEppOFUzNjVoTXpHbzFVQ2xPdENpMGxoTnFSUVN0aUsvcnB0NHkxVHNUTWtp?=
 =?utf-8?B?Yk1Jb2FSK2xudHpiZHdLZzRTaE9vT1lUS1l4TFdNUmxiZFhmSm5DcEN5Nmd3?=
 =?utf-8?B?VzdNYjFKSnh2U2hkM3Y4Z1lUYU9taENHMk5TVG0vaUpEMFpYK0x0TmhTNTBk?=
 =?utf-8?B?ZlExUlpSajA1Z1VBRk0wZm5MU0F0dDBidmhkZ3ppWWIvdGE3bDVKWVJZRlFm?=
 =?utf-8?B?REhsdVhkcjYxakhyeW8xTlVrRklqbFMxL2RORmNQQ2xtcGMwcGpkVjlmZFJV?=
 =?utf-8?B?ZUo0SWZsRHdoTEIyU2J2cHluUlQxbk1QVVlzazkvTG0vdXhaTEtHUzNzNGd1?=
 =?utf-8?B?RXczVzRUU3BzNDVCYzYrd0RlbzZ1VURVbFlYc1dPQllmb0RSQUlib3BBS3A5?=
 =?utf-8?B?NkV5ck1xaWZzTmhHdXgwZTdLazNlT0hpbDhPSWdzdERQcVByU09ELytTcU12?=
 =?utf-8?B?ejZmY2N2eE83RnRyMzJZSE1Ma2s1M1pEOW5hdzQ5TkZlZUlDQTJ4YVJYUWs4?=
 =?utf-8?B?cnh2MGRUbng0b1FJcGRXME1PL2tpVXVmVm5qUzB4WU9MMVRIU2M5ZFlFZCsv?=
 =?utf-8?B?a1RianVPY2NaMkx2ZG9ucjBOZXFGTjJXaC9DT2g5bzBZeFFCbUpLd29HbFMv?=
 =?utf-8?B?Nktla0Jrb044R1BaTkIwdGRrR0ZBM29lN2RrTU82RERVUlJKL3MyMzZMcGJy?=
 =?utf-8?B?NklpbTgyckxEK0o0cnIwbituazhWWDFHanhxMTZnWnZkeHh0SGozV1BoUzJN?=
 =?utf-8?B?dndwcVdVa2tmbi9YZDJuR0lEcE1PTVdjbnN6QWdua29rUm5ZWlZURXgybEU5?=
 =?utf-8?B?UGk2eW55c0NiNTFqMFU3czArY0YydlpqaktzeTJRMmJreStRaHQzbTRyZWxL?=
 =?utf-8?B?RDBsMTk3TkxZZHZ4RlhqUEhkemZ5WEcraHdJUi9LZFdnR0xoZFFIeEZTMkF2?=
 =?utf-8?B?L1psWDFWb093WVYzS1pRZnAwQ2ZYZnVDa2pMVHpuQVBKK2xSY2RnZ3VVR2Va?=
 =?utf-8?B?RXAvRWlRTGluWFlyM2dqUXluVndtRnlOcldIa0tzemd4UFErc2VJUmo1bGNE?=
 =?utf-8?B?MU4xMEMyVkhoamRBMDNnNWhPU1pGcWp5TjR1cSt6YVpJS3pyRjBsYzNDZXBu?=
 =?utf-8?B?UnZWM1VnTWVNMHJudmJ5USt1SHNXdmRKcitwMEI4V3RpaTNYeURDbTlWNlh5?=
 =?utf-8?B?MkUyUXBncmNYQXFWYTdCZTZSVS92Y1JXRzZmblFlSnpQRFZJZnpRUnNCRUlV?=
 =?utf-8?B?QzQyOUpTcklXTnhuV2k0QUJHdFRKUkJDdjB5dVFLam4zeE5hUGU4SFFLZGlV?=
 =?utf-8?B?WklKbWFESmw3Z1JlWmZleWt6SEZOQlVIQWljTlRPc3Q0ak5MTlltQUk4bGor?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2686a5-4616-42b7-0dca-08dad2590856
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 22:28:26.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIj6NZvYYHA10rBfOjB90NFq0vBIiCYD1RmuVDDCZShDfidwrj/hUfe/Pg7m566fxhkeMMcByXsK6/NuSxzO/VOSTBFQ5fCoEXNsqr9vfsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
X-Proofpoint-GUID: zNlCJSEAZTV_bd8ytr0QlFrdyyN3TK_L
X-Proofpoint-ORIG-GUID: tXlmfFaOSWQ0cOI-YvJC30oiMb0Ag_f4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_13,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211290134
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2ATKjd6d021423
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 22:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173988

On 2022-11-29 10:52, Ross Burton via lists.openembedded.org wrote:
> On 28 Nov 2022, at 09:25, Alexander Kanavin via lists.openembedded.org =
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> On Sun, 27 Nov 2022 at 14:39, Xiangyu Chen
>> <xiangyu.chen@eng.windriver.com> wrote:
>>>   * add libgcc in RDEPENDS flag to solve testing failed in core-image=
-full-cmdline
>>> +RDEPENDS:${PN} =3D "libgcc"
>>
>> This needs to be better investigated first. The change looks like
>> solving the symptom, but not the actual issue.
>=20
> It=E2=80=99s not uncommon: https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D10954

While it would be good to solve the general case of libgcc dependency=20
mentioned in that case,
I do wonder if the original issue that Xiangyu saw, goes away if we=20
_only_ add:

  +RDEPENDS:${PN} =3D "libgcc"

to rngtools without added the upstream timeout after 5 seconds or
it the dependency is only required with the patch?

Xiangyu ?


I also don't like the arbitrary timeout and I'd like references
from the board vendor that explains that proper RNG isn't supported!
( I'm not a BSP person so this may be optimistic! )


Note that there is a follow-up patch to make the timeout configurable,=20
see below.
If we take the original patch, we should take both and require that the=20
BSP tune
the timeout. We'll get this behaviour once the patches are integrated=20
into a release
so we might as well figure out if we're going to:
  1. have a tuning policy,
  2. continually revert the patch or
  3. actually get to the root cause of the problem (by working with=20
board vendors I expect).


../Randy

commit 6e14b8bd491b3f94f60f36748959e0ae7d7c1f95
Author: Dan Hor=C3=A1k <dan@danny.cz>
Date:   Mon Jul 18 04:47:41 2022

     rngd_jitter: make timeout configurable

     The current default 5 sec timeout can be too short in some situation=
s
     (eg. slow hardware). Introduce a command line option (jitter:timeout=
)
     to make the value configurable. Increasing the default timeout is no=
t
     desirable, because it might slow down system startup when there are
     other entropy sources.

     Signed-off-by: Dan Hor=C3=A1k <dan@danny.cz>

commit c29424f10a0dcbd18ac25607fa1c81c18a960e81 (origin/jitter-init)
Author: Neil Horman <nhorman@tuxdriver.com>
Date:   Mon May 16 13:38:54 2022

     Adjust jitterentropy library to timeout/fail on long delay

     When running rngd -l its possible, on platforms that have low jitter
     entropy to block for long periods of time.  Adjust jitter to timeout=
 on
     init after 5 seconds in the event it takes to long to gether jitter
     entropy

     Also while we're at it, I might have a build solution for the presen=
ce
     of internal timers.  When jitterentropy is built without internal
     timers, jent_notime_init is defined publically, but when it is built
     with timers, its declared as a static symbol, preenting resolution, =
so
     we can test to see if the function exists.  If it does we _don't_ ha=
ve
     notime support. The logic is a bit backwards, but i think it works


>=20
> Ross
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173981): https://lists.openembedded.org/g/openembed=
ded-core/message/173981
> Mute This Topic: https://lists.openembedded.org/mt/95288451/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
# Randy MacLeod
# Wind River Linux


