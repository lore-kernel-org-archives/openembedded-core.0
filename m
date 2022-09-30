Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E240C433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 10:16:18 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.43])
 by mx.groups.io with SMTP id smtpd.web11.3995.1664532973442282222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 03:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=3szLASkN;
 spf=pass (domain: arm.com, ip: 40.107.2.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Giq+IULrc1danIqn7pRkuVd8unUiCAR27gdNC+g+iOafawVEAQId78iowg3M0zph8nTQklm81Da4QZxzjLt4ldtKcd1SrxGKmz9CvT0W6nwwLPgHQJ5yKs4gJt0Kj+qcH0V9RaHAvuT1VIPkKzE5cU9ebMMrl/KSNfcFu3pIWCINLCKZ2Nm1FVsAtSdatknagjiBF1SYYeM1NBW7/uhoMVxqkKRlgB3gl1MHBLTpPwT7RAF/MlTwUGge+HPfOs0RlVEddCR2kFbuyY4QKCKswqLp+IAnzeu8649ZXvccaNJoCP266W32suKXNzqray+F8BIgQT7ZinzDg2yhFOXnDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lP403nDc+XmFrd6fZPIRDoIaNWm+24Xdu7op/u1OAzw=;
 b=Go3Qr01aTSFJtpidw7gA7edULuS2TSSk9WwXIBLiAcUujw8afm6wzsnDnqDK3/Lxm9IwgrdiuYKUtQLTtZueebvOKUQ+fqCAL23HbSAgPlfydxVUJaiQYyhu/Ae2W9ra4wrAYOU4z1wKeZrABwAiDhOOWgVpq5MN3nX+bnUr+X9iFq5u+6maW9bCG3BdRst9hakTJHh2x+RanX6k3bb82oLKSdzdoixUeOg0CqKMMP2ULhaBWY9edOShKMa/mtJ/DjYwGvTLGF/PrSrJH/xlqCtOo1GA4yAluLN6BgwTyPl0aas5AxosN5zR/Lh3K3h5uRlGT4sXyoPVjS7QiNXxYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP403nDc+XmFrd6fZPIRDoIaNWm+24Xdu7op/u1OAzw=;
 b=3szLASkNXTdnKS89tc3BcsRr7npsQ/GQLhIRYA6bwGcYrX9GWvW1LbCEQ+R47N7iulOAbUaTMK6wRRaCQ2LLP+f0hmaKZWWpQFaqwaT5kMCSgFbY8DHCd9dAUye5jHNdfM+wzmUDUGV3bxiqNtcgF34TXE5LpIGsDQBBsQf0ICQ=
Received: from DB7PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:10:36::41)
 by DB4PR08MB9862.eurprd08.prod.outlook.com (2603:10a6:10:3f1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 10:16:09 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::5d) by DB7PR05CA0028.outlook.office365.com
 (2603:10a6:10:36::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 10:16:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 10:16:09 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Fri, 30 Sep 2022 10:16:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3bb16d95a0bf07c0
X-CR-MTA-TID: 64aa7808
Received: from 975578a1f408.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B708FDEA-70DF-4C2C-B615-F66C02D59F1E.1;
	Fri, 30 Sep 2022 10:16:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 975578a1f408.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Sep 2022 10:16:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcLtjNROG4ROf/o5W9VcatlIt9wVHyr00Xqdm+hARua+dWgJGgXM5/GoixhGO8ZDkyiy0uRua8icNihDWELWmoJ+nAMX6rRuVJNPRa+hR1nlhXh8zzhljcitKDriIKs4UtMVpIO7V9fh3MJndrZCCMn0Ce8dJISquPP48lKjXgipp7BeD5Y7PRYISFaXvucER6GaRbT13VzTC5miCtUf/Npz3UrLwDsQpaONDfiKEsXmTIJKifVWEohpgSKV7YtxC66rwx2j+o0ZqEX1c09QQxjyYFIm0PUtQhO6oEmCLJDoOdTn8LZUttM/3njM6z/fvW4GdPnpia88ylKPknAZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lP403nDc+XmFrd6fZPIRDoIaNWm+24Xdu7op/u1OAzw=;
 b=Qy1vOmZ5+JI0bWmIBRmpz40R2PGa9ur/Mb9NTlZfkpZ5shBIdL5A1MB7VEdodQmtwc4AowRDhQVSbIqJkslWYG1/skjfRysguE+IArj2pHuc5TC4C8rqU5diLXu88UefX2Hr57xndWagJWi5lQXH2UEAXhXMq0HO8Lnz/eBeIPqkAgIGVEIcUolLsawUgG0VgXsyj76L4vszlfI3Eh+e6ssijMpJrxfF61oWNXEez7WFRmj4ogZbYW/Tcv5QCuKaaRU52amLlkETMUQ6fnis43jHzc1m8kRG0ReBU43/NLfQr8ig/FSnzn8C12UJ+184NF0K3A9tVgDMsnaE1PO3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP403nDc+XmFrd6fZPIRDoIaNWm+24Xdu7op/u1OAzw=;
 b=3szLASkNXTdnKS89tc3BcsRr7npsQ/GQLhIRYA6bwGcYrX9GWvW1LbCEQ+R47N7iulOAbUaTMK6wRRaCQ2LLP+f0hmaKZWWpQFaqwaT5kMCSgFbY8DHCd9dAUye5jHNdfM+wzmUDUGV3bxiqNtcgF34TXE5LpIGsDQBBsQf0ICQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB8992.eurprd08.prod.outlook.com (2603:10a6:102:325::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Fri, 30 Sep
 2022 10:16:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 10:16:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
Thread-Topic: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
Thread-Index: AQHY1INuHCxkyMIu9UeLDtUzW8mrR633wj6A
Date: Fri, 30 Sep 2022 10:16:00 +0000
Message-ID: <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
References: <20220930041614.2704304-1-raj.khem@gmail.com>
In-Reply-To: <20220930041614.2704304-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB8992:EE_|DBAEUR03FT007:EE_|DB4PR08MB9862:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a6091d-35ed-48ad-ccb9-08daa2cccb67
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EG2yBZl4ZB+B2EZHo4n25F1jiP+crhsrj7H+IqHlMsoE7/wLHIXcwjOqjY5VITidfoTcZCIz82sbJ0vawWMw67TfU3tkQRMHLPlffdniVH9L5ZoACBJbe4h1N4P7iPWkIN1ZbOEpTyTReNNt5HiFykRJE1Chf8q0UqYfyZmjgCqWb8BULPyb8PmazAjPmTym8kiFUej4s2TRcJAGWJnDegUhZ+PhOotHSFTMP1NLjg66NWmiNMMKEb12kibmug4FJirVUKih3vGSCk9YoWhzfJ9jSazV6L9/M94bLtbjVl0hG1oqqUErCZ1NfXYki7HhsmHaTT+gRsG6aDrFk9qozk0uyM5+hdb72MVclPSW47QczWUZxwnoBflSrcL4p2NWRfJJQPad26OpVmkm7WUm88A+A6nEOJXiZvHJnAm1HzeOyc1U7u/DKQeMcSTTDnfxIIRrD7iBA1/d8ETJxoQHadWMBy3nfzewtK5Cax32js2rujacqd6IgZj1+bN3rll6PVbcE9YIzWL8V4tJ0m2BQCDVZtxJh80pfrTWIW5XmWRfavuwpzXQZKu2m9ozRfeCmCkvNZD3uMmyMVaW7RMi5x4QGGajICYHIrxgoQlW0tiaqWKqgjthOfkVYZkDXWCDhZ1FsYgT8reGM7K8wOrrkKFZ53mzbHw1S/M7ReS8vqkojPwjes3B1PPYi9+MPTN5P+75NNVIj8StFTLFAhZLEsordKGnHwqcNsN5DzQlT21zm3gQTPMfu0xJJOhBSyVWl/azEulvgUcQEZn6w619sJdqjlBVq4EZ5damJ1amsyA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(6916009)(86362001)(316002)(8936002)(41300700001)(33656002)(186003)(2616005)(66946007)(4744005)(66556008)(66476007)(64756008)(36756003)(4326008)(91956017)(76116006)(6506007)(53546011)(8676002)(2906002)(5660300002)(66446008)(6512007)(38070700005)(6486002)(122000001)(26005)(478600001)(71200400001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F401F3720BCCA0429C535E1D29D23DE2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8992
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cdaed89e-7318-450d-27a2-08daa2ccc5f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KCt3Y+sckIMIUQI1mHrt+BqYotkHU08Y97evzA7xqqz0niFV775KgHscMbIPl4Az90Xv0r9KNWZzC7BI86RaZWFLd1SeFwVL7xx2F5mqH3HXYaUqbWjN2EWy55IRUnS2tX21JhWXR6PtRX5JCx1sSbrA04yzsJqPSuIZinSDSZiLHwvSIBAgDphElhtjL+dQnq81txmjDI5MNWflQuxA3VsYHcQhNpl8ghjojC7AjBHw/EjNhGK8L4pu1GVohMEmTMiLM2F9nlmkZCibD6n4DuGWrVgkdQlIklv6pDbYS+6RIMSrTsy+T04xJic02NaYqOULwAvV1eP3J2erVdkhJq9ZfTybnkYCHD35TFnYzpWhcAHaKf/j5c6iRlwczuGDze8wmYeye3eOBWOqHEIjMc4ycabgkCeadJ2LZ2wdRK9ZX64mTDC4WAvgukwW7SV/Dz/tFAkpVyDCpA1rIVbR0xLoPyR67qk55Na945xYLDoGrf5RYe8XfukRbIROytV0RTuWzM0H8o1bKaXsV3UeOCi91s5Fd715LfY2T8T2aimmo56K9/sZaI1DiWAOaAGC64Brvea46bL35oRHtK/IuyUTjSPZumW7Q5izQ53RybIc1JGOaGJJAclRHAa1yHqqVauHlkl4YUU8tYfPLYt2TENOqX+sPGdSRHyoZm5hAcW4bZZWl737ro8iArdVNdae8EWNDc3iXTT0PaWAczIkH01jqv70NUAMmsEJzxgpiSeN1ckWCVTI2oJFPsXKowfjn6C4aswl4ZziSYTuIXF+LQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(346002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(86362001)(70586007)(6862004)(70206006)(8936002)(36756003)(33656002)(2906002)(4326008)(41300700001)(4744005)(316002)(82740400003)(8676002)(5660300002)(81166007)(356005)(40460700003)(6486002)(478600001)(186003)(26005)(2616005)(6512007)(336012)(47076005)(6506007)(82310400005)(36860700001)(53546011)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:16:09.5952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b9a6091d-35ed-48ad-ccb9-08daa2cccb67
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9862
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 10:16:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171218

T24gMzAgU2VwIDIwMjIsIGF0IDA1OjE2LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiAtUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gIm9wZW5zc2wtYmluIHBlcmwgcGVybC1tb2R1bGVz
IGJhc2ggc2VkIg0KPiArUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gImJhc2ggc2VkIG9wZW5zc2wt
YmluIFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBwZXJsIHBlcmwtbW9kdWxlcyBcDQoN
CkkgdGhvdWdodCB0aGUgcG9pbnQgb2YgcGVybC1tb2R1bGVzIHdhcyB0byBkZXBlbmQgb24gdGhl
IGVudGlyZSBzdGFuZGFyZCBsaWJyYXJ5LCBzbyBpc27igJl0IHRoaXMgYSBidWcgaW4gcGVybC1t
b2R1bGVzPw0KDQpSb3NzDQoNCg==

