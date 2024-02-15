Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9235C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:27:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.18224.1708014459962807179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=l4EdNzKP;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=l4EdNzKP;
 spf=pass (domain: arm.com, ip: 40.107.20.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FtZuRs+9VSUyb5g1RSBtE5hJaiPvGvYF1s5TfTKtwWkDY6TRHEGK4DHUbhFP+gLvQ9rbD2i1Pf+gu/bbLtqXz8m+UVfyzP1x8tdkmRlNJvSGgnRMODSXpz9STlvCtMfOo69etL0xLh+oNHtZupPA16JSAbMynDZLOftqXFMMq9F7mnKXsIof/ClcHQwTVF+dDMdMYqCAxNkdkPbtMLksMec5DbiM6NG4B0G8RarnNfMnfx2nIKQ3fcKmdFrqI37jS2aVuJC6i0btp+BDCmfOM42u/LcPAYqbTY9r1oENMVK/6TOX0z8XMcclpxdJlcs4GwEt8GBmRqzNgw78oTw25Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cou61oFA9zOdEOzhSj3qutRyEv13e+cX63s8qkWjMg8=;
 b=DrV6eo6mbISYNSZejLw2rAhSx1hHBQxko4PrvL+Dx0WfU1PTmah97IBPtm6/vAjDx5+ytCA3Jt22d3KSmAyUVS21P+nnccbd47XqpaL+G14QBC1t+NUe2fAq3Mq7UJMIcmxDJNNENEQRcJ/NconDLwUIVOggz9E1inDDhZ4ScFTDuuudpPP8emhrRUDjviiDtOyel4QUVBGVpq2Tu0ZPKyB04kbWT8xUvxSmyELwsPnJmjwehcq5eaOZtEDWzBjA9SclqqqUau/iedUsVvlyhf+pHr3P7IiBYjmQrDDpSruTR4b7RGHnmcmXB0cHh+Bd2oevg3VMXmsnV8GRheDfsg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cou61oFA9zOdEOzhSj3qutRyEv13e+cX63s8qkWjMg8=;
 b=l4EdNzKPUJuSN+Ie575eSR2OyqNlG+Q80F0YEZP9YKLGOw0LhWoAAvhjprQR7ZaHrRQ9QZryHZDLrXZrnaRzEoQXKBpR2te2tMfOha0Jx2ODx90BEs3SBvwJXfvUcCbaBOz+aeDomVwisIieqTo3shJpIoLbz77Sehql40GTKtE=
Received: from DUZP191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::22)
 by DB5PR08MB10024.eurprd08.prod.outlook.com (2603:10a6:10:4a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 16:27:36 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::5c) by DUZP191CA0003.outlook.office365.com
 (2603:10a6:10:4f9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Thu, 15 Feb 2024 16:27:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Thu, 15 Feb 2024 16:27:35 +0000
Received: ("Tessian outbound a6e56d06a0e4:v228"); Thu, 15 Feb 2024 16:27:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5f0949a86bd17046
X-CR-MTA-TID: 64aa7808
Received: from 18d4429741bc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 34CAE4FF-80FF-4D4D-B254-A4EB1CED1B22.1;
	Thu, 15 Feb 2024 16:27:28 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18d4429741bc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Feb 2024 16:27:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7gKGdMvkJ+GXh5uH0JRD/mNmWOYVdV0sW0aotN48uQfrwQuTj2lSFm30MOpO95BZvOVYZ+XfaT1OIGxiwBA/9rfZqBTGK0iKSfMiyRg0hHc4gHyTnFJM1Xnnq2XGUDEIMmA/XOhkNK+At6A/nWtcZ9sreRfozFI34uW3y+/95PtxCoTSNpOoVjtsI4dgKWxIfC1Ku97No1qRa+FiQ9VRJx4irILEK9o51VKNLKhEVVpy/raq/i0FP5RDIPCxa7sF4Vc6GjjmVvpev2ymWBR/MaMr/vbfAkChuQ09YrMtYzsxggMHpRKbJfUUQdaBZnsbkKAFmieaDzeTLiKVtWLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cou61oFA9zOdEOzhSj3qutRyEv13e+cX63s8qkWjMg8=;
 b=SJRg04truePa6hcB8S1E3Oe1ZdM0BxDwoC5uKBbD2u/nQ94v80oIYLA8XUPFsp6rJnu84GKBScSeALEAAyxmdlDPCz9JumNq7SzV98DPyH6jBRFYCj7lnK2mHKFAdNCTZ34qb0M9XyiGvt996CuvGWgMTtM2GgfB5kYpnOoBKAdKstl3Os7FVpTh0Hgqavb55JrE7BNscGZAnmUZp/OcAMteMzgNt4McUaaM+iDiXsMHwCNXN2fKqEEkew7i65P7sKhoO4xv4haDbPBDwdh7lwZT2PsWwR+OxrldRh6oj9n6oXBkjMDvS+zXcrFL2inMrwn0S5MTjF/gb4pfz1ba4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cou61oFA9zOdEOzhSj3qutRyEv13e+cX63s8qkWjMg8=;
 b=l4EdNzKPUJuSN+Ie575eSR2OyqNlG+Q80F0YEZP9YKLGOw0LhWoAAvhjprQR7ZaHrRQ9QZryHZDLrXZrnaRzEoQXKBpR2te2tMfOha0Jx2ODx90BEs3SBvwJXfvUcCbaBOz+aeDomVwisIieqTo3shJpIoLbz77Sehql40GTKtE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB10642.eurprd08.prod.outlook.com (2603:10a6:150:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Thu, 15 Feb
 2024 16:27:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 16:27:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jonathan@joggee.fr" <jonathan@joggee.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 3/3] cups: use LOCALE_PATHS to split
 localized HTML templates
Thread-Topic: [OE-core] [PATCH v4 3/3] cups: use LOCALE_PATHS to split
 localized HTML templates
Thread-Index: AQHaXcLfOuvM83f6XUGSTzfVqncSV7ELnCcA
Date: Thu, 15 Feb 2024 16:27:26 +0000
Message-ID: <29D5757B-A2B2-4131-B0F7-84210DA0452A@arm.com>
References: <CZ36N8IH1TRF.3LXKZ2C2DTGIN@joggee.fr>
In-Reply-To: <CZ36N8IH1TRF.3LXKZ2C2DTGIN@joggee.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB10642:EE_|DU2PEPF00028D03:EE_|DB5PR08MB10024:EE_
X-MS-Office365-Filtering-Correlation-Id: 057c7f1c-b83c-4d6a-b7d5-08dc2e430496
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 l9Q1eX9Fb/LRFyAXnHGlkI3IFw3y2wWPc9MLUL8FplGjUGR4CcP3ubMJBu2JyP4p5Kq8XkR61W3ktwPwJf7UbdL/CNIU0eEX7aSPVcN7GYIyR6rVLtVsP8IvlynW/3Zec3dxeuYitoEkj2lXzTHGTxuPT24RPU/J+HAYmYxTimvahOhlTiYHZCkBu+N9cGNMRhFjq5D99CkM+9ZLK3lCBnm715ysBMttLKVZ3cKSn42YfbCLCEFUBZe6PfPeyA8AAvmMuX5kZAC3TuIVDZIOyzTI27x1/ITZIjcucUVkVSK8BolpRKOglHUMS1XGORLdoOo2bx1cnL80am7C2zCu7nl1Hxc7426WvCINHePZFb519PybF/XvltQTvq57vuSr5WQt208+I4f3FDWmJTFH2LmnbYOZCrep577F3lXU2yyFSoBDoTyOdGAed4PMPLhioy39Nwcohx6+BimETuWf8shblhBZWFcEOG3ks76Dv3kH9hY8dxRwBmrLXCovoTxqzAr3xJ6+UL0aqp56gbtFYPL6GUyl7FusqpktiIYdZKK8yFKfDQJ/2Beu3LHC2TPxVz9m+e/dlf+Zoy0L51wsnPL+zdhZIgeNMBdHiS9tJer+ZAy3zE5xuFbZMQxaXTyX
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(122000001)(8936002)(64756008)(8676002)(38100700002)(5660300002)(66946007)(83380400001)(2906002)(66556008)(76116006)(4326008)(4744005)(6916009)(71200400001)(66476007)(66446008)(478600001)(2616005)(26005)(6512007)(6506007)(316002)(53546011)(6486002)(38070700009)(41300700001)(86362001)(33656002)(36756003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <10CD1AFFE812794FBB8A7847F2A57FBC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10642
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8e7fd1ce-cc72-4ecc-275a-08dc2e42ff3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/SrJyevi77+k0OktTTIL74b6rs0ltNiwRNnpbF6hD4cp0EMzXJD4Mh0AujhdE42Ker8hwj7WyDQI/220h40l/PnWDIvw98XVhkF/Rn7dswr7OBHE34hcXuEYlmk9FSqcpVIKoHpFZctZ0VhxitqtSzZPScnGIg0Gra/L36k8uUxRtEmAjrio6Rm85PWRdrdlfVP9T4U7sNJZJGz4OGGGUPX/NY8AbGCJaL2vnDOZQI84xlCfG9Vvip+d0GE6IIGuveDsQjjqeDwA5nCVdmyBeNjPYv7+VoPOQVY4ZSAnyjKMbxtEVs7oFAs0Vp9qas9wND6zU4npVpAP4mfqIxrvrotYDQsHJNzGQv2DAt4mspb+kIOx6QjbK0VeQ3VKygBYZmIhB+YQEA53qT5hcp/a+Omt8fAKdJQv91JwG+MUB77cnbPxLm/SBxOMyO7pHI5WhyA8Ty4/mYj77hDk/DmojHf04QSQEbPV4FPf5p8zWiK8d5SjWUdtr6rzsCmS3LvXKBfmYbpKdpD7B9FD3o6lnGxlYdWlCxo3ijCtjIgPaxiVjjWdIdUZ/dkAKXHh+llXdLMIC7NkZIQ2Ar2JOXzqXQziiALzYWHN7nVP6odZGw9lDGCnpeZc9PV2DwRE6B7ya2XNqf4V/UDDpJKYN1oxwnmcrIiI0EksNdKC4FGBiV0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(82310400011)(451199024)(186009)(36860700004)(64100799003)(1800799012)(46966006)(4744005)(2906002)(5660300002)(83380400001)(336012)(26005)(2616005)(8676002)(4326008)(70586007)(8936002)(70206006)(316002)(6862004)(41300700001)(33656002)(478600001)(6512007)(6486002)(53546011)(6506007)(356005)(81166007)(86362001)(82740400003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 16:27:35.4440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 057c7f1c-b83c-4d6a-b7d5-08dc2e430496
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195543

T24gNiBEZWMgMjAyMywgYXQgMTY6MDYsIEpvbmF0aGFuIEdVSUxMT1QgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGpvbmF0aGFuPWpvZ2dlZS5mckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gK0xPQ0FMRV9QQVRIUyArPSAiJHtkYXRhZGlyfS9jdXBzL3RlbXBsYXRlc+KAnQ0K
DQpUaGlzIGRvZXNu4oCZdCBxdWl0ZSBkbyB3aGF0IHlvdSBleHBlY3QuIExpc3RpbmcgdGhlIHBh
Y2thZ2VzIGdlbmVyYXRlZCBieSBjdXBzIEkgc2VlOg0KDQpjdXBzLWxvY2FsZS1kYToNCiAgICAg
ICAgL3Vzci9zaGFyZS9jdXBzL3RlbXBsYXRlcy9kYS9hZGQtY2xhc3MudG1wbA0KICAgICAgICAv
dXNyL3NoYXJlL2N1cHMvdGVtcGxhdGVzL2RhL2FkZC1wcmludGVyLnRtcGwNCiAgICAgICAgL3Vz
ci9zaGFyZS9jdXBzL3RlbXBsYXRlcy9kYS9hZG1pbi50bXBsDQoNCldoaWNoIGlzIGdvb2QuICAg
QnV0IEkgYWxzbyBzZWU6DQoNCmN1cHMtbG9jYWxlLWFkZC1jbGFzcy50bXBsOg0KICAgICAgICAv
dXNyL3NoYXJlL2N1cHMvdGVtcGxhdGVzL2FkZC1jbGFzcy50bXBsDQpjdXBzLWxvY2FsZS1hZGQt
cHJpbnRlci50bXBsOg0KICAgICAgICAvdXNyL3NoYXJlL2N1cHMvdGVtcGxhdGVzL2FkZC1wcmlu
dGVyLnRtcGwNCmN1cHMtbG9jYWxlLWFkbWluLnRtcGw6DQogICAgICAgIC91c3Ivc2hhcmUvY3Vw
cy90ZW1wbGF0ZXMvYWRtaW4udG1wbA0KDQpUaGF0IGRvZXNu4oCZdCBsb29rIHJpZ2h0IQ0KDQpS
b3Nz

