Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F64C433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 10:37:28 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.84])
 by mx.groups.io with SMTP id smtpd.web10.4089.1664534243793875201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 03:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=hIvnL0yL;
 spf=pass (domain: arm.com, ip: 40.107.8.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aDIN3acTc4andYC4ZWZxlIHjIf7eVnCrL32xBT0ciQDDvpE4OZgrziF7AI8qUiKNbSpLXz5Taac0HufWBF1w8IxtfbI62bPecRYNTFypfeo8Bg0juiIo96PPkJY7UDwFMI/WhY9tNfO3T7YJetQaqzHspjOC65W8OvhNFEL+OUp7Nl0I8h054S/75/f0nzJs4Qg8g/09IDQ/uIHyN5UL2N3HRERk+7b/JLTmMlM+aag9Ejf1Wq7uweMBGsiF7/z+o2m0eMBDZvuAxvHqBS1iCf9W0PcQf2q/PLtia6/hjTExiwp0iGY7M3qQsLz6cCKCdVFrmiMefFQET/y7pNF64A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4nuMmKogpvcm68+Xnu4zkLYOdZF0sQVTH+xwYm1N0I=;
 b=MOGHUVIbrnsGAFFGvu+EyUxmA3F28MbXUoSPVcW+LJDN7Wswc6gMvJl9gnmG135OwSfpUuc1Y2s08ycHrGfix/fvLb+S4S9F5xBnfEoOEnueNOd/vo8qs5640j+wDr+jWTH7v+/RhY+ReDjH6sHvE55c8T8CiFgp2oLXt/Rtaw8jUYrmdX120PkSSuKe3NUOLFMEGxAFXy8LLzX8y3PT7hhmN/qqZigCAxsGmGP/WaxTaIgXgrX4TkU+sk1XmBIFbsz+qbiviNpWP5pAC1M2VhOMMh/sySkhaRP7aM5XXe0VYReqmK9thWv2FSx2OAp8npVVhKSVrF9ILeUPvadONg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4nuMmKogpvcm68+Xnu4zkLYOdZF0sQVTH+xwYm1N0I=;
 b=hIvnL0yLy4J8hcfWwdv+murln88XjPY4BPnfBqFuh1p8oM/0P9Dpz0AY/FaIC4JokXK/QVml0IQkVEyvrQk/lcDq+fNKZ2V/5Mrntn9WEtrirC9eXILu6JCBQk//UriH3ZBdmrQgIrzUG/s90AIafig86uCAliza0jmQ9DEijO8=
Received: from AS9PR06CA0711.eurprd06.prod.outlook.com (2603:10a6:20b:49f::19)
 by PAXPR08MB6493.eurprd08.prod.outlook.com (2603:10a6:102:15a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 10:37:13 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49f:cafe::74) by AS9PR06CA0711.outlook.office365.com
 (2603:10a6:20b:49f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 10:37:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 10:37:13 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Fri, 30 Sep 2022 10:37:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8094d729f3eaf367
X-CR-MTA-TID: 64aa7808
Received: from 320e4689b524.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DE43786-E837-4618-A844-EB957F142B91.1;
	Fri, 30 Sep 2022 10:37:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 320e4689b524.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Sep 2022 10:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUPlrnkaZPuZN7YMzJDNnXkNbJSt2vtKnxNu4M0reiDeBSd8fR7zfUpTTraKPtBd93trAv3IzJ9ulRxjMMqmutL7s72hsoCc1waQdFvaVFkDjnqwt1/LXv7Qc4wNwFteJk6Q0+8Wz7pd4f5yMwh7kdXDpiHgAb2XqZpcB0agz0XuxtLUNo2HS601Q88dLUeyASHHcVgrD0ma6UmLZsGSM+UXvdEgpZQchCM7AdhlFTIyyyA9XSmWPAx+cBBSIBI5eBe1wtKiAIvjVj19Ki7HouYMJs2gmAa/weZAE6qLNMZ9WaF7C6a91yNJlEVkVtKUYVWcCjdY6azfR2cWD3uDLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4nuMmKogpvcm68+Xnu4zkLYOdZF0sQVTH+xwYm1N0I=;
 b=G2rdhJmEx5JV3TsqjksZReY2dGgL77NuUfjEwWj+wIfRjvIT5P+Rq6pw+ev3m2xVJGmFZBrjNjNhY7PlMXxg4t9UEADUUykV0fyH3jBV1LFKuc4+nxoij9pl9rL4ZajIC6HcAGNtf8EWaEQvQadUM0ljlroPbvGEoMD1EpzDHaMRjyOwIZ5OtvAcrQsPciVIqK2QFi+s/ZNCCy1WXbEko8QIxAbMwnjBISKoUDuvaMk3udaTxwtlpLqdov6/0NdNm8V7MhIa4YNDjQWPe2EjrfoUFBQcz6Z44kMjMvGDWNV+YYAskU9dV55YiFBSemL8ZcvisCFIL0VibE9/jfFoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4nuMmKogpvcm68+Xnu4zkLYOdZF0sQVTH+xwYm1N0I=;
 b=hIvnL0yLy4J8hcfWwdv+murln88XjPY4BPnfBqFuh1p8oM/0P9Dpz0AY/FaIC4JokXK/QVml0IQkVEyvrQk/lcDq+fNKZ2V/5Mrntn9WEtrirC9eXILu6JCBQk//UriH3ZBdmrQgIrzUG/s90AIafig86uCAliza0jmQ9DEijO8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7937.eurprd08.prod.outlook.com (2603:10a6:150:8e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 10:37:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 10:37:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
Thread-Topic: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
Thread-Index: AQHY1INuHCxkyMIu9UeLDtUzW8mrR633wj6AgAAF44A=
Date: Fri, 30 Sep 2022 10:37:04 +0000
Message-ID: <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
In-Reply-To: <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7937:EE_|AM7EUR03FT025:EE_|PAXPR08MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: c01aed6c-e01a-4fa2-7d17-08daa2cfbc87
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xw60OsDIYlNY3LFavVu+1DmxY3lYU9aiThcGC3oxhk+Vydq3woy+PjQ2at6IaTPK/x72joaL+NYbFxJxprxb+5Mxlf3Jca7oMPwoO829704OpWJIZEisl1bX9Spu1Q9T+BcO1l5r267ht0OMieH4+fIwhDjgpAvGqRvkCqpPV117o3q2mEFd6q7p1CwAz90jsiKW600yBRa6AURGgnrIvZFI/c90yp7CVDt3djHLEOLfTxqQTAPnpbHIuprSsenBwkdOpv5rzM9O30bidMSzt7hnDNhIlGg3Ru6LpqwU28PMPpXFGqrTiWzodbzVod/ZRIp5Kgx5Q0nbVKklEQ0HmIg2tVLBAO9/DtIZuHoKto36xQbOfC0WrVg9f+f+BZpOK7KO9mz81LWOn287eHfXwK3s5poYEVmpWljkLkLQ5zaNNjTHXbIttOEhiZDlN7XEpuVppCpYXyR95lo4IPcgYvxXx96bln/qp4Tgs2vO59z6lnm8X/6Ni2TS6d7N+Px8L8IY3/xtRgb/rPJnTPEaMUeb+PztWctDo7C5G639PYk6yrzyqJi15qgoq4IYWIVJEcAhK3LPtaKNZAt8MvaZ9OL2WZ20Gnv4xi3c0ULo2nnc4zmRqK+Ji4VRmVxITnzEhgYThf7VRz5vFB8xvQvFREuCWolzOhq6BWw0IZrtjuoKsJYd+S/zmmJnIdbTXWbZviU8z6V05CcwbKoeiB+VvJdMmkELeO59j4K1IemEJtai3ztvD2r990OhwV6adHhPMnlqdBNbrgiqeOcFdqMP9o13BlS8x55G2RLDCOaJYi8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199015)(478600001)(38100700002)(122000001)(6486002)(86362001)(5660300002)(41300700001)(2906002)(316002)(8936002)(53546011)(33656002)(36756003)(26005)(6512007)(71200400001)(6916009)(6506007)(4744005)(186003)(2616005)(76116006)(64756008)(8676002)(66946007)(66446008)(66476007)(38070700005)(66556008)(4326008)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB8D02B1DD3FC642B498DCCA33A244BA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7937
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ee611369-d8fb-421e-47b7-08daa2cfb746
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CAyydgyGIOUc6tVhTicBMNpR3heKIY6Ol+GeBmu79OrRjpynIELo9QWTKOthpcbOq5MfZ0EH8l8wS5dsTTKujKw+nkTB/DxM78Owbj472z34yc7nm5S+rvYCM1eMGVDr643GyDZJ47/43WLYpBlGUbb9Ck48T2BWiuUz6Yg0Hzh0Y+YOzgaLJ8eUTK1jtei1pBHsk5bgH2nHaSz5xgQD0HWk8r9GjrnS0i9QIEjRFbHgD+H7XQVsEeXmpvumkCuyEX+J8IJWcPzf1wedQaWRNDXEkUzlBT4Zjyzc3YWNQ1saq5k2St5Dd6cFP6GnpW3Ujc9S4mEMa3fLURD4rqcy8SknU84ltpcnFE1Phv9kwqjh7WVJebWgj37bR4rFc7YIbncYSq4Su3Md8tsDT9KPzkde9TZsBdpuNHZj8ZJevC5kSAgXoV+bJuIJouT5jrj39Xqf9H9CY+vzrpCNESpdEDsLr8JUYk9Mv23dbJyjeOiPVNzuVgeBAW4UsCArHvzbHBsCRRTYnBZTcHaTeFybZDXLrpBQWcFv1eEPid0frGJaakyl1dG/CDhn1CMDs3d2u+kPQb6CEP48jf/lrfaTvZ1tGPZDJmLxrU4pNakzLBpS3ALm3NKHqMlcsxeBZdcwkWOPuF8GHYPqK81rWY1NUJq7ImexqeFD+Dgcsl2i+ntDeppGfhXpKk+FFC7O5i9/J6WENIsU7qjLgjtLLxSghyGMnWDg/a4Uod7Y0KJkmf/cJydrxzamn4upoxfsVnCYP5OYGmSyR8/Ka1JaZ/q1Kw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(36756003)(40480700001)(36860700001)(82740400003)(356005)(81166007)(40460700003)(33656002)(70586007)(70206006)(86362001)(8676002)(4326008)(6862004)(41300700001)(316002)(2906002)(336012)(8936002)(4744005)(5660300002)(82310400005)(47076005)(186003)(2616005)(478600001)(6486002)(6512007)(26005)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:37:13.0647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c01aed6c-e01a-4fa2-7d17-08daa2cfbc87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 10:37:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171219

DQoNCj4gT24gMzAgU2VwIDIwMjIsIGF0IDExOjE2LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IE9uIDMwIFNlcCAyMDIyLCBhdCAwNToxNiwgS2hlbSBSYWogdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJhai5raGVtPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4+IC1SREVQRU5EUzoke1BOfS1wdGVzdCArPSAib3BlbnNzbC1iaW4g
cGVybCBwZXJsLW1vZHVsZXMgYmFzaCBzZWQiDQo+PiArUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0g
ImJhc2ggc2VkIG9wZW5zc2wtYmluIFwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgcGVy
bCBwZXJsLW1vZHVsZXMgXA0KPiANCj4gSSB0aG91Z2h0IHRoZSBwb2ludCBvZiBwZXJsLW1vZHVs
ZXMgd2FzIHRvIGRlcGVuZCBvbiB0aGUgZW50aXJlIHN0YW5kYXJkIGxpYnJhcnksIHNvIGlzbuKA
mXQgdGhpcyBhIGJ1ZyBpbiBwZXJsLW1vZHVsZXM/DQoNCk15IHBlcmwtbW9kdWxlcyBSUkVDT01N
RU5EUyBvbiwgZWcsIHBlcmwtbW9kdWxlLXRhcC1wYXJzZXIuDQoNCkFyZSB5b3UgYnVpbGRpbmcg
YW4gaW1hZ2Ugd2l0aCByZWNvbW1lbmRhdGlvbnMgdHVybmVkIG9mZj8NCg0KUm9zcw==

