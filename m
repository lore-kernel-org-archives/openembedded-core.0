Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4644ACD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 17:05:04 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15921.1779987900610651757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 10:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=k83d4pPC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.88, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLryzjS3W2oua5Hor9McKkR+tvqfOEl7Q5Vi8NH5+4BVxSMyU9UKXFkg2x/ai/SvEcJa0oPpY4Da4OIKVTIaaWaFiBPZlyLtcRt3PLpWzDbMQO6YyRgtEax+XRGkSXZ8G5W9dtwjpu1dyvF/kALLDxYwp2cF9bX+Lwogo7rsnruM5Ip5TRwh9KO6DcRr6GBnc+bONk/P3nsY9jf51KHZ6ST+8p3Tk8u0sJV2qj7pH4wEozXonUc4U1VhToLWTA0yUwlL0SX2X9/wVXrWATOKZO0erYzCZ/k/mJq68lWbke6XTIMo2mVw0GUEfR2u7hemY5t5vtduCN1pfnTCR6BHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbXMC9pslL5scWxTpYkhyYgzd22xXa87rJZlfohJYmg=;
 b=XGqRrDz2ljFA1E01MH332Wcfc0t0lxKbjMaUX1Z5KYEwpasGvWnjOuUnl0277/DQ0D2CaNSl+m3O1yhYTo+c+MsZ8Ksn6TdQAJBii+dLEibe61eUNOjezMyijF+h7InAlSVettkngHnUhGtbvAAeV3qaGvO++1MPJuP09fBj2dtDG/Dl6xnGumumalhv2ET2oDfZq0GqW1UkFmOfLM4o7Dtij9n75exQmxhjwFJ/dcluZSALNuu96/02hs+VAbPN7caglMwMnc1AAwvse/zM4wJhC57Foc2XP87CRZKh7jFC95YTZcWga50w1S5rmCWrM+LFiLN2lB/WYozWWTGT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbXMC9pslL5scWxTpYkhyYgzd22xXa87rJZlfohJYmg=;
 b=k83d4pPCp0ycmFEkrJHaxXR8diZeViXklKTXwUOOtNMFghyUOoREmhTLCaz2lzC/RykzrIrsfYEgihuQb+k5bgd6aW2/Oj3ut+X2d1xLe6aFpex0myIs+u2tdxDd3aIWSO//Un3x1an6f8ecVzhlf7YFUdmk1pZeSlOnrZV+CHOakXDvNkAE0pG5PShrZEIw91Jeh/WYrw2BKuLvNZSsNQkC5QBVdCQVVldsbRE1rZ4ZjIFB0ufXuMuqbiiIFHnpVBokS9G/jXVtVXkXK6wLPId7z0weLt3gQIjqN/xRy/C/byviAM8cBthPIU5B9+a14dk6wZ1YyatqUqq/GuZRiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by VI2PR06MB9134.eurprd06.prod.outlook.com (2603:10a6:800:21d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 17:04:53 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:04:53 +0000
Message-ID: <5e57e4d5-f5ec-4586-bc3e-c9c030e5fbcb@vaisala.com>
Date: Thu, 28 May 2026 20:04:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] sbom-cve-check: Fix empty IMAGE_LINK_NAME
 handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com
