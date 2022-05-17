Return-Path: <henning.schild@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0A4C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:31:57 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web10.1222.1652812312867036601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rXZEWV9M;
 spf=pass (domain: siemens.com, ip: 40.107.8.78,
 mailfrom: henning.schild@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHOl8PB/DLkfcHt6khIgljo7HOOw8oc15BEEY3uDvNingvF7HOaQq9p4THnSMwY4v3JWfSFPu6Ce9EZmtVm4eNv12IaM/bvuFUu2PaJ64H42LLtsASw1kAbdUQ0D+4roQt+Mq2hjpVXer1hzO8dtqWSuQ9Oxo8Y5NMgRIAx0Bh94s3UqaV1IkSKMtne7WQo/ufH9NCfCuvAR5wCj0x0CHwp+d056S2RF0TNo+DTmLpD72YgqSAfMZtaGHqyJJj3Eylf97pPqgP2da/Gk1RfZcJ21Svmbv9Nq7wKGzA7PLApGxEiHwbSYPj1ydVMenCMKY9/6DMD70adksIkS1FQutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6enGQ8WDGEnA6VzF46e/3eFmFGurkDokiRdUnuz/AI=;
 b=ho2WDSFGRlMFnygZDUctfk3MG7i7R9jRt96gARczHbBJHX0ZHFCDSPFkAiIlHtS1jw32kwN0h6bUSYE8nbdVZ1A63Yfe4vEG3Iz6Tq5Efw8RUK+nv/0n/OuDJEg1Kjy+7BN2RK3Mqw+9Pix1XkIVPIl1mT2dTMrZ9xSTyj8IU8SCa2+cLh9efncIKNv1ceoFZE7vLdvFE1sMhW3cANyRhIHD3Ni+kI/a83Sdwn3FNr4+8Nc4cpNgJF0slzGjGbmgteubNJ2/MR393L2pdfARONJXURtKeJ7wXN42aXk+PfkegCFoPFYwCmkAXbhqYZ75Npw6x7H9t1LGc+yYmFhYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6enGQ8WDGEnA6VzF46e/3eFmFGurkDokiRdUnuz/AI=;
 b=rXZEWV9M9j/vzlXps5viQ85jQhwNYBeNnHeS9bTOIAQAyHQ3FylzrxKxGmiOXzUx3MrMHmlONKphk6oYt7gHK+fGQbAWBkocKPVlvGQvBGwbbgnuAdhJZKu9PFc6y9V1hwjf34AuP/gAuB7RgnupD8qooQr7D5/pocSRpMRM6cdNqTrBfmHnSUuFQBVcMKpKB37aYQlL76NmuqlV+R/pd3WP1CZ4auIBQzfCwK/5I0DO43nFozuTCO8t2ND4+U+7oNiiXXLiLtJurH4fKwXoLoxHD2H5s7WD4CNdbrbiVCF1Zky/q6iNK2HfBF2TcpVduEAaPzEbawCanrdlPTlzow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by AM5PR10MB1684.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:1c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 18:31:49 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ac31:609e:be08:9eee]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ac31:609e:be08:9eee%6]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 18:31:49 +0000
Date: Tue, 17 May 2022 20:31:46 +0200
From: Henning Schild <henning.schild@siemens.com>
To: "Kanagarajan, Vijaikumar" <Vijaikumar_Kanagarajan@mentor.com>
Cc: "Schmidl, Tobias (T CED SES-DE)" <tobiasschmidl@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "ch@denx.de" <ch@denx.de>
Subject: Re: [PATCH v2] wic: added fspassno parameter to partition
Message-ID: <20220517203146.5186f496@md1za8fc.ad001.siemens.net>
In-Reply-To: <401b98473f564084a6da6a550cc95236@mentor.com>
References: <20220513164044.4ad41b6b@md1za8fc.ad001.siemens.net>
	<20220515063600.777146-1-Vijaikumar_Kanagarajan@mentor.com>
	<09076afadfa0c49f65ea4d2d113fb9c6490f49ea.camel@siemens.com>
	<401b98473f564084a6da6a550cc95236@mentor.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0777.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::31) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9c1f21a-6d9b-476d-a0b8-08da38338175
