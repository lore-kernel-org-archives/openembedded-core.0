Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D05C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 08:34:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.132])
 by mx.groups.io with SMTP id smtpd.web11.69390.1674722061845872036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 00:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@estab.onmicrosoft.com header.s=selector2-estab-onmicrosoft-com header.b=OYmjr5K7;
 spf=pass (domain: est.tech, ip: 40.107.20.132, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4nXaZoAlJzI/rOLLGOACQ2fRWu1j0mv9QFBBkaoIjfjPHPuS92E/CRZjcsCDj3crkbRDtfrPJreIMKH9Sv1icnWBtXmnEL8pXOEXdAk+D8AT+CjpNjBII9vHlHX4iHpqiG+3gNY64I5QQZl2/R8y6WnQy6OF/iYh60WUlUTLJyUAkJlTEkHeiIQNDTUfCS8+xDUQMA0HScGmbLH8dmjcU99YsunkNWKT2OdzeSMYcRZ1x26g5N3c/EdqXBnZ7Sjy1bmv0FFPlBCdz+X0AV0rmL3gO3MOJC1ioVdD+mHZAGljfRFptg7kCPW/7XtiX1jqQ26vBJw9ctgCz2xmVfypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+BccdpNrO3W21dbDBNSR3RrI5GogzjLBrz6BCpxXcg=;
 b=aB0OY5fatOcmbf+ifMcJgO/zJmZXFdW22UXRfDq3rFJCqZXOz4UBHVETnvRK5TWOM0KR5ai1eyXonWjZnOVZJMgiAoX+sdcOq8MrwY7C+v/hBHrNAdPvhgLzd9vviOEwBQcwuleQuY7ZlpXVDOqfhd15H9XphgYrOk15+RnYVhBAwTL4WHFVcdXZMmzn/WXWotI6IhdJFBp2nNIamok2PyHiZ0ja624vl/OYOcIERj0cKVXGWozy1s+HGWYmsPFu8kuL8rmzLtXQFRL8UsOpH3Z9KPb6G/m/V6JhbyavphHOBcSbDADMALKY4N86n1xQJAsR3/j6J+kzmySjrfRTeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+BccdpNrO3W21dbDBNSR3RrI5GogzjLBrz6BCpxXcg=;
 b=OYmjr5K75+DQos6ObVXZ+Ki4cujg/WqMyrfPpY3Wz3IPc2lMIPm9/JTGGgQ14ltDB0q2hmSdOZKmfDcHCGBO30bE4AhOBZk5qaUokf4sglNHrVEsmM7cIGPcn36FFDnWReJ34y4AtOEADs9ClgWKUmm0AJuYsg+5U3MUwTDC2Sk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by GV1P189MB2083.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:56::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 08:34:18 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38%4]) with mapi id 15.20.6002.028; Thu, 26 Jan 2023
 08:34:18 +0000
Date: Thu, 26 Jan 2023 09:34:05 +0100
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
Message-ID: <20230126083405.p2zetoclu7izf4ej@serber-ng.hemma>
References: <20230123081621.7517-1-ravineet.a.singh@est.tech>
 <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com>
 <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma>
 <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
 <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma>
 <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
