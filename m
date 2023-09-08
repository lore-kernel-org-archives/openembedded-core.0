Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDC8EE57FA
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 11:12:16 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.88])
 by mx.groups.io with SMTP id smtpd.web10.36399.1694171529699355161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 04:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DLPSlhfX;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DLPSlhfX;
 spf=pass (domain: arm.com, ip: 40.107.105.88, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eo/oHhZblgCMh+sxXNly/zRcSfo1CyB9VhEaIG5cVWs=;
 b=DLPSlhfX+hE1f/FOwH3PJs9BfqF0FfagxZy5/c0o9wWVtIAE+KXDQ9nyxGMgxzccQti+DCntpg7m7z6coCaiDk50ZilPzrsbmDYvABtZcpqNe9a/apdBmjsrMx9pSaz/dZIVckuixqjtbVv8ekRG6McMlT1bnte6s5WoxFYzdng=
Received: from AS8PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:20b:459::24)
 by PAWPR08MB9968.eurprd08.prod.outlook.com (2603:10a6:102:35b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 11:12:04 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::18) by AS8PR07CA0031.outlook.office365.com
 (2603:10a6:20b:459::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.10 via Frontend
 Transport; Fri, 8 Sep 2023 11:12:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.28 via Frontend Transport; Fri, 8 Sep 2023 11:12:04 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175"); Fri, 08 Sep 2023 11:12:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5fc8b824d837f456
X-CR-MTA-TID: 64aa7808
Received: from cc080a74be4e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B4A2DE09-E9FF-4566-A8F4-F8867A3205A8.1;
	Fri, 08 Sep 2023 11:11:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc080a74be4e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 Sep 2023 11:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NehyaAjO6R2Dqc8bhKmwkpZv44q1+4w4KGuQjxyLuENBJ593h5pkqVe1EwZ7Wi6arqd+ZTR4CkGlh9krAodYgTaF+LxZo/Pg0l9O4F0TSkOymDkW97qjJ+fAFd5EkMURtU+CpIV62xKvOfl2he1yBoNOvnLeXKGDYq8cERjZo0+404luZXsBfv5A4WY4Edf+yvsuPiroUMjdPuNkIHbeO17WDUGA1Cek0PN7SsI3pNoikywPJ7Zu8HAG+sD8dteAIDJb13l6mVZBiyG32091f+BV03KWcsTNqkkKEjJeIdg/dg0EXJPDt8H5HGl6HrTfNjru1A2DG57G7G9C1SVLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eo/oHhZblgCMh+sxXNly/zRcSfo1CyB9VhEaIG5cVWs=;
 b=PmmYKDCF1NmenAjiss1IhLija/KJbu2ue0FpOAMQFdtcpTGOTM3F4cvYStCOHlwLzYu81vfjXof8G785PUoQ7y1qOcKC396vMmo18+lwDN3Y/UkoFeRANTmircUcoteGptsu0+B7xwKAUiCfN+sI8Ef2XT2KE3I93rWtI35wdgAT/tTMBpHdJfCHYCeqdLCihiLcHPq5rTtNXyKun1cGAeNawE5o/zpCBjKd/bat3l3x/4QN/X+cYWenRyUGTlxNpiPJ/X2vUbfNfPQ0wMnbogIqkzj70JuYj85CVsgQCpYZlN2O/CAfU+rj1Yx9TdIAVz/mz/9w9w2Ok7EdoUBdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eo/oHhZblgCMh+sxXNly/zRcSfo1CyB9VhEaIG5cVWs=;
 b=DLPSlhfX+hE1f/FOwH3PJs9BfqF0FfagxZy5/c0o9wWVtIAE+KXDQ9nyxGMgxzccQti+DCntpg7m7z6coCaiDk50ZilPzrsbmDYvABtZcpqNe9a/apdBmjsrMx9pSaz/dZIVckuixqjtbVv8ekRG6McMlT1bnte6s5WoxFYzdng=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6536.eurprd08.prod.outlook.com (2603:10a6:20b:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 11:11:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 11:11:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: nd <nd@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base: improve LICENSE_FLAGS_DETAILS output
Thread-Topic: [PATCH] base: improve LICENSE_FLAGS_DETAILS output
Thread-Index: AQHZ4kOmW0/oBEMfkkKjNnYqjXPHZrAQxfgA
Date: Fri, 8 Sep 2023 11:11:55 +0000
Message-ID: <892BA4D5-B1E8-47E5-9517-E845AEDA0FF1@arm.com>
References: <20230621142212.985096-1-ross.burton@arm.com>
 <cfe36dd3-a32c-def5-a8be-9011d070ef28@bootlin.com>
In-Reply-To: <cfe36dd3-a32c-def5-a8be-9011d070ef28@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6536:EE_|AM7EUR03FT028:EE_|PAWPR08MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: 098b3314-ca1e-478f-6d01-08dbb05c6e85
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SLEQ8S6TLzq75l2030JKGk2Sqlwzuc/1aAbN+G0NgOdCgaurz5E+5ZEFrz3djBdw++AEF3NBo4Az6RYBvrMsxeynJJYhlh6ziZLpsNZPH18F56uFsHQ6V5+MeN9DjrrzP5NB3BeslFEmgq6+1WUuo6UtP/IFlG/7K830YB4jvIgBejLZxxjX+HGl1RLPEdPY/hYDB1sQb0kPXz97EikElBsdicuHENBx38B4dreIWS0R1wKSzFS+IWXUbZy7vJKjIheiNPzDVrEVuBo1XxI3LLxDmSXBi/Ys9O8yxkabd59Vp11jeecws+lR+6EaP73DpaeSDY+39wfTKdPmKNceazbjkDGYUPTcPQ0gTR11pxVRvt7e37KLR2yBUoOLcROksTvHS6Y2IXHSyvhAVzx04rMbZRq4DBoXNFVioB0v+Byi0ylbu3/6fQQigCWYoidOiCFoXhYraSY2bjbzDazanl6kVPq0E4f/kMk6p9cBSRTMgVwoIuv4r6vCxL4Mn2pXtETnjMKzvUNBs8uKaTkXo4wB9Vz6FZsHv/hOa4kaRRThOuTPvjMC6J5k33mEFlDBrC7r+Omo8qvjq9XsYFmuIgRzvRa/sP4/Svxz3VAi38Sl4ImYyG49E4M0f//QZGsXcx4s8NLco1jOfcEKy2NfiA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199024)(1800799009)(186009)(8676002)(8936002)(4326008)(41300700001)(91956017)(76116006)(64756008)(6916009)(66446008)(54906003)(66476007)(66946007)(66556008)(316002)(5660300002)(2906002)(122000001)(38100700002)(38070700005)(83380400001)(6512007)(2616005)(53546011)(26005)(86362001)(33656002)(478600001)(6486002)(36756003)(6506007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C8E9BDC5DB08214D8C1F44B2458623F5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6536
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2ff27c54-444f-42d2-91e1-08dbb05c6990
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NoFXQ8lP8yiVY+GeQO1kOJzEAVm7FUA6mvvOWGLd7LJvuyqIPxPJJto6PsVNqJDiWBp2Hfya+/0TjhJ8nqNi6S+7z688i4zNsTS1flfn5WVBPtm8+FXv9+x1qcjUfVMe/nxHx9/tAav+Zek9jSddqRuUwiJPNP5oXlHnmGM3+pb6p87ln/6U8OFISffSGs/DGARZhyjN7LASpAC3KFiJVS4PIYD40p6NeBj3pTk6S0ikYbSkEbsLSTnFvGAifcUYUWIXD/CDB6nuCxZ0LLA6M++2KyzJz94EYAEd0TdUTc74jZY9gZinOPpVy4nu3H8VVIaGcWc/e/FNN2X6AAmZTGwaaf2NUMQnymyiwgil1SbjJa928fqKzSkJnqq7fi30BgUlQ4V7ie4Gg0PI0A9DEFGT+gCCekLikC/LxhgToydEP12WJQLmfV3vrf3CJWMQjgyhRHWK698A6hYM1jKDWafFJw5t85fZL7Fin3ad/oN0VXpnqz5EtkUAghBMKYuMOfNiZoU2rTeuMtdnpoh0C/7N/28BW/6APMOpM7HsOq1ljA4lvAa1XqA/CR/pIufAwX232LRr7wwCVfOSikMB1hP1A6AoS9YcPTT/MHB/n25dRN0KaIa2iZ2hgENVIyxun5TN2IuE0ga32QQCMx5Q9cQNM6wiMcRP5cNt01V81uZ9/m7o0Jx5DOB1LWzAVbkj8ZmGSd2tSkQse0/z1/Er3JhLKuA7jsdYXRv78USCyc0bM+uhiEQ/x0VX5CImA/lv
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(81166007)(82740400003)(356005)(36756003)(40480700001)(33656002)(86362001)(54906003)(6512007)(26005)(70206006)(2616005)(316002)(5660300002)(53546011)(70586007)(6506007)(6486002)(478600001)(2906002)(47076005)(36860700001)(8936002)(6862004)(336012)(4326008)(41300700001)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 11:12:04.0149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 098b3314-ca1e-478f-6d01-08dbb05c6e85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9968
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 11:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187412

On 8 Sep 2023, at 12:00, Michael Opdenacker <michael.opdenacker@bootlin.com=
> wrote:
>=20
> Hi Ross,
>=20
> I'm currently writing the doc patch for LICENSE_FLAGS_DETAILS.
> However, I don't find the current behavior optimal...
>=20
> On 21.06.23 at 16:22, ross.burton@arm.com wrote:
>> From: Ross Burton <ross.burton@arm.com>
>> Don't prefix the output of LICENSE_FLAGS_DETAILS with "For further
>> details, see" so that recipes can put arbitrary text in their license
>> details instead of being limited to a specific sentence structure.
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  meta/classes-global/base.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base=
.bbclass
>> index 976a2ddee4b..cbda8d12f09 100644
>> --- a/meta/classes-global/base.bbclass
>> +++ b/meta/classes-global/base.bbclass
>> @@ -520,7 +520,7 @@ python () {
>>                  message =3D "Has a restricted license '%s' which is not=
 listed in your LICENSE_FLAGS_ACCEPTED." % unmatched
>>                  details =3D d.getVarFlag("LICENSE_FLAGS_DETAILS", unmat=
ched)
>>                  if details:
>> -                    message +=3D " For further details, see %s." % deta=
ils
>> +                    message +=3D details
>=20
> What about
> message +=3D ' ' + details
> instead?
>=20
> Otherwise, you have to add a leading space to LICENSE_FLAGS_DETAILS.
> What do you think?

Throwing in a newline or a space seems sensible, yes.  Want to send a patch=
?

FWIW the recipes in meta-arm put a newline at the beginning, so adding a bl=
ank line if details is set seems fairly sensible.

Ross=

