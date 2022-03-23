Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B85C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 15:57:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.11160.1648051038122206328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 08:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=U6wHyxdf;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0081728ad4=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22NDeWwp014831
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 15:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=oTPiEVbDxRweFCgI/t8mDoPPZKylUb4wJp7xvbRvMOo=;
 b=U6wHyxdfLwbK64wtQL35ooS4Bbr7+Xs9Z8/ianfh2gV/JlxD0ET7FwABhM/+pQvOcHJg
 dWDGGW/QclrLsmHk+j1NFZtlycSthlTl/CVO+9r0jSF9JERF6Kcvq23WE5NOKRRJ64XB
 xeXTVggf3w+CIY+S68QzBPBrnT6ZvbkWWy5Pcr9reJil5XISTbS8RExdlzBjrs/DWdGS
 vtTnaIYlIw36TcsZvl8Gi8+X6HP22Uw8/AOy8/Kr5sh6ndniz8Vi4Jowb9reMHOsIhE3
 JLT74UWFddfwHsvGlHmFzAW4pSyhebZkXXOISZpxQjB2qepFykHkeV7NMxYzYdfO4JlT uw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew4d03mj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 15:57:16 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 22NFvGqK015999
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 15:57:16 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew4d03mj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Mar 2022 15:57:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajX0fwPP9PlHMt8ejhWu/Q6lvqyunId4fE6Af6t+sDLDmmbMcY0Aox/FY9SRA7lNPkL2NQhyypP0xaehHA03Dn+8+RQ8jJ2YWJ/CqcCHqdeNKWSXVWvOiWSiY+SUA2LqWJ9bjBuziQN0LbQW4bzI0pWFKS+ItBHzkXpKVrO4M/S0IngK7I2VjbhXtlJWJm5mWdk+T/9/3G2q6Bg2dlUWjW0UT2GDvYItijOvoS2azpHagHJHRzVUxh9jEkrq9ravdoPNAvtTL2t+NNCkYK1AplhIQFX2ISso3RlWC2UjUhm8aWuRaildA/cVIY8UVG87tZgHDcSFe3DF+PSu2bIPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTPiEVbDxRweFCgI/t8mDoPPZKylUb4wJp7xvbRvMOo=;
 b=g4giOp6ki1t/zQL9hoPCnEPyLOIXrUVWMuCyd0D9CvmM1Zvub70J1HKdhG+Wwoy6HLbmxW9P4FDstvLYXqR/aYWp5cfq1Gud/SxDvF+YQeVbgRMg30r/Q8ta4AdjxUb32H7wD8wKZhUfIIUbFjCKE8JgmNiCUF78WCrt8TJGP7hj2pujrsO69CQlS6q9FGzHCDfp9vM9uKp3Xzob1zegppe1kFMTT+35v+yCFoLwZkxr5Qm6qvEQ0pDD8HbE56JphbQx57WaINL+6+ffaoCTF1kSnLOS2me98hZ2e08SLJH4MUlh65HXsPkn+xUKFxvXFCRhK1SbKRc1wTmX8SUbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BL0PR11MB3153.namprd11.prod.outlook.com (2603:10b6:208:6b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 15:57:13 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91%5]) with mapi id 15.20.5081.022; Wed, 23 Mar 2022
 15:57:13 +0000
Message-ID: <bb61d16a-ffb8-3543-17fc-82a72c8155e6@windriver.com>
Date: Wed, 23 Mar 2022 11:57:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [rust] error: the crate panic_abort does not have the
 panic strategy abort
Content-Language: en-CA
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Francesco Pham <pham.francesco@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: 
 <CAL1ChxrincK92a9tFxq=O6j8wNpccdebywqoeYMS+He1ED4tTA@mail.gmail.com>
 <CANNYZj_z2RsfGLaAaJHEBb+P5JT3CNikobgrq00FW9fkGH6UgQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CANNYZj_z2RsfGLaAaJHEBb+P5JT3CNikobgrq00FW9fkGH6UgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PH0PR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:510:4::17) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0489d2eb-fa1b-4a19-2f9b-08da0ce5cb84
