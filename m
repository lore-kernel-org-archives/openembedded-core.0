Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664FAC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 14:05:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web10.7916.1665669932339481555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 07:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4T8FlN0U;
 spf=pass (domain: arm.com, ip: 40.107.20.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=B4KpdqjDBoqL7xdsT9cUXEMYieJ+ul1cU1fz6EO7Crh648ZDCMblM307Qu3BW1OOPPpflRZCqSOOhHq1ow7lTgOO2PGlvK1n9m49RlvmOgjV8Ex+0teCJjTpRPtNW7AG7wTwWnrc3vuO9ku0YyAozhCnx6lyY1neyE3E+j0na15XAv7FpLs7keor4bgamiDEoXQTJt845w0gyDCWTXNTITJcZrGd5/BuRyS8gbLqZp6EvY6iWNUqfRg5KPRqohSqC4KYh2tneehBIF0/gFnZg0T7OOBHMDKHjlFJDraefo0giT6Adu/otGrsAfjdY08ITs1IBCYzuJgWBCcxqPSCrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CAQ/n47ajaRLHvjW1Nq9c3X7SsOxQqDXV+XOfc3RU0=;
 b=YvttQOO7z5PF0QruiWoEAt5PnyYiOCIxqXrP6V1i6AsmXE6xqfGg65l8Sp/IMSCwAdw8oq2aY5Y4u546W8xIYDWKczgRAT7G2/7pndDev/XxHqRS4BFTTLg75IkubwC3n87glIJjQurZDUXBAbqnDdZm2O5VpR4rUUe1bPtbzo3sDBHx+VR10ulktJM1GXwxIenyvJopn9wAdqL0xMwwd8Osv1SoOq5I2buTWkaoQ/N9FQHOn6a56/128AA87lx7acQt70lHllvoEK1ZWtcd8iKygOhQdjNF3Y/1u287F21gpsCvdQPym4VhRGQTPilFG328tAxET9VUdDP9GsBroA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CAQ/n47ajaRLHvjW1Nq9c3X7SsOxQqDXV+XOfc3RU0=;
 b=4T8FlN0UudgN8D7aWI+zDde72TbQ5R+WoUz3pUSD4xNLuubfngXG9UPfBrhHVxAjGLUkVys7fnpIBKs/p4TPm++sex/Iwf7kYxRWfdDZ1Zq2OC+vH6+dhgSykp2oATuGigVNzyn6TtQAHcSEtQazknq46Jr5kkaFcfMcJqhuhMY=
Received: from DB6PR0301CA0024.eurprd03.prod.outlook.com (2603:10a6:4:3e::34)
 by AS2PR08MB10111.eurprd08.prod.outlook.com (2603:10a6:20b:62d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 14:05:28 +0000
Received: from DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::40) by DB6PR0301CA0024.outlook.office365.com
 (2603:10a6:4:3e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Thu, 13 Oct 2022 14:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT050.mail.protection.outlook.com (100.127.142.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Thu, 13 Oct 2022 14:05:28 +0000
Received: ("Tessian outbound f394866f3f2b:v130"); Thu, 13 Oct 2022 14:05:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1db04909c123fa8
X-CR-MTA-TID: 64aa7808
Received: from d0a5350b5db7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 31369A2E-04A1-416C-9249-35D8AE0E73B4.1;
	Thu, 13 Oct 2022 14:05:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0a5350b5db7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Oct 2022 14:05:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3KwHNx5CNPswA9u+D8w9DSLqjFd2knSBqHw9Nv6k7LV1HLIDAynfdBJyl1THoCAPRmVv7FYQ4CHkji8oiDurYjyj6c1qFbpLX9BYuErzAwzR8ko+6hOt8RtCqECziEKxf/9cJW+icZe8vaNgGooxK7JOXtD6uXzfq3eAGEH/eTd12r2dqYcYltFaT9ijXkZH3PP6zW6oJqg0TkJC//48Lo0obRrZalEWxc/CDuIEYu4cfZ2R7a0xdPMTjwtlkdMtUt9UUmGyqzEIJ55uFu04MM8qdpDZBOWD4V/ESqcNZoxhIC+SCXrM7n5mQnfRlZ5LcbRsZEM3gdyEukI6wPYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CAQ/n47ajaRLHvjW1Nq9c3X7SsOxQqDXV+XOfc3RU0=;
 b=PuK5MyzBx7PkG80yx4gOwyOaWZ4/UXjh+Z0txNafVvpJfu5cfZTXUOGBBLmIZPwyeKDWwXsA8JyplXCWGFdYyQmVRy24YcI+VJCydmGXVUD6U1Bxax7/bFFT1yxcqb9H0STrHKbsWJlby7jQzW0o4tWC0ZongWc/Erir5LcPN51+zuGRrdJl+v6xpP6FR1j4LNgdADSe4UGZAGLPYg6KsLaMBCbNFkahWRzmehllyJ7LlJvpn0xvDdJaBY8yAfEKxUFZxXoVK8uH8lPgRtup+gsa7P5fIWSXYZr0IThd9YjDzsBVNphPdDJRmqFRuVkoJosyo9FqnNF2b1VTFIm3Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CAQ/n47ajaRLHvjW1Nq9c3X7SsOxQqDXV+XOfc3RU0=;
 b=4T8FlN0UudgN8D7aWI+zDde72TbQ5R+WoUz3pUSD4xNLuubfngXG9UPfBrhHVxAjGLUkVys7fnpIBKs/p4TPm++sex/Iwf7kYxRWfdDZ1Zq2OC+vH6+dhgSykp2oATuGigVNzyn6TtQAHcSEtQazknq46Jr5kkaFcfMcJqhuhMY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7776.eurprd08.prod.outlook.com (2603:10a6:150:5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 14:05:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%6]) with mapi id 15.20.5709.021; Thu, 13 Oct 2022
 14:05:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gcc: Allow -Wno-error=poison-system-directories
 to take effect
Thread-Topic: [OE-core] [PATCH] gcc: Allow
 -Wno-error=poison-system-directories to take effect
Thread-Index: AQHY3wffzYK95XxfPkCo2NZsvkpis64MW5EA
Date: Thu, 13 Oct 2022 14:05:14 +0000
Message-ID: <6E25C44F-E526-49E7-9AAE-336E670B7F15@arm.com>
References: <20221013132926.2771530-1-pkj@axis.com>
In-Reply-To: <20221013132926.2771530-1-pkj@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7776:EE_|DBAEUR03FT050:EE_|AS2PR08MB10111:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a0de18-5234-4a9a-c9c7-08daad23fb80
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9H/HfhsTaRS7oVmoEctOeyqwYcPkBjdsE8D6GaSYtYmbrlcbJgQ7KwzAmtKGJGOqzTO69uxVyFxkt8s6D3qiRLok/UH6d+m1RNsNAU22F+O7kTWY21Ai3SF29TLxAxFkHQEO+UJy2YxoXwxBzzuaB1Wo+CqRAelz0J9MQUeBh3LaNYqdYB0Eb8yYupXMnqMlaHP5EdBT1hCrVlMli4qZ04RFOk8EQoVCY0e9wW7eCja/CAdqBNa1yVrZLghVFJ87E12anQPbL1ZOiX8zGaNnL8us3iYpNMlepkZKSpYMyKOvOqqhOUBK+c2v3VIa11OAoKb8t9Mnw6LqKFdoEd7pdC/DlnEEl6xNzDG/Z6Y+eQg2vymDWJZvWGe4JlV2AOmYXUWtS/VuAKkMlniv1kKuLmxL6mg0UbkLguMWAbLOon2tZ6kbr7uHBQl20t92I6hft9LRXBYN3TIDC5BCgPN3iTUl8muXvxsokvrpFTb2XVql54LBT/U/Z9vuxzUa8L06ESCNG3jztUnCwF52hrAeV7lJo40ruAuzXGHDgpK5pDOagRJ6MvmFCzmyMqhjuQaErY5MUf+Z8Rnqhxnx9QX+sWbKnva9xIGXtywc/2FnA+W1WkWTuhMGYNiJplGLV9Dnv/eMYaxZ5duQN/nYcQdOxwlldCeY2qBJY4qZEHdNwssl1e6Aink62mYpK+qEjRtR+ZHNwxYTfqjFeH8zplq+Ps6SvELbHkMHk6B3kbRLOVoSM7hPEaBmKdzKiAgdvvTZ0PGrbYCx6RgNIalfvd/M9TsPRXwPhTUmIx3pC5NSQoUprTHE9pROjrxR5cryGgnp5LuAOM7q56MstVwTI7pfjg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199015)(38070700005)(66899015)(122000001)(36756003)(86362001)(38100700002)(33656002)(83380400001)(2616005)(66476007)(966005)(6486002)(2906002)(6506007)(26005)(186003)(53546011)(478600001)(6512007)(64756008)(91956017)(5660300002)(4326008)(76116006)(6916009)(316002)(8936002)(71200400001)(8676002)(66556008)(41300700001)(66446008)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C82EE3AB61231642BE5FBD3D27421A87@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7776
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a47f2e81-8bb7-47fe-a3d4-08daad23f38c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X7XchI32yqHGK88Nxv5iPB2CrDMrVVx98BgblG/zfINnU4Du8vRb0vRWxOjZ79R7tW7S85dReuOKeH4dR5vrwCSta6hskURFzYE7GkfbngvmMrTQW4v2fK4jcUZnFkGPB+aFJ4w5ImEPLyFKaDOfQmrMmapuIR1gol4ROFlF8plI6dLtLKir1VcJji5sGOtK2E2zupAgCiBSE/l6N4P+69xD1bNGQHIn1QbBmJ0XKMCE7gLIXiZmDyVm4zFDfzJ4O6SzsJXy29p7ljdFj+U60/dHfXVpl21Z+Kd3HoMAWeSvU3x/GrAnv9zbsywQLibM2GVUqPrDObN7IOe6bwu6V+XjwZ7t4T1eZwaeyJd+P4uo50anqBTXGKyRI4qctJl3t1vJ29zgqbqGyCS4Bv712HiMwGsGfT2PZjotZMfItko77wNTX0MS5/AfE147WaDrh2eKnxZ4Daq7y6EyeSzv4Wnb0B5EGkcPjsqkt7JPntzRFdzrk8XarJ7b8efN0IMP5PquCt2x5pSiCugsMDyGW5VqXlCAT+vO3S00wkD+YQE5lxnBjCtphw/olofAogo0ley2JmfqLOU0T8+VgrylZ9MRibM9WBibmnHz8/9JnTksyWKK7iFG1PlN9nAhUzjqqQDGg5D8PWl0brSdRUBYNv7V2s5K+PdhOy2sxSnFb4rK2qZJNcWOCohDnaeIZ57VsVsROPQwTRxYq4YNgOALUhBlt6IFOWrYfedeTSmSbJXq8f9I8sbiDtQRd+L38Jdw98nYD2KCaFJZam+x1dgLJvIDq272QKdmrpCzJTcs+MA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(316002)(86362001)(47076005)(40460700003)(8936002)(2906002)(36756003)(6862004)(186003)(2616005)(5660300002)(336012)(6512007)(41300700001)(40480700001)(4326008)(8676002)(70206006)(70586007)(26005)(33656002)(6506007)(53546011)(83380400001)(356005)(81166007)(66899015)(82310400005)(966005)(6486002)(82740400003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 14:05:28.1172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a0de18-5234-4a9a-c9c7-08daad23fb80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 14:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171705

V2hpbHN0IHRoaXMgaXMgYSBnb29kIGZpeCwgSeKAmW0gaG9ycmlmaWVkIHRvIGFzayB3aHkgeW91
IG5lZWQgaXTigKYNCg0KUm9zcw0KDQo+IE9uIDEzIE9jdCAyMDIyLCBhdCAxNDoyOSwgUGV0ZXIg
S2plbGxlcnN0ZWR0IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxwZXRlci5ramVsbGVyc3Rl
ZHQ9YXhpcy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBUaGUgY2hh
bmdlIGluIGNvbW1pdCBlOTAzYjI5ZiAoZ2NjLWNyb3NzOiBwYXNzDQo+IC1XZXJyb3I9cG9pc29u
LXN5c3RlbS1kaXJlY3RvcmllcyB0byBjb21waWxlciBzdGFnZXMpIG1hZGUgaXQgaW1wb3NzaWJs
ZQ0KPiB0byBkaXNhYmxlIHRoZSBlcnJvciB1c2luZyAtV25vLWVycm9yPXBvaXNvbi1zeXN0ZW0t
ZGlyZWN0b3JpZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVyc3RlZHQgPHBl
dGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gLS0tDQo+IC4uLi8wMDAyLWdjYy1wb2lzb24t
c3lzdGVtLWRpcmVjdG9yaWVzLnBhdGNoICB8IDM2ICsrKysrKysrKy0tLS0tLS0tLS0NCj4gMSBm
aWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLzAwMDItZ2NjLXBvaXNvbi1z
eXN0ZW0tZGlyZWN0b3JpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy8w
MDAyLWdjYy1wb2lzb24tc3lzdGVtLWRpcmVjdG9yaWVzLnBhdGNoDQo+IGluZGV4IGJmZWM0NDc3
YzEuLjVhYTYzNWIzZDQgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2Mv
Z2NjLzAwMDItZ2NjLXBvaXNvbi1zeXN0ZW0tZGlyZWN0b3JpZXMucGF0Y2gNCj4gKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MvMDAwMi1nY2MtcG9pc29uLXN5c3RlbS1kaXJlY3Rv
cmllcy5wYXRjaA0KPiBAQCAtMSw0ICsxLDQgQEANCj4gLUZyb20gZTFkYmRjZDBlYTY2N2JhYjRi
NTUxMjk0MzU0ZTA0YzZmZTI4OGFiNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zyb20g
OTlmMWU2MWIyOTU3MjI2MjU0YTExNmZkZTdmZDczYmYwNzAzNDAxMiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDENCj4gRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gRGF0ZTog
TW9uLCA4IE1hciAyMDIxIDE2OjA0OjIwIC0wODAwDQo+IFN1YmplY3Q6IFtQQVRDSF0gZ2NjOiBw
b2lzb24tc3lzdGVtLWRpcmVjdG9yaWVzDQo+IEBAIC0yMCwxMiArMjAsMTIgQEAgU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gIGdjYy9jb25maWd1cmUgICAg
ICAgfCAxOSArKysrKysrKysrKysrKysrKysrDQo+ICBnY2MvY29uZmlndXJlLmFjICAgIHwgMTYg
KysrKysrKysrKysrKysrKw0KPiAgZ2NjL2RvYy9pbnZva2UudGV4aSB8ICA5ICsrKysrKysrKw0K
PiAtIGdjYy9nY2MuY2MgICAgICAgICAgfCAgOSArKysrKysrLS0NCj4gKyBnY2MvZ2NjLmNjICAg
ICAgICAgIHwgMTUgKysrKysrKysrKysrLS0tDQo+ICBnY2MvaW5jcGF0aC5jYyAgICAgIHwgMjEg
KysrKysrKysrKysrKysrKysrKysrDQo+IC0gNyBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiArIDcgZmlsZXMgY2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9nY2MvY29tbW9uLm9wdCBiL2dj
Yy9jb21tb24ub3B0DQo+IC1pbmRleCA4YTBkYWZjNTIyZC4uMDM1Nzg2OGUyMmMgMTAwNjQ0DQo+
ICtpbmRleCA4YTBkYWZjNTIuLjAzNTc4NjhlMiAxMDA2NDQNCj4gLS0tIGEvZ2NjL2NvbW1vbi5v
cHQNCj4gKysrIGIvZ2NjL2NvbW1vbi5vcHQNCj4gQEAgLTcxMCw2ICs3MTAsMTAgQEAgV3JldHVy
bi1sb2NhbC1hZGRyDQo+IEBAIC00MCw3ICs0MCw3IEBAIGluZGV4IDhhMGRhZmM1MjJkLi4wMzU3
ODY4ZTIyYyAxMDA2NDQNCj4gIENvbW1vbiBWYXIod2Fybl9zaGFkb3cpIFdhcm5pbmcNCj4gIFdh
cm4gd2hlbiBvbmUgdmFyaWFibGUgc2hhZG93cyBhbm90aGVyLiAgU2FtZSBhcyAtV3NoYWRvdz1n
bG9iYWwuDQo+IGRpZmYgLS1naXQgYS9nY2MvY29uZmlnLmluIGIvZ2NjL2NvbmZpZy5pbg0KPiAt
aW5kZXggNjRjMjdjOWNmYWMuLmE2OTNjYjhhODg2IDEwMDY0NA0KPiAraW5kZXggNjRjMjdjOWNm
Li5hNjkzY2I4YTggMTAwNjQ0DQo+IC0tLSBhL2djYy9jb25maWcuaW4NCj4gKysrIGIvZ2NjL2Nv
bmZpZy5pbg0KPiBAQCAtMjMwLDYgKzIzMCwxNiBAQA0KPiBAQCAtNjEsNyArNjEsNyBAQCBpbmRl
eCA2NGMyN2M5Y2ZhYy4uYTY5M2NiOGE4ODYgMTAwNjQ0DQo+ICAgICBvcHRpbWl6ZXIgYW5kIGJh
Y2sgZW5kKSB0byBiZSBjaGVja2VkIGZvciBkeW5hbWljIHR5cGUgc2FmZXR5IGF0IHJ1bnRpbWUu
DQo+ICAgICBUaGlzIGlzIHF1aXRlIGV4cGVuc2l2ZS4gKi8NCj4gZGlmZiAtLWdpdCBhL2djYy9j
b25maWd1cmUgYi9nY2MvY29uZmlndXJlDQo+IC1pbmRleCA1Y2UwNTU3NzE5YS4uZGMyZDU5NzAx
YWQgMTAwNzU1DQo+ICtpbmRleCAyYjgzYWNmYjAuLjhiYjk3NTc4YyAxMDA3NTUNCj4gLS0tIGEv
Z2NjL2NvbmZpZ3VyZQ0KPiArKysgYi9nY2MvY29uZmlndXJlDQo+IEBAIC0xMDIzLDYgKzEwMjMs
NyBAQCBlbmFibGVfbWFpbnRhaW5lcl9tb2RlDQo+IEBAIC04MSw3ICs4MSw3IEBAIGluZGV4IDVj
ZTA1NTc3MTlhLi5kYzJkNTk3MDFhZCAxMDA3NTUNCj4gICAgLS1lbmFibGUtcGx1Z2luICAgICAg
ICAgZW5hYmxlIHBsdWdpbiBzdXBwb3J0DQo+ICAgIC0tZW5hYmxlLWhvc3Qtc2hhcmVkICAgIGJ1
aWxkIGhvc3QgY29kZSBhcyBzaGFyZWQgbGlicmFyaWVzDQo+ICAgIC0tZGlzYWJsZS1saWJxdWFk
bWF0aC1zdXBwb3J0DQo+IC1AQCAtMzE5ODIsNiArMzE5ODUsMjIgQEAgaWYgdGVzdCAiJHtlbmFi
bGVfdmVyc2lvbl9zcGVjaWZpY19ydW50aW1lX2xpYnMrc2V0fSIgPSBzZXQ7IHRoZW4gOg0KPiAr
QEAgLTMxOTk2LDYgKzMxOTk5LDIyIEBAIGlmIHRlc3QgIiR7ZW5hYmxlX3ZlcnNpb25fc3BlY2lm
aWNfcnVudGltZV9saWJzK3NldH0iID0gc2V0OyB0aGVuIDoNCj4gIGZpDQo+IA0KPiANCj4gQEAg
LTEwNSwxMCArMTA1LDEwIEBAIGluZGV4IDVjZTA1NTc3MTlhLi5kYzJkNTk3MDFhZCAxMDA3NTUN
Cj4gDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZ3VyZS5hYyBiL2djYy9jb25maWd1cmUu
YWMNCj4gLWluZGV4IDIzYmVlNzAxMGEzLi4zNmNlNzg5MjRkZSAxMDA2NDQNCj4gK2luZGV4IGRh
ZjJhNzA4Yy4uNjE1NWI4M2E3IDEwMDY0NA0KPiAtLS0gYS9nY2MvY29uZmlndXJlLmFjDQo+ICsr
KyBiL2djYy9jb25maWd1cmUuYWMNCj4gLUBAIC03NDIxLDYgKzc0MjEsMjIgQEAgQUNfQVJHX0VO
QUJMRSh2ZXJzaW9uLXNwZWNpZmljLXJ1bnRpbWUtbGlicywNCj4gK0BAIC03NDM1LDYgKzc0MzUs
MjIgQEAgQUNfQVJHX0VOQUJMRSh2ZXJzaW9uLXNwZWNpZmljLXJ1bnRpbWUtbGlicywNCj4gICAg
ICAgICAgICAgICAgICBbc3BlY2lmeSB0aGF0IHJ1bnRpbWUgbGlicmFyaWVzIHNob3VsZCBiZQ0K
PiAgICAgICAgICAgICAgICAgICBpbnN0YWxsZWQgaW4gYSBjb21waWxlci1zcGVjaWZpYyBkaXJl
Y3RvcnldKV0pDQo+IA0KPiBAQCAtMTMyLDcgKzEzMiw3IEBAIGluZGV4IDIzYmVlNzAxMGEzLi4z
NmNlNzg5MjRkZSAxMDA2NDQNCj4gIEFDX1NVQlNUKHN1YmRpcnMpDQo+ICBBQ19TVUJTVChzcmNk
aXIpDQo+IGRpZmYgLS1naXQgYS9nY2MvZG9jL2ludm9rZS50ZXhpIGIvZ2NjL2RvYy9pbnZva2Uu
dGV4aQ0KPiAtaW5kZXggMDdiNDQwMTkwYzMuLmIyZGU0NjQ3OThhIDEwMDY0NA0KPiAraW5kZXgg
ZmY2YzMzOGJlLi5hOGViZmE1OWEgMTAwNjQ0DQo+IC0tLSBhL2djYy9kb2MvaW52b2tlLnRleGkN
Cj4gKysrIGIvZ2NjL2RvYy9pbnZva2UudGV4aQ0KPiBAQCAtMzc5LDYgKzM3OSw3IEBAIE9iamVj
dGl2ZS1DIGFuZCBPYmplY3RpdmUtQysrIERpYWxlY3RzfS4NCj4gQEAgLTE1OSwxMCArMTU5LDEw
IEBAIGluZGV4IDA3YjQ0MDE5MGMzLi5iMmRlNDY0Nzk4YSAxMDA2NDQNCj4gIEBvcGluZGV4IFdm
bG9hdC1lcXVhbA0KPiAgQG9waW5kZXggV25vLWZsb2F0LWVxdWFsDQo+IGRpZmYgLS1naXQgYS9n
Y2MvZ2NjLmNjIGIvZ2NjL2djYy5jYw0KPiAtaW5kZXggYmIwN2NjMjQ0ZTMuLmNlMTYxZDNjODUz
IDEwMDY0NA0KPiAraW5kZXggYmVlZmRlN2Y2Li40ZTY1NTdiM2MgMTAwNjQ0DQo+IC0tLSBhL2dj
Yy9nY2MuY2MNCj4gKysrIGIvZ2NjL2djYy5jYw0KPiAtQEAgLTExNTksNiArMTE1OSw4IEBAIHBy
b3BlciBwb3NpdGlvbiBhbW9uZyB0aGUgb3RoZXIgb3V0cHV0IGZpbGVzLiAgKi8NCj4gK0BAIC0x
MTYyLDYgKzExNjIsOCBAQCBwcm9wZXIgcG9zaXRpb24gYW1vbmcgdGhlIG90aGVyIG91dHB1dCBm
aWxlcy4gICovDQo+ICAgICAiJXtmdXNlLWxkPSo6LWZ1c2UtbGQ9JSp9ICIgTElOS19DT01QUkVT
U19ERUJVR19TUEVDIFwNCj4gICAgICIlWCAle28qfSAle2UqfSAle059ICV7bn0gJXtyfVwNCj4g
ICAgICAle3N9ICV7dH0gJXt1Kn0gJXt6fSAle1p9ICV7IW5vc3RkbGliOiV7IXI6JXshbm9zdGFy
dGZpbGVzOiVTfX19IFwNCj4gQEAgLTE3MSw3ICsxNzEsNyBAQCBpbmRleCBiYjA3Y2MyNDRlMy4u
Y2UxNjFkM2M4NTMgMTAwNjQ0DQo+ICAgICAgJXtzdGF0aWN8bm8tcGllfHN0YXRpYy1waWU6fSAl
QHtMKn0gJShtZndyYXApICUobGlua19saWJnY2MpICIgXA0KPiAgICAgIFZUQUJMRV9WRVJJRklD
QVRJT05fU1BFQyAiICIgU0FOSVRJWkVSX0VBUkxZX1NQRUMgIiAlbyAiIiBcDQo+ICAgICAgJXtm
b3BlbmFjY3xmb3Blbm1wfCU6Z3QoJXtmdHJlZS1wYXJhbGxlbGl6ZS1sb29wcz0qOiUqfSAxKTpc
DQo+IC1AQCAtMTI1NCw4ICsxMjU2LDExIEBAIHN0YXRpYyBjb25zdCBjaGFyICpjcHBfdW5pcXVl
X29wdGlvbnMgPQ0KPiArQEAgLTEyNTcsOCArMTI1OSwxMSBAQCBzdGF0aWMgY29uc3QgY2hhciAq
Y3BwX3VuaXF1ZV9vcHRpb25zID0NCj4gIHN0YXRpYyBjb25zdCBjaGFyICpjcHBfb3B0aW9ucyA9
DQo+ICAiJShjcHBfdW5pcXVlX29wdGlvbnMpICUxICV7bSp9ICV7c3RkKiZhbnNpJnRyaWdyYXBo
c30gJXtXKiZwZWRhbnRpYyp9ICV7d31cDQo+ICAgJXtmKn0gJXtnKjoleyU6ZGVidWctbGV2ZWwt
Z3QoMCk6JXtnKn1cDQo+IEBAIC0xNzksMjcgKzE3OSwyNyBAQCBpbmRleCBiYjA3Y2MyNDRlMy4u
Y2UxNjFkM2M4NTMgMTAwNjQ0DQo+IC0gJXt1bmRlZn0gJXtzYXZlLXRlbXBzKjotZnBjaC1wcmVw
cm9jZXNzfSI7DQo+ICsgJXshZm5vLXdvcmtpbmctZGlyZWN0b3J5Oi1md29ya2luZy1kaXJlY3Rv
cnl9fX0gJXtPKn0iDQo+ICsjaWZkZWYgUE9JU09OX0JZX0RFRkFVTFQNCj4gLSsgIiAtV2Vycm9y
PXBvaXNvbi1zeXN0ZW0tZGlyZWN0b3JpZXMiDQo+ICsrICIgJXshV25vLWVycm9yPXBvaXNvbi1z
eXN0ZW0tZGlyZWN0b3JpZXM6LVdlcnJvcj1wb2lzb24tc3lzdGVtLWRpcmVjdG9yaWVzfSINCj4g
KyNlbmRpZg0KPiArICIgJXt1bmRlZn0gJXtzYXZlLXRlbXBzKjotZnBjaC1wcmVwcm9jZXNzfSI7
DQo+IA0KPiAgLyogUGFzcyAtZCogZmxhZ3MsIHBvc3NpYmx5IG1vZGlmeWluZyAtZHVtcGRpciwg
LWR1bXBiYXNlIGV0IGFsLg0KPiANCj4gLUBAIC0xMjY1LDcgKzEyNzAsMTEgQEAgc3RhdGljIGNv
bnN0IGNoYXIgKmNjMV9vcHRpb25zID0NCj4gK0BAIC0xMjg3LDcgKzEyOTIsMTEgQEAgc3RhdGlj
IGNvbnN0IGNoYXIgKmNjMV9vcHRpb25zID0NCj4gICAle2NvdmVyYWdlOi1mcHJvZmlsZS1hcmNz
IC1mdGVzdC1jb3ZlcmFnZX1cDQo+ICAgJXtmcHJvZmlsZS1hcmNzfGZwcm9maWxlLWdlbmVyYXRl
Knxjb3ZlcmFnZTpcDQo+ICAgICAleyFmcHJvZmlsZS11cGRhdGU9c2luZ2xlOlwNCj4gLSAgICAg
JXtwdGhyZWFkOi1mcHJvZmlsZS11cGRhdGU9cHJlZmVyLWF0b21pY319fSI7DQo+ICsgICAgICV7
cHRocmVhZDotZnByb2ZpbGUtdXBkYXRlPXByZWZlci1hdG9taWN9fX0iDQo+ICsjaWZkZWYgUE9J
U09OX0JZX0RFRkFVTFQNCj4gLSsgIiAtV2Vycm9yPXBvaXNvbi1zeXN0ZW0tZGlyZWN0b3JpZXMi
DQo+ICsrICIgJXshV25vLWVycm9yPXBvaXNvbi1zeXN0ZW0tZGlyZWN0b3JpZXM6LVdlcnJvcj1w
b2lzb24tc3lzdGVtLWRpcmVjdG9yaWVzfSINCj4gKyNlbmRpZg0KPiArICA7DQo+IC0NCj4gKyAN
Cj4gIHN0YXRpYyBjb25zdCBjaGFyICphc21fb3B0aW9ucyA9DQo+ICAiJXstdGFyZ2V0LWhlbHA6
JTpwcmludC1hc20taGVhZGVyKCl9ICINCj4gZGlmZiAtLWdpdCBhL2djYy9pbmNwYXRoLmNjIGIv
Z2NjL2luY3BhdGguY2MNCj4gLWluZGV4IGJkMmE5NzkzOGViLi5jODBmMTAwZjQ3NiAxMDA2NDQN
Cj4gK2luZGV4IDYyMjIwNGEzOC4uNWFjMDNjMDg2IDEwMDY0NA0KPiAtLS0gYS9nY2MvaW5jcGF0
aC5jYw0KPiArKysgYi9nY2MvaW5jcGF0aC5jYw0KPiBAQCAtMjYsNiArMjYsNyBAQA0KPiANCj4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdl
cyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTcxNzAzKTogaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8x
NzE3MDMNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
bXQvOTQzMDM0MjEvNjg3NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3du
ZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFy
bS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

