Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC52EC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 10:51:47 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web12.4383.1665053505659164219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 03:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=XyPA2wCQ;
 spf=pass (domain: arm.com, ip: 40.107.20.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PUx8aFRyxSSJFvZV1xliqcP5Ppqr5rYuJp1fOsTfY8HH4pqC+7JqiFj1yrrElVEMdG7QwCbnrTLc30XCZKhgWqGLWTc1JPgagw3b+d7hRjYst/2NyDpphypWRb6Vfi8ryBbBJX1x6Aj8wL1bpQhAzdnWp9Es3kuaAm3INkWkSTWjCGO4AHbvm8xjvxT8tWXzKIkfxe0/xPDS4IgIY1cl2mhPEW9M2b6hdhdhuQPnzp2QjEGobCwGPHgOc5UW/RKC9fgeO3hg4By5eZXcTzuSrIEX/KXmJaBlFX0XBvrgCt23LVarEhsLMhsoVtxObL04fb5NSoUNoDKkCg11QsNm5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvZMgfCanzflylW41BU9LQO+53PHtywpMUX6L2ILyGQ=;
 b=KY4OPAFADC48Pb1UAhcgy9bqrN8e4GeCZlEqPNUNQ5EuB9u7VWiAV6USSr5PFYtpwu7oX9XCQCQoNXxL7hjb68JkxQgQuwcrRS8X3K67voZt5ISN2B3lXnrBVexdphWFynXSu2ujHzjmy+vgzJN//IqKRWBOEGGR9I+0o3jBaLkf6e8Wo3MHpN6/n9IQRTLozugRevBg/DCKYl+jGCbIbXKmCJRtUuhLX78tqyneXtiidPJUfvRHWOyJYMeiEh+OvbTtvl7xZWXpylDtQfq22lIrG4qLx/qJbuVSmsbwHv8uzh+qFo+Zc7VBlJ0IGHjs3bKaB0ghpJygsNTjaE3Syw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvZMgfCanzflylW41BU9LQO+53PHtywpMUX6L2ILyGQ=;
 b=XyPA2wCQ0nWFE1B/5ctQj9TKnY9SkmFpK5o/9TFFmITORLNlCjm5cs7mDzr8BLCYpeSTcj7zffs0u2TPpP6o2255YHDHnDz70tbZbzEQEhKCUhEif3/EyyAmJKy7peOxs+OJNM7twqpiBMceDf+sCTFUOGnvZiVSm+sEs9ae4e8=
Received: from AM6P193CA0104.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::45)
 by GV1PR08MB8668.eurprd08.prod.outlook.com (2603:10a6:150:86::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Thu, 6 Oct
 2022 10:51:41 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::86) by AM6P193CA0104.outlook.office365.com
 (2603:10a6:209:88::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.33 via Frontend
 Transport; Thu, 6 Oct 2022 10:51:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 10:51:41 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Thu, 06 Oct 2022 10:51:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f822e97ea2ba362a
X-CR-MTA-TID: 64aa7808
Received: from 9f72d0398713.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D97B3802-0BCE-4366-AF9E-216A0B6EB819.1;
	Thu, 06 Oct 2022 10:51:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 9f72d0398713.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Oct 2022 10:51:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0aEcKVA4/DnjMaITgDCHuhuLZZ1fZ6rcwSRZcMlCb5GzbO1ios1oMvzBBLjcZBA0Tonl+CygCRe/GQEH/MCMZuGaROci0NRCxt87aBNzI5m+IvtfEWk1MVv9pBJkmr6v7rmvMjUT6T9bUD4tDFEc/fCDpLsaFOlUfKWTBGZEvU2SYQxdpK5MvfmtTPjlGkVjormSS60D7eOCr8Ae3dOUEnwVkwFdGKlJaxLkc7O5lHXlwcASgyqOw22UZB2u4lhdhP5wkhhDzSCRedjJTaNoy+ZRTk5sg9rLiCxMm8gOmWU2e8FNYYuXbAOKdMr24i3SwzCJshPp/VxSqmiYjOQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvZMgfCanzflylW41BU9LQO+53PHtywpMUX6L2ILyGQ=;
 b=WodI7QHnhUfEp1Xb1Alrh4mggDooILPxQONlBJ2Mt4r2Jnw3N0RvE1vPNtvNH1FXYj0w//6Kt9hmXM/wgMSYfVjT2Eg5jtlG/rxS0OAPHzpgEFCHDcSbUOvJCdVpP/Wx5EJ33dBtDzhRgxlgeFM2pfatKvK3AxnEfZcLVZ5ie5LKRMjhxhSvOABn2yqvfiCP/eKoQkcdrfm9BuWUpV7Y6BECuWAu62yoc8PzZ74wzvnxYltXVwUr+g6TDwSBetbblZLEfrT2T7RKKvApi0afnIQb1uL0vzNbiFfo9SQ943RcG3eWpDxa2j6ebXt0YzeKLj2XVlz2L0ZkBetPLUye9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvZMgfCanzflylW41BU9LQO+53PHtywpMUX6L2ILyGQ=;
 b=XyPA2wCQ0nWFE1B/5ctQj9TKnY9SkmFpK5o/9TFFmITORLNlCjm5cs7mDzr8BLCYpeSTcj7zffs0u2TPpP6o2255YHDHnDz70tbZbzEQEhKCUhEif3/EyyAmJKy7peOxs+OJNM7twqpiBMceDf+sCTFUOGnvZiVSm+sEs9ae4e8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6208.eurprd08.prod.outlook.com (2603:10a6:102:e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 10:51:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Thu, 6 Oct 2022
 10:51:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "quaresma.jose@gmail.com" <quaresma.jose@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] kernel-yocto: improve fatal error messages
 of symbol_why.py
Thread-Topic: [OE-core] [PATCH 3/3] kernel-yocto: improve fatal error messages
 of symbol_why.py
Thread-Index: AQHY1PXY0vLWfuBn/ESHrrqWs60Ana4BOUUA
Date: Thu, 6 Oct 2022 10:51:32 +0000
Message-ID: <2F1C8D26-143C-462C-8705-DC9C23306603@arm.com>
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
 <20220930175440.2168008-3-jose.quaresma@foundries.io>
In-Reply-To: <20220930175440.2168008-3-jose.quaresma@foundries.io>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6208:EE_|VE1EUR03FT027:EE_|GV1PR08MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: 023eaa90-7aec-409f-4118-08daa788c073
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 X4pXo8d5VQsKk8/D2s1RxKQ1ovCLkDHHAvd8zgkuYCkiX92BtjFaciR75/qEYjbKM21NwbKZu9MotYUpk7BcFRP2D8kMYv7w40/MEL5MBri6/Gf3O5pBzdNrqoqI3+Qd+fefFwAq/saO7BZMMBltXP0X769g+gViOe2HKCqu+xQ5jI5cFCry2yILvH81/9jHWSiFhe0zbyoqiYwFsXa8Ma13m93Yj80G9VlDDgv9oWyrKOQkhMuocr2O2AeeDssnatMhEYi2tCockuCl7z9BF2M96wX20C8+Y7iUIA0EYdYmnTSjJj6QjWY9tym1sKKxh22fkG0zGO93jm6Mk2z0EhfzXtQmGirUPfVIBi6vT4j/PIoe7ncgOKCyWEGq5Y5VmpJiBU6DZ68K+KJG8+xh4tpteTnulszEC7dGo6eCJRl/TP+cE4B+ZNlEOQGCUdb1/fkVu26jUbqQKl/ag42BNTDOmk1IDfiLFa+dIa6eV7HYFwk7EXuo1HoxON8GjbMKBBxtAeraLxUyAWxvCA7VS8XXOkjS0qMJwmoSiV9xg1lJ7SyrlKQCmbYCePi8qVdXCWebm2VRH2sYGO7EwclnCF+q6TWY9HNquQR1MCrjnj07Tq9hDFwCwRJftWIRLiYC0EIJTUno1AfGBG2NIUxUtBwtyY/PeYvcKg14cvcCTCV5HAEGW/VDis0EcxywF7bpwe7+4szakX3q8WC9zcRQSS+MHGG9vGlS02rzJGkKrKalMS7GXJpARZ0KlW2MemRhDZ0kz/PUfroMVASz+tvyOBULRuHFnj7Sef0z3bQo/BdWKvMbGGNLEkeHSTx+EhO1FDXSJ7zVygakeNOnV44T9Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199015)(33656002)(36756003)(91956017)(76116006)(8676002)(4326008)(66556008)(66946007)(66476007)(6916009)(4744005)(64756008)(66446008)(316002)(5660300002)(38100700002)(122000001)(38070700005)(86362001)(6486002)(71200400001)(478600001)(966005)(53546011)(6506007)(26005)(6512007)(8936002)(41300700001)(2906002)(2616005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FB4B0BB942CB2B4D8E60EB75BE8F8AC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6208
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	24c993a8-7f66-43a0-c445-08daa788bb3b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DO8vldJnk/0R7+YneVW76X0/JeaSC2lbcfHIuiF9EIEk7Kmuq/wdQlQyKDUjlfDJWYZFMFskC44/Gvm0QgqnzNfV7EGPRdFWprI8PtqA5aQAl/j9HkMMPp8/RLr0FO7rz9j8hhvZT4ssj0tg7NHZyY1h4YgIfXrxyhWm5V7pGyX9hCiCMCV6+vEdP81b3bDY/q8fRBYyoqMGReqpivP+eaTxlxq1/ta680dWQytIVrQUPcUfapwJKeq+vpUUMIcUuWSfwNovmKn6m4L+9Pj/Vr7D08NkvKw5e9jcsWAbsf5di4DAmoD+3YwJJasugYu+ptlfXSMhdXw1gdxsrfU9OUkkvqsys4K59UmvJ7eMxEmpV/AYvNZSex94BzlRq/6ot3PTw1JVdodixIqJthzFawpm+uoPtvLBVotiO+GxyyQqmDk3jzhdxr0pU7jkDKNsdFztEsj0aAz0Fdt9zFhXcCAEx/ojqwB63NEkbPbVAqKX2WJ+qTa6uMuYFsBeX1Z0/vnH5E9scbxuMqYMb5n7BjvlhE0DNizT270oM9QZycy/CjLiufZZy+9HuVcZd8AaF4p7flnaoIjsYZxYrb1s32eLfIDucbNTit08YsOpxIJfBHye3ebCsa5f1r5B9Y61jxGq3lIAbXHlDDrLFFr797mZAD0CkpZ8dvd2jkKhGKVZqRbzqtavRHy0apYOzVsTffTt1/4T5LrryNH4EDwYTrwrZ0RssruW2DDvpWaC9mtjSUOQ+hPqO1uguMtzOb5Vm2snBTwuX2F6jsMdnk3CsvczVDDQJ3O6wJCFcifnGBU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(8676002)(47076005)(82310400005)(336012)(4326008)(26005)(36756003)(6862004)(8936002)(2906002)(6512007)(41300700001)(186003)(70586007)(70206006)(40480700001)(2616005)(36860700001)(6506007)(4744005)(33656002)(356005)(53546011)(82740400003)(86362001)(316002)(966005)(40460700003)(81166007)(6486002)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 10:51:41.0328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 023eaa90-7aec-409f-4118-08daa788c073
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 10:51:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171492



> On 30 Sep 2022, at 18:54, Jose Quaresma via lists.openembedded.org <quare=
sma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> -        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'=
))
> +        bb.fatal( "config analysis failed when running '%s': %s" % (" ".=
join(cmd), e.output.decode('utf-8')))

Much easier to just use e.cmd.

https://docs.python.org/3/library/subprocess.html#subprocess.CalledProcessE=
rror

Ross=

