Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF6CC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:13:31 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.52])
 by mx.groups.io with SMTP id smtpd.web10.11645.1667571204787921239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 07:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=pXh5eFy+;
 spf=pass (domain: arm.com, ip: 40.107.104.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CcPLVWQfbC+VMA1HPm2jrYw8T1CVt2y0c8KbSkI2EQe9kXpQO5KjVyfpFY0E7iAKXZq5zxIq+nGpU4p/Zu4KjxsKSvfPSNoDgWAL7U5tn+1nZCMblwBxpfeoPawVxNvkC2dbhw08hncNAfFgCmbBn4D5zhYGGrs9Lu2bvNjZn6Sgsm+kLbQrUX37obctJAXr1cOYx1cHb4lg2TKD0DN+NMXaXeqQD8mbBJUMyF76gbcSAgwJqS93HumRLpEaXCaN57kBL/oAgrgVCLi+u75te9NMrrsdqn4NWFSL1a3bvNOd8bNcBkX4eIPjhsIMnzQnwPCM9OU20YyjpBcEgg4aSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1N3upUP8QxUM3GU2fpDu2Aikuaa+58KYs4DPkchzQhc=;
 b=lQWI0Npp9hZwSEKvxDJ0a5PugG12SHUUy4OnbPIUyr/Wy0p8epflSorNkZsXd5WoYMeWcFgi0D8lmygz6Vjzzy9YLRSyFyousxJHGngm+YiBTREKzmKx7t1eRZHMNaZJLY70GEnpj8m/6WICmwlJ4Qg/OozsDnInHINe2kh4q5utMXHBLBJAclYuhsmc1UPOoL45Et9d5D1XE71WLt64BRLBTDvCeDuXAR2oCsYsT/p0Dey5/tnAWSa5WO9XRoBSGtdAfZSPydlNg9QbY4L8m5pP07p2dVY0HLGC18UkVXyPjC/FSr5axQZDY9xT9TJamWrge3/2cyuC5aJUXQXSkw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N3upUP8QxUM3GU2fpDu2Aikuaa+58KYs4DPkchzQhc=;
 b=pXh5eFy+1m+UUWpw6znHwtj0BlHw3uuR0bzNgAUbY2k1b5BWd5xf6i3kDuhLvpHO1fo6iZj8rQpLrpqasf2L5UPhLafRQuMiWw12th15x+qRKyj0re9yobPqUHjLZ5dnGeJDDMTYThNNJCvOpsoCcQEm3AVi1bvyMA56PIIFgkc=
Received: from FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::20)
 by DU0PR08MB8811.eurprd08.prod.outlook.com (2603:10a6:10:478::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Fri, 4 Nov
 2022 14:13:21 +0000
Received: from VI1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::ff) by FR3P281CA0065.outlook.office365.com
 (2603:10a6:d10:4b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 14:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT029.mail.protection.outlook.com (100.127.145.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 14:13:20 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Fri, 04 Nov 2022 14:13:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a649d73ae5ce11d0
X-CR-MTA-TID: 64aa7808
Received: from abdbd231d0e9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4A934684-E417-46CD-B359-ECA99CF213A1.1;
	Fri, 04 Nov 2022 14:13:13 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id abdbd231d0e9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 04 Nov 2022 14:13:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIC3B7KAlOrVDjdZOpnnCJT6U+6HPi7CQVrqmhAIPz1/yh42eO+tQC8CEFedmyOG8T7IdxUswLs3dbd+HlkftN5aFS1daUOqIW6dhM51ESosdCyYNEs+Ny1ADgQH4eUj277/19o90F8G12eDUl82h0jHJyUllUVhritbFH0XGWHVAQbGvkfU7GaKgwO6S70qx3aosOWXNgKjz+HqT5gEM97v8JSHp5eyOG7kz20cxb1ccc+nuYUfHtdZ4SsIsjqRbBeYQAKqkxdUkr6WJnAuS/NJsUHzToaT/vHFmf2PHU/jlXm/q4+ZBzUJCy9J97gNHKyTVYE7LbN/0KiLT+9uJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1N3upUP8QxUM3GU2fpDu2Aikuaa+58KYs4DPkchzQhc=;
 b=f0DLAOiRq0RR8+7WA5GjQCVAxrkiK1CnP+ci6HKrU44VikhEkYmhxsw392FY3eaFBByDKW4Yd+crKr76pKsVjIglRXDNpH4t3ONfBprKUyARkRAFUIaBz0TeyK1Kqx0DlAidMrb8j0iumQrb6vC1RTSn3BfdUIWBV0aB09IR7P2hXcH4p+lgpdCqzTvCEc0LkKCD+7ag3jpHWtkr9LJfB3GIA0MI6SoDvrtfF0XEIV3zZQqM73pYTPPKgAe6dYr81KkpIKpdzmPFxxXYIUug2RwI0EHOBG0MmalTN3MXI1QGq1l61eWVFAvjS/stHV1vbjMi1YttyGbLsRzLsZkvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N3upUP8QxUM3GU2fpDu2Aikuaa+58KYs4DPkchzQhc=;
 b=pXh5eFy+1m+UUWpw6znHwtj0BlHw3uuR0bzNgAUbY2k1b5BWd5xf6i3kDuhLvpHO1fo6iZj8rQpLrpqasf2L5UPhLafRQuMiWw12th15x+qRKyj0re9yobPqUHjLZ5dnGeJDDMTYThNNJCvOpsoCcQEm3AVi1bvyMA56PIIFgkc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8026.eurprd08.prod.outlook.com (2603:10a6:150:ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 14:13:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%4]) with mapi id 15.20.5813.008; Fri, 4 Nov 2022
 14:13:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "chase.qi@linaro.org" <chase.qi@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] libc-test: add libc testsuite for musl
