Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BE4C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 17:36:24 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.41])
 by mx.groups.io with SMTP id smtpd.web09.12295.1646933782950551061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 09:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=RFMDFqvi;
 spf=pass (domain: outlook.com, ip: 40.92.91.41,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccbEU4P7zzo8y1AIvWvECVK+4TSoFcU8QA34kelwN/WS1IuRm4i7q31gWjd/PLLulkrD/jhZUs7ToBNSt2+WJuJvTtFt4JXcR5jYsSmRMtbP7fwVNVP8PAt20rzMknm69QT1T7EwrsMMCOnn0XgG0dKbLJ4w+vvK6dOfiZ1dNqANOSkotdkt23tpMptocL1pfI2v53mcY7OTdIDtxuYjcH80jzxsQTcjfNAqgvvXCGDZmZyH/jH+51+17R9YUjyHkf52dVQpWtYjqKVPEhD1M/VGcvz8kbf3OQcze87mOeg23ExQpvCSvWQ4tjS99Z7se0pZBlotAoh++bZesc3vfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6HOZAm1U85f2zRYpS/237532+SghhiII0QfAXoi7ww=;
 b=DjwxMWwowpOOna2M1B7Gnj2kq7nsxWqvtnSGskgfayra4TxGMnHK8SNAZynRaIP6XGwS2Bm/ASQUgzsYCQAVtiPnr2mmTY6ob6OFtzlJHzMGrW23L08JvfzWW/1sV1VvS+vXgZm2iHE5WL+43gDC+itQ79Z8NXKM3R4ZyJ7RIEKyK1PN/3u12AMrijVcflnwcMwcU6c8W2CYo7MGTwYrB8TxSjsG4M3qoJ6AgACxFwvbZN9YdG4Ymjfnr+XymDNTP6ZWFEkm73M8LmpXGqX2ZiaGO/jNxRJ3B9V+wtSQKnn4DG/LkjLAwiNvqn402RANz0eSK8s813+F4OjL8Qlsfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6HOZAm1U85f2zRYpS/237532+SghhiII0QfAXoi7ww=;
 b=RFMDFqviR9uKqpX9tvlaA6EzoRea+QcrSYcPNB79cAY579PEevfmHVaGOQzCe6Qo/M4Rzs6nEsyAJoAsW/kcDsKURfzWXmU1lSk68A1iEQf0i60tI6W2o1XPBZTcLnSh1kq1Euy1gzzbwXYez4fRON9NU6uUnCycapdi9+krYBja0vkfmRIyQJsSzelJeHPbByei+FWnY+hbaIh7D9GhOCT1Ae/Z1SS7+udkfBosrvTCWvAL33XLrqhYtpQEc8iZF2WhdrsIaHw+HVUHffgQeSKe/YWA8oR6GtcDgCjEUeGRUbWHJSWrC8kypfPEA0B4e3QAp47ZxJ/4Aj8GD1guRg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM6PR09MB2326.eurprd09.prod.outlook.com (2603:10a6:20b:46::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 17:36:20 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%7]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 17:36:20 +0000
Message-ID: 
 <AM9PR09MB46423A3FDC636B28C16590C6A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 10 Mar 2022 18:36:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/2] python3-installer: add installer module
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20220310171656.3106028-1-ross.burton@arm.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <20220310171656.3106028-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [SWK1SEaKsumvUBlWAHaZLTyqK5QzPiCeVZFBvBG3pWKezpSFNx9AMSpWscQ0y+rx]
X-ClientProxiedBy: AS9PR06CA0008.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::22) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <82e5ca28-d144-1527-9c96-9640c5c798ed@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2f8dee3-94ef-4583-946c-08da02bc7cda
X-MS-TrafficTypeDiagnostic: AM6PR09MB2326:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S35kxcrsc7+R6V4oZZ546afiZlgUx1FVA/P60bnxLbmJ0VHXD33GRvYCANfMwtnetI5TIoBRlYSC3hFYREbwn75NxdL/trWbnwskk4wMzyzTflXcY7SShSGTBlHBUoevP1klKe8+G0hfRw77j3t0pdd/oRD04BAgl6U5/wSUlkbspdY1y/eZ2I4AaFJHQStTiI19/fVLSPoM4s5PzLWcE4JiRF9QBN+wJ8RiZCidVQ6f5xKZlaYIGmiESkwX+XQ2koTxFZ8qTdNSQASDnV1JWQVmHPiaXptqBhjyqQh/LPAZ6SlvE9gYLvIsYQaLn194+VSqftjGfQ4mqUk4NfZtR+y+4dnZxXYydGpMawAh2x/G3Ll+7evpPNt4oq/MZ8lvt5BA+ts6uXugeAOkQnBslgoi5Ol+IRoMH/31Qh4Wq9Zc0DdPuyVsZSwX/8OcL/PDQXvgJBheYp0vC3n5FljoWWRZ1d+ra4JZjGkFRGuCP6Io88wOqyT73+MAwqTq2KUPLyvEXHKRXpGRZCOOJ87ToUFQwqxCtHOQeM2N5aOOGKeHH/EIYCQJewmIoH5NTIjONbtsk/sfSs27KxFT5h8BJr7SmCW+DaqtzWdq/qvElCJh4ZZrUg2eYdQbgcNqqIlyqMXiSp7lnL5syu8YflBXbbWbBUSYmk3iFMZ0n203FZU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dXkvZ20vZWVKYkRLcmZ5NnM3Q2xSdUdibDZkUXN6VG9oYkpXSW1tWVhCZk45?=
 =?utf-8?B?c3Vnekd1WDdBYzViNDYxc05FVFM4SHV2Rzd4ZnQ4MXp2RnI3Q2NhekZ1eTdh?=
 =?utf-8?B?aTMyTnhpMm1xWTZKbkJXa3g3S0tXMW44bUp6dDRWeGxaNCtVYzBpQkttdjAx?=
 =?utf-8?B?NmtHcVZtamFPa1paRVcvRDZhM0NkMnphbEZPem5COGU3U1UzRmZTTUJQQkZ0?=
 =?utf-8?B?NThDRXJ0NC9TSlNEYUpRalJkUHk2OXAzcWpHWitMVTA2eWl0WFNtcnRUNmJn?=
 =?utf-8?B?cjZsOUdIaHNqbVVPOXZWc2UzMVZkZ2pGVHluVVpvOWNzbzl0MEg2UVZ6OW83?=
 =?utf-8?B?NVRON1pDbzh2SUkxSVJDYVI1Rkd3MDJZMkhJeittT2xVRzlKaDlNellaU2dP?=
 =?utf-8?B?Z3dLeVM0aS93ODc1bHhOaW5TK3ZHYXR3ZDNubFpEMkhEN01EMW9UVE9Nc210?=
 =?utf-8?B?WEZyUmFQRlF5SVFEeTBkdldncVNGNDVuUmNJWndmTUVKb0tWRll2SE52TmtY?=
 =?utf-8?B?MnhCaTBqeTl6WktrQ2ZkTGEydExYQmdiZXk4bE5RU3FoOWI5eHF4ck9INFJt?=
 =?utf-8?B?aStBNDkxQWJjSlBmRksxNDU3ZlpvS0JvZGpqb0EyUWdJOWF3ZFdNVWV6Ym1j?=
 =?utf-8?B?YTNIR0E4MDZPZWtPdm1pQ25vMkxtTWpReFI1VlhVRVpiaG55dW8yRUcwbThR?=
 =?utf-8?B?RG9NOE03NDNheTRuNElmS1lVWHUrNFF5L28wM3ZjRWNDbmZpSmJrWEtFWSs1?=
 =?utf-8?B?Z0NOcTl4UGZXb0laZitLVlBYYmVCSWxoZmFTTU5yVld2Q0FGbDRKL0Q4bWp6?=
 =?utf-8?B?K0F3ZHk2cDNFY0VLbTA5K2pkOUpvcnFENmxIYnhIaFVLMFp5bElxMjllam1m?=
 =?utf-8?B?SHhRRGF2NkE1bWxEVnFMWk1qNmtuajlTVHY2Sll2NUZlS3owekhQVmRXTHRa?=
 =?utf-8?B?ZlVBTjdGYWdFTTBvcEtyL1Uyak1LWWZ1MFVrczhqTC9QaVR6WjVjNG9nV2R1?=
 =?utf-8?B?WWRITlhoajR0cExVTFZ0UWtGcEd0aHZaOGprNTVoMlpIY2NZL3BWaEc5azgx?=
 =?utf-8?B?UDFFN2JNOHdBck1ubEFzK0M0OWRiVlRrZTV6MnJOVGgwbjBoSDArSFRNdjZp?=
 =?utf-8?B?T2JtQ3Z2b0lOWE5kVDQ1dEwvRjUrUWlKK1BwSjQweWhtN25NaTVTTVJneUxV?=
 =?utf-8?B?RWt3TWJuMFRjaUxidFZNdmFQS0FsSDJWNi9MaVJST1NhUXVyNjVLSjZ5OEJk?=
 =?utf-8?B?UThlSHJ0YzlZM1dOME1aUHNMVktaT3BlcmRzWFJXb2NjQU80STA1SjNWMFI1?=
 =?utf-8?B?b3dOV2xSL2o3b1lKc0x1OGo4ZFhRNEx6c0dzaCsxajdQaHUvQmQwditaRFhQ?=
 =?utf-8?B?R2psVnBhL284ZWg5UCtVUmxQY2hZRmFZNjlEV1dhVlFBTjRpLzFXaWJLZWJv?=
 =?utf-8?B?WnIrRmZzSUkrWjZtaXBGK1RSZGl5allsanJLaGY3ZmpiaVJUbkN6cHQvbDBZ?=
 =?utf-8?B?OWRCS2JuUEZERzRtTEJIdUNuaTcrMGc4STFFeTFjOVZXWnFiTFBBOXdncUJj?=
 =?utf-8?B?RXJGSkxDaE10UFNqU05CSHZrTU9oeGN3QUI3YksxUlFUK0duSFlDTnloVzNz?=
 =?utf-8?B?WE5XUFVzN0I4M25ZakRSSitZWCtxbFE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d2f8dee3-94ef-4583-946c-08da02bc7cda
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 17:36:20.1263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB2326
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 17:36:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163034

