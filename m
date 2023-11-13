Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB6EC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 13:55:39 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.51])
 by mx.groups.io with SMTP id smtpd.web10.37086.1699883734842351082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 05:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=itjbwyXK;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=itjbwyXK;
 spf=pass (domain: arm.com, ip: 40.107.14.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nIR181A92NV0F6ta5zkEd/DbPpkvQ2Fxo2mk1LWDHBS/CTngmTQC2fgHrGxRIfnUP5KHV5lyDJ87hS1ik+T2FWHvccRkGx87jjfmHpkBpM6hBShi+nbPQz0JvVK4/7qvM7vB9zitJ/3j5yrt/kHmDAWJ25yrsRQA6+elDELz5OP0GvRGUO7F1NA5WzvsIjbyrqNwk/vFvbz4XKGUGzvv4G18cb4gaMy6Yv35a/zdtCLPSb026qLEFSUFQflOTk+28puBUe9++F69Az+F+1m/w1poDEArxugUwtbiPLYhTHMa2AKX8x7lXNSNa4ZwNbXaAgwaSMHAm6h1+LuPMisdOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6H26Aa6Ax+odfL3Oql8Xvj1R1KKtWs6Jc9QwjejMBE=;
 b=J/NM4u3JSpY0Whfq2YL9ER8S9NZeXaVsoxedbIVPuqsonRp9ocjxqi6D+r/Kj1r08+eMgwVdEJbAeAkKm+RyOOxAAJAx+Q4ilV0+I9hRepvUUM3cnRT27AoAaVWghk5OFq8mL7tQI+y5bOsQ7xT3a1+BAOmFfIxdvDfFl9H0VF6upklA8fhnB3L1EIFUJE1a8waJs8lANoTW6kHbfUX5FnfJLQUupRGOFdHLdA/rIEI7/7al/Fd7WloOHxUY4FP3RCUt47RaKMGOIjwUuqn9CjhrPIr46JrAWAUxsYrfGVKVWG0zRrK6a87RTtBiCLO/8pW9x6iUuntIe8YWr3pj3w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6H26Aa6Ax+odfL3Oql8Xvj1R1KKtWs6Jc9QwjejMBE=;
 b=itjbwyXKu3t+1VIgTGUxqtEIey23Yx8N+q4hylBouPijUcCCvrzVPkVDDCMhYR5Egrv3ubBu6o2M6Kd/D/YSYAudjUqP0q7YWBJyPbtnHIJYfXbzy9A+bCIxOOW8+WyiTbUqueyFAIv7Tc0zbtUv/HSuWBPR/HwCe33LNO/hBn4=
Received: from DUZPR01CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::15) by AM9PR08MB6146.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 13:55:30 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::e5) by DUZPR01CA0077.outlook.office365.com
 (2603:10a6:10:46a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Mon, 13 Nov 2023 13:55:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.14 via Frontend Transport; Mon, 13 Nov 2023 13:55:30 +0000
Received: ("Tessian outbound 26ee1d40577c:v228"); Mon, 13 Nov 2023 13:55:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d6b95d7d53062ee5
X-CR-MTA-TID: 64aa7808
Received: from 9f96913b5381.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4A669219-324B-40C7-BBE3-BA8DC1273DCD.1;
	Mon, 13 Nov 2023 13:55:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f96913b5381.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Nov 2023 13:55:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqdQIbnDBkPuDyyDY6TmWM3+cvPOlsNpE2wXQKfS1cO3AdujQyUTZnsxiQfezutHe5WGRQb88akMN93xoViBayHIZSlmkEqFDXWbmbyRYhsc+62KKnOLBdSNYu8RpWXA/wQBvoi4adxejDLmFHdZGybH/OwsYAzJ3umYV7MAhD8cRt14qdoe8/RVhKBRODalPMk0LPVmwOM+a8Tn4lpvXyUf5NwY4upHdxSTBvMW0MZaOSeZlcKgYyZpjb/BlNHsZj9wVzl4RZhEs/RQSuadtLRPtpNlYW+4i/KlqKp/wKl3y8zdeNgBTMGZBIpQ8TKMJ8BK3laGoZR8+Mi50DDmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6H26Aa6Ax+odfL3Oql8Xvj1R1KKtWs6Jc9QwjejMBE=;
 b=NU7jS0Wungq2g9IflMxkVA8U3bbue8tun8Wn61X6UtvY3bJ3t+gs4Cquk/TlTcyEc77TqgpCb1cJJsYEbY/TFPGmHxXkPfzyU3IxS9ctKOBj59/l3USlEW3HSBjiAXPGU6SuW1t5tjkXk9Fslfq6oLYf+PMuT9oagYi9w9gzE0S479N/WlqDpwiNC/fEiYW8voqvspMTRRVr/DhM1D6wgfTd+YwX7PGET/pX2cgk0iRn2R1MFWbJs7CHJ/9SeREHv1MtiiPWFbs7c3iIV5jmGxSyy0ATySTOs6L9uqdLXkL8S/Dx6jD/v6/I/2WRKyt3NjBaj93edB5kz9Al6Le+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6H26Aa6Ax+odfL3Oql8Xvj1R1KKtWs6Jc9QwjejMBE=;
 b=itjbwyXKu3t+1VIgTGUxqtEIey23Yx8N+q4hylBouPijUcCCvrzVPkVDDCMhYR5Egrv3ubBu6o2M6Kd/D/YSYAudjUqP0q7YWBJyPbtnHIJYfXbzy9A+bCIxOOW8+WyiTbUqueyFAIv7Tc0zbtUv/HSuWBPR/HwCe33LNO/hBn4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9705.eurprd08.prod.outlook.com (2603:10a6:10:45c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 13:55:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 13:55:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 12 Nov 2023
 01:00:01 AM HST
Thread-Topic: [OE-core] OE-core CVE metrics for master on Sun 12 Nov 2023
 01:00:01 AM HST
Thread-Index: AQHaFVnj4A/oJjwkb0KgoDbzIWaDnLB4R1YA
Date: Mon, 13 Nov 2023 13:55:22 +0000
Message-ID: <9D1D1B81-57FE-46DF-A761-A97F979A31BA@arm.com>
References: <20231112111736.36F751069F8@builder.sakoman.com>
In-Reply-To: <20231112111736.36F751069F8@builder.sakoman.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9705:EE_|DU2PEPF0001E9C6:EE_|AM9PR08MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c84955c-4a11-428d-1568-08dbe45032da
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9PGnYXgHP8XSF/c0H+fB9xLzaT7xZrFVDjxVFJXmcDIftFQ/wR6kRMXRAXK9vSonem6I+on/hzQYCmw41B+IFcuFyIGi+OPYHmtMqPvB8u0VMgmkKIl17YSFz681SjXCyyMpbpHWORiOpuk/iKi15G1S6HfuD7i/uR3yKkg8BdICPxAq/rSdpBAnpUoUO7Cr0H6EFK/gqdZkcjoiO4dwd5AdAzTqsQv70PjUhb0Vr/b//94ppqz/awOsrADOvdS9XcdYCsyxyAvTWS711K6o+g5g+u+gqAi1IupTY4TlEjIyVcaLXENbeIhs+wMfVifwe+zL1l8n8IBq5eXcL3cDKmVq73E4RYlsfeK9P8F5RTvlSvmVvrelnL3SFsFcagPQqguPllpE6omjcdIrgBTnaLq2I/oeo4Mv5F/3viI45eZeDPdYaCL7eFQL1++X/SgJEzADpOCnkwH3A1kBvoE6hAMn3QdU6lE7HE7AYY217v5ARp4l7XQocavrroFrJE4lS91dZDTVmSgOaZ7EvpP6GfPMhiReUdfxadoWyYYVJ75P2ssgvq+aJw685YAkt8ADmKumFc4U1/jropwZfQb8fm2WaT3ZjNpn9cvRFFHVSNejc/DuREclMLDsVUzczdAh
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(346002)(376002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38070700009)(2906002)(71200400001)(2616005)(5660300002)(86362001)(41300700001)(33656002)(26005)(91956017)(66446008)(66556008)(66946007)(6512007)(76116006)(66476007)(6916009)(316002)(38100700002)(83380400001)(64756008)(966005)(36756003)(478600001)(122000001)(6486002)(53546011)(6506007)(8676002)(4326008)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1457DD2611BB3F45BC4E686C67A59924@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9705
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	494b5f77-a4b0-4743-a824-08dbe4502e2e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Up6TQaA2Iw+s49iN55d59rFBJB7x7g8PgyIOqmCAGIolF1X21nh07vWKzGQ9BOCIyYywQ8jZ+27GJLwpdkgJsRR1GgPlgE5kKBUx3WFxkCVlTBKuyGrwZ+TDea6qNRhq4vCfum1u1ohPcP5VGrYeYLL/08XcZsx7aZRT/bPiPLK0BbRF4UAgsJFc7A3NEsvZ3el6YYREHKiurRxecuryXDv+sz1eYmOYJaryCOQe8x9ye052a7GCJYnrSAI9RIDpc8qIx4dSHV/u7C0imKOgL48sNCYX+qkAxwB5zmw+zX6pNeYv1Zw54PUNCVYxyZprAi6JW2EhRpSGts8LVmhw6iojx2ra9TDOSvWrhYSt0wFRiqXVp+N3rxfEUxs1BrcmE1F/FI3oM/RhcGPr6VUk/gJVdCQMr2h45mS1TO0Q16ZPpCmVvNXthdEvqieGoCPq+v7O54FpleMNIAAqrOiBn4UtL3q8kafhfwxtaHAIQzuh4sIeI/xJrxZ07In3ws/nQ8VH+STy+RtZVEMKb/FGf595bKkFOP8igE6JGr/QHSeuEgUM8urZXuYCV1EDwr46hluEPckpeAffZizCHZKiW33lrANzIlLexWpJPYi7YcvuI5ymrllkwTTRJifpZInMuOD5DkW4tzKoQyRG4Kapu7sofgSAwlDGdV17g+UrKi2nud8ifsgsvwuEV+tmka2RJ2wJov+j9Uh368fOq/5RXs7OXc+abAMl+OBEpcJIRHU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(40460700003)(4326008)(6862004)(8676002)(8936002)(26005)(2906002)(36860700001)(5660300002)(2616005)(86362001)(82740400003)(356005)(6506007)(53546011)(336012)(47076005)(33656002)(966005)(6486002)(81166007)(36756003)(478600001)(41300700001)(83380400001)(40480700001)(316002)(6512007)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:55:30.4726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c84955c-4a11-428d-1568-08dbe45032da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 13:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190469

T24gMTIgTm92IDIwMjMsIGF0IDExOjE3LCBTdGV2ZSBTYWtvbWFuIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxzdGV2ZT1zYWtvbWFuLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gTmV3IHRoaXMgd2VlazogOCBDVkVzDQoNClN1Y2ggZnVuIQ0KDQpJIGRpZCBzb21lIHJl
c2VhcmNoIGFuZCBoYXZlIGluY2x1ZGVkIG15IG5vdGVzIGJlbG93LiAgRG8gd2UgaGF2ZSBhbnkg
dm9sdW50ZWVycyBmb3IgdGhlIGF2YWhpIHBhdGNoYm9tYj8NCg0KPiBDVkUtMjAyMy0zMzk3IChD
VlNTMzogNi4zIE1FRElVTSk6IGxpbnV4LXlvY3RvIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92
aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy0zMzk3ICoNCg0KTklTVCBsaW5rIHRvIGEg
4oCccGF0Y2jigJ0gd2hpY2ggd2FzIHByb21wdGVkIHJlamVjdGVkLiAgSSBkb27igJl0IGJlbGll
dmUgd2UgZW5hYmxlIEpGUyBzbyB3ZSBjb3VsZCBsaWtlbHkgZXhjbHVkZSB0aGlzLg0KDQo+IENW
RS0yMDIzLTM4NDY5IChDVlNTMzogNS41IE1FRElVTSk6IGF2YWhpIGh0dHBzOi8vd2ViLm52ZC5u
aXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy0zODQ2OSAqDQoNCklzc3Vl
IGxhdGhpYXQvYXZhaGkjNDU1LCBmaXhlZCB3aXRoIGxhdGhpYXQvYXZhaGkgUFIjNTAwIGEzMzdh
MS4NCg0KPiBDVkUtMjAyMy0zODQ3MCAoQ1ZTUzM6IDUuNSBNRURJVU0pOiBhdmFoaSBodHRwczov
L3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtMzg0NzAg
Kg0KDQpJc3N1ZSBsYXRoaWF0L2F2YWhpIzQ1NCwgZml4ZWQgd2l0aCBsYXRoaWF0L2F2YWhpIC0g
OTRjYjY0Lg0KDQo+IENWRS0yMDIzLTM4NDcxIChDVlNTMzogNS41IE1FRElVTSk6IGF2YWhpIGh0
dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy0z
ODQ3MSAqDQoNCklzc3VlIGxhdGhpYXQvYXZhaGkjNDUzIGZpeGVkIHdpdGggbGF0aGlhdC9hdmFo
aSBQUiM0OTQgZDQ4NmJjLg0KDQo+IENWRS0yMDIzLTM4NDcyIChDVlNTMzogNS41IE1FRElVTSk6
IGF2YWhpIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1D
VkUtMjAyMy0zODQ3MiAqDQoNCklzc3VlIGxhdGhpYXQvYXZhaGkjNDUyIGZpeGVkIHdpdGggbGF0
aGlhdC9hdmFoaSBQUiM0OTAgZDg4NmRjLg0KDQo+IENWRS0yMDIzLTM4NDczIChDVlNTMzogNS41
IE1FRElVTSk6IGF2YWhpIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWls
P3Z1bG5JZD1DVkUtMjAyMy0zODQ3MyAqDQoNCklzc3VlIGxhdGhpYXQvYXZhaGkjNDUxIGZpeGVk
IHdpdGggbGF0aGlhdC9hdmFoaSBQUiM0ODYgNWVkYzE3Lg0KDQo+IENWRS0yMDIzLTQ2MjQ2IChD
VlNTMzogNS41IE1FRElVTSk6IHZpbSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxu
L2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtNDYyNDYgKg0KDQpGaXggaW4gdmltL3ZpbSAtIDkxOThj
MS4NCg0KPiBDVkUtMjAyMy00NjQwNyAoQ1ZTUzM6IDUuNSBNRURJVU0pOiBmZm1wZWcgaHR0cHM6
Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIzLTQ2NDA3
ICoNCg0KRml4IGluIEZGbXBlZy9GRm1wZWcgLSBiZjgxNDMuIFRoaXMgaXMgcGFydCBvZiB0aGUg
Ni4xIHJlbGVhc2Ugc28gdXBncmFkaW5nIGZmbXBlZyB3aWxsIG1ha2UgdGhhdCBnbyBhd2F5Lg0K
DQpSb3Nz

