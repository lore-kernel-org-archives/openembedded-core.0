Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFABDC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:40:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.69])
 by mx.groups.io with SMTP id smtpd.web10.9977.1672832420357984848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=CjisZrKh;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.69, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9s2S15GiBfmdO9+4QFC3zxkYQJd9Y/uTYMVGunXMGNnYJzU3q6K5Fw1sLdkFIEiVvjl58PeoPF+xfWf76GCCZx7dqR4nRLYPu12Wp0gBohq4q/bbfW6laq//J3ExXwnBWHpEv5ar3PA0RSVAI86yHb5sqeqqixi6YdGK6Pg9BzilnVIndGvZ8I3gbdd2OOoAw50FxoYzlGnaZ3QwRhljhzwYyJLWcYXzYohPB8QxRVOvX3vSSZuwwhNwktTZUb2Npk84FdXIyOvttKgne5+rOfB+Z5lf0npKwktVNGQFc+sRuvRwxUSw1ISlXI/AVC6hyBzbuIU4QlR+4F2bV+dhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+2wjtfA9iXWuXD/eICY19DrIw+beyH6DLXfMyY4hmo=;
 b=JGc6UK36uqghjeFcTcVCtHMz3FRwdZEL1bBu07T93G/0rIPebu+v0ktdPO52MWKie5k2t5ZE9HczqXuv53q1YnApAc0Z62A68C+kgmbAC046KF0BWETYIJOT7viqOnMI5uCodKQCFm/03m+TR3tTEKU1kQd6KjKOvvfJWD5PGE5dO+lyft1xnHWeMhltBBMXwCZVrwLH/+TeRwIwemg3L/Y0wPOYxwoN0n623pUb55u+LdhxjaWRl1OVwfvWfWWj91zuCdUlAxdGMc5A0SfpljhF8MSPz1SmaNcctK7qAYCjrmIpmSR7C4rYUhTGZk31F5nAj61VRv4tngfkIx231A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+2wjtfA9iXWuXD/eICY19DrIw+beyH6DLXfMyY4hmo=;
 b=CjisZrKhdULWCgjq10JMJIYykzyyXXXaw5CT+sId9FLVVWFOepPMRARYnl14t/1lGca2wBJ3a8nCX2hhW2eYyTxTXNwpAxpEHexT5pVG6poei93oxov8QilnPlbyVWxvhxc4cP2tB+NaP5sBGxYd7ov3DUL5PkAwTO8uA0qDtVHi25gJlmtKT72GWb6nhfckctthBDTmgdPlm/lkaOBdkTjRSUPOF8Y6cpn/efPdAgskklx3hc73Us7QtIJv0dMGRw0R39fWmUZ8UR7JcNXGwvmhZEdZLXFpfqXAGMRiQvejHo7bLaGAzaIZ9nd52Um9cYY7k0ZnameiLnSkIM7XQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8245.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 11:40:17 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 11:40:16 +0000
Message-ID: <8a425223-94ae-348d-330b-ed8eab79f1df@theobroma-systems.com>
Date: Wed, 4 Jan 2023 12:40:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-Core][PATCH 2/2] kernel-fitimage: Allow user to select dtb
 when multiple dtb exists
Content-Language: en-US
To: sandeep.gundlupet-raju@amd.com, openembedded-core@lists.openembedded.org,
 bruce.ashfield@gmail.com
