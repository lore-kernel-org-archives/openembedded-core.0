Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D930AC47DD3
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 00:58:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.62466.1705885106996212496
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 16:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=DfSUhSeD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1751debd67=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M0kPux005267
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 00:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=amouCrP7M2ZabvqUEU2
	5Bzf8HOAxT6nKs8YNbanmdgI=; b=DfSUhSeDImhQwAiM0/eXqh1PhTes6TyL2ao
	Y0cycrNCokIg4VqruH8TfNYxRLGTotUHPfdgwJpzjg0JnTYGbkJ3znP2cVQEv71m
	bRzjbhcTSftFtNneDTLIObyeo2m993CnqSpVu48qX8i/F+tfAYGelf3WDeTIGFlV
	jeJMAxN5PaV/GhW++uEh+5wO8Y+ghRMU4eMljz7ChhXhqJg78SyT2Ja7gjkT+FDX
	QpDLYwxPJxz76PdPxs00GZNnMbFYl8qe2KfMibQ35tbAjHOKqUl19Jz/drbipnIY
	GgGcBI+DB0yX+td6YvqRG9itf2SBdGDYUwBuYo6AhotDAqNHCzw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5571cqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 00:58:25 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40M0wPIM019105;
	Mon, 22 Jan 2024 00:58:25 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5571cqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 00:58:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+KVyXs8DT1LE3b1cVt+Egn4dVwRR177o18sYUNe4HpVwO4fHti/JYTyAXfGaLDUysznGa7Bq6EfpZkqayPw93VDrDAc5LIPECS7lhNrcKvsft3abVgW8wJ0hcp3X/VTUNZxRPL6sqNVbgVWH90oKyDJdd7rpZzk86q0gjV88DaMPEmLCPMsVsM++Gcp/Y3802oiBsIFwa/B9IeNg1QhVCkW0NEcmECGbPbgwCf0U8kSZxlhKNiIdaJqlKhmcW636mCLlro6tiqgwYALNCGtWGCdDWFPYTEaX5MiAnzcpUL8a11K9Z9WqU91C3kVRkTMdi79h3uGZpf+WSWVuRPMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amouCrP7M2ZabvqUEU25Bzf8HOAxT6nKs8YNbanmdgI=;
 b=b5xORtqXwjUNFEuPPVWtRF4jagfZXPyauKQ3BYEB0kFTb3ZfgHyLFlJYYjQpu1x8UK2W1wwuUoK+4RXlK2X/53ydDCgE9ocggYaOr75WkInhvus/1EXHPgjgI1CWQEImd1/6U7hVJ0FcrNU2p4Hs1iEJFMSZdBEMwR49D6882T6A15frEX01MmDo4ZPuxjBc2FddwwFApphvLYk2hUlN3fzu7pluhBVT1efffNDx+5EnF8p/KWCb6J+yK5jqRoKxfl4ThtSUTcwq+tC1Ya9d6FLg9JdI/EL6koPtQgOwfSNry0bxrtJD8t/UUdodpxGmRQo6VwjJiSU+jeye8+oxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV3PR11MB8580.namprd11.prod.outlook.com (2603:10b6:408:1ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 00:58:23 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::494:39a4:56fb:9861]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::494:39a4:56fb:9861%4]) with mapi id 15.20.7202.028; Mon, 22 Jan 2024
 00:58:23 +0000
Content-Type: multipart/alternative;
 boundary="------------muGywf0eeLmHwxYmjHXGZqCS"
