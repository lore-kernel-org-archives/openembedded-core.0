Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99AEC352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 07:45:19 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.115])
 by mx.groups.io with SMTP id smtpd.web10.9943.1670399112368942713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 23:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com header.s=selector1-arrigroup-onmicrosoft-com header.b=jAXZSp//;
 spf=pass (domain: arri.de, ip: 40.107.13.115, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2S816OYYBvGKpr+1lRpeKQpdGehPM54c7+oQwhmtTms19t4Q3IXRXubziSHCiDeMYvWh/yDizhNn/DOzBc+LhsSujYlW92rHsAM5BqK+ZLd1VVUFN7ki67tJT6ejcMP8BowLfJOWR7ZRrgJnHS3XkntLvYSSv1KHcaku0rnPejQO0HgvFZBdzVXVV5VTJmptyBuJn9dO18Q+Gr/KgQqa0Pwl/DwEDaXveiniaNabaJ4nD3yEaBN4oEiLMfQFFsRTZXpbuGs65oQf3h4VwfWVYfMDxwVCGy3L7kPPbMgvPNzFPYMPxMCOWaYIdFm9uJb5oetYmIwQfdYO11d0P5Mcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seqbuGtMP7pPydOxfYzNng9HuquOgu1xJa9n+Dejjp4=;
 b=mCeJ85IGBaXqFcqNXYjdTQzaE/a2/vJpYZ4SqQmccKI+Abk4GDt87XN+oMXOG6LMdv+so3BkbXmHwidlAq4+N7lXkk2b6/RuLG8wlKytzpzI5NsHlvaCY3crzVQ1An0CqcUd6CJ4TipxoRrn4pYMBvt/x9FFjRfzugXxMOhwr9Rhup2hIBVRJ1vLIjwKtA55mfNL4vWMASKjG9b0IeuPnCnoVqsyj4m29/q0ibbPA/qR5XAPxpsn7NXctnJlHTtxHgj4v/yA1wuiIALjuw/XEMoDZVpHFyiYryqL1PxqAcbhRC+astg37R6Y4pyDn9QmRv5zMnhr+bgMawCVdNTD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 52.169.0.179) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de;
 dmarc=bestguesspass action=none header.from=arri.de; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seqbuGtMP7pPydOxfYzNng9HuquOgu1xJa9n+Dejjp4=;
 b=jAXZSp//3SQY93aC1eBkRVyKWE71KpPzNSnKmEWDxTkuam+IN4ThRVNInUQMeVJ7hfO0dPMqulQbyeqQYtHVllWyv1s1U4mQkaZLyGMKA1KSTxpi/hF4kI4cdZkzAdgRy/1jxks9Th9hg/HDd6vTQ41iWHMp7nrKQNOUvn1kvow=