Thread-Topic: [OE-core] [PATCH v2] libc-test: add libc testsuite for musl
Thread-Index: AQHY8DSONF8zcRzJj0e+NPkjfUwvha4uzq0A
Date: Fri, 4 Nov 2022 14:13:11 +0000
Message-ID: <D6F57683-658C-420A-BE73-78E1E03FE0A0@arm.com>
References: <20221104100140.976337-1-chase.qi@linaro.org>
In-Reply-To: <20221104100140.976337-1-chase.qi@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8026:EE_|VI1EUR03FT029:EE_|DU0PR08MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: d1bb0596-a00b-4c14-8893-08dabe6eba25
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 901XPminS+v9MjDk0DANe0km/w2uZgtMMBXp1DvMptjnvGgDooZa7axYbLhTLF1v/ACmG1IXQCj4cL4zhj+iCfbgc8G+ZSXdKEPMuYjsZ90I4y/HnRBxphx47UEPkDlC7eyBhL88BrO24cQ9EUD9ZSoGhUAsle29hGyMVo6M1Nyj9nUFEC3jlVj9x0ZbIZppbiAmc1e7pJs+QnfZWjFnrSbx3Y8ZWLJbJ99noeI3UT69Cer200esxyiGi8u3cP6RXgMz9KDwOscWnwbk4cRTii9C3heOvtXl/yJSxfCHO2QxFpvcXWJdJrPws4+N6kzzWor3G1T4w4ULZjeQciE/7BQsgvgFlkdtgICqiiUw8JY3zR5ZAahsAJ4enTNb+GdDkKVD96hIuNiY8nxLMK7N4M8SDFT+J6lbD99MMzaSTZ/7CHu+u05sKRENz3Osv5OYYTe5bF2P8Jp7Uph0fJbB6YNb14rCcceB9n0C9YwY1sZ3E/CDCpSEbIDsSGQF9gnKUBR7Q+f5ZSVDvEHvJbSDn8FaFeWruIcsv3F/82jTJ3UDboCSdL6bJxbC/d2LbmwwLV6Bxnjteh4Vdhym2IMRSkg9dnmsoZaMySu/foysE76p4tK7tm0dT7bTXeP7v6XwHW00Lr9smmbhB3XxSOSrekGPplhSTWwuP/7smbTSYf1U6jN3VrlZbMBPv3jDaobSapaJUbtb0wkUrAKf75AbfqrWbGyQaWCmzz+EodTBD0nZtsro5pginVuuB1j5ZycvkNo9mlN8Qpk0u4oPjKcNOGdTxpBqchyL/YkA8DeUnGriiqvTYSGI5gWMm6P7JCuf
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199015)(36756003)(33656002)(316002)(8936002)(8676002)(66446008)(4326008)(76116006)(66556008)(38070700005)(66946007)(64756008)(2906002)(71200400001)(66476007)(91956017)(478600001)(6916009)(5660300002)(6512007)(966005)(2616005)(186003)(4744005)(26005)(38100700002)(86362001)(6506007)(6486002)(41300700001)(53546011)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <200A52164048BE4C8B647CFC72EB8EE4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8026
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9fd41820-1cdf-49c8-1e05-08dabe6eb4a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MXjboNypJO6MuHDnOCIT8u4vJp295eR58mAa0sYH1xj0UaZZA3v2LVilS3HVVPGtZJM2KHG7/rukhhi6UcXYvvsjNP/g/CcQvu8htDOVXgoqahCWlxrNPacKYpA6CYSx/jP6AQMyXi33EJMfuf1z51/FjEJtEqvwHXyr5VZfzhTKA7wQIc0mesjaWvp9HEq4vmEn/Am484zGUQt1LGW1P/Sw2yV3ofm15AFpe5yx95AxMVSrPAR50btAkK+zhyvw0cSAaZAWSmwmugLRNTkCGpUbkmVFvOO0kkhFMhjhlc3nXY/v9k/M0oidrGEVq55EjXc1GJogRGecKIIlH0S3SiYAQsFAcTXv7Is0IfNva/W4v4NSGBz6P1wnB9H7e1XEFEmo2eItrBR84U/WpCsWtTIhYeM68L/DWsg24ydRzuZN5sdvxHNB5XExSm9Mj/MbaRxTlgL4q+4+NQy6fjKV9KmSZ/edxVNSw2kPJLXwZ4KjXVwB+0gkNbdyFoIlh6AxwtQbN7YHPiaHppRqix8hwwK8PkdwHF9+yys/dPsjDtw5pZ2YU+lzF7Tz558hAM+1BPrSlvUZSZM7oxtAbIbY1ubSz1WTutwyplZf+DL1lf+YK3pxAvGa6IF1cHbr+vOT63MukTnVOFt9OGsBJU25F69olzTnzOZPEjKklYcneVdoAg4+qwR0KtSfzfcIxWGSFSOOwSJqCwhNXQvksDb3cJcmN9e5zIv2bawwkJH+tXo6pXHisOjJoMh7jVjT+k7auxR/scKDnNwX2xZc1ht3+uBbpX/80t5sJn8S/hfGN3A=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(40480700001)(8676002)(41300700001)(4326008)(40460700003)(6506007)(53546011)(36756003)(33656002)(82740400003)(81166007)(36860700001)(356005)(5660300002)(70586007)(8936002)(82310400005)(6862004)(26005)(316002)(86362001)(6512007)(47076005)(478600001)(4744005)(336012)(186003)(2906002)(6486002)(966005)(70206006)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 14:13:20.3954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bb0596-a00b-4c14-8893-08dabe6eba25
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8811
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 14:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172713

