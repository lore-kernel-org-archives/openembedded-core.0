Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF6DC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 10:16:02 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.88])
 by mx.groups.io with SMTP id smtpd.web10.5792.1665656151817407036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 03:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZiY19OR5;
 spf=pass (domain: arm.com, ip: 40.107.6.88, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GQtjIzi5EazorISCo+s87t6vkxRZRPPxv7eh8W/A1A5VUsYtgwWjmrGAYwFXh1Z7SoR/G96QUgzkhVvhwhzss6PaHGDEv6wy55Q1ytuD2Lg/vcrAeg+blhA8wRwEbx4BCgzbFGfzsGsqRA6bFk76nHhV+w42tFxptyk2GVX77fT4Fhu+OTA3wi4KIho+aHjOy9C6iGyeVo2KA3+sqwIIm0ntO9leWJrdyFwHXeCCE7T2GTDkpCul4Wz2p1R/n9mWydPEqKW/3DI+7QCrXyMv5829yG8pyDIzy5OJhenacOLnLFvz77MYxurqF5LYIowFxIJaogHX7IMOCbeXf1hryw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFpWDw6Bl5ByIXoPlTDGXZcu+fiGfGPKotRlWULuU6E=;
 b=FT9t0KH+4Ma+qpQJIFQuhCZizXzD6kKvj+jj8MQYl/cmwXUpMUWNZjPwrzoaWH8Q9QmrsVYdB/3/JIJyWI7vd84UjERtbu1oOecvyXT0kpsf9voGZoQ+p4gjwJfVjWwJLy+5t03Ha90xAbjsO3LWXAnaACb6e//vLrrq7LTToM/JMBxtHWh3FUKRTt/02YpI1Q5F6CJm0dhxBpkQ1kM08NqhoYXct4eyFqL9c561Jv7h5rL4WtJroJwyo7glBpRk+luGsVMtXkbZczT7t3aa7YPc12wYN3UFoEkfgUKzldTiJ2RHDKiyK8DfopEfxsVn/ula/N+HLwsWvptE2zdBog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFpWDw6Bl5ByIXoPlTDGXZcu+fiGfGPKotRlWULuU6E=;
 b=ZiY19OR5biPKyCjJslFFw+A62GExj4LOfSJvVn+i6Hx+b7C3lurqQPOJm0ptpyXHgcX0I1guH21R10D9LjfCdqNH4KLfr1a5dvolwyC9I7+O5bhipGa1L0Fa3B8pGHxy6FR9kWbQHIWxWxQu4YbMxneQnvfXj6xV+XnCLHsFLOQ=
Received: from AM6P195CA0075.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::16)
 by VI1PR08MB5310.eurprd08.prod.outlook.com (2603:10a6:803:135::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 10:15:48 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::ed) by AM6P195CA0075.outlook.office365.com
 (2603:10a6:209:86::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.25 via Frontend
 Transport; Thu, 13 Oct 2022 10:15:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 13 Oct 2022 10:15:47 +0000
Received: ("Tessian outbound 7e4a920b87c0:v128"); Thu, 13 Oct 2022 10:15:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: badcb58e01c819d0
X-CR-MTA-TID: 64aa7808
Received: from ae06d5cc71e1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 45C49E2D-C769-42C5-9675-0D8B724C3B7E.1;
	Thu, 13 Oct 2022 10:15:40 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae06d5cc71e1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Oct 2022 10:15:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6WJP/QhyHGpKi34U+5DAG2A2BTHOk1O/odOuq9isBHAu1iVlYFzAl8iLGFxqr0RkdVyD9sdGGDnhQOnCR7mPC8LgNIf2jBULAwOVIEjFpPUGQgbqExeSr0k51W0qJ6Y4xiBZDSUNrtaXWapZyPFvo0x3NzuyrD9EMVaCefZfByiLH3kaBOwNxAGwcXcLH8CR7OB78XyteXZewHOjMH5h+ClXaB3sJRDAIr9mR+nbjVWlDUtewo5Xmk30wOE3ab+7ArwmIyQRT8SXC0mANwNiHOyytAIMmuSAJJy2z6DHBsXYEH2FVhk9vVrRDiqGvlrLeg9I2tvvVfwHmRw/X1Y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFpWDw6Bl5ByIXoPlTDGXZcu+fiGfGPKotRlWULuU6E=;
 b=TLDJKAadzlrettLo68F6aATgaO0hQ9aAQEtBH3UOb48IJDtGX1o+PvS6bvX3HY2p59T1z9fU3dVGVTmFGBiMXtn1zPWuAAoDQyDEjorhc06rpnLi8Dr9/Mbl8K2Y5TltgRvzp2tBgVdMaLB0ielCtVh8yIVwkk4f7JVCnwDC3nBREfm8X3QtZ1UTLF8Q0fG2++xMoUrbVqAx+IVSJ8c1Vf3bDcv4q2U96hIE1hHr7QDk/zurBW9cM51UQrzZPGG5DoOgps/CERYds3bWNEMA08nyRm9bIg+L5LZKf8dgCFFIeopJjRHAny7ueeUzZEe9fsowbWG55UWmtM8O3qInAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFpWDw6Bl5ByIXoPlTDGXZcu+fiGfGPKotRlWULuU6E=;
 b=ZiY19OR5biPKyCjJslFFw+A62GExj4LOfSJvVn+i6Hx+b7C3lurqQPOJm0ptpyXHgcX0I1guH21R10D9LjfCdqNH4KLfr1a5dvolwyC9I7+O5bhipGa1L0Fa3B8pGHxy6FR9kWbQHIWxWxQu4YbMxneQnvfXj6xV+XnCLHsFLOQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8065.eurprd08.prod.outlook.com (2603:10a6:10:3e8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 10:15:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%6]) with mapi id 15.20.5709.021; Thu, 13 Oct 2022
 10:15:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "andrej.valek@siemens.com" <andrej.valek@siemens.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>, "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] eSDK dependencies