X-MS-TrafficTypeDiagnostic: AM5PR10MB1684:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR10MB1684474177A787B53E11FCEC85CE9@AM5PR10MB1684.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kn/GYP2afgNLamuElyBKuBMy4r4fK06ksjSeds3gt1iuazKVI1K1NGXTaa/20XEIXNUvEX+sj+Xwcw/HfxA4vv9lV7JdqqSg7S2WXRvZPu1E4mZw5T8usMIrKogCy+Y6FWaDTK2ENreuOmNPqgBOhgwu6Rrmp+kSm7e3fYWXYPbEhr0R04t46lnKYnZHyFvj2KIAZxkBHVwUT48oH8oRN5H5vpJw6gY6fDphedPnHWSWK4i5r6MRmSzbYKAI656wjg6eF4J34FV+TpC63Md0JYMAyW+YXTmFmvLB4e3ql/3TjozTf+Kr7p7xwyglOLVhDCMgaFW/SVxvlxSgWmsTBNcMyUjnSRssbfYPmio9qYJXyldRnqTaMg1Q03eweLz6AjfmIs4rSki09ZI3XNJD5g3fnsCBVQc151FB6/v+BPC8lSnvXs7ZHsE4sDudn7xeX7pCaMF8ObBbfxiLP728EkJLs+zjygJflBCNohzkoz7bHQ6Si5410aOtuUtuIwR2Eq8u4nkZQvycSgi0uVfgMLCXqj8QWDi8sqbstSeMGlVXj2f9gPs0PLEEcKERMoTbv5OzoGbER8S3rtF1Vxlzs46e3RJIMk+HCfhA2DL4rM7O8pAxsh0j6o9xNA4xG8jPZPOyaS2nV7OYY8sGOQqPjw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(86362001)(4326008)(8936002)(6506007)(38100700002)(5660300002)(6486002)(44832011)(316002)(83380400001)(82960400001)(2906002)(66946007)(66556008)(66476007)(54906003)(53546011)(6916009)(8676002)(6666004)(1076003)(508600001)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Tyvo0JjFrFbs/cFQqsrZHgWlgsLNJkclgJ1k5+/XEvoPrP0SYsatvJYq0LdF?=
 =?us-ascii?Q?AUH2AthKhhLWmaBDwHHazDnKwwxsJbcY1zCF6U/v+Nt9n8CcDsllQyAbvve0?=
 =?us-ascii?Q?IhQXujd0Vv7czEtX0JSfVEFvnRTzlf06DLLANZ8r/bQgl0iusgQhN8J43YlP?=
 =?us-ascii?Q?48yAQPfXZxN7xFs59l9WpxLF6brhm1wczraJWshCex39ov9seW7LmY/hT/zF?=
 =?us-ascii?Q?eMUxEtMtA4BMkUm2F3FqKIsC5nolidpfFY/PSzOjBKQwSUxm0AEHNDZK/XEP?=
 =?us-ascii?Q?AxL2tNIklX424eZTa+mqmSj704dx8wNw6PaSfcLImCnHzPTObn7WTkFDFbhg?=
 =?us-ascii?Q?WK4FYr+jac2glQ3mun8G/ndIIYg4+TDL0mzkj74hr/eP6d3Fg7XT00eD0DXE?=
 =?us-ascii?Q?k4owff+pp4ZJOzeD7JjiLGpgxHTyisfJ8XZ0UzO80/StQ6xLwb01RD9L+Tgq?=
 =?us-ascii?Q?ezPphN29HZISoD2sqdzrH+au9bCwyuLIxxv/UmApd1Fr/3+Sv9h1p0X7pIjo?=
 =?us-ascii?Q?f9qRuuaqYcrrSKqRNH0pnTG5zulyYNIcD5EgKbsttRqEfb1XtoH5mV+kkvvt?=
 =?us-ascii?Q?UtadSqm5MhXzJ1yu/RBsex3amnbDHHVdsP+w/cud2g6mZoiRQUC86aDX7a2U?=
 =?us-ascii?Q?snlUAagZQ/xRbzZUWPSa64CZ3MTu65F0Ozu+1t1dEbrFO4HD2Ygl0/OdJ7FA?=
 =?us-ascii?Q?rwBXwzAK7KM5TkTx2BnLA8N4rSKM9oB9fazGZ4h3fpVgkyHRueNDbsJedrX0?=
 =?us-ascii?Q?j4eUnmXp1hpklV3jf0/Kv2bdH/LzviBw2CcvW+kyAEyMYNknCCCjsyCAfTZo?=
 =?us-ascii?Q?XxMnXHu2LsU/3X+PXr2TSdUeHRI1/zo1hoF0WlfI06aBEQaAJer3X+T7bLsq?=
 =?us-ascii?Q?cfd6VeFoFwYqmYvgd30o2DyZJ0vOwwzY8aoRRewUFOmzlqEZWN7SgfSt0tmo?=
 =?us-ascii?Q?AWDqEYPZD+rMV0VxCVUBDVAwDwjCkmsBCtqjx1eKUYAVz7G8Jjhj7X/Oy4Eh?=
 =?us-ascii?Q?NFBkK16lmy6eh1fj0Aj52XPgma4zQVstDv3831MZYojNYFwypOtl4wioJyGR?=
 =?us-ascii?Q?OIiJkj2iBVHpBKPlxdf5pPYkhmc6c+HZW46DvmQ+N8rlo5Bal+LwtBQeumod?=
 =?us-ascii?Q?w7bGCCtpita6od+GY2bBKq+xQa3V8rN9Q0alpS3AV+EpARwV4prEwtNirkYq?=
 =?us-ascii?Q?U/LPb3VIdE0fivGRaRhF3T8Pm9agugPIPbphYb4GXq4g+0xX1wWBzMbKgUc4?=
 =?us-ascii?Q?xEHecdWv6M7k8Fdw/EKa8PBS4d+R0wJGxgesepQyQyTfCtU/BQ4gaSms497N?=
 =?us-ascii?Q?PE2XWxJpYKWs12JK03/3qMZSfTd9VaPEOy3rl922sI+8G5y9HOezB6C9MpZq?=
 =?us-ascii?Q?L94WCLoQ9AeHCfVZghHjkm8HJ+VkmKtfl0aTRSY5N00HBRqDysE+dCxwukJG?=
 =?us-ascii?Q?iRWLzLUpciFxEv0sNVEBxVt/PcrsWsZ7DL8WYVF/an2D63kiE3jr7PvQMmGJ?=
 =?us-ascii?Q?/rnHNUT9Idh3fsHiecNTDMIbjtEzt5xsKc7ycc6RMlvj0Uxk0/PiH2xPGHKC?=
 =?us-ascii?Q?GWB8TuS+/sMxEbgrl76S0q2Ft97Z7Pm5mdPVwbs04iZSTL3qGMBpzhO90Qsi?=
 =?us-ascii?Q?dQaVLxOAGUj6RqR8xgSaw809qEIJltVn38imAStubu2/I/055egfDgGZpYSg?=
 =?us-ascii?Q?/K0GYS1VtG7wOzZhCkiNGXL42BEblPEXwzbgc4qsfwKnAqY2QiWDvBqn7ZJ5?=
 =?us-ascii?Q?kCg2HYtddpdxyN49lVsj2yzQoZzC1pRW6YKrM2jd+hUGosbLNAF+CcU+OlZy?=
