Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F78EC48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 12:56:31 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.42])
 by mx.groups.io with SMTP id smtpd.web11.40681.1708347388178590673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 04:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=purTerrI;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=purTerrI;
 spf=pass (domain: arm.com, ip: 40.107.21.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K0jv9/jbrfCCzEWRfVYr049Oo0hRNdTnnv7NiDPrc9T1mVbO2JoXZlCcraVaw4L8YCd/VbQ8tQp/ltr6iRTxHmvnGrjrkWldMq75a0A9xbQZmHfxYqTa8dhokvz3ArftWoQubS6xLn7NNaiRqMnhZtbcpH//raRtES3a2I/jXnae0y57QUcDI7pSQHFmEPnMuPfQQzVTXnUr29/SJTmu1rjoQiPXaH0ZrV4uKDPsr6y4Du6TJTdyf08e3OK//2pRj9EqD3EIQ2HB5+1g0PplZOrhgM8kxmchBfj9hOKGQCplF40CIz2hM0PmitscyFguhY0DX/4+9X79f71/hpSENQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bl7viU7B1+KJwl8L3gIEHRk7OOoatRa6wXqPMZBssXA=;
 b=C+RrTt5bJmxtw/XLitoz1BRxAF5yr2aeiFgPSdDEM8Tpesnl/bmTUFiv3iGxSj/snJTrxvLYDQV1eg14vgSKu53wFdxOUFUmV8+hU8Sny3Q1xOVULKJDieLUtXdnyqU0DRrNvAQG/GcBEUtwZaOn9LEbVGHuaWmG7h0N30m4/ecSdyChs8gGPht4HGqySH0w/PAYqs3nrkv2XkKM5NOuj3lkDREWVLUdRcb12pKRk1zP/eQ1COPlalLA6h+JkjRr4oR8FK/OYOVL4K5vcOAi/gf9xJgkEJfqffgbLmCL0ESEEWtrQKEk+eNzAZ0nFWyBzsYKyz7eVqubIu5+ykYLHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bl7viU7B1+KJwl8L3gIEHRk7OOoatRa6wXqPMZBssXA=;
 b=purTerrIHKo/P9k/HMruWTR+LqdgA51wYtUt1xx7qGUmiNfQAtDdGHo/qThiLOArGLx6s5NCfkREpKDh4VtJluUSPPFpq6NQXnz7hkF5beu2WhYoU+X0jOvgykr0jXZOkXx3nMdF5bqtShKKejnvA0P7lT2B44SMv+4wjPJvnts=
Received: from DB9PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:10:1db::15)
 by AS8PR08MB6358.eurprd08.prod.outlook.com (2603:10a6:20b:337::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.37; Mon, 19 Feb
 2024 12:56:24 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::6a) by DB9PR06CA0010.outlook.office365.com
 (2603:10a6:10:1db::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38 via Frontend
 Transport; Mon, 19 Feb 2024 12:56:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 19 Feb 2024 12:56:24 +0000
Received: ("Tessian outbound e358842a0ad8:v228"); Mon, 19 Feb 2024 12:56:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8cea51ae9504325d
X-CR-MTA-TID: 64aa7808
Received: from b7eb576ba768.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DC9752F6-46BA-426E-90AF-3254FDE9C9D4.1;
	Mon, 19 Feb 2024 12:56:17 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7eb576ba768.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 19 Feb 2024 12:56:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fG+GsXKnu1Sl/IaU80zbiXStVbUBSJPFrn6SnyP4kUTpv0Q+f9bdNzhxSBodHXGuhV2Q3R2gh1h3p7Wz4U9j6Y5IRVC6lpLuY5zzSv2tYmtyBp31binYhKQLaI7k/8QmNRf+AFhxKL2rmKQXH6t9mmzMJkNUDNhnoa7dtZSxB/4B4yQ46DmlC73UGUScHvGm8iUncBSr1l75RO1bIwRPvotySdPQSSJH90IPSHHXNfLYVIyChvFuH2b22gpu2yM2AMmdpj/ZWVZaHq/54Wwkx2XoQO62luLgHIUsmYdQ727dcK8aigHJfjYDoBBYC/My9PoGVVNDLkUdVV/TSBr8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bl7viU7B1+KJwl8L3gIEHRk7OOoatRa6wXqPMZBssXA=;
 b=Ntpg+7evJ5/VcSQJW60ivFhVLEuFgs+2G1CKOa2AUx7PDO6sQ0WZqViD3RRF6F+G5aWoOAc0k8B3KsCTCScyDONuu7WcL72zVfMuR60ewyWIN3QIi8kkvkqypUGVv0pvywKiSGgj1kG1vWiuLSkN+q/qt7Irev9vlnFRJOYgspAdwUF/mWdhysmvUjpPR5iU3+7PJkcnnk2b93zzWOI59Xjpqr3GpGEPGeS9XcJ9CJiS/V8AnpXufdoZFCn+6iBQ+Xlq2mcZFL3DskGrpDp00bZU563ktWImqI1fDmNECHaihYw+k19kcIY66wEaZXWyI8PCZhlo9YxrSGcHbvaD5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bl7viU7B1+KJwl8L3gIEHRk7OOoatRa6wXqPMZBssXA=;
 b=purTerrIHKo/P9k/HMruWTR+LqdgA51wYtUt1xx7qGUmiNfQAtDdGHo/qThiLOArGLx6s5NCfkREpKDh4VtJluUSPPFpq6NQXnz7hkF5beu2WhYoU+X0jOvgykr0jXZOkXx3nMdF5bqtShKKejnvA0P7lT2B44SMv+4wjPJvnts=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB8212.eurprd08.prod.outlook.com (2603:10a6:150:16::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 12:56:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7292.029; Mon, 19 Feb 2024
 12:56:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv2 5/5] lib/oe/patch: Use git notes to store the
 filenames for the patches
Thread-Topic: [OE-core] [PATCHv2 5/5] lib/oe/patch: Use git notes to store the
 filenames for the patches
Thread-Index: AQHaYtMihucQswB/UkKpI9uGDA3vErERoFmA
Date: Mon, 19 Feb 2024 12:56:15 +0000
Message-ID: <58D334B2-076D-4140-B948-7AE0A52931F3@arm.com>
References: <20240219012832.3090768-1-pkj@axis.com>
 <20240219012832.3090768-5-pkj@axis.com>
In-Reply-To: <20240219012832.3090768-5-pkj@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB8212:EE_|DU2PEPF0001E9BF:EE_|AS8PR08MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: 991c3f6c-8d77-4982-49bc-08dc314a2dba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3HGM0ZRqhNxn3jZGUXhPd/AAHVaaFTrC1boFJVQrzO1pGEZwLPjyML6JmLdxGEjedXJkeOOPZAJyiV2ALWtiFEwPnSRCX6yflIfX8Fs6w8vX0llWX+QbmjKIO2ZxCdtW4UcF+SxEl3yRrW6Nu7Zb+oLOHoUx+TA241XlqFmsV6Al7R+n7HlpagvTW+r2wyMN0Eq2F3YgZILdT8lbT/4OE5LxUdBTDGeNuQ3ilpfHpoZzCs1MWbCriBtDak/qUOzTuHwarYH6DFHk+qKX4iZ8zro0FASMspYVpthoxsGNAhYGwV2fuxHtMziUVrEdCbPOZucFT+PrdRhrhS8FcIaLGIN6XdSb8uKGMUm1TpB3QQ1VssPCW6aB75YgBCbQAdM5ep33frPOLm7hwMtN41RYeDgKwGoP+ySAAnd89+ax4iDVCCKpHCMBopPzVjxjjru0TnBc9sZU3T28XgL/GN3roBh6RBGdAy7G1Zlbho7xy3JPjgVrHdx+Qw5F8v9eLCdPG8hGJqNXfYCVn6P1+ssl2bndr1BPVXkSRQw+noVMp2om01r+wa1YwCH/EmyeWOG+L8gACLsvhu0Wor2glav23RQt0iRLVmr9heIS5g3mnSNmuEQ6Q7p1rBRetD03EsuB
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <25294BBC24CBF149895406233293B3EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB8212
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d28186d8-5d63-4cca-2395-08dc314a285d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3HyrdyIUYBYelRzqtT9FRRIIXc8ZKPtIp4wyXzYArrhMveT/uZoYnBFmpCdzoLANqMhK4QNxuGpIOn04Jk9wn7T47BL9lVNOpG2ogJ7cpwNP4eyzJv/Pi7/rtdCYG/vmFDHtzbwlv4HNka3j/Wq4/9CSUDAvJ5JSs7BJzXgeSGCnO/VPZ9C8RA7vmw/vaQR7CL3elp2JgU1ICfaOcs1Y6eXAYYLtyZB0noeACc/bAWG03KTHbriLgdzea75IC6kKc8xAHPd7aPvPBs/oDJSZwiEkiH75XBnLkezBJV73aV+1ZmEYrXNUj3+G7mKtjj/h1hOTGcz+CeBO0fTiBsob6kHiz13HUjeeo4u4qRBYw5Za0OHBnP+oQ3Uyopaw28oYIOEc8IzLPj8qSDaz6d5NSRPrx60WwoOyyTkjKUtnNeFlEs/jhEQJWyhB0K9D5puN3sQatk1v0iWkqjX0Teifmoftqlsj5poKqSbF+ZepsfQXdKd9mHv1TF7CzxGO/YYkOSEeW1lI5wKFOgho6KHJGmQH0650Sl2J6eagXGwBcJ+8HSoYVGtOze0/S8xwKj6owtwKoHogGnDRo66IuJKO0Zc4RyFDUHm+jpUa3wh6FOHrGpV4zRxThsWY8zx4nY3xs3VMxja/U03Al1BIoujDe7d86Mey+G3oQMh6mwi/U9A=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 12:56:24.4292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 991c3f6c-8d77-4982-49bc-08dc314a2dba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 12:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195873

On 19 Feb 2024, at 01:28, Peter Kjellerstedt via lists.openembedded.org <pe=
ter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
> +    @staticmethod
> +    def addNote(repo, ref, key, value=3DNone):
> +        note =3D key + (": %s" % value if value else "")
> +        notes_ref =3D GitApplyTree.notes_ref
> +        runcmd(["git", "config", "notes.rewriteMode", "ignore"], repo)
> +        runcmd(["git", "config", "notes.displayRef", notes_ref, notes_re=
f], repo)
> +        runcmd(["git", "config", "notes.rewriteRef", notes_ref, notes_re=
f], repo)
> +        runcmd(["git", "notes", "--ref", notes_ref, "append", "-m", note=
, ref], repo)

It feels like the config calls could be done once when setting up the repos=
itory somehow?

> +                        # This loop, which is used to remove any line th=
at
> +                        # starts with "%% original patch", is kept for b=
ackwards
> +                        # compatibility. If/when that compatibility is d=
ropped,
> +                        # it can be replaced with code to just read the =
first
> +                        # line of the patch file to get the SHA-1, and t=
he code
> +                        # below that writes the modified patch file can =
be
> +                        # replaced with a simple file move.

This is all that is needed for the new code to work correctly with an old w=
orktree, right?

Ross