References: <20260526060000.874022-1-niko.mauno@vaisala.com>
 <20260526060000.874022-2-niko.mauno@vaisala.com>
 <5fb41f04863d45fa6de4c230125ed6eb8c27364a.camel@linuxfoundation.org>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <5fb41f04863d45fa6de4c230125ed6eb8c27364a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF0001A335.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::69a) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|VI2PR06MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d9f271-0d13-4e1d-dd58-08debcdb3c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|3023799007|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	aPdSNJ2ik5B/E9h0lDJXp0D1ZxFGL6OBQzc4IDykduxSpwNikfqv9zil0BtNJiv3hSd4qrqf6MMy5nPFqjw3zryMJE+SMekElm5YBi9g3OEMyf9nKj/BmtCJ15NRFO+Dvv6gsGDsk9wz7vLzYvHDCaNyMS+I+tLiABF9V+Egk9cP30gr2pe/ysJip/U5LoUTcJVWpOJ2rxF6lICG+C9vp1ZxoqlzG8aUs21nst/pLA0KgTRCIMFiJjaPrrjH5YACSGYPRlK/s72cxI7/bn6Vfwog/3SxHHvq2o7lWwAocTCvi0GTDT3M5M14Whd0ET8nUaXvTe27KU1MD9J0HcIdSwQiFc1l0OVq0TzLu+L9J/AAsnlXFHFAeuMknpq4cqEQGOSjDOVVvrMa9pA7XnqkAXM7/L28cuJUBns9jeujn83VBRsBkGp4v+hOALPlq5ek6V1jheeiaOcK4/kytPJvFoLRT5/K3jBLBpRfrHYKO5pcdwgSV06zweCdnrhKnh8R3C5V6Nuk0PRBrA06BKWV9iZRhauhbGgLCqhPZXLT/RGxHUytwr+gBmYjNwplZHYlZsBvBlFxZ4ppJ3HU0UHzQFiVMMvt/e49xC/AgRQEQvk1Zmhc3f0+ES4PnA5fhlB24NuBFtrZsb3kvi696eaKV4nVlzK79GB51CD22yYZ3GmFuZljX6n30nkzMPJ4TtoF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D6/s9bM5N4mewqtXI7Rj6rkHziBz1rN24N7WDRKR2O99R0AmQRD7qGIWBDXK?=
 =?us-ascii?Q?QHt0FzWE5B3XpOfKMDiFsw57M9DtSzHxtUdLJecX7J4C0H7eQO6a+UKv8Gpf?=
 =?us-ascii?Q?oCKxOjDcusao0A+Ew3E7g/wm6MjHu11XTxuPgCMENvsA94Pe8CW0Chzjqk/W?=
 =?us-ascii?Q?r6oNwj0n4zx0kwcwyC1AdKkl+XhbsNkgl8wRDcsdcNmf6ZFns9gTZOtQmSfX?=
 =?us-ascii?Q?tRnbm5UhVcPZwoSxVyQ5oGcLOUrJHuc9i+1j2CHdBKBHlQPYZ1CNpmkUD6FP?=
 =?us-ascii?Q?8G7WM6uFTOL047/UOLeGyriq1jg2gI2KFw0JNxaXxxSsUzKlQDEqQEdZ+QlO?=
 =?us-ascii?Q?fEt+jB2IHBZV0uxIFH5e4hFp8LPs6cIYSX5MDks67SdXALf4yl+W5v+Whtg2?=
 =?us-ascii?Q?NX9CCljJk+NGfbbIQYVFsgJ3HFBvtDmUxe2x6UKbGiKbnjbdwukc54jyi20R?=
 =?us-ascii?Q?Y8jRgIC6NffJWuv0dqkNpOHahvnkuoCjySbh1Qr+lcPCOxtTTS5KQ/gfe0PD?=
 =?us-ascii?Q?N3Uw94W8AlAjCnnDb6OgHCHTyZ8o5B5qisWBH1z9j4Fp7xTsCaaieXp639H0?=
 =?us-ascii?Q?zAiczwctqKeQshDft568GU+TMCWDk3aEU4qqI5tn7LSCnVPBC3aaRfmCplNl?=
 =?us-ascii?Q?XZjujJFHrQaFeoWX4QQRJY+dKgB/t1qwyyg7gGjPKaQVTVjfO755wqYn1tH+?=
 =?us-ascii?Q?sA1FDuvi9F5drlvgFLcECu0MlnrqMma2QJ7ryAP4idn+EDYVrmeyh/Pq4zDM?=
 =?us-ascii?Q?yfvmFGOqsSZ5vtT1c62K7+hP+Hcsvx9/JdxQPe05Udr+LIAIEltdN46gQDuD?=
 =?us-ascii?Q?jTkyJ4WHb0iJ7HyFzg0xoRECLHKnE2MhdjYcMVxbqgUPTk3CcwSIHSw40zqC?=
 =?us-ascii?Q?UhO/R3RKmmln8i6BJzVUsjV6en7CFnU3UfkQ3dRlXwaRWFt7nCzq6NK8a/2k?=
 =?us-ascii?Q?XkT/FaEbg8IQ/Bhu+amail5rMXti3kAK7pK5ZcNd05JvY29Z5GcbxSqbh49h?=
 =?us-ascii?Q?SM4zIuh29amAE9dqNLeXaXX8K3y058MLGYLgPcJ62eeFSqZ04ryBl0gLnSCj?=
 =?us-ascii?Q?OpLHaBVgbFUb7EV0pHr8cOMR5qFWjRPNvds3TCB9LakkmJa0vR6Fgi/ZQdJN?=
 =?us-ascii?Q?aD0jWA7RiNvjVyq7L8i8t4uloZDyqNJllEH2n1w1xBZQYO2ak1CiqV4ygFao?=
 =?us-ascii?Q?eXSyguu+p9KeplyCgSQcMR/ei/JO6DETrtbVZMDVHfnm/BNYCb/EvtfMs/YB?=
 =?us-ascii?Q?VbE/lqNQu1fstY208gJZDC6BJVO9WXpufuYC/S7zUGIe2DtmvwxI6isUmZGT?=
 =?us-ascii?Q?hsefIQXdI+Xqupc5F3mz96JoJSJoSkHrL55nbaotbp1jihz0sUS6nAWFHKj8?=
 =?us-ascii?Q?47hM7hgl9fjg0k6eSXePu7VQvCUe0q+vVtv21W7zexTxe1gUtjed5GWg41yS?=
 =?us-ascii?Q?mr9dm3DHRVFf8hrXIanAfGiMA3F54qJ35mwq9gLCyQm2XIMBqTXdCv5soA/7?=
 =?us-ascii?Q?SOlhMcM/WFhNAN+29RxdnnCb7RW8cCEZZj7yvoIGt8TatbA73VpB87TfoCFk?=
 =?us-ascii?Q?jfawUpNmScX4W/6LAmcvWcvjBZH9FP32/1CRe/8tBkIG3mirco8edgiYhBw+?=
 =?us-ascii?Q?oXLz19GXtKmQN6Rhk65xkQVXJ99C0u5IzyLJn3wkHDsH4MKAXrlU4qKRVaoa?=
 =?us-ascii?Q?tZyM4LbcpO0TIXs4gELDfHdp0F8MaMHINBGGO4Z9kqiIbuAcRQx+RRoBn8k7?=
 =?us-ascii?Q?ud/3oSwPzw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d9f271-0d13-4e1d-dd58-08debcdb3c2e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:04:53.0871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykIR+vBZRT8MTOo4/BIrQ6GXYIp/iu+s3ogPbrSKIc0sx1FYaUz896FYuVJWpGWdiN5RxMSGPmlfYtrIU6/s6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 17:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237718