X-MS-Exchange-AntiSpam-MessageData-1: IHOZ+ysTCXGapeNMfm4br7GAZuv2kwNjdXU=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9c1f21a-6d9b-476d-a0b8-08da38338175
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 18:31:49.4365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bbYSX2nVJeomfQibkCe7gkH2ADLGrdjlbzpzC7CaqP/bwINi5DzrRWBLh4iBRA14+PGO2Cg3L3iyASFe5Gw2bymvocU1BYdLqXThjz0+JuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR10MB1684
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:31:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165777

Am Tue, 17 May 2022 18:21:27 +0000
schrieb "Kanagarajan, Vijaikumar" <Vijaikumar_Kanagarajan@mentor.com>:

> > -----Original Message-----
> > From: Schmidl, Tobias (T CED SES-DE) <tobiasschmidl@siemens.com>
> > Sent: 17 May 2022 23:46
> > To: openembedded-core@lists.openembedded.org; Kanagarajan,
> > Vijaikumar <Vijaikumar_Kanagarajan@mentor.com>
> > Cc: ch@denx.de; Schild, Henning (T CED SES-DE)
> > <henning.schild@siemens.com>
> > Subject: Re: [PATCH v2] wic: added fspassno parameter to partition
> >   
> Hi Tobias,
> 
> > Hi all,
> > 
> > On Sun, May 15, 2022 at 08:36 AM, Kanagarajan, Vijaikumar wrote:  
> > >
> > > From: Claudius Heine <ch@denx.de>
> > >
> > > The `fspassno` parameter allows to overwrite the value of the last
> > > column (`fs_passno`) in the /etc/fstab of the target root file
> > > system. This allows to have periodic file system checks.
> > >  
> > 
> > I've found this to be ineffective for `/`, as the fstab update is
> > explicitly omitted in
> > `scripts/lib/wic/plugins/imager/direct.py:120`:  
> 
> I believe wic has changed much since the first appearance of this
> patch.

Yes, some bits have changed but i also do not recall all the details.

> > 
> > ```
> > for part in self.parts:
> >     if not part.realnum or not part.mountpoint \
> >        or part.mountpoint == "/" or not
> > part.mountpoint.startswith('/'): ^^^^^^^^^^^^^^^^^^^^^^^^^
> >         continue
> > ```
> > 
> > I've created a patch, originally for different reasons, that will
> > also address this issue.  
> 
> If you can send that, we can drop this patch in favour of it.

AFAIK Tobias will be aiming at allowing wic to create fstab lines for
/, so it will not replace but instead boil down to merge order.

I can only assume that / might for some people for sure be a prime
target for --fspassno.

regards,
Henning

> Thanks,
> Vijai Kumar K
> 
> > 
> > Kind regards,
> > 
> > Tobias  
> 


