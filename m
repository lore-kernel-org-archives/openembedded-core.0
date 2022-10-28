Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D728ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 16:11:57 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web11.1376.1666973514607864579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 09:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UDAtWHSk;
 spf=pass (domain: arm.com, ip: 40.107.7.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TIjuP3jLp14kV6jNGXXBght82GCbwA7XZ9lfeiK/FjMVSy+Vc3th3m0swFFUTUu1gK/vmDvz+kAu5XWlAPkpJJLxMrWM5D+E4+Opinsi8TteBh3ka45it5KllWH17AXjQLqDXBF2eSTCVV0t0sBhDkPVUzUmeFtF9IvkT5MtFMBp6bjtoZq6Blbb7aaBarEYq8Mhuzd7oHhHlXHrnMRO5CIIrKHfje5CeCJlLmPFEduB6yMrScFRUfYTN4dLJu2RsYMuL97uArjjF6kPI/MIVs7fbThLdPAT8XKW7/MMakY1lOaCyt7k0gMiFw25UAS/xOvpPplF66qWVOku+rfYwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yIaBuziEU3ZsszxkbYG+tpD7TaBkKKFn3j2TdOTWoI=;
 b=PTYMwz5LwyyXU2ym2ORI6EWypNXSw5PwgaHZAAx8VJaBvo5R1X9HV2mAeqE3W/Yj1LDy28RhmQauj4nzsJ1P7WZw/eSAS1QuFeoMsIBmIVfhLIehHxylzEHtynMgJG41eCCm3Dh+zwqZmWQ6ipkJmG7Bf5D0dyDm2FF+E8ogvEQ1ItiiPDLSVTYQ+xECj5RWFo8CaCc1v7NPmzYXUCgs6QXzw5S+qox6dbXOEmZdAyfAWm7bO3QZeyXcyQYeV44Ml+q6oK98Ykorx8omA8qcfcYYqR08sycAEuaLvookntL3x6mSwIVgsxekorhIXQOjjYvyd+ChY1YICyLS4mG/kA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yIaBuziEU3ZsszxkbYG+tpD7TaBkKKFn3j2TdOTWoI=;
 b=UDAtWHSkkE7AvGAZ2h8GyHc6T58fPjWLIDjY8c7F5rpL35KWvlct3yNWiKTa6pMxMrqlar9xV7/lJCQtyHGIMgTTb3CO2DzepFuA6k3pp2Xjpt3FEEN3mMNM0HkZM99Nlq+m4uXScSmFraoJae7i5cLFM9O3n6qNEl5TqV0UvrY=
Received: from AS9PR06CA0497.eurprd06.prod.outlook.com (2603:10a6:20b:49b::22)
 by DB9PR08MB8359.eurprd08.prod.outlook.com (2603:10a6:10:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 16:11:38 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::e5) by AS9PR06CA0497.outlook.office365.com
 (2603:10a6:20b:49b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 16:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 16:11:38 +0000
Received: ("Tessian outbound 58faf9791229:v130"); Fri, 28 Oct 2022 16:11:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5e00103914c2346
X-CR-MTA-TID: 64aa7808
Received: from a90ae41222b4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A2796364-6167-4362-96B7-A10E786038E4.1;
	Fri, 28 Oct 2022 16:11:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a90ae41222b4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 28 Oct 2022 16:11:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAbBRBDX3p0kGElV9gYdb4cVQJ9XeF7FPWQJMjTCT0xhEgHJ9l9ON2GtzsP1vGaz+Xf+YDYJADn+Z4snDFtXIKZkom4Bh1SfsQqO1/ZLqcCEjm+bnWu+S3yT3fs6+vWBQKMsR+t+oLVjcM1TreY8tGNPcIhbN6KHn0k6CyYSVWwxKB77iBTp0vppi8e1Re+CiAfUbbRMnepmGxH2psmU+/NoLoayOOw4QnW5uNOup+WIb2lU0lj4cb7u16F1wjmPldXwOQCuaaKIYldubFBX3yAflZ5Xz76NmzL1m4ukqmhf/F2SXk+izmXZQpcQ1RIkRSzheSZ9jOnS+FHDWE1NBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yIaBuziEU3ZsszxkbYG+tpD7TaBkKKFn3j2TdOTWoI=;
 b=RQJdcrNtcLupV+p/mjUG1NeBoSlqpOd3cVq1dtPszppR/pn3dEAZCuU3rEBWQ8J8WucTP0nJY+JWCEtgOwFQGtiipvKZohTB98MwbO9NVVK/1XmhsmLzfPPV08irmgHHgPTL51gD4gGtVuLyeqz0raPDK8mcd6v97+lRRHpbPR8Y7wqzzLQ3emx2U7lZKEwMAhjHxbskqFFH9GbeQu2WCRDzxKR5dx0dOmJqqY0o6ppLzzfjwiox/wXY047FXXeBhTg2vkuK0+fRwNjEJvai2HUa2GCDpBEzSD9OV5B4WNRs/K2EjDyawQSN7lIHwvcMzqB2KWBD0k0wBMT+H/TlKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yIaBuziEU3ZsszxkbYG+tpD7TaBkKKFn3j2TdOTWoI=;
 b=UDAtWHSkkE7AvGAZ2h8GyHc6T58fPjWLIDjY8c7F5rpL35KWvlct3yNWiKTa6pMxMrqlar9xV7/lJCQtyHGIMgTTb3CO2DzepFuA6k3pp2Xjpt3FEEN3mMNM0HkZM99Nlq+m4uXScSmFraoJae7i5cLFM9O3n6qNEl5TqV0UvrY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6483.eurprd08.prod.outlook.com (2603:10a6:20b:315::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 16:11:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 16:11:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Mali, Narpat" <Narpat.Mali@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>, "G Pillai, Hari"
	<Hari.GPillai@windriver.com>, Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 -> 1.21.0
Thread-Topic: [OE-core][kirkstone][PATCH 2/2] wayland: update 1.20.0 -> 1.21.0
Thread-Index: AQHY6uW/0edjXnXA9UKuEOJhneXBwa4j9rmAgAACYgCAAAD4AA==
Date: Fri, 28 Oct 2022 16:11:28 +0000
Message-ID: <E812133F-F6BF-48BA-A463-A7C8B7333327@arm.com>
References: <20221028155331.1594577-1-narpat.mali@windriver.com>
 <B23AF8E8-1CBA-49E5-90C7-404C1B9F322B@arm.com>
 <DM4PR11MB555097F6252E7B857E5A90EBE4329@DM4PR11MB5550.namprd11.prod.outlook.com>
In-Reply-To: 
 <DM4PR11MB555097F6252E7B857E5A90EBE4329@DM4PR11MB5550.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6483:EE_|AM7EUR03FT016:EE_|DB9PR08MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: b110bab9-4afe-42c6-abc8-08dab8ff17c8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 s/xAd3S12Z00AAHEgs+5Lai3+NCa58D0pUBhFOvUV8LFlf4wIKqLU35J36RLp4/xx5L+9Pdc7RAptou7YOay886X2fmx/HW5TtX1iuwOAVgmePB9MHp8a0IGGyUaYgm1lESdH4YGj+p5q3UX3KXen6yurecC57Ya468PGVzbS0oX8eq8Pt4QV6pGiEd2s64bQWzgrWaTm9163IxQx7suHZHA8OavcAxQhSjPZ2bC7JXzhgElDnRougpi2ikbBoAJ9nMCkcyxNNsKiguBONJ2WQqmxpWL32o8N/f7Hn4KUwHAkw0Rbgn0Ss7RV2xps+ufyfzI4UycHTflxgit2/WNGpxRPsxNrIocJdFGz9S779/4pFkhUWdQKRxBX3eHSoTx61FQ0SRGKjwffXDONSIvtK57Qpp8rcFN56zmMglaeNdCkKHH8UERYMCjbVDRPe7m34tgNMoCW2pMhhCEK+a0wp8FjxlqaCedwIngVK613WCZ2vXIf298M/vriuL9rhaxwSgygzvhvQOor5ylzt2je3QV6k4mRiPzV40qKvGh9bbHWknhxD3nCxZT8TgBPivPddi/Xj4kL2GI7uRSzyWs8dj8MYcIrM6HtTz0Stb6Qf6YXsV3hdJwhxYmyfcFLybRMbA4cL3x1AuxyfSpkVh8kmTbH7SOC7lXdvD1nPoTsnHyByXfkoXc4rG275e/CW0xEJ+GMhh3FVpzep+EMzWbWIiLCZM1XQZjBSL5A/xd5S3vGJP6NpLDS2MGlSStI0As
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199015)(41300700001)(36756003)(4744005)(66476007)(66946007)(66556008)(76116006)(122000001)(5660300002)(8936002)(83380400001)(38070700005)(66446008)(38100700002)(86362001)(33656002)(6916009)(316002)(71200400001)(6512007)(186003)(2616005)(6486002)(478600001)(966005)(53546011)(26005)(2906002)(64756008)(54906003)(4326008)(91956017)(8676002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6245B534B94DE43925C8501E8A17A75@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6483
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1b0f1aba-5dcd-4fd7-406c-08dab8ff124c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kcTANFp4gFAvh30KUn5xGcRqow+9jFnexLLqNu3wOGtskP3YfXt13/86ZuVAJwhG93w65gey6Jhb+IyncMmTOBMROqzjkty9rCVJpGI3R/N0dDUl9Yf7qfdOd6eJameedQFB0uuQQimr05k2NklzMhfphGYXaCHzsh9QYXkSBLpvx+lMI9jT45mfKoWOS9NtMyX4BvIgE1kcsbdF8erS/AEWw2JDlgde9UaKMREQhgDvOMyVXp+i+QpfAr84N8sc3pOvJLhND/aF7O7/yN8TyKDtz6Gkt3dizVi0/UEGjd60JeA1gLtZP1nln7+rbY6C1AqFz0m1b7K1XgHmR1gYQ8SS7g+kFrQEhBd5Oa6jK6UjXPsSEGfzu0Iusrsazb3UArU2yOBEVYyjVef/pTOa/eApgk0LnpcqnbayVodzFk0O+7XjH4ZNKEHgULNKF/E+T0q9PNNqxXpFKZ2PjUMP2lqDYXHHKiGmGDKiuP01zBD3QvB0QDnwTkKb2MGx74mbPjCAjEhH/xHrkTrvD7K15Eh0xHhC6521b2WXzysmOhJRhOjmWZuwAE7oM7fYMQexuLstxiM6c3c1BaPI6ebVDAmnYJGC9MNolXGik1+5/1Pb192KJFvOjlec0gnNU6varAaJIHxTieI0zzlM+3rd5c8dWEJpxjJfMVljZCy9DFqY1qVIb1CVWYWLRV1nHTS6YAa+QCUqT9YXdmzWTyrksQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(186003)(36860700001)(2616005)(966005)(54906003)(6486002)(478600001)(83380400001)(40460700003)(8936002)(6862004)(356005)(81166007)(5660300002)(82740400003)(86362001)(47076005)(107886003)(316002)(336012)(2906002)(41300700001)(8676002)(4744005)(36756003)(33656002)(82310400005)(6506007)(70206006)(6512007)(40480700001)(4326008)(53546011)(70586007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 16:11:38.0919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b110bab9-4afe-42c6-abc8-08dab8ff17c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8359
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 16:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172265

T24gMjggT2N0IDIwMjIsIGF0IDE3OjA4LCBNYWxpLCBOYXJwYXQgPE5hcnBhdC5NYWxpQHdpbmRy
aXZlci5jb20+IHdyb3RlOg0KPiANCj4gVGhpcyBsYXRlc3QgdmVyc2lvbiBvZiB3YXlsYW5kIDEu
MjEuMCBoYXMgdGhlIGZpeCBmb3IgIkNWRS0yMDIxLTM3ODIiIGFuZCBpbiBtYXN0ZXIgYnJhbmNo
LCBpdCBoYXMgYWxyZWFkeSBiZWVuIHVwZ3JhZGVkIHRvIGxhdGVzdCAxLjIxLjAgdmVyc2lvbi4N
Cj4gT3VyIHByb2R1Y3QgaXMgYmFzZWQgb24gImtpcmtzdG9uZSIgYnJhbmNoIGFuZCBpbiAia2ly
a3N0b25lIiBicmFuY2gsIGl0IGlzIHN0aWxsIHdpdGggMS4yMC4wIHZlcnNpb24gZHVlIHRvIHdo
aWNoICJDVkUtMjAyMS0zNzgyIiBpcyB2dWxuZXJhYmxlLg0KDQpodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLy0vY29tcGFyZS8xLjIwLjAuLi4xLjIxLjA/ZnJv
bV9wcm9qZWN0X2lkPTEyMSBzaG93cyB0aGF0IHRoZXJl4oCZcyBhIGxvdCBtb3JlIHRoYW4gdGhl
IENWRSBmaXggaW4gdGhlIHVwZ3JhZGUuDQoNCkNhbiB5b3UganVzdCBiYWNrcG9ydCB0aGUgc3Bl
Y2lmaWMgZml4Pw0KDQpSb3Nz