X-MS-TrafficTypeDiagnostic: BL0PR11MB3153:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB315333F6C0566FA32F0F6F69F8189@BL0PR11MB3153.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vKpQVc3DVp9Fe7+LiFW/aIvfaDj6jcMmYLYTVT5/cVPQosGUdRDhACHog29wZVgPl2T9UsEVjysixXhRIh8W7P10kRUCDEwm/3faOBAEmTnELoaNFsuGrcoJdYssIfys/CCg2QzDv4w5Mx6xPVDibdQgoQlPEbr/9xEMd0xqZYi7cMxnrvu5UYk+Jiah1KgvbcUQRFkvuHt1QmyUdDcQRKUPfevDnrK6hHy1ae3yXYJn5sWydhW+xBEMS1Kp7wo0R7OYscEbCkdB8t552jJ8LoQYXVPOrkCFoW3Pp6nN3Yym7nM+iKIdV/3DQUVY4LeUvnWw9c0T7YdAPruDgFZg7gXxyN14qKXaz64D5JTQ0XDdykBN4xzNVPsAg6zLS8Bc1/y4EVMFCNG2p5u3da//4WzYcq4oXx/ZZnwuiLz4VRZSiVFvw4AmVBJyeUDnJXZqGflHbPiwNJqFWdZBGUasNo/4cHchNQVEOJg2pcUvbKBtG9ezKQUOyKximPCczTuZ8MoC9DUFB0lComNJ8aRGA0ZLfS+nEPs/3TQ37ZLOYXOmsViqfZDo3zV6s1qOsADi0+uUr3V8W6qq12giCFjrIIHrxv0c4RYyxMkbAFVXW6TIWBv7Xlb4WHWZ6/aNGUAmojl72jX2pa17LM2uOVxA45/Bg5ilejSVlPX2XNt/xKi8BRmPY+yMWLwtR1LrAC/3GvpcEdE6u6N5iQNDtig8Nyb6VK2wZjA9G3O7R1Ywu6703KtDF86LbtB4BdHJ/pO4qrt3QuB5s5Lamr1YUodhYPNSDjpdwPYRXU3uzwpcLcIIZ/FTPjcYsUxHrXxLCyIq3geDYCGoUS/hwBVwvflnr5iS3OK4TcVP0eJT1i+yfVgSVzeH7ej366YrqsFoJkso
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(86362001)(31696002)(110136005)(2616005)(53546011)(508600001)(52116002)(186003)(83380400001)(26005)(316002)(31686004)(5660300002)(8936002)(6506007)(4326008)(6512007)(6666004)(8676002)(66946007)(66476007)(66556008)(38350700002)(6486002)(38100700002)(966005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmhCaHkrdnBYd3o1QkVkdHNhVlBQc05KenNkNitvR2cxSXFBdTFyRHJxNzhi?=
 =?utf-8?B?SDNaNEhkOHhqbzVxT1NkcmJCa3BGbEpyTzl2OGkzaytnZThBbG1QaWR6R3Ir?=
 =?utf-8?B?L1pQeVh5dEdzZ2xoVmRhczJvRGdaQ1VTb284UVVNSC94a1lpVnQ4MVhmeDM3?=
 =?utf-8?B?dHJxOWV3T0orM0dnYXRYakI4SldHU0t3Z1E5dXdnUGtRZUNGd2thMGl1LzZZ?=
 =?utf-8?B?dDlXSndHSDUySEtUZlRkdjRjK0xFWVI2blZKZllvUExTNm5CTkl6R1VDNDV4?=
 =?utf-8?B?UkRXOFowTnhFQmhwYlArQU1zYjRRdjk5MWlhMkxKak5zUnRlWVpKbHpyZTY1?=
 =?utf-8?B?cTBLWmFHTzNoOERZTGNDQ0hrK3NaRFNhcUdOc29CTkZnc1FseEg0V2RSRnJo?=
 =?utf-8?B?QlBmNXpJMEQzNW1adjFHV3FuSU5XaEpqaDlIQ3QwMFRBSEowbXFVQ1d2Mld2?=
 =?utf-8?B?SkFCbFJqcStrNWh1Y2t0cTBDY1pkV0dJcDc3ZlhmZlNpOEtXdzMrcHZVbzFp?=
 =?utf-8?B?c1lOZ0ZSUXBaRjJaK3grRmhXcm91Q1hUSlJpVEJGT3VuOGl1UFk0TDRaS0Vv?=
 =?utf-8?B?UWR1c0I5RWw2THRJa3dnWkJ5Q0NnaFRwWW1UZmpCcng1MHFOcnpuc1FIVFhE?=
 =?utf-8?B?bHRXQnFHUG10bVpJemFxSG9mMnVOQyswTG94dnR4QUJ3M2VjcEE0NEFxT3hP?=
 =?utf-8?B?bHlLK3B1dXNtdzE3MktrRml5UnhMYTF3QzZSN0ZPSHI2K1hKbEh1Snowek1s?=
 =?utf-8?B?ZlcrWVlrMndNTnk3cUtta1FEaW9JZm9tU1k4REJiV3RjSDI2RmkvcEgvem1t?=
 =?utf-8?B?cFpNU3FoMmpiaWRXQWwwN3JRUUZINHRndHNqMG15cW1GRDNQcjM1enJ4Wjc0?=
 =?utf-8?B?dDROSnVuZEcyVk9ETHpjby9MTEVJdjk2T2R5Z1VZbTY0NFdBYjRuclpHWUht?=
 =?utf-8?B?bWpOZVNpU3Z2WEY4QjNTMS9weXBkUDVpeFo5WmRETXRGUEs5cmZPMmhiUHh3?=
 =?utf-8?B?S2Vpa0xzRThtT2crSm1NaVVIM2Fxa3QvTHhnemVYN2c0M3FCY09wdmpqaSs2?=
 =?utf-8?B?VVVNd2wxM0t0YVEyU3U5cjJtUk5VYjJ4ODNQTkVnN2pIMDlQS1R1cVJpcU5Y?=
 =?utf-8?B?ME03Zm8vektxL2FFNW1aMVpUUzFiZy8zOTBRMjI3S0FWM3pNd2t6R2s1NGFj?=
 =?utf-8?B?OVNFelZMYW93ekkybnpXdmJwYm5WYWxkT3VRNGIxNDZmYkJMMkk1MkhHMERY?=
 =?utf-8?B?aXJWUlFidVhQdFRVR3ZlZ1Z0dFV0RXBFRW5tenF3MndlQkR6MmxLL2VVWU9W?=
 =?utf-8?B?TlFHdGlzdVF2OU1SNzJYdWdValZ3TU9iVjdxSFVMY0RtQ0UvNnNpRUVoZzVL?=
 =?utf-8?B?Vjk0UGp6QWg2OEtJUGs2ajFNY0tWb20vTk1wZjNra2hQcjhLUytRdGR6cXAr?=
 =?utf-8?B?YlhOREN1N0N4emdQcnFub0tlQzFVWnZIc2hEWU9kR1BhalpiUkZTd1VJYmM5?=
 =?utf-8?B?TnpMSVZUendtdiszSGswdzEzQU9GSnhDQlJpd2hsWnNVVDg1R3VtVTNKdDhr?=
 =?utf-8?B?ZEdncmVrbUU2QTY3R1krYzlITVRwZlNNRi9VWnZzR0I4SHZ6b1pkMUdoUDli?=
 =?utf-8?B?cmU3d1Uxa2FOY3VoUEdJUmg3K0lzR0hpZzIrWXhSSVRvTitpRmhvWElTMGJo?=
 =?utf-8?B?bm9laEtPS3hEdHdTYks2TS9KdXZKQ1FoUGpmdHd0VjFiU1NNNWZZL21rd1RF?=
 =?utf-8?B?S1BOT01Pamk2K0xnODMzemhITFFuUE1uYUhGUTUzZ1pTODZFVldQRm9EOThx?=
 =?utf-8?B?bFVGUGZ0a1JlRmVYOWlRQWJET01Ob2t2aWVVUHhMUHdrSlpRNzVnNmN6M3lz?=
 =?utf-8?B?OFppMDRBbENadnk1SDdKdWdTSXFyd3NBTCtMTlExWU9heU1SV1N4ZDhod25Q?=
 =?utf-8?B?SmNZWVNvb0VSVXJQZEJnSFRTTjhqK1paTmZpQTZBeGVxY1JjbjY4K3ViZGZL?=
 =?utf-8?B?TVVOc0ZUUzFBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0489d2eb-fa1b-4a19-2f9b-08da0ce5cb84
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 15:57:12.9547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0PJRd8uCuU8MhJj606CMi0KTNVREh7oMlMd3muDg0/LLYRbbUvgaMcWWsxwzKv8+MF03UN306mPQiWHyhPWWHfTB8jUi9IZLn6UKhlNhSjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3153
X-Proofpoint-GUID: Urw7WAqx_Ul3AhNnVIo57pbV_p2wbvlN
X-Proofpoint-ORIG-GUID: A6sQmltI2rAdUhMh7L1Gh3SPlZdZ9Uyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_07,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=853 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230085
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 22NDeWwp014831
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 15:57:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163586

On 2022-01-14 09:42, Alexander Kanavin wrote:
> Perhaps you could look at how this is handled in mozjs recipe in=20
> meta-oe, I vaguely remember it forces panic strategy to something=20
> incompatible and I patched it to match..
>=20
> Alex

Francesco,

Did looking at the mozjs recipe help?

Maybe you can summarize here for anyone who has a similar issue and
finds this thread.

../Randy

>=20
> On Fri, 14 Jan 2022 at 15:21, Francesco Pham <pham.francesco@gmail.com=20
> <mailto:pham.francesco@gmail.com>> wrote:
>=20
>     Hi,
>     the following error appears when trying to build a simple rust hell=
o
>     world that uses panic set to abort mode.
>=20
>      > | DEBUG: Executing shell function do_compile
>      > | NOTE: cargo =3D
>     /home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rus=
t-panic-test/git-r0/recipe-sysroot-native/usr/bin/cargo
>      > | NOTE: rustc =3D
>      > | NOTE: cargo build -v --target x86_64-poky-linux --release
>     --manifest-path=3D/home/francesco/Desktop/poky/build/tmp/work/core2=
-64-poky-linux/rust-panic-test/git-r0/git//Cargo.toml
>      > |=C2=A0 =C2=A0 Compiling rust-hello-world v0.0.1
>     (/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/ru=
st-panic-test/git-r0/git)
>      > |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 0=
/1:
>     rust-hello-world(bin)
>      > |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name rust_hello_wor=
ld
>     --edition=3D2018 src/main.rs
>     <http://main.rs>
>     --error-format=3Djson --json=3Ddiagnostic-rendered-ansi --crate-typ=
e bin
>     --emit=3Ddep-info,link -C opt-level=3D3 -C panic=3Dabort -C lto -C
>     metadata=3D38cc6f415494c65c -C extra-filename=3D-38cc6f415494c65c
>     --out-dir
>     /home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rus=
t-panic-test/git-r0/build/target/x86_64-poky-linux/release/deps
>     --target x86_64-poky-linux -C
>     linker=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-=
linux/rust-panic-test/git-r0/wrapper/target-rust-ccld
>     -L
>     dependency=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-p=
oky-linux/rust-panic-test/git-r0/build/target/x86_64-poky-linux/release/d=
eps
>     -L
>     dependency=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-p=
oky-linux/rust-panic-test/git-r0/build/target/release/deps
>     -L
>     /home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rus=
t-panic-test/git-r0/recipe-sysroot/usr/lib/rust
>     --remap-path-prefix=3D/home/francesco/Desktop/poky/build/tmp/work/c=
ore2-64-poky-linux/rust-panic-test/git-r0=3D/usr/src/debug/rust-panic-tes=
t/git-r0`
>      > | error: the crate `panic_abort` does not have the panic strateg=
y
>     `abort`
>      > |
>      > | error: aborting due to previous error
>      > |
>      > | error: could not compile `rust-hello-world`
>      > |
>      > | Caused by:
>      > |=C2=A0 =C2=A0process didn't exit successfully: `rustc --crate-n=
ame
>     rust_hello_world --edition=3D2018 src/main.rs
>     <http://main.rs>
>     --error-format=3Djson --json=3Ddiagnostic-rendered-ansi --crate-typ=
e bin
>     --emit=3Ddep-info,link -C opt-level=3D3 -C panic=3Dabort -C lto -C
>     metadata=3D38cc6f415494c65c -C extra-filename=3D-38cc6f415494c65c
>     --out-dir
>     /home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rus=
t-panic-test/git-r0/build/target/x86_64-poky-linux/release/deps
>     --target x86_64-poky-linux -C
>     linker=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-=
linux/rust-panic-test/git-r0/wrapper/target-rust-ccld
>     -L
>     dependency=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-p=
oky-linux/rust-panic-test/git-r0/build/target/x86_64-poky-linux/release/d=
eps
>     -L
>     dependency=3D/home/francesco/Desktop/poky/build/tmp/work/core2-64-p=
oky-linux/rust-panic-test/git-r0/build/target/release/deps
>     -L
>     /home/francesco/Desktop/poky/build/tmp/work/core2-64-poky-linux/rus=
t-panic-test/git-r0/recipe-sysroot/usr/lib/rust
>     --remap-path-prefix=3D/home/francesco/Desktop/poky/build/tmp/work/c=
ore2-64-poky-linux/rust-panic-test/git-r0=3D/usr/src/debug/rust-panic-tes=
t/git-r0`
>     (exit status: 1)
>      > | WARNING: exit code 101 from a shell command.
>=20
>     A similar error also appears when the panic strategy is set to unwi=
nd
>     The recipe, generated using cargo bitbake, is as follows:
>=20
>      > inherit cargo
>      > SRC_URI +=3D
>     "git://git@github.com/frankplus/rust-hello-world.git;protocol=3Dhtt=
ps;branch=3Dmaster
>     <https://urldefense.com/v3/__http://git@github.com/frankplus/rust-h=
ello-world.git;protocol=3Dhttps;branch=3Dmaster__;!!AjveYdw8EvQ!O6m7kT4SK=
IB2etM325d3xV_J7Qj-NTnCCEFkV6LpAdckc3pCtFlvYTiGn6SXpv9qX_W32g$>"
>      > SRCREV =3D "68b7f7ee7df6e08a0411ba7157761145c43baf5d"
>      > S =3D "${WORKDIR}/git"
>      > SUMMARY =3D "rust-hello-world"
>      > HOMEPAGE =3D "https://github.com/frankplus/rust-hello-world
>     <https://urldefense.com/v3/__https://github.com/frankplus/rust-hell=
o-world__;!!AjveYdw8EvQ!O6m7kT4SKIB2etM325d3xV_J7Qj-NTnCCEFkV6LpAdckc3pCt=
FlvYTiGn6SXpv_KuXxrfQ$>"
>      > LICENSE =3D "MIT | Apache-2.0"
>      > LIC_FILES_CHKSUM =3D
>     "file://COPYRIGHT;md5=3De6b2207ac3740d2d01141c49208c2147"
>=20
>     Version: honister @ f286eef, master @ f9f3e1
>     Component: meta/recipes-devtools/rust
>     Relate-to: https://github.com/meta-rust/meta-rust/issues/343
>     <https://urldefense.com/v3/__https://github.com/meta-rust/meta-rust=
/issues/343__;!!AjveYdw8EvQ!O6m7kT4SKIB2etM325d3xV_J7Qj-NTnCCEFkV6LpAdckc=
3pCtFlvYTiGn6SXpv-aGWv17w$>
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160570): https://lists.openembedded.org/g/openembed=
ded-core/message/160570
> Mute This Topic: https://lists.openembedded.org/mt/88421290/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
# Randy MacLeod
# Wind River Linux