Message-ID: <44133af7-6afb-459e-bc29-8c3d1419e9a9@windriver.com>
Date: Mon, 22 Jan 2024 08:58:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] tcmode-default.inc: use ?= to set
 PREFERRED_VERSION_llvm/llvm-native/nativesdk-llvm
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240119073509.934362-1-changqing.li@windriver.com>
 <CA+chaQdSeJ7jG4Q23RRxyOOS3g4NRieeGOkNJbmJiAs7NAWFfQ@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CA+chaQdSeJ7jG4Q23RRxyOOS3g4NRieeGOkNJbmJiAs7NAWFfQ@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV3PR11MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: b1e72a20-22b1-4ae3-4856-08dc1ae53bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QS24WfUuuqNFM4yTcJxUaIwPwDqvh+N0WNNsRWlX8SDh7aFIdXuVOL026mrRFT1MTOe7eR61mEG0KFY9MPwGKM12ZyktJPVPZ+/hv43HwBTxsf1vxTKOqV/xehp1Y0ZsRcAXnKsZqr9jT9oMstBX5uYv9J2+U4qOVRJqqXlKgz2fdWjDWuycsUxpo78Cx8xmrUDIif9YuX1EKL2fcsiinxFWmsbtqR89Uk6yTbdI9DmyiVejZVQFWW7jKPx+OMyZKvOqfmh0qrvikBNCsp5dQtGma9Jsjz+lJBXQU8hj/2xAhkcBuIwTBnL/lZpZP0JFTTKqafV3NsxokhbNJX1ugkTGuvowAZjSPY7H5x5gXWTJb5+53YTkoXFrFETFltlDI6IuaxU13hnHWrW79SC6B3IoO8+8QI4+HYSxPvrdvRHrk2GGOuKvw1kjl4iuUZgR40zRH1HoOVZj/54s8cWvTOHB4X2+ftmYeB0PBVGPEdptOlSexYSumaKNqSTG2BaY5e0lZdV0MZ9SxscCfMssusIfO9OQ/UxwzNNpoDsHrorDf/UHCA9wrBRCAR3PqYmb+uNvzLSozaH3kQgI+/N35Bm9yGdpnRbIZFypkfc2Qe76KnUCJSgEYAk3/xHOeVCZuE++6VQwwU0M9h7HtL1sf36UjqpNxmsUzWWA8gQ7si/VYOVGMlTsfheI/3D49DUx8ird0EMA0nDfvcmrkVDMkg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39840400004)(230922051799003)(230173577357003)(230273577357003)(1800799012)(64100799003)(186009)(451199024)(66899024)(41300700001)(36756003)(31696002)(86362001)(38100700002)(166002)(83380400001)(478600001)(6506007)(33964004)(8676002)(8936002)(4326008)(6512007)(316002)(6486002)(966005)(66946007)(66556008)(66476007)(110136005)(5660300002)(26005)(2906002)(53546011)(2616005)(44832011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aUZsVnJhM0haVE9Pc0pmK0N1YTExYkhFc2xDeFlXSUdpbjRSTVliaksxNWtJ?=
 =?utf-8?B?akErTER0Rno1and6VFFOa0tWeEh4YVBmVkFhdTFKWVZuOTZzQXcrUUpIeG90?=
 =?utf-8?B?cnhxdkxHSFYzS1FrL21nUFFmWGNYNGJwUnZYNklTcEU4RW9LdXJDZHpwR3RF?=
 =?utf-8?B?Z1h6aDRJYUdqelhYb0ZzcnFlMHFXaUM3UExTNXpsTlB5Ti9mL3JvemVXVUNG?=
 =?utf-8?B?ZDZwZFdONVZuQkVIcjRiUUFpVVREdVQweFJ0SDgzdDY4emREZnlXRWVWTVFD?=
 =?utf-8?B?TE1uN3d2eWh3QW5LRGZKOXFHcVJ0L1cra0M2TTBUcXFvOVpXblordG4yNkx1?=
 =?utf-8?B?dGhlL0wrR2piSklGem5ia1ZyTnkvK3JVdXN0UzBJc2E4T29GYUkrRUhsOW9w?=
 =?utf-8?B?bHV0b1JLT0lEZ2FZT0tIbk45NEtoVnJvM0tqUDEzUkdXTkJKTk8rSFdiVEFW?=
 =?utf-8?B?YkJ2VGVkN1NrNmJHSElTSUVRdTUzVzRtMVo1ckIrVzhnN1lkMWtEVGowT0t2?=
 =?utf-8?B?WjBuUVk1a3NXUzFhNmVjQWkvdUY3aVdlK05zYWRSTjhpZU4yTW0waXFzREtE?=
 =?utf-8?B?Umt2TWV2cFBuV2x2c3V2S3U5WUlwNWFqTmVIbFJCY1dIRmZMd2VIbkdlVkRC?=
 =?utf-8?B?OFFRK2dZMkNZZk1ld0xDRVNhR1dsSm8zTXNTdjlHcFllK2RlMUIwR0VpRk8y?=
 =?utf-8?B?Ynd1N3pYcHR4bmp4L2NRR1R2dWhXL1Q4NzdyTjBoUkJjSnhvbWZ4NStNTkw0?=
 =?utf-8?B?L1ZoMTJQeUo1UEJBSVkvTnRUSm5BbGZLRUFlTjRKQ0VPbktITkhNQ2IrTVBq?=
 =?utf-8?B?ckUzSmpuT09uNEsxVjcybmpScWhwMnhzSTQ5UjdzcEZKOEc2a3dXODNkcjEr?=
 =?utf-8?B?L1VaM3VneTA3V0ZOV1FOZmI3dm5GcnIwVDlvd2FacnpwMEhtbGc4R1FrVVBx?=
 =?utf-8?B?UDd0OGJmNGVuRHB4MlNZYTIydU9TMWdIOTVTcUYyWEx0U0lUYzhmUUlyZk44?=
 =?utf-8?B?aGY3RlZxak1ZbDZZdzhQRDhQSnIxaGdTOHFPWWdFVjVIQUp5S3UycDZiTElo?=
 =?utf-8?B?ZVpWUzd6S1VRWWNkbFBLYUw5ZDVadENBOUZvdkw0RlBqempRek40SXdLaDVt?=
 =?utf-8?B?cnZmMC91eTIycjlzNUt3cUVTSjJlZW5HbTBORnhMdEtESDNnbHVXQ2ZNcnNP?=
 =?utf-8?B?a2x4R2grZ2FTWmxhWXk3Mi9Cb1hCMEVoVTcwbXhha1lid01vTHZUV3c0MnRa?=
 =?utf-8?B?ODdRVU0xQS9ncFMxUHFMMHZWRVpTZEtib2dTM2xOeDRmVGtHWDdnOGdqUlhz?=
 =?utf-8?B?NFk5bjNhcFliN1l1MWlEeEt0K0dYS2lvanVWeTg3ZFNGVG1wK2UwS3B2U0ox?=
 =?utf-8?B?NUZDbXRlYzRXQ1U4V2RhaGtyOGplNmk4b01jNnlQS3AzTGZDNkN6R2JGU0V6?=
 =?utf-8?B?OFZuMFZWNlEzWWcrbzVnTi9DVGM2KytUR2ZYQlo5Q2NGdUpMeVZQaE10bmM2?=
 =?utf-8?B?cXBZay9RQW9pcnNpYTFic3E0ek45dU1uaHFCVDAzTUI0LzlnR05pLzg1SFI1?=
 =?utf-8?B?djUzZnFVR21vaHJOeGJlNWh2djJ6VkVRNXlscW5yQzkxazVpcFVVUTFiZlIz?=
 =?utf-8?B?U21LblNPTWd1ZUJnWjZBM3BaMmdXV2ZkNG9OZU5iOExFMU5uS1NCQkdsWkpL?=
 =?utf-8?B?WGlwTUZoUUs0ZkJOdWtUOWlVNGdCZFBJd2ZuUldPNU1rV01pM050SlF3SDl5?=
 =?utf-8?B?S1crWW43TkRhY1hsZ2tSZWpWdzMrTXVjaDd1TXBCWGZlK0s3SFRqU1BUNmVE?=
 =?utf-8?B?K2hpNlhzNE1uY2hhSHIweUtYZE5sVFhZVkIveVhCdGFMekF6UThNT2NBNUtQ?=
 =?utf-8?B?TkdZbXJtdzREMURvbE9WQWxlUjZnSnUzdlBINnkyL2lZTkE5L3E1QTBQRjBW?=
 =?utf-8?B?ZFBjYndYT0g1RE0xZWtyZTlwZTVMVkpZelZzVCt5UmQ5ZUFoRW5ORlF4eEtF?=
 =?utf-8?B?eXI1Tk1Vd29DOTJVM2lzaExHcEZJSS9kdlJ0M0xaOXUydUpUZzNCKzlqbDh6?=
 =?utf-8?B?bHR0c2tsN1VZWWNXS2pXNXFPLzk1R0R3SEtSM1NweE1xQ3gzZzkvaFJEWDhV?=
 =?utf-8?B?ZGk4NVNrN3JZRHJ2SHdRZmZQYm1wUjRDNTh0R1oxUW9qL0FoY1o1N2V6bDV3?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e72a20-22b1-4ae3-4856-08dc1ae53bc7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 00:58:23.5401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YXKcATHvrVLSmxbLclW7EMCgrcFTDzQX2DZcJ3yILBT0CCxdl7FS98s4TUi9RVRb5O0MDRhO1cTYhCHE88uqyZ8Ek5SkuEoER02jyESS5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8580
X-Proofpoint-GUID: zTFREPcbz0MbLHic3NZ0-5_12KyUVDSM
X-Proofpoint-ORIG-GUID: SySxnw6WizRhbAool_yv2qHTBbGKhR1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=843 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 00:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194107

--------------muGywf0eeLmHwxYmjHXGZqCS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40M0kPux005267

Yes

On 1/19/24 19:57, Martin Jansa wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Do you need to override the=C2=A0 PREFERRED_VERSION_? instead of overri=
ding=20
> LLVMVERSION?
>
> Aren't you trying to fix what was fixed in proposed change a while ago:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230401163241=
.354257-1-Martin.Jansa@gmail.com/=20
> <https://urldefense.com/v3/__https://patchwork.yoctoproject.org/project=
/oe-core/patch/20230401163241.354257-1-Martin.Jansa@gmail.com/__;!!AjveYd=
w8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgd=
mAzzT-aah4fEExz_0nBedyN8m3FE$>
>
> On Fri, Jan 19, 2024 at 8:35=E2=80=AFAM Changqing Li=20
> <changqing.li@eng.windriver.com> wrote:
>
>     From: Changqing Li <changqing.li@windriver.com>
>
>     use ?=3D to set following configs in order to allow user
>     to override the default settings:
>     PREFERRED_VERSION_llvm
>     PREFERRED_VERSION_llvm-native
>     PREFERRED_VERSION_nativesdk-llvm
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     ---
>     =C2=A0meta/conf/distro/include/tcmode-default.inc
>     <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8=
EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmA=
zzT-aah4fEExz_0nBedwNSyZRE$>
>     | 6 +++---
>     =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>
>     diff --git a/meta/conf/distro/include/tcmode-default.inc
>     <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8=
EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmA=
zzT-aah4fEExz_0nBedwNSyZRE$>
>     b/meta/conf/distro/include/tcmode-default.inc
>     <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8=
EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmA=
zzT-aah4fEExz_0nBedwNSyZRE$>
>     index 3720a4c5b8..0de858d3af 100644
>     --- a/meta/conf/distro/include/tcmode-default.inc
>     <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8=
EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmA=
zzT-aah4fEExz_0nBedwNSyZRE$>
>     +++ b/meta/conf/distro/include/tcmode-default.inc
>     <https://urldefense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8=
EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmA=
zzT-aah4fEExz_0nBedwNSyZRE$>
>     @@ -77,9 +77,9 @@ PREFERRED_VERSION_go-runtime ?=3D "${GOVERSION}"
>     =C2=A0PREFERRED_VERSION_nativesdk-go ?=3D "${GOVERSION}"
>     =C2=A0PREFERRED_VERSION_nativesdk-go-runtime ?=3D "${GOVERSION}"
>
>     -PREFERRED_VERSION_llvm =3D "${LLVMVERSION}"
>     -PREFERRED_VERSION_llvm-native =3D "${LLVMVERSION}"
>     -PREFERRED_VERSION_nativesdk-llvm =3D "${LLVMVERSION}"
>     +PREFERRED_VERSION_llvm ?=3D "${LLVMVERSION}"
>     +PREFERRED_VERSION_llvm-native ?=3D "${LLVMVERSION}"
>     +PREFERRED_VERSION_nativesdk-llvm ?=3D "${LLVMVERSION}"
>
>     =C2=A0# Rust toolchain preferred versions:
>
>     --=20
>     2.25.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#194017):
>     https://lists.openembedded.org/g/openembedded-core/message/194017
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/194017__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3Gy=
kPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBednypl0Xw$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/103826050/3617156
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1038=
26050/3617156__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHK=
Z6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBed8jl75qI$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-=
fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBed3Rcbu4Y$>
>     [martin.jansa@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------muGywf0eeLmHwxYmjHXGZqCS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40M0kPux005267

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Yes<br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/19/24 19:57, Martin Jansa wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQdSeJ7jG4Q23RRxyOOS3g4NRi=
eeGOkNJbmJiAs7NAWFfQ@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">Do you need to override the&nbsp; PREFERRED_VERS=
ION_?
          instead of overriding LLVMVERSION?
          <div><br>
          </div>
          <div>Aren't you trying to fix what was fixed in proposed
            change a while ago:<br>
            <div><a href=3D"https://urldefense.com/v3/__https://patchwork=
.yoctoproject.org/project/oe-core/patch/20230401163241.354257-1-Martin.Ja=
nsa@gmail.com/__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJH=
KZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBedyN8m3FE$" moz-do-not-send=3D=
"true">https://patchwork.yoctoproject.org/project/oe-core/patch/202304011=
63241.354257-1-Martin.Jansa@gmail.com/</a></div>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 19, 2024 at
            8:35=E2=80=AFAM Changqing Li &lt;<a href=3D"mailto:changqing.=
li@eng.windriver.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-free=
text">changqing.li@eng.windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriv=
er.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">changqing.li@windriver.com</a>&gt;<br>
            <br>
            use ?=3D to set following configs in order to allow user<br>
            to override the default settings:<br>
            PREFERRED_VERSION_llvm<br>
            PREFERRED_VERSION_llvm-native<br>
            PREFERRED_VERSION_nativesdk-llvm<br>
            <br>
            Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.l=
i@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-=
txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;meta/conf/distro/include/<a href=3D"https://urldefense.=
com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZr=
odZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBedwNSyZRE=
$" moz-do-not-send=3D"true">tcmode-default.inc</a> | 6 +++---<br>
            &nbsp;1 file changed, 3 insertions(+), 3 deletions(-)<br>
            <br>
            diff --git a/meta/conf/distro/include/<a href=3D"https://urld=
efense.com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNt=
jfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBed=
wNSyZRE$" moz-do-not-send=3D"true">tcmode-default.inc</a>
            b/meta/conf/distro/include/<a href=3D"https://urldefense.com/=
v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY=
3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBedwNSyZRE$" m=
oz-do-not-send=3D"true">tcmode-default.inc</a><br>
            index 3720a4c5b8..0de858d3af 100644<br>
            --- a/meta/conf/distro/include/<a href=3D"https://urldefense.=
com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZr=
odZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBedwNSyZRE=
$" moz-do-not-send=3D"true">tcmode-default.inc</a><br>
            +++ b/meta/conf/distro/include/<a href=3D"https://urldefense.=
com/v3/__http://tcmode-default.inc__;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZr=
odZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_0nBedwNSyZRE=
$" moz-do-not-send=3D"true">tcmode-default.inc</a><br>
            @@ -77,9 +77,9 @@ PREFERRED_VERSION_go-runtime ?=3D
            &quot;${GOVERSION}&quot;<br>
            &nbsp;PREFERRED_VERSION_nativesdk-go ?=3D &quot;${GOVERSION}&=
quot;<br>
            &nbsp;PREFERRED_VERSION_nativesdk-go-runtime ?=3D &quot;${GOV=
ERSION}&quot;<br>
            <br>
            -PREFERRED_VERSION_llvm =3D &quot;${LLVMVERSION}&quot;<br>
            -PREFERRED_VERSION_llvm-native =3D &quot;${LLVMVERSION}&quot;=
<br>
            -PREFERRED_VERSION_nativesdk-llvm =3D &quot;${LLVMVERSION}&qu=
ot;<br>
            +PREFERRED_VERSION_llvm ?=3D &quot;${LLVMVERSION}&quot;<br>
            +PREFERRED_VERSION_llvm-native ?=3D &quot;${LLVMVERSION}&quot=
;<br>
            +PREFERRED_VERSION_nativesdk-llvm ?=3D &quot;${LLVMVERSION}&q=
uot;<br>
            <br>
            &nbsp;# Rust toolchain preferred versions:<br>
            <br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#194017): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-core/message/194017_=
_;!!AjveYdw8EvQ!fHtiSeYD8TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5=
UpNDB4pdgdmAzzT-aah4fEExz_0nBednypl0Xw$" rel=3D"noreferrer" target=3D"_bl=
ank" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/194017</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/103826050/3617156__;!!AjveYdw8EvQ!fHtiSeYD8T=
PEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz_=
0nBed8jl75qI$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">
              https://lists.openembedded.org/mt/103826050/3617156</a><br>
            Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
              openembedded-core+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!fHtiSeYD8=
TPEVNtjfDtPZrodZY3GykPPupY5y-fmJHKZ6GInFWbYKkRN5UpNDB4pdgdmAzzT-aah4fEExz=
_0nBed3Rcbu4Y$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">
              https://lists.openembedded.org/g/openembedded-core/unsub</a=
>
            [<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank" =
moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">martin.jansa@gma=
il.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------muGywf0eeLmHwxYmjHXGZqCS--

