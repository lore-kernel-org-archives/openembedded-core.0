Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EB6CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 13:52:30 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50326.1778507546681851397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 06:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=AzVP+wnh;
 spf=pass (domain: cherry.de, ip: 40.107.130.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUhOEs8M2iWaLl3nRYOcbBQk/J+ViMEWx238FGdGqWjGWeJxNm5YsRsvPrGNfqbseHkz6slcwyfgEQGPvHPijafVkdPCs4N6xBzbwg0TAGkclK29agJNCfkG30Y3MVp4hRxMcAu4wi2wkIdOi/FzVCcNHo6E9xdD49AJXy2k/OWZEGAbEHe8+DTVfE7DvBE0kmVUcnuWOH4SEYxGaeTOtaiwA9unpuyFoIciJuGBevV28I0asbR2j5haE+u8xNYFkYexOQVngSh/sWtvz4bNmg38LCjcmjl1haisM3xXDSDTsxqKZmd6CbCcviJx4OzfElXALFOp9exq1nNE8P53ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVIMg74WEKdKgeiKiAFq/CUq7T1HA8ARXTTzjyZmjIM=;
 b=b9PYcez20wYmoEbZz+9xp8ZC4/vqxXySP2wCE7BVTF2OcBC3w388quuvmaj7djsF8M1nJvaiCSdr14BnAaLeOWYkU/g2OQKCunYLZrG4sx0RArm2hc4Z3h4gGRRYlisatT/PYbgxGOYNkgZ7TNBofc+DB2cST+hnX4f0EKv6lpzooLfnO/yzr2QCieXpEx6u1z/pHogqVy9egKZnJ4tEaifpCaeSaOcrZ10neE/UaBJnuM/KLcA3emGYuyK8Qb9K5hh12L+D7+kp9eK0XNkEmgIEDpAQ7o2zDg18NIIs5it1LFyQpVZfZyHQBm4UUSbaODW4AXt7p7Pty32d2oFgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVIMg74WEKdKgeiKiAFq/CUq7T1HA8ARXTTzjyZmjIM=;
 b=AzVP+wnhz6aCZKyjMlFUa/+U/fP4THytPvrD6CrkcaHTrgnke8+VRJCdH3zWQuPfaXbf1iVHAfbyNAd/EH9R+USVUL0OR3A0cFmG/BWS9ckScYrkiJ0ruhPLQPho5752t11x82f/L4L9TYWj20jFNY56mFRNyMa9GJ7HPbrBimE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DUZPR04MB9965.eurprd04.prod.outlook.com (2603:10a6:10:4db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:52:19 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:52:19 +0000
Message-ID: <bf76e336-9a8a-4488-a7fd-c4315303e53b@cherry.de>
Date: Mon, 11 May 2026 15:52:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] ovmf: drop gcc-12 specific BUILD_CFLAGS
 setting
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
 <20260511092935.2631121-3-joaomarcos.costa@bootlin.com>
 <5f42f257-59fa-4085-a42c-7cbe55472567@cherry.de>
 <708f2321-2420-431e-8b9a-3a5a470228dd@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <708f2321-2420-431e-8b9a-3a5a470228dd@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0273.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::10) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DUZPR04MB9965:EE_
