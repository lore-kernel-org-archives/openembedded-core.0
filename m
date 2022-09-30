Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30304C4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 15:16:38 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.55])
 by mx.groups.io with SMTP id smtpd.web12.130.1664550991027034509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 08:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=mGep45kq;
 spf=pass (domain: arm.com, ip: 40.107.13.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dkRS6c85L/bZzj7d4Y7pjOGj36LVIYO1P6vv26dpNRfAjxQALwLaVf2mcLrlhpCVx33qeB2UbuGvyXpdPR99zmNPaYSZGbXiUyn/FOCiEcTmcki+SANa4ZB5+y3IFIaoj9UV95yJlqlw9wlVAJGsIx/Lmjxq9eMTdldX63nOGDMzPgZNvP00bxWHw5vGIW5USMvNo0CX4d5rnfbepdVnVpnavBdpo5ZiOH0pHNNkw/tX3v+uO6aNIk9NZP05vsyN9XwvbN/aouTnjPJrE/c0WES+pTQCXwQblGwOY6XZ6eqJI9fRJveUbxn/4sSXtojm/zvw9qH17Ip80im9vbNIHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h818OTa+wPwReDpyK23qPMBI6ZwUVD+kFVjh9pqozvg=;
 b=fLvN3rVAeXkJAMquP6I0Zlco/Jna+CfvzKCmuO3I5u/qcQJizRc7wwV4TImFULuQTuL3ih/r8dyAncdMAybsZ/aJiXFIROLeIf/izG5S4MQwTw/PdUadY8FL7zy2GMzJrpAe9YabMaO9ANFJRgptN5ISgxXMrYFBB5CutoWx8YJblEvNk95beNDryGJtMDv8zFjnHOaIMEGSCn0amlDUfO1zCAJ+pIYFjvOtWYpPVv7ZB1w4hCwdWu3klD/APUcpmiMB+CfJu0U2Lif85FHrwayZXMmJgn7aBzLV2A0UphlBC+FA8UB4wbeWGy9yvnzhjhy2hWmfYbv8qsrFASkVuw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h818OTa+wPwReDpyK23qPMBI6ZwUVD+kFVjh9pqozvg=;
 b=mGep45kqQWdk0kzgyfdjAaRfZIq4Clo2NQeFw0D3m5/F9iQ4BzNXbLw6tvGpCOtVLVdVX2nzfZR05xXyQ5Zwf2hM6Og+UnEN/44BxEkUJ0nuoGyITOCqOXX9q4CzRvXI4eM6T5tMzqSrLImTThsd7yOnKl1NNQYe+4IVQPPTfD4=
Received: from AM6P191CA0055.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::32)
 by GV1PR08MB7315.eurprd08.prod.outlook.com (2603:10a6:150:1e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 15:16:21 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::1a) by AM6P191CA0055.outlook.office365.com
 (2603:10a6:209:7f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 15:16:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 15:16:21 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Fri, 30 Sep 2022 15:16:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7aec37d3313bef1b
X-CR-MTA-TID: 64aa7808
Received: from 731ab3ff005e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F7FC488-B012-4EA3-8419-E7CEFA3A1FA7.1;
	Fri, 30 Sep 2022 15:16:15 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 731ab3ff005e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Sep 2022 15:16:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdBY16FGc1R06+RC9ERYot+RPfZ2SJfVMhf4yPBq4aUdYUr+qKP2hxK+VTZtzypUH2kn1JHbUuYPkEIOq9pqV/L0wtLb9jcsx2qmHIpUwghK77YGD/WCglyHFfymJVbwWUTjzzhfXdKbCWC0vuwp+XwYK75iNNmYRqf4L7o4eh6IS8ss7nYIOSFfzpfzilY8mbxDnPSl8Erq+k1iupGXgXyJgoTov3E5Jhhgf54ihVbTmEOymytm3R9s3umjU/raicbHuJxqDQX5+82cU1HGDoUdCmMdSAhhJakvkaVOhrb+KyoqQAvYIU5+qmiLClmrmgwHw8yd8IMyXOqnN448PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h818OTa+wPwReDpyK23qPMBI6ZwUVD+kFVjh9pqozvg=;
 b=YW+UglJz5DUYeWlTMozc/DVRv5Kt2wcPRpokLpAWfP0N4dddKZOK/9W5SOQjc1vOD/UgqAmsKJjbfgzjwR1gsK4E4tnVn47HgINcIStLhM5g7E4FCP6rbzCBzK++35w3bzU47wgKBLHYSIXyL5eqH+Nz/a7SyI+Ed0cJe8ma1IymxJGxk2dfYh0Bl3UimSF1PZJG4lIvUV3vbAXsKpocabaU5hesiiFMJXGVRSmOrHKtL7lZvID3qgsbl/BEweCeAFlSaCg7vH8itPtc7owIRuSuNvaoSp4aK9AdlwogRnuV/8QhpnrwAs3mn/WUQTiTMAWI8GsscXCDRwqEFA9FxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h818OTa+wPwReDpyK23qPMBI6ZwUVD+kFVjh9pqozvg=;
 b=mGep45kqQWdk0kzgyfdjAaRfZIq4Clo2NQeFw0D3m5/F9iQ4BzNXbLw6tvGpCOtVLVdVX2nzfZR05xXyQ5Zwf2hM6Og+UnEN/44BxEkUJ0nuoGyITOCqOXX9q4CzRvXI4eM6T5tMzqSrLImTThsd7yOnKl1NNQYe+4IVQPPTfD4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5458.eurprd08.prod.outlook.com (2603:10a6:208:185::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 15:16:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 15:16:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "philippe.coval@astrolabe.coop" <philippe.coval@astrolabe.coop>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"philippe.coval.pro+openembedded-core-lists.yoctoproject.org@gmail.com"
	<philippe.coval.pro+openembedded-core-lists.yoctoproject.org@gmail.com>
Subject: Re: [OE-core] [openembedded-core][PATCHv2] graphics: Hotfix for
 eGalax Touchscreen
Thread-Topic: [OE-core] [openembedded-core][PATCHv2] graphics: Hotfix for
 eGalax Touchscreen
Thread-Index: AQHY1N6e9/VIx/fhQkSEThbGoPjr1634FWYA
Date: Fri, 30 Sep 2022 15:16:11 +0000
Message-ID: <49A68C9F-F12E-4770-B850-8971910788F0@arm.com>
References: <20220930150858.3389410-1-philippe.coval@astrolabe.coop>
In-Reply-To: <20220930150858.3389410-1-philippe.coval@astrolabe.coop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5458:EE_|AM7EUR03FT009:EE_|GV1PR08MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2373aa-2ef3-42cb-f699-08daa2f6bb56
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rmcvsyFpZWb/CYbhzIUi9IJlwuFIq5SR/2YcM5DgY4dJer2IfUxL884aos1ZgjkFT4pGgqJQdc/p7SHfFD7MXKzAwmkSdUIpNv7hlOSqaPhZBnowPtF7r2J3zdOU1fBAOvhzCZmdzQnTdT2fdAfhc0jMoMdVC0rqmW19eiRGYGl0Zp1Kp4JuwYNpAE0SWYVP2A0wIVQf7JGV84EeHpdpokLc1h41v6ArE8Zr6R2jEJ8I5xDgoOF3ts5CU8CEwltqxe2yi/NWxf8E5fsysPLSG5vMF15tNqUa5266qazq40suoFYgDARqGfFGnM6tx9dO6Ptj8jJBuIJn1VcDqzePmxixeKLxdYU/pKqj4sgNFRR3ddwjQm7g5oYL7NMiccWjaFT9nV0K18MxZO1zV3dkb5ghOKa4iNI+lKJF1H7FZUVGij7ae7y/BnZ1+bg9vh/DyMKYpGlHKL0QczKBCt3KghTCoJW0dWt1WW2bqM1YEBcCEEF8lLMwRxMhIj86a7pD1APuVfaFBwHT0wHm1kKO7XH7xDNnfW34Cig833XMM5XOL/s/kHTxuGK0klfBRzUrRp25+VyVotksKUjumCDhm/NCAjbpIO0DCCqIZJo/QSmaRU3Oc+4jWH3R+O7mVDlz3/digwwI3rMbffTROqa8EXCvhtGqC6Ka1BLzmUIg1XphT0cYPFIlH4U/xK+yt+1vyQuyEaf0JrpWj50bYZyr8tobpNb+aAOs0l9CzVLp7JV27ZU5WJfZetpnQbNZEaaH9B5+Y3oTTaGdg8x0F9tpXZTn55cezxp+G48bbrCMdeECFDkBKRQgmzuzvC3dkpU86HG6douTDfYnfXyFvMpoQg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199015)(5660300002)(66899015)(71200400001)(966005)(66946007)(66446008)(64756008)(66556008)(66476007)(6506007)(53546011)(38070700005)(33656002)(26005)(6512007)(91956017)(4326008)(76116006)(8676002)(2906002)(6916009)(41300700001)(8936002)(478600001)(122000001)(2616005)(54906003)(186003)(36756003)(6486002)(38100700002)(86362001)(83380400001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <081D8FECBDF32A4C9B7669D580CF9CE5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5458
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4ccc46c1-b6b8-4bfb-1c6f-08daa2f6b545
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hpIFXQJhzxWTN356L4qAk0oQZnL3ouYHfJgUQLZYrfzsa6HhJ3q+mz7dAChU1TgVO0rjYhg5tObTjWh7TRN8H2Uyuzn38foI6QztcYXnM4HJzDsp1pYS5ZZWqBmyObezgGoTUhFQHDPlHk4TykKKLJeDaSc0HUN5tUonOUa5Suf3G4JXwMzARNbbxv8xH4UB05/OnZvoFtHSVV8IqwWj0k6Kw2dlDRXeN3NAiazCvQo9js/n8FxCOIjJBFoassSKxEWCJA8HfMswIuZ5WeyZNCM4iUrkDdC2MtmH9wy0eFo/vUZw7gLzAdQJCYyNEPnvZvXrv0xwMF8QxEDjKUkaXzQxAQhv48NlEV/BJd7OZmATtFU691UZjRJkoxPUGv/MGeMcfetwsYa6xP+OuYbr4zymakVHHgoazudC5JbgVGN5VBii8eBgqB24Ic057VYVNR+YQ2lxNPwTDR2NGOoWpdUfArKO5NsaUUE+iNyfQeRLx2BeEtYNykJwo0ZsJM82NnjuhcQ7eceNBgW0K0aBQxfIdgNn8vd53FulrdfLTbEcjhZSFyq2LGftjB27UjsWLxSRgF4rO0/K0sGokMrIsvvdf/XFv5XHkqGYQig32KszAkiiivWwEZhLskryz8qIM4h6o/XRmYl07NnY9SWnKn+FTy7vyYfrwOh4yMXWN2dhUej+KUn7R+flfT2vEW6squOS3CGeBgZqO0CwqY52mJ+Vn6qAbI+m4dpQmZHnRxX56W0Anr7bl/ZCA8QjNHI6/aZpsLjconledHEWSU/YHDO4KZ1Q3x22XA2Zd7m6yXY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(54906003)(316002)(478600001)(966005)(40480700001)(86362001)(70206006)(70586007)(4326008)(8676002)(6486002)(40460700003)(81166007)(41300700001)(107886003)(356005)(6506007)(82310400005)(26005)(6512007)(8936002)(2906002)(6862004)(82740400003)(5660300002)(33656002)(2616005)(36860700001)(186003)(336012)(83380400001)(66899015)(36756003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 15:16:21.4414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b2373aa-2ef3-42cb-f699-08daa2f6bb56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7315
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 15:16:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171224

As discussed in the MR you filed originally with libinput, this udev rule i=
s far too broad.  If you can demonstrate that every user of this touchscree=
n has the input inverted then add a quirk to libinput, otherwise keep this =
in your own layer.

Ross

> On 30 Sep 2022, at 16:08, philippe.coval@astrolabe.coop via lists.openemb=
edded.org <philippe.coval=3Dastrolabe.coop@lists.openembedded.org> wrote:
>=20
> From: Philippe Coval <philippe.coval@astrolabe.coop>
>=20
> For unsupported screens (which X axis is inverted)
>=20
> For the record issue was observed with this CVL1010 device:
>=20
> http://www.cartft.com/en/catalog/il/1589#
>=20
> For more details check related links:
>=20
> Forwarded: https://lists.openembedded.org/g/openembedded-core/message/171=
179
> Relate-to: https://gitlab.freedesktop.org/libinput/libinput/-/issues/665
> Relate-to: https://at.projects.genivi.org/jira/si/jira.issueviews:issue-h=
tml/GDP-19/GDP-19.html
> Relate-to: https://git.ostc-eu.org/OSTC/planning/blueprints/-/issues/22
> Origin: https://git.ostc-eu.org/OSTC/OHOS/meta-ohos/-/merge_requests/288
> Signed-off-by: Philippe Coval <philippe.coval@huawei.com>
> Signed-off-by: Philippe Coval <philippe.coval@astrolabe.coop>
> ---
> .../wayland/libinput/90-usb-0eef-0001.rules                 | 1 +
> meta/recipes-graphics/wayland/libinput_1.19.4.bb            | 6 ++++++
> 2 files changed, 7 insertions(+)
> create mode 100644 meta/recipes-graphics/wayland/libinput/90-usb-0eef-000=
1.rules
>=20
> diff --git a/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rule=
s b/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules
> new file mode 100644
> index 0000000000..354629dbbb
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules
> @@ -0,0 +1 @@
> +ACTION=3D=3D"add|change", KERNEL=3D=3D"event[0-9]*", ENV{ID_VENDOR_ID}=
=3D=3D"0eef", ENV{ID_MODEL_ID}=3D=3D"0001", ENV{ID_INPUT_TOUCHSCREEN}=3D"1"=
, ENV{ID_INPUT_TABLET}=3D"0", ENV{ID_INPUT_MOUSE}=3D"0", ENV{LIBINPUT_CALIB=
RATION_MATRIX}=3D"-1 0 1 0 1 0"
> diff --git a/meta/recipes-graphics/wayland/libinput_1.19.4.bb b/meta/reci=
pes-graphics/wayland/libinput_1.19.4.bb
> index a7d0c4be69..089f41c58a 100644
> --- a/meta/recipes-graphics/wayland/libinput_1.19.4.bb
> +++ b/meta/recipes-graphics/wayland/libinput_1.19.4.bb
> @@ -15,6 +15,7 @@ DEPENDS =3D "libevdev udev mtdev libcheck"
> SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
>            file://run-ptest \
>            file://determinism.patch \
> +           file://90-usb-0eef-0001.rules \
>            "
> SRC_URI[sha256sum] =3D "ff33a570b5a936c81e6c08389a8581c2665311d026ce3d225=
c88d09c49f9b440"
>=20
> @@ -47,3 +48,8 @@ RREPLACES:${PN} =3D "libinput"
> RCONFLICTS:${PN} =3D "libinput"
>=20
> FILES:${PN}-ptest +=3D "${libexecdir}/libinput/libinput-test-suite"
> +
> +do_install:append() {
> +    install -d  "${D}/${sysconfdir}/udev/rules.d"
> +    install -m444 "${WORKDIR}/90-usb-0eef-0001.rules" "${D}/${sysconfdir=
}/udev/rules.d/"
> +}
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171222): https://lists.openembedded.org/g/openembedde=
d-core/message/171222
> Mute This Topic: https://lists.openembedded.org/mt/94018555/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