Cc: mark.hatle@kernel.crashing.org
References: <20230104025330.2648640-1-sandeep.gundlupet-raju@amd.com>
 <20230104025330.2648640-2-sandeep.gundlupet-raju@amd.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230104025330.2648640-2-sandeep.gundlupet-raju@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0071.eurprd02.prod.outlook.com
 (2603:10a6:802:14::42) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 07543237-8480-4cc0-0949-08daee487363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MUJQ+GQae5xVZGYcPkJQW7UkPBZaQBRGhBvagFVb2Wce5Y4a5622sK3e3+fSnGX5iq8SdKM7hLV4svqWtGBmAvWFkoQ6dogpl44aYi0ZuA01xEG3escCnRQV5L76dLH/P4N3sUzgwvUA2ak94wcj4IDpoKrUmmoM9ExAvIqdu1y2FhY4TYy2DmtFOBEfavPJTG1KK+yVa/oSmY/KBgta07IRZy10w69OtCQUdHdY5MOp0ouItR1B0bdPR4Z2Z4oh2KL0o82tkQAtdFS8TVUop2A5V3EmPpZUP4M3ph7kSEAo6WuHBbo3c9pcaTCgiVzhAqSppcby7uOLsFnS8cUk0SAXoBp977395B2BEOOvQj7L+LLNlQ2g/AhT8Ys+ftarjJ/h9st4mTbgdv+s5b8de32zitywJsu4iQCdN9F5TzCJqKyRt1cbW+TQNmYikWxpObNPuPqes6QXRA/lLObdgY7hkXmg3iNHotXlaBF8TeLeCMkM1YEilAjns2fFKma7JjSrUPD+piFusE8zNfIl0EUMrTHLzjZqMC1zoc8pdQzHWAZUvK1cEZtseiFPHvGK6tD6fiPY1aeXFkOdioPnjGivBYwESFlNbJNb3cWggehkVx5e1Rok37YZMz3x2u5vg+4vgnyVi1PgBt1YeZq0lweL3Oon+fiZmiuOj5G7/D4oj/H+re04JU2/Jla+bXbe4LuPwe7RNzBFy2QBHZUV/mZSQ6Ua3Yf4BWwXssmap9g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(39850400004)(136003)(346002)(451199015)(5660300002)(66556008)(66946007)(2906002)(4326008)(66476007)(44832011)(8936002)(316002)(8676002)(31686004)(36756003)(6486002)(478600001)(53546011)(186003)(2616005)(6512007)(6506007)(83380400001)(86362001)(41300700001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkhSYURsQ25vYkw3Mkc4ck9WVmpzUlROYzNsdTM3SWNpUVREOGQzRG8vbU96?=
 =?utf-8?B?YlFpTUVaei9JOThQVjF4RGt3ZWd1S3dveWJoNjVndk9kL2w2ZC9EQnREcFRt?=
 =?utf-8?B?OEdualYxd2pzMkNWc1dXa2oydlRtMmRwQ2EzZG5rYSs1eTVIQ0NyWnRMQ2Er?=
 =?utf-8?B?M0FqRE5ZYkw2OEk5MVFwbHNCWkZtT2krOFVWb2hRV2xrQ2oyZitaUTRTbVVM?=
 =?utf-8?B?ZkczR0dZck1LRFM3TUtNOHBpa0kvN01wanhXamdEMVRxZUpPNUVXK3JtL1lO?=
 =?utf-8?B?VHF2cStBQXJlMzF0blM2TTVmb2h5dTcwa29BQmtJSWN1eWtWZ2NLYWtBUTZB?=
 =?utf-8?B?cWUvUFl4ZDMvZzFQLzFodHlMT0dxdkcvajJsdWRCYmw0YU5sbm40ak1ESFFZ?=
 =?utf-8?B?R3c1TlA3SjQ5UFVhSFlvL0Nkd1pqYkR4SnpXTnNBaldVZUpWM2tlSS9BUnVi?=
 =?utf-8?B?blRjV3lMVkYrd0lsQi82N2ZWZitZMHV4blp0YS9pNEJwSEJTVGhQZEx1WFZC?=
 =?utf-8?B?eUN6NW9ZTDJZOGN3bW56OFM3ZnFIQUZ1a0VFL0tqVldLMVM3RGxaSnhaeXVr?=
 =?utf-8?B?UDhCVHpreXpSbUp5bjUyOTFyWmdnNEtyUzVsb1ExSVdTS0l0QWZ0S2tIS2NL?=
 =?utf-8?B?WGg5d1paZGc2a0EyQUxSTVppV1JwU3lzL0dWSW9HNERIRUx6MW9kb0RGUWRX?=
 =?utf-8?B?MGxZRjJWUy9wNFY3dUVBbkxMd3dxaHpOYU9jbklZS0xKVnZuT1Y1UnRjZXM3?=
 =?utf-8?B?dUtycHdJbHFTNERtQmFxazJKNGVWZDBPOHhtMjFwbXRDNlpkeXVnRHJSV0dT?=
 =?utf-8?B?N3ljRkpMMUpKMWlEYjFCdGtBM0pvWkwzc3B5eWRHQXhGYjdQMmRlUXJWWm13?=
 =?utf-8?B?OE0zeXQwZXQ4QnVpL3ozOVRQcE0vSGxvV216K1pFdzJJL2E5VVJRQnZqS0FQ?=
 =?utf-8?B?MG94c2ZNYWp2c2dvaktnQUtJSWhSaGN3VzBqTkZxelZPWWtjOTRJaDhSNWFO?=
 =?utf-8?B?ZjIva3JsVTJGUjNzdFJsMWdSNUh3M3JCN3BsYVhVNk8yU01NbWdVYlduRXJB?=
 =?utf-8?B?dnFPaERpVjZKZXBnN2hSd1VabjBkeXdwRm4zS2pWL2Z1UDh4R25KbU9MWWgv?=
 =?utf-8?B?MHlQL0RrNS9aUEozYXE2NE9wOCswV0RLSXVPRjZTMkx6WDhLT1NQdUJOOVhY?=
 =?utf-8?B?YUluZXFXYUNubE5Qb0xwSGo5Vmk3VVVPY2RXNjJ5MjFFT05RdXRPZGhUZ1Nh?=
 =?utf-8?B?Mzd3eGEvWjVRQXhKUVI4eGpWTGdZTHJzdGlQMEdPYWV6SmhwNWZTZUxlRlNQ?=
 =?utf-8?B?ZzFTSWZKWHhXUGFKVTE0NzFjckdxbTdtcy8rR0ZCdzI3NFJBOVk2Z1pERjlQ?=
 =?utf-8?B?NElyVVlLaUdnSHREREI0a29xbWUvNlNEVmdETzFReDkyQktobHRFeGVoa2dy?=
 =?utf-8?B?VWkvQnZCQnM4a0RjVC95Q0o5bnllbytWeGVJUTlVUmQ1d2xjdEpmQTcreXB0?=
 =?utf-8?B?RDRYY20yemZ1ZFBMWGcyRGk2dVFQOWREMDN4TFZQSGVCbVlJWDdqVjVBU3dC?=
 =?utf-8?B?YzVvaDR6dVF4NFg3VEw4cnVuL29WKytHWG9IVUQ1R2xLQjBBbGVJVWxyNHJO?=
 =?utf-8?B?SWZKbHVmbklSREtTWUJaQU41Y2pHVHBTVFhremZpVWkxci9Mc3l5dWxBMXoz?=
 =?utf-8?B?VWZOOHJMODFiZkt4ODZDSWgydjJ4Q3hiSnhiV0lndkdrcEh6bjk2a0ltS2Fl?=
 =?utf-8?B?Z2YwemhCK3R5cTV4ekw5cHAvemlhZWRIVTNTcHJ1dHJYQ0RPOCs5UDVBMFdD?=
 =?utf-8?B?WUpCcThlVGJ5OGl3aXhzK3dlUW5Qb3ZIZXBLN3psTVBHUWxBckRrdEdyYWM0?=
 =?utf-8?B?NXpYTWtwNEFyR0trdGRySnhXc0ZaNW1BMDVxNG9uUzJaQ3g5bGhGaXR5cEo0?=
 =?utf-8?B?WlNpZEVZOGtFT09Ea2I0UDVtdEpCVGpyY3NyY3laOE1BS0RHOFZkY3dTeFdF?=
 =?utf-8?B?bHozcDBTM1BBZUdtazBvRFNvSXlQQzg4Rmtvb2llZ2tGWWpqZE9JMEQxNEho?=
 =?utf-8?B?UkhSLy9GeEhFS1JRRDFRTXpTaGtVdjFGK3FqREpxdEZhNzgwZXplYThja1py?=
 =?utf-8?B?R2VKeWdRdmlNN1hhZU8vSnVhY0NkR0pGVzl1UTloYjIySVFtakxNNTgwU09W?=
 =?utf-8?B?RFYzdVloYWV4TjRmQStOYWFrSmVQRWIxR0l1ZHRScUJtc3hkdUVtd3pTZ0xU?=
 =?utf-8?B?Tm0xOFRicW02SDFRcUJLWmtvcFV3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07543237-8480-4cc0-0949-08daee487363
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 11:40:16.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ad37tIOE99Y+vSf+lhCVfS3SXC6J5P04iDn8QS9JaWlWC6n2PwgXd1UGYVxiKvLv9IP875cLsVBee+piDIns42OCFzr+B/4IrEqvIArO5WH8WowNU35mb7Jge+zYtsOO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8245
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175464



On 1/4/23 03:53, Sandeep Gundlupet Raju via lists.openembedded.org wrote:
> Allow user to select the default DTB for FIT image when multiple
> dtb's exists.
> 
>  From machine.conf or local.conf user can specify the default dtb
> for FIT image as shown below.
> 
> FIT_CONF_DEFAULT_DTB = "board-default.dtb"
> 
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>   meta/classes-recipe/kernel-fitimage.bbclass | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
> index cb6635a673..6cdb0e0174 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -89,6 +89,9 @@ FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
>   
>   FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio"
>   
> +# Allow user to select the default DTB for FIT image when multiple dtb's exists.
> +FIT_CONF_DEFAULT_DTB ?= ""
> +
>   # Keys used to sign individually image nodes.
>   # The keys to sign image nodes must be different from those used to sign
>   # configuration nodes, otherwise the "required" property, from
> @@ -412,6 +415,7 @@ fitimage_emit_section_config() {
>   	bootscr_line=""
>   	setup_line=""
>   	default_line=""
> +	default_dtb_image="${FIT_CONF_DEFAULT_DTB}"
>   
>   	dtb_image_sect=$(symlink_points_below $dtb_image "${EXTERNAL_KERNEL_DEVICETREE}")
>   	if [ -z "$dtb_image_sect" ]; then
> @@ -462,7 +466,13 @@ fitimage_emit_section_config() {
>   		# default node is selected based on dtb ID if it is present,
>   		# otherwise its selected based on kernel ID
>   		if [ -n "$dtb_image" ]; then
> -			default_line="default = \"${FIT_CONF_PREFIX}$dtb_image\";"
> +		        # Select default node as user specified dtb when
> +		        # multiple dtb exists.
> +		        if [ -n "$default_dtb_image" ]; then
> +			        default_line="default = \"${FIT_CONF_PREFIX}$default_dtb_image\";"

Shouldn't we error out if the requested device tree does not exist here 
so that we don't create an invalid fitimage?

Cheers,
Quentin