X-MS-Office365-Filtering-Correlation-Id: 334761fb-0583-4993-4b3c-08deaf6484e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|11063799003|4133799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	p5y48ckDaa5xyeznOAsAJ2p0O/fiIqIHCd7i4GQQY6j5Q/tPS9mezc/JMizCztLhYZl/D+P1vS7VoF+AdK6O72lnfbyTaowgRorn5fqZXPnTXjSisq8u/GrI7ZNRy3lyvR0kmNYkxXEtJO3180JXlekRq7AFriQpLLcNHVosjd0kyc6eSMXe2NYopwoiL6N8p9aurNuxCufrClFsXk8GPbcwrzWw9NS31rF71U3hm+/jk/DpKjcmj2eG/L+snkyWLnpHtcogc2ESn7KxT7zItcbmSgvWZvOhksaBuDCWdX5BbvARhsOm1CaC5AtkrBPC5EQfznKOSRV1zb5BEqyMISFwgtYZzRiuVmyPdB34GdSJW1L1IZDDaHwWmjrmsMDtuBTIcRYfVlSR/amhbryZvhhbondovyLFROHpe9xS0rOyM2a69mCjiAwOpQogA5R6n3/RDCGIYUZPUGVSSLGB8e/mCju2qr60mvbeaj4EuG61RRNWaG3NMuinZuPqk5oZq8aTVl/mZkgTLLyoRLgInwDAMCn1Ux8eK6kOXnZtumLRhImWU93JPOsoSpwVS7sxOjKTeCopnVmYReM9vDf+0paWzPuMY5RgJC3Sn8PLJ3R/lSP1bt2+5S5jHAsIjHLRcPWisYY0QKq99DwbfIcZRQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799003)(4133799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bswLLf85fmdkyXEhwSmufJ/zQrFLrCugWfH+o31S7yxT3pqrBnzs0ZWxFEr2?=
 =?us-ascii?Q?TyOA3DmbbED0bRHpineZSoif4qut/qTLTqijvnEwfgp5W34wfNtqY6N0XV8z?=
 =?us-ascii?Q?LCZ4dNwwHzmlG/sysdkENcjUoL+AnZIdQpxUlX19iW4Yau4gI3pVKfmESZy1?=
 =?us-ascii?Q?sTJ26vQSTP7IQmn0AyrVsdQCSkPNaNIG31gKHuSA3Ug+vKuIdrPp9V74PUX/?=
 =?us-ascii?Q?hSoF/AavoKsbOfOfbn6H0QsXJdcx5XU6pLoJAyOSoIFY9uRaoKUX3yrpDKCL?=
 =?us-ascii?Q?Lv8O6A9xbsBKXTNTAp/Rvqy97kllnJD0AVMAxXF3z4/bcaU3PNtqsGXMPqJ9?=
 =?us-ascii?Q?WZAugGLYQ3L9SXbcjgwVdK5h3LlZCoRVvR5E85T53xJkW6ypr4d8IiySgPgH?=
 =?us-ascii?Q?/QnvSVbIw6oO7yBFeTWtMOPjMiLvJSlzETh/BANdPmIjmlVN+3bApOg9Mj81?=
 =?us-ascii?Q?NVBLLVRXuBP0b9EWfVxFXZUjsAfswnXTnAHCMq6SBfUn8bQk94xTc+4cX9Du?=
 =?us-ascii?Q?kN0clK4bEC8/B0ybFwXgJVLi3H8FEFmwwObXddlRIgEuxJ8onawy3vxfVPxe?=
 =?us-ascii?Q?usB76PlXIRnrXQitKpwpjGt5nwTZrlwcf9AAUj+AHc64VuQ+MV9SPdynGGKV?=
 =?us-ascii?Q?GNE1WXFo8RaaWCOqoip9olyvBSUpgSvNCXuv88tIZEr9hVCZ/g2Dexk9dZ6m?=
 =?us-ascii?Q?5RSpVa55dMJSwQAwaxUa/RXlRyRpibBMpushQ8LhoxIw0T8cfHvBYr9vrX+2?=
 =?us-ascii?Q?p59YO3XDx2B7zEEA0B2NgQGB8F3rNrTYtS7zovqL0nQHIUHM5ApGOdGwD9Vo?=
 =?us-ascii?Q?QxFCkBzjCGenXZLMIOq0YmLbL2qrjUPWvLEQh242okccUPBNW7sIFinckoQo?=
 =?us-ascii?Q?6gd04zRMURbKr3OEdp+qUVetseO0rX0VCt0Iman9rFSEBnyMMiWZ3NAodMc5?=
 =?us-ascii?Q?z94t5cwzCXNGJHdT9NRtQbMWD+Z93fEY2kNlGCND2pgfTYeK0Mxe9PC9cfMY?=
 =?us-ascii?Q?jxfRhVBJdIQ56a1IK95spWusyVwOOriBrFKayAYWjnjpBYy3a2O/UbaZdh6s?=
 =?us-ascii?Q?9mAYlPqMeJto03ekPhO/VKTH8xGkT6Wfehw37QDsE6c3FTkK9nLD9jIh/OzR?=
 =?us-ascii?Q?6ez76/1gzQNE6rnL0oyQHYkch20nHSY9VX/w+3JWKyY6nFqXT4zeYUK9gB3J?=
 =?us-ascii?Q?UFkWvGUyxNWRHWdaGXZJG0N+R1qjD75ptggNdWSbHnA6G4cu9uUD0UjrunqR?=
 =?us-ascii?Q?4z07O7EQ+3WcnN/ejELE+KUllX3F2fLfWn7ek/W1ezVmmNoIB+8mPZUnvTDs?=
 =?us-ascii?Q?ToR7uy8ozhY9bmPw0P46xLGgL2ANWaZL6bimCTrvCx06B8vJrQyCTzuaBsf7?=
 =?us-ascii?Q?RLgLr886csIuGUIP+RwXrKs0eYqU2SahThOzFxBm/+5WjqhPrI7PAHODIRGc?=
 =?us-ascii?Q?28bMUkZpJSsgZT0wWH5NkfnYj8r16JI0Ua37020XaCkTc+nnx0hDE0AiygZr?=
 =?us-ascii?Q?10X+C6B9j7FwpV3nhd4zJhDHfLjA9/IMArsndX4pPEXrSWPrO4jW1FcY2HpB?=
 =?us-ascii?Q?vfucW4nxVmdv+LFWdWgI5ZD4QcZp4xVC24f1fyxZ6ovxSTrtGw2Yz7IFQlNs?=
 =?us-ascii?Q?M6cisV/J3oy+GHSUY0SvPaNa/rAQGWLUceP014Ow01PvvG0cZTZsFW+EpnkG?=
 =?us-ascii?Q?NlIEbH4T8f1fH9uT0eBecYRiBDP4AT+n9eeiysRaj45N+iZiZmuVQmFf6hkE?=
 =?us-ascii?Q?tOQLXCRIhQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 334761fb-0583-4993-4b3c-08deaf6484e5
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:52:19.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPcZK2XKrpMFlQWd5npkPSYN0SZS6/awqWtAErOCUpgqxt0Dvd+hI0jotpZM61MFYbyQ6tApdOtEFojMKNzZRiFTnlftOg5WDsFgFnnv9gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9965
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236817

Hi Jo=C3=A3o,

On 5/11/26 3:40 PM, Joao Marcos Costa wrote:
> Hello,
>=20
> On 5/11/26 15:27, Quentin Schulz via lists.openembedded.org wrote:
>> Hi Jo=C3=A3o,
>>
>> On 5/11/26 11:29 AM, Jo=C3=A3o Marcos Costa wrote:
>>> This was handled upstream a while ago:
>>>
>>> https://eur02.safelinks.protection.outlook.com/?=20
>>> url=3Dhttps%3A%2F%2Fgithub.com%2Ftianocore%2Fedk2%2Fblob%2Fmaster%2FBas=
eTools%2FSource%2FC%2FDevicePath%2FGNUmakefile%23L27&data=3D05%7C02%7Cquent=
in.schulz%40cherry.de%7Cd69acb4606d94a43ff0b08deaf62e1b9%7C5e0e1b5221b54e7b=
83bb514ec460677e%7C0%7C0%7C639141036395687030%7CUnknown%7CTWFpbGZsb3d8eyJFb=
XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldU=
IjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DD5wD6%2Bvq%2BYJP3wUROtdEswwwc4RJFYmYvt7GL=
zsvJbo%3D&reserved=3D0
>>>
>>
>> It's not because upstream supports it that the version we're building=20
>> has it, so pointing at a commit and mentioning it's part of the=20
>> version we're building would be nice.
>>
>> 22130dcd98b4 ("Basetools: turn off gcc12 warning") part of edk2-=20
>> stable202205 tag (and also edk2-stable202511 which we currently are at.
>=20
> That's very much true. I will stick with this approach for the next time.
>=20
>> Also, unclear whether this single file is the only place this flag=20
>> being set would be enough as the flag was set globally and now it's=20
>> only in a specific file within edk2 source code.
>>
>> Cheers,
>> Quentin
>=20
> In any case, the warnings/errors would have been noticed during the=20
> build if this flag was still needed (and missing).
>=20

Not necessarily true as I don't think we build GCC for native recipes=20
(and ovmf has a native variant), so it depends on the GCC on the host=20
(unless you have uninative?). I don't know the autobuilder=20
infrastructure, e.g. whether we build patches on multiple workers on=20
different distros to have a big GCC version test matrix.

But yes, building with a newer GCC will generally not make warnings from=20
previous versions disappear and I'm hoping upstream has had time to fix=20
warnings returned by GCC12 in the last 4 years :)

Cheers,
Quentin