Thread-Topic: [OE-core] eSDK dependencies
Thread-Index: AQHYiiIHc1CLXz+3xkuTnJctNcNK1q1jQWYAgAEzEQCAACdrgICoChSAgAAfPgA=
Date: Thu, 13 Oct 2022 10:15:37 +0000
Message-ID: <C35431BE-46D7-424A-825B-2FEF21688FC6@arm.com>
References: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
 <cc2e9dad3bcab4cd3e0d11c65241476142324c8b.camel@linuxfoundation.org>
 <717c8fd06b6f256edfe95b31d378f3ae544a7f50.camel@siemens.com>
 <8afeea0dbf57ab08aade7ab3da3d66603b003bd9.camel@linuxfoundation.org>
 <096e5f4224fa861c16c93a989f0c95169bb9771d.camel@siemens.com>
In-Reply-To: <096e5f4224fa861c16c93a989f0c95169bb9771d.camel@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8065:EE_|AM7EUR03FT027:EE_|VI1PR08MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fe0559-c39f-44b5-cfaf-08daad03e5a1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NmZUXp6EfPSuQLAo5B5ELCxwTBlPXWqUn/EFXiviopEkKabF4L1ofOYYiodNdwV49myMOOa+Qt5V0vIzG7yoOi+CITGSZC3p6HbyYXDX6A1HhVX+2TKQOYuDF5ydvnK7Ie5xfYA9IcZLu6xd+UfWBVIN0stlUqfTwNA7fMH15M288Cw6XVawpABTaOFKCCbvPeP7eg7wwOFvgpyA5lOsJFSWGIErvgLx4VR5xOmFDH7gpmqFomCKRgvBVtjSdWESvDr3+75k5RZ/nhPVBB9l8cDQV4erbM8Dk3YB8S6ZCgl3dt88Q03OgfsvzM62q8NE2XTQTMN25nTr7Emw7XwruIjyI8GtuivS/U4OydimzGqX2JKI8hFmqA0bj3mVPj6f++PDQsHfKVusH2/+qeSFeaCmxhp6nQFcvaOpDkI1tlnU+Aa2YnPIbh/mdAqKFYarwaR5HQneTaIM+6k8Doyx7fmeK858EIz2YqSDFPaPxM5GzAf2IZwegiiPYWLsCBwrwX8H91CRGgH0tmPjYPayB9bIk5ANbT5VF209nIFH2F+SQIGzxKTR62ZM7zmqlufSle76jgboG6q7VrNgoI9lw1OlPkryrWYYfPOIFaWJI8IziIZ06sTGaqUgLOqqVjF4W4Tu0C2374hWqfPo0Ta5laKMABB3RnxJoqgEI2bqO7IQ/YauiBa21YByu0/wAi5FAFPuaKfMkEzUtWR5eVHk+6s7/qMhjzgghvtvmt+sbP53r4LN/OEUD4gYz56aGoRnFof/f7miAMlRCItLleJfYfHe1Kjsr3icIUQliAGV5/0L4RR3LeYXIh6yAtNhl//xfj6EPalMaS9duIjbXf5TZJiO97LiB1pN33greEYUhAFnthJSc8VMBxnkyi82vWFw
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(478600001)(53546011)(76116006)(6486002)(6512007)(2906002)(33656002)(316002)(26005)(36756003)(966005)(2616005)(86362001)(71200400001)(66946007)(38070700005)(5660300002)(186003)(8676002)(66446008)(38100700002)(66476007)(4326008)(64756008)(66556008)(54906003)(122000001)(91956017)(8936002)(6916009)(41300700001)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F7DD9255EF7DA429157C1AC890982BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8065
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	47f3796a-743a-47d9-8d6e-08daad03df9d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3TJRoePfNzFeiH1UG0nStSu1xQ8xfPsqaQPS5Fv/l1T54/GmdzT6SXTtOqIeT+Di/UVjow3GscPS0ChNo4nRa5oxULshwAGZoXRacZTY7jCsETQHCzz3njfnt0wm9jvKIyN7lMTuIum9FCyjhWToH/ahigKEsDR9psZjhGRUhCUo2fB8gz1v41OiXUoFhPaZLxPgBOd1+9VxZDthyfARTztSV3K4xpuDBhwCczGy0kTZ6tVV0ubWhbxaXvJ3GSbqD12e4qoWQ8unqOLDmJPUcsYpIS2K9CwxOcoj93504eGUOkYqjCtV154oecCtxa5WNIxYBeYw6KEAFcNngypHAk4suFRy28Epzt6i5NeRZCpy0MbjHqQFgOKx3EPnFscbQRh0vlD3MSZm21IBs7vfFcZ2iYN0fMdfVHiuTn6JRtJouf2U7aiULoygyGy5XK++frVDZQ2g7Fi+EHIxwHNdq3GzBoFXlVCIdhzmIW48OhRzl/hXE54GKsVI8UogNIY+FxKSlf+obFikSZP/XGP1HPuyNA8HXnddJXv6bnZyQt4/mHsDu8thuAeSU3BkteuIQ4WjXTMep1odb54FrHxGOwhrZzbe8U3psv53UdPaUa4tYdwyVFVaHQFFuDbd8QcWbbfd1Cx8eIORhKNQy1l1B+WsQVEdjXA/WiJDfeSB6ep1Euig4B2XF7cpQA4xQR0k5h0LRHtR5hdDhmSRHGhLQEMpzj8eoYmu24kPdT7bPwu0KuzDvhQriqIDVwPjA8FhL2zzeEQVensictaPEStevwY0nTj+VrB3ndy7McctelrHaPBkgk2O2rLH5P6VagVl7owKVbfJXNQBzHY9Gu174g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(81166007)(356005)(86362001)(82740400003)(40460700003)(4326008)(26005)(70586007)(6512007)(70206006)(6486002)(41300700001)(53546011)(2616005)(8676002)(478600001)(966005)(107886003)(316002)(54906003)(2906002)(5660300002)(36860700001)(6862004)(336012)(8936002)(47076005)(186003)(40480700001)(33656002)(82310400005)(6506007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 10:15:47.4815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fe0559-c39f-44b5-cfaf-08daad03e5a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5310
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 10:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171698

DQoNCj4gT24gMTMgT2N0IDIwMjIsIGF0IDA5OjIzLCBBbmRyZWogVmFsZWsgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPGFuZHJlai52YWxlaz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gSSBoYWQgc29tZSB0aW1lIGFuZCBtYWRlIHNvbWUgbW9yZSB0ZXN0
aW5nLg0KPiANCj4gTG9va3MgbGlrZSwgdGhhdCB0aGUgcHJvYmxlbWF0aWMgY29tbWl0cyBhcmUg
aGVyZToNCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5lbWJlZGRlZC9vcGVuZW1iZWRkZWQtY29y
ZS9jb21taXQvNDFkN2YxYWEyY2M5ZWY1ZGJhNGRiMzg0MzU0MDJkNGM5YzBhNjNlMQ0KPiBodHRw
czovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVkL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC82ZTJj
YmZjNTYxZGFjODliZjkxODNkMjRkOTBlNTJmN2Q5MTE3ODI2DQo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0LzAzMGQ1NmUyZThlY2U5MzQ3
MmFkYzUxZmU0NjcyMjFkODQ2YzlhYzANCj4gDQo+IE1lYW5zLCB0aGF0IHJlY3Vyc2l2ZSBkb19i
dWlsZCB0YXNrIGlzIG5vdCBiZWluZyBleGVjdXRlZCBvbiBpbWFnZQ0KPiBsZXZlbCBhbnltb3Jl
LiBBZnRlciByZS1jcmVhdGluZy9hZGRpbmcgdGhlIG1ldGEgY2xhc3MgYW5kIGluaGVyaXRpbmcN
Cj4gaXQgaW4gcG9wdWxhdGVfc2RrX2Jhc2UsIHRoZSBpbWFnZSBub3cgY29udGFpbnMgYWxsIHRo
ZSBtaXNzaW5nIGRlcHMuDQo+IA0KPiBJIHRyaWVkIHRvIGV4ZWN1dGUgdGhlICJiaXRiYWtlIG15
LWltYWdlIC1jIHBvcHVsYXRlX3Nka19leHQgLS1ydW5hbGwNCj4gYnVpbGQiLCBidXQgIi0tcnVu
YWxsIiBkZXN0cm95ZWQgdGhlIHBvcHVsYXRlX3Nka19leHQgdGFzaywgc28gaW4gdGhpcw0KPiBj
YXNlIGlzIHVudXNhYmxlLg0KPiANCj4gU28gd2hhdCdzIHRoZSByaWdodCB3YXkgdG8gZ2V0IGl0
IHdvcmtpbmcgYWdhaW4/DQoNClNvIHRoZSBnb29kIG5ld3MgaXMgdGhhdCBhIGZldyBvdGhlcnMg
cmVwb3J0ZWQgdGhpcyBpc3N1ZSBhbmQgYSBidWcgd2FzIGZpbGVkOg0KDQpodHRwczovL2J1Z3pp
bGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTE0NjI2DQoNCkFubm95aW5nbHks
IG5vYm9keSB3aG8gc2F3IHRoZSBidWcgcmVtZW1iZXJlZCB0aGlzIHRocmVhZC4NCg0KTXkgaHVu
Y2ggd2FzIHRoYXQgZGVwZW5kZW5jeSByYXRpb25hbGlzYXRpb24gbWVhbnQgbGVzcyBkb19wb3B1
bGF0ZV9zeXNyb290IGNhbGxzLCBiYXNlZCBvbiBob3cgdGhlIGVTREsgY3JlYXRpb24gaXMgZG9u
ZS4gIElmIHlvdeKAmXZlIGlzb2xhdGVkIGl0IGRvd24gdG8gdGhvc2UgY29tbWl0cyB0aGVuIHRo
YXTigJlzIGFuIGluZGljYXRpb24gbXkgaHVuY2ggd2FzIHJpZ2h0Lg0KDQpDYW4geW91IHRlc3Qg
c29tZXRoaW5nIGZvciBtZT8gIFN3aXRjaCBiYWNrIHRvIHByaXN0aW5lIG9lLWNvcmUgd2l0aG91
dCB0aGUgcmV2ZXJ0cywgYW5kIGFkZCB0aGUg4oCY4oCUcnVuYWxsIGJ1aWxk4oCZIG9wdGlvbiB0
byB0aGUgYml0YmFrZSBjYWxsIGluIHNjcmlwdHMvb2UtY2hlY2stc3N0YXRlIChsaW5lIH41NCku
DQoNClRoYW5rcywNClJvc3M=