Sorry to say that - but to me (even though it's more work) pip seems to 
be the better option - the proposed tool is ~8 months old and not part 
of pypa community as it seems - so in comparison to pip this could not 
be labeled "battle proven".

Especially as the second patch of the series removes the possibility to 
use the tooling proposed by python upstream for installing stuff.

If one would want to have that kind of tooling the switch from pure 
setup.py to toml and friends could have been done already a year ago 
(python-build was the originally proposed tool iirc) - so this feels to 
me like a step in the wrong direction (esp. the part that this would 
rely on a tool **not** supported by upstream)

On 10.03.22 18:16, Ross Burton wrote:
> Add a recipe for Installer, a minimal library/tool to install Python
> Wheels.  Unlike PIP, it explicitly only installs wheels and does nothing
> else.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   .../python/python3-installer_0.5.0.bb         | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3-installer_0.5.0.bb
> 
> diff --git a/meta/recipes-devtools/python/python3-installer_0.5.0.bb b/meta/recipes-devtools/python/python3-installer_0.5.0.bb
> new file mode 100644
> index 0000000000..bde9397569
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-installer_0.5.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "A library for installing Python wheels"
> +DESCRIPTION = "a low-level library for installing a Python package from a wheel distribution."
> +HOMEPAGE = "https://installer.readthedocs.io/"
> +BUGTRACKER = "https://github.com/pradyunsg/installer/issues"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5038641aec7a77451e31da828ebfae00"
> +
> +SRC_URI[sha256sum] = "0cd6bdab3b358cf7e8749370b99aef9e12202751271c5ddb22126599b34dc665"
> +
> +inherit pypi flit_core
> +
> +DEPENDS:remove:class-native = "python3-installer-native"
> +DEPENDS:append:class-native = " unzip-native"
> +
> +do_install:class-native () {
> +    pip_install_wheel_do_bootstrap_install
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163032): https://lists.openembedded.org/g/openembedded-core/message/163032
> Mute This Topic: https://lists.openembedded.org/mt/89691492/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

