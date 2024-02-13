Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D06C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 22:04:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26672.1707861888666500123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 14:04:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=W7FPtDrS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27731d4e0c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41DI7T1t003837
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:from:subject:reply-to:to:cc
	:references:in-reply-to:mime-version; s=PPS06212021; bh=ZQZQG5qE
	wUvsMxhWv9F+0kRGNz8QuiTVfTCZpIXbRPM=; b=W7FPtDrSn0AfxLIP2yfTWdhX
	CbiD4OcxzfI8/kaUAHaB4kawt2uWNUXQIZ0CTsiVryBe6AC9V12VIqEk1u9/vgoi
	awBTK1b7rM1Qb9iJ56Wk3IxoUftAG3sgpMMFZtv4PfH3lx6Qz8gbojQAMGGNUleb
	W0wVZAWXf6P0PukcgmftL3coE6KL/XMrBiTlaGnbaK6fn17mRN8LdBWXZtp6jB6a
	DlQt3JNsyftRzeLtuEtmyh51joc+TZCZLyWBXvWjorMeCGbu/x2GnCeQN1f/niPM
	GywMS0y/hy9cz7UglYztQvgc99mRU9BnkvoTvr2mu+gMYqmbp/4vhVfOtDEfgA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w6046u63q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:04:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGGPazNCbMn+JVdqVr9UkzMvnaPCZoALaYuMGcbr+Z3rJHRyBMZdi/FhwYNl1V3wVHnxDB/MNzTfrmoq047ZZW5x9IRQ9CedWnvtrZi/HZIOLuI675++hmWIrT1HQnlsXvLf6o94OPsQpOW7e/5QUphNtQ8XwmylA4JtLZ8QKsoZ4cEr7TD2SlbcNB/8zmxy32Q2RYK7munei/a8BCyi65PgzhCXHY89cQXTWERkhQKrhw0DkxM+ISdNds94krWRZmklpU9IsU2P9l6Qw5Ik9Gqtf/tRaM7Y3ioLpjgNO2aam5g+NU/OZrGMtke8e+93vTMglyPD2qeHtKZWCpnTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQZQG5qEwUvsMxhWv9F+0kRGNz8QuiTVfTCZpIXbRPM=;
 b=TWpEpJHqzevI8m2oYIe/sZzSG3uQTqQrznhQ/h8jwtLUHLlfha8bYXAlZ+WarEzdZLU5V9A2Y26kwcSC/ytAEPSTJ/e2LSGSJxvDY3uyAw4j+pjhL2Z8UskEaKhsq1UBEg1pmSbpfMfcQbYYh5TlVBn7dkSJLuM1tYO4zCxn5lfARcmixWUWpzSmlFpSqI7DpZDZFu0vkZW6YBNf6s39oDxzawYHiP4tBjMbEa+vwpEqri0SBGZ+kLlAaSGrZT6dN/nfREXmhBzfkXhlFH/A/v9ncyuMBk5ApON1+ZScxHKmyg9GaVE1nnP6sn1V3hAWz6l6ph1eqfgWYs7DU9SXGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by CH0PR11MB5412.namprd11.prod.outlook.com (2603:10b6:610:d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 22:04:27 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 22:04:27 +0000
Content-Type: multipart/mixed; boundary="------------yJc02MM104GZJjwgLA5G1Fg5"
Message-ID: <0972f393-2faa-4e09-ba22-3579273a1106@windriver.com>
Date: Tue, 13 Feb 2024 17:04:25 -0500
User-Agent: Mozilla Thunderbird
From: Randy MacLeod <randy.macleod@windriver.com>
Subject: Re: [OE-core] [PATCH] gcc: Add riscv64 as a compatible host to
 gcc-sanitizers
Reply-To: randy.macleod@windriver.com
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org,
        "Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>,
        "Hao, Kexin" <Kexin.Hao@windriver.com>
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com,
        "Kallapa, Umesh"
 <Umesh.Kallapa@windriver.com>
References: <20240212110000.1687187-1-Deepthi.Hemraj@windriver.com>
Content-Language: en-CA
In-Reply-To: <20240212110000.1687187-1-Deepthi.Hemraj@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|CH0PR11MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e79568-a9d4-4725-f661-08dc2cdfbf32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CR+OS61L6Q+FHF3SDEwqpXkuBUwn1hRYBCKHMbAfhbGk0YmRuT2k0UFzLP5rti/hCyh4xSE+n0WvTP1PY8OaGBVzicWgnQeBxcCo5oVnkPU1pKZcicW5AjRpssAZY8t8g64yg4nMg4VRCglHeasEeW9mpTsLOGbijMC08bNHemlqiPMhBTW0ol6w6tkQ/9mgi/O77N5iNjwR4gnO261pQlDScKmPJZFnQMaSEv1Ft7o05twMS3LOFUxK5vwzY5qWkea7TAPF6Unr0MjRh3c+QU7cwLKhabIoqAlAXU8bvPMemHiz+3RoEBFqqOZwKkhj62jNRY9HB41e4K9cn5UnY+UIDmzifpomFRaEtCuJrdMDgUCYU40DanSccTE9mr5aoVuDoHuL4sj9xAwTONBIfozDt6nzlZiAz0Mh3YlCJRemGI58dZhSzHynpw3TNERwC9RSHIxaGc47u2jbdtPXh1b63KDG25H2XVa8eFQi9ubCwr95MK782wlGmp7aM0c8hJiu3UC67Kv3OuPgCBgxlYqlSnolU1aFo/0KQLRDBVM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39850400004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(31686004)(2906002)(3450700001)(5660300002)(235185007)(4326008)(86362001)(31696002)(2616005)(41300700001)(38100700002)(107886003)(33964004)(110136005)(6512007)(6506007)(6636002)(316002)(66476007)(66946007)(66556008)(53546011)(8936002)(8676002)(6486002)(83380400001)(166002)(26005)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UEVrWkcrL0hNdHdoZzFjcWxobjhxQ1VvQk5UWmgwK3oycDNwSk5zVWJBY2pt?=
 =?utf-8?B?alpDK3QrVVhpeXdLaGkzNmRoNGg4QjlFckZYQ1VCOUN1b2taVGMvaEpVZDdw?=
 =?utf-8?B?MXZEQTZ6clR4UzVBeG0xb0lndXBma0VRSUFxcUJqR09HbkJyTkJoUVd4eXB2?=
 =?utf-8?B?ckpUREVpVzNraHRURWtEKzVORlUrN0Z5RkNNVDU2ZE54SjdHWWhldUtQY3lu?=
 =?utf-8?B?c0V0dVJGcmpNUFVCUmJ4cnYvNlg2Rk1YSzdJYUVVT1Q2UWl6UTgxUlBPOHF3?=
 =?utf-8?B?VVp2VC9LN3prZnR2cksyand6dGV1QjdtaFpRQXRqdFh5MUFpM2s3MVRHWS92?=
 =?utf-8?B?TkdoU243Q0FLZmE5M25RaEprRVY2dVYwSEsxUG9POWNQNzhHNWhTWlBmcEgw?=
 =?utf-8?B?SHdXOHRHZHFvSnVCMFkxZTI1ZUJJRWdJd1ZEWXVKN0dPeFVRWFhWQkVZOW82?=
 =?utf-8?B?dmV5UnJQaEFZVWZObnU2NVZyZ1Y2U3h6RE5tUXQwTHgva0Ewb2NXVVBkeWFa?=
 =?utf-8?B?SkxkQWVDdmxna1lEQVo2c1J6WkhoKzEvRjlJeXkrMTR4SUVOc3Q2K0w1NzEy?=
 =?utf-8?B?aDgxQ29QNGswYXh2anBIZnV3TWpPcU1CWFN2dEx5RGJocUttU3JsMThnVDg4?=
 =?utf-8?B?ejdoK2dtQkgrRmdidzZRdTRSMzE2OU8yOE40YTd6c0Y4NjREUVZwaDNxU1BO?=
 =?utf-8?B?dkp5V3ExcUx1TjcvNnlOVXlmT05hbFB6ZmNnd05tTWI1WXpiajFES2VQKzU1?=
 =?utf-8?B?Ykd4VHdTeklITjhEa05mZ1R5amVJQXp3MEdVSHN6djdZSjVNMVdvbkFheUVW?=
 =?utf-8?B?RllCSFJnSG5SVkJGajYvVFZscXczdy9YVmhMUTdMWis1MDE5akY0YjZydjNv?=
 =?utf-8?B?RnR2aUNROXN5R2tFSlVYRHovYW91bm5UL3NJLzNIcS9HZ2hTNmpRUnhWeXZq?=
 =?utf-8?B?WmtBUk5ld2hmb0FBQmFzVGNBNGYvZENIakxhTzBFUHNxN1RNQ00vUDFUSTZY?=
 =?utf-8?B?Sno2azdVcUs5S3Y0OWFpMDdEQUFVOUcvVFUyVXp3b0paN2RwSVVVNnJPSnFx?=
 =?utf-8?B?cTQrbnNTWm1KVjVoZzE2K1R4Mi96WDRZbDZUYXNKcFZvelFWNTZqNU10RE5i?=
 =?utf-8?B?SDVGYjJHMzRXcXpvZytZaXBnRUM3OFV2V0VaVWt1d1J1U2tTMzZScFZ4czRS?=
 =?utf-8?B?a0YyTWdWaFF4UERlWld4ajF3Z25jdWRrNjFlam5NL2F5NTRScEJCbDd6eU1C?=
 =?utf-8?B?STk4TlpOK3NSc2dnak5zNExZK2EzZzRKb0NlQ0V3cGcybHdDY1lteUZFR0xK?=
 =?utf-8?B?Z0lxMEI3ckgxVkxpSWhUZThBK0lCTDFOM2Y1WmV3NEpvbVc5QTVManBaMUUy?=
 =?utf-8?B?L1M5UmRoa0hQZjhYMis1dDIzeHhFTHdURk5CMVg3VnQ4ZGt6ZGNBbkNVa3N4?=
 =?utf-8?B?T01RRm9kR1ZGUHNYZExTT0F0SGFBL01sNTBzdDRkNU5DY1dibzRWMDFHdFFp?=
 =?utf-8?B?STFWVEtQRjQ5RnVpZk4vTDJKTlU5RHkyTHA5RHlHcmsxQkNqMDlacUcyYTZE?=
 =?utf-8?B?QUUyU3JncnprVlNWNjl2cEVRRUJxZWVCM1hnTnVBb3VUbzgxVlRrM2E5WUFv?=
 =?utf-8?B?TVJFdFJWV3VSK2JzRTkzYlRVZEZPZ1dtYlJZc0wrL1hqYlBtMGhuOWE3OTQ1?=
 =?utf-8?B?cllKLzFmY1FHUDlhRU9jNmVaSnpHcnNlaWZMUVYzWjlMMGZoZjBZczBDeWFI?=
 =?utf-8?B?d3RSVm5oRVlLY1VJT3RTMU45dzIyQ25CUlIxTUZJVHNCNFkxd3N2QTJpNjhM?=
 =?utf-8?B?NTNkV3hGWHYvckZad1NaNWtNQmorSTdWb28renduN05FZDFIWUZlejZzay9E?=
 =?utf-8?B?cS9ZVjlIbzZQbGlaL01iL3c4ZWpZam1hUzNzSmtIdHMzS1F2VlZXTFBkTUhn?=
 =?utf-8?B?V1pBazNudmlqUnRJR1Naa2MxK0pVa3RZWmh6b2czWmhhbG1GdFoxSFBIYlFQ?=
 =?utf-8?B?dG9ySTBCdW1Sc0dST05seHF0YnRLeGtINWtvdGM4T1NDNWE5YW53RlJid0ZO?=
 =?utf-8?B?U1MvZGNVZ3g2MkhOUFg2RG4rT0RTSjNPajZNOFZ2UmpEdXBJZ3UwWWovZDds?=
 =?utf-8?B?cjA0K2cxNzM5bit5VVdJT29oZDF0Z1JBVmw4cEJoTFJBZWF3Y201eXpYOGJ2?=
 =?utf-8?B?YWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e79568-a9d4-4725-f661-08dc2cdfbf32
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:04:27.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PH9Tu7mMFOoehzT/RV/RMx/g9ZR1Hhx3c8haw93x7BuV7xH4FBMmFOhs8qTtQ0lDTgazSGwsdTdPOkFGw3XN2YCs4/HG91QQsbw8/Yn1PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5412
X-Proofpoint-ORIG-GUID: wrrzJWK5rbkcFfzzgNOtVbF4H_aa6BLc
X-Proofpoint-GUID: wrrzJWK5rbkcFfzzgNOtVbF4H_aa6BLc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_14,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402130174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195437

--------------yJc02MM104GZJjwgLA5G1Fg5
Content-Type: multipart/alternative;
 boundary="------------j4rc7JcMVr7fvqyRwW0xYVAW"

--------------j4rc7JcMVr7fvqyRwW0xYVAW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41DI7T1t003837

Re-send to use the correct email addres for Umesh.

On 2024-02-12 6:00 a.m., Deepthi.Hemraj@windriver.com wrote:
> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>
> The issue address-sanitizer check failure arises when attempting to run=
 a testcase compiled with AddressSanitizer on RISC-V 64 systems using the=
 SV48 and SV57 virtual address scheme.
> This error occurs due to the lack of support for SV48 and SV57 in ASAN,=
 which was originally designed for SV39 in Riscv64 architecture.
> This patch disables SV48 and SV57 support in QEMU and modifying the ker=
nel to use SV39 by default.


Deepthi,

Thanks for looking into the gcc-sanitizers feature for qemuriscv64.

I'm not sure if we want to make the qemu change that you have proposed an=
d
since no one else has replied, I've looped in Kevin and Raj who may be=20
able to
comment on the change.

Oh, in reading over the comments to the issue linked below, I see:
 =C2=A0 "As a temporary workaround for this problem"

so I really doubt we want to make this change. Changing thevirtual=20
address range for qemu is not to be undertaken lightly!

Let's see what we hear from Kevin, Raj and upstream qemu over the coming=20
week or two.

To me, this is a '(very) nice to have' feature not a 'must have feature'
so if we have to wait until after Yocto-5.0, that's fine.

> Upstream-Status: Backport [https://github.com/google/sanitizers/issues/=
1707]

s/Backport/Submitted/

as you have done below in the patch body.


Only commits merged to supported branches or master/main, should be=20
labelled as back-ports

Thanks,

../Randy

`

> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>   ...isable-sv48-sv57-support-for-riscv64.patch | 25 ++++++++++++++++++=
+
>   3 files changed, 28 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-=
support-for-riscv64.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipe=
s-devtools/gcc/gcc-sanitizers.inc
> index 524ebd4ba4..8c98e9cf8a 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 =3D " liblsan"
>   RRECOMMENDS:${PN}:append:x86-64 =3D " liblsan libtsan"
>   RRECOMMENDS:${PN}:append:powerpc64 =3D " liblsan libtsan"
>   RRECOMMENDS:${PN}:append:aarch64 =3D " liblsan libtsan"
> +RRECOMMENDS:${PN}:append:riscv64 =3D " liblsan libtsan"
>  =20
>   do_package_write_ipk[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFI=
X}compilerlibs:do_packagedata"
>   do_package_write_deb[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFI=
X}compilerlibs:do_packagedata"
>   do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFI=
X}compilerlibs:do_packagedata"
>  =20
>   # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are su=
pported
> -COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loong=
arch64).*-linux'
> +COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loong=
arch64|riscv64).*-linux'
>   # musl is currently broken entirely
>   COMPATIBLE_HOST:libc-musl =3D 'null'
>  =20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> index 2a81870151..56c988e7fd 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -36,6 +36,7 @@ SRC_URI =3D"https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \ file://fix_segv.patch=20
> \ file://qemu-guest-agent.init \ file://qemu-guest-agent.udev \ +=20
> file://disable-sv48-sv57-support-for-riscv64.patch \ "
>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  =20
> diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-=
for-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-sup=
port-for-riscv64.patch
> new file mode 100644
> index 0000000000..7f3eab1463
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-ris=
cv64.patch
> @@ -0,0 +1,25 @@
> +From: Deepthi Hemraj
> +Date: thur, 18 jan 2024 17:52:45
> +Subject: disable-sv48-sv57-support-for-riscv64
> +
> +Disabling  48 & 57 bit virtual memory address in a RISC-V program, whi=
le the system's upper address limit resembles that of a 39-bit address sp=
ace.
> +This signals a lack of support for the 48 & 57 bit virtual address spa=
ce on RISC-V; only the SV39 scheme is supported.
> +
> +Upstream-Status: Submitted [https://github.com/google/sanitizers/issue=
s/1707]
> +Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
> +
> +---
> +
> +diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> +--- a/target/riscv/csr.c
> ++++ b/target/riscv/csr.c
> +@@ -1178,7 +1178,7 @@ const bool valid_vm_1_10_64[16] =3D {
> +     [VM_1_10_MBARE] =3D true,
> +     [VM_1_10_SV39] =3D true,
> +-    [VM_1_10_SV48] =3D true,
> +-    [VM_1_10_SV57] =3D true
> ++    [VM_1_10_SV48] =3D false,
> ++    [VM_1_10_SV57] =3D false
> + };
> +
> + /* Machine Information Registers */


--=20
# Randy MacLeod
# Wind River Linux

--------------j4rc7JcMVr7fvqyRwW0xYVAW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Re-send to use the correct email addres
      for Umesh.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2024-02-12 6:00 a.m., <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:Deepthi.Hemraj@windriver.com" moz-do-not-send="true">Deepthi.Hemraj@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240212110000.1687187-1-Deepthi.Hemraj@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

The issue address-sanitizer check failure arises when attempting to run a testcase compiled with AddressSanitizer on RISC-V 64 systems using the SV48 and SV57 virtual address scheme.
This error occurs due to the lack of support for SV48 and SV57 in ASAN, which was originally designed for SV39 in Riscv64 architecture.
This patch disables SV48 and SV57 support in QEMU and modifying the kernel to use SV39 by default.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Deepthi,</p>
    <p>Thanks for looking into the gcc-sanitizers feature for
      qemuriscv64.</p>
    <p>I'm not sure if we want to make the qemu change that you have
      proposed and<br>
      since no one else has replied, I've looped in Kevin and Raj who
      may be able to<br>
      comment on the change.</p>
    <p>Oh, in reading over the comments to the issue linked below, I
      see:<br>
      &nbsp; &quot;As a temporary workaround for this problem&quot;&nbsp;</p>
    <p>so I really doubt we want to make this change. Changing the<span style="white-space: pre-wrap"> virtual address range for qemu is
not to be undertaken lightly!
</span></p>
    <p>Let's see what we hear from Kevin, Raj and upstream qemu over the
      coming week or two.<br>
    </p>
    <p>To me, this is a '(very) nice to have' feature not a 'must have
      feature' <br>
      so if we have to wait until after Yocto-5.0, that's fine.<br>
    </p>
    <blockquote type="cite" cite="mid:20240212110000.1687187-1-Deepthi.Hemraj@windriver.com">
      <pre class="moz-quote-pre" wrap="">Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/google/sanitizers/issues/1707">https://github.com/google/sanitizers/issues/1707</a>]</pre>
    </blockquote>
    <p>s/Backport/Submitted/</p>
    <p>as you have done below in the patch body.</p>
    <p><br>
    </p>
    <p>Only commits merged to supported branches or master/main, should
      be labelled as back-ports <br>
    </p>
    <p>Thanks,<br>
    </p>
    <p>../Randy</p>
    <p>`<br>
    </p>
    <blockquote type="cite" cite="mid:20240212110000.1687187-1-Deepthi.Hemraj@windriver.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...isable-sv48-sv57-support-for-riscv64.patch | 25 +++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 524ebd4ba4..8c98e9cf8a 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 = &quot; liblsan&quot;
 RRECOMMENDS:${PN}:append:x86-64 = &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:powerpc64 = &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:aarch64 = &quot; liblsan libtsan&quot;
+RRECOMMENDS:${PN}:append:riscv64 = &quot; liblsan libtsan&quot;
 
 do_package_write_ipk[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 do_package_write_deb[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 do_package_write_rpm[depends] += &quot;virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata&quot;
 
 # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are supported
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64|riscv64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST:libc-musl = 'null'
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2a81870151..56c988e7fd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://download.qemu.org/${BPN}-${PV}.tar.xz\file://fix_segv.patch\file://qemu-guest-agent.init\file://qemu-guest-agent.udev\+file://disable-sv48-sv57-support-for-riscv64.patch\">&quot;https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://fix_segv.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+	   file://disable-sv48-sv57-support-for-riscv64.patch \
            &quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quot;
 
diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch
new file mode 100644
index 0000000000..7f3eab1463
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv64.patch
@@ -0,0 +1,25 @@
+From: Deepthi Hemraj
+Date: thur, 18 jan 2024 17:52:45
+Subject: disable-sv48-sv57-support-for-riscv64 
+
+Disabling  48 &amp; 57 bit virtual memory address in a RISC-V program, while the system's upper address limit resembles that of a 39-bit address space. 
+This signals a lack of support for the 48 &amp; 57 bit virtual address space on RISC-V; only the SV39 scheme is supported.
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/google/sanitizers/issues/1707">https://github.com/google/sanitizers/issues/1707</a>]
+Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
+
+---
+
+diff --git a/target/riscv/csr.c b/target/riscv/csr.c
+--- a/target/riscv/csr.c
++++ b/target/riscv/csr.c
+@@ -1178,7 +1178,7 @@ const bool valid_vm_1_10_64[16] = {
+     [VM_1_10_MBARE] = true,
+     [VM_1_10_SV39] = true,
+-    [VM_1_10_SV48] = true,
+-    [VM_1_10_SV57] = true
++    [VM_1_10_SV48] = false,
++    [VM_1_10_SV57] = false
+ };
+ 
+ /* Machine Information Registers */
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------j4rc7JcMVr7fvqyRwW0xYVAW--

--------------yJc02MM104GZJjwgLA5G1Fg5
Content-Type: text/plain; charset=UTF-8; name="Attached Message Part"
Content-Disposition: attachment; filename="Attached Message Part"
Content-Transfer-Encoding: base64

Ci09LT0tPS09LT0tPS09LT0tPS09LT0tCkxpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMg
c2VudCB0byB0aGlzIGdyb3VwLgpWaWV3L1JlcGx5IE9ubGluZSAoIzE5NTM1OSk6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTk1MzU5
Ck11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwNDMw
OTIwOC8zNjE2NzY1Ckdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnClVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcmFuZHkubWFjbGVvZEB3aW5kcml2ZXIuY29t
XQotPS09LT0tPS09LT0tPS09LT0tPS09LQoKCg==

--------------yJc02MM104GZJjwgLA5G1Fg5--