T24gNCBOb3YgMjAyMiwgYXQgMTA6MDEsIENoYXNlIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxjaGFzZS5xaT1saW5hcm8ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gK1NSQ1JFViA9ICIxOGUyODQ5NmFkZWUzZDg0ZmVmZGRhNmVmY2I5YzViODk5NmEyMzk4
Ig0KPiArU1JDX1VSSSA9ICIgXA0KPiArICAgIGdpdDovL25zei5yZXBvLmh1OjQ5MTAwL3JlcG8v
bGliYy10ZXN0O2JyYW5jaD1tYXN0ZXIgXA0KPiArICAgIGZpbGU6Ly9ydW4tcHRlc3QgXA0KPiAr
Ig0KPiArTUlSUk9SUyArPSAiZ2l0Oi8vbnN6LnJlcG8uaHU6NDkxMDAvcmVwby9saWJjLXRlc3Qg
Z2l0Oi8vcmVwby5vci5jei9saWJjLXRlc3TigJ0NCg0KVGhlIHByb2plY3TigJlzIHdlYiBzaXRl
IGF0IGh0dHBzOi8vd2lraS5tdXNsLWxpYmMub3JnL2xpYmMtdGVzdC5odG1sIHNheXMgdGhlIGdp
dCBVUkwgaXMgZ2l0Oi8vcmVwby5vci5jei9saWJjLXRlc3QsIHNvIHRoYXTigJlzIHRoZSBVUkwg
d2Ugc2hvdWxkIGZldGNoIGZyb20uDQoNCkFsc28gYXMgdGhpcyBwcm9qZWN0IGRvZXNu4oCZdCBh
cHBlYXIgdG8gaGF2ZSB2ZXJzaW9ucywgc2V0Og0KDQpQVj3igJwwK2dpdCR7U1JDUFZ94oCdLg0K
DQpUaGlzIHdheSB0aGUgdmVyc2lvbiBoYXMgdGhlIGdpdCBTSEEgaW4sIGFuZCBpZiB0aGV5IGV2
ZXIgcmVsZWFzZSBhIHZlcnNpb24gaXQgd2lsbCBiZSBncmVhdGVyIHRoYW4gMCBhbmQgc29ydCBj
b3JyZWN0bHkuDQoNClJvc3M=

