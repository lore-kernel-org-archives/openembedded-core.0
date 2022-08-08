Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159A9C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 11:15:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web11.24391.1659957324571811604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 04:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=D3ZkPzw1;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.80,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErGWWH6lBGyWWa+E3/aBTkHq5mAsLVfi2bHa4XnSrCnAeCcz0Gvqw+vaaE1SfqSm7bxT3IGk80jSRIhFK/j4PGEdL8avcvQGtIH69yRdCxv0Av+XjO/TyVQkHUlb/slDgViB6o88bHAK4Jt8PVArol798GimWA/QpYZNAgx4P7UDYngLb4LJRGVQiahBHPfQNmC96cJxGuWUMF3PSGZ9mczv4H4Z3UGvXsXAVxCRQof8L6lgbxtYNmcs/URkgTjDg+Eh9kUr6WivLs3PaMWjhC5AXPDQcThdNYxnZrNRWuBVkdTtvwI+QtUUV01MgKSz2tG5T1cte9VjXKKtzo2hOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svYS+02aIubhGe4ZroMFCmmsC4nnIHfL7Y6ohmJ5MFk=;
 b=HEAfQC29g2tth92okH57khaeAXHEvco12u/mvatrohySz2QROznIgY/jLAEW2cjIsnW63SMPmoi9nGFWx8leqcJNjili0IXvXKR+7vU4Y2wEJEskH3SM+efFCY+640rDC99O8FEydooACnEN70vtjgxCKfCGos7EOr1ebbVFAnxZrtBQp0uiyl7v5eg8HqTQ82Pc2cSem5sM/lynO3/8a9rLY2eXPh0opXHDh2P0EkK7tZdpUXhQBEUEi9Znp8Mlv9yKD0QjB08FXnoDbUFEEdnzY2NH0iaVJjn2roBAH8DiyI4t+W6aKxSyHGRUx1u9JNcdjQ2rO3zNihVB1ByR5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svYS+02aIubhGe4ZroMFCmmsC4nnIHfL7Y6ohmJ5MFk=;
 b=D3ZkPzw1qVDTAbGbjVJjPNafDwREi/x3ZVEi/nN/ZTD/WTRt2UrZt4Vz7biTrYA7tcqPwCVg5NIG4DVgqsaK9+deNWKkyh5gp11C3ObZIKfeqgorw+Ph4OO+X7gs/cMoU7bS+48LlvxOt4ssbI5GcF7qZF2uJzVfWk6fH9i30Wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Mon, 8 Aug
 2022 11:15:16 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%3]) with mapi id 15.20.5504.017; Mon, 8 Aug 2022
 11:15:16 +0000
Message-ID: <5a58fa84-6b17-b4e5-dd30-43277dde7d05@theobroma-systems.com>
Date: Mon, 8 Aug 2022 13:15:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: only package unique
 DTBs
Content-Language: en-US
To: Awais Belal <Awais_Belal@mentor.com>,
 openembedded-core@lists.openembedded.org
