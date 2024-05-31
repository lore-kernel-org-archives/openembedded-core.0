Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B130C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 12:09:26 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.102])
 by mx.groups.io with SMTP id smtpd.web11.10003.1717157363839091690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 05:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SY+mS9IG;
 spf=pass (domain: cherry.de, ip: 40.107.104.102, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+QM8Whs/qgrqX539SfwLBYU134aqfu+y8vvktZqHUqGI3klM8ga1QjWBMiNH4xGqlsrzl47G37jeWYWTzPPIRL17EwhZ3rLLZKZXWVhZtrspALVz0gkjkJ9qFl1Tteg3yw+viYEGvDe9aNpD+12TiVdusQVIzZKXGIQal9Cedu7wGlRaAwsXTkgWAxnSXlTCxjMsx3I/kyXup6KtJ8Et14azIJ7MiQ8qSMEVmbQGoemjsoxp9s9OrK7outllAfY01/T3wG1otWN8VHPpQwt06h5GZ85l4FIRE409As61thZNcnVvBr1iGQ5kIQym7e1cwNjc3cVxKOKoGbnq/EjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Eiv687Ff/lR0KIOrCEkJfMFhvM/bfwNLqJS+dX/Cbo=;
 b=Vwh51EN2FnNcm+PGVqkXt5Wx01TYap+d+kZLRDTRM3+5/tp7JHhjRn3mrJBI2i+KG3tWz4ZuPre9pyxM6hKc42hEj2SVnzUXOSb7NaHKOlXun1+XVo7ZZuKw9/xn39/drBH5u9aH2r9nn15zSH+I3XkJt2I4rfVqzDYUprjrumOgIpALhtY+p7bmtJMXyncMmfZ3BslUli8KOYG8ToQxLErTm0KpT3p0lVTap9iq2RI3xod9PjRV0etOEOO3ZdcfK3l+iJHsBnJftTtsASrr1ipVErAsnb/hGJSkiPI8n1HXIAClbRF6coWETckr3rMr7KKrF7Hs5qtDD5fvJOxZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Eiv687Ff/lR0KIOrCEkJfMFhvM/bfwNLqJS+dX/Cbo=;
 b=SY+mS9IG8vtu+BCodimpnmCgLCsAiV+Agt4kRNffZItI5/j7SZgfUX/ZuSNJ9VKyW1/o7uTFsRHusDoaEmUTKH+hW0Z8dQ4UwI3MbbamKYI89D7olfqvP3gR+hME6YKku4SNEodUHJ5bhYDagX4gzUUFFF7TKfCRCibuRhxnKjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by DU2PR04MB8869.eurprd04.prod.outlook.com (2603:10a6:10:2e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Fri, 31 May
 2024 12:09:19 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 12:09:19 +0000
Message-ID: <ee620352-7a8e-4186-b125-304467e7d0f9@cherry.de>
Date: Fri, 31 May 2024 14:09:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] image-bootfiles.bbclass: new class, copy boot
 files to root filesystem
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20240530095314.407638-1-marcus.folkesson@gmail.com>
 <20240530095314.407638-3-marcus.folkesson@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240530095314.407638-3-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|DU2PR04MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 71eb6d36-0172-46cd-0863-08dc816a7fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dlVGbTg5cmpzYTFPQkNQVjAyTUtrVjFaQTBHUHdGeTJ2OHdnVE9Kb0NKclhG?=
 =?utf-8?B?bzhxTXZnU0xjUDIxVGd0V2xsWFhoNzNXbnhMTitUZ1J0ZFk0SElLNnJrQTZJ?=
 =?utf-8?B?c21DRTBUb2w1VlR6THlqSHd2bURkM1hMUDhzQkxxWERRSXlmMk9LOC9DbDY1?=
 =?utf-8?B?ODN1eVh2d3B6bi8xWU1RbUljT2JEb3pIcHIxL1EyZkw1SG1HbFB3NUdpYlJ5?=
 =?utf-8?B?RTZmdDZZdGRtL01Ja3JrTFhLem1rMERVdEdqTnRsRnRQYWh4eWdtNE1paU84?=
 =?utf-8?B?UW5TNWNYNFhBSjFOMVlCcFVhVXgyTEdRMkZLdWUrYXBXVFRHYlhTbGpVd05v?=
 =?utf-8?B?KzVISU9sdXR3WGgzc2VuTzNtUm4rcFNqZS9FdjY3UWVBWGgzb2FLd3lQMTJp?=
 =?utf-8?B?SzQrd3lKUW5BUDgybkJ4VGtmaFB6eWpkY01pZUxiUkVPQ00xK2NhemtrZWNa?=
 =?utf-8?B?enc0Yk5XTDdDdTNKTlpmRGRJMFVZWUdZbFRUY0xadXY1M0xUb0U4aDhYTDZx?=
 =?utf-8?B?aFBJTHllb3BOelhpUUtrYzhLUXRYbmszVUgrcTUzWG5NdEpRREN2NUNJRy8w?=
 =?utf-8?B?dGt6RlJaMEFMT0t0b1FwakhUa0JybUl1eE0wSWMxNEdBTmVoakRqZDB4ZEd3?=
 =?utf-8?B?TUd2Tks5Nk1tYjVLSDRqdXdNUUJtdnMyd080MjdmcVZ0cDI4QTNXS1pwdVB1?=
 =?utf-8?B?cXNLWDNZTmREajVmSWl3UUpoSGtyRzRpWWVYTHRMWm40TWZMdFh2MUU0RkJK?=
 =?utf-8?B?VmhLSUZuTURuaGZWK1pmNlhaZUR5K2F2NG10RFBFL1BCZGtFbnlhSUFHWjUr?=
 =?utf-8?B?N0pmOGsvUVBxdHQ0UFhUeEZFbjRaYnkydXhBR1dNYm5zWEFzNEdoSk1WWitZ?=
 =?utf-8?B?aHFpc0oyT0FRRFcwL1puSCtPS1JpaTFKYllyNDFVZThHS0Z0c0hDSVNUK05L?=
 =?utf-8?B?eGFTZ1dFY1c5ZXdOb1lLVGFSanppZC9qZjZ2aUJjMDBmT3FLNmxKeVA5cFdY?=
 =?utf-8?B?RVhYSGc1T2lCUUQ0ZXBKSGN2bjV0VVN1UTZtSnhYUDYyYlg5N3NJTzV5K2Zv?=
 =?utf-8?B?VDN6d25xdjc1NlpUTjFwUThvR2hIaDUrMVQxVWRUa2tVL0dia1NEcXd6T1ho?=
 =?utf-8?B?SjZuV3pXT1VlRFltL3RiWlAxUUxEekUreEVCUDUrRnQ1SHVrR1FGelZaQXA4?=
 =?utf-8?B?a040eEJPTm9LaTdvZ2lvS3o4RVJBaHhNb3pIMTg0bmtBM1hJWW9PUTdzQjBa?=
 =?utf-8?B?WTNTNElPZGVMdzJJUDUvb0lZMFhrTWhlTVlSMDJ5bWF0WFg1UkJmLzVZYUkw?=
 =?utf-8?B?SmIycTJEZ0R4d2s5NUpTbkF0c0k3cUZTSUhNMDNvekNTWE01Z1VxM3k1ZmtS?=
 =?utf-8?B?OTM3a01kTkFBekdqWjNtR0V2LzV6aFRaZFMrb0drazlnTUpYWHNvUE1xbE0w?=
 =?utf-8?B?R0lFRGJ4QlA3N3VRQVRONDJkZ2xBTFpnTkdMaXNHZzRlem5TZ3BYUkIrYkxk?=
 =?utf-8?B?WFVoM2RkZXRwMjRoc0cyelZqNDhDVUFVZzJUOGRjWjNTd0t6TmZBOVAxYWJq?=
 =?utf-8?B?cVVCSDZxNUxodXBlNzBNbjV2TFI1R2s2c0J0ZnV5ZFlpYmZoaEtwbE9PQ204?=
 =?utf-8?B?REFoNnBtTGJ1OEc3NkJkVFRWTmpKNS9hdWdENzFZc3ROSmRYOG53UFN5akxZ?=
 =?utf-8?B?NDFUZUZDaDl4VmE0YmFXNE9aOFdGU0xKdHNVVUUrZFlxZkZuSlprRGRRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YzNGZDFZYUcrN1EyOVNldWN5TGRXOVpvU21XVFY5dFROK0QydWJtR2ZTUXFW?=
 =?utf-8?B?Q3FXVzlDY3RvVU0xbHVDTm50bkRIMEVlcXVoSi9JcjU2ZWY5MXJ5emRUNXdT?=
 =?utf-8?B?WmVobHlNd25iakI2NGRFenNaUHE0K2pOYlZKa2Q2OGtRbVlKemhXWE1Lb2dL?=
 =?utf-8?B?aklWUldSVC9hNGdldHpwWXVaTTFuNGR4dHBJdTJaaTRtY0xFKy85K0lDVGcz?=
 =?utf-8?B?T1lhbFVFdEhFQjZSNGpZa3FZV081bVlGUE9QaWhvUEpLNk9xbHRNT0MySER5?=
 =?utf-8?B?NDc5WXFBN090dzBMdFhvdEVWZlVwRXpTaU1JV2dsNXNaVDJRR2F4aHJTeWpL?=
 =?utf-8?B?Rk9Hb05xS1ljZUE2aWRZZ3pEVndSelFsQ0hBL1o5VnR6NmxqdWZsdnZiQk04?=
 =?utf-8?B?bG84QkhsSWc2cmlGUmpXMnM4WTlqcFdCZW0vbndxc0MxMU5xMUJFMm8xQ1l4?=
 =?utf-8?B?YUpMSFNkQy95TU8yb1Z1NHlzUFdORUdXY1FJT2ZpbXdwazZHTWl6UEZIVXZF?=
 =?utf-8?B?OWJndmxmaHh3SUYvU3o2andhOHlmTDM1aHRmQmttOWNqYU5SMHRxcG15Y0gy?=
 =?utf-8?B?cGZ1R0NXWTF0TGRYTDhRdGRRaCtrYWV3Znk0akJreE5rR3lVL0QyS2hFRmw5?=
 =?utf-8?B?amVDTVkvbEVrZkhiUG5vTjlJa2pxOUp3VWdkNlgzSFBTeTlMeU81ZGJObGtQ?=
 =?utf-8?B?NktHTTV6SEFRN3N0dTJCL1BpWkJxMUlPZEdiWmc2Mk9nQ2kwS08vN0pBK1U0?=
 =?utf-8?B?aFRaclkvNjlHemg3RXRZQWt2V2FLcUN4T3pWTDdRNno0QVZyelBjSmdkRTdU?=
 =?utf-8?B?M0E2dklLUW9qWWtybUhiMjZuSVdhV3VZVjFWcE1DR0R3Nlg4WjJqVUFqbTJz?=
 =?utf-8?B?dElkUDU2bDI2Rk5kVm1JUGN6V0pBd3N6cTVJdHBpS01UcUNxdnhrUkRHb095?=
 =?utf-8?B?K2RQeVJPTnhNa2tXamZwRWtqbnFTVUZubXlrWkU5WnlOdnFPZURadDh0R3hO?=
 =?utf-8?B?MDQ2MUt1d1BDUjZHQk9BQXlOTW9keDN2ZkZYVjMyZUNlNGJZTGJrWGFQc3hy?=
 =?utf-8?B?M2ROdGpVc0JNeFlONzhpcXArUDdySzR3cDBFMGJKNFdZSlhXejQ3RFYyWWpv?=
 =?utf-8?B?ZWVQRVlpQmlvdTN6NEIyUGVEVUhSRCtvYzQ2OEd0cnZHSkVHcnp6UHM0NFVt?=
 =?utf-8?B?Q0JxZ1BnckxLeWdiZld1RzlkQnhqS3YzSlhhbmxWbEtyM3I5UHFCODZVTjI3?=
 =?utf-8?B?VitpYWs5MDFoUGNlOHZVZGE0T0ViVHhXbUo0WHZpMDhMeE5MSVVBOEQrR3F5?=
 =?utf-8?B?QWpMRkJxSGdOLytoMzZYVS9nTytRUkJDQVJBNGt3OGlMRGNSbklnRHNMRlls?=
 =?utf-8?B?c2hXeTFuSHIrOVFlRHdIK2FvcWJqekFKSGlQMHk0cjRWT0VSOVNoWGxuS01x?=
 =?utf-8?B?M1BTek5NOXM3bVRZRnMzd3ozWks4U0VKejIwWnREUVZPVFFuZVhST0R1MGZ3?=
 =?utf-8?B?b2dieHAyYmYyY3VHUFpNdnBMdjRFRUdQajdSK0RLVTBHYU04N0hnMjlxdEkr?=
 =?utf-8?B?UDhmQlpkd0Z0bTF3QVVZdUZOeXJLZjNJZFpZUmduWUc2UUJzM1VHUElRWE1C?=
 =?utf-8?B?UXhOR1Nuc1dHSUNPbGJBT1B1VklWYkhPSXFxUG9sNVNqQk9MUS8rUkFrbk5a?=
 =?utf-8?B?YlFVSms2aEpKSTU2S3k3WjRzRnhlRDZBRjZHdlgzUmdDWUpLZGpURjIrQ1ZR?=
 =?utf-8?B?R3pWS1p5L2k4T0dzYmhzZy84Z2RLUzRWSGtPZnpmd25hOThTNHRqbUJFTWoy?=
 =?utf-8?B?elBSNndQeW1Id1ErU1ZmU1RJaFd4M01XMXY2VE9QaXloV1RVeDRxNVE2Y1la?=
 =?utf-8?B?R0ZueDI2cTcrVndheDBOWWZEUW92bmx0cFlDeEFJLzZ6RUovR1pTUGRWU0VY?=
 =?utf-8?B?VmJpM0JmbE9nZmZQN2ZtVlE0MG5Nbk04SUtHZmFSaGtpWFo0QU1FMmVONStQ?=
 =?utf-8?B?SzNxM1ZGNCtKS2FCQ0xFQWI4QVltYTd5cDNuSGRBWlhiU1BhM01Bb2hZREVJ?=
 =?utf-8?B?ZDdDZFhCbzhSWEthd0NwUVp6UUVwNUkwSVlYTmdYZzZkbmM2THFTejRabjVY?=
 =?utf-8?B?WmRKQ3JXOEdIMngxL0ZOUWFidGlPc1Z3WDVSUjgrb2JseXhPdmZSSFlJWEFU?=
 =?utf-8?B?aFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 71eb6d36-0172-46cd-0863-08dc816a7fd4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 12:09:19.2692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgmIbALdNQW7b6Q1EAb+jxgugz5BtPWqw4iyahkv+AUjnWhnYHrc5iUPiVAxjArE+9cjMAJzYEzQz5qX37m4M2fJ49dyXrjFh7ZMBLrxbYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8869
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 12:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200068

Hi Marcus,

On 5/30/24 11:53 AM, Marcus Folkesson wrote:
> image-bootfiles class copy files listed in IMAGE_BOOT_FILES
> to the IMAGE_BOOT_FILES_DIR directory of the root filesystem.
> 
> This is useful when there is no explicit boot partition but all boot
> files should instead reside inside the root filesystem.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

