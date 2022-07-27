Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BA6C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 18:44:02 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.42])
 by mx.groups.io with SMTP id smtpd.web08.23751.1658947434693452919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=E/4vjqCV;
 spf=pass (domain: arm.com, ip: 40.107.14.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QxMP7OAWNsY/KZjeClwjP6lElLE3tnNvu4TdBNCgEai9z1AlFaCSlvzX2JeFazWBhTJBDyR3vRZHAnlLg8jNfYNX3JbUKYBp1w/Pv7ZIj7ZRtAhAhto1LGkOkrnvTuoI2okjHwp0DM7rGQri0pGZxwwSkzgSkH46IaiOi0kMRUn4Bd+BhlA6FDajGK8q4D/qzo+rJSbRlqVpqVwXV8QUIzrUJgl9msNXz6FZMU+Pj4ICApXsEayXPD3HhIkuzqroPpCjR29/cC5PXxvKkaGph0CzfHxqso982bZUVH1QD3Ed+HSKhsZaSQsfRuV8bpN1VmgtlbzYawRi9UVnT8gMfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKRDhhojWa0E7+oSakwdYxpVG2M8RUgmoh1JnrEFaMU=;
 b=Zc4GEKdTO6+sNnjD0C2O/0NlVIuwPMCI5paA8MT2GQg3d2VVGC/arWUKmqgkNtBr1uxtJ+zK1ItSszYIQTuwMdaQNi1ybilZgyICwFFyC+NUbc7+AuWHJZvuS/+yKKG+v6Q1SzJ0O0ogAYk0/SD1OiAtigTho6S2zkb7GSiIpAN7t0t2J/5dtG0nFkMccZwMCS+YnuhqtBii9qjD/BIZAxabuqa9m27LNsG+XiFNsAnqx4K6d1xqN38ECRO8PlE5OOipAz9Hjamfs5jS6mEiKdYezP0r3SR/XsUAcwjZFegSjFkmP87IVULGLCYLNtfxObCPfIRYNvPry9JkASazjg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKRDhhojWa0E7+oSakwdYxpVG2M8RUgmoh1JnrEFaMU=;
 b=E/4vjqCVeIEZL6yTXXaNt3PCBOs22ccSQosZVDHVrtVvxO1XtXmmBXlqqcyy9T6OMIqpEjV+X+AonBjTlkLVQk7BvIB2LKrH75Rjc2k7Fy8TiADE5Sr05G3NhVs1TVypRZLN5fcbwFek2RqWdG0xSJc70pYuxbGcd7PPCLdS4a0=
Received: from DB6PR0601CA0014.eurprd06.prod.outlook.com (2603:10a6:4:7b::24)
 by GV1PR08MB7898.eurprd08.prod.outlook.com (2603:10a6:150:5d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Wed, 27 Jul
 2022 18:43:49 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::82) by DB6PR0601CA0014.outlook.office365.com
 (2603:10a6:4:7b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Wed, 27 Jul 2022 18:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 27 Jul 2022 18:43:49 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Wed, 27 Jul 2022 18:43:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 416591e6b2b9b0fa
X-CR-MTA-TID: 64aa7808
Received: from 06ed62d687b2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AA434DCE-162A-4A8D-AE3B-02BA572928FF.1;
	Wed, 27 Jul 2022 18:43:43 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 06ed62d687b2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Jul 2022 18:43:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vt9A23P9IUwNL1Ry2kYILUQ1tzFGPKSF9YEtwHad6D7og3UaTjUfGi0A8qA8Os4uZL2127UpiCKjmvsAL7QQbaHiI3Ok7LjUfe3iwOqaHRH4H0vFQ3i+FQ7+qcK0tVv+LiuKyiALNBfwDHYPiyHYY94aAYFoDbDB/u+CoHTICC8+rhPSVraxcN8aQBN5Nnj12/1yGofdRymByol1FHtZNpqZr9MU0jQVe055mrDeVs/6xfOCPao+erUh0v8G9Pq/UVOYAHK6BuyUm4Sjg8/scDWGaBwiinMxHqnOzpfbOqM7iHEe3Y1BmqSsERTQTXGYeiyXimbWyZz+gjn1ZK93QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKRDhhojWa0E7+oSakwdYxpVG2M8RUgmoh1JnrEFaMU=;
 b=SrLkYVJ1fDDHQ5t9l97hlPqUiIZlcye9O6IKg6WghoPLmT5T2fKFrO5xijPyAlOBJHn7acE0XC22sJtW2fkt96r8UtQu0dvq9R2FmcNApHY/uJF3TtQDPeBCsMa2xrkxHDymmFzN6uFIVJUVuDJPlzirALRJYxAK7um5S4YwIXXPiKpuQ3qZQvCITA/9mFqNP+5LlY2wYD7vr5Cvjbp6xzeF/qWIyhrqlGAg2q6oxmbCpBzzNeGyjgNd3aKkULRZ8Nczifp643xwWfd1eypb9C639JbSBJSOuxDxZwm1bU2It2XvyW1R9SDXAaFFPMpPnTFqBIVJwzhnGb5sfIMA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKRDhhojWa0E7+oSakwdYxpVG2M8RUgmoh1JnrEFaMU=;
 b=E/4vjqCVeIEZL6yTXXaNt3PCBOs22ccSQosZVDHVrtVvxO1XtXmmBXlqqcyy9T6OMIqpEjV+X+AonBjTlkLVQk7BvIB2LKrH75Rjc2k7Fy8TiADE5Sr05G3NhVs1TVypRZLN5fcbwFek2RqWdG0xSJc70pYuxbGcd7PPCLdS4a0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM6PR08MB5543.eurprd08.prod.outlook.com (2603:10a6:20b:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Wed, 27 Jul
 2022 18:43:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110%7]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 18:43:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
CC: "Purdie, Richard" <richard.purdie@linuxfoundation.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomic
 builtins
Thread-Topic: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomic
 builtins
Thread-Index: AQHYobCNp/pDUHHp/E2gMRFZmhqen62SV7qAgAAOVoCAAAQwIIAAAbCAgAAiF0s=
Date: Wed, 27 Jul 2022 18:43:41 +0000
Message-ID: 
 <PA4PR08MB741108E94733B5D147C7FBDCE8979@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20220727120036.633822-1-otavio@ossystems.com.br>
 <EC73E18E-0AA2-4655-8A53-EA278A198969@arm.com>
 <CAP9ODKpT6y0qvhryKm_NqTX82dmOytSU34yR_-8fG=WGZ06QNg@mail.gmail.com>
 <PA4PR08MB7411B7CCCEF2AF6FFB1EA063E8979@PA4PR08MB7411.eurprd08.prod.outlook.com>
 <CAP9ODKpo9=JeKvdEK+kX5_2gVWv4haSyU1jYgFLGcwPci8qMsQ@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKpo9=JeKvdEK+kX5_2gVWv4haSyU1jYgFLGcwPci8qMsQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8eb4c6d2-b258-48c3-f09c-08da6ffff202
x-ms-traffictypediagnostic: 
	AM6PR08MB5543:EE_|DBAEUR03FT008:EE_|GV1PR08MB7898:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EoBQgemBCpRCDdqttLl830Y6nWQ4//+EwBY8KstnFT+BjaKVAf13RK+3p1/FXKe2cYJGCE+Qo2f9v3GpBFyj34W4G2iJ3CKuD/FlF5I6OuN/o5DqeP3U2TxLGjDf9+JsWLQYJy2wiDTKWW4efV0vs+9fxv0UEKWLC0A3fgnAOX/YTLXpebFqaylB7BM0AryKYRKnNYevcCsApz6gHGwhX8x5PnzhMxPAPrIjY/nSBlQnEJPLzb/razLQR1k2LOCJBT2mjkjulEf6eQ67FgtUUFlQjH1hOtlavrwv1CJyJHqMtutbGHohQ7TACTtdyzYRsnrIEnp5356ZZf7CFcQm6hgZrPdbecQDSlr4QnXyKahoHR+1pKB2Wm/GoigNDaX52wbGmVGA12E243cYVdPzylnXxFkIIDbeuvsL7Jy68yKtnwHtIYUAoVIV7h/LJHkolA8rNfKOEiQAqeNmcRuT0OqRp4zFh8rIr8l2XMP25iwZs5jaGzeHf432KN6+ZaZ/m/rAja+qSk6nzPoVd2F5+LQJRUpq+q6R/ZGKqqsfcHe+xpiLC+KRiJZ2yZzZYSFxoGw0Ui7lmmQtLD+yK7bX1oejzkSzKuUqEiRjqqTEn1pDoWcq3BST50tKK4x6lATTYFgnGF3JINHnMhzl2CxzsDXAPQ/fDaDCIEIdhUY4WgbKbSgysicTDHxtcjtmUIaxjCLgF8ACXFcK8YL8dtt2Af0nvDS+NlJ7zEAgVhnmcCELFVil7zEamnS7q6v210JrUfX4ckUlQnT+icn230hlL1Rt1vZrvWniHpDgsRRIYFXzhqv8nNUtnTDVaVsaqQ7M0EJCORHU1mxj/E9TR+T+5A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(6916009)(316002)(38070700005)(64756008)(41300700001)(86362001)(4744005)(478600001)(966005)(66946007)(8676002)(6506007)(83380400001)(91956017)(186003)(66556008)(2906002)(66476007)(33656002)(38100700002)(76116006)(7696005)(52536014)(122000001)(55016003)(5660300002)(66446008)(166002)(54906003)(4326008)(26005)(40140700001)(8936002)(71200400001)(9686003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB741108E94733B5D147C7FBDCE8979PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5543
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eb4b00fc-2a26-41c8-4a23-08da6fffed0d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7FpKXEpVUN5coAwxl5Bfuom5gaRcUJ/yrpD05x9J3VFT43Zvs8CVyVksrBLdkxwOc7/IXO9YhjeVpJYA3g9Yf1OhZTuvBHaFDLvIBugj/ihHX2IvBkOsNoiNqMMixfJPE7fJH4hnzMxXZWm+W4pTSaBvLJUaZgc4r0/u/USCMw9POPM6RZMha8pt9G4fwTDdzjEOs+Zffdnk5QYOWhauL2o7B/gT5N9TITi/W1hEdZrF66meyME23dbo36yJHxdoiPl/8EQjZWWOHNdrjXXXMOJhWu3ycC0Nlx9OYRnjeZz/MKyLOr9mxOIsHgK8As8QHaQlTBTGY82HTnKCofmiaimINkklNMYJlgLLAzhw56PPTsTD/ZKYPS/hyRD5ctLvcySKqFagdp5DnJuqe1uNAbJsuziqOSRdvGZ4fzlNHbbAR3yW5/g1L9qiHK6/HiT0q7Ge1UXxxHNj3+m8CTuRfTkFZ+vFq+sFmi/C7g0QHYtDSt4w0+S0AZ/wSNqLJeL7uEfkQ0iY/I2liSLb9cEFoa07a9hVFK9WY8v5Rmo0mq9Uw2SRI9cTT6ZnaFctntsgumsf2t7ZwWtDGQ6PeYROGsH4ua0uPCi/yGKADcvHc+NXU4nNZrZrRtHCYlXdL8k5IBgYer29UW239DVeHL3hHfP3ssSH5Hg7rnVhaIhkZKsGo/fBmIYsyDTjfz4fVKr6LTc4PT6tivKLaQxQF3/RxtfVH6wfryF+WvuYV3uoJSFBt0vQyv+hGq2QNlfDkRh3KbA893jlIajqmcbKj5ReerwZwtuClvb/XCJY7FYHwQTg1BWBlBfZTI+IScr9PCYqhOsY8+TBBQRhIwikVb+ZWQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(40470700004)(46966006)(36840700001)(33656002)(356005)(40140700001)(82740400003)(81166007)(26005)(166002)(186003)(86362001)(36860700001)(336012)(52536014)(9686003)(55016003)(47076005)(8676002)(54906003)(7696005)(6506007)(4326008)(316002)(41300700001)(2906002)(966005)(70586007)(8936002)(70206006)(5660300002)(83380400001)(6862004)(40460700003)(82310400005)(40480700001)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 18:43:49.3812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8eb4c6d2-b258-48c3-f09c-08da6ffff202
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7898
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 18:44:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168587

--_000_PA4PR08MB741108E94733B5D147C7FBDCE8979PA4PR08MB7411eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> The patch sanity check should warn about it as it does for the status hea=
der. I said, RP can add it.

Easier said than done when a patch already contains S-o-b and we want to al=
low people to S-o-b from their corporate accounts whilst posting patches fr=
om their personal account.

Ross
--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--_000_PA4PR08MB741108E94733B5D147C7FBDCE8979PA4PR08MB7411eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div>
<div>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt">&gt; </span></b>=
<span style=3D"font-size:11.0pt">The patch sanity check should warn about i=
t as it does for the status header. I said, RP can add it.<o:p></o:p></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Easier said than do=
ne when a patch already contains S-o-b and we want to allow people to S-o-b=
 from their corporate accounts whilst posting patches from their personal a=
ccount.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Ross<o:p></o:p></sp=
an></p>
</div>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-- <o:p></o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Otavio Salvador &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> &nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"http://code.ossystems.=
com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>
Mobile: +55 (53) 9 9981-7854 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Mobile: +1 (=
347) 903-9750<o:p></o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_PA4PR08MB741108E94733B5D147C7FBDCE8979PA4PR08MB7411eurp_--