On 5/28/26 3:22 PM, Richard Purdie wrote:
> On Tue, 2026-05-26 at 06:00 +0000, Niko Mauno via lists.openembedded.org =
wrote:
>> Avoid following build breakage when IMAGE_LINK_NAME is set as empty
>> string:
>>
>>  =C2=A0 sbom-cve-check: error: [Errno 2] No such file or directory: '/bu=
ild/layers/openembedded-core/build/tmp/deploy/images/qemuarm/.spdx.json'
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>  =C2=A0meta/classes-recipe/sbom-cve-check.bbclass | 4 +++-
>>  =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-r=
ecipe/sbom-cve-check.bbclass
>> index fe145a2212..39719d51dd 100644
>> --- a/meta/classes-recipe/sbom-cve-check.bbclass
>> +++ b/meta/classes-recipe/sbom-cve-check.bbclass
>> @@ -14,9 +14,11 @@ python do_sbom_cve_check() {
>>  =C2=A0=C2=A0=C2=A0=C2=A0 """
>>  =C2=A0=C2=A0=C2=A0=C2=A0 Task: Run sbom-cve-check analysis on SBOM.
>>  =C2=A0=C2=A0=C2=A0=C2=A0 """
>> -=C2=A0=C2=A0=C2=A0 sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_=
LINK_NAME}.spdx.json")
>>  =C2=A0=C2=A0=C2=A0=C2=A0 image_name =3D d.getVar("IMAGE_NAME")
>>  =C2=A0=C2=A0=C2=A0=C2=A0 link_name =3D d.getVar("IMAGE_LINK_NAME")
>> +=C2=A0=C2=A0=C2=A0 sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_=
LINK_NAME}.spdx.json") \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if link_name else \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.json=
")
>>  =C2=A0=C2=A0=C2=A0=C2=A0 run_sbom_cve_check(d, sbom_path, image_name, l=
ink_name)
>>  =C2=A0}
>=20
> Whilst that works, is there any reason we shouldn't just always use IMAGE=
_NAME?
>=20
> Conditional code is harder to maintain/test...
>=20
> Cheers,
>=20
> Richard

Thanks Richard,

briefly build-tested both empty and non-empty IMAGE_LINK_NAME cases with=20
more trivial IMAGE_NAME adaptation in place =3D=3D> failed to find any=20
issues and resulting DEPLOY_DIR_IMAGE/ contents looked good to me in=20
both cases, so submitted v2 based on your suggestion.

-Niko

