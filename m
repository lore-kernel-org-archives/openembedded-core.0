Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A96C47258
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 15:14:54 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.82])
 by mx.groups.io with SMTP id smtpd.web11.9495.1705072489719536052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 07:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=VjCF7pst;
 spf=pass (domain: axis.com, ip: 40.107.7.82, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwJNmhPDu49tp4Ufhomri1MPlLL4kNJ+zRvD12IOHbvBDXHNZ7zy+CRype2NKWMuA21E5EcRdlMW7oZ7u3VuJL8HVnNn7w5LnFraZbSEVOisZEnJXVx7OTDQ33TA1NKS9/aeEWwhBzrTOM1/bieWH10Xc3Cz3pJRbWHLjdsk90/x33lqFbCFofkMdohx4mPOyAcYj9zVQrW6x8SirTb/y2P1tBX1m4LsZ6sS30I8/REo+Z4ZMVcpNWtuBPrNVFai8z6WXgihJd90FkDG4rkV4RTE/6qzzoZmCTbGV6BRuxnzilij047VMv/ZzVf4BBwi2N6db4Nsna9ZIRhUwqMrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9WSZZIDGBLPcGH88VGdy5t90o6U0hzgyPPi9dEOmbY=;
 b=a4mgUJaarMMArSCvp25H47rQYY0st/EemKg71RKvUZSfzE9hffUE/1v3CaniACjqOHOCBy2TCV9xoopdEp+K5YEEtON4Op5byFB1cXM7IW48Y22msO7AvDYDbtpof3c2R0Ak2M+oiuwuBsw3ZVwSORWDInvNx7aPBAgxuN5MOiLWNgQWFpygxWDjPCdyIOkNILl+1d/n7gCksZ+XX7sbiv3IHQkZhDv9FZLoVvvCbTPhvuni62ymApWwBKZiHJIwk6QXUn+THlK/O1DdEheEoCv3y0rPXBLTXVphpguCqQkYjf/GHCRTRFsBaia0bGBaA9HaSzr2a8B4DJVESBiU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9WSZZIDGBLPcGH88VGdy5t90o6U0hzgyPPi9dEOmbY=;
 b=VjCF7pstshzcSJxOL8vo8WNcX5F6RAnJfzRFskZYHGulrJje6khdIYhvhTQ4oJyl5rH+d/wQMgQXJYF10ilktKGo28AWHepd4SHdeJnht9cw3LIzKC2a5gOt7iMox1INY6Ir8vT9eAYvYRgsirzfEYNJvEe1HsnyNV2HsCP59kE=
Received: from DB8PR06CA0005.eurprd06.prod.outlook.com (2603:10a6:10:100::18)
 by PA6PR02MB10923.eurprd02.prod.outlook.com (2603:10a6:102:3d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 15:14:45 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::1d) by DB8PR06CA0005.outlook.office365.com
 (2603:10a6:10:100::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 15:14:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 15:14:44 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:14:44 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:14:44 +0100
Received: from lnxolani1 (10.0.5.60) by se-mail02w.axis.com (10.20.40.8) with
 Microsoft SMTP Server id 15.1.2375.34 via Frontend Transport; Fri, 12 Jan
 2024 16:14:43 +0100
References: <20240112150303.3807006-1-olani@axis.com>
 <20240112150303.3807006-3-olani@axis.com>
User-agent: mu4e 1.8.14; emacs 29.1.90
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Ola x Nilsson <olani@axis.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] insane.bbclass: Python code cleanup in
 check_32bit_symbols
Date: Fri, 12 Jan 2024 16:14:10 +0100
Organization: Axis Communications AB
In-Reply-To: <20240112150303.3807006-3-olani@axis.com>
Message-ID: <jwqle8uy464.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61B:EE_|PA6PR02MB10923:EE_
X-MS-Office365-Filtering-Correlation-Id: 8799e9d1-617d-4ba7-ca20-08dc1381355e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jZAlGpjs0V/OCI5tuqXNDOUCWtipdfwvKJnQBs98VOuhdoC+PURPSPJ/SgaEPyp0KHNQRwPGivMgy0j8OG852/43PJbrW7xSa26BG4xahJvRqa8DwqyQ0XFuBSXtWWNXCRpuT42yn5k7rkiXCj8lxl5XcrmY8mNXvXunfP6oEdiW7Pzm9jFmHyGh0rqb+N0BVWFTlWg8wp3i+xNzgu6/mri4beWVdKmhyE/voOhQoPfP8uyhhQrlxpxRJRCK5io4P+q3csJJ2B38itMjzL1DvpPB/sVGR5B6WacJTKdZVJ2uYxMt6wBooJuHj3g5V2VWEef+jIEYr/MfBrT3gV6U+UHW2lDIUuosrD1A5ESI0JNYNOLifoBB/jNffpSdEEuXKbMPANPrvQ6pV0Q5/mBCPFWraLH3Idyj3AtGtwFS1wT0nXZndwQMH4nc/6J02gVK8a9GNSQcuZ6g0sr1FHUwnqCY0LqI/XgjVQhzagjEvSjrjUS01sFY9E/SgBRfOZHJM8Li7EinQyY6lqCdoNOiC+ur06Z3YAhMQiNN9YfcdyRzVxtRCi2XmTlrbdXsgKQa+mC0CLLevxajdYvOmAiDo3D9/8WlyZGfCWwXH7lN6MR6jHWtcikJKLvqwg4cJ1QotgyKjF7iyYMbYgcR0jgoPMsKa5y4/DfOCZrNGVG7AgZrftFxvM7m1O1V/H5hHa5pxl5WOVxozGrMX4eGyJT8r3e9eu9Vqf7YI7C0ZLiJVjNXFf4eoLCx9wxwJojjuZaID4nZJBEBbLCDjbHcuZJ2/Q==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(336012)(478600001)(426003)(70206006)(6636002)(36916002)(70586007)(37006003)(316002)(6666004)(4326008)(6862004)(26005)(40460700003)(2616005)(2906002)(40480700001)(5660300002)(83380400001)(8676002)(8936002)(47076005)(36860700001)(82740400003)(81166007)(41300700001)(356005)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 15:14:44.5787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8799e9d1-617d-4ba7-ca20-08dc1381355e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10923
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 15:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193592


Forgot the signed-off footer, v2 sent

/Ola

On Fri, Jan 12 2024, Ola x Nilsson wrote:

> ---
>  meta/classes-global/insane.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index 1ff6a319c4..26457764ce 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -514,9 +514,9 @@ def check_32bit_symbols(path, packagename, d, elf, messages):
>      """
>      Check that ELF files do not use any 32 bit time APIs from glibc.
>      """
> -    thirtytwo_bit_time_archs = set(('arm','armeb','mipsarcho32','powerpc','x86'))
> +    thirtytwo_bit_time_archs = {'arm','armeb','mipsarcho32','powerpc','x86'}
>      overrides = set(d.getVar('OVERRIDES').split(':'))
> -    if not(thirtytwo_bit_time_archs & overrides):
> +    if not (thirtytwo_bit_time_archs & overrides):
>          return
>  
>      import re
> @@ -1606,7 +1606,7 @@ do_unpack[postfuncs] += "do_qa_unpack"
>  
>  python () {
>      import re
> -    
> +
>      tests = d.getVar('ALL_QA').split()
>      if "desktop" in tests:
>          d.appendVar("PACKAGE_DEPENDS", " desktop-file-utils-native")


-- 
Ola x Nilsson