Received: from DB7PR05CA0069.eurprd05.prod.outlook.com (2603:10a6:10:2e::46)
 by AS8PR07MB7703.eurprd07.prod.outlook.com (2603:10a6:20b:25d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 07:45:07 +0000
Received: from DB5EUR02FT066.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::f5) by DB7PR05CA0069.outlook.office365.com
 (2603:10a6:10:2e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Wed, 7 Dec 2022 07:45:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net; pr=C
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 DB5EUR02FT066.mail.protection.outlook.com (10.13.59.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5880.13 via Frontend Transport; Wed, 7 Dec 2022 07:45:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.108)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Wed, 7 Dec 2022 07:45:06 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 10623101
X-ExclaimerImprintLatency: 2949856
X-ExclaimerImprintAction: 4e5b0c8189a0405bb7cf81396da92903
Content-Type: multipart/related;
	boundary="----_=_NextPart_0c66fcb9-59a7-43cc-863a-a91db775e2a4"
Received: from DB7PR05CA0071.eurprd05.prod.outlook.com (2603:10a6:10:2e::48)
 by PAWPR07MB9345.eurprd07.prod.outlook.com (2603:10a6:102:2e4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Wed, 7 Dec
 2022 07:45:04 +0000
Received: from DB5EUR02FT043.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::77) by DB7PR05CA0071.outlook.office365.com
 (2603:10a6:10:2e::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Wed, 7 Dec 2022 07:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB5EUR02FT043.mail.protection.outlook.com (10.13.59.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Wed, 7 Dec 2022 07:45:04 +0000
Received: from n95hx1g2.localnet (192.168.54.106) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 08:45:03 +0100
From: Christian Eggers <ceggers@arri.de>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: kernel: export native PKGCONFIG variables
Date: Wed, 7 Dec 2022 08:45:03 +0100
Message-ID: <4793800.31r3eYUQgx@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
MIME-Version: 1.0
X-Originating-IP: [192.168.54.106]
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: 
	DB5EUR02FT043:EE_|PAWPR07MB9345:EE_|DB5EUR02FT066:EE_|AS8PR07MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 67aad44e-ec93-49e5-6f13-08dad826f5b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3ddTmGkLzltk486xF5bZV3e7WtjdyIWc+V3Y3uLb/qc2+fo7CaCln3QV3lq3dAeUu1DtdsfjQp5wMdvVOErTCBQ6ypN9ZAOpE+IdvbL1MPh6M53rS8sqM4rIsGmmSLYhj16TbEEKnPN9iIQItpqCCCkwOAxM19bxwpX/V/GOIubv4zfUANJq1+ha+FD891DkTO/J6pEufWV4c4fOzPXxnCIkY1yuClkd/BGsM4xhOnyROTge8HyAtLrJyUMMvHYgdwYjm4LHOVI3miGDhhZZYhafoNyc/ySvDnEjL7AhbZ28roH6PI7NlCsUXDN5kYKlFlgsD8AmP9wL5Z1R/jVM34+ORjuDQl0Kkg43i0b6C4eqSnqYCVv1MFgw1f8aYZCxyK3YlL9qGs3bXggAwnx0N8kQwxwvyBFy64ag2z5jA1MN/5qgi7XXUxWLbgSHm+Qhh4Zjao82jxWkn4M0I23MfRNo4t16+RSqr6hkFRkoy9ctwINSFe9TEbgqRR2d+g/gt4Q3N9L2ZBItEEOZAtNmHAIIubcV7PN7OU1af4/NzkDZsvG3B4xhkIjEc7GU+il0GEDB/6QvUnZAUTEhh6HpfYLOBPrSt1WZd3iN1vVP61LbtHsmohIQnD8hlEWDnnj0qZ6KU5uIn1/p5DlcdepooJOn2NFKIYMy0715dbXulkakDCoP6jwdB6tuTeQ+lf44+v1F0pcYmbTapaBS9exV4KoI1KqDf6Oz79paYFB1rGV60wAA0ht/ywHooZGxSYw1
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(36840700001)(46966006)(356005)(4001150100001)(33716001)(81166007)(47076005)(5660300002)(41300700001)(4326008)(86362001)(8936002)(2906002)(36860700001)(83380400001)(82740400003)(966005)(6916009)(478600001)(316002)(70206006)(70586007)(36916002)(16526019)(40480700001)(26005)(9576002)(336012)(426003)(82310400005)(9686003)(8676002)(186003)(39026012)(36900700001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9345
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR02FT066.eop-EUR02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bdeb74ac-9031-4936-1533-08dad826f414
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	80ANT8GpkA6lgzcgrQkCRouVB2BVTgQ36pRdNkbb3U6xj1NxvxH9gudFqO0bL+tXmKvsCPIcsJgiDusR6dZyxjUm84AsG4Q6jK1EzeMqMp3ASq1V0eZSaIFFpCn67Wk8K3Tfh5ul9DLb0CBZEEykOcyrmB/Gu9FOjD8r4mLWo0sDkbedBQdL6pi2PO/zfn6twAQmw4ZOAPJn+3sipB3FgM0GjPkskwJrY8uai9mDgPh/szxApQaJ0N4gjKXfVhRdyUSXbl77FQAKtkYvYVFZhFTG1rFg2QVtaid4m/0R5kvjLuZP0znyQa+kKSWK9WvuDU0bxHkVUOMi/N/BadiCZa1Ct0ynt++OiaLMxAVHN4Hw0+2kr19hbDcofKSLou7+LAKDOyaMY6vgIYazQRpxHxjfOF10f/8CK81J4EVObe/F3jxSiakEwuQ74xHnUDn2P9XGocS8jzvKvbj2VpEqdw5276/0V0wVlSBh5Rb/l6mY7y0sRa/e/1fvpEht5dZbCnvehm7wulfucU4f56LY+vZKRlPmzyszpgyg1NjAilj/im2v8fbVpXLR2O1D9914sYMo+wlOym8X1soX17HsdxDVVvJcsy4wVf7YtRnfM++2kkMfhIn1L8ahChKcR6TqoqhTPU0fRA4vz0QQsikzugQ2x5b2deijna7tz5ulTTI0tQb6sS/SNk4S0qG1yg6ANp+54e5Qtisgryl9jh9d3oR/fbhmyR00aiqIrrNrxeglrqa+1DNxZSJCF/1ujZJcwb3ToZq5OtZ3zJQd4KRx4hqTBHi07YBE3Aksg0OS5J5SkLAihLR1cdfBir8PeDjQszPOtNGvo7/4axdueYiUdDcq+RDRz5DJAx90m6j83+U=
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(1690799008)(451199015)(46966006)(36840700001)(40470700004)(478600001)(40460700003)(36860700001)(966005)(83380400001)(6916009)(7596003)(7636003)(41300700001)(16526019)(166002)(186003)(33964004)(36916002)(4001150100001)(2906002)(82740400003)(45080400002)(70206006)(9686003)(70586007)(82310400005)(316002)(86362001)(26005)(15974865002)(33716001)(336012)(4326008)(47076005)(5660300002)(66574015)(8936002)(9576002)(426003)(40480700001)(8676002)(39026012);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 07:45:06.3296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67aad44e-ec93-49e5-6f13-08dad826f5b6
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR02FT066.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7703
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 07:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174343

This is a multi-part message in MIME format.

------_=_NextPart_0c66fcb9-59a7-43cc-863a-a91db775e2a4
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_35c2e375-da4d-4048-a74e-945a7cdd7a1a"

------_=_NextPart_35c2e375-da4d-4048-a74e-945a7cdd7a1a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Bruce,

on 2021-11-23, you added the following patch:

> 9172d61c57e23682c3d2c25701cbd53c84d01a27
>
> kernel: export native PKGCONFIG variables
>
> In a similar manner to cml1.bbclass, we export the pkg-config
> variables to allow a direct call to pkg-config access to the
> native sysroot versus the target sysroot.
> 
> The kernel doesn't use pkg-config for target configuration,
I found some calls in the tools/ directory of the kernel.
Isn't this related to target configuration?

> and has many explicit calls to pkg-config, without the
> possibility of easy override to pkg-config-native.
I just noticed that this has recently changed:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dd5ea4fece4508bf8e72b659cd22fa4840d8d61e5

This change is in Linux 6.0, but not in 5.15. Probably it
could be backported easily.

> 
> The calls to pkg-config could be made cross friendly via
> replacement with make variables, but until that effort is
> undertaken upstream, we need a bridge approach.
> 
> In particular, this is required for dtschema validation,
> which is a requirement in kernel 5.16+

regards
Christian




_______________________________________________________
Christian 
Eggers
Software Engineer
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG 
Arriweg 17, 
83071 
Stephanskirchen
www.arri.com 

+49 8036 3009-3118
CEggers@arri.de

=E2=80=8B
Get all the latest information from www.arri.com, Facebook, Twitter, Instag=
ram, LinkedIn and YouTube.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Matthias Erb (Chairman); Dr. Michael Neuh=
=C3=A4user; Stephan Schenk; Walter Trauninger

=E2=80=8B

------_=_NextPart_35c2e375-da4d-4048-a74e-945a7cdd7a1a
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>Hi Bruce,<br /><br />on 2021-11-23, you added=
 the following patch:<br /><br />&gt; 9172d61c57e23682c3d2c25701cbd53c84d01=
a27<br />&gt;<br />&gt; kernel: export native PKGCONFIG variables<br />&gt;=
<br />&gt; In a similar manner to cml1.bbclass, we export the pkg-config<br=
 />&gt; variables to allow a direct call to pkg-config access to the<br />&=
gt; native sysroot versus the target sysroot.<br />&gt; <br />&gt; The kern=
el doesn&#39;t use pkg-config for target configuration,<br />I found some c=
alls in the tools/ directory of the kernel.<br />Isn&#39;t this related to =
target configuration?<br /><br />&gt; and has many explicit calls to pkg-co=
nfig, without the<br />&gt; possibility of easy override to pkg-config-nati=
ve.<br />I just noticed that this has recently changed:<br /><br />https://=
git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Dd5e=
a4fece4508bf8e72b659cd22fa4840d8d61e5<br /><br />This change is in Linux 6.=
0, but not in 5.15. Probably it<br />could be backported easily.<br /><br /=
>&gt; <br />&gt; The calls to pkg-config could be made cross friendly via<b=
r />&gt; replacement with make variables, but until that effort is<br />&gt=
; undertaken upstream, we need a bridge approach.<br />&gt; <br />&gt; In p=
articular, this is required for dtschema validation,<br />&gt; which is a r=
equirement in kernel 5.16+<br /><br />regards<br />Christian<br /><br /><br=
 /><br /></div><div dir=3D"ltr" style=3D"mso-line-height-rule:exactly;-webk=
it-text-size-adjust:100%;font-size:1px;direction:ltr;"><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;font-size:1px;"><=
tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;">=
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:=
0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertic=
al-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" styl=
e=3D"width:100%;font-size:0;"><tr style=3D"font-size:14.67px;color:#7F7F7F;=
font-style:normal;font-weight:400;white-space:nowrap;"><td align=3D"left" s=
tyle=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">_________=
______________________________________________<span style=3D"font-family:re=
mialcxesans;font-size:1px;color:#FFFFFF;line-height:1px;">&#8203;</span></t=
d></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-alig=
n:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"fo=
nt-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical=
-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weight:400;white-space=
:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"vert=
ical-align:top;font-family:Calibri,Arial,sans-serif;">Christian</td><td ali=
gn=3D"left" style=3D"vertical-align:top;color:#000001;font-family:Calibri,A=
rial,sans-serif;">&nbsp;<br /></td><td align=3D"left" style=3D"vertical-ali=
gn:top;font-family:Calibri,Arial,sans-serif;">Eggers</td></tr></table></td>=
</tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:=
top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font=
-size:0;color:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;=
"><tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"vertical-ali=
gn:top;font-family:Calibri,Arial,sans-serif;">Software&nbsp;Engineer</td></=
tr><tr style=3D"font-size:14.67px;color:#000001;"><td align=3D"left" style=
=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">&#8203;</td><=
/tr></table></td></tr></table></td></tr><tr style=3D"font-size:0;"><td alig=
n=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspaci=
ng=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td=
 align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cell=
spacing=3D"0" border=3D"0" style=3D"font-size:0;color:#0E50AD;font-style:no=
rmal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:13.33px;">=
<td align=3D"left" style=3D"vertical-align:top;font-family:&#39;Arial Black=
&#39;;">ARRI</td></tr><tr style=3D"font-size:10.67px;color:#7F7F7F;"><td al=
ign=3D"left" style=3D"vertical-align:top;font-family:Arial;"><span style=
=3D"font-size:11px;">Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&=
nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG</span>&nbsp;<br /></td>=
</tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weight:400=
;white-space:nowrap;"><tr style=3D"font-size:10.67px;"><td align=3D"left" s=
tyle=3D"vertical-align:top;font-family:Arial;">Arriweg&nbsp;17</td><td alig=
n=3D"left" style=3D"vertical-align:top;font-family:Arial;">,&nbsp;<br /></t=
d><td align=3D"left" style=3D"vertical-align:middle;font-family:Arial;">830=
71</td><td align=3D"left" style=3D"vertical-align:middle;font-family:Arial;=
">&nbsp;<br /></td><td align=3D"left" style=3D"vertical-align:middle;font-f=
amily:Arial;">Stephanskirchen</td></tr></table></td></tr></table></td></tr>=
<tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"=
><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size=
:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:=
top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font=
-size:0;color:#1532B9;font-style:normal;font-weight:400;white-space:nowrap;=
"><tr style=3D"font-size:11px;"><td align=3D"left" style=3D"vertical-align:=
top;font-family:Arial;"><span style=3D"text-decoration:underline;"><a href=
=3D"http://www.arri.com/" target=3D"_blank" id=3D"LPlnk689713" style=3D"tex=
t-decoration:underline;color:#1532B9;"><strong style=3D"font-weight:400;">w=
ww.arri.com&nbsp;<br /><br /></strong></a></span></td></tr><tr style=3D"fon=
t-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadd=
ing=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#858080=
;font-style:normal;font-weight:400;line-height:normal;white-space:nowrap;">=
<tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"padding:0;vert=
ical-align:top;font-size:0;"><img src=3D"cid:image336616.png@4C0C5F83.ACE39=
45E" width=3D"20" border=3D"0" alt=3D"" style=3D"width:20px;min-width:20px;=
max-width:20px;font-size:0;" /></td><td align=3D"left" style=3D"padding:0;v=
ertical-align:top;font-family:Calibri,Arial,sans-serif;"><a href=3D"tel:+49=
%208036%203009-3118" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-dec=
oration:none;color:#858080;"><strong style=3D"font-weight:400;">+49&nbsp;80=
36&nbsp;3009-3118</strong></a></td></tr><tr style=3D"font-size:0;"><td alig=
n=3D"left" style=3D"padding:0;vertical-align:top;"></td><td align=3D"left" =
style=3D"padding:0;vertical-align:top;"></td></tr><tr style=3D"font-size:0;=
"><td align=3D"left" style=3D"padding:0;vertical-align:top;"></td><td align=
=3D"left" style=3D"padding:0;vertical-align:top;"></td></tr><tr style=3D"fo=
nt-size:14.67px;"><td align=3D"left" style=3D"padding:0;vertical-align:top;=
font-size:0;"><img src=3D"cid:image460246.png@47069BC7.569C60D9" width=3D"2=
0" border=3D"0" alt=3D"" style=3D"width:20px;min-width:20px;max-width:20px;=
font-size:0;" /></td><td align=3D"left" style=3D"padding:0;vertical-align:t=
op;font-family:Calibri,Arial,sans-serif;"><a href=3D"mailto:CEggers@arri.de=
" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;color:=
#858080;"><strong style=3D"font-weight:400;">CEggers@arri.de</strong></a></=
td></tr></table></td></tr></table></td></tr></table></td></tr><tr style=3D"=
font-size:14.67px;color:#000001;font-style:normal;font-weight:400;white-spa=
ce:nowrap;"><td align=3D"left" style=3D"vertical-align:top;font-family:Cali=
bri,Arial,sans-serif;"><br />&#8203;</td></tr></table></td></tr><tr style=
=3D"font-size:0;line-height:normal;"><td align=3D"left" style=3D"padding:0;=
vertical-align:top;"><a href=3D"https://www.arri.com/en" target=3D"_blank" =
id=3D"LPlnk689713" style=3D"text-decoration:none;"><img src=3D"https://asse=
ts.arri.com/media/sign/2022_11-17_E-mail_signature_-_xmas_-_Retina__-_02.jp=
g" width=3D"466" height=3D"205" border=3D"0" title=3D"Season&#39;s Greeting=
s" alt=3D"Season&#39;s Greetings" style=3D"width:466px;min-width:466px;max-=
width:466px;height:205px;min-height:205px;max-height:205px;font-size:12px;"=
 /></a></td></tr><tr style=3D"font-size:13px;color:#7F7F7F;font-style:norma=
l;font-weight:400;white-space:nowrap;"><td align=3D"left" style=3D"padding:=
0;vertical-align:top;font-family:Calibri,Arial,sans-serif;">Get&nbsp;all&nb=
sp;the&nbsp;latest&nbsp;information&nbsp;from&nbsp;<span style=3D"text-deco=
ration:underline;"><a href=3D"https://www.arri.com/" target=3D"_blank" id=
=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F7F7F;"><strong=
 style=3D"font-weight:400;">www.arri.com</strong></a></span>,&nbsp;<span st=
yle=3D"text-decoration:underline;"><a href=3D"https://www.facebook.com/Team=
ARRI" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underli=
ne;color:#7F7F7F;"><strong style=3D"font-weight:400;">Facebook</strong></a>=
</span>,&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"https:/=
/twitter.com/ARRIChannel" target=3D"_blank" id=3D"LPlnk689713" style=3D"tex=
t-decoration:none;color:#7F7F7F;"><strong style=3D"font-weight:400;">Twitte=
r</strong></a></span>,&nbsp;<a href=3D"https://www.instagram.com/arri/" tar=
get=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;color:#7F7F=
7F;"><strong style=3D"font-weight:400;"><span style=3D"text-decoration:unde=
rline;">Instagram</span></strong></a>,&nbsp;<a href=3D"https://www.linkedin=
=2Ecom/company/arri" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-dec=
oration:none;color:#7F7F7F;"><strong style=3D"font-weight:400;"><span style=
=3D"text-decoration:underline;">LinkedIn</span></strong></a>&nbsp;and&nbsp;=
<a href=3D"https://www.youtube.com/user/ARRIChannel" target=3D"_blank" id=
=3D"LPlnk689713" style=3D"text-decoration:none;color:#7F7F7F;"><strong styl=
e=3D"font-weight:400;"><span style=3D"text-decoration:underline;">YouTube</=
span></strong></a>.<br /></td></tr><tr style=3D"font-size:0;"><td align=3D"=
left" style=3D"padding:0;vertical-align:top;"><table cellpadding=3D"0" cell=
spacing=3D"0" border=3D"0" style=3D"font-size:0;color:#6A6A6A;font-style:no=
rmal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:10px;"><td=
 align=3D"left" style=3D"vertical-align:top;font-family:Arial;"><br />Arnol=
d&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;=
Co.&nbsp;Betriebs&nbsp;KG<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;=
Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Han=
delsregisternummer:&nbsp;HRA&nbsp;57918<br />Pers&#246;nlich&nbsp;haftender=
&nbsp;Gesellschafter:&nbsp;Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Te=
chnik&nbsp;GmbH<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registerge=
richt:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregist=
ernummer:&nbsp;HRB&nbsp;54477<br />Gesch&#228;ftsf&#252;hrer:&nbsp;Dr.&nbsp=
;Matthias&nbsp;Erb&nbsp;(Chairman);&nbsp;Dr.&nbsp;Michael&nbsp;Neuh&#228;us=
er;&nbsp;Stephan&nbsp;Schenk;&nbsp;Walter&nbsp;Trauninger<br /></td></tr><t=
r style=3D"font-size:14.67px;color:#000001;"><td align=3D"left" style=3D"ve=
rtical-align:top;font-family:Calibri,Arial,sans-serif;"><br />&#8203;<br />=
</td></tr></table></td></tr></table></td></tr></table></div></body></html>
------_=_NextPart_35c2e375-da4d-4048-a74e-945a7cdd7a1a--

------_=_NextPart_0c66fcb9-59a7-43cc-863a-a91db775e2a4
Content-Type: image/png;
	name="image336616.png"
Content-Transfer-Encoding: base64
Content-ID: <image336616.png@4C0C5F83.ACE3945E>
Content-Description: image336616.png
Content-Disposition: inline;
	creation-date="Wed, 07 Dec 2022 07:45:06 +0000";
	filename=image336616.png;
	modification-date="Wed, 07 Dec 2022 07:45:06 +0000";
	size=528

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC

------_=_NextPart_0c66fcb9-59a7-43cc-863a-a91db775e2a4
Content-Type: image/png;
	name="image460246.png"
Content-Transfer-Encoding: base64
Content-ID: <image460246.png@47069BC7.569C60D9>
Content-Description: image460246.png
Content-Disposition: inline;
	creation-date="Wed, 07 Dec 2022 07:45:06 +0000";
	filename=image460246.png;
	modification-date="Wed, 07 Dec 2022 07:45:06 +0000";
	size=824

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=

------_=_NextPart_0c66fcb9-59a7-43cc-863a-a91db775e2a4--

