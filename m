Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1500C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 15:10:12 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web12.28515.1658157005022400721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 08:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=fNsNkRi9;
 spf=pass (domain: arm.com, ip: 40.107.22.88, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iC/YcqlkCxwW35DnVeBdqAiKec/IcYF7x3PPKnPz4WN49Pdop83ayV19cwhX8Drs8nxEKSn3RD6x4p7xp6WkUQ7sO4CV+AxF0jiWpjNgqKHVa2bgaIVlRYJ/1stwJ0izH604m4gvYALzjVpwP1H1Bhv1TovudzZAxlEQf72gvpwTeqsFcTxC2ZIxvArqPSJx6p45+Jg0+Lmt6kQw4R524sRD6+YOkn+kjR4tqcPdk+XOdDvVmkz1DmmuN4yJGHKi+02ReFG+a3JHi+ibj/j/EGoXFDEwfrotr2Q7m3o2cAgI9zlu95gjY70w0Kwrh7FyNVHwIfj+EoKUPS8Oq46D/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2MCXye6dXi0rRnqkPkEv7b75KTr+fLzO0cshuqXJ9I=;
 b=mfM8kcd/llwnOTZrYYY5HRbywEkyuNYY9O93M5O7s2L2hURELGFYPSvo5brCYf9aX2O5scEnLwF9GDvOKJsX8M2QTVlsmqS7ow+CnbQOq320dTIJOHSkzNw1v9vltzyAAdqOVIfbyfaplD7+LRr3PuwVFhWbzKsr75mK9o4zqADNeoR8pSh3wv9cJwNs7aiSL4nX8EMRm2QBmsDp2AGFAL3sTpVhPiqgMVLuL1P8bHe/aMnQp1UU+wM8l07x3GktAZkdOl40dsEicnqGZMztX2JcONns3mz9xmUk7s9jRip5eDWhGYtg2rv1LCmsMgp7OM9UKCiX+rH/UnmwTdl0mg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2MCXye6dXi0rRnqkPkEv7b75KTr+fLzO0cshuqXJ9I=;
 b=fNsNkRi93+1tZuWa8yAQiKimQRHRD15OZM/68JQYRwOWyM/NHCYgqWHStwBOyomrr2ax4Shrw/I37guTUIz2JMwL3Wcwt4mCiU7L27yJ9vuCvWIfhZCF28Ny1fpt6xgqzkv5KgX2RSZ30jV8VfmcGSEwJlaeaLDWbOE476jay+o=
Received: from AM5PR0601CA0079.eurprd06.prod.outlook.com (2603:10a6:206::44)
 by VI1PR08MB3869.eurprd08.prod.outlook.com (2603:10a6:803:bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 15:10:00 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::e2) by AM5PR0601CA0079.outlook.office365.com
 (2603:10a6:206::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12 via Frontend
 Transport; Mon, 18 Jul 2022 15:10:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 15:09:59 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Mon, 18 Jul 2022 15:09:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d6c6b392ed5e116
X-CR-MTA-TID: 64aa7808
Received: from 5135c92bdb67.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CB3D5BC2-0751-4D43-9E1B-18FBA540B071.1;
	Mon, 18 Jul 2022 15:09:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 5135c92bdb67.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Jul 2022 15:09:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi5Qa7xGmmKa6u1GAfmdjoR4jEtIxjDgP2o89M+U/hzB+t+10qNhuSWp7KAmDFw+No+l/lXkvKntnNbOE9fVzWtPQQsId+POI1mghCv/SXkHM15jJKUk+jFGX2hWraMQP7kAxhNRv011rFGTs5PyYBdLrJnUETbqnswrW5p8vdI4Q9eW/NvA9ON03YuCzTE9Z2DFjJdl3l1MDN3Mwcde0cXgvBMLUqXVc7W+FEsLkn6Wo/QFKsZMszAp/3fprFQI+vH/Ms6hvlqTdOnKrlIhIGnGTL+hjGfgbbEBi3/aBDX96/6lC71OzdprO2R1/P9T9G4HtVVTUM5BvCciI0683w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2MCXye6dXi0rRnqkPkEv7b75KTr+fLzO0cshuqXJ9I=;
 b=m10B8/5iWpMNCOMUffRH9YVPW81uz26f7nkhn3MbwIfxHlpNGyQKlZGhqHHRzkpmR3WEA9hQ1rv4zBzYIpSnfEiclgfvcjQsQPOdBf1pre40CYDWAb1S9liDn72vTGrC/bWv+rkPafnYr2EPERcsaBb+LnPgn7EFdI7oPuBapsFyhV5ne16ls7ueItT4cK10uqKdEYo+s3yvJghOQSA21fzdQhS/6f6BRUcelHyPweWOXKmI6bozBc4XYYgEg2dIjmTGiwVTqy1FsPM+09PxJhfr5roQYRwwmtzo5ia5VREONprd0utond3xH+47bp8cOLfeuvwZVp96hrZ3D+VoUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2MCXye6dXi0rRnqkPkEv7b75KTr+fLzO0cshuqXJ9I=;
 b=fNsNkRi93+1tZuWa8yAQiKimQRHRD15OZM/68JQYRwOWyM/NHCYgqWHStwBOyomrr2ax4Shrw/I37guTUIz2JMwL3Wcwt4mCiU7L27yJ9vuCvWIfhZCF28Ny1fpt6xgqzkv5KgX2RSZ30jV8VfmcGSEwJlaeaLDWbOE476jay+o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB3827.eurprd08.prod.outlook.com (2603:10a6:208:104::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 15:09:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 15:09:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa: fix with DEBUG_BUILD enabled
Thread-Topic: [OE-core] [PATCH] mesa: fix with DEBUG_BUILD enabled
Thread-Index: AQHYmk048apLO/8/Z0GLTKZJYg/Sbq2EPD6A
Date: Mon, 18 Jul 2022 15:09:49 +0000
Message-ID: <17A296B6-EC58-4507-8518-E3C3520E428F@arm.com>
References: <20220718022159.39781-1-kai.kang@windriver.com>
In-Reply-To: <20220718022159.39781-1-kai.kang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6c66dd86-a83b-4352-357f-08da68cf9564
x-ms-traffictypediagnostic: 
	AM0PR08MB3827:EE_|VE1EUR03FT027:EE_|VI1PR08MB3869:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9i0cFTMSmJIUJYu7GF3+8qcYKZyqHHtVcGBPojDexkfJ2NYUgxn63NtlUsKq1zxsC//qNLH4R9JD4H9thPG4nTsDthoKzp6X4RDoJXgkyNIwOPBeyrUxcT434DwVpQ81umO+TcWUcFSNGvLuF5kfUHsd2NGbD/c2Bh2lHNhiJTBwSvw4Ro9RefXVQQjt0ozeKvs6EUrZBHCIjUL4qigaMkdnW7M5YKzH4wOAbLvXkQdRkaiJw0wj995AyVPfyxhvYuHzlE2t+bt/c1Up1cFudAlDkb7QH+iY4fy1sToL3YUJiRnQcgr75cE1V1awtcboToTjuGs1QjeL1caaMpS222CKJoCpIjFD1hgV63T7c+fNGu8ZYZnVHIFtHFrnvtE+vkum9pV0bLsjY+E4LTAsSJIjDgYFsaOIonJTfLq0/p67i0kszJxGrewvoKf4iesXuSumXYlXCa8gOAomfmiqugxIx0KmcMg/yU5sxceGh9gc9Pw6jcFBNK64HUonCEz4rBBAa22cCD/6a7DEnWp2Bl8A0IPBspqJXeAlSye/lqmEKGpW4dqqZt4Zmd27ZhHFsdqtpox6srWXmhmsQv7UdjikxRUbGYq/j6Eg6/CaWw1/NC2Nn7V0oiJteT86VHRiO1bMdZTu/1Q2rs2O23Wii0mQjeWhkAp+mHARnbBSpPlVp5pgpX05Bt70jnngxaHeQ8BfqaLAwqIZeGcMp6KmkheR8wZkXSStYnIvgoagDzq4C6rJUOTvjcvzfLawxIZlKKrlT4fcK36S6nEFkuwfBcr5HwvlLjA36T8zsHN2hRZqBTFAl5XINgeRECgn+hsVCKgHFMwz+xvxwgKvyVH8aq3MCypUFYCeFWYqJ09faNZhdgtm/+D6GE5UyQKumqjc
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(41300700001)(6512007)(122000001)(26005)(53546011)(6506007)(83380400001)(2906002)(38100700002)(5660300002)(186003)(2616005)(33656002)(76116006)(6486002)(6916009)(966005)(316002)(8936002)(478600001)(66556008)(71200400001)(86362001)(4326008)(8676002)(91956017)(66946007)(64756008)(66446008)(66476007)(36756003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3037A22ABB16E1459DCA8452643CDB79@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3827
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2abaa343-d8d9-4c23-ac0f-08da68cf8f27
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V5zyQtfLS1BHZq1FsqwfIfBYZznXg1ZhJgSsBpKHQWEJAjlwz5LSC4VDdCVny378apCBAIKJlHLrI9ob7LEfCxtiTem9vOkgGWrfY4VUMg/3tmzNYDw6GWPbu0Nsf/z1M/VImCgwXpglX3A+TKojU1KNRTJ1+uwNPLO5zC7qXCEpR6oJqBpUs80WvlX8/d3XfJCGxCy+GQtDxSNdKR/avsLKEP2I3Lvni00DwFFYGlD4cozqDvB0n4odkaOkPYaex2wix/gFIB2SC7oWwkLitTiuSlnO4K/FfJiriknwOZpCYwrOConCiC5gBLmWbWVAPjGhNCDcp/L81QNPIHyVEUvMAqFa9Hde+/OYKSeRdjTNittF7iJpUFqMrMBfNPgCwLF6IWsQlGj9YIuztcWUKtYMStG/zyxPfPXcsTPjN1mX79ZX8dl+roYyIrPa8I4yIyLKtlGHGWbQcdkJvP8nBWroH5Mp2/3fkVjRmn7GhrYWSl+aHuvQa5xOYm4zHHGNtf1elwThrC023fCLqtYCarbfZ4PjjQ7CjfT+7Pk2COuZTBorO1hlkEuEt2S8OywAVlQNEDXbpjgGNpfvWHC6sRrrlaPNPm0heC0zzbV6wIMwDVeHXpaGOmqXejwFCIxnB2c9R1/Qi+0xMssdzNrUy7YAfNK/FD2RZIzFR7myhKHieqYzeqtGZxCqNDzeY+EJ6vAMWT7rF1Iq4PaDPHMod7AKTf/WnBoB0HjLsNAfPS6fKr/ufStxexXD5N3sgxD9wfDkHFUp6UtXRhsQ5zArg2LjBxFxoGmYARONyrpaRuemUDwRMlHM6BfSJgqTiF+UK3FJ3XoupXxpxSZhdxF87n2ukcoJICmmHJ3CPkNlytU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966006)(40470700004)(36840700001)(966005)(41300700001)(6486002)(478600001)(53546011)(2616005)(26005)(186003)(356005)(6506007)(36860700001)(83380400001)(82740400003)(6512007)(47076005)(336012)(81166007)(2906002)(86362001)(33656002)(8936002)(6862004)(5660300002)(40460700003)(36756003)(316002)(82310400005)(70586007)(70206006)(8676002)(40480700001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 15:09:59.9144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c66dd86-a83b-4352-357f-08da68cf9564
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3869
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 15:10:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168236

VGhpcyBwYXRjaCBoYXMgYmVlbiByZWplY3RlZCB1cHN0cmVhbSwgcGxlYXNlIHN3aXRjaCBmb3Ig
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3Rz
LzE3NDM5IGluc3RlYWQuDQoNClJvc3MNCg0KPiBPbiAxOCBKdWwgMjAyMiwgYXQgMDM6MjEsIGth
aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8a2FpLmthbmc9d2luZHJpdmVyLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEthaSBLYW5nIDxrYWkua2Fu
Z0B3aW5kcml2ZXIuY29tPg0KPiANCj4gSXQgZmFpbHMgdG8gY29tcGlsZSBtZXNhLW5hdGl2ZSB3
aGVuIERFQlVHX0JVSUxEIGlzIGVuYWJsZWQ6DQo+IA0KPiAuLi9tZXNhLTIyLjEuMy9zcmMvY29t
cGlsZXIvbmlyL25pcl9pbmxpbmVfaGVscGVycy5oOiBJbiBmdW5jdGlvbiDigJhuaXJfb3B0X21v
dmVfYmxvY2vigJk6DQo+IC4uL21lc2EtMjIuMS4zL3NyYy9jb21waWxlci9uaXIvbmlyX29wdF9t
b3ZlLmM6NTU6MTogZXJyb3I6IGlubGluaW5nIGZhaWxlZCBpbiBjYWxsIHRvDQo+ICBhbHdheXNf
aW5saW5lIOKAmHNyY19pc19zc2HigJk6IGluZGlyZWN0IGZ1bmN0aW9uIGNhbGwgd2l0aCBhIHll
dCB1bmRldGVybWluZWQgY2FsbGVlDQo+IHNyY19pc19zc2EobmlyX3NyYyAqc3JjLCB2b2lkICpz
dGF0ZSkNCj4gXn5+fn5+fn5+fg0KPiANCj4gUmVtb3ZlICdBTFdBWVNfSU5MSU5FJyBmb3IgZnVu
Y3Rpb24gc3JjX2lzX3NzYS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2Fu
Z0B3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gLi4uL21lc2EvZmlsZXMvMDAwMS1uaXItZml4LWJ1
aWxkLWF0LU9nLnBhdGNoIHwgMzEgKysrKysrKysrKysrKysrKysrKw0KPiBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbWVzYS9tZXNhLmluYyAgICAgICAgICAgfCAgMSArDQo+IDIgZmlsZXMgY2hhbmdl
ZCwgMzIgaW5zZXJ0aW9ucygrKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL21lc2EvZmlsZXMvMDAwMS1uaXItZml4LWJ1aWxkLWF0LU9nLnBhdGNoDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1uaXItZml4
LWJ1aWxkLWF0LU9nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAw
MS1uaXItZml4LWJ1aWxkLWF0LU9nLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGlu
ZGV4IDAwMDAwMDAwMDAuLjViNGE1YzcyMzENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW5pci1maXgtYnVpbGQtYXQtT2cucGF0
Y2gNCj4gQEAgLTAsMCArMSwzMSBAQA0KPiArQXQgLU9nIHdpdGggZ2NjIDEyLjEsIGl0IGZhaWxz
IHRvIGNvbXBpbGU6DQo+ICsNCj4gKy4uL21lc2EtMjIuMS4zL3NyYy9jb21waWxlci9uaXIvbmly
X2lubGluZV9oZWxwZXJzLmg6IEluIGZ1bmN0aW9uIOKAmG5pcl9vcHRfbW92ZV9ibG9ja+KAmToN
Cj4gKy4uL21lc2EtMjIuMS4zL3NyYy9jb21waWxlci9uaXIvbmlyX29wdF9tb3ZlLmM6NTU6MTog
ZXJyb3I6IGlubGluaW5nIGZhaWxlZCBpbiBjYWxsIHRvIGFsd2F5c19pbmxpbmUg4oCYc3JjX2lz
X3NzYeKAmTogaW5kaXJlY3QgZnVuY3Rpb24gY2FsbCB3aXRoIGEgeWV0IHVuZGV0ZXJtaW5lZCBj
YWxsZWUgICAgIHNyY19pc19zc2EobmlyX3NyYyAqc3JjLCB2b2lkICpzdGF0ZSkNCj4gKyBefn5+
fn5+fn5+DQo+ICsNCj4gK1JlbW92ZSAnQUxXQVlTX0lOTElORScgZm9yIGZ1bmN0aW9uIHNyY19p
c19zc2EuDQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvMTc1ODldDQo+ICsN
Cj4gK1NpZ25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPg0KPiAr
LS0tDQo+ICsgc3JjL2NvbXBpbGVyL25pci9uaXJfb3B0X21vdmUuYyB8IDIgKy0NCj4gKyAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gKw0KPiArZGlmZiAt
LWdpdCBhL3NyYy9jb21waWxlci9uaXIvbmlyX29wdF9tb3ZlLmMgYi9zcmMvY29tcGlsZXIvbmly
L25pcl9vcHRfbW92ZS5jDQo+ICtpbmRleCA4MWJjZGU1YzQzNi4uMDlkYjY3MTcwMDIgMTAwNjQ0
DQo+ICstLS0gYS9zcmMvY29tcGlsZXIvbmlyL25pcl9vcHRfbW92ZS5jDQo+ICsrKysgYi9zcmMv
Y29tcGlsZXIvbmlyL25pcl9vcHRfbW92ZS5jDQo+ICtAQCAtNTEsNyArNTEsNyBAQA0KPiArICAq
IGxvd2VyIHJlZ2lzdGVyIHByZXNzdXJlLg0KPiArICAqLw0KPiArIA0KPiArLXN0YXRpYyBBTFdB
WVNfSU5MSU5FIGJvb2wNCj4gKytzdGF0aWMgYm9vbA0KPiArIHNyY19pc19zc2EobmlyX3NyYyAq
c3JjLCB2b2lkICpzdGF0ZSkNCj4gKyB7DQo+ICsgICAgcmV0dXJuIHNyYy0+aXNfc3NhOw0KPiAr
LS0gDQo+ICsyLjM0LjENCj4gKw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvbWVzYS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYw0KPiBp
bmRleCA3MTBjYWNiMDlkLi41OGU2NjJlZmQ0IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbWVzYS9tZXNhLmluYw0KPiArKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVz
YS9tZXNhLmluYw0KPiBAQCAtMjIsNiArMjIsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vbWVzYS5m
cmVlZGVza3RvcC5vcmcvYXJjaGl2ZS9tZXNhLSR7UFZ9LnRhci54eiBcDQo+ICAgICAgICAgICAg
ZmlsZTovLzAwMDEtdXRpbC1mb3JtYXQtQ2hlY2stZm9yLU5FT04tYmVmb3JlLXVzaW5nLWl0LnBh
dGNoIFwNCj4gICAgICAgICAgICBmaWxlOi8vMDAwMS1SZXZlcnQtZWdsLXdheWxhbmQtZGVwcmVj
YXRlLWRybV9oYW5kbGVfZm9ybWF0LWFuZC1kLnBhdGNoIFwNCj4gICAgICAgICAgICBmaWxlOi8v
MDAwMS1zd3Jhc3Rfa21zLXVzZS1zd2ttc0RSSTJFeHRlbnNpb24taW5zdGVhZC1vZi1kcmlEUkky
LnBhdGNoIFwNCj4gKyAgICAgICAgICAgZmlsZTovLzAwMDEtbmlyLWZpeC1idWlsZC1hdC1PZy5w
YXRjaCBcDQo+ICAgICAgICAgICAgIg0KPiANCj4gU1JDX1VSSVtzaGEyNTZzdW1dID0gImI5OGYz
MmJhN2FhMmExZmY1NzI1ZmIzNmViOTk5YzY5MzA3OWYwY2ExNmY3MGFhMmYxMDNlMmI2YzNmMDkz
ZTMiDQo+IC0tIA0KPiAyLjE3LjENCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0K
PiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4g
Vmlldy9SZXBseSBPbmxpbmUgKCMxNjgxODkpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE2ODE4OQ0KPiBNdXRlIFRoaXMgVG9waWM6
IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85MjQ1MTQ1NS82ODc1ODg4DQo+IEdy
b3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gDQoNCg==