References: <20220808103227.104898-1-awais_belal@mentor.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220808103227.104898-1-awais_belal@mentor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2980b2f1-c98c-4f8c-dcf2-08da792f4580
X-MS-TrafficTypeDiagnostic: AM0PR04MB5650:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OGdIVMWdpH1TtUjdw9klc/Fj8IIlVgHD7N5N5OZlMHl3Z2DMU4SZyMf/oshuDXJM+nWVyw/xclJwk+h8u1mJc+5qnGm4Y27gfhp6pUC8N4tdXZFucfUG5urSJMe5bHYKc0AYi9djf27/iyiMFSln+H89RLIaxx1oU3jXv6+devfEKr9HCvFDCQjIpBvnZLvCbSJ8OvLh3GkqaR/A/OuW5IqF6+1O8XWQm2q5iBN48Q5VHHVARTH9XDPw0TMN9HaoKq3WgErGNGU/wC7s1At7M+9bIDCm9LJ1GobPKa0mNGZ29GNMq7Z/HRhEurMYGJnbITV17hOsRwpVfgn3wMsKG6SHl915LnGd298iFnGP8yBipKCPayDTRpbXrA6aWpbJ4na1PIsQZ+TqLfz+Swj3wfUrI7QoXOJiQJ0m0wDWrFr6rSK0G8SffmovrmcvDTtzRBZqtFDW4pskMWdfXFOZTn1SwaEOxEodlVtk5SL/fQfSLgNRdLsNj3BKlALwClyCjM7xwa2p7M73ENQdmCOfBK5KhLqM57HX+rZqld95Y0kSF9JDKo4rdNhmfte/Foja4tCMmRJic3jYPRxnKS2lIc0nXcm/1GsgWSIgRqxMA8SSrBn9wkCHIPkPrZY0sK3P5Ptn3NfnVaFc5cZXPVr2zCdqI6HcQlj74Ahi8gsur6Pw5nLGGLMgFb95uAzcA5IMJHGikJOvnO+oY143ou85/58VnLNf+ueyoggB+gkwN7tkTsXl31HM2dtPSkur/VcRLHPicQeBY5eqK1DtUfHsd7ohJWlA/6W0eSDYRa5Yvcn7LvyhbcCQN06nRmaknjdN8vj/W9NISE5INZFeBiay0w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(376002)(39850400004)(136003)(2906002)(8936002)(38100700002)(44832011)(5660300002)(31686004)(36756003)(186003)(53546011)(6512007)(41300700001)(8676002)(66476007)(66556008)(66946007)(26005)(31696002)(86362001)(2616005)(6486002)(316002)(478600001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2F2T3l5VUI4TDFHOWVoUVR3R3AxN0p2S0xFakc0QVViWTdzck9pZzc4Zk94?=
 =?utf-8?B?MHpUYU9UdXZZdGFJS29OZnc3c09HODI1cVpGN3lBU3hmZFk1UHFHbEMwZXZl?=
 =?utf-8?B?SU1tRTFJUzRpVkZBdUQyZnVNMnJBcEZ5Zng0THl2QUZSanZ0YmwzZlhiUEdh?=
 =?utf-8?B?Z0dqRXpsSVNuM3Y2dlR3NTQrZGlXMDNjN2N0UTlYdFg0WUlhVXROZWo5aTFs?=
 =?utf-8?B?bE9rajVyblhvcFRtQkJtSmtGUlNJUC9uNzVkaEIwOVhkSjJkUzhseHlhdmFr?=
 =?utf-8?B?cEhFeXA5TUQ4TG9iVmxKQWVsTjR2SlJRUHBKRlNaV0oyaE1KSnpscHREWEZ5?=
 =?utf-8?B?dzBOMitiaTFZdmVJR1lhckE5THNnbWdFWU9nandnM3Z3UXJsTXBza2k3OXNt?=
 =?utf-8?B?VXowbmxhUWZOZSt0Y1hqWHQwdUJLTW1VUTdMT29HMFpWVmFjOGhYWm0vN0pG?=
 =?utf-8?B?MDZqSXRMV21NaUNKckZwWkl0N013RVlrRkZJcERaemFyNFRqM053SVBubytM?=
 =?utf-8?B?am5MbzR0K3AvbnFISEg0TTRiVUtUMkNTYnA4NVdhSGFGZHM4dk8yL3NwazMx?=
 =?utf-8?B?MjM1NGVpbTB1VFYwaUJNRFN6RVVZbzlXeEVWbmN3WFNyeU8wdXlnWUgzRUt4?=
 =?utf-8?B?Sm5RMzY0aXlSSVZVeTBNK2U4aWZITDNHc1kyUE1UalNja3F6NWtGdkpDOVJ4?=
 =?utf-8?B?NGFNUmNjR005NUkwY2RmcmZTZ0tYZVJxMzJIdzVkbkxtcGxhTG1mN2NaYzQw?=
 =?utf-8?B?aEFVRXhZYlY4OWtabytvN0E5aXl2YloxTXBvejNjellxVUwrbXFNdUU0RWVy?=
 =?utf-8?B?RGYrODdacEVVRzU4eFkyMTBpWitJMVhKbmNyZ2JHYTdHVkU5V2RMSktDV21T?=
 =?utf-8?B?a3U0bkhRMnlIYTJtbklnUmdCQVdaeHhHU1NpUGZBT1owNTQxMUFmTThHZWZL?=
 =?utf-8?B?MFl1ZnIySGd6TlZrSXc2Nkk0b2dRbzFYYVVYM3I2b0JIb0ZmZzUwOHdVL1JY?=
 =?utf-8?B?bkl6Q1FUNy81V0RPQi92dXJweTZaRlpGUzdYVUNjaitnWENtSU9lYkJnMzVJ?=
 =?utf-8?B?ODFkVm4vUWNOMlR0ZENiT0xCeU5Ca0VoZ1RlQnFodENrTnJjTHZ0Wk8xZTUz?=
 =?utf-8?B?Tms1Wm9GN2hmbDVkTGdPeWJCbi9xMVZ6ZUdiSWlGeVd6K0xheEMvS3dTSmpC?=
 =?utf-8?B?ZUZPcVZEdDErUWNEaDVNNVl5enlmbmI2ZHpwcFpSZWh2aFozMk53WTR2R09H?=
 =?utf-8?B?VXhHYkx0RGlyKytuUVVOYjk5MmNTN3BWUXc1c0xnejREalpRV1V5b0xWZSt5?=
 =?utf-8?B?K3JESG9FM2UxV3NUR2xvNy8zL3NtbDMrUVd1YXJ2cDliZTlUMGRaZTBPYm54?=
 =?utf-8?B?R216NnFWNUlyS3lINUl0eUZSUmVXNEY1U3YxbkpST2lYdjZ6MkRSdGtpVnBX?=
 =?utf-8?B?eHUvVVF2cnU1QnBkOXpONXl0Wld6MXVNYzc1Z2g3Y2g2a3RJSHpodXVGRnYr?=
 =?utf-8?B?UnhCSmRIQ2o0NkVUQklOc1YvN0szMGxYUEFSQkxGcE1nNHZHZnZsZEppOXhS?=
 =?utf-8?B?K3JIbUJpMkJEaEkzbkRFWFV1ODlNalh4bXdzOUhmeDQ3eUJHTlVtU2NOTlVF?=
 =?utf-8?B?SHB4Q1Z0Njl3VW1nRDQxeFpNK0Vzb091STIxY0QwbHdjdzZuQnNwS0Zxb3RF?=
 =?utf-8?B?QXl6amo3WkpkU044UENLbFlHTnk1azZoaC9oYmNhZ0FUd3ZEMzFqcEF0QUF3?=
 =?utf-8?B?ekhXcGZ5eE5EWDVjZG5RRlpPbEpTckRIN2huN1FKVG1aUURRS1Fwb1AzRFVu?=
 =?utf-8?B?dFVaSHJqYklUa3lId1dwT1Rscm1OaGJ1ZVJJRHF1WmdpL1ZNcDBKNEcvZXZH?=
 =?utf-8?B?U3owNldOdDFJNHZkSmVTUnZCRUdveW9XNWs2ZDlyR2J2MGdwS3QrQTc0SUE3?=
 =?utf-8?B?dE9oN2t5cVRoT05IbzdDeUt5K3VJUmM1bUJnd2UyTExMU1Q1djVOcTRCdEln?=
 =?utf-8?B?ZklNbHhJVzhrUjQ0L3JnTnViZGgwMlJUNlpQQW1VKzJraHNCNzh3eXA5SHNR?=
 =?utf-8?B?dHhreTdsaWFhZk5rTFBTRkh0Mk03NTg5QVREUHVzK2lBN1BOMXdBUTMrV1Vq?=
 =?utf-8?B?cnlNWFJXQlRSMWR2RWpCSzBhVVQzWlNUK052VXFOMFY1RHlaeDNzRGk5UkdB?=
 =?utf-8?Q?FXwf2VuKZKLgGs9Mo+AaAZE=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2980b2f1-c98c-4f8c-dcf2-08da792f4580
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 11:15:16.6748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fmzisg3n8PCcprCBg92xUoj5fOvlBZtq73ySiDko+N2Pm+/KL+DXG4A8uNuaMIGafpck+6IxGSVn9uVnZoz41eVlv3cm+y7Ddf4uAIYHpNfvv6R8VrNvXPHcFccvV4Oz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5650
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 11:15:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169081

Hi Awais,

On 8/8/22 12:32, Awais Belal wrote:
> The KERNEL_DEVICETREE and related variables could potentially have a device
> tree listed multiple times and this works okay for most scenarios. However,
> when we create FIT entries for these we get duplicate nodes and uboot-mkimage
> fails with
> 
> fit-image-initramfs-image.its:219.58-229.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name
> fit-image-initramfs-image.its:307.50-317.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
> fit-image-initramfs-image.its:362.54-372.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name
> fit-image-initramfs-image.its:417.56-427.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name
> fit-image-initramfs-image.its:648.59-658.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name
> fit-image-initramfs-image.its:744.51-754.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
> fit-image-initramfs-image.its:804.55-814.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name
> fit-image-initramfs-image.its:864.57-874.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name
> ERROR: Input tree has errors, aborting (use -f to force output)
> uboot-mkimage: Can't open arch/arm64/boot/fitImage.tmp: No such file or directory
> 
> We fix this by tracking the DTBs we're compiling in the FIT and only picking
> up unique ones.
> 
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>   meta/classes/kernel-fitimage.bbclass | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 753164551c..2a07a57d5d 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -529,6 +529,14 @@ fitimage_assemble() {
>   			fi
>   
>   			DTB=$(echo "$DTB" | tr '/' '_')
> +
> +			# Skip DTB if we've picked it up previously
> +			case ${DTBS} in
> +				*${DTB}*)

I think this might be a bit too much. e.g. I could have a DTS/DTB named 
this-is-a.dtb.dtb and another one this-is-a.dtb and this would say it is 
a duplicate whereas it isn't (poor naming choice, though.. yes :) ).

I believe that:
for DTB in $(echo "${DTBS}" | tr ' ' '\n' | sort -u); do

would work and avoid unnecessary loops.

> +					continue
> +					;;
> +			esac
> +
>   			DTBS="$DTBS $DTB"
>   			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
>   		done
> @@ -538,6 +546,14 @@ fitimage_assemble() {
>   		dtbcount=1
>   		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do

I believe using sort -u here should be enough for this second diff?

Cheers,
Quentin

