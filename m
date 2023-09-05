Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F560CA0FF3
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 15:58:33 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.53])
 by mx.groups.io with SMTP id smtpd.web10.25435.1693929509467039714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 08:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=w8tZBFcW;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=w8tZBFcW;
 spf=pass (domain: arm.com, ip: 40.107.22.53, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pq8TAfKGv15OfqvuVU3djD6BPab7a/qMxzWnfJ1zTaw=;
 b=w8tZBFcWH2OR2FMNqCyXuVsbVTcjDTSRbKU7kAkXq2JDrau7IqFfpeS/Sz0KYaXy60h4PdK10s41nAJBDCuMgxVY+IjNRbH5MltGWTnb4WaMxPyyb4e2n926f0i+lI6GqtXJArAY8IWxffUI/TlaSLDReUXlag6kXRVDi4StyLk=
Received: from AS9PR05CA0318.eurprd05.prod.outlook.com (2603:10a6:20b:491::25)
 by DB3PR08MB10335.eurprd08.prod.outlook.com (2603:10a6:10:435::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 15:58:26 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:491:cafe::df) by AS9PR05CA0318.outlook.office365.com
 (2603:10a6:20b:491::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Tue, 5 Sep 2023 15:58:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.26 via Frontend Transport; Tue, 5 Sep 2023 15:58:26 +0000
Received: ("Tessian outbound b5a0f4347031:v175"); Tue, 05 Sep 2023 15:58:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28eb9daa84c7c4f2
X-CR-MTA-TID: 64aa7808
Received: from 4b410c0d2674.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 44E41635-7390-4DD7-98A6-BF1CCAE5D523.1;
	Tue, 05 Sep 2023 15:58:18 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4b410c0d2674.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 05 Sep 2023 15:58:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2LwKj/e6cQdJItFZWhm/qt2J0bvAJErfu2ZrLcEj4LU4YQuAAmhWDTGE1K3SKLoHRhj7Qglk2j2mRD0rf4dN6KHY8kxnGfL62W5xHVJy7UBLZZYEoCrUs/ZhG+0ZRHTRHcgig9Wg8ieZp0AAi/5ckgJszXgBm7ujdHaint+Ze/EZMM11/4Nmwe9GEx5j2H5cUqtQ5nVJW0pN14CtRzfcJmglsXS4/QTHc7rRt4h6NhWacUDJRYc/mP0ESMZ42w72cLIYOAI1SUDVpRgY3vx8hjFIZbovoLe53pJPSZKPzj60euKYbANc/fVyKx0K5AT0rnfp4EUNHVySnEoykF7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pq8TAfKGv15OfqvuVU3djD6BPab7a/qMxzWnfJ1zTaw=;
 b=M/yq8kWfplNrt0wumhDr6Xxv+tX2LIPx8f0QvNOAErB2WLUz6h3C9GCDH7iZY6YEAIzVMDq7pxdixPXFAHoi5AyWH/Due8Vk2cDHZ5BiBHBAE99C1IKEYXvQLyrJkvUhIviD/ByZ3FUNR3sv1Wp4NFA3kw712YLWU4BV8DfCCXisplmCfgpAzKe3XwZyEpcKVN3rALKBue0FFIRgMQF6O/piz8252UnhNKzp/CsOIObcx4x4Ssk5hcyliIwzBPkabGan6kKH6luKAR3MmU/NBrI4uUtZTy7NB9U4Jj5cnF6SERdg/1GJHx55hT8BL+o0CzXTXO/5cUgpjVdS75Z9Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pq8TAfKGv15OfqvuVU3djD6BPab7a/qMxzWnfJ1zTaw=;
 b=w8tZBFcWH2OR2FMNqCyXuVsbVTcjDTSRbKU7kAkXq2JDrau7IqFfpeS/Sz0KYaXy60h4PdK10s41nAJBDCuMgxVY+IjNRbH5MltGWTnb4WaMxPyyb4e2n926f0i+lI6GqtXJArAY8IWxffUI/TlaSLDReUXlag6kXRVDi4StyLk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9710.eurprd08.prod.outlook.com (2603:10a6:102:2e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 15:58:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 15:58:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] busybox: remove coreutils dependency in
 busybox-ptest
Thread-Topic: [OE-core] [PATCH] busybox: remove coreutils dependency in
 busybox-ptest
Thread-Index: AQHZ3/3vWgtogbyHaESQJgaEzhmfebAMYxEAgAAAeIA=
Date: Tue, 5 Sep 2023 15:58:17 +0000
Message-ID: <4E034C60-E468-4DA8-8F8F-18C678EC63C8@arm.com>
References: <20230905133545.1286448-1-ross.burton@arm.com>
 <CANNYZj-bgLaUFpfWCiTKb3yzanj5wOA_eu3OQXR03AWJCyQ=cg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-bgLaUFpfWCiTKb3yzanj5wOA_eu3OQXR03AWJCyQ=cg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9710:EE_|AM7EUR03FT004:EE_|DB3PR08MB10335:EE_
X-MS-Office365-Filtering-Correlation-Id: 8106c89f-348e-425b-d2c3-08dbae28f09d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nKm9+WNP+9eU0HBYEkkRdZddV2Rry0ZXHFdT3EDd/t/8PSeaRvd9QjYLnbiugPfHuv/x5eU7QNCysJmi8DzRrSF9TD7bsQIbN4vPqTEsRmAG8hTQstxW4gvA6dqtjaAhaus9gKtBbZkRGYrVDBhBcTFdzmXlEhR2qzyQsRcm5+4ZjEriJbR+476+xU60Zp+VUN+m5tCPnVCQSZxmCbOMpmkT0fSqaGfeXBcua7s0l0m6jENcvagIpHfFbfyckK208cnltsMaOOmEAV52RBx6AOu5rOz4oGKMqRc16/ARFYQOEdYnWCPrV8AT8HthsN6dNU7x+pTbWeo60UXlPMMWbZTCFDOwYogxIJVcBBCQNgz3CNvUIon5pmM7XjtLco7qyNeb1uVwKUKX+nrGDUum0uy0bOIzgMY/VRee3D0WKmuHVNdo7Lm4ey8eYYgB2l84wCmyyACfWnXZTZDNUkO2iwR/Th6e1CFuokuMFqDN0Txhb9DlzksxJiEwNdl6Dd8Dxm9StWJyd9BXqkqAl43mXoVtANBH6p439w2LYoP8zdlF6HjHGAM6STYidjzJRQXsucnS6y4eu2CWMKAMubOCOFPAGdnOSMbYUqF3cmDTvfOaAA6/gggOnr8Ds24Gpqak474Yv7R9W7JG1SZ9s2Mw8w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(1800799009)(186009)(451199024)(4744005)(2906002)(33656002)(38070700005)(38100700002)(36756003)(86362001)(122000001)(71200400001)(4326008)(8936002)(8676002)(2616005)(26005)(5660300002)(53546011)(76116006)(91956017)(41300700001)(64756008)(54906003)(66556008)(66476007)(66946007)(66446008)(6916009)(6506007)(6512007)(316002)(6486002)(83380400001)(966005)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <85AFA3663D5700428DD6E7DAF4BF643E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9710
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b4a1f9ee-e4e9-4b9e-5846-08dbae28eb61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ePbmfFKhNjeU1vpKmaVdUY2iuFtN+yfEX/+XuYdjTMh+5LEjvUgIz2NJtbvDcjcgv5GuGcTd57tKhMqIKCry637Y0Qdq+mjndFG19FYE4YD3rMRgR3CMlGPIkyn9IanA11yoTRCCRvKtCLU+QJB2zD7vJjxAiW5DSIOhoCLVvmdEFjQhOg2hc0UJG5ePMGIKthRL/6HKeLtippt9KvjpV4P1r8oAirftpga0/+MPlnCdDliEHlvms6GU/6PX9NW9j/hQD44Jzbvr4PgsMxOGXOtWn6d/P5P2WvFljSXG0niRy4VDXxfeCF7vTd974FIJnH9RDetTeD9npwUR8as8Oj3RO+H/lc/DecOO8b7fnwoc7+z6Lmr8x7B5t+BTuN8m1GveE+nEQ3n7MqqHA/nL1O638cSTYEjIb//peHJCUJfpzTtObnV/PawV/NDcdFn4hH4eqPvAb55aG2bH6zyLGIWjUwlqowN25nrCNTC5L55ebz9QVnrXpuvIsjB+jT98KbeNqHoMEvVHSsOh25K+xUUWTTLi32wQzUbZAmHq5shA7860Y0LByqJQIqcdGv9dZWnxz+za+2PqGqbvkfpZjk+9SJpxKa9OLIyABVT9ypkVBNIFpDax0cjZQcWDtN61C/RNTpJOUsPCEXRhJMt2hU3GEM4g2RUyF5BgLjNiuDE9QxjuJy3mth12TUdMoJzVYdy+ywGzqakzK38shacPr4cW5+JtvJKjdO278SrrIbY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39850400004)(346002)(136003)(186009)(1800799009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(6506007)(26005)(53546011)(6486002)(6512007)(47076005)(86362001)(356005)(81166007)(82740400003)(33656002)(36756003)(2616005)(36860700001)(336012)(83380400001)(40480700001)(966005)(4744005)(8936002)(41300700001)(316002)(4326008)(54906003)(70206006)(5660300002)(70586007)(8676002)(6862004)(478600001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 15:58:26.1232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8106c89f-348e-425b-d2c3-08dbae28f09d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB10335
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 15:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187230

On 5 Sep 2023, at 16:56, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>=20
> On Tue, 5 Sept 2023 at 15:35, Ross Burton <ross.burton@arm.com> wrote:
>> +++ b/meta/recipes-core/busybox/busybox/start-stop-false.patch
>> @@ -0,0 +1,31 @@
>> +Upstream-Status: Pending
>> +Signed-off-by: Ross Burton <ross.burton@arm.com>
>=20
> Please submit upstream at the same time.

Forgot to update the status: http://lists.busybox.net/pipermail/busybox/202=
3-August/090416.html.

Ross=

