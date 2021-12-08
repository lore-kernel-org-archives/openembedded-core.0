Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97502C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 09:56:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web11.10131.1638957409768574775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 01:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=jGn9Y+Mh;
 spf=pass (domain: vaisala.com, ip: 40.107.21.48,
 mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUhUCIAInXFuUA+oK8IsFXQZBng76e6N9yC32nhv0yz76VuA8agbl3ionxSuxDagcpXp5v649XxCI1ad5rUHWBY8HSGQmZj4Tf+JtQOS7Dg5AZyb6Nldvid18cl/q2Uvk71U/OcD6RzIOq8NakAqMBhgQlU3gg7sbxMg0q7lj4GnHsKW3CXD1oz7PdWzgcrwR/556PCK2YHvbsqQHaOPWbfF43wNaJEXA041U4Ou+pZFBk3jTf5q4Z5dlHJJENOxKH06JbZOrnmjzqCr1MOKwU8dOKZtEvXvJbAoLUAlLQVp8GTGrRFP6vykG1Vebvcww8yDp3sxy68pjRJanpIhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8Zb1z7zMDC3K69CH7IY+AzfzLq+fnsOsaLA06aScF8=;
 b=U1arG9etExCswgEYcopjsqE4DeOdiKV15eC0bMYszgKc8CczAi5+303QOuV6SgoFZ80WCr5e/YSxjmcESPONBfkruwoMt02xlkgJEzObsgHgVp3tLI1/02MRFG5ndM8/KMO3eRpJv2j28e3xxnqpfayXL2vPiu93Adm7G1WhzBOBRKiVLiSRuSEiwwSjiXWGvjkuJ++LA8CMUmznxZ68moTrxNBJDDCDSAIoIV9QbX9jwKKZjMfuMh92RSw5qVmJRFnE9hmi2Gg10lDuC6I1goyPDm3Y0X+WxeZcaj07pfhMCThq8oI4C857ogJxulsDLoyzqPm9yvwDeo5zbwdeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8Zb1z7zMDC3K69CH7IY+AzfzLq+fnsOsaLA06aScF8=;
 b=jGn9Y+MhlrKVstSuPTNiSD4nc+hdOOfpe6MENoL2ZcdomywjQ0acHcPR931xGq8tgS0oE/s7Si+eVLuXImZ/eQdupt2cq6hUwve2pR59wmxKMzjW1/MPrw+8H5stySEqq8eGSXccBsqfy/JNKZWDy/8Q1l+Q4A1Tgr9ZMpCpGslsDZq4Hy4Ie7B648usLoTSRtAhimeUj4usVqTGScQC7tM+HyX9UKo3eoz7DR3lzyiGLcUDRNuuWhD/0hAotOqIrqUVt3jZYS4qsiVY4S2J0fJzH7URIt4jB04jRjF7tAKrBG6rieqU/suPyRtzdu5XjNYVjFRgYkUbtsJx+aHo8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from HE1PR0602MB3340.eurprd06.prod.outlook.com (2603:10a6:7:23::31)
 by HE1PR06MB4089.eurprd06.prod.outlook.com (2603:10a6:7:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Wed, 8 Dec
 2021 09:56:46 +0000
Received: from HE1PR0602MB3340.eurprd06.prod.outlook.com
 ([fe80::d92:5470:cb89:9852]) by HE1PR0602MB3340.eurprd06.prod.outlook.com
 ([fe80::d92:5470:cb89:9852%3]) with mapi id 15.20.4734.032; Wed, 8 Dec 2021
 09:56:46 +0000
Message-ID: <34a9b96c474ffdc50b4e0edfd3e9300cb1b7c443.camel@vaisala.com>
Subject: Re: [OE-core] [PATCH 4/4] core: udev: udev-extraconf: rename
 mount.blacklist* to mount.blocklist.*
From: Eero Aaltonen <eero.aaltonen@vaisala.com>
To: richard.purdie@linuxfoundation.org, Quentin Schulz <foss@0leil.net>,
	openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 08 Dec 2021 11:57:48 +0200
In-Reply-To: 
 <34cfb0378a0168756a1ce573b11b292618be2aad.camel@linuxfoundation.org>
References: <20211206153511.34838-1-foss+yocto@0leil.net>
	 <20211206153511.34838-5-foss+yocto@0leil.net>
	 <34cfb0378a0168756a1ce573b11b292618be2aad.camel@linuxfoundation.org>
Organization: Vaisala
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0092.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::10) To HE1PR0602MB3340.eurprd06.prod.outlook.com
 (2603:10a6:7:23::31)
MIME-Version: 1.0
Received: from hel-blackbird.corp.vaisala.com (193.143.230.131) by
 GV3P280CA0092.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 09:56:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71d9251d-4a4d-4a5b-0589-08d9ba310b8f
X-MS-TrafficTypeDiagnostic: HE1PR06MB4089:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR06MB4089392ED08BCD1ED2974AA0F56F9@HE1PR06MB4089.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ei5rCDoZMl6azUv+mLSeQrS628f7LLmJhPDgrS5nwH5y9y7ZxKdc7mEBvZ3QHPrMaihGH3IEkqkGSiTEMzjssScVpcDazgQVOE9n272oCWfAHBK3KJRopnxfAe7mRscrPDjycL1d87Z/EWOV8EDTc6e8NU9qTa+ARRbMAFO47+Y52mzDks3NfZnzBuH5Sx0FXvijBs/y0no3C//nA7mdFsX5TcRLJN3juQSgvEYvvEVFe/X4r/hV5hgD0MS3LP8TVF7ZULFRk8jwRmvU0P8VhkNKfY+mBkDXuOEq7URC/CR2NIFKOVgkgI7j77lt7REqXcSIA2mhfu9JGd4KNWdliLd3PCwGurJGI/MFExsz1sk4MV+YhGZDv0sKgvaUQf23w1VoRWytxdAoR/E8B2swTtjEH9KwlmAgo7viXAjjee41kfysotuKBI2awdEnScBxuAqUvmst1hJTe7jhVauc9tYROYKiFRUicla9bJ97XyKkEkoIDSCmRsD5JK4GnYSPh/duTgtxiIluTZbGIldEZb9pCy7x21jYptPh4ofsdbnRvabqGomFIAepgl0YmNDxJORhUyibau3+K76w4f7RyeFWcd07wGm9e88iPdLJBcZAmKEOGN7bzNti9zcVJn/4O2GKHewA3Wxnch9ZyBUTDs2x9Y8DhVQjg8SZxXJhGDDyCBHgcpLgQ6U5xBfNLGLU7ENYoISIm2ggYJU/ux5BqGQsZ//7gkMA2ceUEvZzvDQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3340.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(66946007)(26005)(186003)(2616005)(86362001)(5660300002)(4326008)(2906002)(956004)(36916002)(7696005)(52116002)(6486002)(4744005)(8676002)(38350700002)(38100700002)(8936002)(316002)(508600001)(36756003)(44832011)(83380400001)(99106002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHdobDNRZXJiVTJ0cWZQd29QdnYrREw2Q2UvWFR1dDVsTiswZDFMYlF1VFBR?=
 =?utf-8?B?VWpSSUM1WUZvVmdnb2dCM3Z4ZXdmUjhES2NYMXNEM0RXY2JpWHNDdGg3Ym9z?=
 =?utf-8?B?TGtPREZELzl2NnpIVFBFcDZ0Y0xaK2prMWpNR3BWYWxqKzBXdWQ0aG1HaHcz?=
 =?utf-8?B?amw0U01wd2hUOS81VUFzVTNqMkFtT1M5ZThnMndDS29kdU5pbTVhVWVUK2I4?=
 =?utf-8?B?Uk00QnFya1dmZ0ZJSTYwUHF1bmxaV0ZlaVd2L25RQThCWi9hOUFzOXQ4b1Zn?=
 =?utf-8?B?aWorbGxlSTI5WVlRazJOVklnb0Q2aWlaTGtuRTFDTWFWUHdCeVMvZmUwSkxV?=
 =?utf-8?B?dXBwVjhIRERLT1g4WFpjbkxzRUJESjBvM2Z1VTZkYmg0MkRHbEJKMnlwMW5D?=
 =?utf-8?B?Q0U0eERYVlo4R2RLU085RDlHSzVwNG5pMVQ3a1lXOU41MTFwRFcwWEM2aE1y?=
 =?utf-8?B?UlFGZzliUlBBSnl1S2IvMTlMaUl2YTlKRTJjV2hwZXJtR2RrYlE4Zms0cEFJ?=
 =?utf-8?B?NzNGRUZuQ0VQZnUwQUExRm5FaVVvcjVPa3lmZ3FRQThKMVB6T2VvSEUrdEZn?=
 =?utf-8?B?bTVUWE9wSS9acUFnOWZnV3ptN3h6V2hVcG1lWThXNGI4NWJScDEzS3VIV2t4?=
 =?utf-8?B?RUhKMy9rWDNWd1h6OTM1bS9XTXFsMTlxQ2pTSUZ3a1I0VmVVZW9qendsRW5D?=
 =?utf-8?B?SFErNkdXYUQxQkpBSC8wYlJGUFF4eGFRQVJPbWpKSEtkWnRZeUd6Y1ltTUpT?=
 =?utf-8?B?b3pKLzRnZFg5S0hpM24reGpvSERLNFJORjlhYWQ0Y0YxUG0rR1ZZWFBpN2x1?=
 =?utf-8?B?S0NqOTc3MzJNOTg3ZW83WUlFYlB5czMyaEpGRTFPeFVVOVd2djRrT0tWQzJX?=
 =?utf-8?B?K0l6UXpIYWdWM0lUZGFpM2ZpdjFYZ2kxME9ucEVDYm9ZT3BCcmxVU3pWbkY0?=
 =?utf-8?B?UW16dVpWWldtNDVZYThVYzFaRGxqVjUyUGR4UCtGWGEvYkFmWGp3MkJZM3BR?=
 =?utf-8?B?K054b3JQYnJoN1JZMmYyS2tIc1BzMGR2bFIxSCtZMFJKUHV6Rnl2NWR4bkFi?=
 =?utf-8?B?RkhETXY5anlJNnlQTDhnNlVzR3E5bzBBV0NJMVE2OWpNZEpURUpaSFNBQ0Mx?=
 =?utf-8?B?dkMwZG9YdTlrbzlyaXhCam01QUE0MkRVMHJ3dmxhay85MDNXdlk5eHRiK2wz?=
 =?utf-8?B?QWtpTGlueHUrUkMrR1I4UzEyRWEyKy8vNGxXWDQyMHM4MEc5N0tFRnN1Rnlr?=
 =?utf-8?B?bEViOFpVbmNleGJsSHoxR1h5a21SaVlsUi9YcVVZd1NTeEZ5VEUrSE9kUlpL?=
 =?utf-8?B?SUpnVVROSG90N2lRM1dlUUJVL0RaQk1VWWhVeFlXbnBhcEtNWlY1U2o2STNo?=
 =?utf-8?B?MFBoWWg1cXNmL3dTRWk0dVFFTDR2NFJjZERzY3ZmL0JsaWxOQmsvMWZiSEoy?=
 =?utf-8?B?aktyV2l5TTBiUllXbUhtcGRJQks5SXJBUDVuaGtTTkc3K3FlbmFVS0NQZnRK?=
 =?utf-8?B?UlEvZ3JtNG83Q2o4aXFFOXBzTWZzeVEzMi9TNXZ0Ujl2Rm42TlpqYS83anpx?=
 =?utf-8?B?cHhYRUFyRjRHUWk0UFA3ZFpiOEwzT05mMllZcUpHVnRDQzM4bVRMU2FiaTF2?=
 =?utf-8?B?eEhPbTV5MzFJVDNkVXFpVlNVWVIvK0pkdTUvQWhQWkI1UUVWak5tQTNORnV2?=
 =?utf-8?B?K3VTd0l0cS9uUmUzVUU2WEpPZHlUb0RQbmkzcmNVQWxKOWRIV3Vab2NwOUNY?=
 =?utf-8?B?Wm9QUWZLamlUWXp0QWZTMitOMVVsWXRxMXlVM1JqV3lZNDNPb1UwSjFWUmZz?=
 =?utf-8?B?ZWY5c1UrajFhdHBMcmxWOGVscXVTUHRrdHlOM2VnVWMvOEtOcktYNFJSRXlL?=
 =?utf-8?B?Y2tuVm0zd2RnbW5HNmxaT2FrREpsSFhKSGgzVXpOeFFwU0M2N2FoUldkRENv?=
 =?utf-8?B?YkY4U2JxYlZrcEYvZVlON0dQdGdsR2RiS3RxTVVxbnVoZEJQV09aZEtiWVgy?=
 =?utf-8?B?YUxnK01BdGFjTXFHWFBtZmI0L2k5WC8xQWdUcjhld1U4c3VpOWl1ZEpUUWhD?=
 =?utf-8?B?REFPUEcweFdhTmovUEU4Vm5MUklhTTZaelNzZk1IbU53Q2t2ZHdTZytyenZn?=
 =?utf-8?B?LzViR2k2YVM0THhkcnJ6RGk4dDhHSnZjZnBoZXZuczNkK1g3SEpZeGJnYU9o?=
 =?utf-8?B?OWxEMUQ0bnRud1FxZEN4a1VGWldhaTRIdkNDQlkzanl1b1FJOFlvb3Jkb0d2?=
 =?utf-8?Q?JBtr9udbdy7/jx4aP8eD7tbP2gYWto3zpxFOhhO6mU=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71d9251d-4a4d-4a5b-0589-08d9ba310b8f
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0602MB3340.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 09:56:46.1681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U1CkblXB8JtTnaIig+hLQh9JiGpKcg0BP+ruZQAbIqtJ0fKoueAWv81JP9KHxP7avw1p2dyDFBc3F2AYn70cg74dfK6b+1fwbh/AdCmUPl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR06MB4089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 09:56:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159353

On Mon, 2021-12-06 at 23:31 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2021-12-06 at 16:35 +0100, Quentin Schulz wrote:
> > blocklist has a more obvious meaning than blacklist and is also not
> > an
> > issue wrt inclusivity, so let's use that naming instead.
> 
> A "blocklist" with a filesystem is unfortunately confusing (a list of
> block
> numbers on the filesystem?). "ignorelist" or even "ignore-devices"
> may be
> better? (or skip)

I offer "denylist".

Cheers,
Eero


