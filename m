Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100AEC48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 16:28:53 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.42])
 by mx.groups.io with SMTP id smtpd.web11.45821.1707928128277637087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 08:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RuIytbGG;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RuIytbGG;
 spf=pass (domain: arm.com, ip: 40.107.14.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dTmnZcNE2Lmzhdh1EfY+pI1pw1dL9keUzmLAgBWhxxiMsMim6fcgLf+uW8O7dfUsZ175XkCM1TjG9Q8cWK/VztmmOGZ5SKuxN1PH0c+w0ctxKbimSRhGI0haFaqLzwxGTUNNZYOkP+33HRCiRLq1eYRQthw87HCQgyRr6Nqoel4W8j+SUu9kSZvO5GOvJLlmN311S5U/uL2LHVA3pchn3i0wyegv8EToaSsyIJJ4WnOBomcIWoo15QgwCD3/ADGq12qjy8GLi4Ywum4TasdBBLqLTIb9T+Iq8JRu0dawiZFcHK1izVaR3ValrCoHEJGT3NityTqK1PhwmAlq9UjUAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNc01XsV9gp9mlT+29+2ifnTzle+2Tb2CpUAjdxe/rQ=;
 b=TyHJ5bqvZxlcCsrE3PQpLPKp6xigIKZ1nKmnTwNrWziKXeLzoppPtM+dTDHupHROn40mXGvK6p1ilrrVHmYEWc0dAK3bDWRQT7GbUAU+SrpQ8tYa+/k/F2XMHzjo4/qvJTARod8A1Mof3oFSYcW8zQbbu9YRRxeDIn07wIoYfNhlXm+BJu4YNkyVIxLiBSeQJVJ39rdmSZ7CFxTGVR1UKNrm6En0DYpnCspwMl1usRnHgULjlxztKt0Fhj05NekcAegWIziW4XggjUsZaDhW6lW7gVBFB0B/bezyeUnb/G5Inqa0gLR3kZo+7enEudHNdB306UvJBLYFaA1mT6+9Lw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNc01XsV9gp9mlT+29+2ifnTzle+2Tb2CpUAjdxe/rQ=;
 b=RuIytbGG7w4p/rUwA1dRXdgGhhSW2m5ren0apq3+gIQ6MYCpOwBPoAh4EiWEl42TxxqIr/xPyxCAuY77Fh45s8o6SA6Wmpq0GSDMyihjhjnrjgnA5bLfyciCKUOrLasYNdEP36GqhkSWfJWjzLJ8oEjPMOS/bQEL0uVYTLkr2+8=
Received: from AM0PR05CA0096.eurprd05.prod.outlook.com (2603:10a6:208:136::36)
 by DB9PR08MB6570.eurprd08.prod.outlook.com (2603:10a6:10:251::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 16:28:44 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:208:136:cafe::41) by AM0PR05CA0096.outlook.office365.com
 (2603:10a6:208:136::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Wed, 14 Feb 2024 16:28:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 16:28:43 +0000
Received: ("Tessian outbound e358842a0ad8:v228"); Wed, 14 Feb 2024 16:28:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99617d58be9e461c
X-CR-MTA-TID: 64aa7808
Received: from 23330eb66f2c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FFB1469E-E0CB-48B7-8690-2E6D1F6ED164.1;
	Wed, 14 Feb 2024 16:28:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 23330eb66f2c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Feb 2024 16:28:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8reotCTYP/OV11+cIS02s6WdZjQOnQQsFLlIuOsiMGnVOr/pgFcG3+D1kqTnH5ixqS5n89bVqjArmeqY1kYx8VPnjm5KL22HC5Y+pqz+frRmxKxq2W1zWzBT0LU+oAiovC+uMVad42wkI40plaEAoyumYkIpYybDy79blhE4SJQ1tXlnXO9ejFYcNKwBKfhe/N0qYeS/ZgRLr6IAbXD6XKcpWIDotYfvmfatJi2uNzdSRYX/MrPUpgGi8WJl7b78LiuHttNJXZdTbMzqVTigqWEfOcZy+L4JnZMpP4+dZlTgITwin7C7w/UfVhB+zThB1RlfSoRpE61WDpuS0Lqbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNc01XsV9gp9mlT+29+2ifnTzle+2Tb2CpUAjdxe/rQ=;
 b=fS83an+BWGjM2bhOpPw1ZgE5rR1pKj3xpm/OW7+EQ1vMEfpZovMWOUwxdcM0SbR/iYm6P7xdGIZikIhVvOUT9IO+jyYa8DL6bDstevdN4QQdEQQzBBmUF7vA0dde2x0A+MkBercnQW7Q7bw9cqYEQt83HHsvImsFuC2xCE8/3jhxTkgnf3JrG8vK/lWMTwxTbNDQaOuB0bd7XGMPsYRPOLd3I+U7CmK44E64OKkDaDXMampgThM8elx2bV0ReevPokGBEhL26tsDPzAsjIs6PzJWKH7/rSd7Dcuva2V9gGFCZWUrqYaC51XPLYNLBzZN5IHaSu4R7RzmvPhOCTmqfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNc01XsV9gp9mlT+29+2ifnTzle+2Tb2CpUAjdxe/rQ=;
 b=RuIytbGG7w4p/rUwA1dRXdgGhhSW2m5ren0apq3+gIQ6MYCpOwBPoAh4EiWEl42TxxqIr/xPyxCAuY77Fh45s8o6SA6Wmpq0GSDMyihjhjnrjgnA5bLfyciCKUOrLasYNdEP36GqhkSWfJWjzLJ8oEjPMOS/bQEL0uVYTLkr2+8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9762.eurprd08.prod.outlook.com (2603:10a6:20b:605::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 16:28:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 16:28:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "belouargamohamed@gmail.com" <belouargamohamed@gmail.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	"f.lahoudere@technologyandstrategy.com"
	<f.lahoudere@technologyandstrategy.com>, BELOUARGA Mohamed
	<m.belouarga@technologyandstrategy.com>
Subject: Re: [OE-core] [PATCH] create-spdx-2.2: Correct the default value of
 SPDX_NAMESPACE_PREFIX
Thread-Topic: [OE-core] [PATCH] create-spdx-2.2: Correct the default value of
 SPDX_NAMESPACE_PREFIX
Thread-Index: AQHaXuXaNqDxZpSFgkaLzYLGMzYuVrEKB90A
Date: Wed, 14 Feb 2024 16:28:34 +0000
Message-ID: <FC76BB9B-9244-42A9-9779-FD70A9E9E0D7@arm.com>
References: <20240214013316.127190-1-m.belouarga@technologyandstrategy.com>
In-Reply-To: <20240214013316.127190-1-m.belouarga@technologyandstrategy.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9762:EE_|AM4PEPF00027A69:EE_|DB9PR08MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2696e8-8f77-4824-1596-08dc2d7a030f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2sPjlMYZ31mavuLxsqLjSNu2PAf11R7ihSIiNvtcI4qcjuCRWBBRoDinCj2KawTqaL3boToe47TEuQj5pmc662TpZmZeJ/eR8wh7SfjnAL5eeqnHYzcd/WY35+sSnhCKGd3znD/zf5O9ljlySeqgaw8qNb3bYHT/dBVB9WwtJ6FFFyWYkI/jCb7x3pUKDvfiU9aRC4kBSlWOjPy3ISo2L4OFQvZ0FEud6WzCKduHAbQB8WZV72gtZCh8LxDpvQVITYJCU757zithUAzFnKsnrRyEwc6UGGaboBurlx+8CI0ko0CzAjbTnQy1j0Juh6U2smqTH5tZwJLzAA/lQ4KUOtW+vLQX8Nxv78nU2gKdKqvnu0MTcUgK/NS6ZxmZGGN5Ox+8L2XyGAj6sPZnucl23sVraidQ/0qbuMv+DbMohukVskEVRgWMNS5cXnWEAsWXTDuKOhIqvviQc880PrbJjO/JjjR5hqs4y9/VJD0t+6EwbeyFaLQei+yNd06QJ+Tx8Cpo6iw6P5fJyQWqvizfWFApLQqPh6vYj/Ww/ZX4Vp3FWVOWScqDFRiWNX3nZy9EoBWlg3B2I504OLNlfgiJL1U+ckGuSF3iKFQ/FMMub6c=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(5660300002)(83380400001)(4744005)(86362001)(38100700002)(53546011)(64756008)(36756003)(26005)(6512007)(33656002)(2616005)(6506007)(71200400001)(38070700009)(478600001)(122000001)(66556008)(66446008)(54906003)(8676002)(4326008)(8936002)(66476007)(316002)(66946007)(6916009)(966005)(76116006)(41300700001)(6486002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0947938026735143815F23BFCBC552D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9762
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cb37476b-838a-4c36-4b77-08dc2d79fda7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HYIbopXvWRS/lKyX4vXZ6zi+417z/6mfop+6PKTo3nOcX+hvvnqXD9Y2qUkF0fbBCHeGCcKFnRcVgaGdfx4yLRacfwYXSUlwa2uxHFlL0AwYkiNJaDxtj64cfbx88DNj50yqwtFhTb90NKP70zCVtYZiYy512ThcQMGtr8wSwbHOESBELjLfU09FUmtH2l6pYtselOUCfm2umjsmO0VsRVl5eRojanugaoNdAiqz43821w+9dCWqmGoCcZqS5nh0FutazMDobhwk8twMgcm2w+biZ16qQir/2rXnXSrLg9AW6Co2QXuNjROSnb86Pnx+vrKt7fUNxCIeF+Puyz4sR1wbKzQK9whFTB5dXyjVCax/9skVVml1/uy53bsKVVL/nwdlfUjRfnxez+HLx7y8QdP/GcLfsMKspvUm6NqQZP6UR8J2TJ1NeqcUHM0ZmkpZ/jYkuer9wYE3oJrVWPP21sVaHRYoZhVgz26bdX8GYmxASw+8+uIgOa0x4AauIis4nZI/+QZdyNBadJyJFk8+m/XEAtVdInTFjZZWVErCD0IELX8y7IsBpas6XCV7E1RLomTp/yGVxAxrEYG33lD8cQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(40470700004)(36840700001)(46966006)(33656002)(86362001)(83380400001)(356005)(81166007)(82740400003)(36756003)(2906002)(4744005)(5660300002)(70206006)(70586007)(41300700001)(8676002)(4326008)(6862004)(8936002)(54906003)(316002)(336012)(6486002)(6512007)(478600001)(966005)(6506007)(26005)(2616005)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 16:28:43.9723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2696e8-8f77-4824-1596-08dc2d7a030f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6570
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 16:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195485

On 14 Feb 2024, at 01:33, belouargamohamed via lists.openembedded.org <belo=
uargamohamed=3Dgmail.com@lists.openembedded.org> wrote:
> This patch can also be linked to the bug: https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D15398

The usual format for this is to just put this in the message:

[ YOCTO #15398 ]

> documentation/ref-manual/variables.rst | 5 +++++
> meta/classes/create-spdx-2.2.bbclass   | 2 +-

These two files are actually in separate repositories, as poky is a generat=
ed repository built from yocto-docs + openembedded-core.

Can you split this commit into two, and send the meta/ change to openembedd=
ed-core@lists.openembedded.org <mailto:openembedded-core@lists.openembedded=
.org> and the documentation/ change to docs@lists.yoctoproject.org <mailto:=
docs@lists.yoctoproject.org>?

Thanks,
Ross


