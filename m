Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98513C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 15:02:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web11.6954.1655132516446741567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 08:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=bw6pWzj5;
 spf=pass (domain: arm.com, ip: 40.107.22.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fwXVlFknpK9JMqFBpr1mB0Q3m8pW62+Ag7flFRUHRqwn+a27QmxHWsEcIjMPsIuYAo8xzE+IILoCsbLPyBkGfdZdqassxqzw3CJdg36f/JX3M9k1LxutwZ2mTe+mOrRfB/1SLKt9pnnctatCPh53ihd2O0oDY2I+DEdU6xxf0JG9ajGuzIOMkBmz5WPMaMIaGKy8iDXcAo1fg34AtQs3UGvmL3FxNHmWAjA8+3RJkjJNV8piZETbaN/0FHttU0IkxsqrmfbRqm9jvW8EFmCa8g6rH6jvcI2RjrQ8WUnTiWSNSq5ixk0oKCbVdDrxB+1/4br3uRHxia0PmpjeyYVsSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MwCGpQ0/kDFfYOPVAyfuc4NoBCc3zv1fge/1EHH/lI=;
 b=A7ue9wRaS4QE+Q/UThklPfwvR+rRd5Qz6J6T0KixPhaUvHnE+xb6hhX47WEFqhr64fCX9st1S3ygRsyaB5SWkpcAhcJTSSmdrxm7YjIjmzWhRlLoNaPFpU6TqG3F0vO85ebaqAvS9OKcdrc6vs+/tasPqQd8HL0lYIjty8/QmZf+cGUaV3vGPUY6AuaKNMTU3D8WrmE5iLVateK1Ck8jzkzckFl5qD4oX0Eq6oIBwwDqG7s4W15bIdSa7Am1UCO+H4dwixB7dLpHJDSjjbGyc1bRviD5eYuBTyHHU6xJX7/f9qAaaExDNWwlOOC8FADK/31TtiNcaxbgpmM5h68MFA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MwCGpQ0/kDFfYOPVAyfuc4NoBCc3zv1fge/1EHH/lI=;
 b=bw6pWzj54tHj/l3NaXka19yfuwwglEyHuxlblbZxmstHhtzDZ3n83dxXT0pU6vD2RpVxBcixdOzwlEWYyrGlcERjuZccS8bceL2iAowIcWQYMpLUTDsV9oj7jfZupldumTU/1EbS1jWG7zooIDesKRfbfd1ZYUUZqIjcz1Y9BhQ=
Received: from DB6PR0202CA0043.eurprd02.prod.outlook.com (2603:10a6:4:a5::29)
 by DU2PR08MB7373.eurprd08.prod.outlook.com (2603:10a6:10:2f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 15:01:53 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::8a) by DB6PR0202CA0043.outlook.office365.com
 (2603:10a6:4:a5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20 via Frontend
 Transport; Mon, 13 Jun 2022 15:01:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Mon, 13 Jun 2022 15:01:52 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Mon, 13 Jun 2022 15:01:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: acfccbca2a378010
X-CR-MTA-TID: 64aa7808
Received: from 058db541e17f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5C0B8D79-502E-412D-B4D4-780804FD78B8.1;
	Mon, 13 Jun 2022 15:01:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 058db541e17f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Jun 2022 15:01:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hf6HK3xVAiEfMlVcT8v0nNib/qdI+LmFpZDnNcxOOBUYV5BTsqv+jEXsswrdbjwPGp17EJlBO7yNcZG/lQHGt+1zGJviy9VStR8kDwRUkJ42kw18dIzmPMpxc4wIdwHzbk28fk6ADOunp2oXAMfFx3LcmCcWY2/2YXph7U6GQu6oGSqTXVepafC3hF9+8pWGT1PPE3Q8+NaB9Rt9eXwehCcygVzmzb6zsGth8ws47zlm6b6at+pmLa18jYt5eH9e5YniUQZjJSk+xl3xn3kwgcRCs8G/jvWBVZIMbLzx+2NccSuzhveafib+EqSsm1il5CJ6IKyYukoNYzpJq3f+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MwCGpQ0/kDFfYOPVAyfuc4NoBCc3zv1fge/1EHH/lI=;
 b=cMnwUhPic0vEm+i9lf/Y1zVX1sRxBXuH7+9B7auQFjBlpTmbzW3Nwcu9GCaGmme2wagK7MnQrbz/0CpMv02KNr1DTz4aSbdNcnFD7dft7GP+cyVXRVvwmykWcGC5CARFI9QilsfG+zyMOPgHNS2Ss1ANHRN69TkGUIy8J64+C29GgoYh6mPQMvZWkxgCD4cTwgCYrcXxtWlCFikZNdOdgwLJzwzvMa7wgVisepkPW7UAGRrk/W5+KJiop43d3AVZQYhsF0/9QOqmHkooyxoEvlTkL/krTztxgTEyyPYCeGrJP062z7QSqUH1xU78SbD9V3LXfSS9hTdVtvyg7H2mOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MwCGpQ0/kDFfYOPVAyfuc4NoBCc3zv1fge/1EHH/lI=;
 b=bw6pWzj54tHj/l3NaXka19yfuwwglEyHuxlblbZxmstHhtzDZ3n83dxXT0pU6vD2RpVxBcixdOzwlEWYyrGlcERjuZccS8bceL2iAowIcWQYMpLUTDsV9oj7jfZupldumTU/1EbS1jWG7zooIDesKRfbfd1ZYUUZqIjcz1Y9BhQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7710.eurprd08.prod.outlook.com (2603:10a6:20b:511::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 15:01:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%8]) with mapi id 15.20.5332.019; Mon, 13 Jun 2022
 15:01:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Steve Sakoman <steve@sakoman.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 12 Jun
 2022 02:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 12 Jun
 2022 02:00:01 AM HST
Thread-Index: AQHYflRP08ywTRQ3J0Sl4Bfd2GrCH61NcFUA
Date: Mon, 13 Jun 2022 15:01:45 +0000
Message-ID: <AD877D76-9887-4236-80AC-F3F0BD6E4540@arm.com>
References: <20220612120224.4629B96054A@nuc.router0800d9.com>
In-Reply-To: <20220612120224.4629B96054A@nuc.router0800d9.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 08a289a1-8ffd-4d31-56d1-08da4d4da680
x-ms-traffictypediagnostic: 
	AS4PR08MB7710:EE_|DBAEUR03FT034:EE_|DU2PR08MB7373:EE_
X-Microsoft-Antispam-PRVS: 
	<DU2PR08MB7373E3BDEDC5EB24C51AB59BE8AB9@DU2PR08MB7373.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 k8XdjStEh8FYpQd18nEkRr8XfQFo7Ff19j1aVZoTXsxtrwDsF4YIfPbeNrgdRmPWblUqObyepWvYLnthhPWuR0NSxnTaDFcJb7maw4Y1wt5ftRwQfUHkLPp9lVvObklR2b01zrTil4diFMekXSJ/TuXmB1i0FN+Du2r8qbEZULMmoinM/10WaMRvn2jeyeS1Rrb8fcsXtXakv+nN+HNcBsu38RfwPJOu+Zg/MmBPwxJwqENkaKypGZlhOnm/zYuL6uV9YkBBa7EPhCjpAxEOTkJ6g9gUZ5zDzU++7KpwGkCrpxGbqEfcAdNdrq7Px3A/dukCkeHTsGWLBfiQe1vPHvM+rbUd9QwgzGc/OAKilmXn+ym6KVwrK3gJIYt95REQ4Co0YjO7YW+sUTQSXlP446elocfgoE5Z6lwBnTktxxlB+WhTYk8ybhOxQ6/5c5kfPn74VRNXsBRTd03yPOKmm5xkA3WlXJ77uG+jsRjy7bhRbVvu3dqooCSHBoYRyOIEkobs1FU5juxStQUXwwxJTmf+4Strg4vPQTEFlYhZhqLAJHdcBzBSQY154c7TiFJ1UagDjG7ff8T0tb5f50vMA6rjnuVFNF+af4ff5nnQ9q6xxNpPsSjGsA31ZTDyOfkTG4R0dB1vIagwVRZG8ujytRjO3zbQijgOLB3/OYDNa4wVQHjBv56lh73mqsPtlfplm3QOKiirpJLvAjD1d5/QD7iSq/dCSc8zw1mdVfIlD3g80LQml1zpOLfn4Lv0g9tSvrtL4bwPlRlHGwapBQIjMubV0X3uMAv5N/wUwpCa3y8DIcpWlfAdv23pcVUgTmGb
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(71200400001)(122000001)(38070700005)(966005)(6486002)(86362001)(8676002)(508600001)(64756008)(66556008)(66446008)(66476007)(4326008)(91956017)(76116006)(6916009)(26005)(6512007)(2616005)(186003)(66946007)(316002)(6506007)(54906003)(38100700002)(8936002)(5660300002)(83380400001)(33656002)(4744005)(15650500001)(36756003)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DA48E195A3744D41A092F3AB2B536351@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7710
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c20ebebf-af92-489b-6fb0-08da4d4da204
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FG3ouUoduv1PxUX7M0e9ibVrxTCbsVB8fO2VqngHS8B0z8K7/IZY7ZK/A5PjtmECbe7XNq+AhG9YqqIZpXMrSBVCTLNVF+nSM+T2Q+IuXjFR8hxLDHP96tHfmjLWPpX55vAAMUY8gg+iQo/QHFIlxNnTCGpgbIVA5sqf3bGR0BMO9NV0hlFpiBvCtj48eX0qE8Z57mxfybX1IRi7QEStnhdI/NHD5jCXAHT5bTkdAjgPhilju7gv9uFg4PS+amlO7497+TScejynky/RAgzcjBDvzh1YuE43KwpIEib/wZDbY7lepYdcETbeZFI7AIV/wtfsbxKilHjCLtnu/CPzKD2fLAv/8BQqhBGmzdl1B7z7H1Nouu5u0kNUy1Zp0LCgEkGSX7l/EG9raiyKlDGvMpMrMhKDOQ7KurD7WAjzySow7Lz5VzMA5Zu1f7KOQjECMJLz3e5Y1x/Pjs0ZqcBWTUK54pkp9aeVNbSK6nsIh2GsBN2ZFoMgn11spn/l9QH2N/KEepwvGF9UisrgzLbN/BXlH9NAz4i65smaRiMVK69xtJBNI/P3+5M0NOhHiI2EXT9OYLKlLV2XI8Rro6apT9onJUuGKI2VnX8jeJZ0IrRHH6Bt0fIK0+jHUy5Co9HXXNEVS/PNizntmA8Vf6MacW2ujP+OaUvlw7PPgmmRsH6XAQ3hs07i9kkr8o8h2c60ocVJlDG6Mum9/hfG3VRNkmTJCi/qSg/LZnZfv04e28k4fEqUuKtoVKgoLav1Hvqz
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(8936002)(82310400005)(47076005)(5660300002)(2906002)(186003)(6506007)(6862004)(36860700001)(70206006)(36756003)(81166007)(70586007)(356005)(15650500001)(33656002)(4744005)(54906003)(316002)(8676002)(86362001)(107886003)(6486002)(966005)(26005)(2616005)(40460700003)(6512007)(4326008)(83380400001)(336012)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 15:01:52.7439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 08a289a1-8ffd-4d31-56d1-08da4d4da680
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7373
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 15:02:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166866


> CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2022-26691 *

This is fixed in 2.4.2 which is already in master.

The stable branches can cherry-pick https://github.com/OpenPrinting/cups/co=
mmit/de4f8c196106033e4c372dce3e91b9d42b0b9444.

Ross
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