X-ClientProxiedBy: GVYP280CA0002.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::9) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|GV1P189MB2083:EE_
X-MS-Office365-Filtering-Correlation-Id: 73439619-5403-4c1e-c4fc-08daff781d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qsbQrSRTQ01x7OX7BJFqH5pBbpMWEhCwvWB8Ifgl/YACtR0/otvvJRbrdgVpTgeJdlziU2h4lVI7z3mExX517w8oXkx4CH5m2rBEvH9SSBhmIL20td4yV73q0nGHKefRxNeTWgQmZah1IBSUuBwItZUXHikehBhrGcp5tUdvvv2E4hRacCHVaIqMuVY1Uk73fXFj2BvReI06fGBVT2fBdDcn8MMFWd3pVcJ1VxMDsqP2GDD+kq03LYPTZuvd2QNPBBiRtvkOnZY0fDd2rH7yRTNtVF+TZ5RZj4MNCNkece/F+N1OBwdA0Cvv+p9czNFY+9I0D9rpknFVpaBctxANMTGYE5Ol46OXdYrVBk5fCJKqn/sI1Fu943Mw3CvG0LvkYE9punJ0PNPy1ZrxBKkZJ5yUBAWTp7U36JpfvUbe6f5/dk44S5WD1X39UIPfyheZrb9cfqD+r4eyHSyGv90w8x5J6hrkyF9O3pjYBP+2C1PO7ynZxpuv4kt8nYoe/aIJQEF9dtJMZyO1gvwr9GkmgBm0vZOdYO93X34JZv6qyt3vqxalcUXVryG1jzhW383G1eISG425DnpBLg/yk3tUsyLuQ6tp6Fe44Bk5/K8G6Fll2P58Bi+ybspzoE1qFtblZWUUYZ6Ht58FNcYEfIj4dPAJVRpxk3impDjVU6Cnkpds5J9k+RXabDeSxreta+8f
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(346002)(39840400004)(376002)(136003)(396003)(366004)(451199018)(86362001)(316002)(966005)(38100700002)(2906002)(4326008)(6916009)(5660300002)(83380400001)(8676002)(41300700001)(8936002)(66476007)(66556008)(9686003)(26005)(1076003)(6666004)(6512007)(186003)(66946007)(6506007)(6486002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BXExprd1QLxHW6y1pAjnNdBPLDz1yA4zogOGVby3GlB/Z6LHAPoAvpRzs3C0?=
 =?us-ascii?Q?BpH9g1WznMvN6Se5nrT8Ky2G9NpPuf5uMc2NVJ+RucIyWmVRj/CTudx71A6X?=
 =?us-ascii?Q?PyArNNyctQtOMbwPtgFZgEneemyeTx2fWDBFRhA7yHU7noqTNMAfEkIm5nVr?=
 =?us-ascii?Q?72czE/2gDsJA369XqV8y4bz2BI0ub1BfsjUCMFK5ivvGlhTfHD7yx6bhsSOh?=
 =?us-ascii?Q?lk6LzgoDgN0zb3K/M9CoPf/UDDmcbjTX0VlJJFb3X/lL/xr0+KlVGvFK3+Nr?=
 =?us-ascii?Q?WYhXcY5qb00vwb7zYZKvB9wtZ6jbctsOFj1WqV6yFf3niohs9L0VJk+83MqK?=
 =?us-ascii?Q?eiUjc8RveX51MFPtMbnnaYJ8rvNlxriTk2yf4KfbviiMjcfXc3TtjnomRYRX?=
 =?us-ascii?Q?a3vFbQs68+9BOs9/s+ka5KekzZ7/keBjJGPHZLd2+DvPpLozMuJ32JliVpq+?=
 =?us-ascii?Q?p4Lr5ApWSgPrZ+66xRRtJ0vAME5bN4/jV/FkdY/ztzIq5EHW4L325GcffXcx?=
 =?us-ascii?Q?L4UYL0FudHEDbPe63lAf6YHx9t+hN9b4mUR3iAbvAXr8Q2ORs6H8eqpyOBmg?=
 =?us-ascii?Q?IDpwjRSbcZCzEv2B6JC3DcO57o6ctBTZiC5v1/4AU4mJ9M1kiDOFacG0Ob5J?=
 =?us-ascii?Q?3LBbXe6o7fAbVphiVGYDpLDdVbvxB91/iD3TLpD62UR53UgwblW3Xl/bjKeG?=
 =?us-ascii?Q?fvQU5Jx77NO5aERVRgWK/6l+y41KjQimfhmytcOqiiwIRaLOIIEypz4iRDGA?=
 =?us-ascii?Q?AnNplvcsbJ+aelbL37iw6mFRlkLCbXzaeCih2uZalfYv9wzpbFty7lOh9XrF?=
 =?us-ascii?Q?HNVgACaMC4OYF54+6Tiwx5IL1LCsrMPgUpGfbzg3GcWvbCKgnFp9KPUxWlkO?=
 =?us-ascii?Q?xiWcepx1NzfxJt/L62dRmZsdqbmP4YOEk+dQQ5yMjatv6xkHBRoz9aCpIIye?=
 =?us-ascii?Q?0O/1spt8dRHnreZj7aCzCROTzqMcifRHUce3u12fD/q5apK1ONwb1y7WvSZ3?=
 =?us-ascii?Q?EJzISe8YIktZSw8GX23fN8+A8tA6Qp8vjkv4epq/BPolis7FKY43ClC5WBha?=
 =?us-ascii?Q?MpOugKTZj6E+rfffzKHwLQLXU50b9UzWn+qyq/L5Jpy+u9+CpfppWhwce4vo?=
 =?us-ascii?Q?61VCYPFz/K0E+bS8KmRQXBv8/iGIyxPSDLYZmPgaOKO2iD0S2Aj6MNApYETE?=
 =?us-ascii?Q?die9ndqUuiL/1jZvKJeApVtDtxEPZfCjuHWi3XCa+tuD9P+2dW4gpTycxkP2?=
 =?us-ascii?Q?WYWiAhZf5UxvuqorRTw5wbMeWZgvyu6egAhG1En1Ee7KcE4V66w7oyrNhUFf?=
 =?us-ascii?Q?QG0vqS40fxEDsuSUDEpZz4SHsujD34HIvizuwffAP5XrywMZ8yfY7MBDscvE?=
 =?us-ascii?Q?Cn33QbXH7fn0rV0AyDnVw/bFCJcv36mYZ9sSNPClpNVvdR0HSfWjdWZiOMG8?=
 =?us-ascii?Q?3s2HaIydldb6hKrk8QADUnUpX5gkWlBz3DMVi0Q0Ik07dSNz/ApVo/3PEPN0?=
 =?us-ascii?Q?McaPsKA0VkWmzf/16Jmr4wWMLqf6LfdrPF/PuGdYWnHDguxO5YoqbT2Dk0XM?=
 =?us-ascii?Q?q+0dKT3MypfCvtMTlRLjKgTWjc1zsbnIz49yIU5s+H6kB4A21+Q41r5DOvIu?=
 =?us-ascii?Q?+g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 73439619-5403-4c1e-c4fc-08daff781d55
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 08:34:18.0758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46LvDs6hKFp9aTTGcUlbuC+THV33//O+I0BUGMepZI6cjenvwR/gpaYsY9lmu1nt70taUp78w4vybdWI811Kf8rCA+nRKZGOeeocoLWz9Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176385

My bad, will fix and resend the patch.
Thanks Alex!

/RAvineet

On Thu, Jan 26, 2023 at 09:18:06AM +0100, Alexander Kanavin wrote:
> On Thu, 26 Jan 2023 at 09:03, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> > > Also the newly added patch is missing Upstream-Status. Aren't you
> > > getting a build failure with that?
> > Sorry, I am new to openembedded/yocto hence I do not know where to find the build output/status. Could you point me to it?
>
> I applied your patch, and run 'bitbake gnutls'. The following error occurs:
> ERROR: gnutls-native-3.7.8-r0 do_patch: QA Issue: Missing
> Upstream-Status in patch
> /srv/work/alex/poky/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> Please add according to
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status
> . [patch-status-core]
> ERROR: gnutls-native-3.7.8-r0 do_patch: Fatal QA errors were found,
> failing task.
> ERROR: Logfile of failure stored in:
> /srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/gnutls-native/3.7.8-r0/temp/log.do_patch.114509
> ERROR: Task (virtual:native:/srv/work/alex/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
> failed with exit code '1'
>
> How did you test your work and get to the point where you can run the
> ptest? Are you getting the same error?
>
> > I will add 'Upstream-Status: Pending'.
>
> Is there a reason to use Pending? If yes, you should say what it is,
> otherwise please submit the patch upstream.
>
> Alex

